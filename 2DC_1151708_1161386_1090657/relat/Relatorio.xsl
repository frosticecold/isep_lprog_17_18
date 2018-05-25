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
        <h3>
            <xsl:value-of select="ns:designação"/>  [
                        
            <xsl:value-of select="ns:sigla"/>]
                
        </h3>
        <h3>Ano Curricular:                                                                                                                             
            <xsl:value-of select="ns:anoCurricular"/>
            <p>Data:
                                
                <xsl:value-of select="format-date(../ns:data,'[D01]-[M01]-[Y0001]')"/>
            </p>
        </h3>
    </xsl:template>
    <!-- Template autores -->
    <xsl:template name="autores">
        <div style="float:left; text-align:left;">
            <xsl:for-each select="ns:autor">
                <p>
                    <b>
                        <xsl:value-of select="ns:nome"/>
                    </b>
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
            <td>
                <xsl:value-of select="@sigla"/> [<xsl:value-of select="@tipoAula"/>]
                        
            </td>
        </p>
    </xsl:template>
    <!--Template Corpo-->
    <xsl:template match="ns:corpo">
        <!-- Indice-->
        <h2>Indice</h2>
        <ol>
            <xsl:for-each select="//*[@tituloSecção]">
                <li>
                    <a><xsl:attribute name="href">#<xsl:value-of select="@id"/></xsl:attribute>
                        <xsl:value-of select="@tituloSecção"/>
                    </a>
                </li>
            </xsl:for-each>
        </ol>
        <!-- Introdução-->
        <!-- Outras Secções-->

        <xsl:apply-templates select="ns:introdução"/>
        <xsl:apply-templates select="ns:outrasSecções"/>
        <xsl:apply-templates select="ns:conclusão"/>
        <xsl:apply-templates select="ns:referências"/>
    </xsl:template>
    <!-- Template Introdução-->
    <xsl:template match="ns:introdução">
            <h2><xsl:attribute name="id"><xsl:value-of select="@id"/>
            </xsl:attribute>Introdução</h2>
            <xsl:apply-templates select="ns:parágrafo"/>
    </xsl:template>
    <!-- Template Paragrafo-->
    <xsl:template match="ns:parágrafo">
    <p><xsl:value-of select="."/>
    </p>
    </xsl:template>
    <!-- Template Outras Secções-->
    <xsl:template match="ns:outrasSecções">
    <xsl:for-each select="./*">
    <h2><xsl:attribute name="id"><xsl:value-of select="@id"/>
            </xsl:attribute><xsl:value-of select="@tituloSecção"/></h2>
        <xsl:apply-templates select="ns:parágrafo"/>
    </xsl:for-each>
    </xsl:template>
    <!-- Template Conclusão-->
    <xsl:template match="ns:conclusão">
     <h2><xsl:attribute name="id"><xsl:value-of select="@id"/>
            </xsl:attribute><xsl:value-of select="@tituloSecção"/></h2>
        <xsl:apply-templates select="ns:parágrafo"/>
    </xsl:template>
    <!-- Template Referências -->
    <xsl:template match="ns:referências">
     <h2><xsl:attribute name="id"><xsl:value-of select="@id"/>
            </xsl:attribute><xsl:value-of select="@tituloSecção"/></h2>
            <xsl:apply-templates select="ns:refBibliográfica"/>
    </xsl:template>
    <!-- Template refBibliográfica-->
    <xsl:template match="ns:refBibliográfica">
    Título:<xsl:value-of select="ns:título"/>   Data Publicação:<xsl:value-of select="ns:dataPublicação"/>
    Autor:<xsl:value-of select="ns:autor"/>
    </xsl:template>
</xsl:stylesheet>