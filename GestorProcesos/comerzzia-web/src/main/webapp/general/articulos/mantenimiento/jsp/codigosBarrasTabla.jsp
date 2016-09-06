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

<c:set var="articulo" value="${formularioArticulo.registroActivo}" />

<cmz:panel>
	<cmz:cabeceraPanel titulo="Códigos de Barras">
		<cmz:acciones>
			<c:if test="${formularioArticulo.editable}">
				<cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir nuevo código"/>
			</c:if>
		</cmz:acciones>
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Código de Barras" columna="1" ordenColumna="CODIGO_BARRAS"></cmz:itemCabeceraLista>
				<c:if test="${!empty formularioArticulo.tituloDesglose1}">
          			<cmz:itemCabeceraLista nombre="${formularioArticulo.tituloDesglose1}" columna="2" ordenColumna="DESGLOSE1"></cmz:itemCabeceraLista>
        		</c:if>
				<c:if test="${!empty formularioArticulo.tituloDesglose2}">
          			<cmz:itemCabeceraLista nombre="${formularioArticulo.tituloDesglose2}" columna="3" ordenColumna="DESGLOSE2"></cmz:itemCabeceraLista>
        		</c:if>
				<cmz:itemCabeceraLista nombre="DUN14" columna="4" ordenColumna="DUN14"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Factor conversión" columna="5" ordenColumna="FACTOR_CONVERSION" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoListaIndexada variable="codigo" lista="${formularioArticulo.formularioPestañaActiva.registros}">
				<cmz:itemContenidoLista valor="${codigo.codigoBarras}" onclick="verRegistroPestaña(${indice})"></cmz:itemContenidoLista>
				<c:if test="${!empty formularioArticulo.tituloDesglose1}">
          			<cmz:itemContenidoLista valor="${codigo.desglose1}"></cmz:itemContenidoLista>
        		</c:if>
        		<c:if test="${!empty formularioArticulo.tituloDesglose2}">
          			<cmz:itemContenidoLista valor="${codigo.desglose2}"></cmz:itemContenidoLista>
        		</c:if>
				<c:choose>
					<c:when test="${codigo.dun14}">
						<cmz:itemContenidoLista valor="Si"></cmz:itemContenidoLista>
					</c:when>
					<c:otherwise>
						<cmz:itemContenidoLista valor="No"></cmz:itemContenidoLista>
					</c:otherwise>
				</c:choose>
				<c:set var="factorConversion"><cmz:formateaNumero valor="${codigo.factorConversion}"/></c:set>
				<cmz:itemContenidoLista valor="${factorConversion}" alineacion="right"></cmz:itemContenidoLista>
				<cmz:acciones alineacion="center">
					<cmz:accion onclick="verRegistroPestaña(${indice})" icono="comun/images/iconos/ver.gif" descripcion="Ver código de barras"></cmz:accion>
					<c:if test="${formularioArticulo.editable}">
						<cmz:accion onclick="editarRegistroPestaña(${indice})" icono="comun/images/iconos/editar.gif" descripcion="Editar código de barras"></cmz:accion>
						<cmz:accion onclick="eliminarRegistroPestaña(${indice})" icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar código de barras"></cmz:accion>
					</c:if>
				</cmz:acciones>
			</cmz:contenidoListaIndexada>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>
