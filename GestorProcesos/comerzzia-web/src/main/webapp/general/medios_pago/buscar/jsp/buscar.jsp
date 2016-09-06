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

<jsp:useBean id="paramBuscarMediosPago" type="com.comerzzia.persistencia.general.mediospago.ParametrosBuscarMediosPagoBean" scope="session" />
<jsp:useBean id="paginaResultados" class="com.comerzzia.util.paginacion.PaginaResultados" scope="request" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    
    <script type="text/javascript">
        function inicio() {
        	setFoco("codMedioPago");
        }

        function imprimir(){
            document.getElementById("accion").value = "general.medio_pago.lstmediospago";
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
              <cmz:accionNuevoRegistro onclick="alta();" descripcion="Alta de un nuevo medio de pago"/>
            </c:if>
            <cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir listado medios de pago" onclick="imprimir()" />
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuarios" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="mediosPago" method="POST">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda de Medios de Pago"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td>
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Código:</td>
                          <td><cmz:campoTexto id="codMedioPago" valor="${paramBuscarMediosPago.codMedioPago}" anchura="100px" longitudMaxima="2"/></td>
                          <td>Activo:</td>
                          <td width="150px">
                          	<select class="campo" id="activo" name="activo">
                          		<option value="" <c:if test="${paramBuscarMediosPago.activo == ''}">selected="selected"</c:if>>Todos</option>
                          		<option value="S" <c:if test="${paramBuscarMediosPago.activo == 'S'}">selected="selected"</c:if>>Activos</option>
                          		<option value="N" <c:if test="${paramBuscarMediosPago.activo == 'N'}">selected="selected"</c:if>>Inactivos</option>
                          	</select>
                          </td>
                          <td>
                      		<cmz:botonConsultar onclick="consultar();"/>
                    	  </td>
                        </tr>
                        
                        <tr>
                          <td>Descripción:</td>
                          <td><cmz:campoTexto id="desMedioPago" valor="${paramBuscarMediosPago.desMedioPago}" anchura="320px" longitudMaxima="30"/></td>
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
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarMediosPago.orden}">
                        <cmz:itemCabeceraListaPaginada nombre="Código" columna="1" ordenColumna="CODMEDPAG"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="2" ordenColumna="DESMEDPAG"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Contado" columna="3" ordenColumna="CONTADO" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Efectivo" columna="4" ordenColumna="EFECTIVO" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Tarjeta Crédito" columna="5" ordenColumna="TARJETA_CREDITO" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      
                      <cmz:contenidoListaPaginada variable="medioPago" paginaResultados="${paginaResultados}">
                        <cmz:itemContenidoListaPaginada valor="${medioPago.codMedioPago}" onclick="ver('${medioPago.codMedioPago}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${medioPago.desMedioPago}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${medioPago.contadoTexto}" alineacion="center"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${medioPago.efectivoTexto}" alineacion="center"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${medioPago.tarjetaCreditoTexto}" alineacion="center"></cmz:itemContenidoListaPaginada>
                        <cmz:acciones alineacion="center">
                          <cmz:accion icono="comun/images/iconos/ver.gif" onclick="ver('${medioPago.codMedioPago}');" descripcion="Ver Medio de Pago"></cmz:accion>
                          <c:if test="${permisos.puedeEditar}">
                            <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar('${medioPago.codMedioPago}');" descripcion="Editar Medio de Pago"></cmz:accion>
                          </c:if>
                          <c:if test="${permisos.puedeEliminar}">
                            <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar('${medioPago.codMedioPago}');" descripcion="Eliminar Medio de Pago"></cmz:accion>
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