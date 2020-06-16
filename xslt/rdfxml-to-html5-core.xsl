<?xml version="1.0" encoding="UTF-8"?>
<!-- NOTES:
    https://hackmd.io/@ries07/r1W0h6coI
    -->
<!-- *REASSIGN MATCHING NAMESPACES IN SOURCE DATA BEFORE EACH TRANSFORM*
    TO DO: Change rdfLibSer.py to eassign namespaces when serializing -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:rdam="http://rdaregistry.info/Elements/m/"
    xmlns:uwexpw="http://uw.edu/adaptationProperties/p/w/"
    xmlns:rdau="http://rdaregistry.info/Elements/u/" xmlns:sinvoc="http://sinopia.io/vocabulary/"
    xmlns:rdaw="http://rdaregistry.info/Elements/w/"
    xmlns:rdae="http://rdaregistry.info/Elements/e/"
    xmlns:uwrdaex="https://doi.org/10.6069/uwlib.55.d.4#"
    xmlns:rdai="http://rdaregistry.info/Elements/i/"
    xmlns:bf="http://id.loc.gov/ontologies/bibframe/"
    xmlns:madsrdf="http://www.loc.gov/mads/rdf/v1#" xmlns:bflc="http://id.loc.gov/ontologies/bflc/"
    xmlns:rdamdt="http://rdaregistry.info/Elements/m/datatype/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:xpf="http://www.w3.org/2005/xpath-functions"
    xmlns:brgh="https://github.com/briesenberg07/bmrLIS/" exclude-result-prefixes="xs math"
    version="3.0">
    <!-- Include external stylesheets and templates -->
    <xsl:include href="rdfxml-to-html5-props-values.xsl"/>
    <xsl:include href="common-elements.xsl"/>
    <!-- Parameters -->
    <xsl:param name="brgh:format"/>
    <!-- Vars -->
    <xsl:variable name="break">
        <strong>
            <xsl:text>  |  </xsl:text>
        </strong>
    </xsl:variable>
    <xsl:variable name="templateId">
        <xsl:choose>
            <!-- Output all-formats-in-one -->
            <xsl:when test="$brgh:format = 'dvdVideo'">WAU:RT:RDA:Work:dvdVideo</xsl:when>
            <xsl:when test="$brgh:format = 'eBook'">WAU:RT:RDA:Work:eBook</xsl:when>
            <xsl:when test="$brgh:format = 'etd'">WAU:RT:RDA:Work:etd</xsl:when>
            <xsl:when test="$brgh:format = 'graphic'">WAU:RT:RDA:Work:graphic</xsl:when>
            <xsl:when test="$brgh:format = 'eGraphic'">WAU:RT:RDA:Work:eGraphic</xsl:when>
            <xsl:when test="$brgh:format = 'map'">WAU:RT:RDA:Work:map</xsl:when>
            <xsl:when test="$brgh:format = 'eMap'">WAU:RT:RDA:Work:eMap</xsl:when>
            <xsl:when test="$brgh:format = 'monograph'">WAU:RT:RDA:Work:monograph</xsl:when>
            <xsl:when test="$brgh:format = 'serial'">WAU:RT:RDA:Work:serial</xsl:when>
            <xsl:when test="$brgh:format = 'sSerial'">WAU:RT:RDA:Work:eSerial</xsl:when>
            <xsl:when test="$brgh:format = 'soundRecording'"
                >WAU:RT:RDA:Work:soundRecording</xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:variable>
    <!-- Start templates -->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta charset="utf-8"/>
                <title>
                    <xsl:text>review_</xsl:text>
                    <xsl:value-of select="$brgh:format"/>
                </title>
                <link href="htmlData.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <xsl:call-template name="lastUpdate"/>
                <xsl:apply-templates select="rdf:RDF"/>
                <hr/>
                <xsl:call-template name="CC0"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="rdf:RDF">
        <xsl:apply-templates
            select="rdf:Description[rdf:type[@rdf:resource = 'http://rdaregistry.info/Elements/c/C10001']][sinvoc:hasResourceTemplate = $templateId]"
            mode="wemiTop"/>
    </xsl:template>
    <xsl:template
        match="rdf:Description[rdf:type[@rdf:resource = 'http://rdaregistry.info/Elements/c/C10001']]"
        mode="wemiTop">
        <xsl:choose>
            <!-- Exclude certain sets -->
            <xsl:when test="rdaw:P10331[text() != '' and text() != 'test' and text() != 'void']">

                <h1>
                    <span class="descSet">
                        <xsl:text>Description Set: </xsl:text>
                        <xsl:value-of select="rdaw:P10331"/>
                    </span>
                </h1>
                <xsl:apply-templates select="." mode="wProps"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template
        match="rdf:Description[rdf:type[@rdf:resource = 'http://rdaregistry.info/Elements/c/C10001']]"
        mode="wProps">
        <xsl:param name="wIri" select="@rdf:about"/>
        <xsl:param name="bNode" select="bf:adminMetadata/@rdf:nodeID"/>
        <h2>
            <span class="work">
                <xsl:text>Statements on the  </xsl:text>
                <a href="http://rdaregistry.info/Elements/c/C10001">
                    <xsl:text>RDA Work</xsl:text>
                </a>
                <xsl:text> Resource</xsl:text>
            </span>
        </h2>
        <span class="sinopiaUrl">
            <xsl:text>Copy </xsl:text>
            <a href="{@rdf:about}">
                <xsl:text>this URL</xsl:text>
            </a>
            <xsl:text> to search for and edit this resource in Sinopia</xsl:text>
        </span>
        <!-- ul to ul code block identical for W, E, M, and I
            *So probably could further improve code to avoid repetition
            (How to? Put code in var, but then use what? Copy-of?)
            TO DO:
                Apply changes here to E, M, I -->
        <ul>
            <xsl:for-each select="*[@rdf:resource]">
                <xsl:variable name="rForLabel" select="@rdf:resource"/>
                <li>
                    <xsl:call-template name="property">
                        <xsl:with-param name="p" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="$break"/>
                    <xsl:call-template name="val_resource">
                        <xsl:with-param name="r" select="@rdf:resource"/>
                    </xsl:call-template>
                </li>
            </xsl:for-each>
            <xsl:for-each select="*[not(@rdf:resource | @rdf:nodeID)]">
                <li>
                    <xsl:call-template name="property">
                        <xsl:with-param name="p" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="$break"/>
                    <xsl:call-template name="val_literal">
                        <xsl:with-param name="l" select="."/>
                    </xsl:call-template>
                </li>
            </xsl:for-each>
            <!-- AdminMetadata (bnode) apply-template should be conditional, not all description sets include it --> 
            <li>
                <span class="aMDTop">
                    <xsl:text>Administrative Metadata</xsl:text>
                </span>
                <xsl:apply-templates select="../rdf:Description[@rdf:nodeID = $bNode]" mode="bNode"
                />
            </li>
        </ul>
        <xsl:apply-templates
            select="../rdf:Description[rdf:type[@rdf:resource = 'http://rdaregistry.info/Elements/c/C10006']][rdae:P20231/@rdf:resource = $wIri]"
            mode="eProps"/>
    </xsl:template>
    <xsl:template
        match="rdf:Description[rdf:type[@rdf:resource = 'http://rdaregistry.info/Elements/c/C10006']]"
        mode="eProps">
        <xsl:param name="eIri" select="@rdf:about"/>
        <xsl:param name="bNode" select="bf:adminMetadata/@rdf:nodeID"/>
        <!-- Visually connect or otherwise make apparent when multiple EM(I) sets per W exist? -->
        <h2>
            <span class="expression">
                <xsl:text>Statements on an </xsl:text>
                <a href="http://rdaregistry.info/Elements/c/C10006">
                    <xsl:text>RDA Expression</xsl:text>
                </a>
                <xsl:text> Resource</xsl:text>
            </span>
        </h2>
        <span class="sinopiaUrl">
            <xsl:text>Copy </xsl:text>
            <a href="{@rdf:about}">
                <xsl:text>this URL</xsl:text>
            </a>
            <xsl:text> to search for and edit this resource in Sinopia</xsl:text>
        </span>
        <!-- ul to ul code block identical for W, E, M, and I -->
        <ul>
            <xsl:for-each select="*[@rdf:resource]">
                <li>
                    <xsl:call-template name="property">
                        <xsl:with-param name="p" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="$break"/>
                    <xsl:call-template name="val_resource">
                        <xsl:with-param name="r" select="@rdf:resource"/>
                    </xsl:call-template>
                </li>
            </xsl:for-each>
            <xsl:for-each select="*[not(@rdf:resource | @rdf:nodeID)]">
                <li>
                    <xsl:call-template name="property">
                        <xsl:with-param name="p" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="$break"/>
                    <xsl:call-template name="val_literal">
                        <xsl:with-param name="l" select="."/>
                    </xsl:call-template>
                </li>
            </xsl:for-each>
            <!-- Make AM apply-template conditional -->
            <li>
                <span class="aMDTop">
                    <xsl:text>Administrative Metadata</xsl:text>
                </span>
                <xsl:apply-templates select="../rdf:Description[@rdf:nodeID = $bNode]" mode="bNode"
                />
            </li>
        </ul>
        <xsl:apply-templates
            select="../rdf:Description[rdf:type[@rdf:resource = 'http://rdaregistry.info/Elements/c/C10007']][rdam:P30139/@rdf:resource = $eIri]"
            mode="mProps"/>
    </xsl:template>
    <xsl:template
        match="rdf:Description[rdf:type[@rdf:resource = 'http://rdaregistry.info/Elements/c/C10007']]"
        mode="mProps">
        <xsl:param name="mIri" select="@rdf:about"/>
        <xsl:param name="bNode" select="bf:adminMetadata/@rdf:nodeID"/>
        <h2>
            <span class="manifestation">
                <xsl:text>Statements on an </xsl:text>
                <a href="http://rdaregistry.info/Elements/c/C10007">
                    <xsl:text>RDA Manifestation</xsl:text>
                </a>
                <xsl:text> Resource</xsl:text>
            </span>
        </h2>
        <span class="sinopiaUrl">
            <xsl:text>Copy </xsl:text>
            <a href="{@rdf:about}">
                <xsl:text>this URL</xsl:text>
            </a>
            <xsl:text> to search for and edit this resource in Sinopia</xsl:text>
        </span>
        <!-- ul to ul code block identical for W, E, M, and I -->
        <ul>
            <xsl:for-each select="*[@rdf:resource]">
                <li>
                    <xsl:call-template name="property">
                        <xsl:with-param name="p" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="$break"/>
                    <xsl:call-template name="val_resource">
                        <xsl:with-param name="r" select="@rdf:resource"/>
                    </xsl:call-template>
                </li>
            </xsl:for-each>
            <xsl:for-each select="*[not(@rdf:resource | @rdf:nodeID)]">
                <li>
                    <xsl:call-template name="property">
                        <xsl:with-param name="p" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="$break"/>
                    <xsl:call-template name="val_literal">
                        <xsl:with-param name="l" select="."/>
                    </xsl:call-template>
                </li>
            </xsl:for-each>
            <!-- Make AM apply-template conditional -->
            <li>
                <span class="aMDTop">
                    <xsl:text>Administrative Metadata</xsl:text>
                </span>
                <xsl:apply-templates select="../rdf:Description[@rdf:nodeID = $bNode]" mode="bNode"
                />
            </li>
        </ul>
        <xsl:apply-templates
            select="../rdf:Description[rdf:type[@rdf:resource = 'http://rdaregistry.info/Elements/c/C10003']][rdai:P40049/@rdf:resource = $mIri]"
            mode="iProps"/>
    </xsl:template>
    <xsl:template
        match="rdf:Description[rdf:type[@rdf:resource = 'http://rdaregistry.info/Elements/c/C10003']]"
        mode="iProps">
        <xsl:param name="bNode" select="bf:adminMetadata/@rdf:nodeID"/>
        <h2>
            <span class="item">
                <xsl:text>Statements on an </xsl:text>
                <a href="http://rdaregistry.info/Elements/c/C10003">
                    <xsl:text>RDA Item</xsl:text>
                </a>
                <xsl:text> Resource</xsl:text>
            </span>
        </h2>
        <span class="sinopiaUrl">
            <xsl:text>Copy </xsl:text>
            <a href="{@rdf:about}">
                <xsl:text>this URL</xsl:text>
            </a>
            <xsl:text> to search for and edit this resource in Sinopia</xsl:text>
        </span>
        <!-- ul to ul code block identical for W, E, M, and I -->
        <ul>
            <xsl:for-each select="*[@rdf:resource]">
                <li>
                    <xsl:call-template name="property">
                        <xsl:with-param name="p" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="$break"/>
                    <xsl:call-template name="val_resource">
                        <xsl:with-param name="r" select="@rdf:resource"/>
                    </xsl:call-template>
                </li>
            </xsl:for-each>
            <xsl:for-each select="*[not(@rdf:resource | @rdf:nodeID)]">
                <li>
                    <xsl:call-template name="property">
                        <xsl:with-param name="p" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="$break"/>
                    <xsl:call-template name="val_literal">
                        <xsl:with-param name="l" select="."/>
                    </xsl:call-template>
                </li>
            </xsl:for-each>
            <!-- Make AM apply-template conditional -->
            <li>
                <span class="aMDTop">
                    <xsl:text>Administrative Metadata</xsl:text>
                </span>
                <xsl:apply-templates select="../rdf:Description[@rdf:nodeID = $bNode]" mode="bNode"
                />
            </li>
        </ul>
    </xsl:template>
    <xsl:template match="rdf:Description" mode="bNode">
        <ul class="aMDStatements">
            <xsl:for-each select="*[@xml:lang]">
                <li>
                    <xsl:call-template name="property">
                        <xsl:with-param name="p" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="$break"/>
                    <xsl:call-template name="val_literal">
                        <xsl:with-param name="l" select="."/>
                    </xsl:call-template>
                </li>
            </xsl:for-each>
            <xsl:for-each select="*[@rdf:resource]">
                <li>
                    <xsl:call-template name="property">
                        <xsl:with-param name="p" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="$break"/>
                    <xsl:call-template name="val_resource">
                        <xsl:with-param name="r" select="@rdf:resource"/>
                    </xsl:call-template>
                </li>
            </xsl:for-each>
            <xsl:for-each select="*[@rdf:nodeID]">
                <li>
                    <xsl:call-template name="property">
                        <xsl:with-param name="p" select="."/>
                    </xsl:call-template>
                    <xsl:value-of select="$break"/>
                    <xsl:call-template name="aMDStatus">
                        <xsl:with-param name="statusBNode" select="@rdf:nodeID"/>
                    </xsl:call-template>
                </li>
            </xsl:for-each>
            <xsl:for-each select="*[not(@rdf:resource | @xml:lang | @rdf:nodeID)]">
                <!-- Reproduce similar for WEMI props to confirm no unexpected element attributes? -->
                <!-- Fix for unexpected AM statement types that are in output -->
                <xsl:text>UNEXPECTED ADMIN METADATA STATEMENT TYPE</xsl:text>
            </xsl:for-each>
        </ul>
    </xsl:template>
</xsl:stylesheet>
