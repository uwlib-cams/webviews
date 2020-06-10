<?xml version="1.0" encoding="UTF-8"?>
<!-- NOTES:
    https://hackmd.io/@ries07/r1W0h6coI
    -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs math"
    version="3.0">
    <!-- Output HTML5 -->
    <xsl:output method="html" version="5"/>
    <!-- **Param required: Filepath to source file** -->
    <xsl:param name="source"/>
    <xsl:template match="/">
        <xsl:for-each
            select="('dvdVideo', 'eBook', 'etd', 'graphic', 'eGraphic', 'map', 'eMap', 'monograph', 'serial', 'eSerial', 'soundRecording', 'all')">
            <xsl:variable name="format" select="."/>
            <xsl:variable name="html-transform">
                
                <xsl:sequence
                    select="
                    let $t := transform(
                    map {
                    'stylesheet-location': 'rdfxml-to-html5-core.xsl',
                    'source-node': doc($source),
                    'stylesheet-params': map{QName('https://github.com/briesenberg07/bmrLIS/', 'format'): $format}
                    })
                    return $t?output"
                />
            </xsl:variable>
            <xsl:result-document href="../docs/rdainrdf/review_{$format}.html">
                <xsl:sequence select="$html-transform"/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
