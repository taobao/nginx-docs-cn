<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="section[@id and @name]">

      <a name="{@id}"/> 
      <center>
         <h4>
            <xsl:value-of select="@name"/>
         </h4>
      </center>

      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="section[@id and not(@name)]">

      <a name="{@id}"/>

      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="section[not(@id) and @name]">

      <center>
         <h4>
            <xsl:value-of select="@name"/>
         </h4>
      </center>

      <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="para"> 
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <xsl:template match="para[@align]"> 
      <p align="{@align}">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <xsl:template match="initial"> 
      <span class="initial">
         <b>
            <xsl:apply-templates/>
         </b>
      </span>
   </xsl:template>

   <xsl:template match="programlisting"> 
      <blockquote class="example">
         <pre>
            <xsl:apply-templates/>
         </pre>
      </blockquote>
   </xsl:template>

   <xsl:template match="para/programlisting">

      <xsl:text disable-output-escaping="yes">&lt;/p&gt; </xsl:text>

      <blockquote class="example">
         <pre>
            <xsl:apply-templates/>
         </pre>
      </blockquote>

      <xsl:text disable-output-escaping="yes">&lt;p&gt; </xsl:text>
   </xsl:template>

   <xsl:template match="note"> 
      <blockquote class="note">
         <xsl:apply-templates/>
      </blockquote>
   </xsl:template>

   <xsl:template match="para/note">

      <xsl:text disable-output-escaping="yes">&lt;/p&gt; </xsl:text>

      <blockquote class="note">
         <xsl:apply-templates/>
      </blockquote>

      <xsl:text disable-output-escaping="yes">&lt;p&gt; </xsl:text>
   </xsl:template>

   <xsl:template match="list[@type='bullet']">
      <xsl:choose>

         <xsl:when test="@compact = 'yes'">

            <ul class="compact">
               <xsl:apply-templates/>
            </ul>
         </xsl:when>

         <xsl:otherwise>

            <ul>
               <xsl:apply-templates/>
            </ul>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="para/list[@type='bullet']">

      <xsl:text disable-output-escaping="yes">&lt;/p&gt; </xsl:text>
      <xsl:choose>

         <xsl:when test="@compact = 'yes'">

            <ul class="compact">
               <xsl:apply-templates/>
            </ul>
         </xsl:when>

         <xsl:otherwise>

            <ul>
               <xsl:apply-templates/>
            </ul>
         </xsl:otherwise>
      </xsl:choose>

      <xsl:text disable-output-escaping="yes">&lt;p&gt; </xsl:text>
   </xsl:template>

   <xsl:template match="list[@type='enum']">
      <xsl:choose>

         <xsl:when test="@compact = 'yes'">

            <ol class="compact">
               <xsl:apply-templates/>
            </ol>
         </xsl:when>

         <xsl:otherwise>

            <ol>
               <xsl:apply-templates/>
            </ol>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="para/list[@type='enum']">

      <xsl:text disable-output-escaping="yes">&lt;/p&gt; </xsl:text>
      <xsl:choose>

         <xsl:when test="@compact = 'yes'">

            <ol class="compact">
               <xsl:apply-templates/>
            </ol>
         </xsl:when>

         <xsl:otherwise>

            <ol>
               <xsl:apply-templates/>
            </ol>
         </xsl:otherwise>
      </xsl:choose>

      <xsl:text disable-output-escaping="yes">&lt;p&gt; </xsl:text>
   </xsl:template>

   <xsl:template match="listitem"> 
      <li>
         <xsl:apply-templates/>
      </li>
   </xsl:template>

   <xsl:template match="list[@type='tag']">
      <xsl:choose>

         <xsl:when test="@compact = 'yes'">

            <dl class="compact">
               <xsl:apply-templates/>
            </dl>
         </xsl:when>

         <xsl:otherwise>

            <dl>
               <xsl:apply-templates/>
            </dl>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="para/list[@type='tag']">

      <xsl:text disable-output-escaping="yes">&lt;/p&gt; </xsl:text>
      <xsl:choose>

         <xsl:when test="@compact = 'yes'">

            <dl class="compact">
               <xsl:apply-templates/>
            </dl>
         </xsl:when>

         <xsl:otherwise>

            <dl>
               <xsl:apply-templates/>
            </dl>
         </xsl:otherwise>
      </xsl:choose>

      <xsl:text disable-output-escaping="yes">&lt;p&gt; </xsl:text>
   </xsl:template>

   <xsl:template match="tag-name"> 
      <dt>
         <xsl:apply-templates/>
      </dt>
   </xsl:template>

   <xsl:template match="tag-desc"> 
      <dd>
         <xsl:apply-templates/>
      </dd>
   </xsl:template>

   <xsl:template match="table[@note and @width]">

      <blockquote>
         <table width="{@width}">
            <xsl:apply-templates/>
         </table>
      </blockquote>
   </xsl:template>

   <xsl:template match="table[@note and not(@width)]">

      <blockquote>
         <table width="100%">
            <xsl:apply-templates/>
         </table>
      </blockquote>
   </xsl:template>

   <xsl:template match="table[not(@note) and @width]">

      <table width="{@width}">
         <xsl:apply-templates/>
      </table>
   </xsl:template>

   <xsl:template match="table"> 
      <table width="100%">
         <xsl:apply-templates/>
      </table>
   </xsl:template>

   <xsl:template match="tr"> 
      <tr>
         <xsl:apply-templates/>
      </tr>
   </xsl:template>

   <xsl:template match="td[@width]"> 
      <td width="{@width}">
         <xsl:apply-templates/>
      </td>
   </xsl:template>

   <xsl:template match="td"> 
      <td>
         <xsl:apply-templates/>
      </td>
   </xsl:template>

   <xsl:template match="c-def"> 
      <code>
         <xsl:apply-templates/>
      </code>
   </xsl:template>

   <xsl:template match="c-func"> 
      <code>
         <xsl:apply-templates/>
         <xsl:text>()</xsl:text>
      </code>
   </xsl:template>

   <xsl:template match="command"> 
      <code>
         <xsl:apply-templates/>
      </code>
   </xsl:template>

   <xsl:template match="emphasis"> 
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>

   <xsl:template match="example"> 
      <blockquote class="example">
         <pre>
            <xsl:apply-templates/>
         </pre>
      </blockquote>
   </xsl:template>

   <xsl:template match="para/example">

      <xsl:text disable-output-escaping="yes">&lt;/p&gt; </xsl:text>

      <blockquote class="example">
         <pre>
            <xsl:apply-templates/>
         </pre>
      </blockquote>

      <xsl:text disable-output-escaping="yes">&lt;p&gt; </xsl:text>
   </xsl:template>

   <xsl:template match="literal"> 
      <code>
         <xsl:apply-templates/>
      </code>
   </xsl:template>

   <xsl:template match="header">

      <xsl:text>“</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>”</xsl:text>
   </xsl:template>

   <xsl:template match="http-status">

      <xsl:value-of select="@code"/>
      <xsl:text> (</xsl:text>
      <xsl:value-of select="@text"/>
      <xsl:text>)</xsl:text>
   </xsl:template>

   <xsl:template match="url[/*[@lang='he']]">

      <i>
         <span class="ltr">
            <xsl:apply-templates/>
         </span>
      </i>
   </xsl:template>

   <xsl:template match="url"> 
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>

   <xsl:template match="value"> 
      <code>
         <i>
            <xsl:apply-templates/>
         </i>
      </code>
   </xsl:template>

   <xsl:template match="registered">
      <xsl:apply-templates/>
      <sup>
         <xsl:text>®</xsl:text>
      </sup>
   </xsl:template>

   <xsl:template match="var"> 
      <code>
         <xsl:apply-templates/>
      </code>
   </xsl:template>

   <xsl:template match="path"> 
      <code>
         <xsl:apply-templates/>
      </code>
   </xsl:template>

   <xsl:template match="i"> 
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>

   <xsl:template match="b"> 
      <b>
         <xsl:apply-templates/>
      </b>
   </xsl:template>

   <xsl:template match="nobr"> 
      <nobr>
         <xsl:apply-templates/>
      </nobr>
   </xsl:template>

   <xsl:template match="br"> 
      <br/>
   </xsl:template>

</xsl:stylesheet>
