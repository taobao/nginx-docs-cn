<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:output indent="no" version="4.0" encoding="utf-8" method="html"/>

   <xsl:strip-space elements="*"/>

   <xsl:param select="'../xml'" name="XML"/>

   <xsl:param name="YEAR"/>

   <xsl:variable select="'http://nginx.org'" name="SITE"/>

   <xsl:variable select="/news/@link" name="LINK"/>

   <xsl:include href="dirname.xslt"/>

   <xsl:include href="link.xslt"/>

   <xsl:include href="style.xslt"/>

   <xsl:include href="body.xslt"/>

   <xsl:include href="menu.xslt"/>

   <xsl:include href="ga.xslt"/>

   <xsl:include href="content.xslt"/>

   <xsl:template match="/news">

      <html>
         <head>

            <link rel="alternate" type="application/rss+xml" title="{@name}" href="{$SITE}/index.rss"/>

            <title>
               <xsl:value-of select="@name"/>
               <xsl:if test="$YEAR">
                  <xsl:text>: </xsl:text>
                  <xsl:value-of select="$YEAR"/>
               </xsl:if>
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

   <xsl:template match="event">

      <xsl:variable name="year">
         <xsl:value-of select="substring(../event[position()=1]/@date, 1, 4)"/>
      </xsl:variable>

      <xsl:variable name="y">
         <xsl:value-of select="substring(@date, 1, 4)"/>
      </xsl:variable>

      <xsl:if test="position() = 1">

         <xsl:text disable-output-escaping="yes">
            &lt;table class="news"&gt;
        </xsl:text>
      </xsl:if>

      <xsl:if test="(not($YEAR) and ($year = $y or position() &lt; 11)) or $YEAR=$y">

         <tr>

            <td class="date">

               <a name="{@date}"/>
               <xsl:value-of select="@date"/>

            </td>

            <td>
               <xsl:apply-templates select="para"/>
            </td>

         </tr>
      </xsl:if>

      <xsl:if test="position() = last()">

         <xsl:text disable-output-escaping="yes">
            &lt;/table&gt;
        </xsl:text>
      </xsl:if>
   </xsl:template>

</xsl:stylesheet>
