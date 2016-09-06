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

<jsp:useBean id="formularioCliente" type="com.comerzzia.web.general.clientes.ui.FormularioClienteBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="cliente" value="${formularioCliente.registroActivo}" />

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
	    	setFoco("codCli", "desCli");
        }
        
        function checkForm() {
        	    if(!esValido("codCli", "TEXTO", true)) {
	                return false;
	            }
	            if(!esValido("desCli", "TEXTO", true)) {
	                return false;
	            }
				//TODO: Meter validaciones de los campos de ayuda
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
              <c:when test="${!formularioCliente.editable}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Cliente"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir un nuevo Cliente"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Cliente"></cmz:accion>
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
          <form id="frmDatos" name="frmDatos" action="clientes" method="post">
          	<input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            <input id="idObjeto" name="idObjeto" type="hidden" value="${cliente.codCli}" />                        
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Cliente"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Código:</td>
                    <td>
                      <cmz:campoTexto id="codCli" valor="${cliente.codCli}" requerido="true" anchura="150px" longitudMaxima="11"
                                        editable="${formularioCliente.enInsercion}" soloLectura="${!formularioCliente.enInsercion}"/>
                    </td>
                    
                    <td>Descripción:</td>
                    <td><cmz:campoTexto id="desCli" valor="${cliente.desCli}" requerido="true" anchura="320px" longitudMaxima="45" 
                                        editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}"/>
                    </td>

			        <td>
			          <input type="checkbox" value="" id="activo" name="activo" <c:if test="${cliente.activo}">checked="checked"</c:if> 
			                 <c:if test="${!formularioCliente.editable}">disabled</c:if>/>
			          Activo
			        </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            <cmz:pestañas>
            	<cmz:cabeceraPestañas pestañaActiva="${formularioCliente.pestañaActiva}">
            		<cmz:pestaña titulo="Datos Generales" accion="0" onclick="seleccionaPestaña(0);"></cmz:pestaña>
            		<cmz:pestaña titulo="Datos Bancarios" accion="1" onclick="seleccionaPestaña(1);"></cmz:pestaña>
            		<cmz:pestaña titulo="Observaciones" accion="2" onclick="seleccionaPestaña(2);"></cmz:pestaña>            		
            	</cmz:cabeceraPestañas>
            	<cmz:cuerpoPestaña>
            		<c:choose>
            			<c:when test="${formularioCliente.pestañaActiva == 1}">
                          <c:import url="datosBancarios.jsp"></c:import>
                        </c:when>
                        <c:when test="${formularioCliente.pestañaActiva == 2}">
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
