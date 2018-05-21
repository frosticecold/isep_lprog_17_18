<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:ns="http://www.dei.isep.ipp.pt/lprog/adotapets">
    <?xml-stylesheet href="adotapets.xsl" type="text/xsl"?>
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
       <head> 
         
       </head>
       <body>
         <h2>Animal Details</h2>
         <table border="1">
       <tr bgcolor="aqua">
         <th style="text-align:Left"> TipoAnimal</th>
         <th style="text-align:Left"> Nome</th>
         <th style="text-align:Left"> Raça</th>
         <th style="text-align:Left"> Sexo</th>
         <th style="text-align:Left"> Idade</th>
         <th style="text-align:Left"> Peso</th>
       </tr>
       <xsl:for-each select="ADOTAPets/Animais/Animal">
         <tr>        
           <td>              
             <xsl:value-of select="TipoAnimal" />
           </td>        
           <td>            
             <xsl:value-of select="Nome"/>
           </td>        
           <td>            
             <xsl:value-of select="Raca"/>
           </td>        
           <td>            
             <xsl:value-of select="Sexo"/>
           </td>        
           <td>            
             <xsl:value-of select="Idade"/>
           </td>        
             <td>              
               <xsl:value-of select="Peso"/>
             </td>          
         </tr>
       </xsl:for-each>
     </table>
         <br/>
         <br/>
         <form id ="form" method="post" >        
         </form>
         </body>
     </html>
    </xsl:template>
</xsl:stylesheet>