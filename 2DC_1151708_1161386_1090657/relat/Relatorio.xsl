<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:ns="http://www.dei.isep.ipp.pt/lprog">
    <xsl:output method="html" indent="yes"/>
    <!--Criar Elemento Raíz-->
    <xsl:template match="/">
        <xsl:apply-templates select="ns:relatório"/>
    </xsl:template>
    <!--Template Relatório-->
    <xsl:template match="ns:relatório">
        <html>
            <head>
                <link href="styling.css" rel="stylesheet"/>
            </head>
            <body>
                <xsl:apply-templates select="ns:páginaRosto"/>
            </body>
        </html>
    </xsl:template>
    <!--Template PáginaRosto-->
    <xsl:template match="ns:páginaRosto">
        <h2>
            <xsl:value-of select="ns:tema"/>
        </h2>
        <xsl:apply-templates select="ns:logotipoDEI"/>
        <xsl:apply-templates select="ns:disciplina"/>
        <xsl:call-template name="autores"/>
        <xsl:call-template name="infocapa"/>
    </xsl:template>
    <!-- Template LogotipoDei-->
    <xsl:template match="ns:logotipoDEI">
        <table id="logotipo" align ="center">
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select='.'/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    <xsl:value-of select='format-number(0.23,"0%")'/>
                </xsl:attribute>
                <xsl:attribute name="height">
                    <xsl:value-of select='format-number(0.35,"0%")'/>
                </xsl:attribute>
            </img>
        </table>
    </xsl:template>
    <!-- Template autores -->
    <xsl:template name="autores">
        <table id="autores" align="left">
            <tr>
                <th>Nome</th>
                <th>Número</th>
                <th>Mail</th>
            </tr>
            <xsl:for-each select="ns:autor">
                <tr>
                    <td>
                        <xsl:value-of select="ns:nome"/>
                    </td>
                    <td>
                        <xsl:value-of select="ns:número"/>
                    </td>
                    <td>
                        <xsl:value-of select="ns:mail"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    <!-- Template infoCapa-->
    <xsl:template name="infocapa">
        <table id="infoCapa" align="right">
            <tr>
                <th>Docentes:</th>
            </tr>
            <xsl:apply-templates select="ns:professor"/>
        </table>
    </xsl:template>
    <!--Template Disciplina-->
    <xsl:template match="ns:disciplina">
        <h3>
            <xsl:value-of select="ns:designação"/>  [<xsl:value-of select="ns:sigla"/>]
                                                    
        </h3>
        <h3>Ano Curricular:                                                                                         
            <xsl:value-of select="ns:anoCurricular"/>
        <p>Data:<xsl:value-of select="format-date(../ns:data,'[D01]-[M01]-[Y0001]')"/></p>
        </h3>
    </xsl:template>
    <!--Template Professores-->
    <xsl:template match="ns:professor">
        <tr>
            <td>
                <xsl:value-of select="@sigla"/> [<xsl:value-of select="@tipoAula"/>]
                                                                            
            </td>
        </tr>
        <br/>
    </xsl:template>
</xsl:stylesheet>