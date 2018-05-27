<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:ns="http://www.dei.isep.ipp.pt/lprog/adotapets">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <link href="t3.css" rel="stylesheet"/>
                <style type="text/css" media="screen">
                    #divID dt {
                        font-weight: bold;
                    }
                </style>
            </head>
            <body>
                <body id="backgroundIMG">
                    <h2>ADOTAPets</h2>
                </body>
                <br/>
                <br/>
                <br/>
                <br/>
                <h3>Cães</h3>
                <table id="Animais" border="1">
                    <tr bgcolor="#01DF01">
                        <th style="text-align:center"> Nome</th>
                        <th style="text-align:center"> Raça</th>
                        <th style="text-align:center"> Sexo</th>
                        <th style="text-align:center"> Idade</th>
                        <th style="text-align:center"> Peso</th>
                    </tr>
                    <xsl:for-each select="ns:ADOTAPets/ns:Animais/ns:Animal">
                        <xsl:choose>
                            <xsl:when test="@TipoAnimal ='Cão' or @TipoAnimal='cão'">
                                <tr>
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
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
                <hr/>
                <h3>Gatos</h3>
                <table id="Animais2" border="1">
                    <tr bgcolor="#01DF01">
                        <th style="text-align:center"> Nome</th>
                        <th style="text-align:center"> Raça</th>
                        <th style="text-align:center"> Sexo</th>
                        <th style="text-align:center"> Idade</th>
                        <th style="text-align:center"> Peso</th>
                    </tr>
                    <xsl:for-each select="ns:ADOTAPets/ns:Animais/ns:Animal">
                        <xsl:choose>
                            <xsl:when test="@TipoAnimal ='Gato' or @TipoAnimal='gato'">
                                <tr>
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
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
                <hr/>
                <h3>Outros</h3>
                <table id="Animais3" border="1">
                    <tr bgcolor="#01DF01">
                        <th style="text-align:center"> Nome</th>
                        <th style="text-align:center"> Raça</th>
                        <th style="text-align:center"> Sexo</th>
                        <th style="text-align:center"> Idade</th>
                        <th style="text-align:center"> Peso</th>
                    </tr>
                    <xsl:for-each select="ns:ADOTAPets/ns:Animais/ns:Animal">
                        <xsl:choose>
                            <xsl:when test="@TipoAnimal ='Outro' or @TipoAnimal='outro'">
                                <tr>
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
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>