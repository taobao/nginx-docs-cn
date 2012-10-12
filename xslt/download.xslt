<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="download"> 
      <table width="100%">
         <xsl:apply-templates select="item"/>
      </table>
   </xsl:template>

   <xsl:template match="download/item[position() &lt;= ../@last]">

      <tr>

         <td width="20%">

            <xsl:if test="position() = 1">

               <a>

                  <xsl:attribute name="href">
                     <xsl:text>/</xsl:text>
                     <xsl:value-of select="/article/@lang"/>
                     <xsl:text>/</xsl:text>
                     <xsl:value-of select="../@changes"/>
                  </xsl:attribute>

                  <xsl:value-of select="../@changes"/>

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

   <xsl:template match="download/item[position() &gt; ../@last]"/>

</xsl:stylesheet>
