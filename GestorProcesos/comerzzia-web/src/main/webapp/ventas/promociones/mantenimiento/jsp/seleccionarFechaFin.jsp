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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="formularioPromocion" type="com.comerzzia.web.ventas.promociones.ui.FormularioPromocionBean" scope="session" />

<c:set var="promocion" value="${formularioPromocion.registroActivo}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    
    <script type="text/javascript">
        function inicio() {
        	setFoco("fechaFin");
            pintaCalendario("fechaFin", "imgFechaFin");
        }
        
        function checkForm() {
        	if(!esValido("fechaFin", "FECHA", true))
                return false;
            
            return true;
        }
        
        function aceptar() {
            if(checkForm()){
            	var opener = window.dialogArguments;
            	opener.document.getElementById("fechaFin").value = document.getElementById("fechaFin").value;
            	opener.document.getElementById("accion").value = "anular";
	        	opener.document.getElementById("frmDatos").submit();
	        	window.close();
            }
        }

        function cancelar(){
			window.close();
        }

    </script>
  </head>

  <body class="ventanaModal" onload="inicio();">
    <cmz:panel>
    	<cmz:cabeceraPanel titulo="Anular promoción"></cmz:cabeceraPanel>
        <cmz:cuerpoPanel>
          <form id="frmDatos" name="frmDatos" action="promociones" method="post">
           <input id="accion" name="accion" type="hidden" value="" />
           <table cellpadding="2px" cellspacing="2px" border="0px" width="100%">
             <tr>
                <td align="right">Fecha Fin:</td>
                <td>
                  	<c:set var="fechaFin"><fmt:formatDate pattern="dd/MM/yyyy" value="${promocion.fechaFin}"/></c:set>
                    <cmz:campoFecha id="fechaFin" valor="${fechaFin}" requerido="true"
                      	editable="true" soloLectura="false" />
                </td>
             </tr>
             <tr height="30px"></tr>
             <tr>
                <td colspan="2" align="center">
                	<cmz:boton onclick="aceptar();" valor="Aceptar" id="btnAceptar" />
                	<cmz:boton onclick="cancelar();" valor="Cancelar" id="btnCancelar" />
                </td>
             </tr>     
            </table>
          </form>
        </cmz:cuerpoPanel>
      </cmz:panel>
  </body>
</html>
