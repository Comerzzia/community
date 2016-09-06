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

<c:set var="articulo" value="${formularioArticulo.registroActivo}" />

<link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />

<script type="text/javascript">
	function uploadFoto() {
		if(document.getElementById("foto").value == ''){
			alert("Debes insertar una foto.");
		}else{
	        document.frmDatos.submit();
		}
	}
 </script>

<form id="frmDatos" name="frmDatos" action="articulos" method="post"
	enctype="multipart/form-data" target="_parent"><input id="accion" name="accion"
	type="hidden" value="crearFoto" />  <input id="idObjeto" name="idObjeto"
	type="hidden" value="${articulo.codArticulo}" />


<table cellpadding="2px" cellspacing="2px" border="0px" width="100%">
	<tr>
		<td>Imagen:</td>
		<td width="300"><input type="file" id="foto" name="foto"
			style="width: 450px"></td>
		<td>Tipo de imagen:</td>
		<td width="150px"><select id="tipoFoto" name="tipoFoto"
			class="campo">
			<option value="P">Pequeña</option>
			<option value="M">Mediana</option>
			<option value="G">Grande</option>
		</select></td>
		<td><cmz:boton onclick="uploadFoto();" valor="Añadir / Cambiar"
			id="btnUpload" /></td>
	</tr>
</table>

</form>
