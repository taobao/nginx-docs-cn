<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="directive">

      <a name="{@name}"/>
        <!-- <center><h4><xsl:value-of select="@name"/> </h4></center> -->

      <div class="directive">

         <table cellspacing="0">

            <xsl:apply-templates select="syntax"/>

            <xsl:apply-templates select="default"/>

            <xsl:apply-templates select="context"/>

         </table>

         <xsl:if test="(@appeared-in)">

            <p>This directive appeared in version
               <xsl:value-of select="@appeared-in"/>.
            </p>
         </xsl:if>

      </div>

      <xsl:apply-templates select="para"/>
   </xsl:template>

   <xsl:template match="syntax">

      <xsl:if test="position() = 1">

         <xsl:text disable-output-escaping="yes">
                &lt;tr&gt;
                &lt;td&gt;
            </xsl:text>

         <xsl:value-of select="document(concat($XML, '/i18n.xml'))                        /i18n/text[@lang = $LANG]/item[@id='syntax']"/>

         <xsl:text>:</xsl:text>

         <xsl:text disable-output-escaping="yes">
                &lt;/td&gt;
                &lt;td&gt;
            </xsl:text>
      </xsl:if>

      <code>

         <strong>

            <xsl:value-of select="../@name"/>

         </strong>

         <xsl:if test="count(node()) != 0">

            <xsl:text> </xsl:text>
            <xsl:apply-templates/>
         </xsl:if>
         <xsl:choose>

            <xsl:when test="@block = 'yes'">

               <xsl:text> { ... }</xsl:text>
            </xsl:when>

            <xsl:otherwise>

               <xsl:text>;</xsl:text>
            </xsl:otherwise>
         </xsl:choose>

      </code>

      <br/>

      <xsl:if test="position() = last()">

         <xsl:text disable-output-escaping="yes">
                &lt;/td&gt;
                &lt;/tr&gt;
            </xsl:text>
      </xsl:if>
   </xsl:template>

   <xsl:template match="default">

      <xsl:if test="position() = 1">

         <xsl:text disable-output-escaping="yes">
                &lt;tr&gt;
                &lt;td&gt;
            </xsl:text>

         <xsl:value-of select="document(concat($XML, '/i18n.xml'))                        /i18n/text[@lang = $LANG]/item[@id='default']"/>

         <xsl:text>:</xsl:text>

         <xsl:text disable-output-escaping="yes">
                &lt;/td&gt;
                &lt;td&gt;
            </xsl:text>
      </xsl:if>
      <xsl:choose>

         <xsl:when test="count(node()) = 0">
            —</xsl:when>

         <xsl:otherwise>

            <pre>

               <xsl:value-of select="../@name"/>
               <xsl:choose>

                  <xsl:when test="count(../syntax[@block='yes'])">

                     <xsl:text> {</xsl:text>
                     <xsl:apply-templates/>
                     <xsl:text>}</xsl:text>
                  </xsl:when>

                  <xsl:otherwise>

                     <xsl:text> </xsl:text>
                     <xsl:apply-templates/>
                     <xsl:text>;</xsl:text>
                  </xsl:otherwise>
               </xsl:choose>

            </pre>
         </xsl:otherwise>
      </xsl:choose>

      <xsl:if test="position() = last()">

         <xsl:text disable-output-escaping="yes">
                &lt;/td&gt;
                &lt;/tr&gt;
            </xsl:text>
      </xsl:if>
   </xsl:template>

   <xsl:template match="context">

      <xsl:if test="position() = 1">

         <xsl:text disable-output-escaping="yes">
                &lt;tr&gt;
                &lt;td&gt;
            </xsl:text>

         <xsl:value-of select="document(concat($XML, '/i18n.xml'))                        /i18n/text[@lang = $LANG]/item[@id='context']"/>

         <xsl:text>:</xsl:text>

         <xsl:text disable-output-escaping="yes">
                &lt;/td&gt;
                &lt;td&gt;
            </xsl:text>
      </xsl:if>

      <code>
         <xsl:choose>

            <xsl:when test="count(node()) = 0">

               <xsl:value-of select="document(concat($XML, '/i18n.xml'))                        /i18n/text[@lang = $LANG]/item[@id='context.any']"/>
            </xsl:when>

            <xsl:otherwise>

               <xsl:apply-templates/>
            </xsl:otherwise>
         </xsl:choose>

      </code>
      <xsl:choose>

         <xsl:when test="position() != last()">

            <xsl:text>, </xsl:text>
         </xsl:when>

         <xsl:otherwise>

            <br/>

            <xsl:text disable-output-escaping="yes">
                &lt;/td&gt;
                &lt;/tr&gt;
            </xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

</xsl:stylesheet>
