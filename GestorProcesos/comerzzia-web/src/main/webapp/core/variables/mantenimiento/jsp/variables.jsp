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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="formularioVariables" type="com.comerzzia.web.core.variables.ui.FormularioVariablesBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="variables" value="${formularioVariables.registros}"></c:set>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    
    <script type="text/javascript">
        function inicio() {
        	setFoco("desglose1");
        }

        function checkForm(){
        	if (!esValido("desglose1", "TEXTO", false)) {
                return false;
            }
        	if (!esValido("desglose2", "TEXTO", false)) {
                return false;
            }
        	if (!esValido("r1Desde", "ENTERO", true)) {
                return false;
            }
			if (!esValido("r1Hasta", "ENTERO", true)) {
                return false;
            }
			if (!esValido("r1Valor", "ENTERO", true)) {
                return false;
            }
			if (!esValido("r2Desde", "ENTERO", true)) {
                return false;
            }
			if (!esValido("r2Hasta", "ENTERO", true)) {
                return false;
            }
			if (!esValido("r2Valor", "ENTERO", true)) {
                return false;
            }
			if (!esValido("r3Desde", "ENTERO", true)) {
                return false;
            }
			if (!esValido("r3Hasta", "ENTERO", true)) {
                return false;
            }
			if (!esValido("r3Valor", "ENTERO", true)) {
                return false;
            }
        	if (!checkLongitudRedondeo()) {
            	return false;
            }
        	if (!checkRedondeo()) {
            	return false;
            }
            if (!esValido("maxTrabajos", "ENTERO", false)) {
                return false;
            }
        	if (!esValido("ticketsTiempo", "ENTERO", false)) {
                return false;
            }
            
        	return true;
        }

        function checkLongitudRedondeo(){
        	var l1Desde = document.getElementById("r1Desde").value.length;
			var l1Hasta = document.getElementById("r1Hasta").value.length;
			var l1Valor = document.getElementById("r1Valor").value.length;
			var l2Desde = document.getElementById("r2Desde").value.length;
			var l2Hasta = document.getElementById("r2Hasta").value.length;
			var l2Valor = document.getElementById("r2Valor").value.length;
			var l3Desde = document.getElementById("r3Desde").value.length;
			var l3Hasta = document.getElementById("r3Hasta").value.length;
			var l3Valor = document.getElementById("r3Valor").value.length;

			if(l1Desde != l1Hasta || l1Desde != l1Valor
					|| l1Desde != l2Desde || l1Desde != l2Hasta || l1Desde != l2Valor
					|| l1Desde != l3Desde || l1Desde != l3Hasta || l1Desde != l3Valor){

				alert("Todos los valores del redondeo deben tener una longitud de " + l1Desde + " dígitos.");
				return false;
			}
			
			return true;
        }

        function checkRedondeo(){
        	var r1Desde = document.getElementById("r1Desde").value;
			var r1Hasta = document.getElementById("r1Hasta").value;
			var r1Valor = document.getElementById("r1Valor").value;
			var r2Desde = document.getElementById("r2Desde").value;
			var r2Hasta = document.getElementById("r2Hasta").value;
			var r2Valor = document.getElementById("r2Valor").value;
			var r3Desde = document.getElementById("r3Desde").value;
			var r3Hasta = document.getElementById("r3Hasta").value;
			var r3Valor = document.getElementById("r3Valor").value;

			if(r1Desde == 0 && (r1Hasta != 0 || r1Valor != 0 || r2Desde != 0
					|| r2Hasta != 0 || r2Valor != 0 || r3Desde != 0
					|| r3Hasta != 0 || r3Valor != 0)){
				
				alert("Todos los valores de redondeo deben ser igual a 0.");
				return false;
			}

			if(r1Desde >= r1Hasta){
				alert("El campo 'Hasta' del primer nivel de redondeo debe ser mayor que el campo 'Desde' del primer nivel de redondeo.");
				return false;
			}
			if(r1Hasta >= r2Desde){
				alert("El campo 'Desde' del segundo nivel de redondeo debe ser mayor que el campo 'Hasta' del primer nivel de redondeo'.");
				return false;
			}
			if(r2Desde >= r2Hasta){
				alert("El campo 'Hasta' del segundo nivel de redondeo debe ser mayor que el campo 'Desde' del segundo nivel de redondeo.");
				return false;
			}
			if(r2Hasta >= r3Desde){
				alert("El campo 'Desde' del tercer nivel de redondeo debe ser mayor que el campo 'Hasta' del segundo nivel de redondeo'.");
				return false;
			}
			if(r3Desde >= r3Hasta){
				alert("El campo 'Hasta' del tercer nivel de redondeo debe ser mayor que el campo 'Desde' del tercer nivel de redondeo.");
				return false;
			}

			return true;
        }

        function editar() {
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("accion").value = "editar";
        	document.getElementById("frmDatos").submit();
        }

        function testear() {
            var url = document.getElementById("webservice").value;
        	abrirVentanaCentrada(url, 600, 800);
        }

    </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
        	<cmz:acciones numAccionesVisibles="1">
            <c:choose>
              <c:when test="${!formularioVariables.editable}">
              	<c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Variables"></cmz:accion>
                </c:if>
                <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuarios" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
                <c:if test="${permisos.puedeAdministrar}">
              	  <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
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
          <form id="frmDatos" name="frmDatos" action="variables" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            
			<cmz:panel>
				<cmz:cabeceraPanel titulo="Artículos"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
					<table cellpadding="2px" cellspacing="2px" border="0px">
						<tr>
							<c:set var="desglose1" value="${variables[0]}"></c:set>
							<td><c:out value="${desglose1.descripcion}"/>:</td>
				            <td>
				            	<cmz:campoTexto id="desglose1" 
				            		valor="${desglose1.valor == null ? desglose1.valorDefecto : desglose1.valor}" 
				            		anchura="100px" longitudMaxima="20" 
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>
						</tr>
						<tr>
							<c:set var="desglose2" value="${variables[1]}"></c:set>
							<td><c:out value="${desglose2.descripcion}"/>:</td>
				            <td>
				            	<cmz:campoTexto id="desglose2" 
				            		valor="${desglose2.valor == null ? desglose2.valorDefecto : desglose2.valor}" 
				            		anchura="100px" longitudMaxima="20" 
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>
						</tr>
						<tr>
							<c:set var="codigoBarrasFormato" value="${variables[11]}"></c:set>
							<td><c:out value="${codigoBarrasFormato.descripcion}"/>:</td>
				            <td>	
				            	<c:set var="formatoValor" value="${codigoBarrasFormato.valor == null ? codigoBarrasFormato.valorDefecto : codigoBarrasFormato.valor}"></c:set>
				            	<input type="radio" id="formatoValor" name="formatoValor" value="EAN13" <c:if test="${formatoValor == 'EAN13'}">checked="checked"</c:if> <c:if test="${!formularioVariables.editable}">disabled="disabled"</c:if>>&nbsp;EAN13
				            	<input type="radio" id="formatoValor" name="formatoValor" value="EAN8" <c:if test="${formatoValor == 'EAN8'}">checked="checked"</c:if> <c:if test="${!formularioVariables.editable}">disabled="disabled"</c:if>>&nbsp;EAN8
				            </td>
						</tr>
					</table>
				</cmz:cuerpoPanel>
			</cmz:panel>
			<cmz:panel>
				<cmz:cabeceraPanel titulo="Tarifas"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
					<table cellpadding="2px" cellspacing="2px" border="0px">
						<tr>
							<c:set var="redondeo1" value="${variables[2]}"></c:set>
							
							<c:if test="${redondeo1.valor == null}">
								<c:set var="r1Desde" value="${fn:split(redondeo1.valorDefecto, '-')[0]}"></c:set>
								<c:set var="r1Hasta" value="${fn:split(redondeo1.valorDefecto, '-')[1]}"></c:set>
								<c:set var="r1Valor" value="${fn:split(redondeo1.valorDefecto, '-')[2]}"></c:set>
							</c:if>
							<c:if test="${redondeo1.valor != null}">
								<c:set var="r1Desde" value="${fn:split(redondeo1.valor, '-')[0]}"></c:set>
								<c:set var="r1Hasta" value="${fn:split(redondeo1.valor, '-')[1]}"></c:set>
								<c:set var="r1Valor" value="${fn:split(redondeo1.valor, '-')[2]}"></c:set>
							</c:if>
							<td><c:out value="${redondeo1.descripcion}"/>:</td>
				            <td>
				            	<cmz:campoTexto id="r1Desde" valor="${r1Desde}" 
				            		anchura="30px" longitudMaxima="2"  requerido="true"
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>			            
				            <td>
				            	<cmz:campoTexto id="r1Hasta" valor="${r1Hasta}" 
				            		anchura="30px" longitudMaxima="2" requerido="true"
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>
				            <td>
				            	<cmz:campoTexto id="r1Valor" valor="${r1Valor}" 
				            		anchura="30px" longitudMaxima="2" requerido="true"
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>
						</tr>
						<tr>
							<c:set var="redondeo2" value="${variables[3]}"></c:set>
							
							<c:if test="${redondeo2.valor == null}">
								<c:set var="r2Desde" value="${fn:split(redondeo2.valorDefecto, '-')[0]}"></c:set>
								<c:set var="r2Hasta" value="${fn:split(redondeo2.valorDefecto, '-')[1]}"></c:set>
								<c:set var="r2Valor" value="${fn:split(redondeo2.valorDefecto, '-')[2]}"></c:set>
							</c:if>
							<c:if test="${redondeo2.valor != null}">
								<c:set var="r2Desde" value="${fn:split(redondeo2.valor, '-')[0]}"></c:set>
								<c:set var="r2Hasta" value="${fn:split(redondeo2.valor, '-')[1]}"></c:set>
								<c:set var="r2Valor" value="${fn:split(redondeo2.valor, '-')[2]}"></c:set>
							</c:if>
							<td><c:out value="${redondeo2.descripcion}"/>:</td>
				            <td>
				            	<cmz:campoTexto id="r2Desde" valor="${r2Desde}" 
				            		anchura="30px" longitudMaxima="2" requerido="true"
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>			            
				            <td>
				            	<cmz:campoTexto id="r2Hasta" valor="${r2Hasta}" 
				            		anchura="30px" longitudMaxima="2" requerido="true"
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>
				            <td>
				            	<cmz:campoTexto id="r2Valor" valor="${r2Valor}" 
				            		anchura="30px" longitudMaxima="2" requerido="true"
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>
						</tr>
						<tr>
							<c:set var="redondeo3" value="${variables[4]}"></c:set>
							
							<c:if test="${redondeo3.valor == null}">
								<c:set var="r3Desde" value="${fn:split(redondeo3.valorDefecto, '-')[0]}"></c:set>
								<c:set var="r3Hasta" value="${fn:split(redondeo3.valorDefecto, '-')[1]}"></c:set>
								<c:set var="r3Valor" value="${fn:split(redondeo3.valorDefecto, '-')[2]}"></c:set>
							</c:if>
							<c:if test="${redondeo3.valor != null}">
								<c:set var="r3Desde" value="${fn:split(redondeo3.valor, '-')[0]}"></c:set>
								<c:set var="r3Hasta" value="${fn:split(redondeo3.valor, '-')[1]}"></c:set>
								<c:set var="r3Valor" value="${fn:split(redondeo3.valor, '-')[2]}"></c:set>
							</c:if>
							<td><c:out value="${redondeo3.descripcion}"/>:</td>
				            <td>
				            	<cmz:campoTexto id="r3Desde" valor="${r3Desde}" 
				            		anchura="30px" longitudMaxima="2" requerido="true"
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>			            
				            <td>
				            	<cmz:campoTexto id="r3Hasta" valor="${r3Hasta}" 
				            		anchura="30px" longitudMaxima="2" requerido="true"
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>
				            <td>
				            	<cmz:campoTexto id="r3Valor" valor="${r3Valor}" 
				            		anchura="30px" longitudMaxima="2" requerido="true"
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>
						</tr>
					</table>
				</cmz:cuerpoPanel>
			</cmz:panel>  
			<cmz:panel>
				<cmz:cabeceraPanel titulo="Sincronizador tiendas"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
					<table cellpadding="2px" cellspacing="2px" border="0px">
						<tr>
							<td>
								<c:set var="arranqueAuto" value="${variables[5]}"></c:set>
								<c:set var="arranqueAutoValor" value="${arranqueAuto.valor == null ? arranqueAuto.valorDefecto : arranqueAuto.valor}"></c:set>								
		                      	<input type="checkbox" value="" id="arranqueAuto" name="arranqueAuto" 
		                      		<c:if test="${arranqueAutoValor == 'S'}">checked="checked"</c:if> 
		                          	<c:if test="${!formularioVariables.editable}">disabled</c:if>/>
		                      	<c:out value="${arranqueAuto.descripcion}"/>
		                    </td>
		                </tr>
		                <tr>
		                    <c:set var="maxTrabajos" value="${variables[6]}"></c:set>
							<td><c:out value="${maxTrabajos.descripcion}"/>:</td>
				            <td>
				            	<cmz:campoTexto id="maxTrabajos" 
				            		valor="${maxTrabajos.valor == null ? maxTrabajos.valorDefecto : maxTrabajos.valor}" 
				            		anchura="30px" longitudMaxima="2" 
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>
						</tr>
					</table>
				</cmz:cuerpoPanel>
			</cmz:panel>          
			<cmz:panel>
				<cmz:cabeceraPanel titulo="Tickets"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
					<table cellpadding="2px" cellspacing="2px" border="0px">
						<tr>
							<td colspan="2">
								<c:set var="ticketsAutomatico" value="${variables[7]}"></c:set>
								<c:set var="ticketsAutomaticoValor" value="${ticketsAutomatico.valor == null ? ticketsAutomatico.valorDefecto : ticketsAutomatico.valor}"></c:set>								
		                      	<input type="checkbox" value="" id="ticketsAutomatico" name="ticketsAutomatico" 
		                      		<c:if test="${ticketsAutomaticoValor == 'S'}">checked="checked"</c:if> 
		                          	<c:if test="${!formularioVariables.editable}">disabled</c:if>/>
		                      	<c:out value="${ticketsAutomatico.descripcion}"/>
		                    </td>
		                </tr>
		                <tr>
		                    <c:set var="ticketsTiempo" value="${variables[8]}"></c:set>
							<td><c:out value="${ticketsTiempo.descripcion}"/>:</td>
				            <td>
				            	<cmz:campoTexto id="ticketsTiempo" 
				            		valor="${ticketsTiempo.valor == null ? ticketsTiempo.valorDefecto : ticketsTiempo.valor}" 
				            		anchura="50px" longitudMaxima="5" 
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>
						</tr>
						<tr>
							<td colspan="2">
								<c:set var="ticketsUsa" value="${variables[9]}"></c:set>
								<c:set var="ticketsUsaValor" value="${ticketsUsa.valor == null ? ticketsUsa.valorDefecto : ticketsUsa.valor}"></c:set>								
		                      	<input type="checkbox" value="" id="ticketsUsa" name="ticketsUsa" 
		                      		<c:if test="${ticketsUsaValor == 'S'}">checked="checked"</c:if> 
		                          	<c:if test="${!formularioVariables.editable}">disabled</c:if>/>
		                      	<c:out value="${ticketsUsa.descripcion}"/>
		                    </td>
		                </tr>
					</table>
				</cmz:cuerpoPanel>
			</cmz:panel>   
			<cmz:panel>
				<cmz:cabeceraPanel titulo="Conexión"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
					<table cellpadding="2px" cellspacing="2px" border="0px">
						<tr>
							<c:set var="webservice" value="${variables[10]}"></c:set>
							<td><c:out value="${webservice.descripcion}"/>:</td>
				            <td>
				            	<cmz:campoTexto id="webservice" 
				            		valor="${webservice.valor == null ? webservice.valorDefecto : webservice.valor}" 
				            		anchura="400px" longitudMaxima="255" 
				            		editable="${formularioVariables.editable}" 
				            		soloLectura="${!formularioVariables.editable}"/>
				            </td>
				            <c:if test="${formularioVariables.editable}">
				            <td><cmz:boton id="btnTest" valor="Test" onclick="testear();"></cmz:boton></td>
				            </c:if>
						</tr>
					</table>
				</cmz:cuerpoPanel>
			</cmz:panel>       
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
