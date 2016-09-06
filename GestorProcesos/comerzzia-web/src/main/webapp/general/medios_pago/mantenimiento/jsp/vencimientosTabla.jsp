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

<cmz:panel>
	<cmz:cabeceraPanel titulo="Vencimientos">
		<cmz:acciones>
			<c:if test="${formularioMedioPago.editable}">
				<cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir nuevo vencimiento"/>
			</c:if>
		</cmz:acciones>
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Descripción" columna="1"/>
                <cmz:itemCabeceraLista nombre="Nº Vencimientos" columna="2"/>
                <cmz:itemCabeceraLista nombre="Días de cadencia" columna="3"/>
                <cmz:itemCabeceraLista nombre="Días entre vencimientos" columna="4"/>
                <cmz:itemCabeceraLista nombre="Días Naturales" columna="5"/>
				<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"/>
			</cmz:cabeceraLista>
			<cmz:contenidoListaIndexada variable="vencimiento" lista="${formularioMedioPago.formularioPestañaActiva.registros}">
				<cmz:itemContenidoLista valor="${vencimiento.desVencimiento}" onclick="verRegistroPestaña(${indice})"></cmz:itemContenidoLista>
                <cmz:itemContenidoLista valor="${vencimiento.numeroVencimientos}"></cmz:itemContenidoLista>
                <cmz:itemContenidoLista valor="${vencimiento.diasCadencia}"></cmz:itemContenidoLista>
                <cmz:itemContenidoLista valor="${vencimiento.diasEntreVencimientos}"></cmz:itemContenidoLista>
                <cmz:itemContenidoLista valor="${vencimiento.diasNaturales}"></cmz:itemContenidoLista>
				<cmz:acciones alineacion="center">
					<cmz:accion icono="comun/images/iconos/ver.gif"
						onclick="verRegistroPestaña(${indice})" descripcion="Ver vencimiento"></cmz:accion>
					<c:if test="${formularioMedioPago.editable}">
						<cmz:accion icono="comun/images/iconos/editar.gif" onclick="editarRegistroPestaña(${indice})"
							descripcion="Editar vencimiento"></cmz:accion>
						<cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminarRegistroPestaña(${indice})"
							descripcion="Eliminar vencimiento"></cmz:accion>
					</c:if>
				</cmz:acciones>
			</cmz:contenidoListaIndexada>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>
