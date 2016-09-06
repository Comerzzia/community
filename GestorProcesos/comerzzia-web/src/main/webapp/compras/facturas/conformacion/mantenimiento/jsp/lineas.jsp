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

<table cellpadding="2px" cellspacing="2px" border="0px">
	<tr>
		<td>Tratamiento de impuestos:</td>
		<td><cmz:campoTexto id="desTratImp" valor="${factura.desTratImpuestos}"
			anchura="200px" editable="false" soloLectura="true" /></td>
	</tr>
</table>

<table width="100%">
  	 <tbody>
  	  <tr>
  	  	<td width="35%" valign="top">
			<cmz:panel>
			  <cmz:cabeceraPanel titulo="Suma de Albaranes Seleccionados">
			  </cmz:cabeceraPanel>
			  <cmz:cuerpoPanel>
					    <cmz:lista>
					      <cmz:cabeceraLista>
					        <cmz:itemCabeceraLista nombre="Tipo imp." estilo="text-align: center;"></cmz:itemCabeceraLista>
					        <cmz:itemCabeceraLista nombre="Base" estilo="text-align: center;"></cmz:itemCabeceraLista>
					        <cmz:itemCabeceraLista nombre="Impuestos" estilo="text-align: center;"></cmz:itemCabeceraLista>
					        <cmz:itemCabeceraLista nombre="Total" estilo="text-align: center;"></cmz:itemCabeceraLista>
					      </cmz:cabeceraLista>
					      
					      <cmz:contenidoLista variable="impuesto" lista="${factura.detalleImpuestosAlbaranes.listaImpuestos}">
					        <c:set var="porcentajeImpuesto" value="${factura.porcentajesImpuestos.porcentajesImpuestos[impuesto.codImpuesto]}" />
					        <c:set var="desTipoImpuesto" value="${porcentajeImpuesto.desImpuesto}" />       
					        <cmz:itemContenidoLista><c:out value="${desTipoImpuesto}" /></cmz:itemContenidoLista>
					        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${impuesto.base}" numDecimales="2"/></cmz:itemContenidoLista>
					        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${impuesto.impuestos}" numDecimales="2"/></cmz:itemContenidoLista>
					        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${impuesto.total}" numDecimales="2"/></cmz:itemContenidoLista>
					      </cmz:contenidoLista>
					      
					      <tr class="fila par">
							<td style="text-align: center;font-weight:bold;"><span><c:out value="TOTAL" /></span></td>
							<td style="text-align: right;font-weight:bold;"><span><cmz:formateaNumero valor="${factura.detalleImpuestosAlbaranes.base}" numDecimales="2"/></span></td>
							<td style="text-align: right;font-weight:bold;"><span><cmz:formateaNumero valor="${factura.detalleImpuestosAlbaranes.impuestos}" numDecimales="2"/></span></td>
							<td style="text-align: right;font-weight:bold;"><span><cmz:formateaNumero valor="${factura.detalleImpuestosAlbaranes.total}" numDecimales="2"/></span></td>
						  </tr>
					    </cmz:lista>		    
			  </cmz:cuerpoPanel>
			</cmz:panel>
		</td>
	    <td width="65%" valign="top">
	    	<c:choose>
				<c:when	test="${formularioConformacionFacturas.formularioPestañaActiva.modoVisualizacionFicha}">
					<c:import url="detalleFacturaFicha.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="detalleFacturaTabla.jsp"></c:import>
				</c:otherwise>
			</c:choose>
	    </td>
	  </tr>
	 </tbody>
 </table>
