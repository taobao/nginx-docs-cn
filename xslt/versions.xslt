<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="development_version">

      <xsl:value-of select=" normalize-space(document(concat($XML, '/versions.xml'))                       /versions/development)"/>
   </xsl:template>

   <xsl:template match="stable_version">

      <xsl:value-of select=" normalize-space(document(concat($XML, '/versions.xml'))                       /versions/stable)"/>
   </xsl:template>

</xsl:stylesheet>
