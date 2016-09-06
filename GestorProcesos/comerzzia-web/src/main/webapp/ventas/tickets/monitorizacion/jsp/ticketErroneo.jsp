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

<c:set var="ticket" value="${formularioTicket.formularioPestañaActiva.registroActivo}" />

<script type="text/javascript">
    function checkFormPestaña() {
    	if(!esValido("xmlTicket", "TEXTO", false)) {
			return false;
		}
    	return true;
    }

    function aceptar(uidTicket) {
    	document.getElementById("idObjeto").value = uidTicket;
    	document.getElementById("accion").value = "guardarTicketErroneo";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }

    function cancelarRegistroPestaña() {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("operacion").value = "cancelarRegistroPestaña";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }

    function editarTicket(uidTicket) {
    	document.getElementById("idObjeto").value = uidTicket;
    	document.getElementById("accion").value = "editarTicketErroneo";
		document.getElementById("frmDatos").submit();
		_esperando();
    }
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Edición del Ticket">
  	<cmz:acciones numAccionesVisibles="2">
      <c:choose>
        <c:when test="${formularioTicket.formularioPestañaActiva.editable}">
	      <cmz:accion onclick="aceptar('${ticket.uidTicket}');" titulo="Aceptar" icono="comun/images/iconos/aceptar.gif"></cmz:accion>
	      <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
        </c:when>
        <c:otherwise>
          <cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
          <c:if test="${permisos.puedeEditar}">
	        <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Ticket Erróneo" onclick="editarTicket('${ticket.uidTicket}');" />
          </c:if>
        </c:otherwise>
      </c:choose>  
  	</cmz:acciones>
  </cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <table cellpadding="0px" cellspacing="0px" border="0px" width="100%">
      <tr>
        <td>
          <table cellpadding="2px" cellspacing="2px" border="0px" width="100%">
            <tr>
              <td>
              	 <cmz:campoAreaTexto id="xmlTicket" altura="530" anchura="100%" valor="${ticket.xmlError}" soloLectura="${!formularioTicket.formularioPestañaActiva.editable}"></cmz:campoAreaTexto>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </cmz:cuerpoPanel>
</cmz:panel>
