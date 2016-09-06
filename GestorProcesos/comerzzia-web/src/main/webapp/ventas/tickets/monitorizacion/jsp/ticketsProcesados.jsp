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

<c:set var="paramBuscarTicketsProcesados" value="${formularioTicket.formularioPestañaActiva.param}" />

<script type="text/javascript">
    function checkFormPestaña() {
    	if(!esValido("codAlmacenProcesado", "AYUDA", false, "desAlmacenProcesado", "ALMACENES")) {
			return false;
		}
    	if(!esValido("fechaDesde", "FECHA", true)) {
			return false;
		}
    	if(!esValido("fechaHasta", "FECHA", true)) {
			return false;
		}
    	return true;
    }
    
    function consultarTicketsProcesados() {
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
    
    function keyDownEnter() {
    	consultarTicketsProcesados();
    }

  </script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Búsqueda de Tickets Procesados"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <table cellpadding="0px" cellspacing="0px" border="0px">
      <tr>
        <td>
          <table cellpadding="2px" cellspacing="2px" border="0px">
            <tr>
              <td>Tienda:</td>
              <td>
		          <cmz:ayuda nombreAyuda="ALMACENES">
		            <cmz:codigoAyuda idCodigo="codAlmacenProcesado" longitudMaximaCodigo="4" valorCodigo="${paramBuscarTicketsProcesados.codAlmacen}" anchuraCodigo="40px"></cmz:codigoAyuda>
		            <cmz:descripcionAyuda idDescripcion="desAlmacenProcesado" anchuraDescripcion="300px" valorDescripcion="${paramBuscarTicketsProcesados.desAlmacen}"></cmz:descripcionAyuda>
		          </cmz:ayuda>
              </td>
              <td>
          		<cmz:botonConsultar onclick="consultarTicketsProcesados();"/>
        	  </td>
            </tr>
            
            <tr>
            	<td colspan="3">
            		<table border="0" align="left">
			            <tr>
			              <td>Desde fecha:</td>
			              <td>
			                <cmz:campoFecha id="fechaDesde" longitudMaxima="10" anchura="100px" requerido="true" editable="true">
								<fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarTicketsProcesados.fechaDesde}"/>
			                </cmz:campoFecha>
			              </td>
			              <td width="20px"></td>
			              <td>Hasta fecha:</td>
			              <td>
			                <cmz:campoFecha id="fechaHasta" longitudMaxima="10" anchura="100px" requerido="true" editable="true">
								<fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarTicketsProcesados.fechaHasta}"/>
			                </cmz:campoFecha>
			              </td>
			            </tr>
            		</table>
            	</td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </cmz:cuerpoPanel>
</cmz:panel>
<c:if test="${paginaResultados.pagina != null}">
	<cmz:panel>
		<cmz:cabeceraPanelResultados titulo="Tickets Procesados" numPorPagina="${paginaResultados.tamañoPagina}"></cmz:cabeceraPanelResultados>
		<cmz:cuerpoPanel>
			<cmz:listaPaginada>
				<cmz:cabeceraListaPaginada ordenActual="${paramBuscarTicketsProcesados.orden}">
					<cmz:itemCabeceraListaPaginada nombre="Tienda" columna="1" ordenColumna="CODALM"></cmz:itemCabeceraListaPaginada>
					<cmz:itemCabeceraListaPaginada nombre="Descripción" columna="2" ordenColumna="DESALM"></cmz:itemCabeceraListaPaginada>
					<cmz:itemCabeceraListaPaginada nombre="Fecha" columna="3" ordenColumna="FECHA"></cmz:itemCabeceraListaPaginada>
					<cmz:itemCabeceraListaPaginada nombre="Nº de Tickets"></cmz:itemCabeceraListaPaginada>
				</cmz:cabeceraListaPaginada>
				<cmz:contenidoListaPaginada variable="ticket" paginaResultados="${paginaResultados}">
					<cmz:itemContenidoListaPaginada valor="${ticket.codAlmacen}"></cmz:itemContenidoListaPaginada>
					<cmz:itemContenidoListaPaginada valor="${ticket.desAlmacen}"></cmz:itemContenidoListaPaginada>
					<cmz:itemContenidoListaPaginada>
						<fmt:formatDate value="${ticket.fecha}" pattern="dd/MM/yyyy"/>
					</cmz:itemContenidoListaPaginada>
					<cmz:itemContenidoListaPaginada valor="${ticket.numTickets}"></cmz:itemContenidoListaPaginada>
				</cmz:contenidoListaPaginada>
			</cmz:listaPaginada>
		</cmz:cuerpoPanel>
	</cmz:panel>
</c:if>
