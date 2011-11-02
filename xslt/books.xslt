<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:output indent="no" version="4.0" encoding="utf-8" method="html"/>

   <xsl:strip-space elements="*"/>

   <xsl:param select="'../xml'" name="XML"/>

   <xsl:param name="YEAR"/>

   <xsl:variable select="/article/@link" name="LINK"/>

   <xsl:include href="dirname.xslt"/>

   <xsl:include href="link.xslt"/>

   <xsl:include href="style.xslt"/>

   <xsl:include href="body.xslt"/>

   <xsl:include href="menu.xslt"/>

   <xsl:include href="content.xslt"/>

   <xsl:template match="/article">

      <html>
         <head>

            <title>
               <xsl:value-of select="@name"/>
            </title>

            <xsl:call-template name="style">
               <xsl:with-param select="@lang" name="lang"/>
            </xsl:call-template>

         </head>

         <xsl:call-template name="body">
            <xsl:with-param select="@lang" name="lang"/>
         </xsl:call-template>

      </html>
   </xsl:template>

   <xsl:template match="book">

      <table>
         <tr>

            <td bgcolor="#EEEEEE">

               <a href="{@link}">

                  <img src="{@cover}" alt="" style="padding: 2pt;" border="0"/>

               </a>

            </td>

            <td>

               <xsl:text>title: </xsl:text> 
               <a href="{@link}">
                  <xsl:value-of select="@title"/>
               </a>
               <br/>

               <xsl:text>author: </xsl:text>
               <xsl:choose>

                  <xsl:when test="@site"> 
                     <a href="{@site}">
                        <xsl:value-of select="@author"/>
                     </a>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="@author"/>
                  </xsl:otherwise>
               </xsl:choose>
               <br/>

               <xsl:if test="@translator">
                  <xsl:text>translator: </xsl:text>
                  <xsl:value-of select="@translator"/>
                  <br/>
               </xsl:if>

               <xsl:if test="@publisher">
                  <xsl:text>publisher: </xsl:text>
                  <xsl:value-of select="@publisher"/>
                  <br/>
               </xsl:if>

               <xsl:text>language: </xsl:text>
               <xsl:value-of select="@lang"/>

            </td>

         </tr>
      </table>
   </xsl:template>

</xsl:stylesheet>
