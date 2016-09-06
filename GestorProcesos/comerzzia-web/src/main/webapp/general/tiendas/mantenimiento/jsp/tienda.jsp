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

<jsp:useBean id="formularioTienda" type="com.comerzzia.web.general.tiendas.ui.FormularioTiendaBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="tienda" value="${formularioTienda.registroActivo}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    
    <script type="text/javascript">
    	function inicio() {
    		setFoco("codAlm", "desAlm", "domicilio", "codCaja", "xmlConfiguracion");
    		if(window.mostrarCheckEscaparates){
            	mostrarCheckEscaparates();
        	}
    	}
        
        function checkForm() {
        	if(!esValido("codAlm", "TEXTO", true))
            	return false;
	        if(!esValido("desAlm", "TEXTO", true))
	            return false;
            
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
              <c:when test="${!formularioTienda.editable}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Tienda"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir una nueva Tienda"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Tienda"></cmz:accion>
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
          <form id="frmDatos" name="frmDatos" action="tiendas" method="post">            
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            <input id="idObjeto" name="idObjeto" type="hidden" value="${tienda.codAlm}" />
            <input id="codTarifas" name="codTarifas" type="hidden" value=""/>
            <input id="desTarifas" name="desTarifas" type="hidden" value=""/>
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos de la Tienda"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Código:</td>
                    <td>
                      <cmz:campoTexto id="codAlm" valor="${tienda.codAlm}" requerido="true" anchura="90px" longitudMaxima="4"
                                        editable="${formularioTienda.enInsercion}" soloLectura="${!formularioTienda.enInsercion}"/>
                    </td>
                    
                    <td>Descripción:</td>
                    <td><cmz:campoTexto id="desAlm" valor="${tienda.desAlm}" requerido="true" anchura="300px" longitudMaxima="45" 
                                        editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/></td>
					
					<td>
                      <input type="checkbox" value="" id="activo" name="activo" <c:if test="${tienda.activo}">checked="checked"</c:if> 
                             <c:if test="${!formularioTienda.editable}">disabled</c:if>/>
                      Activo
                    </td>                                        
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <cmz:pestañas>
            	<cmz:cabeceraPestañas pestañaActiva="${formularioTienda.pestañaActiva}">
            		<cmz:pestaña titulo="General" accion="0" onclick="seleccionaPestaña(0);"></cmz:pestaña>
            		<!--  cmz:pestaña titulo="Cajas" accion="1" onclick="seleccionaPestaña(1);" --><!-- /cmz:pestaña -->
            		<cmz:pestaña titulo="Tarifas" accion="2" onclick="seleccionaPestaña(2);"></cmz:pestaña>
            		<cmz:pestaña titulo="Configuración" accion="3" onclick="seleccionaPestaña(3);"></cmz:pestaña>
            		<cmz:pestaña titulo="Usuarios" accion="4" onclick="seleccionaPestaña(4);"></cmz:pestaña>
            	</cmz:cabeceraPestañas>
            	<cmz:cuerpoPestaña>
            		<c:choose>
                        <c:when test="${formularioTienda.pestañaActiva == 1}">
                        	<c:choose>
		                      <c:when test="${formularioTienda.formularioPestañaActiva.modoVisualizacionFicha}">
		                        <c:import url="cajasFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
		                        <c:import url="cajasTabla.jsp"></c:import>
		                      </c:otherwise>
		                    </c:choose>
                        </c:when>
                        <c:when test="${formularioTienda.pestañaActiva == 2}">
                        	<c:choose>
		                      <c:when test="${requestScope.modoFicha}">
		                          <c:import url="tarifasFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
			                      <c:import url="tarifasTabla.jsp"></c:import>
		                      </c:otherwise>
		                    </c:choose>
                        </c:when>
                        <c:when test="${formularioTienda.pestañaActiva == 3}">
                        	<c:choose>
		                      <c:when test="${requestScope.modoFicha}">
		                        <c:import url="configuracionSincronizacionFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
		                        <c:import url="configuracionSincronizacionTabla.jsp"></c:import>
		                      </c:otherwise>
		                	</c:choose>                       	
                        </c:when>  
                        <c:when test="${formularioTienda.pestañaActiva == 4}">
                        	<c:choose>
		                      <c:when test="${requestScope.modoFicha}">
		                        <c:import url="usuariosFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
		                        <c:import url="usuariosTabla.jsp"></c:import>
		                      </c:otherwise>
		                	</c:choose>                       	
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
