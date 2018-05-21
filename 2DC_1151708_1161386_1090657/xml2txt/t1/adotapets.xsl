<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:ns="http://www.dei.isep.ipp.pt/lprog/adotapets">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:apply-templates select="ns:ADOTAPets"/>
    </xsl:template>
    <!-- Criar Elemento Raíz-->
    <xsl:template match="ns:ADOTAPets">
        <xsl:element name="Animais">
            <xsl:attribute name="Quantidade">
                <xsl:value-of select="count(ns:Animais/ns:Animal)"/>
            </xsl:attribute>
            <xsl:apply-templates select="ns:Animais/ns:Animal"/>
        </xsl:element>
    </xsl:template>
    <!-- Criar template Animais-->
    <xsl:template match="ns:Animal">
        <xsl:element name="Animal">
            <xsl:attribute name="Tipo">
                <xsl:value-of select="@TipoAnimal"/>
            </xsl:attribute>
            <xsl:attribute name="Sexo">
                <xsl:value-of select="ns:Sexo"/>
            </xsl:attribute>
            <xsl:attribute name="Idade">
                <xsl:value-of select="ns:Idade"/>
            </xsl:attribute>
            <xsl:element name="Nome">
                <xsl:value-of select="ns:Nome"/>
            </xsl:element>
            <xsl:element name="Informações">
                <xsl:element name="Raca">
                    <xsl:value-of select="ns:Raca"/>
                </xsl:element>
                <xsl:element name="Peso">
                    <xsl:value-of select="ns:Peso"/>
                </xsl:element>
                <xsl:element name="Racao">
                    <xsl:value-of select="ns:Racao"/>
                </xsl:element>
                <xsl:element name="ExercicioFisico">
                    <xsl:value-of select="ns:ExercicioFisico"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>