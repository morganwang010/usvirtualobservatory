//
// Copyright 2002-2011 - Universite de Strasbourg / Centre National de la
// Recherche Scientifique
//
// ------
//
// ASTRORES
//
// Author:  Andre Schaaff
// Address: Centre de Donnees astronomiques de Strasbourg
//          11 rue de l'Universite
//          67000 STRASBOURG
//          FRANCE
// Email:   question@simbad.u-strasbg.fr
//
// -------
//
// In accordance with the international conventions about intellectual
// property rights this software and associated documentation files
// (the "Software") is protected. The rightholder authorizes :
// the reproduction and representation as a private copy or for educational
// and research purposes outside any lucrative use,
// subject to the following conditions:
//
// The above copyright notice shall be included.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NON INFRINGEMENT,
// LOSS OF DATA, LOSS OF PROFIT, LOSS OF BARGAIN OR IMPOSSIBILITY
// TO USE SUCH SOFWARE. IN NO EVENT SHALL THE RIGHTHOLDER BE LIABLE
// FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
// THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// For any other exploitation contact the rightholder.
//
//                        -----------
//
// Conformement aux conventions internationales relatives aux droits de
// propriete intellectuelle ce logiciel et sa documentation sont proteges.
// Le titulaire des droits autorise :
// la reproduction et la representation a titre de copie privee ou des fins
// d'enseignement et de recherche et en dehors de toute utilisation lucrative.
// Cette autorisation est faite sous les conditions suivantes :
//
// La mention du copyright portee ci-dessus devra etre clairement indiquee.
//
// LE LOGICIEL EST LIVRE "EN L'ETAT", SANS GARANTIE D'AUCUNE SORTE.
// LE TITULAIRE DES DROITS NE SAURAIT, EN AUCUN CAS ETRE TENU CONTRACTUELLEMENT
// OU DELICTUELLEMENT POUR RESPONSABLE DES DOMMAGES DIRECTS OU INDIRECTS
// (Y COMPRIS ET A TITRE PUREMENT ILLUSTRATIF ET NON LIMITATIF,
// LA PRIVATION DE JOUISSANCE DU LOGICIEL, LA PERTE DE DONNEES,
// LE MANQUE A GAGNER OU AUGMENTATION DE COUTS ET DEPENSES, LES PERTES
// D'EXPLOITATION,LES PERTES DE MARCHES OU TOUTES ACTIONS EN CONTREFACON)
// POUVANT RESULTER DE L'UTILISATION, DE LA MAUVAISE UTILISATION
// OU DE L'IMPOSSIBILITE D'UTILISER LE LOGICIEL, ALORS MEME
// QU'IL AURAIT ETE AVISE DE LA POSSIBILITE DE SURVENANCE DE TELS DOMMAGES.
//
// Pour toute autre utilisation contactez le titulaire des droits.
//

package cds.astrores;

/**
 * <p>
 * ASTRORES markups and attributes
 * </p>
 * 
 * @author Andre Schaaff
 * @version 3.0 (kickoff 31 May 02)
 */

public interface Markups {

    // markups
    final static String VOTABLE = "VOTABLE";
    final String TABLE = "TABLE";
    final static String FIELD = "FIELD";
    final static String FIELDREF = "FIELDref"; /* new 1.1 */
    final static String TABLEDATA = "TABLEDATA";
    final static String DESCRIPTION = "DESCRIPTION";
    final static String DATA = "DATA";
    final static String RESOURCE = "RESOURCE";
    final static String PARAM = "PARAM";
    final static String PARAMREF = "PARAMref"; /* new 1.1 */
    final static String DEFINITIONS = "DEFINITIONS";
    final static String LINK = "LINK";
    final static String GROUP = "GROUP"; /* new 1.1 */
    final static String INFO = "INFO";
    final static String TR = "TR";
    final static String TD = "TD";
    final static String COOSYS = "COOSYS";
    final static String SYSTEM = "SYSTEM";
    final static String OPTION = "OPTION";
    final static String FITS = "FITS";
    final static String STREAM = "STREAM";
    final static String BINARY = "BINARY";
    final static String VALUES = "VALUES";

    // attributes
    final static String ARRAYSIZE = "arraysize";
    final static String DATATYPE = "datatype";
    final static String EPOCH = "epoch";
    final static String EQUINOX = "equinox";
    final static String INCLUSIVE = "inclusive";
    final static String MAX = "max";
    final static String MIN = "min";
    final static String NAME = "name";
    final static String PRECISION = "precision";
    final static String REF = "ref";
    final static String TYPE = "type";
    final static String UTYPE = "utype"; /* new 1.1 */
    final static String UCD = "ucd";
    final static String UNIT = "unit";
    final static String VALUE = "value";
    final static String WIDTH = "width";
    final static String ID = "ID";
    final static String CONTENTROLE = "content-role";
    final static String CONTENTTYPE = "content-type";
    final static String TITLE = "title";
    final static String HREF = "href";
    final static String GREF = "gref";
    final static String ACTION = "action";
    final static String VERSION = "version";
    final static String ENCODING = "encoding";
    final static String EXTNUM = "extnum";
    final static String NULL = "null";
    final static String INVALID = "invalid";
    final static String ACTUATE = "actuate";
    final static String EXPIRES = "expires";
    final static String RIGHTS = "rights";

}
