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

<jsp:useBean id="actualizacionAsistente" type="com.comerzzia.persistencia.ventas.tarifas.ParametrosAsistenteTarifaBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

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
			document.getElementById("accion").value = "asistenteInsercion";
			document.getElementById("operacion").value = "siguiente";
			document.getElementById("frmDatos").submit();
			_esperando();
		}
	}

	function atras() {
		document.getElementById("accion").value = "asistenteInsercion";
		document.getElementById("operacion").value = "anterior";
		document.getElementById("frmDatos").submit();
		_esperando();
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
			<input id="operacion" name="operacion" type="hidden" value="" /> 
			<input id="accion" name="accion" type="hidden" value="" /> 
			<input id="paso" name="paso" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${actualizacionAsistente.idActualizacion}" />
            
			<cmz:panel>
				<cmz:cabeceraPanel titulo="Criterio de Actualización"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
					<table cellpadding="2px" cellspacing="2px" border="0px" class="insercionMasiva">
						<tr>
							<td>
								<input id="criterioAct1" type="radio" name="criterio" value="insertarActualizar"
								<c:if test="${actualizacionAsistente.operacionInsertarActualizar || actualizacionAsistente.criterio == null}">checked="checked"</c:if>>
								Insertar artículos nuevos y actualizar los existentes
							</td>
						</tr>
						<tr>
							<td>
								<input id="criterioAct2" type="radio" name="criterio" value="insertarSolo"
									<c:if test="${actualizacionAsistente.operacionInsertarSolo}">checked="checked"</c:if>>
								Insertar artículos nuevos
							</td>
						</tr>
						<tr><td height="100px"></td></tr><!-- SEPARADOR -->
					</table>
					<div class="botonesAsistente">
						<cmz:boton onclick="atras();" valor="&lt;&lt; Atras" id="btnAtras" />
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
