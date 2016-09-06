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

<jsp:useBean id="formularioMedioPago" type="com.comerzzia.web.general.mediospago.ui.FormularioMedioPagoBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="medioPago" value="${formularioMedioPago.registroActivo}" />

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
        	setFoco("desVencimiento", "codMedioPago", "desMedioPago");
        }
        
        function checkForm() {
        	if(!esValido("codMedioPago", "TEXTO", true))
	            return false;
	        if(!esValido("desMedioPago", "TEXTO", true))
	           	return false;
        	
            return true;
        }
        
        function onclickContado(){
            var contado = document.getElementById("contado").checked;
            if(contado){
	        	document.getElementById("td_efectivo").style.display = "";
	        	document.getElementById("td_credito").style.display = "";
	        	document.getElementById("td_tienda").style.display = "";
            }
            else {
            	document.getElementById("efectivo").checked = false;
	        	document.getElementById("tarjetaCredito").checked = false;
	        	document.getElementById("visibleTiendaVirtual").checked = false;
            	document.getElementById("td_efectivo").style.display = "none";
	        	document.getElementById("td_credito").style.display = "none";
	        	document.getElementById("td_tienda").style.display = "none";
	        	document.getElementById("tr_efecto").style.display = "";
            }
        }
        function onclickEfectivo(){
        	var efectivo = document.getElementById("efectivo").checked;
            if(efectivo){
            	document.getElementById("tarjetaCredito").checked = false;
	        	document.getElementById("td_credito").style.display = "none";
	        	document.getElementById("tr_efecto").style.display = "none";
	        	document.getElementById("codTipoEfecto").value = "";
	        	document.getElementById("desTipoEfecto").value = "";
            }else{
            	document.getElementById("td_credito").style.display = "";
	        	document.getElementById("tr_efecto").style.display = "";
            }
        }
        function onclickCredito(){
        	var tarjetaCredito = document.getElementById("tarjetaCredito").checked;
            if(tarjetaCredito){
            	document.getElementById("efectivo").checked = false;
	        	document.getElementById("td_efectivo").style.display = "none";
	        	document.getElementById("tr_efecto").style.display = "none";
	        	document.getElementById("codTipoEfecto").value = "";
	        	document.getElementById("desTipoEfecto").value = "";
            }else{
            	document.getElementById("td_efectivo").style.display = "";
	        	document.getElementById("tr_efecto").style.display = "";
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
              <c:when test="${!formularioMedioPago.editable}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Medio de Pago"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir un nuevo Medio de Pago"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Medio de Pago"></cmz:accion>
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
          <form id="frmDatos" name="frmDatos" action="mediosPago" method="post">
         	<input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            <input id="idObjeto" name="idObjeto" type="hidden" value="${medioPago.codMedioPago}" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Medio de Pago"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Código:</td>
                    <td>
                      	<cmz:campoTexto id="codMedioPago" valor="${medioPago.codMedioPago}" requerido="true" anchura="100px" longitudMaxima="4"
                           	 editable="${formularioMedioPago.enInsercion}" soloLectura="${!formularioMedioPago.enInsercion}"/>
                    </td>
                    
                    <td>
                      <input type="checkbox" value="" id="activo" name="activo" <c:if test="${medioPago.activo}">checked="checked"</c:if> 
                             <c:if test="${!formularioMedioPago.editable}">disabled</c:if>/>
                      Activo
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Descripción:</td>
                    <td>
                    	<cmz:campoTexto id="desMedioPago" valor="${medioPago.desMedioPago}" requerido="true" anchura="320px" longitudMaxima="45" 
                             editable="${formularioMedioPago.editable}" soloLectura="${!formularioMedioPago.editable}"/></td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <cmz:pestañas>
            	<cmz:cabeceraPestañas pestañaActiva="${formularioMedioPago.pestañaActiva}">
            		<cmz:pestaña titulo="Datos Generales" accion="0" onclick="seleccionaPestaña(0);"></cmz:pestaña>
            		<c:if test="${!(medioPago.efectivo || medioPago.tarjetaCredito)}">
            		<cmz:pestaña titulo="Vencimientos" accion="1" onclick="seleccionaPestaña(1);"></cmz:pestaña>
            		</c:if>	
            	</cmz:cabeceraPestañas>
            	<cmz:cuerpoPestaña>
					<c:choose>
						<c:when test="${formularioMedioPago.pestañaActiva == 1}">
                        	<c:choose>
		                      <c:when test="${formularioMedioPago.formularioPestañaActiva.modoVisualizacionFicha}">
		                        <c:import url="vencimientosFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
		                        <c:import url="vencimientosTabla.jsp"></c:import>
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
