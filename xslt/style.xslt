<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template name="style">
      <xsl:param name="lang"/>

      <style type="text/css">
         <xsl:value-of select=" normalize-space('         body              { font-family:    Georgia, serif; }         p                 { text-align:     justify; }         table.news p      { margin-top:     0; }         table.news td     { vertical-align: baseline; }         table.news .date  { text-align:     right;                             padding-right:  0.5em;                             white-space:    nowrap; }         div.directive     { background:     #EEEEEE;                             padding:        10pt 10pt 10pt 0; }         div.directive td  { vertical-align: baseline; }         div.directive pre { padding:        0;                             margin:         0; }         div.directive p   { margin:         5pt 0 0 0;                             font-size:      80%; }         span.initial      { font-size:      200%;                             float:          left;                             padding-right:  10pt;}         li                { text-align:     justify; }         dd                { text-align:     justify; }         td.list           { background:     #EEEEEE; }         blockquote.note   { text-align:     justify;                             background:     #EEEEEE;                             border:         none;                             padding:        10pt 10pt 10pt 10pt; }         sup               { font-size:      50%; }         ')"/>

         <xsl:if test="$lang = 'he'">

            <xsl:value-of select=" normalize-space('         pre               { text-align:     left;                             direction:      ltr; }         code              { direction:      ltr;                             unicode-bidi:   embed; }         .ltr              { direction:      ltr;                             unicode-bidi:   embed; }         ')"/>
         </xsl:if>

      </style>
   </xsl:template>

</xsl:stylesheet>
