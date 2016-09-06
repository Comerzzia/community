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

<jsp:useBean id="formularioSincronizacion" type="com.comerzzia.web.sincronizacion.ui.FormularioSincronizacionBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <c:if test="${formularioSincronizacion.sincronizadorTiendas.arrancado && formularioSincronizacion.segundosRefresco > 0 && !formularioSincronizacion.formularioPestañaActiva.modoVisualizacionFicha}" >
      <meta http-equiv="refresh" content="<c:out value="${formularioSincronizacion.segundosRefresco}"/>;url=sincronizador.screen" />
    </c:if>
    
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    
    <script type="text/javascript" language="javascript">
        function inicio() {
            <c:if test="${formularioSincronizacion.formularioPestañaActiva.editable}">
            pintaCalendario("fechaProximaEjecucion", "imgFechaProximaEjecucion");
            </c:if>
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

        function verTrabajo(idTrabajo) {
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("operacion").value = "verTrabajo";
        	document.getElementById("indice").value = idTrabajo;
    	    document.getElementById("frmDatos").submit();
    		_esperando();
        }

        function editarTrabajo(idTrabajo) {
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("operacion").value = "editarTrabajo";
        	document.getElementById("indice").value = idTrabajo;
    	    document.getElementById("frmDatos").submit();
    		_esperando();
        }
        
        function arrancarTrabajo(idTrabajo) {
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("operacion").value = "arrancarTrabajo";
        	document.getElementById("indice").value = idTrabajo;
    	    document.getElementById("frmDatos").submit();
    		_esperando();
        }
        
        function pausarTrabajo(idTrabajo) {
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("operacion").value = "pausarTrabajo";
        	document.getElementById("indice").value = idTrabajo;
    	    document.getElementById("frmDatos").submit();
    		_esperando();
        }
        
        function pararTrabajo(idTrabajo) {
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("operacion").value = "pararTrabajo";
        	document.getElementById("indice").value = idTrabajo;
    	    document.getElementById("frmDatos").submit();
    		_esperando();
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
          <form id="frmDatos" name="frmDatos" action="sincronizacion" method="post">
            <input id="accion" name="accion" type="hidden" value="leerFormulario" />
            <input id="operacion" name="operacion" type="hidden" value="refrescar" />
            <input id="indice" name="indice" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Estado del Sincronizador de Tiendas">
                <cmz:acciones>
                  <c:choose>
                    <c:when test="${formularioSincronizacion.sincronizadorTiendas.parado}">
                      <cmz:accion onclick="arrancar();" descripcion="Arrancar" icono="comun/images/iconos/arrancar.gif" titulo="Arrancar"></cmz:accion>
                    </c:when>
                    <c:otherwise>
                      <cmz:accion onclick="parar();" descripcion="Detener" icono="comun/images/iconos/parar.gif" titulo="Detener"></cmz:accion>
                      <cmz:accion onclick="reiniciar();" descripcion="Reiniciar" icono="comun/images/iconos/reiniciar.gif" titulo="Reiniciar"></cmz:accion>
                    </c:otherwise>
                  </c:choose>
                  
                  <c:choose>
                    <c:when test="${formularioSincronizacion.sincronizadorTiendas.parado || formularioSincronizacion.formularioPestañaActiva.modoVisualizacionFicha}">
                      <cmz:accion onclick="refrescar();" descripcion="Actualizar" icono="comun/images/iconos/refrescar.gif" titulo="Actualizar"></cmz:accion>
                    </c:when>
                    <c:otherwise>
                      <td class="accion" nowrap="nowrap">
                        <a style="cursor: pointer; margin-right: 3px;" onclick="refrescar();" href="#">
                          <img border="0" align="absmiddle" alt="Actualizar" title="Actualizar" src="comun/images/iconos/refrescar.gif"/>
                          Actualizar cada:
                        </a>
                        <cmz:campoTexto id="segundosRefresco" valor="${formularioSincronizacion.segundosRefresco}" longitudMaxima="3" anchura="25px"/>&nbsp;sg.
                      </td>
                    </c:otherwise>
                  </c:choose>
                </cmz:acciones>
              </cmz:cabeceraPanel>
              
              <cmz:cuerpoPanel>
                <c:choose>
                  <c:when test="${formularioSincronizacion.sincronizadorTiendas.parado}">
                    <img src="comun/images/iconos/estrella_off.gif" alt="Sincronizador Parado"> Sincronizador Parado
                  </c:when>
                  <c:otherwise>
                    <img src="comun/images/iconos/estrella_on.gif" alt="Sincronizador Arrancado"> Sincronizador Arrancado
                  </c:otherwise>
                </c:choose>
              </cmz:cuerpoPanel>
            </cmz:panel>
  
            <cmz:pestañas>
            	<cmz:cabeceraPestañas pestañaActiva="${formularioSincronizacion.pestañaActiva}">
            		<cmz:pestaña titulo="Trabajos" accion="0" onclick="seleccionaPestaña(0);"></cmz:pestaña>
            		<cmz:pestaña titulo="Trabajos por Tiendas" accion="1" onclick="seleccionaPestaña(1);"></cmz:pestaña>
            	</cmz:cabeceraPestañas>
            	<cmz:cuerpoPestaña>
            	  <c:choose>
                    <c:when test="${formularioSincronizacion.pestañaActiva == 0}">
                    	<c:choose>
					        <c:when test="${formularioSincronizacion.formularioPestañaActiva.modoVisualizacionFicha}">
					            <c:import url="trabajosFicha.jsp"></c:import>
					        </c:when>
					        <c:otherwise>
					            <c:import url="trabajos.jsp"></c:import>
					        </c:otherwise>
					    </c:choose>
                    </c:when>
                    <c:when test="${formularioSincronizacion.pestañaActiva == 1}">
                    	<c:choose>
					        <c:when test="${formularioSincronizacion.formularioPestañaActiva.modoVisualizacionFicha}">
					            <c:import url="trabajosFicha.jsp"></c:import>
					        </c:when>
					        <c:otherwise>
					            <c:import url="trabajosTiendas.jsp"></c:import>
					        </c:otherwise>
					    </c:choose>
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
