<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="security"> 
      <ul>
         <xsl:apply-templates/>
      </ul>
   </xsl:template>

   <xsl:template match="security/item">

      <li>

         <p>

            <xsl:value-of select="@name"/>
            <br/>
            <xsl:choose>

               <xsl:when test="@severity = 'major'">

                  <xsl:text>Severity: </xsl:text> 
                  <b>
                     <xsl:value-of select="@severity"/>
                  </b>
                  <br/>
               </xsl:when>

               <xsl:otherwise>

                  <xsl:text>Severity: </xsl:text>
                  <xsl:value-of select="@severity"/>
                  <br/>
               </xsl:otherwise>
            </xsl:choose>

            <xsl:if test="@cert">

               <a>

                  <xsl:attribute name="href">

                     <xsl:text>http://www.kb.cert.org/vuls/id/</xsl:text>
                     <xsl:value-of select="@cert"/>
                  </xsl:attribute>

                  <xsl:text>VU#</xsl:text>
                  <xsl:value-of select="@cert"/>

               </a>
            </xsl:if>

            <xsl:if test="@cve">

               <xsl:if test="@cert">

                  <xsl:text>  </xsl:text>
               </xsl:if>

               <a>

                  <xsl:attribute name="href">

                     <xsl:text>http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-</xsl:text>
                     <xsl:value-of select="@cve"/>
                  </xsl:attribute>

                  <xsl:text>CVE-</xsl:text>
                  <xsl:value-of select="@cve"/>

               </a>
            </xsl:if>

            <xsl:if test="@core">

               <xsl:if test="@cert or @cve">

                  <xsl:text>  </xsl:text>
               </xsl:if>

               <a href="{@href}">

                  <xsl:value-of select="@core"/> 
               </a>
            </xsl:if>

            <xsl:if test="@cert or @cve or @core">

               <br/>
            </xsl:if>

            <xsl:text>Not vulnerable: </xsl:text>
            <xsl:value-of select="@good"/>
            <br/>

            <xsl:text>Vulnerable: </xsl:text>
            <xsl:value-of select="@vulnerable"/>
            <br/>

            <xsl:if test="@patch">

               <a>

                  <xsl:attribute name="href">

                     <xsl:text>/download/</xsl:text>
                     <xsl:value-of select="@patch"/>
                  </xsl:attribute>

                  <xsl:text>The patch</xsl:text>

               </a>

               <xsl:text>  </xsl:text>

               <a>

                  <xsl:attribute name="href">

                     <xsl:text>/download/</xsl:text>
                     <xsl:value-of select="@patch"/>
                     <xsl:text>.asc</xsl:text>
                  </xsl:attribute>

                  <xsl:text>pgp</xsl:text>

               </a>
            </xsl:if>

         </p>

      </li>
   </xsl:template>

</xsl:stylesheet>
