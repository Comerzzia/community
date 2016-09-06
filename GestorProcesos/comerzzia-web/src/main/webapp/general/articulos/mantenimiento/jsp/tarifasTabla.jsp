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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
    function checkFormPestaña() {
        return true;
    }
 </script>
 
<cmz:panel>
	<cmz:cabeceraPanel titulo="Tarifas">
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Código" columna="1" ordenColumna="CODTAR"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Descripción" columna="2" ordenColumna="DESCRIPCION"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Precio Costo" columna="3" ordenColumna="PRECIO_COSTO" estilo="text-align: right;" ></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Factor Marcaje" columna="4" ordenColumna="FACTOR_MARCAJE" estilo="text-align: right;" ></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Precio Marcaje" columna="5" ordenColumna="PRECIO_MARCAJE" estilo="text-align: right;" ></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Factor Aplicado" columna="6" ordenColumna="FACTOR_APLICADO" estilo="text-align: right;" ></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Precio Venta" columna="7" ordenColumna="PRECIO_VENTA" estilo="text-align: right;" ></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Precio Venta + imp." columna="8" ordenColumna="PRECIO_TOTAL" estilo="text-align: right;" ></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoListaIndexada variable="tarifa" lista="${formularioArticulo.formularioPestañaActiva.registros}">
				<cmz:itemContenidoLista valor="${tarifa.codTar}" onclick="verRegistroPestaña(${indice})"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${tarifa.desTarifa}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${tarifa.precioCosto}" numDecimales="2"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${tarifa.factorMarcaje}" numDecimales="2"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${tarifa.precioMarcaje}" numDecimales="4"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${tarifa.factorAplicado}" numDecimales="2"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${tarifa.precioVenta}" numDecimales="4"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${tarifa.precioTotal}" numDecimales="2"/></cmz:itemContenidoLista>
				<cmz:acciones alineacion="center">
					<cmz:accion onclick="verRegistroPestaña(${indice})" icono="comun/images/iconos/ver.gif" descripcion="Ver tarifa"></cmz:accion>
					<c:if test="${formularioArticulo.editable}">
						<cmz:accion onclick="editarRegistroPestaña(${indice})" icono="comun/images/iconos/editar.gif" descripcion="Editar tarifa"></cmz:accion>
					</c:if>
				</cmz:acciones>
			</cmz:contenidoListaIndexada>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Promociones"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <cmz:lista>
      <cmz:cabeceraLista>
        <cmz:itemCabeceraLista nombre="Tarifa" columna="1"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Descripción" columna="2"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Id" columna="3"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Fecha inicio" columna="4" estilo="text-align: center;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Fecha fin" columna="5" estilo="text-align: center;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Texto" columna="6"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Precio" columna="7" estilo="text-align: right;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Precio+imp." columna="8" estilo="text-align: right;"></cmz:itemCabeceraLista>
      </cmz:cabeceraLista>
      <cmz:contenidoLista variable="promocion" lista="${formularioArticulo.registroActivo.promociones}">
        <cmz:itemContenidoLista valor="${promocion.codTarifa}"></cmz:itemContenidoLista>
        <cmz:itemContenidoLista valor="${promocion.desTarifa}"></cmz:itemContenidoLista>
        <cmz:itemContenidoLista valor="${promocion.idPromocion}"></cmz:itemContenidoLista>        
        <cmz:itemContenidoLista alineacion="center"><fmt:formatDate pattern="dd/MM/yyyy" value="${promocion.fechaInicio}"/></cmz:itemContenidoLista>
        <cmz:itemContenidoLista alineacion="center"><fmt:formatDate pattern="dd/MM/yyyy" value="${promocion.fechaFin}"/></cmz:itemContenidoLista>
        <cmz:itemContenidoLista valor="${promocion.textoPromocion}"></cmz:itemContenidoLista>       
        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${promocion.precioVenta}" numDecimales="4"/></cmz:itemContenidoLista>
        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${promocion.precioTotal}" numDecimales="2"/></cmz:itemContenidoLista>
      </cmz:contenidoLista>
    </cmz:lista>
  </cmz:cuerpoPanel>
</cmz:panel>
