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

<cmz:panel>
	<cmz:cabeceraPanel titulo="Líneas"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Concepto"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Referencia"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Fecha"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Articulo"></cmz:itemCabeceraLista>
				<c:if test="${!empty formularioFacturaVenta.tituloDesglose1}">
				<cmz:itemCabeceraLista nombre="${formularioFacturaVenta.tituloDesglose1}"></cmz:itemCabeceraLista>
				</c:if>
				<c:if test="${!empty formularioFacturaVenta.tituloDesglose2}">
				<cmz:itemCabeceraLista nombre="${formularioFacturaVenta.tituloDesglose2}"></cmz:itemCabeceraLista>
				</c:if>
				<cmz:itemCabeceraLista nombre="Unidad Medida" estilo="text-align: center;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Cantidad" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Unidades" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Precio" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Importe" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Tipo imp."></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoListaIndexada variable="detalle" lista="${formularioFacturaVenta.formularioPestañaActiva.registros}">
				<cmz:itemContenidoLista valor="${detalle.concepto}" onclick="verRegistroPestaña(${indice})"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${detalle.referencia}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${detalle.fecha}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${detalle.desArticulo}"></cmz:itemContenidoLista>
				<c:if test="${!empty formularioFacturaVenta.tituloDesglose1}">
				<cmz:itemContenidoLista valor="${detalle.desglose1}"></cmz:itemContenidoLista>
				</c:if>
				<c:if test="${!empty formularioFacturaVenta.tituloDesglose2}">
				<cmz:itemContenidoLista valor="${detalle.desglose2}"></cmz:itemContenidoLista>
				</c:if>	
				<cmz:itemContenidoLista valor="${detalle.desUnidadMedida}" alineacion="center"></cmz:itemContenidoLista>
				<c:choose>
		            <c:when test="${!empty detalle.unidadMedida}">
		              <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${detalle.cantidadMedida}"/></cmz:itemContenidoLista>
		            </c:when>
		            <c:otherwise>
		              <cmz:itemContenidoLista alineacion="right">&nbsp;</cmz:itemContenidoLista>
		            </c:otherwise>
		        </c:choose>
		        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${detalle.cantidad}"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${detalle.precio}" numDecimales="2"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${detalle.importe}" numDecimales="2"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${detalle.desImpuesto}"></cmz:itemContenidoLista>			
				<cmz:acciones alineacion="center">
					<cmz:accion onclick="verRegistroPestaña(${indice})" icono="comun/images/iconos/ver.gif" descripcion="Ver Línea"></cmz:accion>
				</cmz:acciones>
			</cmz:contenidoListaIndexada>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>
