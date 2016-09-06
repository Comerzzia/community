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

<jsp:useBean id="tarifaAsistente" type="com.comerzzia.persistencia.ventas.tarifas.ParametrosAsistenteTarifaBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Comerzzia</title>

<link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />

<script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
<script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>

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
			<form id="frmDatos" name="frmDatos" action="tarifas" method="post">
			<input id="accion" name="accion" type="hidden" value="" /> 
			<input id="operacion" name="operacion" type="hidden" value="" /> 
			<cmz:panel>
				<cmz:cabeceraPanel titulo="Selección de Artículos"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
							<table cellpadding="2px" cellspacing="2px" border="0px" class="insercionMasiva">
								<tr>
									<td>Desde artículo:</td>
									<td><cmz:ayuda requerido="false" soloLectura="false"
										nombreAyuda="ARTICULOS">
										<cmz:codigoAyuda idCodigo="codArtDesde"
											valorCodigo="${tarifaAsistente.codArtDesde}"
											anchuraCodigo="100px" longitudMaximaCodigo="13"></cmz:codigoAyuda>
										<cmz:descripcionAyuda idDescripcion="desArtDesde"
											valorDescripcion="${tarifaAsistente.desArtDesde}"
											anchuraDescripcion="280px"></cmz:descripcionAyuda>
									</cmz:ayuda></td>
								</tr>
								<tr>
									<td>Hasta artículo:</td>
									<td><cmz:ayuda requerido="false" soloLectura="false"
										nombreAyuda="ARTICULOS">
										<cmz:codigoAyuda idCodigo="codArtHasta"
											valorCodigo="${tarifaAsistente.codArtHasta}"
											anchuraCodigo="100px" longitudMaximaCodigo="13"></cmz:codigoAyuda>
										<cmz:descripcionAyuda idDescripcion="desArtHasta"
											valorDescripcion="${tarifaAsistente.desArtHasta}"
											anchuraDescripcion="280px"></cmz:descripcionAyuda>
									</cmz:ayuda></td>
								</tr>
								<tr>
									<td>Desde familia:</td>
									<td><cmz:ayuda requerido="false" soloLectura="false"
										nombreAyuda="FAMILIAS">
										<cmz:codigoAyuda idCodigo="codFamDesde"
											valorCodigo="${tarifaAsistente.codFamDesde}"
											anchuraCodigo="100px" longitudMaximaCodigo="6"></cmz:codigoAyuda>
										<cmz:descripcionAyuda idDescripcion="desFamDesde"
											valorDescripcion="${tarifaAsistente.desFamDesde}"
											anchuraDescripcion="200px"></cmz:descripcionAyuda>
									</cmz:ayuda></td>
								</tr>
								<tr>
									<td>Hasta familia:</td>
									<td><cmz:ayuda requerido="false" soloLectura="false"
										nombreAyuda="FAMILIAS">
										<cmz:codigoAyuda idCodigo="codFamHasta"
											valorCodigo="${tarifaAsistente.codFamHasta}"
											anchuraCodigo="100px" longitudMaximaCodigo="6"></cmz:codigoAyuda>
										<cmz:descripcionAyuda idDescripcion="desFamHasta"
											valorDescripcion="${tarifaAsistente.desFamHasta}"
											anchuraDescripcion="200px"></cmz:descripcionAyuda>
									</cmz:ayuda></td>
								</tr>
								<tr>
									<td>Desde proveedor:</td>
									<td><cmz:ayuda requerido="false" soloLectura="false"
										nombreAyuda="PROVEEDORES">
										<cmz:codigoAyuda idCodigo="codProDesde"
											valorCodigo="${tarifaAsistente.codProDesde}"
											anchuraCodigo="100px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
										<cmz:descripcionAyuda idDescripcion="desProDesde"
											valorDescripcion="${tarifaAsistente.desProDesde}"
											anchuraDescripcion="200px"></cmz:descripcionAyuda>
									</cmz:ayuda></td>
								</tr>
								<tr>
									<td>Hasta proveedor:</td>
									<td><cmz:ayuda requerido="false" soloLectura="false"
										nombreAyuda="PROVEEDORES">
										<cmz:codigoAyuda idCodigo="codProHasta"
											valorCodigo="${tarifaAsistente.codProHasta}"
											anchuraCodigo="100px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
										<cmz:descripcionAyuda idDescripcion="desProHasta"
											valorDescripcion="${tarifaAsistente.desProHasta}"
											anchuraDescripcion="200px"></cmz:descripcionAyuda>
									</cmz:ayuda></td>
								</tr>
								<tr><td height="10px"></td></tr><!-- SEPARADOR -->
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
