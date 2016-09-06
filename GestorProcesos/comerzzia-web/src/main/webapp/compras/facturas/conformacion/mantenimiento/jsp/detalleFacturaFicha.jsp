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

<c:set var="detalleFactura" value="${formularioConformacionFacturas.formularioPestañaActiva.registroActivo}" />

<script type="text/javascript">
	function checkFormRegistroPestaña() {
		if (!esValido("codImpuesto", "TABLA", true, "Tipo de Impuesto"))
            return false;
		if (!esValido("concepto", "TEXTO", false))
	        return false;
		if(!esValido("base", "NUMERICO", true, 2, true))
            return false;
		
	    return true;
	}
</script>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Detalle Factura del Proveedor">
		<cmz:acciones numAccionesVisibles="8">
	      <c:choose>
	        <c:when test="${formularioConformacionFacturas.formularioPestañaActiva.editable}">
	          <cmz:accionSalvarLinea onclick="aceptarRegistroPestaña();"/>
	          <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
	        </c:when>
	        <c:otherwise>
	          <cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
	          <c:if test="${formularioConformacionFacturas.enInsercion}">
		          <cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir Base"/>
		          <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Base" onclick="editarRegistroPestaña(${formularioConformacionFacturas.formularioPestañaActiva.indiceRegistroActivo});" />
		          <cmz:accion icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar Base" onclick="eliminarRegistroPestaña(${formularioConformacionFacturas.formularioPestañaActiva.indiceRegistroActivo});" />

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
	      	<td>Tipo Impuesto:</td>
			<td><cmz:ayuda nombreAyuda="IMPUESTOS" requerido="true" soloLectura="${!formularioConformacionFacturas.formularioPestañaActiva.enInsercion}">
				<cmz:codigoAyuda idCodigo="codImpuesto" valorCodigo="${detalleFactura.codImpuesto}" longitudMaximaCodigo="1" anchuraCodigo="40px" />
				<cmz:descripcionAyuda idDescripcion="desImpuesto" valorDescripcion="${detalleFactura.desImpuesto}" anchuraDescripcion="200px" 
					editable="${formularioConformacionFacturas.formularioPestañaActiva.enInsercion}"/>
			</cmz:ayuda></td>
		  </tr>
		  
		  <tr>
	        <td>Concepto:</td>
	        <td>
	          <cmz:campoTexto id="concepto" valor="${detalleFactura.concepto}" editable="${formularioConformacionFacturas.formularioPestañaActiva.editable}" 
	              soloLectura="${!formularioConformacionFacturas.formularioPestañaActiva.editable}" anchura="200" longitudMaxima="50"></cmz:campoTexto>
	        </td>
	      </tr>  
	      
	      <tr>
	        <td>Base:</td>
	        <td>
	          <cmz:campoTexto id="base" editable="${formularioConformacionFacturas.formularioPestañaActiva.editable}" requerido="true"
	              soloLectura="${!formularioConformacionFacturas.formularioPestañaActiva.editable}" anchura="100" longitudMaxima="14">
	              <cmz:formateaNumero valor="${detalleFactura.precio}" numDecimales="2"></cmz:formateaNumero></cmz:campoTexto>
	        </td>
	      </tr>  
	    </table>	
	</cmz:cuerpoPanel>
</cmz:panel>
