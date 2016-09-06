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

<jsp:useBean id="paramBuscarActualizacionesTarifas" type="com.comerzzia.persistencia.ventas.tarifas.actualizaciones.ParametrosBuscarActualizacionesTarifaBean" scope="session" />
<jsp:useBean id="paginaResultados" class="com.comerzzia.util.paginacion.PaginaResultados" scope="request" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<jsp:useBean id="formularioActualizacionTarifa" type="com.comerzzia.web.ventas.tarifas.actualizaciones.iu.FormularioActualizacionBean" scope="session" />

<c:set var="tarifa" value="${formularioActualizacionTarifa.tarifa}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    
    <script type="text/javascript">
    
        function verArticulos() {
          document.getElementById("accion").value = "buscarArticulos";
          document.getElementById("operacion").value = "consultar";
          document.getElementById("frmDatos").submit();
          _esperando();
        }

        function volver() {
        	document.getElementById("frmDatos").action = "tarifas";
            document.getElementById("idObjeto").value = document.getElementById("codTar").value;
        	document.getElementById("accion").value = "ver";
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }
        
    </script>
    
  </head>

  <body>
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
            <c:if test="${permisos.puedeAñadir}">
              <cmz:accionNuevoRegistro onclick="alta();" descripcion="Alta de una nueva actualización"/>
            </c:if>
            <cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir listado actualizaciones" onclick="imprimir()" />
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="actualizacionesTarifas" method="POST">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos de la Tarifa"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Código:</td>
                    <td><cmz:campoTexto id="codTar" valor="${tarifa.codTar}"
                      requerido="true" anchura="100px" longitudMaxima="11"
                      editable="${formularioTarifa.enInsercion}"
                      soloLectura="${!formularioTarifa.enInsercion}" /></td>
                  </tr>
      
                  <tr>
                    <td>Descripción:</td>
                    <td><cmz:campoTexto id="desTar" valor="${tarifa.desTar}"
                      requerido="true" anchura="320px" longitudMaxima="45"
                      editable="${formularioTarifa.editable}"
                      soloLectura="${!formularioTarifa.editable}" /></td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <c:choose>
              <c:when test="${paginaResultados.pagina != null}">
                <cmz:panel>
                  <cmz:cabeceraPanelResultados titulo="Actualizaciones" numPorPagina="${paginaResultados.tamañoPagina}"></cmz:cabeceraPanelResultados>
                  <cmz:cuerpoPanel>
                    <cmz:listaPaginada>
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarActualizacionesTarifas.orden}">
                        <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="1" ordenColumna="DES_ACTUALIZACION"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Fecha Prevista Aplicación" columna="2" estilo="text-align: center;" ordenColumna="FECHA_PREVISTA_APLICACION"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      
                      <cmz:contenidoListaPaginada variable="actualizacion" paginaResultados="${paginaResultados}">
                        <cmz:itemContenidoListaPaginada valor="${actualizacion.descripcion}" onclick="ver('${actualizacion.idActualizacion}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="center"><fmt:formatDate pattern="dd/MM/yyyy" value="${actualizacion.fechaPrevistaAplicacion}"/></cmz:itemContenidoListaPaginada>
                        <cmz:acciones alineacion="center">
                          <cmz:accion icono="comun/images/iconos/ver.gif" onclick="ver('${actualizacion.idActualizacion}');" descripcion="Ver Actualización"></cmz:accion>
                          <c:if test="${permisos.puedeEditar}">
                            <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar('${actualizacion.idActualizacion}');" descripcion="Editar Actualización"></cmz:accion>
                          </c:if>
                          <c:if test="${permisos.puedeEliminar}">
                            <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar('${actualizacion.idActualizacion}');" descripcion="Eliminar Actualización"></cmz:accion>
                          </c:if>
                        </cmz:acciones>
                      </cmz:contenidoListaPaginada>
                    </cmz:listaPaginada>
                  </cmz:cuerpoPanel>
                </cmz:panel>
              </c:when>
            </c:choose>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
