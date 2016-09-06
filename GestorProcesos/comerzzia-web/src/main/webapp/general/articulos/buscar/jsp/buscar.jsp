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

<jsp:useBean id="paramBuscarArticulos" type="com.comerzzia.persistencia.general.articulos.ParametrosBuscarArticulosBean" scope="session" />
<jsp:useBean id="paginaResultados" class="com.comerzzia.util.paginacion.PaginaResultados" scope="request" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />


<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    
    <script type="text/javascript">
        function inicio() {
            setFoco("codArticulo");
        }

        function checkForm() {
			if (!esValido("codArticulo", "TEXTO", false)) {
				return false;
			}
			if (!esValido("desArticulo", "TEXTO", false)) {
				return false;
			}
			if (!esValido("codFamilia", "AYUDA", false, "desFamilia", "FAMILIAS")) {
				return false;
			}
			if (!esValido("codProveedor", "AYUDA", false, "desProveedor", "PROVEEDORES")) {
				return false;
			}
            return true;
        }

        function imprimir(){
            document.getElementById("accion").value = "general.articulos.lstArticulos";
            document.getElementById("operacion").value = "nuevo";
			document.getElementById("frmDatos").submit();
			_esperando();
		}

        function altaRapidaArticulo() {
        	document.getElementById("accion").value = "altaRapida";        
        	document.getElementById("frmDatos").submit();              
        	_esperando();
   		 }
    </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="3">
            <c:if test="${permisos.puedeAñadir}">
              <cmz:accionNuevoRegistro onclick="alta();" descripcion="Alta de un nuevo artículo"/>
              <cmz:accion titulo="Alta rápida" icono="general/articulos/buscar/images/altaRapida.gif" descripcion="Alta rápida de Artículos"  onclick="altaRapidaArticulo();" />
            </c:if>
            <cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir listado artículos" onclick="imprimir()" />
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="articulos" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda de Artículos"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td>
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Código:</td>
                          <td><cmz:campoTexto id="codArticulo" valor="${paramBuscarArticulos.codArticulo}" anchura="150px" longitudMaxima="13"/></td>
                          <td>Activo:</td>
                          <td width="150px">
      						<select class="campo" id="activo" name="activo">
                          		<option value="" <c:if test="${paramBuscarArticulos.activo == ''}">selected="selected"</c:if>>Todos</option>
                          		<option value="S" <c:if test="${paramBuscarArticulos.activo == 'S'}">selected="selected"</c:if>>Activos</option>
                          		<option value="N" <c:if test="${paramBuscarArticulos.activo == 'N'}">selected="selected"</c:if>>Inactivos</option>
                          	</select>
                          </td>
		                  <td>
	                        <cmz:botonConsultar onclick="consultar();"/>
	                      </td>
                        </tr>                       
                        <tr>
                          <td>Descripción:</td>
                          <td><cmz:campoTexto id="desArticulo" valor="${paramBuscarArticulos.desArticulo}" anchura="320px" longitudMaxima="45"/></td>
                        </tr>                        
                        <tr>
							<td>Familia:</td>
							<td colspan="4"><cmz:ayuda nombreAyuda="FAMILIAS">
								<cmz:codigoAyuda idCodigo="codFamilia"
									valorCodigo="${paramBuscarArticulos.codFamilia}"
									anchuraCodigo="100px" longitudMaximaCodigo="6"></cmz:codigoAyuda>
								<cmz:descripcionAyuda idDescripcion="desFamilia"
									valorDescripcion="${paramBuscarArticulos.desFamilia}"
									anchuraDescripcion="320px"></cmz:descripcionAyuda>
							</cmz:ayuda></td>
						</tr>
						<tr>
							<td>Proveedor:</td>
							<td colspan="4"><cmz:ayuda nombreAyuda="PROVEEDORES">
								<cmz:codigoAyuda idCodigo="codProveedor"
									valorCodigo="${paramBuscarArticulos.codProveedor}"
									anchuraCodigo="100px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
								<cmz:descripcionAyuda idDescripcion="desProveedor"
									valorDescripcion="${paramBuscarArticulos.desProveedor}"
									anchuraDescripcion="320px"></cmz:descripcionAyuda>
							</cmz:ayuda></td>
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
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarArticulos.orden}">
                        <cmz:itemCabeceraListaPaginada nombre="Código" columna="1" ordenColumna="CODART"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="2" ordenColumna="DESART"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraLista nombre="Familia" columna="3" ordenColumna="DESFAM"></cmz:itemCabeceraLista>
                        <cmz:itemCabeceraLista nombre="Proveedor" columna="4" ordenColumna="DESPRO"></cmz:itemCabeceraLista>
                        <cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      <cmz:contenidoListaPaginada variable="articulo" paginaResultados="${paginaResultados}">
                        <cmz:itemContenidoListaPaginada valor="${articulo.codArticulo}" onclick="ver('${articulo.codArticulo}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${articulo.desArticulo}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoLista valor="${articulo.desFamilia}"></cmz:itemContenidoLista>
                        <cmz:itemContenidoLista valor="${articulo.desProveedor}"></cmz:itemContenidoLista>
                        <cmz:acciones alineacion="center">
                          <cmz:accion icono="comun/images/iconos/ver.gif" onclick="ver('${articulo.codArticulo}');" descripcion="Ver Artículo"></cmz:accion>
                          <c:if test="${permisos.puedeEditar}">
                            <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar('${articulo.codArticulo}');" descripcion="Editar Artículo"></cmz:accion>
                          </c:if>
                          <c:if test="${permisos.puedeEliminar}">
                            <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar('${articulo.codArticulo}');" descripcion="Eliminar Artículo"></cmz:accion>
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
