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

<c:set var="paramBuscarArticulosPromociones" value="${formularioPromocion.formularioPestañaActiva.param}" />
<c:set var="promocion" value="${formularioPromocion.registroActivo}" />

<cmz:panel>
	<cmz:cabeceraPanel titulo="Búsqueda"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table cellpadding="2px" cellspacing="2px" border="0px">
			<tr>
				<td>Descripción:</td>
				<td><cmz:campoTexto id="descripcionArt"
					valor="${paramBuscarArticulosPromociones.descripcion}"
					anchura="300px" longitudMaxima="45" /></td>
				<td><cmz:botonConsultar onclick="consultarArticulos();"/></td>
			</tr>
			<tr>
				<td>Artículo:</td>
				<td><cmz:ayuda nombreAyuda="ARTICULOS">
					<cmz:codigoAyuda idCodigo="codArtBus"
						valorCodigo="${paramBuscarArticulosPromociones.codArt}"
						anchuraCodigo="100px" longitudMaximaCodigo="13"></cmz:codigoAyuda>
					<cmz:descripcionAyuda idDescripcion="desArtBus"
						valorDescripcion="${paramBuscarArticulosPromociones.desArt}"
						anchuraDescripcion="320px"></cmz:descripcionAyuda>
				</cmz:ayuda></td>
			</tr>
			<tr>
				<td>Familia:</td>
				<td><cmz:ayuda nombreAyuda="FAMILIAS">
					<cmz:codigoAyuda idCodigo="codFam"
						valorCodigo="${paramBuscarArticulosPromociones.codFam}"
						anchuraCodigo="100px" longitudMaximaCodigo="6"></cmz:codigoAyuda>
					<cmz:descripcionAyuda idDescripcion="desFam"
						valorDescripcion="${paramBuscarArticulosPromociones.desFam}"
						anchuraDescripcion="320px"></cmz:descripcionAyuda>
				</cmz:ayuda></td>
			</tr>
			<tr>
				<td>Proveedor:</td>
				<td><cmz:ayuda nombreAyuda="PROVEEDORES">
					<cmz:codigoAyuda idCodigo="codPro"
						valorCodigo="${paramBuscarArticulosPromociones.codPro}"
						anchuraCodigo="100px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
					<cmz:descripcionAyuda idDescripcion="desPro"
						valorDescripcion="${paramBuscarArticulosPromociones.desPro}"
						anchuraDescripcion="320px"></cmz:descripcionAyuda>
				</cmz:ayuda></td>
			</tr>
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Resultado">
		<cmz:acciones>
			<c:if test="${formularioPromocion.editable}">
				<cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir nuevo artículo"/>
			</c:if>
		</cmz:acciones>
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Artículo" columna="1"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Descripción" columna="2"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Precio tarifa" columna="3" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Precio promoción" columna="4" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Precio total" columna="5" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Puntos" columna="6" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoLista variable="articulo" lista="${formularioPromocion.formularioPestañaActiva.registros}">
				<cmz:itemContenidoLista valor="${articulo.codArt}" onclick="verRegistroPestaña(${indice});"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${articulo.desArt}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.precioTarifa}" numDecimales="4"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.precioVenta}" numDecimales="4"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.precioTotal}" numDecimales="2"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${articulo.puntos}" alineacion="right"></cmz:itemContenidoLista>
				<cmz:acciones alineacion="center">
					<cmz:accion icono="comun/images/iconos/ver.gif"
						onclick="verRegistroPestaña(${indice});" descripcion="Ver articulo"></cmz:accion>
					<c:if test="${permisos.puedeEditar && formularioPromocion.editable}">
						<cmz:accion icono="comun/images/iconos/editar.gif" onclick="editarRegistroPestaña(${indice})" descripcion="Editar articulo"></cmz:accion>
					</c:if>
					<c:if test="${permisos.puedeEliminar && formularioPromocion.editable && !promocion.activa}">
						<cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminarRegistroPestaña(${indice})" descripcion="Eliminar articulo"></cmz:accion>
					</c:if>
				</cmz:acciones>
			</cmz:contenidoLista>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>
