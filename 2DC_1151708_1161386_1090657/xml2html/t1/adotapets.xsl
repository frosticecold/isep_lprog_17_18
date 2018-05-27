<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:ns="http://www.dei.isep.ipp.pt/lprog/adotapets">
    <?xml-stylesheet href="adotapets.xsl" type="text/xsl"?>
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <link href="styling.css" rel="stylesheet"/>
            </head>
            <body>
                <h2>Detalhes Animais</h2>
                <table id="Animais" border="1">
                    <tr bgcolor="#01DF01">
                        <th style="text-align:center"> Fotografia</th>
                        <th style="text-align:center"> Nome</th>
                        <th style="text-align:center"> Raça</th>
                        <th style="text-align:center"> Sexo</th>
                        <th style="text-align:center"> Idade</th>
                        <th style="text-align:center"> Peso</th>
                    </tr>
                    <xsl:for-each select="ns:ADOTAPets/ns:Animais/ns:Animal">
                        <tr>
                            <td style="text-align:center">
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="ns:Fotografia" />
                                    </xsl:attribute>
                                    <xsl:attribute name="width">70px</xsl:attribute>
                                    <xsl:attribute name="height">70px</xsl:attribute>
                                </img>
                            </td>
                            <td style="text-align:center">
                                <xsl:value-of select="ns:Nome"/>
                            </td>
                            <td style="text-align:center">
                                <xsl:value-of select="ns:Raca"/>
                            </td>
                            <td style="text-align:center">
                                <xsl:value-of select="ns:Sexo"/>
                            </td>
                            <td style="text-align:center">
                                <xsl:value-of select="ns:Idade"/>
                            </td>
                            <td style="text-align:center">
                                <xsl:value-of select="ns:Peso"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <br/>
                <br/>
                <form id ="form" method="post"></form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>