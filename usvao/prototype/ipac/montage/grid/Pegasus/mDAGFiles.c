/*************************************************************************

   Copyright (c) 2014 California Institute of Technology, Pasadena,
   California.    Based on Cooperative Agreement Number NCC5-626 between
   NASA and the California Institute of Technology. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions
   of this BSD 3-clause license are met:

   1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

   2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

   3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

   This software was developed at the Infrared Processing and Analysis
   Center (IPAC) and the Jet Propulsion Laboratory (JPL) by Bruce
   Berriman, John Good, Joseph Jacob, Daniel S. Katz, and Anastasia
   Laity.

*************************************************************************/



/* Module: mDAGFiles.c

Version  Developer        Date     Change
-------  ---------------  -------  -----------------------
1.3      Mei-Hui Su       09Mar05  Added more parameters (Survey,width,height)
1.2      Gurmeet Singh    23Nov04  Added extra parameters
1.1      Joe Jacob        21Oct03  Read from socket and write to file in 
                                   bigger chunks for efficiency.
1.0      John Good        16Oct03  Baseline code

*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <strings.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

#define MAXLEN 20000

char *url_encode(char *s);

int   tcp_connect(char *hostname, int port);

int debug = 0;


/********************************************/
/*                                          */
/* mDAGFiles -- Given a location on the sky */
/* and size, contact the DAG server and     */
/* get a ZIP file containing all the        */
/* DAG-related files.                       */
/*                                          */
/********************************************/

int main(int argc, char **argv)
{
   int    i, rc, socket, port, count;
  
   char   line      [MAXLEN];
   char   request   [MAXLEN];
   char   base      [MAXLEN];
   char   constraint[MAXLEN];
   char   server    [MAXLEN];

   char  *surveystr;
   char  *locstr;
   char  *widthstr;
   char  *heightstr;
   char  *suffix;
   char  *band;
   char  *contact;

   FILE  *fout;


   /* Get the location/size information */

   if(argc < 8)
   {
      printf("Usage: %s survey object|location width height band suffix zipfile contact (object/location must be a single argument string)\n", argv[0]);
      exit(0);
   }

   strcpy(server, "montage.jpl.nasa.gov");

   port = 80;

   /* strcpy(base, "/cgi-bin/DAG/nph-dag?"); */

   strcpy(base, "/cgi-bin/nph-mdag-cgi?");

   surveystr= url_encode(argv[1]);
   locstr = url_encode(argv[2]);

   widthstr = url_encode(argv[3]);
   heightstr = url_encode(argv[4]);

   band = url_encode(argv[5]);
   suffix = url_encode(argv[6]);
   contact = url_encode(argv[8]);

   sprintf(constraint, "survey=%s&loc=%s&width=%s&height=%s&band=%s&suffix=%s&contact=%s", surveystr, locstr, widthstr, heightstr, band, suffix, contact);

   fout = fopen(argv[7], "w+");

   if(fout == (FILE *)NULL)
   {
      printf("[struct stat=\"ERROR\", msg=\"Can't open output file %s\"]\n", 
         argv[5]);
      exit(0);
   }


   /* Connect to the port on the host we want */

   socket = tcp_connect(server, port);
  

   /* Send a request for the file we want */

   sprintf(request, "GET %s%s HTTP/1.0\r\nHOST: %s:%d\r\n\r\n",
      base, constraint, server, port);

   if(debug)
   {
      printf("DEBUG> request = [%s]\n", request);
      fflush(stdout);
   }

   send(socket, request, strlen(request), 0);


   /* Read the data coming back */

   count = 0;

   while(1)
   {
      for(i=0; i<MAXLEN; ++i)
         line[i] = '\0';

      rc = recv(socket, line, MAXLEN, 0);

      if(rc <= 0)
         break;

      fwrite (line, rc, 1, fout);

      fflush(fout);
 
      count += rc;
   }

   fclose(fout);

   if(count == 0)
      printf("[struct stat=\"ERROR\", msg=\"No data.  DAG file service probably timed out.\"]\n");
   else
      printf("[struct stat=\"OK\", count=\"%d\"]\n", count);

   fflush(stdout);

   exit(0);
}




/***********************************************/
/* This is the basic "make a connection" stuff */
/***********************************************/

int tcp_connect(char *hostname, int port)
{
   int                 sock_fd;
   struct hostent     *host;
   struct sockaddr_in  sin;


   if((host = gethostbyname(hostname)) == NULL) 
   {
      printf("[struct stat=\"ERROR\", msg=\"Couldn't find host %s\"]\n", hostname);
      fflush(stdout);
      return(0);
   }

   if((sock_fd = socket(AF_INET, SOCK_STREAM, 0)) < 0) 
   {
      printf("[struct stat=\"ERROR\", msg=\"Couldn't create socket()\"]\n");
      fflush(stdout);
      return(0);
   }

   sin.sin_family = AF_INET;
   sin.sin_port = htons(port);
   bcopy(host->h_addr, &sin.sin_addr, host->h_length);

   if(connect(sock_fd, (struct sockaddr *)&sin, sizeof(sin)) < 0)
   {
      printf("[struct stat=\"ERROR\", msg=\"%s: connect failed.\"]\n", hostname);
      fflush(stdout);
      return(0);
   }

   return sock_fd;
}



/**************************************/
/* This routine URL-encodes a string  */
/**************************************/

static unsigned char hexchars[] = "0123456789ABCDEF";

char *url_encode(char *s)
{
   int      len;
   register int i, j;
   unsigned char *str;

   len = strlen(s);

   str = (unsigned char *) malloc(3 * strlen(s) + 1);

   j = 0;

   for (i=0; i<len; ++i)
   {
      str[j] = (unsigned char) s[i];

      if (str[j] == ' ')
      {
         str[j] = '+';
      }
      else if ((str[j] < '0' && str[j] != '-' && str[j] != '.') ||
               (str[j] < 'A' && str[j] > '9')                   ||
               (str[j] > 'Z' && str[j] < 'a' && str[j] != '_')  ||
               (str[j] > 'z'))
      {
         str[j++] = '%';

         str[j++] = hexchars[(unsigned char) s[i] >> 4];

         str[j]   = hexchars[(unsigned char) s[i] & 15];
      }

      ++j;
   }

   str[j] = '\0';

   return ((char *) str);
}