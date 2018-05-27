<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:ns="http://www.dei.isep.ipp.pt/lprog/adotapets">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:apply-templates select="ns:ADOTAPets"/>
    </xsl:template>
    <!-- Criar Elemento Raíz-->
    <xsl:template match="ns:ADOTAPets">
    <xsl:call-template name="HEADER"/>
    ==================================
    Animais : 
        Estatísticas
            Quantidade = <xsl:value-of select="count(ns:Animais/ns:Animal)"/>
            Maior Idade = <xsl:value-of select="max(ns:Animais/ns:Animal/ns:Idade)"/>
            Menor Idade = <xsl:value-of select="min(ns:Animais/ns:Animal/ns:Idade)"/>
            Média Idade = <xsl:value-of select="format-number(avg(ns:Animais/ns:Animal/ns:Idade),'#.00')"/>
    ==================================
            <xsl:apply-templates select="ns:Animais/ns:Animal"/>
    </xsl:template>
    <!-- Criar template Animais-->
    <xsl:template match="ns:Animal">
        Animal
            •Nome:<xsl:value-of select="ns:Nome"/>
            •Tipo:<xsl:value-of select="@TipoAnimal"/>
            •Sexo:<xsl:value-of select="ns:Sexo"/>
            •Idade:<xsl:value-of select="ns:Idade"/>
            •Raca:<xsl:value-of select="ns:Raca"/>
            •Peso:<xsl:value-of select="ns:Peso"/>
            •Racao:<xsl:value-of select="ns:Racao"/>
            •ExercicioFisico:<xsl:value-of select="ns:ExercicioFisico"/>
    </xsl:template>

    <xsl:template name="HEADER">
 █████╗ ██████╗  ██████╗ ████████╗ █████╗ ██████╗ ███████╗████████╗███████╗
██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝
███████║██║  ██║██║   ██║   ██║   ███████║██████╔╝█████╗     ██║   ███████╗
██╔══██║██║  ██║██║   ██║   ██║   ██╔══██║██╔═══╝ ██╔══╝     ██║   ╚════██║
██║  ██║██████╔╝╚██████╔╝   ██║   ██║  ██║██║     ███████╗   ██║   ███████║
╚═╝  ╚═╝╚═════╝  ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝     ╚══════╝   ╚═╝   ╚══════╝
</xsl:template>
</xsl:stylesheet>