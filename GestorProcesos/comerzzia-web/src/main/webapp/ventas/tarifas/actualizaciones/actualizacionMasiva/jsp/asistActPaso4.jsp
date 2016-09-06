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

<script type="text/javascript">
	function checkForm() {
		return true;
	}

	function siguiente() {
		if (checkForm()) {
			document.getElementById("accion").value = "asistenteActualizacion";
			document.getElementById("operacion").value = "siguiente";
			document.getElementById("btnAtras").disabled = true;
			document.getElementById("btnSiguiente").disabled = true;
			document.getElementById("frmDatos").submit();
			_esperando();
		}
	}

	function atras() {
		document.getElementById("accion").value = "asistenteActualizacion";
		document.getElementById("operacion").value = "anterior";
		document.getElementById("frmDatos").submit();
		_esperando();
	}

	function volver(){
		document.getElementById("accion").value = "leerFormulario";
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
			<cmz:panel>
				<cmz:cabeceraPanel titulo="Resumen de la Operación de Actualización de Artículos para la Actualización ${actualizacionAsistente.idActualizacion}"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
							<table cellpadding="2px" cellspacing="2px" border="0px" class="actualizacionMasiva">
								<tr>
									<td><cmz:campoAreaTexto id="resumen"
										valor="${actualizacionAsistente.resumenActualizacionMasiva}" requerido="false"
										altura="120" anchura="600" editable="false" soloLectura="true" /></td>
								</tr>
								<tr><td height="10px"></td></tr><!-- SEPARADOR -->
							</table>
							<div class="botonesAsistente">
								<cmz:boton onclick="atras();" valor="&lt;&lt; Atras" id="btnAtras" />
								<cmz:boton onclick="siguiente();" valor="Finalizar &gt;&gt;" id="btnSiguiente" />
							</div>
				</cmz:cuerpoPanel>
			</cmz:panel>
			</form>
		</cmz:cuerpoPanelCMZ>
	</cmz:panelCMZ>
</cmz:main>
</body>
</html>
