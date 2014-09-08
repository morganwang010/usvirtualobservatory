
package edu.caltech.vao.vospace;

import java.io.File;
import java.io.FileInputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import java.util.UUID;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import edu.caltech.vao.vospace.meta.*;
import edu.caltech.vao.vospace.protocol.ProtocolHandler;
import edu.caltech.vao.vospace.storage.StorageManager;
import edu.caltech.vao.vospace.storage.StorageManagerFactory;
import edu.caltech.vao.vospace.xml.*;

public class VOSpaceManager {

    private final static String AUTO_NODE = ".auto";
    private final static String NULL_NODE = ".null";
    private final static String BASE = "file:///tmp";
    private final static boolean PRESERVE_DATA = false;
    private final static boolean OVERWRITE_DATA = true;
    private final static boolean STATUS_BUSY = true;
    private final static boolean STATUS_FREE = false;
    private final static int PROPERTIES_SPACE_ACCEPTS = 1;
    private final static int PROPERTIES_SPACE_PROVIDES = 2;
    private final static int PROPERTIES_SPACE_CONTAINS = 4;
    private final static String INHERITABLE_PROPERTY = "10";

    protected ArrayList<Views.View> SPACE_ACCEPTS_IMAGE;
    protected ArrayList<Views.View> SPACE_ACCEPTS_TABLE;
    protected ArrayList<Views.View> SPACE_ACCEPTS_ARCHIVE;
    protected ArrayList<Views.View> SPACE_PROVIDES_IMAGE;
    protected ArrayList<Views.View> SPACE_PROVIDES_TABLE;
    protected ArrayList<Views.View> SPACE_PROVIDES_ARCHIVE;
    protected ArrayList<Capabilities.Capability> SPACE_CAPABILITIES;

    protected ArrayList<Protocol> SPACE_CLIENT_PROTOCOLS;
    protected ArrayList<Protocol> SPACE_SERVER_PROTOCOLS;
    protected HashMap<String, ProtocolHandler> PROTOCOLS;

    private String STAGING_LOCATION;
    private Pattern VOS_PATTERN;
    private String SPACE_AUTH;
    private MetaStore store;
    private StorageManager backend;
    protected final String BASEURI;
    private String USER;
    boolean structure = false;
    private NodeFactory nfactory;

    private static VOSpaceManager ref;

    /* VOSpaceNodeManager
     */
    public static VOSpaceManager getInstance(String propFile) throws VOSpaceException{
	if (ref == null) ref = new VOSpaceManager(propFile);
	return ref;
    }

    public static VOSpaceManager getInstance() throws VOSpaceException {
	if (ref == null) throw new VOSpaceException(VOSpaceException.INTERNAL_SERVER_ERROR, "VOSpaceManager could not be initialized.");
	return ref;
    }

    private VOSpaceManager(String propFile) throws VOSpaceException {
        try {
            // Get property file
            Properties props = new Properties();
            props.load(new FileInputStream(propFile));
            // Set space properties
	    BASEURI = props.containsKey("space.baseuri") ? props.getProperty("space.baseuri") : BASE; 
	    STAGING_LOCATION = props.containsKey("space.staging_area") ? props.getProperty("space.staging_area") : BASE;
            structure = Boolean.parseBoolean(props.getProperty("space.supports.structure"));

	    SPACE_ACCEPTS_IMAGE = getViewList(props.getProperty("space.accepts.image"));
            SPACE_ACCEPTS_TABLE = getViewList(props.getProperty("space.accepts.table"));
            SPACE_ACCEPTS_ARCHIVE = getViewList(props.getProperty("space.accepts.archive"));
            SPACE_PROVIDES_IMAGE = getViewList(props.getProperty("space.provides.image"));
            SPACE_PROVIDES_TABLE = getViewList(props.getProperty("space.provides.table"));
            SPACE_PROVIDES_ARCHIVE = getViewList(props.getProperty("space.provides.archive"));
	    SPACE_CAPABILITIES = getCapabilityList(props.getProperty("space.capabilities"));
            SPACE_AUTH = props.containsKey("space.identifier") ? getId(props.getProperty("space.identifier")) : "vos://nvo.caltech!vospace";
	    registerProtocols(props);
            // Set metadata store
	    MetaStoreFactory factory = MetaStoreFactory.getInstance(propFile);
	    String storeType = props.getProperty("store.type");
            store = factory.getMetaStore("store.type." + storeType);
	    // Set backend storage
	    StorageManagerFactory smf = StorageManagerFactory.getInstance(propFile);
	    String backendType = props.getProperty("backend.type");
	    backend = smf.getStorageManager("backend.type." + backendType);
	    // Placeholder to authenticate to the backend storage
	    // backend.authenticate(...)
	    // Get known properties
	    for (Props.Property prop : Props.Property.values()) {
		checkProperty(Props.get(prop));
	    }
	    // Identifier regex
	    VOS_PATTERN = Pattern.compile("vos://[\\w\\d][\\w\\d\\-_\\.!~\\*'\\(\\)\\+=]{2,}(![\\w\\d\\-_\\.!~\\*'\\(\\)\\+=]+(/[\\w\\d\\-_\\.!~\\*'\\(\\)\\+=]+)*)+");
	    nfactory = NodeFactory.getInstance();
        } catch (Exception e) {
            throw new VOSpaceException(VOSpaceException.INTERNAL_SERVER_ERROR, e);
        }
    }

    /** 
     * Create the specified node
     * @param node The node to be created
     * @return The created node
     */
    public Node create(Node node, boolean overwrite) throws VOSpaceException {
	String uri = node.getUri();
	// Is identifier syntactically valid?
	if (!validId(uri)) throw new VOSpaceException(VOSpaceException.BAD_REQUEST, "The requested URI is invalid."); 
	// Is the parent a valid container?
	if (!validParent(uri)) throw new VOSpaceException(VOSpaceException.BAD_REQUEST, "The requested URI is invalid - bad parent."); 
	try {
	    // Does node already exist?
	    boolean exists = store.isStored(uri);
	    if (exists && !overwrite) throw new VOSpaceException(VOSpaceException.CONFLICT, "A Node already exists with the requested URI."); 
	    NodeType type = NodeType.NODE;
	    // Is a service-generated name required?
	    if (uri.endsWith(AUTO_NODE)) {
		node.setUri(uri.substring(0, uri.length() - AUTO_NODE.length()) + UUID.randomUUID().toString());
		uri = node.getUri();
	    }
	    // Clear any <accepts>, <provides> and <capabilities> that the user might specify
	    if (node instanceof DataNode) {
		type = NodeType.DATA_NODE;
		DataNode datanode = (DataNode) node;
		datanode.removeAccepts();
		datanode.removeProvides();
		datanode.removeCapabilities();
		// Set <accepts> for UnstructuredDataNode
		if (node instanceof UnstructuredDataNode) {
		    type = NodeType.UNSTRUCTURED_DATA_NODE;
		    datanode.addAccepts(Views.get(Views.View.ANY));
		}
		// Set <accepts> for StructuredDataNode
		if (node instanceof StructuredDataNode) {
		    type = NodeType.STRUCTURED_DATA_NODE;
		    for (Views.View view: SPACE_ACCEPTS_IMAGE) {
			datanode.addAccepts(Views.get(view));
		    }
		    for (Views.View view: SPACE_ACCEPTS_TABLE) {
			datanode.addAccepts(Views.get(view));
		    }
		    for (Views.View view: SPACE_PROVIDES_IMAGE) {
			datanode.addProvides(Views.get(view));
		    }
		    for (Views.View view: SPACE_PROVIDES_TABLE) {
			datanode.addProvides(Views.get(view));
		    }
		}
		// Set <accepts> for ContainerNode
		if (node instanceof ContainerNode) {
		    type = NodeType.CONTAINER_NODE;
		    for (Views.View view: SPACE_ACCEPTS_ARCHIVE) {
			datanode.addAccepts(Views.get(view));
		    }
		    for (Views.View view: SPACE_PROVIDES_ARCHIVE) {
			datanode.addProvides(Views.get(view));
		    }
		}
		// Set capabilities
		if (SPACE_CAPABILITIES.size() > 0) {
		    for (Capabilities.Capability cap: SPACE_CAPABILITIES) {
			datanode.addCapabilities(Capabilities.get(cap));
		    }
		}
	    }
	    // Link node
	    if (node instanceof LinkNode) type = NodeType.LINK_NODE;
	    // Check properties
	    if (node.hasProperties()) {
		for (String propUri: node.getProperties().keySet()) {
		    checkProperty(propUri);
		}
	    }
	    // Store node
	    if (exists) {
		store.updateData(uri, node.toString());
	    } else {
		store.storeData(uri, type.ordinal(), USER, getLocation(uri), node.toString());
	    }
	    if (type.equals(NodeType.CONTAINER_NODE)) {
		// boolean success = (new File(new URI(getLocation(node.getUri())))).mkdir();
		backend.createContainer(getLocation(node.getUri()));
	    }
	} catch (SQLException e) {
	    throw new VOSpaceException(VOSpaceException.INTERNAL_SERVER_ERROR, e);
	    //	} catch (URISyntaxException e) {
	    //	    throw new VOSpaceException(VOSpaceException.INTERNAL_SERVER_ERROR, e);
	}
	return node;
    }

    /**
     * Retrieve the specified node
     * @param identifier The identifier of the node to retrieve
     * @param detail The level of detail to apply to the node representation
     * @return the retrieved node
     */
    public Node getNode(String identifier, String detail) throws VOSpaceException {
	// Is identifier syntactically valid?
	if (!validId(identifier)) throw new VOSpaceException(VOSpaceException.BAD_REQUEST, "The requested URI is invalid."); 
	// Retrieve original node
	try {
	    ResultSet result = store.getData(new String[] {identifier}, null, 0);
	    if (result.next()) {
		Node node = nfactory.getNode(result.getString(1));
		detail = (detail == null) ? "max" : detail;
		if (!detail.equals("max")) {
		    if (node instanceof DataNode) {
			DataNode datanode = (DataNode) node;
			datanode.removeAccepts();
			datanode.removeProvides();
			datanode.removeBusy();
		    }
		    node.removeCapabilities();
		    if (detail.equals("min")) {
			node.removeProperties();
		    }
		} else {
		    if (node instanceof ContainerNode) {
			ContainerNode container = (ContainerNode) node;
			for (String child: store.getChildren(identifier)) {
			    container.addNode(child);
			}
		    }
		}
		return node;
	    } else {
		throw new VOSpaceException(VOSpaceException.NOT_FOUND, "A Node does not exist with the requested URI.");
	    }   
	} catch (SQLException e) {
	    throw new VOSpaceException(VOSpaceException.INTERNAL_SERVER_ERROR, e);
	}
    }
     
    /** 
     * Delete the specified node
     * @param nodeid The identifier of the node to be deleted
     */
    public void delete(String identifier) throws VOSpaceException {
	// Is identifier syntactically valid?
	if (!validId(identifier)) throw new VOSpaceException(VOSpaceException.BAD_REQUEST, "The requested URI is invalid."); 
	try {
	    // Does node already exist?
	    boolean exists = store.isStored(identifier);
	    if (!exists) throw new VOSpaceException(VOSpaceException.NOT_FOUND, "A Node does not exist with the requested URI."); 
	    // Remove node
	    //	    removeBytes(getLocation(identifier));
	    store.removeData(identifier);
	} catch (SQLException e) {
	    throw new VOSpaceException(VOSpaceException.INTERNAL_SERVER_ERROR, e);
	}
    }


    /**
     * Convert IVO identifier into VOSpace identifier
     * @param ivoid The IVO identifier to convert
     * @return The converted VOSpace identifier
     */
    private String getId(String ivoid) {
        return ivoid.replace("/", "!").replace("ivo:!!", "vos://");
    }

    /**
     * Check whether the specified identifier is valid
     * @param id The identifier to check
     * @return whether the identifier is valid or not
     */
    private boolean validId(String id) {
	Matcher m = VOS_PATTERN.matcher(id);
	return m.matches();
    }

    /**
     * Check whether the parent node of the specified identifier is valid:
     *   - it exists
     *   - it is a container
     * @param id The identifier to check
     * @return whether the parent node is valid or not
     */
    private boolean validParent(String id) throws VOSpaceException {
	try {
	    String parent = id.substring(0, id.lastIndexOf("/"));
	    if (store.getType(parent) != NodeType.CONTAINER_NODE.ordinal()) return false;
	    return true;
	} catch (SQLException e) {
	    throw new VOSpaceException(VOSpaceException.INTERNAL_SERVER_ERROR, e.getMessage());
	}
    }

    /**
     * Generate a list of supported Views from the CSV list of args
     * @param args The CSV list of args
     * @return the corresponding list of views
     */
    private ArrayList<Views.View> getViewList(String args) {
	ArrayList<Views.View> list = new ArrayList<Views.View>();
	if (args != null) {
	    String[] types = args.split(",");
	    for (String type: types) {
		list.add(Views.fromString(type));
	    }
	}
	return list;
    }

    /**
     * Generate a list of supported Capabilities from the CSV list of args
     * @param args The CSV list of args
     * @return the corresponding list of capabilities
     */
    private ArrayList<Capabilities.Capability> getCapabilityList(String args) {
	ArrayList<Capabilities.Capability> list = new ArrayList<Capabilities.Capability>();
	if (args != null) {
	    String[] types = args.split(",");
	    for (String type: types) {
		list.add(Capabilities.fromString(type));
	    }
	}
	return list;
    }

    /**
     * Check whether the specified property is in the list of known properties:
     * if not, add it
     * @param uri The identifier of the property to check
     */
    private void checkProperty(String uri) throws SQLException {
	if (!store.isKnownProperty(uri))
	    store.registerProperty(uri, PROPERTIES_SPACE_CONTAINS, false);
    }

    /**
     * Get a location for an object
     * @param identifier The identifier of the object
     * @return the corresponding physical location of the object
     */
    private String getLocation(String identifier) {
	String name = identifier.substring(identifier.lastIndexOf("!"));
        String dataname = name.substring(name.indexOf("/") + 1);
        return BASEURI + "/" + dataname; 
    }

    /**
     * Resolve the specified location for a file
     * @param identifier The logical identifier for the file
     * @return location The physical location for the file
     */
    protected String resolveLocation(String identifier) throws VOSpaceException {
	String target = null;
	try {
	    ResultSet result = store.getTransfer(identifier);
	    if (result.next()) {
		if (result.getDate(2) == null) {
		    XMLObject xml = new XMLObject(result.getString(1).getBytes());
		    target = xml.xpath("/uws:job/uws:jobInfo/vos:transfer/vos:target")[0];
		    /*
		    StringReader in = new StringReader(result.getString(1));
		    XMLInputFactory xif = XMLInputFactory.newInstance();
		    XMLStreamReader2 xsr = (XMLStreamReader2) xif.createXMLStreamReader(in);
		    xsr.nextTag(); // Advance to first element - <vos:transfer>
		    while (xsr.hasNext()) { // Cycle through elements
			int eventType = xsr.next();
			if (eventType == XMLEvent.START_ELEMENT) {
			    String name = xsr.getLocalName();
			    if (name == "target") {
				target = xsr.getElementText();
				break;
			    }
			}
		    } 
		    */
		} else {
		    throw new VOSpaceException(VOSpaceException.INTERNAL_SERVER_ERROR, "The specified URL is no longer valid.");
		}
		String location = store.getLocation(target);
		return location;
	    } else {
		throw new VOSpaceException(VOSpaceException.NOT_FOUND, "The specified file cannot be found.");
	    }
	} catch (Exception e) {
	    throw new VOSpaceException(VOSpaceException.INTERNAL_SERVER_ERROR, e);
	}
    }

    /**
     * Mark the location as having been used
     * @param endpoint The location to be marked as used
     */
    protected void invalidateLocation(String endpoint) throws VOSpaceException {
	try {
	    store.completeTransfer(endpoint);
	} catch (Exception e) {
	    throw new VOSpaceException(VOSpaceException.INTERNAL_SERVER_ERROR, e);
	}
    }

    /**
     * Delete the bytes from the specified location
     * @param location The location of the bytes to be removed
     * @return whether the bytes have been successfully removed or not
     */
    public void removeBytes(String location) throws VOSpaceException {
	// success = (new File(new URI(location))).delete();
	backend.removeBytes(location);
    }

    /**
     * Register a set of protocols
     * @param props The property file containing details of the protocols and their handlers
     */
    private void registerProtocols(Properties props) throws VOSpaceException {
        try {
	    PROTOCOLS = new HashMap<String, ProtocolHandler>();
            // Server protocols
            String[] serverProtocols = props.getProperty("space.protocol.server").split(",");
            SPACE_SERVER_PROTOCOLS = new ArrayList<Protocol>();
            for (String protocol : serverProtocols) {
		String protocolAcronym = protocol.trim().substring(0, protocol.trim().indexOf("-"));
	        String baseurl = props.getProperty("server." + protocolAcronym + ".url");
	        String protocolClass = props.getProperty("space.protocol.handler." + protocol.trim());
                ProtocolHandler protocolHandler = (ProtocolHandler) Class.forName(protocolClass).newInstance();
		protocolHandler.setBaseUrl(baseurl);
                PROTOCOLS.put(protocolHandler.getUri(), protocolHandler);
		Protocol pType = new Protocol();
                pType.setURI(protocolHandler.getUri());
		SPACE_SERVER_PROTOCOLS.add(pType);
            }
            // Client protocols
            String[] clientProtocols = props.getProperty("space.protocol.client").split(",");
            SPACE_CLIENT_PROTOCOLS = new ArrayList<Protocol>();
            for (String protocol : clientProtocols) {
		String protocolAcronym = protocol.trim().substring(0, protocol.trim().indexOf("-"));
	        String baseurl = props.getProperty("server." + protocolAcronym + ".url");
                String protocolClass = props.getProperty("space.protocol.handler." + protocol.trim());
                ProtocolHandler protocolHandler = (ProtocolHandler) Class.forName(protocolClass).newInstance();
                // The protocol handlers make no distinction between client and
                // server roles so need to set base URL even though client use
                protocolHandler.setBaseUrl(baseurl);
                PROTOCOLS.put(protocolHandler.getUri(), protocolHandler);
		Protocol pType = new Protocol();
                pType.setURI(protocolHandler.getUri());
		SPACE_CLIENT_PROTOCOLS.add(pType);
            }
        } catch (Exception e) {
	    e.printStackTrace(System.err);
	    throw new VOSpaceException(VOSpaceException.INTERNAL_SERVER_ERROR, e);
	}
    } 

    protected StorageManager getStorageManager() {
	return backend;
    }
}