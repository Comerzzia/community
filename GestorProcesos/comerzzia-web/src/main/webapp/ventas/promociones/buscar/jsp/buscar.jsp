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

<jsp:useBean id="paramBuscarPromociones" type="com.comerzzia.persistencia.ventas.promociones.ParametrosBuscarPromocionesBean" scope="session" />
<jsp:useBean id="paginaResultados" class="com.comerzzia.util.paginacion.PaginaResultados" scope="request" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/mantenimiento.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    
    <script type="text/javascript">
        function inicio() {
        	setFoco("descripcion");
        }

        function imprimir(){
            document.getElementById("accion").value = "general.promociones.lstPromociones";
            document.getElementById("operacion").value = "nuevo";
			document.getElementById("frmDatos").submit();
			_esperando();
		}
    </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <c:if test="${permisos.puedeAñadir}">
              <cmz:accionNuevoRegistro onclick="alta();" descripcion="Alta de una nueva promoción"/>
            </c:if>
            <cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir listado promociones" onclick="imprimir()" />
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuarios" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="promociones" method="POST">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda de Promociones"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td>
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Descripción:</td>
                          <td><cmz:campoTexto id="descripcion" valor="${paramBuscarPromociones.descripcion}" anchura="320px" longitudMaxima="50"/></td>
                          <td width="30px"></td><!-- SEPARADOR -->
                          <td>
                      		<cmz:botonConsultar onclick="consultar();"/>
                    	  </td>
                        </tr>
                        <tr>
		                  <td>Tarifa:</td>
		                  <td colspan="2">
		                   	<cmz:ayuda nombreAyuda="TARIFAS">
						       	<cmz:codigoAyuda idCodigo="codTarifa" valorCodigo="${paramBuscarPromociones.codTarifa}" anchuraCodigo="100px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
						       	<cmz:descripcionAyuda idDescripcion="desTarifa" valorDescripcion="${paramBuscarPromociones.desTarifa}" anchuraDescripcion="200px"></cmz:descripcionAyuda>
						    </cmz:ayuda>
						  </td>
		                </tr>
		                <tr>
		                  <td>Estado:</td>
                          <td width="150px">
                          	<select id="estado" name="estado" class="campo">
                          		<option value="" <c:if test="${paramBuscarPromociones.estado == ''}">selected="selected"</c:if>>Todos</option>
                          		<option value="1" <c:if test="${paramBuscarPromociones.sinActivar}">selected="selected"</c:if>>Sin activar</option>
                          		<option value="2" <c:if test="${paramBuscarPromociones.activo}">selected="selected"</c:if>>Activa</option>
                          		<option value="3" <c:if test="${paramBuscarPromociones.finalizado}">selected="selected"</c:if>>Finalizada</option>
                          	</select>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <c:choose>
              <c:when test="${paginaResultados.pagina != null}">
                <cmz:panel>
                  <cmz:cabeceraPanelResultados numPorPagina="${paginaResultados.tamañoPagina}"></cmz:cabeceraPanelResultados>
                  <cmz:cuerpoPanel>
                    <cmz:listaPaginada>
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarPromociones.orden}">
                      <cmz:itemCabeceraListaPaginada nombre="Id" columna="1" ordenColumna="ID_PROMOCION"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="2" ordenColumna="DESCRIPCION"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Tarifa" columna="3" ordenColumna="CODTAR"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="4" ordenColumna="DESTAR"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Estado" columna="5" ></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      
                      <cmz:contenidoListaPaginada variable="promocion" paginaResultados="${paginaResultados}">
                      	<cmz:itemContenidoListaPaginada valor="${promocion.idPromocion}" onclick="ver('${promocion.idPromocion}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${promocion.descripcion}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${promocion.codTar}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${promocion.desTar}"></cmz:itemContenidoListaPaginada>
                        <c:choose>
                        	<c:when test="${!promocion.activa}">
                        		<cmz:itemContenidoListaPaginada valor="Sin activar"></cmz:itemContenidoListaPaginada>
                        	</c:when>
                        	<c:when test="${promocion.activa && !promocion.finalizada}">
                        		<cmz:itemContenidoListaPaginada valor="Activa"></cmz:itemContenidoListaPaginada>
                        	</c:when>
                        	<c:otherwise>
                        		<cmz:itemContenidoListaPaginada valor="Finalizada"></cmz:itemContenidoListaPaginada>
                        	</c:otherwise>
                        </c:choose>
                        <cmz:acciones alineacion="center">
                          <cmz:accion icono="comun/images/iconos/ver.gif" onclick="ver('${promocion.idPromocion}');" descripcion="Ver Promocion"></cmz:accion>
                          <c:if test="${permisos.puedeEditar}">
                            <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar('${promocion.idPromocion}');" descripcion="Editar Promocion"></cmz:accion>
                          </c:if>
                          <c:if test="${permisos.puedeEliminar}">
                            <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar('${promocion.idPromocion}');" descripcion="Eliminar Promocion"></cmz:accion>
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
