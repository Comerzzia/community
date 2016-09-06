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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="formularioTicket" type="com.comerzzia.web.ventas.tickets.ui.FormularioTicketBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <c:if test="${formularioTicket.procesadorTickets.arrancado && formularioTicket.segundosRefresco > 0 && formularioTicket.pestañaActiva == 0}" >
      <meta http-equiv="refresh" content="<c:out value="${formularioTicket.segundosRefresco}"/>;url=monitor.tickets.screen" />
    </c:if>
    
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    
    <script type="text/javascript">
        function inicio() {
            setFoco("codAlmacenErroneo", "codAlmacenProcesado");
            <c:choose>
	            <c:when test="${formularioTicket.pestañaActiva == 1}">
					<c:if test="${!formularioTicket.formularioPestañaActiva.modoVisualizacionFicha}">
	            	  pintaCalendario("fecha", "imgFecha");
					</c:if>	
	            </c:when>
	            <c:when test="${formularioTicket.pestañaActiva == 2}">
		            pintaCalendario("fechaDesde", "imgFechaDesde");
		            pintaCalendario("fechaHasta", "imgFechaHasta");
	            </c:when>
            </c:choose>
        }

        
        function checkForm() {
            return true;
        }

        function seleccionaPestaña(id) {
          	document.getElementById("accion").value = "leerFormulario";
          	document.getElementById("operacion").value = "pestaña";
          	document.getElementById("indice").value = id;
      	    document.getElementById("frmDatos").submit();
      		_esperando();
        }

        function ordenar(columna) {
        	if(__checkForm()) {
        		document.getElementById("accion").value = "leerFormulario";
        		document.getElementById("operacion").value = "ordenar";
        		document.getElementById("columna").value = columna;
        		document.getElementById("frmDatos").submit();
        		_esperando();
        	}
        }
     </script>
  </head>

  <body onload="inicio();" onkeydown="keyDown(event);">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones>
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
            
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="tickets" method="post">
            <input id="accion" name="accion" type="hidden" value="leerFormulario" />
            <input id="operacion" name="operacion" type="hidden" value="refrescar" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            <input id="codAlmacen" name="codAlmacen" type="hidden" value="" />
            
            <cmz:pestañas>
            	<cmz:cabeceraPestañas pestañaActiva="${formularioTicket.pestañaActiva}">
            		<cmz:pestaña titulo="Pendiente de Procesar" accion="0" onclick="seleccionaPestaña(0);" width="150px"></cmz:pestaña>
            		<cmz:pestaña titulo="Con Errores" accion="1" onclick="seleccionaPestaña(1);"></cmz:pestaña>
            		<cmz:pestaña titulo="Procesados" accion="2" onclick="seleccionaPestaña(2);"></cmz:pestaña>
            	</cmz:cabeceraPestañas>
            	<cmz:cuerpoPestaña>
            	  <c:choose>
                    <c:when test="${formularioTicket.pestañaActiva == 0}">
                      <c:import url="ticketsPendientesProcesar.jsp"></c:import>
                    </c:when>
                    <c:when test="${formularioTicket.pestañaActiva == 1}">
                      <c:choose>	
                        <c:when test="${formularioTicket.formularioPestañaActiva.modoVisualizacionFicha}">
                          <c:import url="ticketErroneo.jsp"></c:import>
                        </c:when>
                        <c:otherwise>
                          <c:import url="ticketsErroneos.jsp"></c:import>
                        </c:otherwise>
                      </c:choose>	
                    </c:when>
                    <c:when test="${formularioTicket.pestañaActiva == 2}">
                      <c:import url="ticketsProcesados.jsp"></c:import>
                    </c:when>
                  </c:choose>
            	</cmz:cuerpoPestaña>
            </cmz:pestañas>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
