<?xml version="1.0" encoding="UTF-8"?>
<!-- NOTES:
  https://hackmd.io/@ries07/S1h-Yae9L
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <!-- Output HTML5 -->
    <xsl:output method="html" version="5"/>
    <xsl:param name="sourceURL"/>
    <xsl:template match="/">
        <xsl:for-each
            select="('adminMetadata', 'dvdVideo', 'eBook', 'eGraphic', 'eMap', 'eSerial', 'etd', 'graphic', 'map', 'monograph', 'serial', 'soundRecording')">
            <xsl:variable name="format" select="."/>
            <xsl:variable name="html-transform">
                <xsl:sequence
                    select="
                        let $t := transform(
                        map {
                            'stylesheet-location': 'profiles-to-html5-core.xsl',
                            'source-node': unparsed-text($sourceURL) => json-to-xml(),
                            'stylesheet-params': map {QName('https://github.com/briesenberg07/bmrLIS/', 'format'): $format}
                        })
                        return
                            $t?output"
                />
            </xsl:variable>
            <xsl:result-document href="../docs/rdaprofiles/WAU.profile.RDA.{$format}.html">
                <xsl:sequence select="$html-transform"/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
