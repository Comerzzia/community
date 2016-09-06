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

<c:set var="albaran" value="${formularioAlbaranCompra.registroActivo}" />

<cmz:panel>
  <cmz:cabeceraPanel titulo="Resumen Económico">
  </cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
	<table cellpadding="2px" cellspacing="2px" border="0px">
		<tr>
			<td>Tratamiento de impuestos:</td>
			<td><cmz:campoTexto id="desTratamientoImpuestos" valor="${albaran.desTratamientoImpuestos}"
				anchura="200px" soloLectura="true" /></td>
		</tr>
	</table>
  
    <cmz:lista>
      <cmz:cabeceraLista>
        <cmz:itemCabeceraLista nombre="Tipo Impuesto"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Base" estilo="text-align: right;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Porcentaje" estilo="text-align: right;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Impuestos" estilo="text-align: right;"></cmz:itemCabeceraLista>
        <cmz:itemCabeceraLista nombre="Total" estilo="text-align: right;"></cmz:itemCabeceraLista>
      </cmz:cabeceraLista>
      
      <cmz:contenidoLista variable="impuesto" lista="${albaran.detalleImpuestos.listaImpuestos}">
        <c:set var="porcentajeImpuesto" value="${albaran.porcentajesImpuestos.porcentajesImpuestos[impuesto.codImpuesto]}" />
        <c:choose>
          <c:when test="${!empty porcentajeImpuesto.porcentajeRecargo && porcentajeImpuesto.porcentajeRecargo != 0}">
            <c:set var="porcentajeRecargo">
              + <cmz:formateaNumero valor="${porcentajeImpuesto.porcentajeRecargo}"/> %
            </c:set>
          </c:when>
          <c:otherwise>
          
          </c:otherwise>
        </c:choose>
      
        <cmz:itemContenidoLista valor="${porcentajeImpuesto.desImpuesto}"></cmz:itemContenidoLista>
        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${impuesto.base}" numDecimales="2"/></cmz:itemContenidoLista>
        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${porcentajeImpuesto.porcentaje}"/>&nbsp;%&nbsp;<c:out value="${porcentajeRecargo}" /></cmz:itemContenidoLista>
        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${impuesto.impuestos}" numDecimales="2"/></cmz:itemContenidoLista>
        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${impuesto.total}" numDecimales="2"/></cmz:itemContenidoLista>
      </cmz:contenidoLista>
    </cmz:lista>
  </cmz:cuerpoPanel>
</cmz:panel>
