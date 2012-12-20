<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:param select="'development'" name="VERSION"/>

   <xsl:output method="text"/>

   <xsl:template match="/versions">
      <xsl:apply-templates select="download[@tag=$VERSION][1]/item[1]/@ver"/>
   </xsl:template>

</xsl:stylesheet>
