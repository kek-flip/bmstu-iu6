<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Response</title>
                <meta charset="utf-8">
            </head>

            <body>
                <table id="lucky-nums-table" border = "1">
                    <thead>
                        <th>Число</th>
                        <th>Сумма слева и справа</th>
                    </thead>
                    <tbody>
                    <xsl:for-each select="objects/object">
                        <td><xsl:value-of select="num"></xsl:value-of></td>
                        <td><xsl:value-of select="sum"></xsl:value-of></td>
                    </xsl:for-each>
                    </tbody>
                </table> 
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>