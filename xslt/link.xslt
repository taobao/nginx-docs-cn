<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="img"> 
      <img src="{@href}">
         <xsl:apply-templates/>
      </img>
   </xsl:template>

   <xsl:template match="origin">

      <a>

         <xsl:attribute name="href">

            <xsl:call-template name="root">
               <xsl:with-param select="$ORIGIN" name="path"/>
            </xsl:call-template>

            <xsl:value-of select=" concat(substring-before($ORIGIN, '.xml'), '.html')"/>
         </xsl:attribute>

         <xsl:apply-templates/>

      </a>
   </xsl:template>

   <xsl:template match="link[@url]">

      <a href="{@url}">
         <xsl:choose>

            <xsl:when test="count(node()) != 0">
               <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="@url"/>
            </xsl:otherwise>
         </xsl:choose>

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

   <xsl:template match="links">

      <xsl:for-each select="link">
         <xsl:sort select="@id"/>

         <a href="{substring-before(@doc, '.xml')}.html#{@id}">
            <xsl:value-of select="@id"/>
         </a>

         <xsl:if test="count(../link[@id = current()/@id]) &gt; 1">

            <xsl:text> (</xsl:text>

            <xsl:value-of select="substring-before(substring-after(@doc, '/'), '.xml')"/>

            <xsl:text>)</xsl:text>
         </xsl:if>

         <br/>
      </xsl:for-each>
   </xsl:template>

</xsl:stylesheet>
