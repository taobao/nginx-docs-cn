<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="download">

      <xsl:variable select="@last" name="last"/>

      <xsl:for-each select="document(concat($XML, '/versions.xml'))                 /versions/download[@tag = current()/@tag]">

         <table width="100%">

            <xsl:apply-templates select="item[position() &lt;= $last]"/>

         </table>
      </xsl:for-each>
   </xsl:template>

   <xsl:template match="download/item">

      <tr>

         <td width="20%">

            <xsl:if test="position() = 1">

               <a>

                  <xsl:attribute name="href">

                     <xsl:text>/</xsl:text>
                     <xsl:value-of select="$LANG"/>
                     <xsl:text>/CHANGES</xsl:text>

                     <xsl:if test="$LANG != 'en'">
                        <xsl:text>.</xsl:text>
                        <xsl:value-of select="$LANG"/>
                     </xsl:if>

                     <xsl:if test="../@changes != ''">
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="../@changes"/>
                     </xsl:if>
                  </xsl:attribute>

                  <xsl:text>CHANGES</xsl:text>

                  <xsl:if test="$LANG != 'en'">
                     <xsl:text>.</xsl:text>
                     <xsl:value-of select="$LANG"/>
                  </xsl:if>

                  <xsl:if test="../@changes != ''">
                     <xsl:text>-</xsl:text>
                     <xsl:value-of select="../@changes"/>
                  </xsl:if>

               </a>
            </xsl:if>

         </td>

         <td width="20%">

            <a>

               <xsl:attribute name="href">

                  <xsl:text>/download/nginx-</xsl:text>
                  <xsl:value-of select="@ver"/>
                  <xsl:text>.tar.gz</xsl:text>
               </xsl:attribute>

               <xsl:text>nginx-</xsl:text>
               <xsl:value-of select="@ver"/>

            </a>

            <xsl:if test="@pgp = 'yes'">

               <xsl:text>  </xsl:text>

               <a>

                  <xsl:attribute name="href">

                     <xsl:text>/download/nginx-</xsl:text>
                     <xsl:value-of select="@ver"/>
                     <xsl:text>.tar.gz.asc</xsl:text>
                  </xsl:attribute>

                  <xsl:text>pgp</xsl:text>

               </a>
            </xsl:if>

         </td>

         <td>

            <xsl:if test="@win= 'yes'">

               <a>

                  <xsl:attribute name="href">

                     <xsl:text>/download/nginx-</xsl:text>
                     <xsl:value-of select="@ver"/>
                     <xsl:text>.zip</xsl:text>
                  </xsl:attribute>

                  <xsl:text>nginx/Windows-</xsl:text>
                  <xsl:value-of select="@ver"/>

               </a>

               <xsl:if test="@pgp = 'yes'">

                  <xsl:text>  </xsl:text>

                  <a>

                     <xsl:attribute name="href">

                        <xsl:text>/download/nginx-</xsl:text>
                        <xsl:value-of select="@ver"/>
                        <xsl:text>.zip.asc</xsl:text>
                     </xsl:attribute>

                     <xsl:text>pgp</xsl:text>

                  </a>
               </xsl:if>
            </xsl:if>

         </td>

      </tr>
   </xsl:template>

</xsl:stylesheet>
