<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:ns="http://www.dei.isep.ipp.pt/lprog/adotapets">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <link href="styling.css" rel="stylesheet"/>
                <style type="text/css" media="screen">
                    #divID dt {
                        font-weight: bold;
                    }
                </style>
            </head>
            <body>
                <h2>Detalhes Animais</h2>
                <xsl:for-each select="ns:ADOTAPets/ns:Animais/ns:Animal">
                    <h3>Dados</h3>
                    <h3>
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select="ns:Fotografia" />
                            </xsl:attribute>
                            <xsl:attribute name="width">70px</xsl:attribute>
                            <xsl:attribute name="height">70px</xsl:attribute>
                        </img>
                    </h3>
                    <div id="divID">
                        <dl id="Animais">
                            <dt>Tipo Animal:</dt>
                            <dd>
                                <xsl:value-of select="@TipoAnimal"/>
                            </dd>
                            <dt>Nome:</dt>
                            <dd>
                                <xsl:value-of select="ns:Nome"/>
                            </dd>
                            <dt>Raça:</dt>
                            <dd>
                                <xsl:value-of select="ns:Raca"/>
                            </dd>
                            <dt>Sexo:</dt>
                            <dd>
                                <xsl:value-of select="ns:Sexo"/>
                            </dd>
                            <dt>Peso:</dt>
                            <dd>
                                <xsl:value-of select="ns:Peso"/>
                            </dd>
                            <dt>Idade:</dt>
                            <dd>
                                <xsl:value-of select="ns:Idade"/>
                            </dd>
                        </dl>
                    </div>
                    <h3>Vacinas</h3>
                    <table id="Vacinas" border="1">
                        <tr bgcolor="#01DF01">
                            <th style="text-align:center"> Nome</th>
                            <th style="text-align:center"> Data Administração</th>
                            <th style="text-align:center"> Validade</th>
                        </tr>
                        <xsl:for-each select="ns:Vacinas/ns:Vacina">
                            <tr>
                                <td style="text-align:center">
                                    <xsl:value-of select="@Nome"/>
                                </td>
                                <td style="text-align:center">
                                    <xsl:value-of select="ns:DataAdministracao"/>
                                </td>
                                <td style="text-align:center">
                                    <xsl:value-of select="ns:Validade"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <p/>
                    <br/>
                    <hr/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>