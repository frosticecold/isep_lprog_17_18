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
                <xsl:apply-templates select="ns:corpo"/>
                <xsl:apply-templates select="ns:anexos"/>
            </body>
        </html>
    </xsl:template>
    <!--Template PáginaRosto-->
    <xsl:template match="ns:páginaRosto">
        <div style="width:100%; display:table;">
            <center>
                <xsl:apply-templates select="ns:logotipoDEI"/>
                <h2 style="margin-left: 0%;">
                    <xsl:value-of select="ns:tema"/>
                </h2>     
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
            <xsl:attribute name="align">
                <xsl:value-of select="middle"/>
            </xsl:attribute>
        </img>
    </xsl:template>
    <!--Template Disciplina-->
    <xsl:template match="ns:disciplina">
        <div align="center">
        <h3 style="margin-left: 0%;">
            <xsl:value-of select="ns:designação"/>  [
                        
            <xsl:value-of select="ns:sigla"/>]
                
        </h3>
        <h3 style="margin-left: 0%;">Ano Curricular:                                                                                                                             
            <xsl:value-of select="ns:anoCurricular"/>
            <p>Data:
                                
                <xsl:value-of select="format-date(../ns:data,'[D01]-[M01]-[Y0001]')"/>
            </p>
        </h3>
        </div>
    </xsl:template>
    <!-- Template autores -->
    <xsl:template name="autores">
        <div style="float:left; text-align:left; margin-left:10%">
            <xsl:for-each select="ns:autor">
                <p>
                    <b><xsl:value-of select="ns:nome"/></b> - 
                    <xsl:value-of select="ns:número"/>  - 
                    <xsl:value-of select="ns:mail"/>
                </p>
            </xsl:for-each>
        </div>
    </xsl:template>
    <!-- Template infoCapa-->
    <xsl:template name="infocapa">
        <div style="float:right; text-align:center;margin-right:15%">
            <p id="profsH">Docentes:</p>
            <xsl:apply-templates select="ns:professor"/>
        </div>
    </xsl:template>
    <!--Template Professores-->
    <xsl:template match="ns:professor">
        <p>
            <td id="profs">
                <xsl:value-of select="@sigla"/> [<xsl:value-of select="@tipoAula"/>]
                        
            </td>
        </p>
    </xsl:template>
    <!--Template Corpo-->
    <xsl:template match="ns:corpo">
        <hr/>
        <!-- Indice-->
        <h2>Indice</h2>
        <div class="Indice">
        <ol class="listaIndice">
            <xsl:for-each select="//*[@tituloSecção]">
                <li>
                    <a><xsl:attribute name="href">#<xsl:value-of select="@id"/></xsl:attribute>
                        <xsl:value-of select="@tituloSecção"/>
                    </a>
                </li>
                <xsl:for-each select=".//ns:subsecção">
                <xsl:if test="string(.)">
                    <ul>
                        <li>
                            <a><xsl:attribute name="href">#<xsl:value-of select="@id"/></xsl:attribute>
                            <xsl:value-of select="."/>
                            </a>
                        </li>
                    </ul>
                </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </ol>
        </div>
        <!-- Introdução-->
        <!-- Outras Secções-->

        <hr/>
        <xsl:apply-templates select="ns:introdução"/>
    	<hr/>
        <xsl:apply-templates select="ns:outrasSecções"/>
        <hr/>
        <xsl:apply-templates select="ns:conclusão"/>
        <hr/>
        <xsl:apply-templates select="ns:referências"/>
        <hr/>
    </xsl:template>
    <!-- Template Anexos-->
    <xsl:template match="ns:anexos">
        <h2>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:value-of select="@tituloSecção"/>
        </h2>
        <div style="align:center">
        <xsl:apply-templates select="ns:figura"/>
        </div>
    </xsl:template>
    <!-- Template Figuras-->
    <xsl:template match="ns:figura">
        <h4 style="margin-left:10%"><xsl:value-of select="@descrição"/></h4>
        <img class="anexos">
            <xsl:attribute name="src">
                <xsl:value-of select='@src'/>
            </xsl:attribute>
            <xsl:attribute name="align">
                <xsl:value-of select="middle"/>
            </xsl:attribute>
        </img>
        <br/>
    </xsl:template>
    <!-- Template Introdução-->
    <xsl:template match="ns:introdução">
            <h2><xsl:attribute name="id"><xsl:value-of select="@id"/>
            </xsl:attribute>Introdução</h2>
            <xsl:apply-templates select="ns:parágrafo"/>
    </xsl:template>
    <!-- Template Paragrafo-->
    <xsl:template match="ns:parágrafo">
        <p>
            <xsl:apply-templates />
        </p>
    </xsl:template>
    <!-- Template Negrito-->
    <xsl:template match="ns:negrito">
        <b>
           <xsl:apply-templates /> 
        </b>
    </xsl:template>
    <!-- Template Itálico-->
    <xsl:template match="ns:itálico">
        <i>
            <xsl:apply-templates />
        </i>
    </xsl:template>
    <!-- Template Sublinhado-->
    <xsl:template match="ns:sublinhado">
        <u>
            <xsl:apply-templates />
        </u>
    </xsl:template>
    <!-- Template Sublinhado-->
    <xsl:template match="ns:citação">
            (<xsl:apply-templates />)
    </xsl:template>
    <!-- Template Outras Secções-->
    <xsl:template match="ns:outrasSecções">
        <xsl:for-each select="./*[@tituloSecção]">
            <div>
                <h2>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <xsl:value-of select="@tituloSecção"/>
                </h2>
                <xsl:for-each select="./*">
                
                    <xsl:choose>
                        <xsl:when test="name() = 'subsecção'">
                            <h3>
                                <xsl:attribute name="id">
                                    <xsl:value-of select="@id"/>
                                </xsl:attribute>
                                <xsl:value-of select="."/>
                            </h3>
                        </xsl:when>
                        <xsl:when test="local-name() = 'parágrafo'">
                            <p>
                                <xsl:value-of select="."/>
                            </p>
                        </xsl:when>
                        <xsl:when test="local-name() = 'listaItems'">
                                <xsl:apply-templates select="."/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </div>
        </xsl:for-each>
    </xsl:template>
    <!-- Template Conclusão-->
    <xsl:template match="ns:conclusão">
     <h2><xsl:attribute name="id"><xsl:value-of select="@id"/>
            </xsl:attribute><xsl:value-of select="@tituloSecção"/></h2>
        <xsl:apply-templates select="ns:subsecção"/>
        <xsl:apply-templates select="ns:parágrafo"/>
    </xsl:template>
    <!-- Template Referências -->
    <xsl:template match="ns:referências">
     <h2><xsl:attribute name="id"><xsl:value-of select="@id"/>
            </xsl:attribute><xsl:value-of select="@tituloSecção"/></h2>
            <xsl:apply-templates select="ns:refBibliográfica"/>
            <xsl:apply-templates select="ns:refWeb"/>
    </xsl:template>
    <!-- Template refBibliográfica-->
    <xsl:template match="ns:refBibliográfica">
    <p>Título:<i><xsl:value-of select="ns:título"/></i>   Data Publicação:<xsl:value-of select="ns:dataPublicação"/>
    Autor:<xsl:value-of select="ns:autor"/>
    </p>
    </xsl:template>
    <!-- Template refWeb-->
    <xsl:template match="ns:refWeb">
    <p>URL:<a><xsl:attribute name="href"><xsl:value-of select="ns:URL"/></xsl:attribute><xsl:value-of select="ns:URL"/></a>
    Descrição:<xsl:value-of select="ns:descrição"/>
    Consultado em:<xsl:value-of select="ns:consultadoEm"/>
    </p>
    </xsl:template>
    <!-- Template Subsecção-->
    <xsl:template match="ns:subsecção">
        <xsl:if test="string(.)">
                <h3>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </h3>
                <xsl:apply-templates select="./../ns:parágrafo"/>
        </xsl:if>
    </xsl:template>
    <!-- Template Lista de Items-->
    <xsl:template match="ns:listaItems">
    <ul class="listas">
        <xsl:for-each select="./*">
            <li><xsl:value-of select="@label"/></li>
        </xsl:for-each>
    </ul>
    </xsl:template>
</xsl:stylesheet>