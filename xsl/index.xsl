<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">
    <!-- Output HTML5 -->
    <xsl:output method="html" version="5"/>
    <!-- Include external stylesheets and templates -->
    <xsl:include href="common-elements.xsl"/>
    <!-- Start templates -->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta charset="utf-8"/>
                <link href="index.css" rel="stylesheet" type="text/css"/>
                <title>cams webviews</title>
            </head>
            <body>
                <h1>
                    <span class="indexTop">University of Washington Libraries Cataloging and
                        Metadata Services:<br/>Web views for selected resources</span>
                </h1>
                <h2>
                    <span class="indexHeading">RDA-in-RDF Application Profiles</span>
                </h2>
                <p>Profiles by format:</p>
                <ul>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdaprofiles/WAU.profile.RDA.dvdVideo.html"
                            >DVD Videos</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdaprofiles/WAU.profile.RDA.eBook.html"
                            >e-Books</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdaprofiles/WAU.profile.RDA.eGraphic.html"
                            >Electronic Graphic Materials</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdaprofiles/WAU.profile.RDA.eMap.html"
                            >Electronic Maps</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdaprofiles/WAU.profile.RDA.eSerial.html"
                            >Electronic Serials</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdaprofiles/WAU.profile.RDA.etd.html"
                            >Electronic Theses and Dissertations</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdaprofiles/WAU.profile.RDA.graphic.html"
                            >Graphic Materials</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdaprofiles/WAU.profile.RDA.map.html"
                            >Maps</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdaprofiles/WAU.profile.RDA.monograph.html"
                            >Monographs</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdaprofiles/WAU.profile.RDA.serial.html"
                            >Serials</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdaprofiles/WAU.profile.RDA.soundRecording.html"
                            >Sound Recordings</a>
                    </li>
                </ul>
                <h2>
                    <span class="indexHeading">RDA-in-RDF Catalog Data</span>
                </h2>
                <p>Data presented by format:</p>
                <ul>
                    <!-- NO DATA YET for e-Serials 2020-06-18 -->
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdainrdf/review_all.html"
                            >All UW Sinopia data</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdainrdf/review_dvdVideo.html"
                            >DVD Videos</a>
                    </li>
                    <li>
                        <a href="https://uwlib-cams.github.io/webviews/rdainrdf/review_eBook.html"
                            >e-Books</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdainrdf/review_eGraphic.html"
                            >Electronic Graphic Materials</a>
                    </li>
                    <li>
                        <a href="https://uwlib-cams.github.io/webviews/rdainrdf/review_eMap.html"
                            >Electronic Maps</a>
                    </li>
                    <li>
                        <a href="https://uwlib-cams.github.io/webviews/rdainrdf/review_etd.html"
                            >Electronic Theses and Dissertations</a>
                    </li>
                    <li>
                        <a href="https://uwlib-cams.github.io/webviews/rdainrdf/review_graphic.html"
                            >Graphic Materials</a>
                    </li>
                    <li>
                        <a href="https://uwlib-cams.github.io/webviews/rdainrdf/review_map.html"
                            >Maps</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdainrdf/review_monograph.html"
                            >Monographs</a>
                    </li>
                    <li>
                        <a href="https://uwlib-cams.github.io/webviews/rdainrdf/review_serial.html"
                            >Serials</a>
                    </li>
                    <li>
                        <a
                            href="https://uwlib-cams.github.io/webviews/rdainrdf/review_soundRecording.html"
                            >Sound Recordings</a>
                    </li>
                </ul>
                <hr/>
                <xsl:call-template name="lastUpdate"/>
                <xsl:call-template name="CC0"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
