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

<c:set var="medioPago" value="${formularioConformacionFacturas.formularioPestañaActiva.registroActivo}" />

<script type="text/javascript">
	function checkFormRegistroPestaña() {
		if (!esValido("idMedioPagoVencimiento", "TABLA", true, "Medio de Pago"))
            return false;
    	if(!esValido("importe", "NUMERICO", true, 2, true))
            return false;
		
	    return true;
	}
</script>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Pago">
		<cmz:acciones numAccionesVisibles="8">
	      <c:choose>
	        <c:when test="${formularioConformacionFacturas.formularioPestañaActiva.editable}">
	          <cmz:accionSalvarLinea onclick="aceptarRegistroPestaña();"/>
	          <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
	        </c:when>
	        <c:otherwise>
	          <cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
	          <c:if test="${formularioConformacionFacturas.enInsercion}">
		          <cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir Medio de Pago"/>	
		          <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Medio de Pago" onclick="editarRegistroPestaña(${formularioConformacionFacturas.formularioPestañaActiva.indiceRegistroActivo});" />
		          <cmz:accion icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar Medio de Pago" onclick="eliminarRegistroPestaña(${formularioConformacionFacturas.formularioPestañaActiva.indiceRegistroActivo});" />

	          </c:if>
	          
	          <cmz:accionNavegacionRegistros onclick="verRegistroPestaña" 
	               total="${formularioConformacionFacturas.formularioPestañaActiva.total}" 
	               actual="${formularioConformacionFacturas.formularioPestañaActiva.actual}" 
	               primero="${formularioConformacionFacturas.formularioPestañaActiva.primero}"
	               anterior="${formularioConformacionFacturas.formularioPestañaActiva.anterior}"
	               siguiente="${formularioConformacionFacturas.formularioPestañaActiva.siguiente}"
	               ultimo="${formularioConformacionFacturas.formularioPestañaActiva.ultimo}"/>
	        </c:otherwise>
	      </c:choose>
	    </cmz:acciones>
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table cellpadding="2px" cellspacing="2px" border="0px">
	      <tr>
	      	<td>Medio de Pago:</td>
			<td>
			   <cmz:ayuda nombreAyuda="MEDIOS_PAGO_VEN_COMPRAS" requerido="true" soloLectura="${!formularioConformacionFacturas.formularioPestañaActiva.editable}">
			     <cmz:codigoAyuda idCodigo="idMedioPagoVencimiento" valorCodigo="${medioPago.idMedioPagoVencimiento}"></cmz:codigoAyuda>
			     <cmz:descripcionAyuda idDescripcion="desMedioPagoVencimiento" anchuraDescripcion="300px" valorDescripcion="${medioPago.desMedioPagoVencimiento}" editable="${formularioConformacionFacturas.formularioPestañaActiva.editable}"></cmz:descripcionAyuda>
			   </cmz:ayuda>
			</td>
      	  </tr>      
	      <tr>
	        <td>Importe:</td>
	        <td>
	          <cmz:campoTexto id="importe" editable="${formularioConformacionFacturas.formularioPestañaActiva.editable}" requerido="true"
	              soloLectura="${!formularioConformacionFacturas.formularioPestañaActiva.editable}" anchura="100" longitudMaxima="13">
	              <cmz:formateaNumero valor="${medioPago.importe}" numDecimales="2"></cmz:formateaNumero></cmz:campoTexto>
	        </td>
	      </tr>  
	    </table>	
	</cmz:cuerpoPanel>
</cmz:panel>
