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

<jsp:useBean id="formularioProveedor" type="com.comerzzia.web.general.proveedores.ui.FormularioProveedorBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="proveedor" value="${formularioProveedor.registroActivo}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    
    <script type="text/javascript">
	    function inicio() {
	        setFoco("codPro", "desPro");
	    }
        
        function checkForm() {
        	
	            if(!esValido("codPro", "TEXTO", true)) {
	                return false;
	            }
	            if(!esValido("desPro", "TEXTO", true)) {
	                return false;
	            }
	            return true;
        }
    </script>
  </head>

  <body  onload="inicio();" onkeydown="keyDown(event);">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <c:choose>
              <c:when test="${!formularioProveedor.editable}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Proveedor"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir un nuevo Proveedor"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Proveedor"></cmz:accion>
                </c:if>
              </c:when>
              <c:otherwise>
                <cmz:accionSalvar onclick="aceptar();"/>
                <cmz:accionCancelar onclick="cancelar();"/>
              </c:otherwise>
            </c:choose>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="proveedores" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            <input id="idObjeto" name="idObjeto" type="hidden" value="${proveedor.codPro}" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Proveedor"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Código:</td>
                    <td>
                      <cmz:campoTexto id="codPro" valor="${proveedor.codPro}" requerido="true" anchura="150px" longitudMaxima="11"
                                        editable="${formularioProveedor.enInsercion}" soloLectura="${!formularioProveedor.enInsercion}"/>
                    </td>
                    
                    <td>Descripción:</td>
                    <td><cmz:campoTexto id="desPro" valor="${proveedor.desPro}" requerido="true" anchura="320px" longitudMaxima="45" 
                                        editable="${formularioProveedor.editable}" soloLectura="${!formularioProveedor.editable}"/>
                    </td>

			        <td>
			          <input type="checkbox" value="" id="activo" name="activo" <c:if test="${proveedor.activo}">checked="checked"</c:if> 
			                 <c:if test="${!formularioProveedor.editable}">disabled</c:if>/>
			          Activo
			        </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            <cmz:pestañas>
            	<cmz:cabeceraPestañas pestañaActiva="${formularioProveedor.pestañaActiva}">
            		<cmz:pestaña titulo="Datos Generales" accion="0" onclick="seleccionaPestaña(0);"></cmz:pestaña>
            		<cmz:pestaña titulo="Datos Bancarios" accion="1" onclick="seleccionaPestaña(1);"></cmz:pestaña>
            		<cmz:pestaña titulo="Observaciones" accion="2" onclick="seleccionaPestaña(2);"></cmz:pestaña>            		
            	</cmz:cabeceraPestañas>
            	<cmz:cuerpoPestaña>
            		<c:choose>
            			<c:when test="${formularioProveedor.pestañaActiva == 1}">
                          <c:import url="datosBancarios.jsp"></c:import>
                        </c:when>
                        <c:when test="${formularioProveedor.pestañaActiva == 2}">
                          <c:import url="observaciones.jsp"></c:import>
                        </c:when>
                        <c:otherwise>
                          <c:import url="datosGenerales.jsp"></c:import>
                        </c:otherwise>
                      </c:choose>
            	</cmz:cuerpoPestaña>
            </cmz:pestañas>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
