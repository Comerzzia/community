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

<c:set var="medioPago" value="${formularioFacturaCompra.formularioPestañaActiva.registroActivo}" />

<cmz:panel>
	<cmz:cabeceraPanel titulo="Pago">
	<cmz:acciones numAccionesVisibles="8">
      	<cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
        <cmz:accionNavegacionRegistros onclick="verRegistroPestaña" 
               total="${formularioFacturaCompra.formularioPestañaActiva.total}" 
               actual="${formularioFacturaCompra.formularioPestañaActiva.actual}" 
               primero="${formularioFacturaCompra.formularioPestañaActiva.primero}"
               anterior="${formularioFacturaCompra.formularioPestañaActiva.anterior}"
               siguiente="${formularioFacturaCompra.formularioPestañaActiva.siguiente}"
               ultimo="${formularioFacturaCompra.formularioPestañaActiva.ultimo}"/>
    </cmz:acciones>
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table cellpadding="2px" cellspacing="2px" border="0px">
	      <tr>
	      	<td>Medio de Pago:</td>
			<td>
			  <cmz:ayuda nombreAyuda="MEDIOS_PAGO_VEN_COMPRAS" soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}">
			   	<cmz:codigoAyuda idCodigo="idMedioPagoVencimiento" valorCodigo="${medioPago.idMedioPagoVencimiento}"></cmz:codigoAyuda>
			   	<cmz:descripcionAyuda idDescripcion="desMedioPagoVencimiento" anchuraDescripcion="250px" valorDescripcion="${medioPago.desMedioPagoVencimiento}" 
			   		editable="${formularioFacturaCompra.formularioPestañaActiva.editable}"></cmz:descripcionAyuda>
			  </cmz:ayuda>
			</td>
      	  </tr>      
	      <tr>
	        <td>Importe:</td>
	        <td>
	          <cmz:campoTexto id="importe" editable="${formularioFacturaCompra.formularioPestañaActiva.editable}"
	              soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}" anchura="100" longitudMaxima="13">
	              <cmz:formateaNumero valor="${medioPago.importe}" numDecimales="2"></cmz:formateaNumero></cmz:campoTexto>
	        </td>
	      </tr>  
	    </table>	
	</cmz:cuerpoPanel>
</cmz:panel>
