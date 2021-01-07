<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">

    <!-- VARS -->


    <!-- TEMPLATES -->
    
    <xsl:template name="backlink">
        <p>
            <span class="backlink">
                <xsl:text>Return to the </xsl:text>
                <a href="https://uwlib-cams.github.io/webviews/">CAMS webviews index</a>
            </span>
        </p>
    </xsl:template>

    <xsl:template name="lastUpdate">
        <p>
            <span class="lastUpdate">
                <xsl:text>This page last updated: </xsl:text>
                <xsl:value-of select="format-date(current-date(), '[Y0001]-[M01]-[D01]')"/>
            </span>
        </p>
    </xsl:template>

    <xsl:template name="CC0">
        <!-- Markup modified from output following form submission at Creative Commons for CC0 license usage -->
        <p xmlns:dct="http://purl.org/dc/terms/" xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#">
            <a rel="license" href="http://creativecommons.org/publicdomain/zero/1.0/">
                <img src="http://i.creativecommons.org/p/zero/1.0/88x31.png"
                    style="border-style: none;" alt="CC0"/>
            </a>
            <br/>
            <xsl:text>To the extent possible under law, </xsl:text>
            <a rel="dct:publisher" href="https://www.lib.washington.edu/cams">
                <span property="dct:title">
                    <xsl:text>Cataloging and Metadata Services, University of Washington Libraries</xsl:text>
                </span>
            </a>
            <xsl:text> has waived all copyright and related or neighboring rights to </xsl:text>
            <span property="dct:title">
                <xsl:text>CAMS Webviews</xsl:text>
            </span>
            <xsl:text>. This work is published from: </xsl:text>
            <span property="vcard:Country" datatype="dct:ISO3166" content="US"
                about="https://www.lib.washington.edu/cams">
                <xsl:text>United States</xsl:text>
            </span>
            <xsl:text>. </xsl:text>
        </p>
    </xsl:template>

</xsl:stylesheet>
