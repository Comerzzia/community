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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="tienda" value="${formularioTienda.registroActivo}" />

<script type="text/javascript">
	function nuevaTarifa(){
		document.getElementById("accion").value = "leerFormulario";
		document.getElementById("operacion").value = "nuevoRegistroPestaña";
		document.getElementById("frmDatos").submit();
		_esperando();
	}

	function forzarEnvioTarifas(){
		if(confirm("¿Está seguro que desea forzar el envío de tarifas completo?")){
			document.getElementById("accion").value = "leerFormulario";
			document.getElementById("operacion").value = "forzarEnvioTarifa";
			document.getElementById("frmDatos").submit();
			_esperando();
		}
	}
</script>
		
<cmz:panel>
	<cmz:cabeceraPanel titulo="Tarifas">
		<cmz:acciones>
			<c:if test="${formularioTienda.editable}">
				<c:if test="${!empty requestScope.lstTarifasDisponibles}">
					<cmz:accion onclick="nuevaTarifa();" descripcion="Añadir nueva tarifa" icono="general/tiendas/mantenimiento/images/anadirTarifa.gif"></cmz:accion>
				</c:if>
			</c:if>
	</cmz:acciones>
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Tarifa" columna="1"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Descripción" columna="2"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Versión activa" columna="3"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Fecha" columna="4"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Versión revisada" columna="5"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Fecha" columna="6"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoLista variable="tarifa" lista="${formularioTienda.formularioPestañaActiva.registros}">
				<cmz:itemContenidoLista valor="${tarifa.codTarifa}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${tarifa.desTarifa}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${tarifa.versionTarifa}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${tarifa.fechaVersionTarifa}" /></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${tarifa.versionTarifaRevisada}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${tarifa.fechaVersionTarifaRevisada}" /></cmz:itemContenidoLista>
				<cmz:acciones alineacion="center">
					<c:if test="${formularioTienda.editable}">
						<cmz:accion onclick="eliminarRegistroPestaña(${indice})" icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar tarifa"></cmz:accion>
						<c:if test="${tarifa.versionTarifa != 0}">
							<cmz:accion onclick="forzarEnvioTarifas();" icono="comun/images/iconos/invertir.png" descripcion="Forzar envío de tarifas completo"></cmz:accion>
						</c:if>
					</c:if>
				</cmz:acciones>
			</cmz:contenidoLista>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>
