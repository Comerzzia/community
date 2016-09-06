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

<jsp:useBean id="paginaResultados" class="com.comerzzia.util.paginacion.PaginaResultados" scope="request" />

<c:set var="paramBuscarTicketsErroneos" value="${formularioTicket.formularioPestañaActiva.param}" />

<script type="text/javascript">
    function checkFormPestaña() {
    	if(!esValido("codAlmacenErroneo", "AYUDA", false, "desAlmacenErroneo", "ALMACENES")) {
			return false;
		}
    	if(!esValido("fecha", "FECHA", false)) {
			return false;
		}
    	return true;
    }
    
    function consultar() {
        if(checkFormPestaña()){
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("operacion").value = "consultar";
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }
    }

    function paginar(pagina) {
    	if(checkFormPestaña()) {
    		document.getElementById("accion").value = "leerFormulario";
    		document.getElementById("operacion").value = "paginar";
    		document.getElementById("pagina").value = pagina;
    		document.getElementById("frmDatos").submit();
    		_esperando();
    	}
    }

    function procesarTodosTickets() {
    	document.getElementById("accion").value = "procesarTodosTicketsErroneos";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }

    function procesarTicket(uidTicket) {
    	document.getElementById("idObjeto").value = uidTicket;
    	document.getElementById("accion").value = "procesarTicket";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }

    function verTicket(uidTicket) {
    	document.getElementById("idObjeto").value = uidTicket;
    	document.getElementById("accion").value = "verTicketErroneo";
		document.getElementById("frmDatos").submit();
		_esperando();
    }

    function editarTicket(uidTicket) {
    	document.getElementById("idObjeto").value = uidTicket;
    	document.getElementById("accion").value = "editarTicketErroneo";
		document.getElementById("frmDatos").submit();
		_esperando();
    }

    function eliminarTicket(uidTicket) {
        if(confirm("¿Está seguro de que desea eliminar el ticket?")){
        	document.getElementById("idObjeto").value = uidTicket;
        	document.getElementById("accion").value = "eliminarTicket";
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }
    }

    function keyDownEnter() {
    	consultar();
    }

  </script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Búsqueda de Tickets Erróneos"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <table cellpadding="0px" cellspacing="0px" border="0px">
      <tr>
        <td>
          <table cellpadding="2px" cellspacing="2px" border="0px">
            <tr>
              <td>Tienda:</td>
              <td>
		          <cmz:ayuda nombreAyuda="ALMACENES">
		            <cmz:codigoAyuda idCodigo="codAlmacenErroneo" longitudMaximaCodigo="4" valorCodigo="${paramBuscarTicketsErroneos.codAlmacen}" anchuraCodigo="40px"></cmz:codigoAyuda>
		            <cmz:descripcionAyuda idDescripcion="desAlmacenErroneo" anchuraDescripcion="300px" valorDescripcion="${paramBuscarTicketsErroneos.desAlmacen}"></cmz:descripcionAyuda>
		          </cmz:ayuda>
              </td>
              <td>
          		<cmz:botonConsultar onclick="consultar();"/>
        	  </td>
            </tr>
            
            <tr>
              <td>Fecha</td>
              <td>
                <cmz:campoFecha id="fecha" longitudMaxima="10" anchura="100px">
					<fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarTicketsErroneos.fecha}"/>
                </cmz:campoFecha>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </cmz:cuerpoPanel>
</cmz:panel>
<cmz:panel>
	<cmz:cabeceraPanelResultados titulo="Tickets con Errores" numPorPagina="${paginaResultados.tamañoPagina}">
	  <c:if test="${paginaResultados.totalResultados > 0}">
		<c:if test="${permisos.puedeEjecutar}">
		  <cmz:acciones>
		    <cmz:accion onclick="procesarTodosTickets();" titulo="Volver a Procesar Todos" icono="comun/images/iconos/engranajes.gif"></cmz:accion>
		  </cmz:acciones>
		</c:if>	
	  </c:if>
	</cmz:cabeceraPanelResultados>
	<cmz:cuerpoPanel>
		<cmz:listaPaginada>
			<cmz:cabeceraListaPaginada ordenActual="${paramBuscarTicketsErroneos.orden}">
				<cmz:itemCabeceraListaPaginada nombre="Tienda" columna="1" ordenColumna="CODALM"></cmz:itemCabeceraListaPaginada>
				<cmz:itemCabeceraListaPaginada nombre="Descripción" columna="2" ordenColumna="DESALM"></cmz:itemCabeceraListaPaginada>
				<cmz:itemCabeceraListaPaginada nombre="Fecha" columna="3" ordenColumna="FECHA"></cmz:itemCabeceraListaPaginada>
				<cmz:itemCabeceraListaPaginada nombre="Ticket" columna="4" ordenColumna="ID_TICKET"></cmz:itemCabeceraListaPaginada>
				<cmz:itemCabeceraListaPaginada nombre="Fecha proceso"></cmz:itemCabeceraListaPaginada>
				<cmz:itemCabeceraListaPaginada nombre="Problema"></cmz:itemCabeceraListaPaginada>
				<cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
			</cmz:cabeceraListaPaginada>
			<cmz:contenidoListaPaginada variable="ticket" paginaResultados="${paginaResultados}">
				<cmz:itemContenidoListaPaginada valor="${ticket.codAlmacen}"></cmz:itemContenidoListaPaginada>
				<cmz:itemContenidoListaPaginada valor="${ticket.desAlmacen}"></cmz:itemContenidoListaPaginada>
				<cmz:itemContenidoListaPaginada>
					<fmt:formatDate value="${ticket.fecha}" pattern="dd/MM/yyyy"/>
				</cmz:itemContenidoListaPaginada>
				<cmz:itemContenidoListaPaginada valor="${ticket.idTicket}" onclick="verTicket('${ticket.uidTicket}');"></cmz:itemContenidoListaPaginada>
				<cmz:itemContenidoListaPaginada>
					<fmt:formatDate value="${ticket.fechaProceso}" pattern="dd/MM/yyyy"/>
				</cmz:itemContenidoListaPaginada>
				<cmz:itemContenidoListaPaginada valor="${ticket.mensajeError}"></cmz:itemContenidoListaPaginada>
                 <cmz:acciones alineacion="center">
                   <c:if test="${permisos.puedeEjecutar}">
                     <cmz:accion icono="comun/images/iconos/engranaje.gif" onclick="procesarTicket('${ticket.uidTicket}');" descripcion="Procesar ticket"></cmz:accion>
                   </c:if>
                   <cmz:accion icono="comun/images/iconos/ver.gif" onclick="verTicket('${ticket.uidTicket}');" descripcion="Ver Ticket Erróneo"></cmz:accion>
                   <c:if test="${permisos.puedeEliminar}">
                     <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminarTicket('${ticket.uidTicket}');" descripcion="Eliminar Ticket Erróneo"></cmz:accion>
                   </c:if>
                 </cmz:acciones>
			</cmz:contenidoListaPaginada>
		</cmz:listaPaginada>
	</cmz:cuerpoPanel>
</cmz:panel>
