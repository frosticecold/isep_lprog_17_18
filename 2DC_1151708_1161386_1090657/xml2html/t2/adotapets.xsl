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
                <h2>Animal Details</h2>
                <xsl:for-each select="ns:ADOTAPets/ns:Animais/ns:Animal">
                    <h3>Dados</h3>
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
                    <h3>Vacinas</h3>
                    <table id="Animais" border="1">
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
                    <hr/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>