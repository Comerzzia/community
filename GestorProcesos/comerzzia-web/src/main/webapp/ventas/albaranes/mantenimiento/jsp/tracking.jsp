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
    	var opener = window.dialogArguments;

    	function inicio() {
	    	document.getElementById("tracking").value = opener.document.getElementById("tracking").value;
 	    }

    	function aceptar() {
    		opener.document.getElementById("idTracking").value = document.getElementById("tracking").value;
    		window.returnValue = "0";
            window.close();
	    }

	    function cancelar() {
			window.close();
	    }

	    function keyDownEnter(){
			aceptar();
		}

	    function keyDownEsc(){
			window.close();
		}
    </script>

  </head>
  
   <body onkeydown="keyDown(event);" class="ventanaModal" onload="inicio();">
     <cmz:panelPrincipal>
        <cmz:cabeceraPanelPrincipal titulo="${accion.titulo}" icono="${accion.icono}">
          <cmz:acciones numAccionesVisibles="2">
              <cmz:accion icono="comun/images/iconos/aceptar.gif" onclick="aceptar();" titulo="Aceptar" descripcion="Aceptar"></cmz:accion>
              <cmz:accion icono="comun/images/iconos/cancelar.gif" onclick="cancelar();" titulo="Cancelar" descripcion="Cancelar"></cmz:accion>
          </cmz:acciones>
        </cmz:cabeceraPanelPrincipal>
        
        <cmz:cuerpoPanelPrincipal>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="albaranesVentas" method="POST">
            <input type="hidden"" name="accion" id="accion" value=""/>
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Modificar Id Envío" icono="comun/images/iconos/tracking.gif" />
              <cmz:cuerpoPanel>
	            <table cellpadding="2px" cellspacing="2px" border="0px">
					<tr>
						<td>Id Envío:</td>
						<td>
				          <cmz:campoTexto id="tracking" anchura="200px" longitudMaxima="50"/>
						</td>
					</tr>
	            </table>  
              </cmz:cuerpoPanel>
            </cmz:panel>
          </form>
        </cmz:cuerpoPanelPrincipal>
      </cmz:panelPrincipal>
   </body>
 </html>
