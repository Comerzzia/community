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

<c:set var="factura" value="${formularioConformacionFacturas.registroActivo}" />

<cmz:panel>
	<cmz:cabeceraPanel titulo="Pagos">
		<c:if test="${formularioConformacionFacturas.enInsercion}">
		<cmz:acciones>
			<cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir nuevo medio de pago"/> 
		</cmz:acciones>
		</c:if>
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Medio de pago"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Importe" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoListaIndexada variable="medioPago" lista="${formularioConformacionFacturas.formularioPestañaActiva.registros}">
				<cmz:itemContenidoLista valor="${medioPago.desMedioPagoVencimiento}" onclick="verRegistroPestaña(${indice})"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${medioPago.importe}" numDecimales="2"></cmz:formateaNumero></cmz:itemContenidoLista>
				<cmz:acciones alineacion="center">
					<cmz:accion icono="comun/images/iconos/ver.gif"
						onclick="verRegistroPestaña(${indice})" descripcion="Ver pago"></cmz:accion>
					<c:if test="${formularioConformacionFacturas.enInsercion}">
						<cmz:accion icono="comun/images/iconos/editar.gif" onclick="editarRegistroPestaña(${indice})"
							descripcion="Editar pago"></cmz:accion>
						<cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminarRegistroPestaña(${indice})"
							descripcion="Eliminar pago"></cmz:accion>
					</c:if>
				</cmz:acciones>
			</cmz:contenidoListaIndexada>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>
