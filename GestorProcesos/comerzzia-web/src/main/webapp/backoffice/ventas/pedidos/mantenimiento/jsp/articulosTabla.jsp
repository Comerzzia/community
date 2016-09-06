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

<c:set var="pedido" value="${formularioPedidoVentaBackoffice.registroActivo}" />

<script type="text/javascript">
    function nuevoRegistroMasivoPestaña() {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("operacion").value = "añadirArticulosDesgloses";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Artículos del Aprovisionamiento">
    <cmz:acciones>
      <c:if test="${formularioPedidoVentaBackoffice.editable}">
        <cmz:accion onclick="nuevoRegistroMasivoPestaña();" descripcion="Introducción masiva de artículos" icono="comun/images/iconos/altaMasiva.gif"></cmz:accion>
        <cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir artículo"/>
      </c:if>
    </cmz:acciones>
  </cmz:cabeceraPanel>
  
  <cmz:cuerpoPanel>
    <cmz:lista>
      <cmz:cabeceraLista>
        <cmz:itemCabeceraLista nombre="Estado" estilo="text-align: center;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Artículo"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Descripción"></cmz:itemCabeceraLista>
        <c:if test="${!empty formularioPedidoVentaBackoffice.tituloDesglose1}">
          <cmz:itemCabeceraLista nombre="${formularioPedidoVentaBackoffice.tituloDesglose1}"></cmz:itemCabeceraLista>
        </c:if>
        <c:if test="${!empty formularioPedidoVentaBackoffice.tituloDesglose2}">
          <cmz:itemCabeceraLista nombre="${formularioPedidoVentaBackoffice.tituloDesglose2}"></cmz:itemCabeceraLista>
        </c:if>
        <cmz:itemCabeceraLista nombre="U. Solicitadas" estilo="text-align: right;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="U. Aceptadas" estilo="text-align: right;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="U. Preparadas" estilo="text-align: right;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Precio" estilo="text-align: right;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Descuento" estilo="text-align: right;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Importe" estilo="text-align: right;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
      </cmz:cabeceraLista>
      
      <cmz:contenidoListaIndexada variable="articulo" lista="${formularioPedidoVentaBackoffice.formularioPestañaActiva.registros}">
        <cmz:itemContenidoLista alineacion="center">
          <c:set var="estadoSubestado" value="${articulo.lineaEstado}|${articulo.lineaSubEstado}" />
          <img border="0" align="absmiddle" alt="<c:out value="${articulo.lineaDesEstado}" />" title="<c:out value="${articulo.lineaDesEstado}" />" src="<c:out value="${pedido.conjuntoEstadosLineas.estados[estadoSubestado].icono}" />"/>
        </cmz:itemContenidoLista>
        <cmz:itemContenidoLista valor="${articulo.codArticulo}" onclick="verRegistroPestaña(${indice})"></cmz:itemContenidoLista>
        <cmz:itemContenidoLista valor="${articulo.desArticulo}"></cmz:itemContenidoLista>
        <c:if test="${!empty formularioPedidoVentaBackoffice.tituloDesglose1}">
          <cmz:itemContenidoLista valor="${articulo.desglose1}"></cmz:itemContenidoLista>
        </c:if>
        <c:if test="${!empty formularioPedidoVentaBackoffice.tituloDesglose2}">
          <cmz:itemContenidoLista valor="${articulo.desglose2}"></cmz:itemContenidoLista>
        </c:if>
        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.cantidadSolicitada}"/></cmz:itemContenidoLista>
        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.cantidadAceptada}"/></cmz:itemContenidoLista>
        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.cantidadPreparada}"/></cmz:itemContenidoLista>
        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.precio}"/></cmz:itemContenidoLista>
        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.descuento}"/> %</cmz:itemContenidoLista>
        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.importe}" numDecimales="2"/></cmz:itemContenidoLista>
        <cmz:acciones alineacion="center">
          <cmz:accion onclick="verRegistroPestaña(${indice})" icono="comun/images/iconos/ver.gif" descripcion="Ver artículo"></cmz:accion>
          <c:if test="${formularioPedidoVentaBackoffice.editable}">
            <cmz:accion onclick="editarRegistroPestaña(${indice})" icono="comun/images/iconos/editar.gif" descripcion="Editar artículo"></cmz:accion>
            <cmz:accion onclick="eliminarRegistroPestaña(${indice})" icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar artículo"></cmz:accion>
          </c:if>
        </cmz:acciones>
      </cmz:contenidoListaIndexada>
    </cmz:lista>
  </cmz:cuerpoPanel>
</cmz:panel>
