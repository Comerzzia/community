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

<c:set var="paramBuscarArticulos" value="${formularioConsultaArticulos.param}" />

<cmz:panel>
	<cmz:cabeceraPanel titulo="Filtro"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table cellpadding="2px" cellspacing="2px" border="0px">
			<tr>
				<td>Artículo:</td>
				<td><cmz:campoTexto id="codArt"
					valor="${paramBuscarArticulos.codArticulo}" anchura="100px"
					longitudMaxima="13" /></td>
				<td><cmz:campoTexto id="desArt"
					valor="${paramBuscarArticulos.desArticulo}" anchura="300px"
					longitudMaxima="45" /></td>
				<td>Activo:</td>
				<td width="150px"><select id="activo" name="activo"
					class="campo">
					<option value=""
						<c:if test="${paramBuscarArticulos.activo == ''}">selected="selected"</c:if>>Todos</option>
					<option value="S"
						<c:if test="${paramBuscarArticulos.activo == 'S'}">selected="selected"</c:if>>Activos</option>
					<option value="N"
						<c:if test="${paramBuscarArticulos.activo == 'N'}">selected="selected"</c:if>>Inactivos</option>
				</select></td>
				<td><cmz:botonConsultar onclick="consultar();"/></td>
			</tr>
			<tr>
				<td>Familia:</td>
				<td colspan="3"><cmz:ayuda nombreAyuda="FAMILIAS">
					<cmz:codigoAyuda idCodigo="codFam"
						valorCodigo="${paramBuscarArticulos.codFamilia}"
						anchuraCodigo="100px" longitudMaximaCodigo="6"></cmz:codigoAyuda>
					<cmz:descripcionAyuda idDescripcion="desFam"
						valorDescripcion="${paramBuscarArticulos.desFamilia}"
						anchuraDescripcion="320px"></cmz:descripcionAyuda>
				</cmz:ayuda></td>
			</tr>
			<tr>
				<td>Proveedor:</td>
				<td colspan="3"><cmz:ayuda nombreAyuda="PROVEEDORES">
					<cmz:codigoAyuda idCodigo="codPro"
						valorCodigo="${paramBuscarArticulos.codProveedor}"
						anchuraCodigo="100px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
					<cmz:descripcionAyuda idDescripcion="desPro"
						valorDescripcion="${paramBuscarArticulos.desProveedor}"
						anchuraDescripcion="320px"></cmz:descripcionAyuda>
				</cmz:ayuda></td>
			</tr>
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>

<c:choose>
	<c:when test="${formularioConsultaArticulos.registros != null}">
		<cmz:panel>
			<cmz:cabeceraPanelResultados numPorPagina="${paramBuscarArticulos.tamañoPagina}"></cmz:cabeceraPanelResultados>
			<cmz:cuerpoPanel>
				<cmz:lista>
					<cmz:cabeceraLista>
						<cmz:itemCabeceraLista nombre="Código" columna="1"></cmz:itemCabeceraLista>
						<cmz:itemCabeceraLista nombre="Descripción" columna="2"></cmz:itemCabeceraLista>
						<cmz:itemCabeceraLista nombre="Familia" columna="3"></cmz:itemCabeceraLista>
						<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
					</cmz:cabeceraLista>
					<cmz:contenidoListaIndexada variable="articulo" lista="${formularioConsultaArticulos.registros}" accion="verRegistroFormulario(0);">
						<cmz:itemContenidoLista valor="${articulo.codArticulo}" onclick="verRegistroFormulario(${indice});"></cmz:itemContenidoLista>
						<cmz:itemContenidoLista valor="${articulo.desArticulo}"></cmz:itemContenidoLista>
						<cmz:itemContenidoLista valor="${articulo.desFamilia}"></cmz:itemContenidoLista>
						<cmz:acciones alineacion="center">
							<cmz:accion icono="comun/images/iconos/ver.gif"
								onclick="verRegistroFormulario(${indice});" descripcion="Ver artículo"></cmz:accion>
						</cmz:acciones>
					</cmz:contenidoListaIndexada>
				</cmz:lista>
			</cmz:cuerpoPanel>
		</cmz:panel>
	</c:when>
</c:choose>
