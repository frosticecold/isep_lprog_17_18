<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:ns="http://www.dei.isep.ipp.pt/lprog/adotapets">
    <?xml-stylesheet href="adotapets.xsl" type="text/xsl"?>
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    #Animais {
                        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                        border-collapse: collapse;
                        width: 100%;
                    }

                    #Animais td, #Animais th {
                        border: 1px solid #ddd;
                        padding: 8px;
                    }

                    #Animais tr:nth-child(even){background-color: #f2f2f2;}

                    #Animais tr:hover {background-color: #ddd;}

                    #Animais th {
                        padding-top: 12px;
                        padding-bottom: 12px;
                        text-align: left;
                        background-color: #4CAF50;
                        color: white;
                    }
</style>
            </head>
            <body>
                <h2>Animal Details</h2>
                <table id="Animais" border="1">
                    <tr bgcolor="#01DF01">
                        <th style="text-align:center"> Tipo Animal</th>
                        <th style="text-align:center"> Nome</th>
                        <th style="text-align:center"> Raça</th>
                        <th style="text-align:center"> Sexo</th>
                        <th style="text-align:center"> Idade</th>
                        <th style="text-align:center"> Peso</th>
                    </tr>
                    <xsl:for-each select="ns:ADOTAPets/ns:Animais/ns:Animal">
                        <tr>
                            <td style="text-align:center">
                                <xsl:value-of select="@TipoAnimal"/>
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