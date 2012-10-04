<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:output indent="no" version="4.0" encoding="utf-8" method="html"/>

   <xsl:strip-space elements="article section"/>

   <xsl:param select="'../xml'" name="XML"/>

   <xsl:param name="YEAR"/>

   <xsl:param name="ORIGIN"/>

   <xsl:param name="TRANS"/>

   <xsl:variable select="/article/@link | /module/@link" name="LINK"/>

   <xsl:variable select="/article/@lang | /module/@lang" name="LANG"/>

   <xsl:include href="dirname.xslt"/>

   <xsl:include href="link.xslt"/>

   <xsl:include href="style.xslt"/>

   <xsl:include href="body.xslt"/>

   <xsl:include href="menu.xslt"/>

   <xsl:include href="donate.xslt"/>

   <xsl:include href="directive.xslt"/>

   <xsl:include href="content.xslt"/>

   <xsl:include href="ga.xslt"/>

   <xsl:include href="versions.xslt"/>

   <xsl:template match="/article | /module">

      <html>

         <xsl:if test="@lang = 'he'">
            <xsl:attribute name="dir">
               <xsl:text>rtl</xsl:text>
            </xsl:attribute>
         </xsl:if>

         <head>

            <title>
               <xsl:value-of select="@name"/>
            </title>

            <xsl:call-template name="style">
               <xsl:with-param select="@lang" name="lang"/>
            </xsl:call-template>

            <xsl:call-template name="ga"/>

         </head>

         <xsl:call-template name="body">
            <xsl:with-param select="@lang" name="lang"/>
         </xsl:call-template>

      </html>
   </xsl:template>

</xsl:stylesheet>
