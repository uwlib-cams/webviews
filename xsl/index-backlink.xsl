<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- generate backlink to the index of a given GitHub Pages site -->

    <xsl:template name="index-backlink">
        <xsl:param name="site"/>
        <span class="backlink">
            <xsl:choose>
                <!-- [!] CAUTION relative paths depend on repo directory structure -->
                <xsl:when test="$site = 'webviews'">
                    <a href="https://uwlib-cams.github.io/webviews/">CAMS webviews</a>
                </xsl:when>
                <xsl:when test="$site = 'contentdm_maps'">
                    <a href="https://www.lib.washington.edu/cams/mig/datadicts">MIG Data
                        Dictionaries</a>
                </xsl:when>
                <xsl:when test="$site = 'sinopia_maps'">
                    <a href="https://uwlib-cams.github.io/sinopia_maps/">Sinopia MAPs</a>
                </xsl:when>
                <xsl:otherwise>ERROR - webviews > index-backlink.xsl</xsl:otherwise>
            </xsl:choose>
        </span>
    </xsl:template>

</xsl:stylesheet>
