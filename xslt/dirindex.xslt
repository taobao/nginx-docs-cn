<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:output doctype-system="../../../dtd/article.dtd" method="xml"/>

   <xsl:param select="'../xml'" name="XML"/>

   <xsl:param name="LANG"/>

   <xsl:template match="modules">

      <article name="{document(concat($XML, '/i18n.xml'))                     /i18n/text[@lang = $LANG]/item[@id='dirindex']}" link="/{$LANG}/docs/dirindex.html" lang="{$LANG}">

         <section>

            <para>

               <links>

                  <xsl:apply-templates select="module"/>

               </links>

            </para>

         </section>

      </article>
   </xsl:template>

   <xsl:template match="module">

      <xsl:variable select="@name" name="module"/>

      <xsl:for-each select="document(@name)/module/section/directive">

         <link doc="{$module}" id="{@name}"/>
      </xsl:for-each>
   </xsl:template>

</xsl:stylesheet>
