<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="a[starts-with(@href, '/')                 and string() = ''                 and contains(@href, '.xml')]">

      <a>

         <xsl:attribute name="href">
            <xsl:choose>

               <xsl:when test="starts-with(@href, $DIRNAME)">

                  <xsl:value-of select=" substring-after(document(concat($XML, @href))/article/@link                               |document(concat($XML, @href))/module/@link,                               $DIRNAME)"/>
               </xsl:when>

               <xsl:otherwise>

                  <xsl:value-of select=" concat($ROOT, document(concat($XML, @href))/article/@link                             |document(concat($XML, @href))/module/@link)"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:attribute>

         <xsl:value-of select="  document(concat($XML, @href))/article/@name        |document(concat($XML, @href))/module/@name"/>

      </a>
   </xsl:template>

   <xsl:template match="a[starts-with(@href, '/')                 and string()                 and contains(@href, '.xml')]">

      <a>

         <xsl:attribute name="href">
            <xsl:choose>

               <xsl:when test="starts-with(@href, $DIRNAME)">

                  <xsl:value-of select=" substring-after(document(concat($XML, @href))/article/@link                               |document(concat($XML, @href))/module/@link,                               $DIRNAME)"/>
               </xsl:when>

               <xsl:otherwise>

                  <xsl:value-of select=" concat($ROOT, document(concat($XML, @href))/article/@link                             |document(concat($XML, @href))/module/@link)"/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:attribute>

         <xsl:apply-templates/>

      </a>
   </xsl:template>

   <xsl:template match="a"> 
      <a href="{@href}">
         <xsl:apply-templates/>
      </a>
   </xsl:template>

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
         <xsl:apply-templates/>
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
