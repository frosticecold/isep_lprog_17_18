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
    <xsl:apply-templates select="ns:Animais/ns:Animal"/>
    <xsl:call-template name="FOOTER"/>
    </xsl:template>

    <xsl:template match="ns:Animal">
    =======================================================================
        Nome:<xsl:value-of select="ns:Nome"/>
        Tipo:<xsl:value-of select="@TipoAnimal"/>
        Idade:<xsl:value-of select="ns:Idade"/>
        Raça:<xsl:value-of select="ns:Raca"/>
        <xsl:apply-templates select="ns:Vacinas"/>
    =======================================================================
    </xsl:template>
    <xsl:template match="ns:Vacinas">
        <xsl:for-each select="ns:Vacina">
            Vacina:<xsl:value-of select="@Nome"/>&#x9;Data Administração:<xsl:value-of select="ns:DataAdministracao"/>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="HEADER">
             .o.       ooooo      ooo ooooo ooo        ooooo       .o.       ooooo  .oooooo..o        
   .dP      .888.      `888b.     `8' `888' `88.       .888'      .888.      `888' d8P'    `Y8 Yb     
 .dP       .8"888.      8 `88b.    8   888   888b     d'888      .8"888.      888  Y88bo.       `Yb   
dP        .8' `888.     8   `88b.  8   888   8 Y88. .P  888     .8' `888.     888   `"Y8888o.     `Yb 
Yb       .88ooo8888.    8     `88b.8   888   8  `888'   888    .88ooo8888.    888       `"Y88b    .dP 
 `Yb    .8'     `888.   8       `888   888   8    Y     888   .8'     `888.   888  oo     .d8P  .dP   
   `Yb o88o     o8888o o8o        `8  o888o o8o        o888o o88o     o8888o o888o 8""88888P'  dP     
    </xsl:template>

    <xsl:template name="FOOTER">
            88       .o.       ooooo      ooo ooooo ooo        ooooo       .o.       ooooo  .oooooo..o        
   .dP     .8'      .888.      `888b.     `8' `888' `88.       .888'      .888.      `888' d8P'    `Y8 Yb     
 .dP      .8'      .8"888.      8 `88b.    8   888   888b     d'888      .8"888.      888  Y88bo.       `Yb   
dP       .8'      .8' `888.     8   `88b.  8   888   8 Y88. .P  888     .8' `888.     888   `"Y8888o.     `Yb 
Yb      .8'      .88ooo8888.    8     `88b.8   888   8  `888'   888    .88ooo8888.    888       `"Y88b    .dP 
 `Yb   .8'      .8'     `888.   8       `888   888   8    Y     888   .8'     `888.   888  oo     .d8P  .dP   
   `Yb 88      o88o     o8888o o8o        `8  o888o o8o        o888o o88o     o8888o o888o 8""88888P'  dP     
    </xsl:template>
</xsl:stylesheet>