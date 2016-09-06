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

<jsp:useBean id="paramBuscarClientes" type="com.comerzzia.persistencia.general.clientes.ParametrosBuscarClientesBean" scope="session" />
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
        	setFoco("codCli");
        }
        
        function imprimir(){
            document.getElementById("accion").value = "general.clientes.lstClientes";
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
              <cmz:accionNuevoRegistro onclick="alta();" descripcion="Alta de un nuevo cliente"/>
            </c:if>
            <cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir listado clientes" onclick="imprimir()" />
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="clientes" method="POST">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda de Clientes"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td>
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Código:</td>
                          <td><cmz:campoTexto id="codCli" valor="${paramBuscarClientes.codCli}" anchura="150px" longitudMaxima="11"/></td>

                          <td>Activo:</td>
                          <td width="150px">
                          	<select id="activo" name="activo" class="campo">
                          		<option value="" <c:if test="${paramBuscarClientes.activo == ''}">selected="selected"</c:if>>Todos</option>
                          		<option value="S" <c:if test="${paramBuscarClientes.activo == 'S'}">selected="selected"</c:if>>Activos</option>
                          		<option value="N" <c:if test="${paramBuscarClientes.activo == 'N'}">selected="selected"</c:if>>Inactivos</option>
                          	</select>
                          </td>
                          <td>
                      		<cmz:botonConsultar onclick="consultar();"/>
                    	  </td>
                        </tr>
                        
                        <tr>
                          <td>Descripción:</td>
                          <td><cmz:campoTexto id="desCli" valor="${paramBuscarClientes.desCli}" anchura="320px" longitudMaxima="45"/></td>

                          <td>CIF:</td>
                          <td><cmz:campoTexto id="cif" valor="${paramBuscarClientes.cif}" anchura="120px" longitudMaxima="20"/></td>
                        </tr>
                        
                        <tr>
                          <td>Nombre comercial:</td>
                          <td><cmz:campoTexto id="nombreComercial" valor="${paramBuscarClientes.nombreComercial}" anchura="320px" longitudMaxima="45"/></td>
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
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarClientes.orden}">
                        <cmz:itemCabeceraListaPaginada nombre="Código" columna="1" ordenColumna="CODCLI"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="2" ordenColumna="DESCLI"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Nombre Comercial" columna="3" ordenColumna="NOMBRE_COMERCIAL"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="CIF" columna="4" ordenColumna="CIF"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      
                      <cmz:contenidoListaPaginada variable="cliente" paginaResultados="${paginaResultados}">
                        <cmz:itemContenidoListaPaginada valor="${cliente.codCli}" onclick="ver('${cliente.codCli}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${cliente.desCli}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${cliente.nombreComercial}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${cliente.cif}"></cmz:itemContenidoListaPaginada>
                        <cmz:acciones alineacion="center">
                          <cmz:accion icono="comun/images/iconos/ver.gif" onclick="ver('${cliente.codCli}');" descripcion="Ver Cliente"></cmz:accion>
                          <c:if test="${permisos.puedeEditar}">
                            <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar('${cliente.codCli}');" descripcion="Editar Cliente"></cmz:accion>
                          </c:if>
                          <c:if test="${permisos.puedeEliminar}">
                            <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar('${cliente.codCli}');" descripcion="Eliminar Cliente"></cmz:accion>
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
