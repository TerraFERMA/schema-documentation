<?xml version='1.0'?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:r="http://relaxng.org/ns/structure/1.0" 
    xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
>
  <!--
    Copyright (C) 2013 Columbia University in the City of New York and others.
    
    Please see the AUTHORS file in the main source directory for a full list
    of contributors.
    
    This file is part of TerraFERMA.
    
    TerraFERMA is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    TerraFERMA is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU Lesser General Public License for more details.
    
    You should have received a copy of the GNU Lesser General Public License
    along with TerraFERMA. If not, see <http://www.gnu.org/licenses/>.
  -->

<!--This is an xslt stylesheet designed to convert spud schemas into documentation written in markdown.-->
<!--At the time of writing, nested chooses/if didn't work in saxon-xslt so some of the logic in this stylesheet gets complicated fast and could be improved dramatically if this restriction was removed.-->
<!--FIXME: This could also be improved by more intelligent use of templates, which can nest choose/if elements but I ran out of time.-->

<!--As markdown isn't an officially support output format we just write text.-->
<xsl:output method="text" />

<!--So that we are schema independent we first work out the name of the root node of the schema.-->
<xsl:variable name="root"><xsl:value-of select="/descendant::r:start/r:element[1]/@name"/></xsl:variable>
<!--The base directory where files will be output.  If not provided this defaults to a directory with the same location as the schema.-->
<!--Requires at least xsl v2.0-->
<xsl:param name="basedir"><xsl:value-of select="substring-before(base-uri(), '.rng')"/></xsl:param>

<!--The base file.-->
<!--Requires at least xsl v2.0-->
<xsl:variable name="basefile"><xsl:value-of select="base-uri()"/></xsl:variable>
<!--List of files to be included from the main file.-->
<xsl:variable name="includedfiles" select="document($basefile)/descendant::r:include/@href"/>

<!--A url to raise issues at for the project.  If not provided this is not used.-->
<xsl:param name="issueurl" select="''"/>
<!--A url to link back to the main documentation.  This is used as a header to every file.  If not provided this is not used.-->
<xsl:param name="docurl" select="''"/>
<!--A list of spud files containing the spud base language.  Couldn't find a way to provide a list of files at the command line so this is
the one argument that is hard coded for terraferma as we include spud_extension.rng.  To override this the user should provide spud_base.rng 
alone at the command line.  Of course, if you have your own extension then you're screwed unless you can tell me how to do this better or
are willing to copy, paste and modify this stylesheet.-->
<xsl:param name="spudfiles" select="'spud_base.rng', 'spud_extension.rng'"/>

<!--This is where the processing begins in earnest.  We begin at the root node of the schema.-->
<xsl:template match="/">
    <!--Start outputting everything to a markdown file.-->
    <!--Requires at least xsl v2.0-->
    <xsl:result-document href="{$basedir}/{$root}.md">
        <!--Output a copyright notice at the start.-->
        <xsl:call-template name="copyright"/>
        <!--Descend into all elements beneath the start element-->
        <xsl:apply-templates select="descendant::r:start/r:element">
            <xsl:with-param name="parent" select="current()"/>
            <xsl:with-param name="visited" select="current()"/>
        </xsl:apply-templates>
        <!--Output a note about the resulting file being autogenerated.-->
        <xsl:call-template name="autogenerated"/>
    </xsl:result-document>
</xsl:template>

<!--This template deals with all elements-->
<xsl:template match="r:element">
    <!--The spud path traversed so far to get to this element - not the same as the xpath!-->
    <xsl:param name="path" select="''"/>
    <!--The depth in this output file - generally 0 or 1, 0 when this file is about this element, 1 when this is a child of the file element, higher if we've gone through an intermediate bullet point, i.e. a choice element-->
    <xsl:param name="depth" select="0"/>
    <!--A string describing the various things this element has passed through since its parent, e.g. CHOICE, MULTIPLE, OPTIONAL etc.-->
    <xsl:param name="optionattributes" select="''"/>
    <!--The xpath of the parent element.-->
    <xsl:param name="parent"/>
    <!--A node set of elements visited so far to get to this element.  Note: not all elements visited, just those down this spud path.-->
    <xsl:param name="visited"/>

    <!--If this element has a name attribute set then grab it.  This can either come from a child attribute or a definition in this document or a definition in an included document.-->
    <xsl:variable name="vname"><xsl:value-of select="child::r:attribute[@name='name']/child::r:value | /descendant::r:define[@name=current()/child::r:ref/@name]/child::r:attribute[@name='name']/child::r:value | document($includedfiles)/descendant::r:define[@name=current()/child::r:ref/@name]/child::r:attribute[@name='name']/child::r:value"/></xsl:variable>
    <!--If this element's parent has a name attribute set then grab it.  This is necessary for constructing the correct links.  It can either come from a child attribute of the parent or a definition in this document or an included document.-->
    <xsl:variable name="pvname"><xsl:value-of select="$parent/child::r:attribute[@name='name']/child::r:value | /descendant::r:define[@name=$parent/child::r:ref/@name]/child::r:attribute[@name='name']/child::r:value | document($includedfiles)/descendant::r:define[@name=$parent/child::r:ref/@name]/child::r:attribute[@name='name']/child::r:value"/></xsl:variable>


    <!--Determine if this element is in the spud base language or any extensions we've included. This should return a 0 node set if it isn't.  We don't do anything with elements that come from the spud base language so if this returns a non-null node set we stop traversing this spud path.-->
    <xsl:variable name="spud" select="document($spudfiles)/descendant::r:element[@name=current()/@name]"/>
    <!--Determine if we have previously visited the xpath corresponding to this element in the schema.  If we have then we don't continue traversing this spud path any further (though we do add an attribute indicating this in the docs).-->
    <xsl:variable name="continue" select="not($visited=current())"/>

    <!--If this element has data to be set then determine what the value type it wants.  This can either come from spud base definitions (excluding the comment, which is a special case) or be included directly beneath the element as a child data node.-->
    <xsl:variable name="type" select="document($spudfiles)/descendant::r:define[@name=current()/child::r:ref/@name and @name!='comment']/descendant::r:data[not(ancestor::r:attribute)]/@type | child::r:data[@type]/@type"/>
    <!--Some elements don't have a type to set because they provide a hard-coded list of options.  Grab this, based on the list of element names provided in the spud base language, if available.-->
    <xsl:variable name="values" select="child::r:element[@name=document($spudfiles)/descendant::r:element/@name]/descendant::r:value[not(ancestor::r:attribute)]" />
    <!--If there are any attributes that have data to be set (determined based on there being a type attribute) then grab these.-->
    <xsl:variable name="attributes" select="child::r:attribute[child::r:data/@type]"/>

    <!--Provide a link to the documentation homepage if provided.-->
    <xsl:if test="string-length($docurl) and $depth = 0 and not($spud)">
        <xsl:text>[documentation home](</xsl:text>
        <xsl:value-of select="$docurl"/>
        <xsl:text>)&#10;&#10;</xsl:text>
    </xsl:if>

    <!--Provide links to the history of this spud path if this isn't the root node.-->
    <xsl:if test="string-length($path) and $depth = 0 and not($spud)">
        <xsl:call-template name="history">
            <xsl:with-param name="path" select="$path"/>
        </xsl:call-template>
        <xsl:text>&#10;&#10;</xsl:text>
    </xsl:if>

    <!--If this page is about this element then output a header, otherwise add another bullet point for the list of children.-->
    <xsl:choose>
        <xsl:when test="$depth &gt; 0 and not($spud)">
            <xsl:call-template name="repeatstr">
                <xsl:with-param name="depth" select="$depth - 1"/>
                <xsl:with-param name="string" select="'    '"/>
            </xsl:call-template>
            <xsl:text>* </xsl:text>
        </xsl:when>
        <xsl:when test="not($spud)">
            <xsl:text>#</xsl:text>
        </xsl:when>
    </xsl:choose>

    <!--Print the name of this option (plus its attribute name if it exists) and provide a link to its standalone page.-->
    <!--Lots of options here to deal with the vname and pname existing as well as figuring out if this is recursive and so shouldn't provide a link.-->
    <xsl:choose>
        <xsl:when test="string-length($vname) and string-length($pvname) and not($spud) and $depth &gt; 0 and $continue">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text> (</xsl:text><xsl:value-of select="$vname"/><xsl:text>)](</xsl:text>
            <xsl:value-of select="concat($parent/@name, '__', $pvname, '/', @name, '__', $vname)"/>
            <xsl:text>.md "child")&#10;&#10;</xsl:text>
        </xsl:when>
        <xsl:when test="string-length($vname) and not($spud) and $depth &gt; 0 and $continue">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text> (</xsl:text><xsl:value-of select="$vname"/><xsl:text>)](</xsl:text>
            <xsl:value-of select="concat($parent/@name, '/', @name, '__', $vname)"/>
            <xsl:text>.md "child")&#10;&#10;</xsl:text>
        </xsl:when>
        <xsl:when test="string-length($vname) and not($spud)">
            <xsl:value-of select="@name"/>
            <xsl:text> (</xsl:text><xsl:value-of select="$vname"/><xsl:text>)</xsl:text>
            <xsl:text>&#10;&#10;</xsl:text>
        </xsl:when>
        <xsl:when test="string-length($pvname) and not($spud) and $depth &gt; 0 and $continue">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text>](</xsl:text>
            <xsl:value-of select="concat($parent/@name, '__', $pvname, '/', @name)"/>
            <xsl:text>.md "child")&#10;&#10;</xsl:text>
        </xsl:when>
        <xsl:when test="not($spud) and $depth &gt; 0 and $continue">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text>](</xsl:text>
            <xsl:value-of select="concat($parent/@name, '/', @name)"/>
            <xsl:text>.md "child")&#10;&#10;</xsl:text>
        </xsl:when>
        <xsl:when test="not($spud)">
            <xsl:value-of select="@name"/>
            <xsl:text>&#10;&#10;</xsl:text>
        </xsl:when>
    </xsl:choose>

    <!--Output the attributes we've worked out on our way here and prepend RECURSIVE to them if we've already been at this child.-->
    <!--The first test takes care of both previous attributes and the new recursive one because optionattributes will add nothing if not defined.-->
    <xsl:choose>
        <xsl:when test="not($continue) and not($spud)">
            <xsl:call-template name="repeatstr">
                <xsl:with-param name="depth" select="$depth"/>
                <xsl:with-param name="string" select="'    '"/>
            </xsl:call-template>
            <xsl:text>RECURSIVE </xsl:text>
            <xsl:value-of select="$optionattributes"/>
            <xsl:text>&#10;&#10;</xsl:text>
        </xsl:when>
        <xsl:when test="string-length($optionattributes) and not($spud)">
            <xsl:call-template name="repeatstr">
                <xsl:with-param name="depth" select="$depth"/>
                <xsl:with-param name="string" select="'    '"/>
            </xsl:call-template>
            <xsl:value-of select="$optionattributes"/>
            <xsl:text>&#10;&#10;</xsl:text>
        </xsl:when>
    </xsl:choose>

    <!--If we found that a type was specified for data in this element then document it not-->
    <xsl:if test="$type and not($spud)">
        <xsl:call-template name="repeatstr">
            <xsl:with-param name="depth" select="$depth"/>
            <xsl:with-param name="string" select="'    '"/>
        </xsl:call-template>
        <xsl:text>type: </xsl:text>
        <xsl:value-of select="$type"/>
        <!--If we're expecting multiple values then mention that too-->
        <xsl:if test="$type/ancestor::r:oneOrMore">
            <xsl:text>s</xsl:text>
        </xsl:if>
        <xsl:text>&#10;&#10;</xsl:text>
    </xsl:if>

    <!--If some values were hardcoded in a data element then we can also list those here.-->
    <xsl:if test="$values and not($spud)">
        <xsl:call-template name="repeatstr">
            <xsl:with-param name="depth" select="$depth"/>
            <xsl:with-param name="string" select="'    '"/>
        </xsl:call-template>
        <xsl:text>values: </xsl:text>
        <xsl:value-of select="$values"/>
        <xsl:text>&#10;&#10;</xsl:text>
    </xsl:if>

    <!--If this element has attributes that the user will need to set then we list their name and type in parenthesis here-->
    <xsl:if test="$attributes and not($spud)">
        <xsl:call-template name="repeatstr">
            <xsl:with-param name="depth" select="$depth"/>
            <xsl:with-param name="string" select="'    '"/>
        </xsl:call-template>
        <xsl:text>attributes: </xsl:text>
        <xsl:for-each select="$attributes">
            <xsl:value-of select="@name"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="child::r:data/@type"/>
            <xsl:text>) </xsl:text>
        </xsl:for-each>
        <xsl:text>&#10;&#10;</xsl:text>
    </xsl:if>

    <!--We're about to output the path so let's indent in preparation for that.-->
    <xsl:if test="string-length($path) and not($spud)">
        <xsl:call-template name="repeatstr">
            <xsl:with-param name="depth" select="$depth"/>
            <xsl:with-param name="string" select="'    '"/>
        </xsl:call-template>
    </xsl:if>

    <!--Write out the path to this element.  This depends on whether there's a name attribute set or not.-->
    <!--This will also be the new path passed down to the children of this element but we can't modify variables in xslt so you'll see this logic again later.-->
    <xsl:choose>
        <xsl:when test="string-length($path) and string-length($vname) and not($spud)">
            <xsl:text>*</xsl:text><xsl:value-of select="substring-after(concat($path, '/', @name, '::', $vname), $root)"/><xsl:text>*&#10;&#10;</xsl:text>
        </xsl:when>
        <xsl:when test="string-length($path) and not($spud)">
            <xsl:text>*</xsl:text><xsl:value-of select="substring-after(concat($path, '/', @name), $root)"/><xsl:text>*&#10;&#10;</xsl:text>
        </xsl:when>
        <xsl:when test="not($spud)">
            <xsl:text>*/*&#10;&#10;</xsl:text>
        </xsl:when>
    </xsl:choose>

    <!--Finally we get to write out the doc string for this element.-->
    <xsl:choose>
        <!--If we have documentation then prepend each line of it with the correct indentation level.-->
        <xsl:when test="a:documentation and not($spud)">
            <xsl:for-each select="tokenize(a:documentation, '\r?\n')">
                <xsl:call-template name="repeatstr">
                    <xsl:with-param name="depth" select="$depth"/>
                    <xsl:with-param name="string" select="'    '"/>
                </xsl:call-template>
                <xsl:text></xsl:text><xsl:sequence select="."/><xsl:text>&#10;</xsl:text>
            </xsl:for-each>
            <xsl:text>&#10;</xsl:text>
        </xsl:when>
        <!--If we don't have documentation then we've been naughty when writing out schema and we'll tell people to complain if we can.-->
        <xsl:when test="not($spud) and string-length($issueurl)" >
            <xsl:call-template name="repeatstr">
                <xsl:with-param name="depth" select="$depth"/>
                <xsl:with-param name="string" select="'    '"/>
            </xsl:call-template>
            <xsl:text>NO DOCUMENTATION&#10;&#10;</xsl:text>
            <xsl:call-template name="repeatstr">
                <xsl:with-param name="depth" select="$depth"/>
                <xsl:with-param name="string" select="'    '"/>
            </xsl:call-template>
            <xsl:text>Please raise an issue at: [</xsl:text>
            <xsl:value-of select="$issueurl"/>
            <xsl:text>](</xsl:text>
            <xsl:value-of select="$issueurl"/>
            <xsl:text> "project url").&#10;&#10;</xsl:text>
            <xsl:call-template name="docwarning">
                <xsl:with-param name="path" select="$path"/>
                <xsl:with-param name="vname" select="$vname"/>
                <xsl:with-param name="depth" select="$depth"/>
            </xsl:call-template>
        </xsl:when>
        <!--If we can't direct people where to complain then we can still mildly scold the developers.-->
        <xsl:when test="not($spud)">
            <xsl:call-template name="repeatstr">
                <xsl:with-param name="depth" select="$depth"/>
                <xsl:with-param name="string" select="'    '"/>
            </xsl:call-template>
            <xsl:text>NO DOCUMENTATION&#10;&#10;</xsl:text>
            <xsl:call-template name="repeatstr">
                <xsl:with-param name="depth" select="$depth"/>
                <xsl:with-param name="string" select="'    '"/>
            </xsl:call-template>
            <xsl:text>Please raise an issue with the developers.</xsl:text>
            <xsl:text>&#10;&#10;</xsl:text>
            <xsl:call-template name="docwarning">
                <xsl:with-param name="path" select="$path"/>
                <xsl:with-param name="vname" select="$vname"/>
                <xsl:with-param name="depth" select="$depth"/>
            </xsl:call-template>
        </xsl:when>
    </xsl:choose>

    <!--Recursively check if there's a comment and output a warning if not.-->
    <xsl:if test="$depth = 0 and not($spud)">
        <xsl:call-template name="commentwarning">
            <xsl:with-param name="path" select="$path"/>
            <xsl:with-param name="vname" select="$vname"/>
            <xsl:with-param name="current" select="current()"/>
        </xsl:call-template>
    </xsl:if>

    <!--If this is the parent element in this file then we go down another level into the child elements but these might be masked by other intermediate elements that we will need to process instead.  Ultimately however, if there is a descendant element then this is a recursion.-->
    <!--The path we pass down depends on whether this element had a name attribute or not.-->
    <xsl:choose>
        <xsl:when test="$continue and string-length($vname) and $depth = 0 and not($spud)">
            <xsl:apply-templates select="child::r:element | child::r:ref | child::r:optional | child::r:oneOrMore | child::r:zeroOrMore | child::r:choice">
                <xsl:with-param name="path" select="concat($path, '/', @name, '::', $vname)"/>
                <xsl:with-param name="depth" select="$depth+1"/>
                <xsl:with-param name="parent" select="current()"/>
                <xsl:with-param name="visited" select="$visited | current()"/>
            </xsl:apply-templates>
        </xsl:when>
        <xsl:when test="$continue and $depth = 0 and not($spud)">
            <xsl:apply-templates select="child::r:element | child::r:ref | child::r:optional | child::r:oneOrMore | child::r:zeroOrMore | child::r:choice">
                <xsl:with-param name="path" select="concat($path, '/', @name)"/>
                <xsl:with-param name="depth" select="$depth+1"/>
                <xsl:with-param name="parent" select="current()"/>
                <xsl:with-param name="visited" select="$visited | current()"/>
            </xsl:apply-templates>
        </xsl:when>
    </xsl:choose>

    <!--If this was a child element in this file then this element also deserves a chance at being the parent so we call this template directly again on the same element but this time with depth = 0 so it is the parent.-->
    <!--This is done in a new markdown file, the filename of which is based on the path, with colons replaced with underscores because bitbucket was unhappy.-->
    <!--Again the path, and hence the filepath depends on whether a name attribute was set or not.-->
    <xsl:choose>
        <xsl:when test="$continue and string-length($vname) and $depth &gt; 0 and not($spud)">
            <xsl:variable name="filepath"><xsl:value-of select="concat($basedir, replace($path, ':', '_'), '/', @name, '__', $vname)"/></xsl:variable>
            <xsl:result-document href="{$filepath}.md">
                <xsl:call-template name="copyright"/>
                <xsl:apply-templates select="self::r:element">
                    <xsl:with-param name="path" select="$path"/>
                    <xsl:with-param name="optionattributes" select="$optionattributes"/>
                    <xsl:with-param name="parent" select="$parent"/>
                    <xsl:with-param name="visited" select="$visited"/>
                </xsl:apply-templates>
                <xsl:call-template name="autogenerated"/>
            </xsl:result-document>
        </xsl:when>
        <xsl:when test="$continue and $depth &gt; 0 and not($spud)">
            <xsl:variable name="filepath"><xsl:value-of select="concat($basedir, replace($path, ':', '_'), '/', @name)"/></xsl:variable>
            <xsl:result-document href="{$filepath}.md">
                <xsl:call-template name="copyright"/>
                <xsl:apply-templates select="self::r:element">
                    <xsl:with-param name="path" select="$path"/>
                    <xsl:with-param name="optionattributes" select="$optionattributes"/>
                    <xsl:with-param name="parent" select="$parent"/>
                    <xsl:with-param name="visited" select="$visited"/>
                </xsl:apply-templates>
                <xsl:call-template name="autogenerated"/>
            </xsl:result-document>
        </xsl:when>
    </xsl:choose>
</xsl:template>

<!--If we find ourselves looking at a ref node then this template will process it until it finds the correct define node that contains the element definition.-->
<!--Lots of parameters get passed in because they will ultimately be needed by the descendant element we're looking for but we don't do much with them here.-->
<xsl:template match="r:ref">
    <xsl:param name="path"/>
    <xsl:param name="depth" select="0"/>
    <xsl:param name="optionattributes" select="''"/>
    <xsl:param name="combine" select="false()"/>
    <xsl:param name="parent"/>
    <xsl:param name="visited"/>

    <!--Search for the correct define element.-->
    <xsl:variable name="dpath" select="/descendant::r:define[@name=current()/@name] | document($includedfiles)/descendant::r:define[@name=current()/@name]" />
    <!--If there are multiple definitions of this define node then some of them should come with a combine attribute that will tell us how to concatenate them.-->
    <!--The choice combine needs special attention as this is another form of the r:choice node, which we also deal with later on.-->
    <!--This gets complicated because a single list of choices can be made up of several individual choice lists in this manner or just consist of simple elements.-->
    <xsl:choose>
        <!--If there are multiple combine defines and we haven't already started combining them...-->
        <xsl:when test="count($dpath[@combine='choice']) &gt; 0 and not($combine)">
            <xsl:call-template name="repeatstr">
                <xsl:with-param name="depth" select="$depth - 1"/>
                <xsl:with-param name="string" select="'    '"/>
            </xsl:call-template>
            <!--Output a choice header...-->
            <xsl:text>* CHOICE:&#10;</xsl:text>
            <xsl:apply-templates select="$dpath/child::r:element | $dpath/child::r:ref | $dpath/child::r:optional | $dpath/child::r:zeroOrMore | $dpath/child::r:oneOrMore | $dpath/child::r:choice">
                <xsl:with-param name="path" select="$path"/>
                <!--and increment the depth-->
                <xsl:with-param name="depth" select="$depth + 1"/>
                <xsl:with-param name="optionattributes" select="concat($optionattributes, 'CHOICE ')"/>
                <!--as well as taking note that we've started combining things so we don't end up here again and output another choice header-->
                <xsl:with-param name="combine" select="true()"/>            <!-- we are combining siblings -->
                <xsl:with-param name="parent" select="$parent"/>
                <xsl:with-param name="visited" select="$visited"/>
            </xsl:apply-templates>
        </xsl:when>
        <!--otherwise just process the children of this define node normally-->
        <xsl:otherwise>
            <xsl:apply-templates select="$dpath/child::r:element | $dpath/child::r:ref | $dpath/child::r:optional | $dpath/child::r:zeroOrMore | $dpath/child::r:oneOrMore | $dpath/child::r:choice">
                <xsl:with-param name="path" select="$path"/>
                <xsl:with-param name="depth" select="$depth"/>
                <xsl:with-param name="optionattributes" select="$optionattributes"/>
                <xsl:with-param name="combine" select="$combine"/>
                <xsl:with-param name="parent" select="$parent"/>
                <xsl:with-param name="visited" select="$visited"/>
            </xsl:apply-templates>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!--Process optional nodes.  This is a separate template just so we can add the OPTIONAL attribute to the list.-->
<xsl:template match="r:optional">
    <xsl:param name="path"/>
    <xsl:param name="depth" select="0"/>
    <xsl:param name="optionattributes" select="''"/>
    <xsl:param name="combine" select="false()"/>
    <xsl:param name="parent"/>
    <xsl:param name="visited"/>

    <xsl:apply-templates select="child::r:element | child::r:ref | child::r:optional | child::r:zeroOrMore | child::r:oneOrMore | child::r:choice">
        <xsl:with-param name="path" select="$path"/>
        <xsl:with-param name="depth" select="$depth"/>
        <xsl:with-param name="optionattributes" select="concat($optionattributes, 'OPTIONAL ')"/>
        <xsl:with-param name="combine" select="$combine"/>
        <xsl:with-param name="parent" select="$parent"/>
        <xsl:with-param name="visited" select="$visited"/>
    </xsl:apply-templates>
</xsl:template>

<!--Process oneOrMore nodes.  This is a separate template just so we can add the MULTIPLE (1+) attribute to the list.-->
<xsl:template match="r:oneOrMore">
    <xsl:param name="path"/>
    <xsl:param name="depth" select="0"/>
    <xsl:param name="optionattributes" select="''"/>
    <xsl:param name="combine" select="false()"/>
    <xsl:param name="parent"/>
    <xsl:param name="visited"/>

    <xsl:apply-templates select="child::r:element | child::r:ref | child::r:optional | child::r:zeroOrMore | child::r:oneOrMore | child::r:choice">
        <xsl:with-param name="path" select="$path"/>
        <xsl:with-param name="depth" select="$depth"/>
        <xsl:with-param name="optionattributes" select="concat($optionattributes, 'MULTIPLE (1+) ')"/>
        <xsl:with-param name="combine" select="$combine"/>
        <xsl:with-param name="parent" select="$parent"/>
        <xsl:with-param name="visited" select="$visited"/>
    </xsl:apply-templates>
</xsl:template>

<!--Process oneOrMore nodes.  This is a separate template just so we can add the MULTIPLE (0+) attribute to the list.-->
<xsl:template match="r:zeroOrMore ">
    <xsl:param name="path"/>
    <xsl:param name="depth" select="0"/>
    <xsl:param name="optionattributes" select="''"/>
    <xsl:param name="combine" select="false()"/>
    <xsl:param name="parent"/>
    <xsl:param name="visited"/>

    <xsl:apply-templates select="child::r:element | child::r:ref | child::r:optional | child::r:zeroOrMore | child::r:oneOrMore | child::r:choice">
        <xsl:with-param name="path" select="$path"/>
        <xsl:with-param name="depth" select="$depth"/>
        <xsl:with-param name="optionattributes" select="concat($optionattributes, 'MULTIPLE (0+) ')"/>
        <xsl:with-param name="combine" select="$combine"/>
        <xsl:with-param name="parent" select="$parent"/>
        <xsl:with-param name="visited" select="$visited"/>
    </xsl:apply-templates>
</xsl:template>

<!--Process choice nodes.-->
<!--This is complicated by the fact that choice lists can also be made by combining definitions.-->
<xsl:template match="r:choice">
    <xsl:param name="path"/>
    <xsl:param name="depth" select="0"/>
    <xsl:param name="optionattributes" select="''"/>
    <!--The choice param indicates if we've already started a choice list.-->
    <xsl:param name="combine" select="false()"/>
    <xsl:param name="parent"/>
    <xsl:param name="visited"/>

    <xsl:choose>
        <!--If we've already started combining elements then we just pass straight through here.-->
        <xsl:when test="$combine">
            <xsl:apply-templates select="child::r:element | child::r:ref | child::r:optional | child::r:zeroOrMore | child::r:oneOrMore | child::r:choice">
                <xsl:with-param name="path" select="$path"/>
                <xsl:with-param name="depth" select="$depth"/>
                <xsl:with-param name="optionattributes" select="$optionattributes"/>
                <xsl:with-param name="combine" select="$combine"/>
                <xsl:with-param name="parent" select="$parent"/>
                <xsl:with-param name="visited" select="$visited"/>
            </xsl:apply-templates>
        </xsl:when>
        <!--If we haven't already combined elements into a sublist then we start here...-->
        <xsl:otherwise>
            <xsl:call-template name="repeatstr">
                <xsl:with-param name="depth" select="$depth - 1"/>
                <xsl:with-param name="string" select="'    '"/>
            </xsl:call-template>
            <!--By outputing a choice subheader...-->
            <xsl:text>* CHOICE:&#10;</xsl:text>
            <xsl:apply-templates select="child::r:element | child::r:ref | child::r:optional | child::r:zeroOrMore | child::r:oneOrMore | child::r:choice">
                <xsl:with-param name="path" select="$path"/>
                <!--And incrementing the depth-->
                <xsl:with-param name="depth" select="$depth + 1"/>
                <!--And appending the option attributes.-->
                <xsl:with-param name="optionattributes" select="concat($optionattributes, 'CHOICE ')"/>
                <xsl:with-param name="combine" select="$combine"/>
                <xsl:with-param name="parent" select="$parent"/>
                <xsl:with-param name="visited" select="$visited"/>
            </xsl:apply-templates>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!--Output a copyright notice as a fake markdown link.-->
<!--Ugly hack but bitbucket won't let me use html tagged comments as the markdown specification should.-->
<xsl:template name="copyright">
    <xsl:text>[copyright]: # (Copyright (C) 2013 Columbia University in the City of New York and others.)
[copyright]: # ( )
[copyright]: # (Please see the AUTHORS file in the main source directory for a full list)
[copyright]: # (of contributors.)
[copyright]: # ( )
[copyright]: # (This file is part of TerraFERMA.)
[copyright]: # ( )
[copyright]: # (TerraFERMA is free software: you can redistribute it and/or modify)
[copyright]: # (it under the terms of the GNU Lesser General Public License as published by)
[copyright]: # (the Free Software Foundation, either version 3 of the License, or)
[copyright]: # ((at your option) any later version.)
[copyright]: # ( )
[copyright]: # (TerraFERMA is distributed in the hope that it will be useful,)
[copyright]: # (but WITHOUT ANY WARRANTY; without even the implied warranty of)
[copyright]: # (MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the)
[copyright]: # (GNU Lesser General Public License for more details.)
[copyright]: # ( )
[copyright]: # (You should have received a copy of the GNU Lesser General Public License)
[copyright]: # (along with TerraFERMA. If not, see &lt;http://www.gnu.org/licenses/&gt;.)&#10;&#10;</xsl:text>
</xsl:template>

<!--Output a note that the output document is autogenerated.-->
<!--Ugly hack using a fake markdown link but bitbucket won't let me use html tagged comments as the markdown specification should.-->
<!--FIXME: Would be nice to get the command line output here.-->
<xsl:template name="autogenerated">
    <xsl:text>[autogenerated]: # (This file was automatically generated from the schema </xsl:text><xsl:value-of select="base-uri()"/><xsl:text>.)&#10;&#10;</xsl:text>
</xsl:template>

<!--Recursively output multiple copies of the supplied string.-->
<!--Useful for indentation and relative paths to previous pages.-->
<xsl:template name="repeatstr">
    <xsl:param name="depth" select="1"/>
    <xsl:param name="string" select="''"/>
    <xsl:if test="$depth &gt; 0">
        <xsl:text></xsl:text><xsl:value-of select="$string"/><xsl:text></xsl:text>
    </xsl:if>
    <xsl:if test="$depth &gt; 1">
        <xsl:call-template name="repeatstr">
            <xsl:with-param name="depth" select="$depth - 1"/>
            <xsl:with-param name="string" select="$string"/>
        </xsl:call-template>
    </xsl:if>
</xsl:template>

<!--Given a spud path, recursively turn it into a series of relative links to the ancestors of the current element (not included).-->
<xsl:template name="history">
    <xsl:param name="path" select="''"/>
    <xsl:variable name="count"><xsl:value-of select="string-length($path)-string-length(translate($path, '/', ''))"/></xsl:variable>
    <xsl:variable name="name"><xsl:value-of select="substring-before(substring-after($path, '/'), '/')"/></xsl:variable>
    <xsl:choose>
        <xsl:when test="string-length($name)">
            <xsl:text>/ [</xsl:text>
            <xsl:value-of select="$name"/>
            <xsl:text>](</xsl:text>
            <xsl:call-template name="repeatstr">
                <xsl:with-param name="depth" select="$count"/>
                <xsl:with-param name="string" select="'../'"/>
            </xsl:call-template>
            <xsl:value-of select="translate($name, ':', '_')"/>
            <xsl:text>.md) </xsl:text>
            <xsl:call-template name="history">
                <xsl:with-param name="path" select="substring-after($path, '/')"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text>/ [</xsl:text>
            <xsl:value-of select="substring-after($path, '/')"/>
            <xsl:text>](</xsl:text>
            <xsl:call-template name="repeatstr">
                <xsl:with-param name="depth" select="$count"/>
                <xsl:with-param name="string" select="'../'"/>
            </xsl:call-template>
            <xsl:value-of select="translate(substring-after($path, '/'), ':', '_')"/>
            <xsl:text>.md) /</xsl:text>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!--Output a warning message when there is no documentation string.-->
<xsl:template name="docwarning">
    <xsl:param name="path"/>
    <xsl:param name="vname"/>
    <xsl:param name="depth"/>
    <xsl:choose>
        <xsl:when test="string-length($path) and string-length($vname) and $depth = 0">
            <xsl:message>WARNING: NO DOCUMENTATION for <xsl:value-of select="substring-after(concat($path, '/', @name, '::', $vname), $root)"/>!</xsl:message>
        </xsl:when>
        <xsl:when test="string-length($path) and $depth = 0">
            <xsl:message>WARNING: NO DOCUMENTATION for <xsl:value-of select="substring-after(concat($path, '/', @name), $root)"/>!</xsl:message>
        </xsl:when>
        <xsl:when test="$depth = 0">
            <xsl:message>WARNING: NO DOCUMENTATION for /!</xsl:message>
        </xsl:when>
    </xsl:choose>
</xsl:template>

<!--Output a warning message when there is no comment option.-->
<xsl:template name="commentwarning">
    <xsl:param name="path"/>
    <xsl:param name="vname"/>
    <xsl:param name="current"/>
    <xsl:param name="count" select="0"/>

    <xsl:variable name="dpath" select="document($includedfiles)/descendant::r:define[@name=$current/child::r:ref[@name!='comment']/@name] | /descendant::r:define[@name=$current/child::r:ref[@name!='comment']/@name]" />
    <xsl:variable name="comment" select="$current/child::r:ref[@name='comment']"/>

    <xsl:choose>
        <xsl:when test="$dpath">
            <xsl:call-template name="commentwarning">
                <xsl:with-param name="path" select="$path"/>
                <xsl:with-param name="vname" select="$vname"/>
                <xsl:with-param name="current" select="$dpath"/>
                <xsl:with-param name="count" select="$count + count($comment)"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:when test="($count + count($comment)) = 0 and string-length($path) and string-length($vname)">
            <xsl:message>WARNING: NO COMMENT option for <xsl:value-of select="substring-after(concat($path, '/', @name, '::', $vname), $root)"/>!</xsl:message>
        </xsl:when>
        <xsl:when test="($count + count($comment)) = 0 and string-length($path)">
            <xsl:message>WARNING: NO COMMENT option for <xsl:value-of select="substring-after(concat($path, '/', @name), $root)"/>!</xsl:message>
        </xsl:when>
        <xsl:when test="($count + count($comment)) = 0">
            <xsl:message>WARNING: NO COMMENT option for /!</xsl:message>
        </xsl:when>
        <xsl:when test="($count + count($comment)) &gt; 1 and string-length($path) and string-length($vname)">
            <xsl:message>WARNING: MULTIPLE COMMENT options for <xsl:value-of select="substring-after(concat($path, '/', @name, '::', $vname), $root)"/>!</xsl:message>
        </xsl:when>
        <xsl:when test="($count + count($comment)) &gt; 1 and string-length($path)">
            <xsl:message>WARNING: MULTIPLE COMMENT options for <xsl:value-of select="substring-after(concat($path, '/', @name), $root)"/>!</xsl:message>
        </xsl:when>
        <xsl:when test="($count + count($comment)) &gt; 1">
            <xsl:message>WARNING: MULTIPLE COMMENT options for /!</xsl:message>
        </xsl:when>
    </xsl:choose>

</xsl:template>

</xsl:stylesheet>

