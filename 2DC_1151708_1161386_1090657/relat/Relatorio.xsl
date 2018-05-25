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
                <!--<link href="styling.css" rel="stylesheet"/>-->
            </head>
            <body>
                <xsl:apply-templates select="ns:páginaRosto"/>
                <xsl:apply-templates select="ns:corpo"/>
            </body>
        </html>
    </xsl:template>
    <!--Template PáginaRosto-->
    <xsl:template match="ns:páginaRosto">
        <div style="width:100%; display:table;">
        <center>
        <h2>
            <xsl:value-of select="ns:tema"/>
        </h2>
        <xsl:apply-templates select="ns:logotipoDEI"/>
        <xsl:apply-templates select="ns:disciplina"/>
        <div style="width:100%; display:table;">
        <xsl:call-template name="autores"/>
        <xsl:call-template name="infocapa"/>
        </div>
        </center>
        </div>
    </xsl:template>
    <!-- Template LogotipoDei-->
    <xsl:template match="ns:logotipoDEI">
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
    </xsl:template>
    <!--Template Disciplina-->
    <xsl:template match="ns:disciplina">
        <h3><xsl:value-of select="ns:designação"/>  [<xsl:value-of select="ns:sigla"/>]</h3>
        <h3>Ano Curricular:                                                                                         
            <xsl:value-of select="ns:anoCurricular"/>
        <p>Data:<xsl:value-of select="format-date(../ns:data,'[D01]-[M01]-[Y0001]')"/></p>
        </h3>
    </xsl:template>
    <!-- Template autores -->
    <xsl:template name="autores">
    <div style="float:left; text-align:left;">
            <xsl:for-each select="ns:autor">
                        <p><b><xsl:value-of select="ns:nome"/></b>
                         <xsl:value-of select="ns:número"/>
                         <xsl:value-of select="ns:mail"/>
                        </p>
                    
            </xsl:for-each>
    </div>
    </xsl:template>
    <!-- Template infoCapa-->
    <xsl:template name="infocapa">
        <div style="float:right; text-align:center;">
                <p>Docentes:</p>
            <xsl:apply-templates select="ns:professor"/>
        </div>
    </xsl:template>
    <!--Template Professores-->
    <xsl:template match="ns:professor">
        <p>
            <td><xsl:value-of select="@sigla"/> [<xsl:value-of select="@tipoAula"/>]</td>
        </p>
    </xsl:template>

    <!--Template Corpo-->
    <xsl:template match="ns:corpo">
    <xsl:call-template name="Indice"/>
    </xsl:template>

    <xsl:template name="Indice">
    <table id="Indice"><h2>Indice</h2>
    </table>
    </xsl:template>
</xsl:stylesheet>