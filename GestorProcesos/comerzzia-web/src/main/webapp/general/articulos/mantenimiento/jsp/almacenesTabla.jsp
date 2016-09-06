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


<script type="text/javascript">
    function checkFormPestaña() {
        
        return true;
    }
 </script>
 
<cmz:panel>
	<cmz:cabeceraPanel titulo="Almacenes">
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Código" columna="1" ordenColumna="CODALM"></cmz:itemCabeceraLista>
				<c:if test="${!empty formularioArticulo.tituloDesglose1}">
          			<cmz:itemCabeceraLista nombre="${formularioArticulo.tituloDesglose1}" columna="2" ordenColumna="DESGLOSE1"></cmz:itemCabeceraLista>
        		</c:if>
				<c:if test="${!empty formularioArticulo.tituloDesglose2}">
          			<cmz:itemCabeceraLista nombre="${formularioArticulo.tituloDesglose2}" columna="3" ordenColumna="DESGLOSE2"></cmz:itemCabeceraLista>
        		</c:if>
				<cmz:itemCabeceraLista nombre="Stock" columna="4" ordenColumna="STOCK" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Stock Unidad Medida Alt." columna="5" ordenColumna="STOCK_UMA_ALTERNATIVA" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Stock Mínimo" columna="6" ordenColumna="STOCK_MINIMO" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Stock Máximo" columna="7" ordenColumna="STOCK_MAXIMO" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Stock Pte. Recibir" columna="8" ordenColumna="STOCK_PENDIENTE_RECIBIR" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Stock Pte. Servir" columna="9" ordenColumna="STOCK_PENDIENTE_SERVIR" estilo="text-align: right;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoListaIndexada variable="almacen" lista="${formularioArticulo.formularioPestañaActiva.registros}">
				<cmz:itemContenidoLista valor="${almacen.codAlm}" onclick="verRegistroPestaña(${indice})"></cmz:itemContenidoLista>
				<c:if test="${!empty formularioArticulo.tituloDesglose1}">
          			<cmz:itemContenidoLista valor="${almacen.desglose1}"></cmz:itemContenidoLista>
        		</c:if>
        		<c:if test="${!empty formularioArticulo.tituloDesglose2}">
          			<cmz:itemContenidoLista valor="${almacen.desglose2}"></cmz:itemContenidoLista>
        		</c:if>
				<c:set var="stock"><cmz:formateaNumero valor="${almacen.stock}"/></c:set>
				<cmz:itemContenidoLista valor="${stock}" alineacion="right"></cmz:itemContenidoLista>
				<c:set var="stockUMA"><cmz:formateaNumero valor="${almacen.stockUMA}"/></c:set>
				<cmz:itemContenidoLista valor="${stockUMA}" alineacion="right"></cmz:itemContenidoLista>
				<c:set var="stockMinimo"><cmz:formateaNumero valor="${almacen.stockMinimo}"/></c:set>
				<cmz:itemContenidoLista valor="${stockMinimo}" alineacion="right"></cmz:itemContenidoLista>
				<c:set var="stockMaximo"><cmz:formateaNumero valor="${almacen.stockMaximo}"/></c:set>
				<cmz:itemContenidoLista valor="${stockMaximo}" alineacion="right"></cmz:itemContenidoLista>
				<c:set var="stockPendRecibir"><cmz:formateaNumero valor="${almacen.stockPendRecibir}"/></c:set>
				<cmz:itemContenidoLista valor="${stockPendRecibir}" alineacion="right"></cmz:itemContenidoLista>
				<c:set var="stockPendServir"><cmz:formateaNumero valor="${almacen.stockPendServir}"/></c:set>
				<cmz:itemContenidoLista valor="${stockPendServir}" alineacion="right"></cmz:itemContenidoLista>
				<cmz:acciones alineacion="center">
					<cmz:accion onclick="verRegistroPestaña(${indice})" icono="comun/images/iconos/ver.gif" descripcion="Ver almacén"></cmz:accion>
					<c:if test="${formularioArticulo.editable}">
						<cmz:accion onclick="editarRegistroPestaña(${indice})" icono="comun/images/iconos/editar.gif" descripcion="Editar almacén"></cmz:accion>
					</c:if>
				</cmz:acciones>
			</cmz:contenidoListaIndexada>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>
