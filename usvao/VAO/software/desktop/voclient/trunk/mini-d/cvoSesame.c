/**
 *  IMPSESAME.C  -- Interface to the Sesame name resolver implementation.
 *
 *  @section DESCRIPTION
 *
 *  Sesame Name Resolver Interface:
 *  -------------------------------
 *
 *          sr = cvo_nameResolver  (target)
 *      pos_str = cvo_resolverPos  (sr)
 *         radeg = cvo_resolverRA  (sr)
 *       decdeg = cvo_resolverDEC  (sr)
 *     ra_err = cvo_resolverRAErr  (sr)
 *   dec_err = cvo_resolverDECErr  (sr)
 *    typ_str = cvo_resolverOtype  (sr)
 *
 *	Client programs may be written in any language that can interface to
 *  C code.  Sample programs using the interface are provided as is a SWIG
 *  interface definition file.  This inferface is based closely on the DAL
 *  client code produced for the 2005 NVOSS, as that interface evolves 
 * 
 * 
 *  @file  	impSesame.c
 *  @author  	Michael Fitzpatrick
 *  @version	December 2013
 *
 *************************************************************************
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <dirent.h>


#define _VOCLIENT_LIB_
#include "VOClient.h"
#include "vocServer.h"


#define MAX_OBJECTS		128
#define SZ_TARGET		128


/**
 *  @struct Object
 *
 *  Structure for the object being queried.
 */
typedef struct {
    char    target[SZ_TARGET];		/* target name			*/
    char    hms_pos[SZ_TARGET];		/* sexagesimal position		*/
    double  ra, dec;			/* decimal degrees position	*/
    double  era, edec;			/* decimal degrees error	*/
    char    type[SZ_TARGET];		/* object type			*/
} Object, *ObjectPtr;


/**
 *  Public procedures
 */
extern handle_t  svr_newHandle (void *p);   /* daemon server handles 	*/
extern void     *svr_H2P (handle_t h);
extern handle_t  svr_P2H (void *p);



/*  @internal
 *
 *  The runtime cache is implemented as a circular array of MAX_OBJECTS.
 *  We first check to see if the requested object is in the runtime cache,
 *  then look on the disk cache for the information.  If not found we
 *  query the server and store the result.  The Sesame handle returned will
 *  be the negative of the index in the runtime cache, i.e "-(1+sr)".
 */
extern Object clientCache[];		/* runtime client cache		*/
extern int    cacheTop;

extern VOClient *vo; 			/* Interface runtime struct	*/


/*  Public procedures.
 */
extern Sesame   voc_isCachedObject (char *target);
extern Sesame   voc_cacheObject (Sesame sr, char *target);

/*  Private procedures.
 */
static char *findXMLElement (char *xml, char *el);



/*****************************************************************************/

/**
 *  NAMERESOLVER -- Query the CDS Sesame service to resolve the target name
 *  to coordinates.  The query is done when creating the Sesame object, 
 *  thereafter we simply query the object data.
 * 
 *  @brief	Query the CDS Sesame name resolver service.
 *  @fn		handle = cvo_nameResolver (char *name)
 *
 *  @param  target  	name of target to be resolved
 *  @returns		Sesame  Sesame object handle
 */
    
#define SESAME_URL    "http://cdsweb.u-strasbg.fr/cgi-bin/nph-sesame/-oxp/SNVA?"

Sesame
cvo_nameResolver (char *target)
{
    Resolver *sesame = (Resolver *) calloc (1, sizeof (Resolver));
    char  url[SZ_URL], *data = NULL;
    Sesame   sr = (Sesame) VOC_NULL;
    char *sesameURL = SESAME_URL;


    /*  Form the URL and get the result.
     */
    memset (url, 0, SZ_URL);
    sprintf (url, "%s%s", sesameURL, target);
    data = svr_getURL (url);

    if (strstr (data, "<jadeg>") == 0) {
        strcpy (sesame->target, target);
        strcpy (sesame->oname, target);
        sesame->ra  = atof (findXMLElement (data, "<jradeg>"));
        sesame->dec = atof (findXMLElement (data, "<jdedeg>"));
        sesame->raERR  = atof (findXMLElement (data, "<errRAmas>"));
        sesame->decERR = atof (findXMLElement (data, "<errDEmas>"));
        strcpy (sesame->pos, findXMLElement (data, "<jpos>"));
        strcpy (sesame->otype, findXMLElement (data, "<otype>"));
    } else
        return (sr);


    /*  Create a handle for the result struct.
     */
    sr = svr_newHandle ((void *) sesame);

    /*  Cache the object for later use.
     */
    (void) voc_cacheObject (sr, target);

    return (sr);
}


/**
 *  CVO_RESOLVERPOS --  Return a string containing the (ra,dec) position as
 *  sexagesimal strings. 
 *
 *  @brief	Return the (ra,dec) position for the object
 *  @fn		str = _resolverPos (Sesame sr)
 *
 *  @param  sr  	handle to previus query return
 *  @returns		string containing (ra,dec) position
 */
char *
cvo_resolverPos (Sesame sr)
{
    if (sr < 0)
        return ( strdup(clientCache[-(1+sr)].hms_pos) );
    else
        return ( ((Resolver *) svr_H2P (sr))->pos );
}


/**
 *  CVO_RESOLVEROTYPE --  Return a string containing the object description.
 *
 *  @brief	Return a string containing the object type description.
 *  @fn		str = _resolverOtype (Sesame sr)
 *
 *  @param  sr  	handle to previus query return
 *  @returns		string to object type description
 */
char *
cvo_resolverOtype (Sesame sr)
{
    if (sr < 0)
        return ( strdup (clientCache[-(1+sr)].type) );
    else
        return ( ((Resolver *) svr_H2P (sr))->otype );
}


/**
 *  CVO_RESOLVERRA --  Return the RA as a double precision value.
 *
 *  @brief	Return the RA as a double precision value.
 *  @fn		str = _resolverRA (Sesame sr)
 *
 *  @param  sr  	handle to previus query return
 *  @returns		object RA (decimal degrees)
 */
double      
cvo_resolverRA (Sesame sr)
{
    if (sr < 0)
        return ( clientCache[-(1+sr)].ra );
    else
        return ( ((Resolver *) svr_H2P (sr))->ra );
}


/**
 *  CVO_RESOLVERRAERR --  Return the RA error as a double precision value.
 *
 *  @brief	Return the RA error as a double precision value.
 *  @fn		str = _resolverRAErr (Sesame sr)
 *
 *  @param  sr  	handle to previus query return
 *  @returns		object RA error (decimal degrees)
 */
double      
cvo_resolverRAErr (Sesame sr)
{
    if (sr < 0)
        return ( clientCache[-(1+sr)].era );
    else
        return ( ((Resolver *) svr_H2P (sr))->raERR );
}


/**
 *  CVO_RESOLVERDEC --  Return the DEC as a double precision value.
 *
 *  @brief	Return the DEC as a double precision value.
 *  @fn		str = _resolverDEC (Sesame sr)
 *
 *  @param  sr  	handle to previus query return
 *  @returns		object Declination (decimal degrees)
 */
double      
cvo_resolverDEC (Sesame sr)
{
    if (sr < 0)
        return ( clientCache[-(1+sr)].dec );
    else
        return ( ((Resolver *) svr_H2P (sr))->dec );
}


/**
 *  CVO_RESOLVERDECERR --  Return the Dec error as a double precision value.
 *
 *  @brief	Return the Dec error as a double precision value.
 *  @fn		str = _resolverDECErr (Sesame sr)
 *
 *  @param  sr  	handle to previus query return
 *  @returns		object DEC error (decimal degrees)
 */
double      
cvo_resolverDECErr (Sesame sr)
{
    if (sr < 0)
        return ( clientCache[-(1+sr)].edec );
    else
        return ( ((Resolver *) svr_H2P (sr))->decERR );
}




/*****************************************************************************/
/*****  PRIVATE METHODS
 * ******/
/*****************************************************************************/

/**
 *  FINDXMLELEMENT -- Find the first or only occurance of an element in an
 *  XML file and return the result as a character string.
 */
static char *
findXMLElement (char *xml, char *el)
{
    static char  value[4096];
    char *v = strstr (xml, el);

    memset (value, 0, 4096);
    if (v) {
        char *ip, *op;

        op = value;
        for (ip=(v+strlen (el)); *ip != '<'; ip++)
            *op++ = *ip;

        return (value);
    } else
        return ("0.0");
}

