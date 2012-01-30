<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="img"> 
      <img src="{@href}">
         <xsl:apply-templates/>
      </img>
   </xsl:template>

   <xsl:template match="link[@url]"> 
      <a href="{@url}">
         <xsl:apply-templates/>
      </a>
   </xsl:template>

   <xsl:template match="link[@id and not(@doc)]">

      <a href="#{@id}">
         <xsl:choose>

            <xsl:when test="count(node()) != 0">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="@id"/>
            </xsl:otherwise>
         </xsl:choose>

      </a>
   </xsl:template>

   <xsl:template match="link[@doc and not(@id)]">

      <a href="{substring-before(@doc, '.xml')}.html">
         <xsl:choose>

            <xsl:when test="count(node()) != 0">

               <xsl:apply-templates/>
            </xsl:when>

            <xsl:otherwise>

               <xsl:value-of select=" document(@doc)/article/@name | document(@doc)/module/@name"/>
            </xsl:otherwise>
         </xsl:choose>

      </a>
   </xsl:template>

   <xsl:template match="link[@id and @doc]">

      <a href="{substring-before(@doc, '.xml')}.html#{@id}">
         <xsl:choose>

            <xsl:when test="count(node()) != 0">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="@id"/>
            </xsl:otherwise>
         </xsl:choose>

      </a>
   </xsl:template>

</xsl:stylesheet>
