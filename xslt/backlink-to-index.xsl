<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- generate backlink to the index of a given GitHub Pages site -->
    
    <!-- TO DO: provide mechanism to link to correct index page -->
    <xsl:template name="webviews_backlink">
        <p>
            <span class="backlink">
                <xsl:text>Return to the </xsl:text>
                <a href="https://uwlib-cams.github.io/webviews/">CAMS webviews index</a>
            </span>
        </p>
    </xsl:template>
    
</xsl:stylesheet>