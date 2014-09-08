"""
A module for basic VO Registry interactions.  

A VO registry is a database of VO resources--data collections and
services--that are available for VO applications.  Typically, it is 
aware of the resources from all over the world.  A registry can find 
relevent data collections and services through search
queries--typically, subject-based.  The registry responds with a list
of records describing matching resources.  With a record in hand, the 
application can use the information in the record to access the 
resource directly.  Most often, the resource is a data service that
can be queried for individual datasets of interest.  

This module provides basic, low-level access to the VAO Registry at 
STScI using (proprietary) VOTable-based services.  In most cases,
the Registry task, with its higher-level features (e.g. result caching
and resource aliases), can be a more convenient interface.  The more  
basic interface provided here allows developers to code their own 
interaction models.  
"""

#from .. import dalquery
import dalquery

def regsearch(keywords=None, servicetype=None, 
              waveband=None, sqlpred=None):
    """
    Execute a simple query to the VAO registry.  

    :param keywords:    a string giving a single term or a python list 
                        of terms to match to registry records.  
    :param servicetype: the service type to restrict results to; 
                        allowed values include 'catalog' (synonyms: 
                        'scs', 'conesearch'), 'image' (synonym: 'sia'), 
                        'spectrum' (synonym: 'ssa'). 'service' (a generic
                        service). 'table' (synonyms: 'tap', 'database').
    :param waveband:    the name of a desired waveband; resources returned 
                        will be restricted to those that indicate as having
                        data in that waveband.
    :param sqlpred:     an SQL WHERE predicate (without the leading "WHERE") 
                        that further contrains the search against supported 
                        keywords.

    The result will be a RegistryResults instance.  
    """
    reg = RegistryService()
    return reg.search(keywords, servicetype, waveband, sqlpred)


class RegistryService(dalquery.DALService):
    """
    A class for submitting searches to the VAO registry.  
    """

    STSCI_REGISTRY_BASEURL = "http://vao.stsci.edu/directory/NVORegInt.asmx/"

    def __init__(self, baseurl=None, resmeta=None, version="1.0"):
        """
        Connect to an STScI registry at the given URL.

        :param baseurl:  the base URL for submitting search queries to the 
                         service.  If None, it will default to the STScI 
                         public registry
        :param resmeta:  an optional dictionary of properties about the 
                         service
        """
        if not baseurl:  baseurl = self.STSCI_REGISTRY_BASEURL
        if not baseurl.endswith("/"): baseurl += "/"

        dalquery.DALService.__init__(self, baseurl, "vaoreg", version, resmeta)


    def search(self, keywords=None, servicetype=None, 
               waveband=None, sqlpred=None):
        """
        Execute a simple registry search of the specified keywords. 

        :param keywords:    a string giving a single term or a python list 
                            of terms to match to registry records.  
        :param servicetype: the service type to restrict results to; 
                            allowed values include 'catalog' (synonyms: 
                            'scs', 'conesearch'), 'image' (synonym: 'sia'), 
                            'spectrum' (synonym: 'ssa'). 'service' (a generic
                            service). 'table' (synonyms: 'tap', 'database').
        :param waveband:    the name of a desired waveband; resources returned 
                            will be restricted to those that indicate as having
                            data in that waveband.
        :param sqlpred:     an SQL WHERE predicate (without the leading "WHERE")
                            that further contrains the search against supported 
                            keywords.

        The result will be a RegistryResults instance.  
        """
        srch = self.create_query(keywords, servicetype, waveband, sqlpred)
        return srch.execute()
        
    
    def resolve(self, ivoid):
        """
        Resolve the identifier against the registry, returning a
        resource record.  

        :param ivoid:   the IVOA Identifier of the resource
        """
        srch = self.create_query()
        srch.addpredicate("identifier='%s'" % ivoid)
        res = srch.execute()
        return res.getrecord(0)

    def create_query(self, keywords=None, servicetype=None, 
                     waveband=None, sqlpred=None):
        """
        Create a RegistryQuery object that can be refined or saved
        before submitting.  

        :param keywords:     a string giving a single term or a python list 
                             of terms to match to registry records.  
        :param servicetype:  the service type to restrict results to; 
                             allowed values include 'catalog' (synonyms: 
                             'table', 'scs', 'conesearch', 'ConeSearch'), 
                             'image' (synonym: 'sia', 'SimpleImageAccess'), 
                             'spectrum' (synonym: 'ssa', 'ssap', 
                             'SimpleSpectralAccess'). 
                             'database' (synonyms: 'tap','TableAccess').
        :param waveband:     the name of a desired waveband; resources returned 
                             will be restricted to those that indicate as having
                             data in that waveband.
        :param sqlpred:      an SQL WHERE predicate (without the leading "WHERE") 
                             that further contrains the search against supported 
                             keywords.
        """
        srch = RegistryQuery(self._baseurl)
        if sqlpred:
            srch.addpredicate(sqlpred)
        if waveband:
            srch.waveband = waveband
        if servicetype:
            srch.servicetype = servicetype
        if keywords:
            srch.addkeywords(keywords)
        return srch


class RegistryQuery(dalquery.DALQuery):
    """
    A representation of a registry query that can be built up over
    successive method calls and then executed.  An instance is normally
    obtained via a call to RegistrySearch.create_query()
    """
    
    _SERVICE_NAME = "VOTCapBandPredOpt"
    _RESULTSET_TYPE_ARG = "VOTStyleOption=2"

    def __init__(self, orKeywords=True, baseurl=None, version="1.0"):
        """
        create the query instance

        :param orKeywords:  if True, keyword constraints will by default be 
                            OR-ed together; that is, a resource that matches 
                            any of the keywords will be returned.  If FALSE,
                            the keywords will be AND-ed, thus requiring a 
                            resource to match all the keywords.  
        :param baseurl:     the base URL for the VAO registry.  If None, it will
                            be set to the public VAO registry at STScI.  
        """
        if not baseurl:  baseurl = RegistryService._STSCI_REGISTRY_BASEURL
        dalquery.DALQuery.__init__(self, baseurl, "vaoreg", version)
        self._kw = []          # list of individual keyword phrases
        self._preds = []       # list of SQL predicates
        self._svctype = None
        self._band = None
        self._orKw = orKeywords
        self._doSort = True
        self._dalonly = False

    @property
    def keywords(self):
        """
        Return the current set of keyword constraints.

        To update, use addkeywords(), removekeywords(), or clearkeywords().
        """
        return list(self._kw)

    def addkeywords(self, keywords):
        """
        Add keywords that should be added to this query.  Keywords 
        are searched against key fields in the registry record.  A
        keyword can in fact be a phrase--a sequence of words; in this
        case the sequence of words must appear verbatim in the record
        for that record to be matched. 

        :param keywords:  either a single keyword phrase (as a string) 
                          or a list of keyword phrases to add to the 
                          query.  
        """
        if isinstance(keywords, str):
            keywords = [keywords]
        self._kw.extend(keywords)

    def removekeywords(self, keywords):
        """
        Remove the given keyword or keywords from the query.  A
        keyword can in fact be a phrase--a sequence of words; in this
        case, the phrase will be remove.  

        :param keywords:  either a single keyword phrase (as a string) 
                          or a list of keyword phrases to remove from
                          the query.  
        """
        if isinstance(keywords, str):
            keywords = [keywords]
        for kw in keywords:
            self._kw.remove(kw)

    def clearkeywords(self):
        """
        Remove all keywords that have been added to this query.
        """
        self._kw = []

    def or_keywords(self, ored):
        """
        Set whether keywords are OR-ed or AND-ed together.  When
        the keywords are OR-ed, returned records will match at 
        least one of the keywords.  When they are AND-ed, the 
        records will match all of the keywords provided.  

        :param ored:   true, if the keywords should be OR-ed; false,
                       if they should be AND-ed.
        """
        self._orKw = ored

    def will_or_keywords(self):
        """
        Set true if the keywords will be OR-ed or AND-ed together
        in the query.  True is returned if the keywords will be 
        OR-ed.  
        """
        return self._orKw

    @property
    def servicetype(self):
        """
        The type of service that query results will be restricted to.
        """
        return self._svctype
    @servicetype.setter
    def servicetype(self, val):
        # validate and canonicalize the value
        self._svctype = val
    @servicetype.deleter
    def servicetype(self):
        self._svctype = None

    @property
    def waveband(self):
        """
        The waveband to restrict the query by.  The query results will 
        include only those resourse that indicate they have data from this 
        waveband.  Allowed values include:
        """
        return self._band
    @waveband.setter
    def waveband(self, band):
        # validate and canonicalize the value
        self._band = _band
    @waveband.deleter
    def waveband(self):
        self._band = None

    @property
    def predicates(self):
        """
        The (read-only) list of predicate constraints that will 
        be applied to the query.  These will be AND-ed with all other 
        constraints (including previously added predicates); that is, 
        this constraint must be satisfied in addition to the other 
        constraints to match a particular resource record.  

        To update, use addpredicate(), removepredicate(), or clearpredicate().
        """
        return list(self._preds)

    def addpredicate(self, pred):
        """
        Add an SQL search predicate to the query.  This predicate should
        be of form supported by STScI VOTable search services.  This 
        predicate will be AND-ed with all other constraints (including
        previously added predicates); that is, this constraint must be
        satisfied in addition to the other constraints to match a 
        particular resource record.
        """
        self._preds.append(pred)

    def removepredicate(self, pred):
        """
        Remove the give predicate from the current set of predicate
        constraints.  
        """
        self._preds.remove(pred)

    def clearpredicates(self):
        """
        Remove all previously added predicates.
        """
        self._preds = []


class RegistryResults(dalquery.DALResults):
    """
    An iterable set of results from a registry query.  Each record is
    returned as SimpleResource instance.
    """

    # Note that certain columns are formatted as an array of strings,
    # using a # as a delimiter.  These should be converted to python 
    # strings.  
    _strarraycols = ["waveband", "subject", "type", "contentLevel"]

    def __init__(self, url=None, version="1.0"):
        """
        Initialize the results.  This constructor is not typically called 
        by directly applications; rather an instance is obtained from calling 
        a SIAQuery's execute().
        """
        dalquery.DALResults.__init__(self, url, "vaoreg", version)



class SimpleResource(dalquery.Record):
    """
    A dictionary for the resource attributes returned by a registry query.
    A SimpleResource is a dictionary, so in general, all attributes can 
    be accessed by name via the [] operator, and the attribute names can 
    by returned via the keys() function.  For convenience, it also stores 
    key values as public python attributes; these include:

       | **title** -- the title of the resource
       | **shortname** -- the resource's short name
       | **ivoid** -- the IVOA identifier for the resource
       | **accessurl** -- when the resource is a service, the service's 
         access URL.
    """

    def __init__(self, results, index):
        dalquery.Record.__init__(self, results, index)

    @property
    def title(self):
        """
        The title of the resource.
        """
        return self.get("title")

    @property
    def shortname(self):
        """
        The short name for the resource.
        """
        return self.get("shortName")

    @property
    def tags(self):
        """
        A user-friendly label for the resource.
        """
        return self.get("tags")

    @property
    def ivoid(self):
        """
        The IVOA identifier for the resource.  In this interface, this 
        ID may be appended by a #-delimited suffix to point to a particular 
        capability.
        """
        return self.get("identifier")

    @property
    def publisher(self):
        """
        The name of the organization responsible for providing this resource.
        """
        return self.get("publisher")

    @property
    def waveband(self):
        """
        A list of names of the wavebands that the resource provides data for
        """
        return self.get("waveband")

    @property
    def subject(self):
        """
        A list of the subject keywords that describe this resource
        """
        return self.get("subject")

    @property
    def type(self):
        """
        A list of the resource types that characterize this resource.
        """
        return self.get("type")

    @property
    def contentlevel(self):
        """
        A list of content level labels that describe the intended audience 
        for this resource.
        """
        return self.get("contentLevel")

    @property
    def capability(self):
        """
        The name of the IVOA service capability.  This will typically set to
        the value of the capability/@xsi:type attribute in the VOResource 
        record (without the namespace prefix).
        """
        return self.get("capabilityClass")

    @property
    def standardid(self):
        """
        The IVOA identifier of the standard that this resource capability 
        supports.  
        """
        return self.get("capabilityStandardID")

    @property 
    def accessurl(self):
        """
        The URL that can be used to access the service resource.  If the 
        resource is not a service, this will typically be blank.  
        """
        return self.get("accessURL")

    def to_service(self):
        """
        return an appropriate DALService subclass for this resource that 
        can be used to search the resource.  Return None if the resource is 
        not a recognized DAL service.  
        """
        pass

    def search(self, *args, **keys):
        """
        assuming this resource refers to a searchable service, execute a 
        search against the resource.  This is equivalent to::

           self.to_service().search(*args, **keys)

        The arguments provided should be appropriate for the service that 
        the DAL service type would expect.  

        :raises RuntimeError:   if the resource does not describe a searchable
                                service.
        """
        service = self.to_service()
        if not service:
            raise RuntimeError("resource, %s, is not a searchable service" % self.shortname)

        return service.search(*args, **keys)
