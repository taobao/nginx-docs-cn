<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:include href="ga.xslt"/>

   <xsl:output indent="no" version="4.0" encoding="utf-8" method="html"/>

   <xsl:strip-space elements="*"/>

   <xsl:param select="'../xml'" name="XML"/>

   <xsl:template match="/error">

      <html>
         <head>
            <title>
               <xsl:value-of select="@name"/>
            </title>

            <style type="text/css">
               <xsl:value-of select=" normalize-space('         body  { font-family:  Georgia, serif; }         ')"/>

            </style>

            <xsl:call-template name="ga"/>

         </head>

         <body>

            <table width="100%">

               <tr>

                  <td width="70%">
                     <center>
                        <h1>
                           <xsl:value-of select="@name"/>
                        </h1>
                     </center>
                  </td>

                  <td rowspan="2" align="right" valign="top">

                     <img src="/nginx.gif" alt="nginx"/>
                     <br/>

                     <br/>

                     <br/>

                     <xsl:apply-templates select="document(concat($XML, '/menu.xml'))                          /menus/menu[@lang = current()/@lang]/item"/>

                  </td>

               </tr>

            </table>

         </body>

      </html>
   </xsl:template>

   <xsl:template match="menu/item">

      <a href="{@href}">
         <xsl:value-of select=" normalize-space(text())"/>
      </a>
      <br/>
   </xsl:template>

   <xsl:template match="menu/item[not(@href)]">

      <xsl:value-of select=" normalize-space(text())"/> 
      <br/>
   </xsl:template>

</xsl:stylesheet>
