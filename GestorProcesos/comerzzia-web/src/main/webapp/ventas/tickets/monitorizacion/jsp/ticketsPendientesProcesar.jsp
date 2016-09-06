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

<script type="text/javascript">
    function checkFormPestaña() {
        return true;
    }

    function refrescar() {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("operacion").value = "refrescar";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }

    function arrancar() {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("operacion").value = "arrancar";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }

    function parar() {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("operacion").value = "parar";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }

    function reiniciar() {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("operacion").value = "reiniciar";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Estado del Servicio de Procesamiento de Tickets">
    <cmz:acciones>
      <c:choose>
        <c:when test="${formularioTicket.procesadorTickets.parado}">
          <cmz:accion onclick="arrancar();" descripcion="Arrancar" icono="comun/images/iconos/arrancar.gif" titulo="Arrancar"></cmz:accion>
        </c:when>
        <c:otherwise>
          <cmz:accion onclick="parar();" descripcion="Detener" icono="comun/images/iconos/parar.gif" titulo="Detener"></cmz:accion>
          <cmz:accion onclick="reiniciar();" descripcion="Reiniciar" icono="comun/images/iconos/reiniciar.gif" titulo="Reiniciar"></cmz:accion>
        </c:otherwise>
      </c:choose>
      
      <td class="accion" nowrap="nowrap">
        <a style="cursor: pointer; margin-right: 3px;" onclick="refrescar();" href="#">
          <img border="0" align="absmiddle" alt="Actualizar" title="Actualizar" src="comun/images/iconos/refrescar.gif"/>
          Actualizar cada:
        </a>
        <cmz:campoTexto id="segundosRefresco" valor="${formularioTicket.segundosRefresco}" longitudMaxima="3" anchura="25px"/>&nbsp;sg.
      </td>
    </cmz:acciones>
  </cmz:cabeceraPanel>
  
  <cmz:cuerpoPanel>
    <c:choose>
      <c:when test="${formularioTicket.procesadorTickets.parado}">
        <img src="comun/images/iconos/estrella_off.gif" alt="Servicio Parado"> Servicio Parado
      </c:when>
      <c:otherwise>
        <img src="comun/images/iconos/estrella_on.gif" alt="Servicio Arrancado"> Servicio Arrancado
      </c:otherwise>
    </c:choose>
  </cmz:cuerpoPanel>
</cmz:panel>
<cmz:panel>
  <cmz:cabeceraPanel titulo="Tickets Pendientes de Procesar">
  </cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Tienda"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Descripción"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Fecha"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Tickets"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoLista variable="ticket" lista="${formularioTicket.formularioPestañaActiva.registros}">
				<cmz:itemContenidoLista valor="${ticket.codAlmacen}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${ticket.desAlmacen}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista>
					<fmt:formatDate value="${ticket.fecha}" pattern="dd/MM/yyyy"/>
				</cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${ticket.numTickets}"></cmz:itemContenidoLista>
			</cmz:contenidoLista>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>
