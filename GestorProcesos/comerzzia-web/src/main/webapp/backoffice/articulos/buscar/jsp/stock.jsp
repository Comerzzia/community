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

<c:set var="articulo" value="${formularioConsultaArticulos.registroActivo}" />

<cmz:lista>
	<cmz:cabeceraLista>
		<cmz:itemCabeceraLista nombre="Código" columna="1"></cmz:itemCabeceraLista>
		<cmz:itemCabeceraLista nombre="Almacen" columna="2"></cmz:itemCabeceraLista>
        <c:if test="${!empty formularioConsultaArticulos.tituloDesglose1}">
          <cmz:itemCabeceraLista nombre="${formularioConsultaArticulos.tituloDesglose1}" columna="3"></cmz:itemCabeceraLista>
        </c:if>
        <c:if test="${!empty formularioConsultaArticulos.tituloDesglose2}">
          <cmz:itemCabeceraLista nombre="${formularioConsultaArticulos.tituloDesglose2}" columna="4"></cmz:itemCabeceraLista>
        </c:if>
		<cmz:itemCabeceraLista nombre="Stock" columna="5" estilo="text-align: right;"></cmz:itemCabeceraLista>
		<cmz:itemCabeceraLista nombre="Stock pendiente recibir" columna="6" estilo="text-align: right;"></cmz:itemCabeceraLista>
	</cmz:cabeceraLista>
	<cmz:contenidoLista variable="almacen"	lista="${articulo.almacenes}">
		<cmz:itemContenidoLista valor="${almacen.codAlm}"></cmz:itemContenidoLista>
		<cmz:itemContenidoLista valor="${almacen.desAlm}"></cmz:itemContenidoLista>
        <c:if test="${!empty formularioConsultaArticulos.tituloDesglose1}">
          <cmz:itemContenidoLista valor="${almacen.desglose1}"></cmz:itemContenidoLista>
        </c:if>
        <c:if test="${!empty formularioConsultaArticulos.tituloDesglose2}">
          <cmz:itemContenidoLista valor="${almacen.desglose2}"></cmz:itemContenidoLista>
        </c:if>
		<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${almacen.stock}"/></cmz:itemContenidoLista>
		<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${almacen.stockPendRecibir}"/></cmz:itemContenidoLista>
	</cmz:contenidoLista>
</cmz:lista>
