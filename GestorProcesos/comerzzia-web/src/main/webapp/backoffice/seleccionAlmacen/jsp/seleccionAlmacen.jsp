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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Comerzzia</title>

<link rel="stylesheet" type="text/css" media="screen,projection,print"
	href="comun/css/comerzzia.css" />

<script type="text/javascript" language="javascript"
	src="comun/js/comun.js"></script>
<script type="text/javascript" language="javascript"
	src="comun/js/formulario.js"></script>
<script type="text/javascript" language="javascript"
	src="comun/js/validacion.js"></script>
<script type="text/javascript" language="javascript"
	src="comun/js/ayudas.js"></script>

<script type="text/javascript">
	function seleccionarAlmacen(codigo, descripcion){
			document.getElementById("accion").value = "seleccionarAlmacen";
			document.getElementById("codAlmacenSeleccionado").value = codigo;
			document.getElementById("desAlmacenSeleccionado").value = descripcion;
			document.getElementById("frmDatos").submit();
			_esperando();
	}
</script>
</head>

<body>
<cmz:main>
	<cmz:panelCMZ>
		<cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}"
			icono="${permisos.accionMenu.icono}">
		</cmz:cabeceraPanelCMZ>

		<cmz:cuerpoPanelCMZ>
			<cmz:mensaje />
			<form id="frmDatos" name="frmDatos" action="seleccionAlmacen"
				method="post"><input id="accion" name="accion" type="hidden"
				value="" /><input id="codAlmacenSeleccionado"
				name="codAlmacenSeleccionado" type="hidden" value="" /><input id="desAlmacenSeleccionado"
				name="desAlmacenSeleccionado" type="hidden" value="" /> <cmz:panel>
				<cmz:cabeceraPanel titulo="Almacenes del Usuario"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
					<cmz:lista>
						<cmz:cabeceraLista>
							<cmz:itemCabeceraLista nombre="Código" columna="1"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Descripción" columna="2"></cmz:itemCabeceraLista>
						</cmz:cabeceraLista>
						<cmz:contenidoLista lista="${listaAlmacenesUsuario}" variable="almacen">
							<cmz:itemContenidoLista valor="${almacen.codAlmacen}"
								onclick="seleccionarAlmacen('${almacen.codAlmacen}', '${almacen.desAlmacen}')"></cmz:itemContenidoLista>
							<cmz:itemContenidoLista valor="${almacen.desAlmacen}"></cmz:itemContenidoLista>
						</cmz:contenidoLista>
					</cmz:lista>
				</cmz:cuerpoPanel>
			</cmz:panel></form>
		</cmz:cuerpoPanelCMZ>
	</cmz:panelCMZ>
</cmz:main>
</body>
</html>
