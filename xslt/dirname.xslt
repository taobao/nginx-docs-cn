<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:variable name="DIRNAME">
      <xsl:call-template name="dirname">
         <xsl:with-param select="$LINK" name="path"/>
      </xsl:call-template>
   </xsl:variable>

   <xsl:template name="dirname">
      <xsl:param name="path"/>

      <xsl:if test="contains($path, '/')">

         <xsl:value-of select=" substring-before($path, '/')"/>

         <xsl:text>/</xsl:text>

         <xsl:call-template name="dirname">
            <xsl:with-param select="substring-after($path, '/')" name="path"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

   <xsl:variable name="ROOT">
      <xsl:call-template name="root">
         <xsl:with-param name="path">
            <xsl:value-of select=" substring($DIRNAME, 2)"/>
         </xsl:with-param>
      </xsl:call-template>
   </xsl:variable>

   <xsl:template name="root">
      <xsl:param name="path"/>

      <xsl:if test="contains($path, '/')">

         <xsl:text>..</xsl:text>

         <xsl:if test="substring-after($path, '/')">

            <xsl:text>/</xsl:text>

            <xsl:call-template name="root">
               <xsl:with-param select="substring-after($path, '/')" name="path"/>
            </xsl:call-template>
         </xsl:if>
      </xsl:if>
   </xsl:template>

</xsl:stylesheet>
