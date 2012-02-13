<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="menu/item">
      <xsl:choose>

         <xsl:when test="@href = $LINK">
            <xsl:choose>

               <xsl:when test="$YEAR and @href='/'">

                  <a href="./"> news </a> 
                  <br/>
               </xsl:when>

               <xsl:otherwise>

                  <xsl:value-of select=" normalize-space(text())"/>
                  <br/>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>

         <xsl:otherwise>

            <a>

               <xsl:attribute name="href">
                  <xsl:choose>

                     <xsl:when test="starts-with(@href, $DIRNAME)">
                        <xsl:choose>

                           <xsl:when test="substring-after(@href, $DIRNAME) = ''">
                  ./</xsl:when>

                           <xsl:otherwise>

                              <xsl:value-of select=" substring-after(@href, $DIRNAME)"/>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:when>

                     <xsl:otherwise>

                        <xsl:value-of select=" concat($ROOT, @href)"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:attribute>

               <xsl:value-of select=" normalize-space(text())"/>

            </a>

            <xsl:if test="@lang">
               <xsl:text> [</xsl:text>
               <xsl:value-of select="@lang"/>
               <xsl:text>]</xsl:text>
            </xsl:if>

            <br/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="menu/item[@year]">

      <xsl:if test="$YEAR or $LINK='/'">
         <xsl:choose>

            <xsl:when test="$YEAR=@year">

               <xsl:value-of select="@year"/> 
               <br/>
            </xsl:when>

            <xsl:otherwise>

               <a href="{@href}">
                  <xsl:value-of select="@year"/>
               </a>

               <br/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:template>

   <xsl:template match="menu/item[starts-with(@href, 'http://') or starts-with(@href, 'https://')]">

      <a href="{@href}">
         <xsl:value-of select=" normalize-space(text())"/>
      </a>

      <xsl:if test="@lang">
         <xsl:text> [</xsl:text>
         <xsl:value-of select="@lang"/>
         <xsl:text>]</xsl:text>
      </xsl:if>

      <br/>
   </xsl:template>

   <xsl:template match="menu/item[not(@href)]">

      <xsl:value-of select=" normalize-space(text())"/> 
      <br/>
   </xsl:template>

</xsl:stylesheet>
