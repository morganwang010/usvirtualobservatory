package Nsa::Welcome_Constants_Commented;

our $PAGE_OPEN = qq|
<!-- ===============================================================
  -  CONFIGURE:
  -     Two sections below are delimited by comments like this one
  -     indicating where you might edit to plug this page into the
  -     application (portal) server:
  -
  -       o  VO login Area
  -       o  Login status
  -
  -     Look for the tag, "CONFIGURE", to find specific places to edit.
  -
  - ================================================================ -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
<head>
  <script language="JavaScript1.2" src="resize.js" type="text/javascript"></script>
  <title>NOAO Science Archive Search Form</title>
  <link rel="stylesheet" href="nsa.css" type="text/css">
  <style type="text/css" media="all">\@import "nsa_form.css";</style>
</head>
<body>
<div id="banner"> <img src="nsa_tucson.gif" alt="" align="left"
 height="98" width="210">
<img src="title_bg.jpg" alt="" align="left" height="92" width="498">
<h1>&nbsp;&nbsp;NOAO Science Archive</h1>
</div>
<br clear="all">
|;

our $PAGE_HEAD = qq|
<!-- <br> -->
<div id="bread">
<p>
<a href="http://archive.noao.edu/nsa/" title="Home Page">Home</a>
&gt; <strong>NOAO Science Archive Search Form</strong>
</p>
</div>
<div id="menu">
<a href="whatsnew.html">What's New</a><br>
<a href="nsa_form.html">Search Form</a><br>
<a href="http://archivo.ctio.noao.edu/nsa/">NSA La Serena</a><br>
<a href="holdings.html">Archive Contents</a><br>
<a href="http://www.noao.edu">NOAO Home</a><br>
<a href="http://www.ctio.noao.edu">CTIO Home</a><br>
<!--
<a href="#">Archive Status</a><br>
-->
<br>

<!-- ==================================================================
  -  VO login Area
  -->
<div id="login">
<center><img src="IVOAlogo.gif" width="80" height="44"><br>
<font size="-2"><em>This is an IVOA-compliant portal</em></font></center>
<form name="vologin">
|;

our $PAGE_LOGIN_SIDEBAR = qq|
<font size="-1">
Some portal functions require registration. If you have a VO login,
select your home project
<select name="voproj" onChange="updloginurl();">
<!--
  -  CONFIGURE: NVO login page URL
  -    the first option is for the NVO login page; the other options are just
  -    dummies.
  -->
<!--  <option selected value="/uas/login.jsp?portalName=the%20NOAO%20Science%20Portal">NVO</option>  -->
  <option selected value="/protected/welcome">NVO</option>
  <option value="http://login.astrogrid.org/uas/login.jsp">AstroGrid</option>
  <option value="http://login.jvo.org/uas/login.jsp">JVO</option>
  <option value="http://login.eurovo.org/uas/login.jsp">Euro-VO</option>
</select>
and then click here to
<script type="text/javascript">
var sel = document.vologin.voproj;

function updloginurl() {
   var anc = document.getElementById("loginlink");
   anc.href = sel.options[sel.selectedIndex].value;
}

document.write('<a  ID="loginlink" name="vologin" href="' +
               sel.options[sel.selectedIndex].value +
               '">login</a>');
</script>; otherwise, <a href="http://sky1.ncsa.uiuc.edu:8090/register.jsp">create a new logon</a>.<br>
<!--
  -  Portal help documentation URL
  --> 
<center><a href="faq.html#vologon">About VO logons</a>.</center>
</font>
</form>
</div>
<!-- ===================================================================== -->
|;

our $PAGE_REST = qq|
<br>
Help
<div class="submenu"><a href="nsa_help.html" target="NSAhelp">General</a><br>
<a href="nsa_help.html#outputInfo" target="NSAhelp">Output</a><br>
</div>
<br>
<a href="acknowledgement.html">Acknowledgement</a><br>
<a href="condOfUse.html">Conditions of Use</a><br>
<!--
<a href="http://www.noao.edu/gateway/surveys/programs.html">Survey Programs</a><br>
<a href="#">FAQ</a><br>
-->
<br>
Related Sites
<div class="submenu"><a href="http://cadcwww.dao.nrc.ca/">CADC</a><br>
<a href="http://archive.stsci.edu/index.html">STScI/MAST</a><br>
<a href="http://asc.harvard.edu/cda/">Chandra</a><br>
<a href="http://irsa.ipac.caltech.edu/">IRSA</a><br>
<a href="http://heasarc.gsfc.nasa.gov/">HEASARC</a><br>
<a href="http://nssdc.gsfc.nasa.gov/astro/">NSSDC</a><br>
<a href="http://nedwww.ipac.caltech.edu/">NED</a><br>
<a href="http://cdsweb.u-strasbg.fr/Simbad.html">SIMBAD</a><br>
</div>
</div>

<div id="content">
<h2>
<center><em>Multi-Survey Search Form</em></center>

<!-- =================================================================
  -  CONFIGURE: Login status
  -    If possible, plug in a test that determines if the portal has
  -    credentials for the user.
  -->
|;

our $PAGE_CLOSE = qq|
<!-- ================================================================ -->

</h2>
<h2>
<center><em><a href="holdings.html">Current Archive Contents</a></em></center>
</h2>
<!--
<h2 class="top">Search Options</h2>
-->
<form action="./search_output.php" method="get">
  <div class="field"> <input name="Submit" value="Search" type="submit">
  <input name="Clear" value="Reset to Defaults" type="submit"> <input
 name="Cart" value="View Cart" type="submit"><!--
   <input type="reset" name="Reset" value="Reset">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: Verdana;">
-->
  <a href="nsa_help.html" target="NSAhelp">Help</a>
  </div>
  <fieldset> <legend>Object Resolver and Coordinates</legend>
  <table border="0" cellpadding="3" cellspacing="0" width="100%">
    <tbody>
      <tr>
        <th>
        <table border="0" cellpadding="0" cellspacing="0" width="95%">
          <tbody>
            <tr>
              <td valign="top"><a href="nsa_help.html#objectName"
 target="NSAhelp">Object Name</a>&nbsp;&nbsp;&nbsp;<font color="gray"
 size="-1"><em>(e.g., ngc6822)</em></font></td>
              <td align="center" valign="top"><a
 href="nsa_help.html#resolver" target="NSAhelp">Resolver</a></td>
              <td valign="top">&nbsp;</td>
            </tr>
            <tr>
              <td valign="top"><input name="objectName" size="20"
 id="objectName" value="" type="text"></td>
              <td align="center" valign="top"><input name="resolver"
 value="simbad" id="simbad" type="radio">SIMBAD <input name="resolver"
 value="ned" id="ned" type="radio">NED <br>
              <input name="resolver" value="donot" id="donot" checked="checked"
 type="radio">Do Not Resolve</td>
              <th valign="top"> <input name="resolveButton"
 value="Find Coordinates" type="submit"> </th>
            </tr>
          </tbody>
        </table>
        </th>
      </tr>
    </tbody>
  </table>
<!--
   </fieldset>
<br>

   <fieldset>

   <legend>Coordinate Parameters</legend>
-->
  <table border="0" cellpadding="15" width="95%">
    <tbody>
      <tr>
        <td valign="top">
        <label for="ra"><a href="nsa_help.html#ra" target="NSAhelp">RA</a>&nbsp;&nbsp;&nbsp;<font
 color="gray" size="-1"><em>(e.g., hh:mm:ss.ss)</em></font></label><br>
        <input name="ra" size="12" id="ra" value="" type="text">
        </td>
        <td valign="top">
        <label for="dec"><a href="nsa_help.html#ra" target="NSAhelp">Dec</a>&nbsp;&nbsp;<font
 color="gray" size="-1"><em>(e.g., &plusmn;dd:mm:ss.ss)</em></font></label><br>
        <input name="dec" size="12" id="dec" value="" type="text">
        </td>
        <td valign="top">
        <label for="width"><a href="nsa_help.html#width"
 target="NSAhelp">Width</a>&nbsp;<font color="gray" size="-1"><em>(arcmin)</em></font></label><br>
        <input name="width" size="8" id="width" value="" type="text">
        </td>
<!-- COMMENT OUT FOR NOW
<td valign="top">
<label for="equinox"><a href="nsa_help.html#equinox" target=NSAhelp>Equinox</a></label><br>
<select name="equinox" id="equinox">
     <option value="J2000"  >J2000 </option>
     <option value="ICRS"  >ICRS</option>
     <option value="B1950"  >B1950 </option>
</select>
</td>
-->
      </tr>
    </tbody>
  </table>
  </fieldset>
  <br>
  <fieldset> <legend>Additional Parameters</legend>
  <table border="0" cellpadding="15">
    <tbody>
      <tr>
<!--
<td valign="top">
<label for="objectName"><a href="nsa_help.html#objectName" target=NSAhelp>Object</a></label><br>
<input type="text" name="objectName" size="20" id="objectName" value="">
</td>
-->
        <td valign="top"><label for="obsDate"><a
 href="nsa_help.html#obsDate" target="NSAhelp">Observation Date</a>&nbsp;&nbsp;&nbsp;<font
 color="gray" size="-1"><em>(e.g., &lt;5 Apr 1998)</em></font></label><br>
        <input name="obsDate" size="20" id="obsDate" value=""
 type="text">
        </td>
        <td valign="top">
        <label for="photoDepth"><a href="nsa_help.html#photoDepth"
 target="NSAhelp">Photometric Depth</a>&nbsp;&nbsp;<font color="gray"
 size="-1"><em>(e.g., &lt;23.4)</em></font></label><br>
        <input name="photoDepth" size="15" id="photoDepth" value=""
 type="text">
        </td>
      </tr>
    </tbody>
  </table>
  <table border="0" cellpadding="15">
    <tbody>
      <tr>
        <td valign="top">
        <label for="survey"><a href="nsa_help.html#survey"
 target="NSAhelp">Survey</a></label><br>
        <select multiple="multiple" name="survey[]" id="survey" size="4"
 align="top">
        <option value="ndwfs">NOAO Deep Wide Field</option>
        <option value="stellarllg">Resolved Stellar Content of Local
Group</option>
        <option value="deeprange">Deeprange</option>
        <option value="tyson">Deep Lens</option>
        <option value="suntzeff">The w Project</option>
        <option value="nfp">Fundamental Plane</option>
        <option value="bally">Deep Imaging of Nearby Star-Forming Clouds</option>
        <option value="meurer">Star Formation in H I Selected Galaxies</option>
        <option value="stubbs">LMC Microlensing</option>
        <option value="des">Deep Ecliptic</option>
        <option value="champlane">Chandra Multiwavelength Plane</option>
        <option value="fls">First Look Survey</option>
        </select>
        </td>
        <td valign="top">
        <label for="filter"><a href="nsa_help.html#filter"
 target="NSAhelp">Filter</a></label><br>
        <select multiple="multiple" name="filter[]" id="filter" size="4"
 align="top">
        <option value="bw_k1025">Bw NDWFS k1025</option>
        <option value="i_k1005">I Nearly-Mould k1005</option>
        <option value="u_k1001">U k1001</option>
        <option value="b_k1002">B Harris k1002</option>
        <option value="v_k1003">V Harris k1003</option>
        <option value="r_k1004">R Harris k1004</option>
        <option value="k_barr_38">K Barr 38mm</option>
        <option value="ha_c6009">ha H-alpha c6009</option>
        <option value="ha_k1009">ha H-alpha k1009</option>
        <option value="ha16_k1">ha16 H-alpha+16nm k1</option>
        <option value="oon_k1014">O3 OIII N2 k1014</option>
        <option value="u">U</option>
        <option value="b">B</option>
        <option value="v">V</option>
        <option value="r">R</option>
        <option value="i">I</option>
        <option value="ha">Ha</option>
        <option value="oIII">O III</option>
        <option value="_6563_75">6563/75</option>
        <option value="_6731_75">6731/75</option>
        <option value="z_k1020">z SDSS k1020</option>
        <option value="i_k1019">i SDSS k1019</option>
        <option value="sloanz">Sloanz</option>
        <option value="ha16">Halpha+16</option>
        <option value="i_mosaic">I Mosaic</option>
        <option value="ha_mosaic">Halpha Mosaic</option>
        <option value="o_mosaic_n">OIII Mosaic N2</option>
        <option value="u_mosaic_o">U Mosaic Omega</option>
        <option value="b_mosaic_o">B Mosaic Omega</option>
        <option value="v_mosaic_o">V Mosaic Omega</option>
        <option value="r_mosaic_o">R Mosaic Omega</option>
        <option value="i_mosaic_o">I Mosaic Omega</option>
        <option value="v_c6026">V Harris c6026</option>
        <option value="r_c6004">R Harris c6004</option>
        <option value="i_c6005">I c6005</option>
        <option value="b_mosaic">B Mosaic</option>
        <option value="r_mosaic">R Mosaic</option>
        <option value="ha_16_mosaic">Halpha+16 Mosaic</option>
        <option value="ha_6568_30">H-alpha 6568/95</option>
        <option value="_6850_95">H-alpha 6850/95</option>
        <option value="bern_vr">Bernstein VR</option>
        <option value="vr_bern_k1040">VR Bernstein k1040&gt;</option>
        <option value="sloan_r">Sloan r</option>
        <option value="vr">VR</option>
        <option value="white_mosaic">White Mosaic</option>
        <option value="r_prime_mosaic">r prime Mosaic</option>
        </select>
        </td>
      </tr>
    </tbody>
  </table>
<!-- POSSIBLE ADDITIONAL SEARCH PARAMETERS FOR NEXT VERSION
<td valign="top">
<label for="fwhm"><a href="nsa_help.html#fwhm" target=NSAhelp>FWHM</a>&nbsp;<font color=gray><em>(arcmin)</em></font></label><br>
<input type="text" name="fwhm" size="8" id="fwhm" value="">
</td>
</tr>
-->
  <br>
  </fieldset>
  <br>
  <div class="field"> <input name="Submit" value="Search" type="submit">
  <input name="Clear" value="Reset to Defaults" type="submit"> <input
 name="Cart" value="View Cart" type="submit"><!--
   <input type="reset" name="Reset" value="Reset">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: Verdana;"><a href="nsa_help.html" target=NSAhelp>Help</a></span>
-->
  <a href="nsa_help.html" target="NSAhelp">Help</a>
  </div>
</form>
</div>
<div id="footer">
<table align="left" width="100%">
  <tbody>
    <tr align="top">
      <td align="left" nowrap="nowrap" valign="top"> Last Modified: 20
June 2005 </td>
      <td align="right" nowrap="nowrap" valign="top"> <a
 href="mailto:archive\@noao.edu"> <em>archive\@noao.edu</em></a> </td>
    </tr>
  </tbody>
</table>
<br clear="all">
</div>
</body>
</html>
|;

sub getOpen         { return $PAGE_OPEN; }
sub getHead         { return $PAGE_PAGE_HEAD; }
sub getLoginSidebar { return $PAGE_LOGIN_SIDEBAR; }
sub getRest         { return $PAGE_REST; }
sub getClose        { return $PAGE_CLOSE; }

1;