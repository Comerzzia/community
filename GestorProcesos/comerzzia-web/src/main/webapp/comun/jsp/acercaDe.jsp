<%--
 * Copyright 2009-2014 RED.ES - Desarrollado por TIER1
 * 
 * Licencia con arreglo a la EUPL, versión 1.1 o -en cuanto 
 * sean aprobadas por la comisión Europea- versiones 
 * posteriores de la EUPL (la "Licencia").
 * Solo podrá usarse esta obra si se respeta la Licencia.
 * 
 * http://ec.europa.eu/idabc/eupl.html
 * 
 * Salvo cuando lo exija la legislación aplicable o se acuerde
 * por escrito, el programa distribuido con arreglo a la
 * Licencia se distribuye "TAL CUAL",
 * SIN GARANTÍAS NI CONDICIONES DE NINGÚN TIPO, 
 * ni expresas ni implícitas.
 * Véase la Licencia en el idioma concreto que rige
 * los permisos y limitaciones que establece la Licencia.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/mantenimiento.js"></script>

    <script type="text/javascript">
	    function cerrar() {
	    	window.close();
	    }
	    function keyDownEsc(){
	    	cerrar();
		}
    </script>

  </head>
  <body onkeydown="keyDown(event);">
    <cmz:panel>
      <cmz:cabeceraPanel titulo="Acerca de"></cmz:cabeceraPanel>
      <cmz:cuerpoPanel>
        <td>
          <p class="centro">
          <img alt="FEDER" title="FEDER" src="comun/images/logos/logo_feder.gif">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <img alt="ComerZZia" height="50px" title="ComerZZia" src="comun/images/logos/logo_comerzzia.png">
          </p>
          
          <div class="acerca-texto">
            <p>Este Software ha sido desarrollado dentro del Programa Empresas en Red cofinanciado por el 
            Fondo Europeo de Desarrollo Regional FEDER con cargo al Programa Operativo Economía Basada en el 
            Conocimiento y al Programa Operativo de la Comunidad Autónoma de Andalucía.</p>
             
            <p>ComerZZia es una aplicación software libre distribuido bajo European Public License (EUPL)</p>
             
            <p>Rogamos que si va a redistribuir ComerZZia, lea con atención los términos de la licencia, 
            lo que obliga a que cualquier trabajo derivado se distribuya bajo la misma licencia original, 
            manteniéndose el mismo régimen de derechos de autor y de acceso al código.</p>
             
            <p>RED.ES se reserva los derechos de iniciar acciones legales por cualquier incumplimiento de los términos 
            de la misma por parte de cualquier distribuidor.</p>
            
            <p>ComerZZia ha sido desarrollado por TIER 1. 
            Para más información visite <a href="http://www.comerzzia.com" target="_blank" style="font-weight: bold;">www.comerzzia.com</a></p>
          </div>
          <p class="centro">
            <input type="button" value="Cerrar" onclick="cerrar();" />
          </p>
        </td>
      </cmz:cuerpoPanel>
    </cmz:panel>
  </body>
</html>
