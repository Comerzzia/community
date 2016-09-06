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
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="actualizacionAsistente"
	type="com.comerzzia.persistencia.ventas.tarifas.ParametrosAsistenteTarifaBean"
	scope="session" />
<jsp:useBean id="permisos"
	class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean"
	scope="request" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Comerzzia</title>

<link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />

<script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
<script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
<script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>

<script type="text/javascript">
	function isCheckTarifaGeneral(){
		var origen = document.frmDatos.origen;
		for (var i=0;i < origen.length;i++) {
			if (origen[i].checked){
				var valor = origen[i].value;
			}	
		}
		return (valor == 'general');
	}

	function checkTarifa() {
		if (isCheckTarifaGeneral()) {
			document.getElementById("ayuda").style.display = "none";
		} 
		else {
			document.getElementById("ayuda").style.display = "";
		}
	}

	function checkForm() {
		var actual = document.getElementById("codTarActual").value; 
		if (!isCheckTarifaGeneral()) {
			if(!esValido("codTarOrigen", "AYUDA", true, "desTar", "TARIFAS")){
				return false;
			}
		} 
		return true;
	}

	function siguiente() {
		if (checkForm()) {
			document.getElementById("accion").value = "asistenteInsercion";
			document.getElementById("operacion").value = "siguiente";
			document.getElementById("frmDatos").submit();
			_esperando();
		}
	}

	function volver(){
		document.getElementById("accion").value = "ver";
	    document.getElementById("frmDatos").submit();
		_esperando();
	}
</script>
</head>

<body onkeydown="keyDown(event);">
<cmz:main>
	<cmz:panelCMZ>
		<cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
			<cmz:acciones numAccionesVisibles="1">
				<cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver" />
			</cmz:acciones>
		</cmz:cabeceraPanelCMZ>

		<cmz:cuerpoPanelCMZ>
			<cmz:mensaje />
			<form id="frmDatos" name="frmDatos" action="actualizacionesTarifas" method="post">
			<input id="accion" name="accion" type="hidden" value="" /> 
			<input id="operacion" name="operacion" type="hidden" value="" /> 
			<input id="codTarActual" name="codTarActual" type="hidden" value="${actualizacionAsistente.codTarActual}" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${actualizacionAsistente.idActualizacion}" />
			<cmz:panel>
				<cmz:cabeceraPanel titulo="Origen de los Artículos"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
					<table cellpadding="2px" cellspacing="2px" border="0px" class="insercionMasiva">
						<c:set var="selecTarifaGeneral" value="${(actualizacionAsistente.tarifaOrigenGeneral || actualizacionAsistente.codTarOrigen==null) && !actualizacionAsistente.tarifaActualGeneral}" />
						<c:if test="${!actualizacionAsistente.tarifaActualGeneral}">
							<tr>
								<td>
									<input onclick="checkTarifa();" id="tarifaOrigen1" type="radio" name="origen" value="general"
										<c:if test="${selecTarifaGeneral}">checked="checked"</c:if>>
									Tarifa general
								</td>
							</tr>
						</c:if>
						<tr>
							<td>
								<input onclick="checkTarifa();" id="tarifaOrigen2" type="radio" name="origen" value="existente"
									<c:if test="${!selecTarifaGeneral}">checked="checked"</c:if>>
								Tarifa existente
							</td>
						<td>
						<table cellpadding="0"  cellspacing="0" style="position:relative;left:50px;top:2px">
						<tr id="ayuda" <c:if test="${selecTarifaGeneral}">style="display: none"</c:if>>
							<td align="right">Tarifa: </td>
							<td>
								<cmz:ayuda requerido="true" soloLectura="false" nombreAyuda="TARIFAS">
									<c:choose>
									  <c:when test="${!selecTarifaGeneral}">
										<cmz:codigoAyuda idCodigo="codTarOrigen" valorCodigo="${actualizacionAsistente.codTarOrigen}" 
											anchuraCodigo="100px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
									  </c:when>
									  <c:otherwise>
										<cmz:codigoAyuda idCodigo="codTarOrigen" valorCodigo="" 
											anchuraCodigo="100px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
									  </c:otherwise>
									</c:choose>
									<cmz:descripcionAyuda idDescripcion="desTar" valorDescripcion="${actualizacionAsistente.desTar}" 
											anchuraDescripcion="200px"></cmz:descripcionAyuda>
								</cmz:ayuda>
							</td>
						</tr>
						</table>
						</td>
						</tr>
						<tr><td height="100px"></td></tr><!-- SEPARADOR -->
						</table>
						<div class="botonesAsistente">
							<cmz:boton onclick="volver();" valor="&lt;&lt; Volver" id="btnAtras" />
							<cmz:boton onclick="siguiente();" valor="Siguiente &gt;&gt;" id="btnSiguiente" />
						</div>
				</cmz:cuerpoPanel>
			</cmz:panel>
			</form>
		</cmz:cuerpoPanelCMZ>
	</cmz:panelCMZ>
</cmz:main>
</body>
</html>
