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

<jsp:useBean id="cAlmacen" type="com.comerzzia.persistencia.general.conceptoalmacenes.ConceptoAlmacenBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/mantenimiento.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    
    <script type="text/javascript">
        function inicio() {
            document.getElementById("codConAlm").focus();
        }
        
        function checkForm() {
        	if(!esValido("codConAlm", "TEXTO", true)){
            	return false;
        	}
        	if(!esValido("desConAlm", "TEXTO", false)){
            	return false;
        	}
        	if(!esValido("signo", "TEXTO", false)){
            	return false;
        	}
        	
        	visibleCodAlmacenOrigen = '<c:out value="${cAlmacen.visibleCodAlmacenOrigen}"/>';
        	if (visibleCodAlmacenOrigen=='true'){
            	if(!esValido("codAlm_origen", "AYUDA", false, "desAlm_origen", "ALMACENES")) {
        			return false;
        		} 
            }
        	
        	if(!esValido("codAlm_destino", "AYUDA", false, "desAlm_destino", "ALMACENES")) {
    			return false;
    		}
            
            if(<c:out value="${cAlmacen.visibleCodAlmacenOrigen}"/> && <c:out value="${cAlmacen.visibleVisibleTiendas}" />) {
            	if(!esValido("codAlm_origen", "TEXTO", document.getElementById("visibleTiendas").checked)){
                	return false;
            	}
            }
           
            return true;
        }
        
        function aceptar() {
        	if(checkForm()) {
        	    document.getElementById("accion").value = "salvar";
        	    document.getElementById("frmDatos").submit();
        	}
        }
    </script>
  </head>

  <body  onload="inicio();" onkeydown="keyDown(event);">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <c:choose>
              <c:when test="${!cAlmacen.enEdicion}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Concepto de Almacen"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir un nuevo Concepto de Almacén"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Concepto de Almacen"></cmz:accion>
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
          <form id="frmDatos" name="frmDatos" action="conceptoAlmacenes${paramBuscarConceptoAlmacenes.codAplicacion}" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${cAlmacen.codConAlm}" />
            <input id="estadoObjeto" name="estadoObjeto" type="hidden" value="${cAlmacen.estadoBean}" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Concepto de Almacen"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Código:</td>
                    <td>
                      <cmz:campoTexto id="codConAlm" valor="${cAlmacen.codConAlm}" requerido="true" anchura="40px" longitudMaxima="4"
                                        editable="${cAlmacen.estadoNuevo}" soloLectura="${!cAlmacen.estadoNuevo}"/>
                    </td>
                    
                    <td>
                      <input type="checkbox" value="" id="activo" name="activo" <c:if test="${cAlmacen.activo}">checked="checked"</c:if> 
                             <c:if test="${!cAlmacen.enEdicion}">disabled</c:if>/>
                      Activo
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Descripción</td>
                    <td><cmz:campoTexto id="desConAlm" valor="${cAlmacen.desConAlm}" requerido="false" anchura="200px" longitudMaxima="30" 
                                        editable="${cAlmacen.enEdicion}" soloLectura="${!cAlmacen.enEdicion}"/></td>
                  </tr>
                  
                  <tr>
                    <td>Signo:</td>
                    <td>
                    <select id="signo" name="signo" <c:if test="${!cAlmacen.enEdicion}">disabled</c:if> class="campo">
                    	<option value="" <c:if test="${cAlmacen.signo == null || cAlmacen.signo == ''}">selected="selected"</c:if>></option>
                    	<option value="-" <c:if test="${cAlmacen.signo == '-'}">selected="selected"</c:if>>(-) Negativo</option>
                    	<option value="+" <c:if test="${cAlmacen.signo == '+'}">selected="selected"</c:if>>(+) Positivo</option>     	
                    </select>                    
                    </td>
                  </tr>
                  
                  <c:if test="${cAlmacen.visibleCodAlmacenOrigen}">
                  <tr>
                    <td>Almacén Origen:</td>
                    <td>
                      <cmz:ayuda nombreAyuda="ALMACENES" requerido="false" soloLectura="${!cAlmacen.enEdicion}">
                        <cmz:codigoAyuda idCodigo="codAlm_origen" longitudMaximaCodigo="4" valorCodigo="${cAlmacen.codAlm_origen}" anchuraCodigo="30px"></cmz:codigoAyuda>
                        <cmz:descripcionAyuda idDescripcion="desAlm_origen" anchuraDescripcion="250px" valorDescripcion="${cAlmacen.desAlm_origen}"></cmz:descripcionAyuda>
                      </cmz:ayuda>
                    </td>
                  </tr>
                  </c:if>
                  
                  <tr>
                    <td>Almacén Destino:</td>
                    <td>
                      <cmz:ayuda nombreAyuda="ALMACENES" requerido="false" soloLectura="${!cAlmacen.enEdicion}">
                        <cmz:codigoAyuda idCodigo="codAlm_destino" longitudMaximaCodigo="4" valorCodigo="${cAlmacen.codAlm_destino}" anchuraCodigo="30px"></cmz:codigoAyuda>
                        <cmz:descripcionAyuda idDescripcion="desAlm_destino" anchuraDescripcion="250px" valorDescripcion="${cAlmacen.desAlm_destino}"></cmz:descripcionAyuda>
                      </cmz:ayuda>
                    </td>
                  </tr>                  
                  
                  <c:if test="${cAlmacen.visibleSolicitudAceptacionAutomatico}">
                  <tr>
                    <td>Aceptación Automática de Pedidos:</td>
                    <td><input type="checkbox" value="" id="solicitudAceptacionAutomatico" name="solicitudAceptacionAutomatico" <c:if test="${cAlmacen.solicitudAceptacionAutomatico}">checked="checked"</c:if> 
                             <c:if test="${!cAlmacen.enEdicion}">disabled</c:if>/></td>
                  </tr>
                  </c:if>
                  
                  <c:if test="${cAlmacen.visibleSolicitudRecepcionAutomatico}">
                  <!-- Ocultamos por ahora la posibilidad de marcar si la recepción del pedido es automática y lo forzamos a verdadero -->
                  <tr style="display:none">
                    <td>Recepción Automática de Pedidos:</td>
                    <td><input type="checkbox" value="" id="solicitudRecepcionAutomatico" name="solicitudRecepcionAutomatico" checked="checked" 
                             <c:if test="${!cAlmacen.enEdicion}">disabled</c:if>/></td>
                  </tr>
                  </c:if>
                  
                  <c:if test="${cAlmacen.visibleSolicitudGenerarFaltas}">
                  <tr>
                    <td>Generación Automática de Pedido de Faltas:</td>
                    <td><input type="checkbox" value="" id="solicitudGenerarFaltas" name="solicitudGenerarFaltas" <c:if test="${cAlmacen.solicitudGenerarFaltas}">checked="checked"</c:if> 
                             <c:if test="${!cAlmacen.enEdicion}">disabled</c:if>/></td>
                  </tr>
                  </c:if>
                  
                  <c:if test="${cAlmacen.visibleVisibleTiendas}">
                  <tr>
                    <td>Visible Tiendas:</td>
                    <td><input type="checkbox" value="" id="visibleTiendas" name="visibleTiendas" <c:if test="${cAlmacen.visibleTiendas}">checked="checked"</c:if> 
                             <c:if test="${!cAlmacen.enEdicion}">disabled</c:if>/></td>
                  </tr>
                  </c:if>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
