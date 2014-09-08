<%@ Page language="c#" %>
<%@ Import Namespace="System.Web" %>
<%
	string Title = "STScI/JHU VO Registry Help Page";
	string author ="Gretchen Greene";
	string email ="greene@stsci.edu";
	string cvsRevision = "$Revision: 1.1 $";
	string cvsTag = "$Name:  $";
	
	string path = "";

	string bgcolor = "#FF0000";
	string displayTitle = "pubpage";
	string selected = "home";
	
	string Parameters = "message="	+	Title	+	"&"	+	"author="	+	author	+
		"&"	+	"email="	+	email	+	"&"	+	"cvsRevision=" + cvsRevision.Replace(":"," ")  +
		"&path=" + path + "&selected=" + selected +
		"&bgcolor=" + bgcolor + "&displayTitle=" +displayTitle;				


Server.Execute("web/SkyHeader.aspx" + "?" + Parameters);
//Server.Execute("../top.aspx" + "?" + Parameters);
%>

<!-- Note byJordan Raddick 21-Dec-05
     There used to be on-page style definitions of <a> tags below. The definitions were:
	   a:link, span.MsoHyperlink {color:blue; text-decoration:underline;}
	   a:visited, span.MsoHyperlinkFollowed {color:purple; text-decoration:underline;}
     I took them out when we switched the registry to the new style sheet.
     Everything still seems to be working OK.
-->

<style> <!-- /* Font Definitions */ @font-face {font-family:Courier; panose-1:2 7 4 9 2 2 5 2 4 4;}
	@font-face {font-family:Wingdings; panose-1:5 0 0 0 0 0 0 0 0 0;}
	@font-face {font-family:"MS Mincho"; panose-1:2 2 6 9 4 2 5 8 3 4;}
	@font-face {font-family:"Arial Unicode MS"; panose-1:2 11 6 4 2 2 2 2 2 4;}
	@font-face {font-family:"\@MS Mincho"; panose-1:2 2 6 9 4 2 5 8 3 4;}
	@font-face {font-family:"\@Arial Unicode MS"; panose-1:2 11 6 4 2 2 2 2 2 4;}
	/* Style Definitions */ p.MsoNormal, li.MsoNormal, div.MsoNormal {margin:0cm; margin-bottom:.0001pt; font-size:12.0pt; font-family:"Times New Roman";}
	h1 {margin-top:0cm; margin-right:0cm; margin-bottom:0cm; margin-left:21.6pt; margin-bottom:.0001pt; text-indent:-21.6pt; page-break-after:avoid; font-size:16.0pt; font-family:Arial; color:#005A9C; font-weight:bold;}
	h2 {margin-top:0cm; margin-right:0cm; margin-bottom:0cm; margin-left:28.8pt; margin-bottom:.0001pt; text-indent:-28.8pt; page-break-after:avoid; font-size:14.0pt; font-family:Arial; color:#005A9C; font-weight:bold;}
	h3 {margin-top:0cm; margin-right:0cm; margin-bottom:0cm; margin-left:36.0pt; margin-bottom:.0001pt; text-indent:-36.0pt; page-break-after:avoid; font-size:10.0pt; font-family:"Times New Roman"; font-weight:normal; font-style:italic;}
	h4 {margin-top:0cm; margin-right:0cm; margin-bottom:0cm; margin-left:43.2pt; margin-bottom:.0001pt; text-align:center; text-indent:-43.2pt; page-break-after:avoid; font-size:11.0pt; font-family:"Times New Roman"; font-weight:bold;}
	h5 {margin-top:12.0pt; margin-right:0cm; margin-bottom:3.0pt; margin-left:50.4pt; text-indent:-50.4pt; font-size:13.0pt; font-family:"Times New Roman"; font-weight:bold; font-style:italic;}
	h6 {margin-top:12.0pt; margin-right:0cm; margin-bottom:3.0pt; margin-left:57.6pt; text-indent:-57.6pt; font-size:11.0pt; font-family:"Times New Roman"; font-weight:bold;}
	p.MsoHeading7, li.MsoHeading7, div.MsoHeading7 {margin-top:12.0pt; margin-right:0cm; margin-bottom:3.0pt; margin-left:64.8pt; text-indent:-64.8pt; font-size:12.0pt; font-family:"Times New Roman";}
	p.MsoHeading8, li.MsoHeading8, div.MsoHeading8 {margin-top:12.0pt; margin-right:0cm; margin-bottom:3.0pt; margin-left:72.0pt; text-indent:-72.0pt; font-size:12.0pt; font-family:"Times New Roman"; font-style:italic;}
	p.MsoHeading9, li.MsoHeading9, div.MsoHeading9 {margin-top:12.0pt; margin-right:0cm; margin-bottom:3.0pt; margin-left:79.2pt; text-indent:-79.2pt; font-size:11.0pt; font-family:Arial;}
	p.MsoToc1, li.MsoToc1, div.MsoToc1 {margin:0cm; margin-bottom:.0001pt; font-size:11.0pt; font-family:Arial;}
	p.MsoToc2, li.MsoToc2, div.MsoToc2 {margin-top:0cm; margin-right:0cm; margin-bottom:0cm; margin-left:12.0pt; margin-bottom:.0001pt; font-size:11.0pt; font-family:Arial;}
	p.MsoToc3, li.MsoToc3, div.MsoToc3 {margin-top:0cm; margin-right:0cm; margin-bottom:0cm; margin-left:24.0pt; margin-bottom:.0001pt; font-size:12.0pt; font-family:"Times New Roman";}
	p.MsoToc4, li.MsoToc4, div.MsoToc4 {margin-top:0cm; margin-right:0cm; margin-bottom:0cm; margin-left:36.0pt; margin-bottom:.0001pt; font-size:12.0pt; font-family:"Times New Roman";}
	p.MsoToc5, li.MsoToc5, div.MsoToc5 {margin-top:0cm; margin-right:0cm; margin-bottom:0cm; margin-left:48.0pt; margin-bottom:.0001pt; font-size:12.0pt; font-family:"Times New Roman";}
	p.MsoToc6, li.MsoToc6, div.MsoToc6 {margin-top:0cm; margin-right:0cm; margin-bottom:0cm; margin-left:60.0pt; margin-bottom:.0001pt; font-size:12.0pt; font-family:"Times New Roman";}
	p.MsoToc7, li.MsoToc7, div.MsoToc7 {margin-top:0cm; margin-right:0cm; margin-bottom:0cm; margin-left:72.0pt; margin-bottom:.0001pt; font-size:12.0pt; font-family:"Times New Roman";}
	p.MsoToc8, li.MsoToc8, div.MsoToc8 {margin-top:0cm; margin-right:0cm; margin-bottom:0cm; margin-left:84.0pt; margin-bottom:.0001pt; font-size:12.0pt; font-family:"Times New Roman";}
	p.MsoToc9, li.MsoToc9, div.MsoToc9 {margin-top:0cm; margin-right:0cm; margin-bottom:0cm; margin-left:96.0pt; margin-bottom:.0001pt; font-size:12.0pt; font-family:"Times New Roman";}
	p.MsoFootnoteText, li.MsoFootnoteText, div.MsoFootnoteText {margin:0cm; margin-bottom:.0001pt; font-size:10.0pt; font-family:"Times New Roman";}
	p.MsoHeader, li.MsoHeader, div.MsoHeader {margin:0cm; margin-bottom:.0001pt; font-size:12.0pt; font-family:"Times New Roman";}
	p.MsoFooter, li.MsoFooter, div.MsoFooter {margin:0cm; margin-bottom:.0001pt; font-size:12.0pt; font-family:"Times New Roman";}
	span.MsoFootnoteReference {vertical-align:super;}
	p.MsoTitle, li.MsoTitle, div.MsoTitle {margin:0cm; margin-bottom:.0001pt; font-size:20.0pt; font-family:Arial; color:#005A9C; font-weight:bold;}
	p.MsoBodyText, li.MsoBodyText, div.MsoBodyText {margin:0cm; margin-bottom:.0001pt; font-size:11.0pt; font-family:Arial;}
	
	em {font-family:Arial; color:black;}
	p {margin-right:0cm; margin-left:0cm; font-size:12.0pt; font-family:"Times New Roman";}
	pre {margin:0cm; margin-bottom:.0001pt; font-size:10.0pt; font-family:Courier;}
	ins {text-decoration:none;}
	span.msoIns {text-decoration:underline;}
	span.msoDel {text-decoration:line-through; color:red;}
	@page Section1 {size:612.0pt 792.0pt; margin:72.0pt 90.0pt 72.0pt 90.0pt;}
	div.Section1 {page:Section1;}
	/* List Definitions */ ol {margin-bottom:0cm;}
	ul {margin-bottom:0cm;}
	--></style>
<br>
<H1 class="Section1" style="MARGIN-LEFT: 0cm; TEXT-INDENT: 0cm">How To Publish a 
	Resource</A></H1>
<li>
	You can <A href="..\publish.aspx">publish</A>
locally to this registry and your data will be circulated to the other VO 
repositories
<li>
	<A href="http://us-vo.org/pubs/files/PublishHowTo.html">Overview of publishing to 
		the VO</A>
</li>
<H1 class="Section1" style="MARGIN-LEFT: 0cm; TEXT-INDENT: 0cm">&nbsp;</H1>
<H1 class="Section1" style="MARGIN-LEFT: 0cm; TEXT-INDENT: 0cm">How To Change an 
	Identifier</H1>
<LI>
Search for the resource you would like to change by performing an Advanced 
Query and entering the SQL identifier like '%identifierString%' in 
the&nbsp;Custom Predicate&nbsp;box (e.g. identifier like '%esavo%')
<LI>
When the resource is found,&nbsp; click on the left Copy Tab
<LI>
Enter the new identifier in the form and REMEMBER to also enter password before 
clicking Update Resource.&nbsp; You should see Inserted 1 on the screen.
<LI>
	DELETE the old Resource by going to the Delete Window (Tab on Top Selection)</LI>
<H1 class="Section1" style="MARGIN-LEFT: 0cm; TEXT-INDENT: 0cm">&nbsp;</H1>
<H1 class="Section1" style="MARGIN-LEFT: 0cm; TEXT-INDENT: 0cm">Registry 
	Standards:</A></H1>
<LI>
	<a href="http://www.ivoa.net/Documents/REC/ResMetadata/RM-20040426.html">(RM) 
		Resource Metadata for the Virtual Observatory Version 1.01
		<LI>
			<A href="http://www.ivoa.net/twiki/bin/view/IVOA/VOResourceV010">VOResource v0.10 
				and its Standard Extensions</A>
			<br>
		</LI>
		<H1 style="MARGIN-LEFT: 0cm; TEXT-INDENT: 0cm"><A name="_Toc68083044"></A><A name="_Toc53201232"></A><A name="_Toc52343551"></A><A name="_Toc47520381"></A><A name="_Toc40243345"></A><A name="_Toc40243240"></A><A name="_Toc40242150"></A><A name="_Toc40241772"></A>RM
			<A name="_Toc39658122">Contents</A></H1>
		<P class="MsoToc1"><SPAN class="MsoHyperlink"><A href="#_Toc68083045">1<SPAN style="FONT-SIZE: 12pt; COLOR: windowtext; FONT-FAMILY: 'Times New Roman'; TEXT-DECORATION: none"></SPAN>Introduction<SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">. </SPAN><SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">3</SPAN></A></SPAN></P>
		<P class="MsoToc1"><SPAN class="MsoHyperlink"><A href="#_Toc68083046">2<SPAN style="FONT-SIZE: 12pt; COLOR: windowtext; FONT-FAMILY: 'Times New Roman'; TEXT-DECORATION: none"></SPAN>Architecture<SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">. </SPAN><SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">3</SPAN></A></SPAN></P>
		<P class="MsoToc1"><SPAN class="MsoHyperlink"><A href="#_Toc68083047">3<SPAN style="FONT-SIZE: 12pt; COLOR: windowtext; FONT-FAMILY: 'Times New Roman'; TEXT-DECORATION: none"></SPAN>Resource 
					metadata concepts<SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">. </SPAN><SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">5</SPAN></A></SPAN></P>
		<P class="MsoToc2"><SPAN class="MsoHyperlink"><A href="#_Toc68083048">3.1<SPAN style="FONT-SIZE: 12pt; COLOR: windowtext; FONT-FAMILY: 'Times New Roman'; TEXT-DECORATION: none"></SPAN>Identity 
					metadata<SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">. 
</SPAN><SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">5</SPAN></A></SPAN></P>
		<P class="MsoToc2"><SPAN class="MsoHyperlink"><A href="#_Toc68083049">3.2<SPAN style="FONT-SIZE: 12pt; COLOR: windowtext; FONT-FAMILY: 'Times New Roman'; TEXT-DECORATION: none"></SPAN>Curation 
					metadata<SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">. 
</SPAN><SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">6</SPAN></A></SPAN></P>
		<P class="MsoToc2"><SPAN class="MsoHyperlink"><A href="#_Toc68083050">3.3<SPAN style="FONT-SIZE: 12pt; COLOR: windowtext; FONT-FAMILY: 'Times New Roman'; TEXT-DECORATION: none"></SPAN>General 
					content metadata<SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">. </SPAN><SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">7</SPAN></A></SPAN></P>
		<P class="MsoToc2"><SPAN class="MsoHyperlink"><A href="#_Toc68083051">3.4<SPAN style="FONT-SIZE: 12pt; COLOR: windowtext; FONT-FAMILY: 'Times New Roman'; TEXT-DECORATION: none"></SPAN>Collection 
					and service content metadata<SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">. </SPAN><SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">9</SPAN></A></SPAN></P>
		<P class="MsoToc1"><SPAN class="MsoHyperlink"><A href="#_Toc68083052">4<SPAN style="FONT-SIZE: 12pt; COLOR: windowtext; FONT-FAMILY: 'Times New Roman'; TEXT-DECORATION: none"></SPAN>Data 
					quality assessment<SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none"></SPAN><SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">13</SPAN></A></SPAN></P>
		<P class="MsoToc1"><SPAN class="MsoHyperlink"><A href="#_Toc68083053">5<SPAN style="FONT-SIZE: 12pt; COLOR: windowtext; FONT-FAMILY: 'Times New Roman'; TEXT-DECORATION: none"></SPAN>Service 
					metadata concepts<SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">. </SPAN><SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">14</SPAN></A></SPAN></P>
		<P class="MsoToc2"><SPAN class="MsoHyperlink"><A href="#_Toc68083054">5.1<SPAN style="FONT-SIZE: 12pt; COLOR: windowtext; FONT-FAMILY: 'Times New Roman'; TEXT-DECORATION: none"></SPAN>Interface 
					metadata<SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">. 
</SPAN><SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">14</SPAN></A></SPAN></P>
		<P class="MsoToc2"><SPAN class="MsoHyperlink"><A href="#_Toc68083055">5.2<SPAN style="FONT-SIZE: 12pt; COLOR: windowtext; FONT-FAMILY: 'Times New Roman'; TEXT-DECORATION: none"></SPAN>Capabilities 
					metadata<SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">. 
</SPAN><SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">15</SPAN></A></SPAN></P>
		<P class="MsoToc1"><SPAN class="MsoHyperlink"><A href="#_Toc68083056">6<SPAN style="FONT-SIZE: 12pt; COLOR: windowtext; FONT-FAMILY: 'Times New Roman'; TEXT-DECORATION: none"></SPAN>Example<SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">. </SPAN><SPAN style="DISPLAY: none; COLOR: windowtext; TEXT-DECORATION: none">15</SPAN></A></SPAN></P>
		<P class="MsoNormal">&nbsp;</P>
		<H1><A name="_Toc68083045"></A><A name="_Toc40243241">1<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN>Introduction</A></H1>
		<P class="MsoNormal"><SPAN style="FONT-SIZE: 11pt; FONT-FAMILY: Arial"></SPAN>&nbsp;</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">An essential capability of the 
			Virtual Observatory is a means for describing what data and computational 
			facilities are available where, and once identified, how to use them. The data 
			themselves have associated metadata (e.g., FITS keywords), and similarly we 
			require metadata about data collections and data services so that VO users can 
			easily find information of interest. Furthermore, such metadata are needed in 
			order to manage distributed queries efficiently; if a user is interested in 
			finding x-ray images there is no point in querying the HST archive, for 
			example. In this document we suggest an architecture for resource and service 
			metadata and describe the relationship of this architecture to emerging Web 
			Services standards. We also define an initial set of metadata concepts.</P>
		<P class="MsoNormal"><SPAN style="FONT-SIZE: 11pt; FONT-FAMILY: Arial"></SPAN>&nbsp;</P>
		<P class="MsoNormal"><SPAN style="FONT-SIZE: 11pt; FONT-FAMILY: Arial"></SPAN>&nbsp;</P>
		<H1><A name="_Toc68083046">2<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN>Architecture</A></H1>
		<P class="MsoNormal"><SPAN style="FONT-SIZE: 11pt; FONT-FAMILY: Arial"></SPAN>&nbsp;</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">In order to make it easy for 
			astronomy information services to participate in the VO, we propose a 
			hierarchical system for metadata management. At the top level we require a 
			minimum amount of information, sufficient primarily to note the existence of a 
			resource and to describe who is responsible for it. At lower levels, the 
			metadata are more extensive and complex, allowing for the description of query 
			syntax, access protocols, and usage policies.</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">&nbsp;</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">A <I>resource</I> is a general 
			term referring to a VO element that can be described in terms of who curates or 
			maintains it and which can be given a name and a unique identifier. Just about 
			anything can be a resource: it can be an abstract idea, such as sky coverage or 
			an instrumental setup, or it can be fairly concrete, like an organization or a 
			data collection. This definition is consistent with its use in the general Web 
			community as �anything that has an identity� (Berners-Lee 1998, IETF RFC2396). 
			We expand on this definition by saying that it is also describable.
		</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText" style="TEXT-INDENT: 0cm; TEXT-ALIGN: justify">An <I>organization</I>
			is specific type of resource that brings people together to pursue 
			participation in VO applications. Organizations can be hierarchical and range 
			greatly in size and scope. At a high level, an organization could be a 
			university, observatory, or government agency. At a finer level, it could be a 
			specific scientific project, space mission, or individual researcher. A <I>provider</I>
			is an organization that makes data and/or services available to users over the 
			network.</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">&nbsp;</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">A <I>service</I> is any VO 
			resource that can be invoked by the user to perform some action on their 
			behalf.&nbsp; Associated with any service is descriptive <I>metadata</I> about 
			the service.&nbsp; Metadata generally include information the user needs to 
			determine if a service is of interest and how the service may be invoked.&nbsp; 
			Specific types of metadata are described below.&nbsp; Note that the service 
			itself need not be aware of the metadata that describe it.</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify"><BR>
			A <I>query service</I> supports a query/response protocol.&nbsp; The user 
			submits a query to the service that may define characteristics of interest, and 
			the service returns a set of information to the user.&nbsp; The query may be 
			null,&nbsp;e.g., a current-time service may only support a null query, and some 
			services may respond to a null query with appropriate default actions. 
			Non-query services may also exist, e.g., services to copy or delete files on 
			remote files systems, to mail information to other users, to kill existing 
			jobs, to</P>
		<P class="MsoBodyText">authorize actions, etc.<BR>
			<BR>
			A <I>registry</I> is a query service for which the response is a structured 
			description of resources.&nbsp; The resources described by a registry may be of 
			any type.&nbsp; The registry may support a query that allows the user to 
			indicate which resources might be of interest.<BR>
			<BR>
		</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">In our model, the hierarchy of 
			resources is one in terms of management and curation. For example, an 
			organization may manage a collection of one or more services and even smaller 
			organizations or projects. For example, MAST, HEASARC, IRSA, NED et al. are all 
			resources. Each of these manages other resources, e.g., the HST archive in 
			MAST. They also support specific services (which are also resources) such as an 
			HST observation log query service or a cone search service. One could in 
			principle describe all of NASA astrophysics data holdings as a resource, or all 
			of NVO as a resource, but aggregates of this scale circumvent the goal of being 
			able to locate the specific resources and services of interest for a particular 
			application.
		</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify"><BR>
			All resources are described by metadata.&nbsp; <I>Resource metadata</I> are 
			generic, high-level, and independent of any specific service.&nbsp; Resource 
			metadata include</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 18pt; TEXT-INDENT: -18pt"><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Symbol">�<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN></SPAN><I>Identity metadata,</I> which gives the resource a name and an identifier,</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 18pt; TEXT-INDENT: -18pt"><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Symbol">�<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN></SPAN><I>Curation metadata</I>, which describe who supports the resource and its 
			availability (i.e., version, release date), and</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 18pt; TEXT-INDENT: -18pt"><SPAN style="FONT-SIZE: 10pt; FONT-FAMILY: Symbol">�<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN></SPAN><I>Content metadata</I>, which describe what kind of information is available 
			(types of data, sky coverage, spectral coverage, etc.). Content metadata can be 
			either general, applying to all resources, or associated more specifically with 
			data collections and the services that deliver data from them.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">Resource metadata are typically 
			not queryable parameters in the underlying services, but rather they encompass 
			information that now is simply �known� to users, or must be discovered through 
			other means. Astronomers know that the HST archive includes optical images and 
			spectra, for example, or that Vizier provides access to catalogs and tables. 
			Resource metadata constitute a �yellow pages� of astronomical information. 
			Resource metadata are analogous to the UDDI (<SPAN style="COLOR: black">Universal Description, Discovery and Integration) Web 
Service, and are analogous to the high-level descriptions included in the 
</SPAN><SPAN style="COLOR: black">CDS</SPAN><SPAN style="COLOR: black"></SPAN><SPAN style="COLOR: black">GLU</SPAN><SPAN style="COLOR: black">.</SPAN></P>
		<P class="MsoBodyText"><SPAN style="COLOR: black"></SPAN>&nbsp;</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify"><SPAN style="COLOR: black">Organizations, data collections, and services can be 
considered as classes of resources that may each require additional metadata to 
fully describe it, but which are not shared by other classes.&nbsp; For example, 
a service description would need to include its inputs, outputs, and how it can 
be accessed.&nbsp; <I>Service metadata</I>, therefore, can be thought of as an 
extension of the general resource metadata:&nbsp; where as the resource 
metadata, through its content metadata, describes <I>what</I> is available, the 
service metadata describes <I>how</I> to access it.</SPAN></P>
		<P class="MsoBodyText"><SPAN style="COLOR: black"></SPAN>&nbsp;</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">Resource metadata will be 
			collected through resource registration services, e.g., web forms that present 
			a resource curator with the requisite fields and enumerated lists, and 
			construct a resource descriptor in a standard format (such as VOTable). The 
			resource registration service should not allow fields to be left unspecified. 
			Some metadata elements may be irrelevant, unknown, or not provided by the 
			publisher of a resource. Since �irrelevant� conveys different information than 
			�not provided�, we will adopt standard representations of these conditions:</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">�Not Applicable� irrelevant or not applicable to this 
			resource</P>
		<P class="MsoBodyText">�Unknown� unknown, cannot be defined</P>
		<P class="MsoBodyText">�Not Provided� no information was provided by the resource 
			publisher</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">Various applications based on 
			the registry may choose to include or exclude certain resources based on these 
			attributes. If a metadata element is �Not Provided� the application should make 
			no assumption regarding applicability or relevance.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">Similarly, some resources may provide quite large 
			aggregations or collections, covering many bandpasses, types, or formats. It 
			may be prohibitive to list all such options. In such cases acceptable 
			representations for the metadata entries would be:</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">�Any� resource will respond to requests for any of the
		</P>
		<P class="MsoBodyText">available types (though some may not actually be</P>
		<P class="MsoBodyText">available)</P>
		<P class="MsoBodyText">�All� resource will respond to requests for all of the
		</P>
		<P class="MsoBodyText">available types, and all are actually available in some</P>
		<P class="MsoBodyText">non-zero quantity</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">The most general resource 
			metadata is similar in concept to the Dublin Core metadata definitions (<A href="http://dublincore.org/documents/dces/">http://dublincore.org/documents/dces/</A>), 
			and where possible DC metadata elements have been used. VO metadata elements 
			that correspond directly to DC counterparts are noted. The Dublin Core elements 
			Language and Relation are not currently used in the VO metadata.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">&nbsp;</P>
		<H1><A name="_Toc68083047">3<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN>Resource metadata concepts</A></H1>
		<P class="MsoNormal"><SPAN style="FONT-SIZE: 11pt; FONT-FAMILY: Arial"></SPAN>&nbsp;</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">Below we describe the <I>concepts</I>
			we believe are needed in the resource metadata. These concepts may be 
			instantiated in a variety of standard forms, e.g. XML, UCD tags, or FITS 
			keywords, and with a variety of mechanisms, such as Topic Maps, OWL, or RDBMSs. 
			Consequently, the exact names and rendering of the values may depend on the 
			particular form in which they are represented.&nbsp; For example, when <I>Coverage.Spatial</I>
			is rendered as a FITS keyword record, the name will need to be limited to 8 
			characters and the value rendered in a pure ASCII form; in contrast, when 
			rendered in XML, it might be better to tag the different components of the 
			value separately.&nbsp; It will be necessary to define standard renderings for 
			each of these common forms.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">A limited number of keywords are considered essential for a 
			basic understanding of the resource, and are thus denoted as <I>required</I>. 
			All others are optional, or may be applied to certain classes of resources 
			only.</P>
		<P class="MsoNormal"><SPAN style="FONT-SIZE: 11pt; FONT-FAMILY: Arial"></SPAN>&nbsp;</P>
		<H2><A name="_Toc68083048">3.1<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN>Identity metadata</A></H2>
		<P class="MsoNormal"><SPAN style="FONT-SIZE: 11pt; FONT-FAMILY: Arial"></SPAN>&nbsp;</P>
		<P class="MsoBodyText"><I>Title</I> (string) [Dublin Core] [Required]</P>
		<P class="MsoBodyText">Definition: A name given to the resource.</P>
		<P class="MsoBodyText">Comment: Typically, a Title will be a name by which the 
			resource is formally known.
		</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>ShortName </I>(string)</P>
		<P class="MsoBodyText">Definition: A short abbreviation for the name given to the 
			resource.</P>
		<P class="MsoBodyText">Comment: The ShortName will be used where brief annotations 
			for the resource name are required. ShortName strings are limited to a maximum 
			of sixteen characters.
		</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Identifier </I>(URI) [Dublin Core] [Required]</P>
		<P class="MsoBodyText">Definition: An unambiguous reference to the resource within 
			a given context. The syntax for Identifiers is described in <I>IVOA Identifiers</I>
			in the IVOA document collection<I> </I>(<A href="http://www.ivoa.net/Documents/">http://www.ivoa.net/Documents/</A>).</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">Comment: The URI corresponding to the resource.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<H2><A name="_Toc68083049">3.2<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN>Curation metadata</A></H2>
		<P class="MsoBodyText"><I></I>&nbsp;</P>
		<P class="MsoBodyText"><I>Publisher </I>(string) [Dublin Core] [Required]</P>
		<P class="MsoBodyText">Definition: An entity responsible for making the resource 
			available</P>
		<P class="MsoBodyText">Comment: Examples of a Publisher include a person or an 
			organization. Users of the resource should include Publisher in subsequent 
			credits and acknowledgments.
		</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>PublisherID</I> (URI)</P>
		<P class="MsoBodyText">Definition: The identifier for the entity responsible for 
			making the resource available. The syntax for Identifiers is described in <I>IVOA 
				Identifiers</I> in the IVOA document collection<I> </I>(<A href="http://www.ivoa.net/Documents/">http://www.ivoa.net/Documents/</A>).</P>
		<P class="MsoBodyText">Comment: This item is optional; an ID for the publisher may 
			not yet be established (e.g., if the publisher has not yet been registered).</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Creator </I>(string) [Dublin Core]</P>
		<P class="MsoBodyText">Definition: An entity primarily responsible for making the 
			content of the resource.</P>
		<P class="MsoBodyText">Comment: Examples of a Creator include a person or an 
			organization. Users of the resource should include Creator in subsequent 
			credits and acknowledgments.
		</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Creator.Logo </I>(URL)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: A URL pointing to a 
			graphical logo, which may be used to help identify the information resource.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Contributor </I>(string) [Dublin Core]</P>
		<P class="MsoBodyText">Definition: An entity responsible for making contributions 
			to the content of the resource.</P>
		<P class="MsoBodyText">Comment: Examples of a Contributor include a person or an 
			organization. Users of the resource should include Contributor in subsequent 
			credits and acknowledgments.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Date </I>(string) [Dublin Core]</P>
		<P class="MsoBodyText">Definition: A date associated with an event in the life 
			cycle of the resource. Typically, Date will be associated with the creation or 
			availability (i.e., most recent release or version) of the resource. ISO8601 is 
			the preferred format (YYYY-MM-DD).</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Version </I>(string)</P>
		<P class="MsoBodyText">Definition: A label associated with the creation or 
			availability (i.e., most recent release or version) of the resource.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Contact </I>(string, e-mail address)</P>
		<P class="MsoBodyText">Definition: The e-mail address for contacting the persons 
			responsible for the resource.</P>
		<P class="MsoBodyText">Comment: Contact is split into two components for clarity.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Contact.Name </I>(string)</P>
		<P class="MsoBodyText">Definition: The name of the contact.</P>
		<P class="MsoBodyText">Comment: A person�s name, �John P. Jones�, or a group, 
			�Archive
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt; TEXT-INDENT: 36pt">Support Team�.</P>
		<P class="MsoBodyText"><I></I>&nbsp;</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Contact.Email </I>(e-mail address)</P>
		<P class="MsoBodyText">Definition: The e-mail address of the contact.</P>
		<P class="MsoBodyText">Comment: For example, �John.P.Jones@navy.gov�, or
		</P>
		<P class="MsoBodyText">�archive@datacenter.org�.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<PRE><I><SPAN style="FONT-SIZE: 11pt; FONT-FAMILY: Arial">&nbsp;</SPAN></I></PRE>
		<H2><A name="_Toc68083050">3.3<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN>General content metadata</A></H2>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Subject </I>(string, list) [Dublin Core] [Required]</P>
		<P class="MsoBodyText">Definition: A list of the topics, object types, or other 
			descriptive keywords about the resource.
		</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">Comment: Subject is intended to 
			provide additional information about the nature of the information provided by 
			the resource. Is this a catalog of quasars? Of planetary nebulae? Is this a 
			tool for computing<SPAN lang="EN-GB"> ephemerides</SPAN>? Terms for Subject 
			should be drawn from the IAU Astronomy Thesaurus (<A href="http://msowww.anu.edu.au/library/thesaurus/"><SPAN style="COLOR: windowtext">http://msowww.anu.edu.au/library/thesaurus/</SPAN></A>), 
			though in the absence of suitable terms (the IAU Thesaurus is not complete in 
			all areas of astronomical research) the following alternate collections of 
			astronomical research terms may be used:</P>
		<P class="MsoBodyText">Vizier keywords (CDS): <A href="http://vizier.u-strasbg.fr/doc/ADCkwds.htx">
				http://vizier.u-strasbg.fr/doc/ADCkwds.htx</A></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Astronomy journal keywords: <A href="http://www.edpsciences.org/journal/%20%20%20%20statique/doc/aa_keywords.html">
				http://www.edpsciences.org/journal/ statique/doc/aa_keywords.html</A></P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Description </I>(string, free text) [Dublin Core] 
			[Required]</P>
		<P class="MsoBodyText">Definition: An account of the content of the resource.</P>
		<P class="MsoBodyText">Comment: Description may include but is not limited to: an 
			abstract, table of contents, reference to a graphical representation of content 
			or a free-text account of the content.</P>
		<P class="MsoBodyText"><I></I>&nbsp;</P>
		<P class="MsoBodyText"><I>Source</I> (string) [Dublin Core]</P>
		<P class="MsoBodyText">Definition: A bibliographic reference from which the present 
			resource is derived or extracted.</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">Comment: The present resource 
			may be derived from the Source in whole or in part. Recommended best practice 
			is to use the standard <I>bibcode </I>(see <A href="http://cdsweb.u-strasbg.fr/simbad/refcode.html">
				http://cdsweb.u-strasbg.fr/simbad/refcode.html</A>), where available. If no <I>bibcode</I>
			is available, Source should use a string or number conforming to a formal 
			identification or citation system.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>ReferenceURL </I>(URL) [Required]</P>
		<P class="MsoBodyText">Definition: A URL pointing to additional information about 
			the resource. In general, this information should be human-readable.</P>
		<P class="MsoBodyText"><I></I>&nbsp;</P>
		<P class="MsoBodyText"><I>Type </I>(string, list) [Dublin Core] [Required]</P>
		<P class="MsoBodyText">Definition: The nature or genre of the content of the 
			resource.</P>
		<P class="MsoBodyText">Comment: Type includes terms describing general categories, 
			functions, genres, or aggregation levels for content. VO Types include:</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><U>Type</U> <U>Description</U></P>
		<P class="MsoBodyText">Archive Collection of pointed observations</P>
		<P class="MsoBodyText">Bibliography Collection of bibliographic references, 
			abstracts, and</P>
		<P class="MsoBodyText">publications</P>
		<P class="MsoBodyText">Catalog Collection of derived data, primarily in tabular 
			form</P>
		<P class="MsoBodyText">Journal Collection of scholarly publications under common</P>
		<P class="MsoBodyText">editorial policy</P>
		<P class="MsoBodyText">Library Collection of published materials (journals, books, 
			etc.)</P>
		<P class="MsoBodyText">Simulation Theoretical simulation or model</P>
		<P class="MsoBodyText">Survey Collection of observations covering substantial and</P>
		<P class="MsoBodyText">contiguous areas of the sky</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">Education Collection of materials appropriate for 
			educational use, such</P>
		<P class="MsoBodyText">as teaching resources, curricula, etc.</P>
		<P class="MsoBodyText">Outreach Collection of materials appropriate for public 
			outreach, such</P>
		<P class="MsoBodyText">as press releases and photo galleries</P>
		<P class="MsoBodyText">EPOResource Collection of materials that may be suitable for 
			EPO</P>
		<P class="MsoBodyText">products but which are not in final product form, as in Type</P>
		<P class="MsoBodyText">Outreach or Type Education. EPOResource would apply,</P>
		<P class="MsoBodyText">e.g., to archives with easily accessed preview images or to</P>
		<P class="MsoBodyText">surveys with easy-to-use images.</P>
		<P class="MsoBodyText">Animation Animation clips of astronomical phenomena</P>
		<P class="MsoBodyText">Artwork Artists� renderings of astronomical phenomena or 
			objects</P>
		<P class="MsoBodyText">Background Background information on astronomical phenomena 
			or
		</P>
		<P class="MsoBodyText">objects</P>
		<P class="MsoBodyText">BasicData Compilations of basic astronomical facts about 
			objects,</P>
		<P class="MsoBodyText">such as approximate distance or membership in
		</P>
		<P class="MsoBodyText">constellation.</P>
		<P class="MsoBodyText">Historical Historical information about astronomical 
			objects.</P>
		<P class="MsoBodyText">Photographic Publication-quality photographs of astronomical 
			objects.</P>
		<P class="MsoBodyText">Press Press releases about astronomical objects.</P>
		<P class="MsoBodyText">Organization An organization that is a publisher or curator 
			of other resources.</P>
		<P class="MsoBodyText">Project A project that is a publisher or curator of other 
			resources.</P>
		<P class="MsoBodyText">Registry A query service for which the response is a 
			structured description
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 72pt; TEXT-INDENT: 36pt">of resources.</P>
		<P class="MsoBodyText" style="TEXT-INDENT: 36pt">Other A resource not described by 
			any of the above types.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">This list is extensible. Resources providing more than one 
			type of content should list all relevant types.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>ContentLevel </I>(string, list)</P>
		<P class="MsoBodyText">Definition: A description of the content level, or intended 
			audience.</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">Comment: VO resources will be 
			available to professional astronomers, amateur astronomers, educators, and the 
			general public. These different audiences need a way to find material 
			appropriate for their needs.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><U>ContentLevel</U> <U>Definition</U></P>
		<P class="MsoBodyText">General Resource provides information appropriate for
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 144pt; TEXT-INDENT: 36pt">all users</P>
		<P class="MsoBodyText">Elementary Education Resource provides information 
			appropriate for
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 144pt; TEXT-INDENT: 36pt">grades K-4 
			education</P>
		<P class="MsoBodyText">Middle School Education Resource provides information 
			appropriate for
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 144pt; TEXT-INDENT: 36pt">grades 5-8 
			education</P>
		<P class="MsoBodyText">Secondary Education Resource provides information 
			appropriate for
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 144pt; TEXT-INDENT: 36pt">grades 9-12 
			education</P>
		<P class="MsoBodyText">Community College Resource provides information appropriate 
			for</P>
		<P class="MsoBodyText">education at community colleges</P>
		<P class="MsoBodyText">University Resource provides information appropriate for
		</P>
		<P class="MsoBodyText">university-level education</P>
		<P class="MsoBodyText">Research Resource provides information appropriate for
		</P>
		<P class="MsoBodyText">professional-level research and graduate
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 144pt; TEXT-INDENT: 36pt">school 
			education</P>
		<P class="MsoBodyText">Amateur Resource provides information of interest to
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 144pt; TEXT-INDENT: 36pt">amateur 
			astronomers</P>
		<P class="MsoBodyText">Informal Education Resource provides information appropriate 
			for</P>
		<P class="MsoBodyText">education at museums, planetariums, and
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 144pt; TEXT-INDENT: 36pt">other centers 
			of informal learning</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Relationship</I> (string)</P>
		<P class="MsoBodyText">Definition: A resource may be related to another resource in 
			a way that is important to document, so that associated services or duplicate 
			copies may easily be located.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">mirror-of The resource is a mirror of another resource. 
			Information
		</P>
		<P class="MsoBodyText">gathered from the resources is indistinguishable.</P>
		<P class="MsoBodyText">service-for The resource is a service associated with a data 
			collection.</P>
		<P class="MsoBodyText">derived-from The resource is a derivative of another 
			resource, e.g., a subset</P>
		<P class="MsoBodyText">selected for a particular scientific interest, or a 
			reprocessed data</P>
		<P class="MsoBodyText">collection.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>RelationshipID</I> (URI)</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">Definition: The identifier of an 
			associated resource. The relationship is described in the Relationship metadata 
			element. The syntax for Identifiers is described in <I>IVOA Identifiers</I> in 
			the IVOA document collection<I> </I>(<A href="http://www.ivoa.net/Documents/">http://www.ivoa.net/Documents/</A>).</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">&nbsp;</P>
		<H2><A name="_Toc68083051">3.4<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN>Collection and service content metadata</A></H2>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Facility </I>(string, list)</P>
		<P class="MsoBodyText">Definition: The observatory or facility where the data was 
			obtained.</P>
		<P class="MsoBodyText" style="TEXT-ALIGN: justify">Comments: Some resources are 
			likely to hold data from multiple observatories. If just a few, this could be a 
			list; if very many, just say �many�. Theoretical data will not originate with 
			an observatory, but rather might be characterized by the computational facility 
			used to create them (NCSA, SDSC, etc.).
		</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Instrument </I>(string, list)</P>
		<P class="MsoBodyText">Definition: The instrument used to collect the data.</P>
		<P class="MsoBodyText">Comments: Can be a specific instrument name (Wide 
			Field/Planetary Camera 2) or generic instrument type (CCD camera). Theoretical 
			data is produced by a computer code, and the name of the code could be 
			specified.</P>
		<P class="MsoBodyText"><I></I>&nbsp;</P>
		<P class="MsoBodyText"><I>Coverage </I>(string) [Dublin Core, with modifications]</P>
		<P class="MsoBodyText">Definition: The extent of scope of the content of the 
			resource.</P>
		<P class="MsoBodyText">Comment: The Dublin Core notion of coverage is too generic 
			to be of much use in the VO, where we need more specific information. We 
			propose to subset this element as follows:</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="COLOR: red"></SPAN>&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.Spatial </I>(string)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt; TEXT-ALIGN: justify">Definition: 
			The sky coverage of the resource.
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt; TEXT-ALIGN: justify">Comment: The 
			complete syntax for the spatial coverage specification is described in the <A href="http://hea-www.harvard.edu/~arots/nvometa/region.xsd">
				Space-Time Metadata definition document</A> Region definition. Resource 
			metadata may be somewhat simplified (i.e., do not give detailed spatial 
			coverage of a large archive), but should be expressed in a syntax which adheres 
			to the STM specification. All positions should be given in degrees unless 
			specified otherwise. The list below suggests a basic representation of regions, 
			but implementations should rely on the Region schema definition.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><U>Region Name </U><U>Specification</U></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Circle circle (cframe, ?<SUB>cen</SUB>, 
			?<SUB>cen</SUB>, radius)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Ellipse ellipse (cframe, ?<SUB>cen</SUB>, 
			?<SUB>cen, </SUB>semi-major axis,</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">semi-minor axis, position angle)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Polygon polygon (cframe, ?<SUB>1</SUB>, 
			?<SUB>1</SUB>, ?<SUB>2</SUB>, ?<SUB>2</SUB>, ?<SUB>3</SUB>, ?<SUB>3</SUB>, �) 
			where ?,?</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">pairs give the vertices of a 
			polygon in counterclock-</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">wise order. In spherical 
			coordinates, the segments</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">between vertices are assumed to be 
			great circles</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">unless small circles are 
			explicitly noted.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Sector sector (cframe, ?, ?, ?<SUB>1</SUB>, 
			?<SUB>2</SUB>) where ?<SUB>1</SUB> and ?<SUB>2</SUB> are
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">position angles bounding the 
			sector</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Constraint constraint (cframe, x, 
			y, z, d) where x, y, and z are</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">the components of a normal vector 
			on the unit
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">sphere and d is the distance from 
			the center of the</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">sphere. Constraint defines a 
			spherical cap.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt; TEXT-ALIGN: justify">? and ? 
			represent coordinates in the appropriate frame (a, d; l, b; �). Compound 
			regions may be constructed with unions (logical <I>or</I>), intersections 
			(logical <I>and</I>), and negation (logical <I>not</I>). The coordinate system 
			reference frame is specified as follows (<A href="http://aladin.u-strasbg.fr/java/doctech/cds/astro/Astroframe.html">http://aladin.u-strasbg.fr/java/doctech/cds/astro/Astroframe.html</A>
			for additional details):</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><U>cframe</U> <U>Description</U></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">ICRS International Celestial 
			Reference System</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">FK5 Equatorial coordinates, FK5 
			system (J2000)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">FK4 Equatorial coordinates, FK4 
			system (B1950)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">ECL Ecliptic coordinates (J2000)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">GAL Galactic coordinates (J2000)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">SGAL Supergalactic coordinates 
			(J2000)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.RegionOfRegard </I>(float, 
			decimal degrees)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt; TEXT-ALIGN: justify">Definition: 
			Both data archives and catalogs have an intrinsic scale size. For example, a 
			source catalog created from an instrument with one degree angular resolution 
			would have a RegionOfRegard of 0.5 degree, meaning that if one is searching for 
			information pertinent to a given position, objects in this catalog within 0.5 
			degree of the position of interest would need to be included. For an image 
			archive the RegionOfRegard corresponds to the image field of view.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt; TEXT-ALIGN: justify">Comment: 
			RegionOfRegard corresponds to CoordArea in the Space-Time Metadata definition 
			document.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.Spectral </I>(string, 
			list)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The spectral coverage 
			of the resource.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt; TEXT-ALIGN: justify">Comment: 
			Spectral coverage at the resource level will be in terms of general spectral 
			regions (gamma-ray, x-ray, extreme UV, UV, optical, infrared, radio). The 
			general spectral regions are defined specifically as follows:</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><U>Coverage.Spectral</U> <U>Represents</U></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Radio
			<SPAN style="FONT-FAMILY: Symbol">l</SPAN>
			= 10 mm</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-FAMILY: Symbol">n</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			30 GHz</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Millimeter 0.1 mm
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">l</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			10 mm</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">3000 GHz =
			<SPAN style="FONT-FAMILY: Symbol">n</SPAN>
			= 30 GHz</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Infrared 1 �
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">l</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			100 �</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Optical 0.3 �
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">l</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			1 �</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">300 nm
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">l</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			1000 nm</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">3000 �
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">l</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			10000 �</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Ultraviolet 0.01 �
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">l</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			0.3 �</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 144pt; TEXT-INDENT: 36pt">100 �
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">l</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			3000 �</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 144pt; TEXT-INDENT: 36pt">1.2 eV
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			E
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			120 eV</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">X-ray 0.1 �
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">l</SPAN>
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			100 �</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">0.12 keV
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			E
			<SPAN style="FONT-FAMILY: Symbol">�</SPAN>
			120 keV</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Gamma-ray E = 120 keV</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Resources containing data in 
			multiple spectral regions may give a list (e.g., �Radio, Infrared�).
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.Spectral.Bandpass </I>(string, 
			list)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt; TEXT-ALIGN: justify">Definition: A 
			specific bandpass specification.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt; TEXT-ALIGN: justify">Comment: Some 
			resources and services may choose to give spectral coverage in more specific 
			terms than the general spectral regions. The list of possible bandpass names is 
			too lengthy to enumerate here, but would include optical bandpasses (U, V, B, 
			R, I), narrow line filters (H-alpha, [OIII]), or other specific bandpass names.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.Spectral.CentralWavelength </I>
			(float)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The central wavelength 
			of the spectral bandpass, in meters.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Comment: This should be the most 
			representative wavelength of the bandpass.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.Spectral.MinimumWavelength </I>
			(float)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The minimum wavelength 
			of the spectral bandpass, in meters.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt; TEXT-ALIGN: justify">Comment: 
			Implementers are encouraged to set the minimum wavelength to be as inclusive as 
			possible, allowing all relevant resources to be discovered.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.Spectral.MaximumWavelength </I>
			(float)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The maximum wavelength 
			of the spectral bandpass, in meters.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt; TEXT-ALIGN: justify">Comment: 
			Implementers are encouraged to set the maximum wavelength to be as inclusive as 
			possible, allowing all relevant resources to be discovered.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.Temporal.StartTime </I>
			(string)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The earliest temporal 
			coverage of the resource.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Comment: Temporal coverage 
			specifications will be given in ISO8601 format. An empty value field implies 
			that there is no known earliest temporal coverage.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.Temporal.StopTime </I>(string)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The latest temporal 
			coverage of the resource.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Comment: Temporal coverage 
			specifications will be given in ISO8601 format. An empty value field implies 
			that there is no known latest temporal coverage, i.e., that information 
			continues to be added to the resource.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.Depth </I>(float)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The (typical) depth 
			coverage, or sensitivity, of the resource. Coverage.Depth is specified in flux 
			density (Jy).</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.ObjectDensity </I>(float)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The (typical) density 
			of objects, catalog entries, telescope pointings, etc., on the sky, in number 
			per square degree.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.ObjectCount</I> (int)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The total number of 
			objects, catalog entries, telescope pointings, etc., in the resource.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Coverage.SkyFraction</I> (float)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The fraction of the 
			sky represented in the observations, ranging from 0 to 1.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText"><I>Resolution </I>(float)</P>
		<P class="MsoBodyText">Definition: The resolution of the resource contents.</P>
		<P class="MsoBodyText">Comment: Resolution is divided into the following 
			sub-elements:</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="COLOR: red"></SPAN>&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Resolution.Spatial </I>(float)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The spatial (angular) 
			resolution that is typical of the observations, in decimal degrees.
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Resolution.Spectral</I> (float)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The spectral 
			resolution that is typical of the observations, given as the ratio ?/?? (so 
			that higher spectral resolution has a larger number).</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I>Resolution.Temporal</I> (float)</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">Definition: The temporal 
			resolution that is typical of the observations, given in seconds.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><I></I>&nbsp;</P>
		<P class="MsoBodyText"><I>UCD</I> (string, list)</P>
		<P class="MsoBodyText">Definition: A list of the UCDs (Unified Content Descriptors, <A href="http://cdsweb.u-strasbg.fr/doc/UCD.htx">
				http://cdsweb.u-strasbg.fr/doc/UCD.htx</A>) represented in the resource.</P>
		<P class="MsoBodyText">Comment: Some large or complex resources will have hundreds 
			of associated UCDs and are unlikely to be specified in the resource metadata. 
			Users of the resource metadata should not assume that an empty specification 
			implies that the resource has no associated UCDs.</P>
		<P class="MsoBodyText"><I></I>&nbsp;</P>
		<P class="MsoBodyText"><I>Format </I>(string, list) [Dublin Core]</P>
		<P class="MsoBodyText">Definition: The physical or digital manifestation of the 
			information provided by the resource.</P>
		<P class="MsoBodyText">Comments: Typical values would be �image/fits�, �image/gif�, 
			�text/plain�, �text/html�, �text/xml� (for VOTable), etc. MIME types should be 
			used where available to specify digital information formats in order to utilize 
			existing standards.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">Other format values will be used to describe the physical 
			medium of the information: CDROM, Digital Planetarium, Online, Presentation, 
			Print, Slides, Video. Format specifications may be combined, as in �Video, 
			video/mpeg� (both hardcopy video cassettes and on-line MPEG files) or �CDROM, 
			image/fits, image/gif� (FITS and GIF images are available on-line and on CDROM 
			hardcopy).</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Rights </I>(string) [Dublin Core]</P>
		<P class="MsoBodyText">Definition: Information about rights held in and over the 
			resource.</P>
		<P class="MsoBodyText">Comment: Dublin Core uses Rights to describe copyright and 
			other intellectual property rights issues. In the VO context Rights would 
			describe access privileges, using the following values: public, proprietary, 
			mixed.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">&nbsp;</P>
		<H1><A name="_Toc68083052">4<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN>Data quality assessment</A></H1>
		<P class="MsoNormal">&nbsp;</P>
		<P class="MsoBodyText">Users of virtual observatory resources need some way to 
			assess the quality of the data. Data quality is both subjective and 
			quantitative, and data collections may have no single data quality metric. 
			While the completeness and consistency of the resource metadata itself may be a 
			reasonable indicator of the quality of the associated resource, this is at best 
			a qualitative measure. The following metadata elements are intended to capture 
			the most basic measures of data quality, and may well require extensions as VO 
			usage practices evolve and become more sophisticated.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>DataQuality</I> (char)</P>
		<P class="MsoBodyText">Definition: An overall assessment of the integrity, 
			consistency, and level of documentation concerning uncertainty estimates and 
			calibration procedures, of the data provided by the resource. We suggest 3 
			general grade levels, plus codes for unknown or undocumented cases:</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">A Data are fully calibrated, fully documented, and suitable 
			for professional</P>
		<P class="MsoBodyText">research.</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 72pt; TEXT-INDENT: -36pt">B Data are 
			calibrated and documented, but calibration quality is inconsistent. Users are 
			advised to check data carefully and recalibrate.</P>
		<P class="MsoBodyText">C Data are uncalibrated.</P>
		<P class="MsoBodyText">U Data quality is unknown. If a resource does not provide a 
			data quality</P>
		<P class="MsoBodyText">assessment, class U should be assumed.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Uncertainty.Photometric</I> (float)</P>
		<P class="MsoBodyText">Definition: The uncertainty of the photometric measurements 
			provided by the resource, given in Jy.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Uncertainty.Spatial</I> (float)</P>
		<P class="MsoBodyText">Definition: The uncertainty of the astrometric, or 
			positional measurements, provided by the resource, given in degrees.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Uncertainty.Spectral</I> (float)</P>
		<P class="MsoBodyText">Definition: The uncertainty of the wavelengths provided by 
			the resource, given in meters.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Uncertainty.Temporal</I> (float)</P>
		<P class="MsoBodyText">Definition: The uncertainty of the temporal measurements 
			provided by the resource, given in seconds.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoNormal">&nbsp;</P>
		<H1><A name="_Toc68083053">5<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN>Service metadata concepts</A></H1>
		<P class="MsoNormal">&nbsp;</P>
		<P class="MsoBodyText">The metadata necessary for describing a service will vary 
			quite a bit depending on the type of service it is. We propose two general 
			categories of service metadata:</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Interface metadata</I>, which describe how to access the 
			service�the inputs and the outputs. There will be standard types of interfaces 
			that could include a web-browser-based interface (i.e., HTML Forms), a Web 
			Service interface (describable by a WSDL document), a general HTTP Get 
			interface (e.g., using <I>key=value </I>arguments), and a GLU-described 
			interface.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Capability metadata</I>, which describe what the service 
			does, its limitations, and other behavioral characteristics.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">Note that these categories are reasonably orthogonal. We can 
			imagine the same basic service�in terms of its capabilities�accessible through 
			multiple interfaces.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">We expect that for each standard service recognized by the 
			VO there will be a specification document that defines all the specific 
			metadata necessary to describe a particular implementation of that service; 
			thus, we do not include them all here.&nbsp; However, we can identify a few 
			metadata concepts that might be employed to describe a particular 
			service.&nbsp; Described below, these concepts should be employed by standard 
			service specifications wherever they are applicable.&nbsp; We note also that 
			metadata
			<BR>
			associated with the VOTable schema can also be reused to describe the inputs 
			and outputs of a service that returns a VOTable.&nbsp;</P>
		<P class="MsoNormal"><SPAN style="FONT-SIZE: 11pt; FONT-FAMILY: Arial"></SPAN>&nbsp;</P>
		<H2><A name="_Toc68083054">5.1<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN>Interface metadata</A></H2>
		<P class="MsoNormal">&nbsp;</P>
		<P class="MsoBodyText"><I>Service.InterfaceURL</I> (URL)</P>
		<P class="MsoBodyText">Definition: A URL pointing to a document that presents or 
			describes the service interface.
		</P>
		<P class="MsoBodyText">Comment: For a Web Service, this would point to the WSDL 
			document, for a GLU-described service, it would point to the GLU record, and 
			for a browser-based service, this would be the Web page that actually contains 
			the Web Form.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Service.BaseURL</I> (URL)</P>
		<P class="MsoBodyText">Definition: The base portion of a URL used to invoke a 
			service with the expectation that an additional string must be appended for the 
			service to execute properly. The syntax of the appended string is defined by 
			the specific service.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Service.HTTPResultsMIMEType</I> (MIME type)</P>
		<P class="MsoBodyText">Definition: The MIME type that is returned by a service.</P>
		<P class="MsoNormal"><SPAN style="FONT-SIZE: 11pt; FONT-FAMILY: Arial"></SPAN>&nbsp;</P>
		<H2><A name="_Toc68083055">5.2<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN>Capabilities metadata</A></H2>
		<P class="MsoNormal">&nbsp;</P>
		<P class="MsoBodyText"><I>Service.StandardURI</I> (URI)</P>
		<P class="MsoBodyText">Definition: An identifier for a standard service. The syntax 
			for Identifiers is described in <I>IVOA Identifiers</I> in the IVOA document 
			collection<I> </I>(<A href="http://www.ivoa.net/Documents/">http://www.ivoa.net/Documents/</A>).</P>
		<P class="MsoBodyText">Comment: This provides a unique way to refer to a service 
			specification standard, such as a Simple Image Access service. It assumes that 
			such standard is registered and accessible.
		</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Service.StandardURL</I> (URL)</P>
		<P class="MsoBodyText">Definition: A URL that points to a human-readable document 
			that describes the standard upon which a service is based.
		</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt">&nbsp;</P>
		<P class="MsoBodyText"><I>Service.MaxSearchRadius</I> (float, decimal degrees)</P>
		<P class="MsoBodyText">Definition: Service providers may choose to restrict the 
			scope of searches done against their services, lest they be swamped with 
			requests for millions or billions of results records. Service.MaxSearchRadius 
			restricts searches to some maximum radius (in decimal degrees) about a 
			celestial coordinate.</P>
		<P class="MsoBodyText">Comment: A value of 180.0 or greater denotes that there is 
			no restriction.</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText"><I>Service.MaxReturnRecords</I> (int)</P>
		<P class="MsoBodyText">Definition: Service providers may choose to restrict the 
			number of records returned in order to avoid swamping the user with responses 
			to an overly general query. If no value is provided, it is assumed that there 
			is no restriction on the number of records returned.</P>
		<P class="MsoNormal">&nbsp;</P>
		<P class="MsoNormal" style="TEXT-INDENT: 0cm">&nbsp;</P>
		<H1><A name="_Toc68083056">6<SPAN style="FONT: 7pt 'Times New Roman'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN>Example</A></H1>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">Example: The Sloan Digital Sky Survey data as hosted by MAST 
			at STScI (with no assertion that the metadata element values are actually 
			correct, though they are not unreasonable).</P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">Identity metadata</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Title&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN><SPAN style="FONT-SIZE: 10pt">Sloan</SPAN><SPAN style="FONT-SIZE: 10pt"> 
Digital Sky Survey</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">ShortName&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
SDSS</SPAN></P>
		<P class="MsoBodyText" style="TEXT-INDENT: 36pt"><SPAN style="FONT-SIZE: 10pt">Identifier&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
ivo://stsci.edu/mast/sdss</SPAN></P>
		<P class="MsoBodyText" style="TEXT-INDENT: 36pt"><SPAN style="FONT-SIZE: 10pt"></SPAN>&nbsp;</P>
		<P class="MsoBodyText">Curation metadata</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Publisher&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Space Telescope Science Institute/MAST</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">PublisherID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
ivo://stsci.edu/mast</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Creator&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN><SPAN style="FONT-SIZE: 10pt">Sloan</SPAN><SPAN style="FONT-SIZE: 10pt"> 
Digital Sky Survey Consortium</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Creator.Logo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
http://archive.stsci.edu/images/sdss_logo.gif</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Contributor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN><SPAN style="FONT-SIZE: 10pt">Sloan</SPAN><SPAN style="FONT-SIZE: 10pt"> 
Digital Sky Survey Consortium</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
2003-02-01</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Version&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
SDSS EDR</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">ReferenceURL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
http://archive.stsci.edu/sdss/index.html</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Contact.Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Archive Branch, Space Telescope Science Institute</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Contact.Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
archive@stsci.edu</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt"></SPAN>&nbsp;</P>
		<P class="MsoBodyText">General content metadata</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Subject&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN><SPAN style="FONT-SIZE: 10pt">galaxies, quasars, stars, CCD 
photometry,</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 108pt; TEXT-INDENT: 36pt"><SPAN style="FONT-SIZE: 10pt">spectroscopy, redshift, sky surveys</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Description&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
The Sloan Digital Sky Survey is using a dedicated </SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 144pt"><SPAN style="FONT-SIZE: 10pt">2.5 m telescope and a large format CCD camera to obtain 
images of over 10,000 square degrees of high Galactic latitude sky in five broad 
bands (u', g', r', i' and z', centered at 3540, 4770, 6230, 7630, and 9130 �, 
respectively). Medium resolution spectra will be obtained for approximately 
10<SUP>6</SUP> galaxies and 100,000 quasars. The early data release (EDR), on 
June 2001, includes searchable catalogs of images and spectra, images for 
display and scientific purpose in both 2-D FITS and JPEG formats, and spectra in 
both 1-D FITS and GIF formats. The EDR covers about 460 square degrees of sky. 
The next data releases will occur every 18 months or so.</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
2002AJ�.123..485S</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Survey, Catalog, EPOResource</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">ContentLevel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Research</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Relationship&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
mirror-of</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">RelationshipID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
ivo://sdss.org/sdss/edr</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt"></SPAN>&nbsp;</P>
		<P class="MsoBodyText">Collection and service content metadata</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Facility&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Apache Point Observatory, </SPAN><SPAN style="FONT-SIZE: 10pt">Sloan</SPAN><SPAN style="FONT-SIZE: 10pt"> 2.5-m Telescope</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Instrument&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Five-band clocked CCD camera</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Coverage.Spatial&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</SPAN><SPAN style="FONT-SIZE: 10pt">polygon (FK5, 145.17, 1.25, 235.9, 1.25, 
235.9, -1.25, 145.17, </SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 108pt; TEXT-INDENT: 36pt"><SPAN style="FONT-SIZE: 10pt">1.25) or polygon (FK5, 250.71, 66.29, 267.0, 66.29, 
267.0,</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 108pt; TEXT-INDENT: 36pt"><SPAN style="FONT-SIZE: 10pt">52.15, 250.71, 66.29) or polygon (FK5, 350.43, 1.17, 
360.0, </SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 108pt; TEXT-INDENT: 36pt"><SPAN style="FONT-SIZE: 10pt">1.17,360.0, -1.25, 350.43, -1.25) or polygon (FK5, 0.0, 
1.17, </SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 108pt; TEXT-INDENT: 36pt"><SPAN style="FONT-SIZE: 10pt">56.37, 1.17, 56.37, -1.25, 0.0, -1.25)</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Coverage.RegionOfRegard&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
0.0001</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Coverage.Spectral&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Optical</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Coverage.Spectral.Bandpass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
u�, g�, r�, i�, z�</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Coverage.Spectral.MinimumWavelength&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
400.e-9</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Coverage.Spectral.MaximumWavelength&nbsp; 
850.e-9</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Coverage.Temporal.StartTime&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
1999-12-25</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Coverage.Temporal.StopTime&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
2001-07-15</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Coverage.Depth&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
3.e-6</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Coverage.ObjectDensity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
6.e4</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Coverage.ObjectCount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
2.e7</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Coverage.SkyFraction&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
0.01</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Resolution.Spatial&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
0.00028</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Resolution.Spectral&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
5000</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Resolution.Temporal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
120</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">UCD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Not Provided</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
text/xml</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Rights&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Public</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt"></SPAN>&nbsp;</P>
		<P class="MsoBodyText">Data quality metadata</P>
		<P class="MsoBodyText"><SPAN style="FONT-SIZE: 10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
DataQuality&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
A</SPAN></P>
		<P class="MsoBodyText"><SPAN style="FONT-SIZE: 10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Uncertainty.Photometric&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
3.e-7</SPAN></P>
		<P class="MsoBodyText"><SPAN style="FONT-SIZE: 10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Uncertainty.Spatial&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
0.00003</SPAN></P>
		<P class="MsoBodyText"><SPAN style="FONT-SIZE: 10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Uncertainty.Spectral&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
1.e-11</SPAN></P>
		<P class="MsoBodyText"><SPAN style="FONT-SIZE: 10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Uncertainty.Temporal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
0.1</SPAN></P>
		<P class="MsoBodyText">&nbsp;</P>
		<P class="MsoBodyText">Service metadata</P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Service.InterfaceURL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp; http://archive.stsci.edu/sdss/catalog.html</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Service.BaseURL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp; http://archive.stsci.edu/cgi-bin/sdss/catalog</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Service.HTTPResultsMIMEType&nbsp; &nbsp;&nbsp; 
text/xml</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Service.StandardID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp; ivo://ivoa.net/Services/ConeSearch</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Service.StandardURL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;ivo://www.ivoa.net/Documents/REC/ConeSearch.html</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Service.MaxSearchRadius&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp; 0.2</SPAN></P>
		<P class="MsoBodyText" style="MARGIN-LEFT: 36pt"><SPAN style="FONT-SIZE: 10pt">Service.MaxReturnRecords&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp; 5000</SPAN></P>
<%
//Server.Execute("bot.aspx");
	Server.Execute("web/SkyFooter.aspx" + "?" + Parameters);
%>