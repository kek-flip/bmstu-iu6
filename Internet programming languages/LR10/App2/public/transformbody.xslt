<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <a href="/">Back to input</a>
                <br></br>
                <br></br>
                <table id="lucky-nums-table" border = "1">
                    <thead>
                        <th>Number</th>
                        <th>Left and right sum</th>
                    </thead>
                    <tbody>
                    <xsl:for-each select="objects/object">
                        <tr>
                            <td><xsl:value-of select="num"></xsl:value-of></td>
                            <td><xsl:value-of select="sum"></xsl:value-of></td>
                        </tr>
                    </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html> 
    </xsl:template>
</xsl:stylesheet>