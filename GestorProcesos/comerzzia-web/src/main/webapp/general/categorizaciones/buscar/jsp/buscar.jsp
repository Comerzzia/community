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



<jsp:useBean id="paramBuscarCategorizaciones" type="com.comerzzia.persistencia.general.categorizaciones.ParametrosBuscarCategorizacionesBean" scope="session" />
<jsp:useBean id="paginaResultados" class="com.comerzzia.util.paginacion.PaginaResultados" scope="request" />


<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/mantenimiento.js"></script>
    
    <script type="text/javascript">
        function inicio() {
            document.getElementById("codCat").focus();
        }
        
        function imprimir(){
            document.getElementById("accion").value = "general.categorizacion.lstCategorizacion";
            document.getElementById("operacion").value = "nuevo";
			document.getElementById("frmDatos").submit();
			_esperando();
		}
    </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="Mantenimiento de Categorizaciones" icono="comun/images/menu/categorizaciones.gif">
          <cmz:acciones numAccionesVisibles="2">
            <c:if test="${permisos.puedeAñadir}">
              <cmz:accionNuevoRegistro onclick="alta();" descripcion="Alta de una nueva categorización"/>
            </c:if>
            <cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir listado categorizaciones" onclick="imprimir()" />
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="categorizaciones" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda de Categorizaciones"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td>
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Código:</td>
                          <td><cmz:campoTexto id="codCat" valor="${paramBuscarCategorizaciones.codCat}" anchura="100px" longitudMaxima="6"/></td>
                          <td>Activo:</td>
                          <td width="150px">
                          	<select class="campo" id="activo" name="activo">
                          		<option value="" <c:if test="${paramBuscarCategorizaciones.activo == ''}">selected="selected"</c:if>>Todos</option>
                          		<option value="S" <c:if test="${paramBuscarCategorizaciones.activo == 'S'}">selected="selected"</c:if>>Activos</option>
                          		<option value="N" <c:if test="${paramBuscarCategorizaciones.activo == 'N'}">selected="selected"</c:if>>Inactivos</option>
                          	</select>
                          </td>
                          <td>
                      		<cmz:botonConsultar onclick="consultar();"/>
                    	  </td>
                        </tr>
                        
                        <tr>
                          <td>Descripción:</td>
                          <td><cmz:campoTexto id="desCat" valor="${paramBuscarCategorizaciones.desCat}" anchura="300px" longitudMaxima="45"/></td>
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
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarCategorizaciones.orden}">
                        <cmz:itemCabeceraListaPaginada nombre="Código" columna="1" ordenColumna="CODCAT"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="2" ordenColumna="DESCAT"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      <cmz:contenidoListaPaginada variable="categorizacion" paginaResultados="${paginaResultados}">
                        <cmz:itemContenidoListaPaginada valor="${categorizacion.codCat}" onclick="ver('${categorizacion.codCat}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${categorizacion.desCat}"></cmz:itemContenidoListaPaginada>
                        <cmz:acciones alineacion="center">
                          <cmz:accion icono="comun/images/iconos/ver.gif" onclick="ver('${categorizacion.codCat}');" descripcion="Ver Código"></cmz:accion>
                          <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar('${categorizacion.codCat}');" descripcion="Editar Código"></cmz:accion>
                          <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar('${categorizacion.codCat}');" descripcion="Eliminar Código"></cmz:accion>
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
