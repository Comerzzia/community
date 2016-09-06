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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="promocion" value="${formularioPromocion.registroActivo}" />
<c:set var="articulo" value="${formularioPromocion.formularioPestañaActiva.registroActivo}" />

<script type="text/javascript" language="javascript" 
	src="ventas/promociones/mantenimiento/js/articulosPromocionFicha.js"></script>

<script type="text/javascript" language="javascript">	
	function checkFormRegistroPestaña() {
		if(!esValido("codArt", "AYUDA", true, "desArt", "ARTICULOS"))
            return false;
		if(!esValido("precioTarifa", "NUMERICO", true, 4, false))
            return false;
		if(!esValido("precioVenta", "NUMERICO", false, 4, false))
            return false;
		if(!esValido("puntos", "ENTERO", true))
            return false;
		<c:if test="${promocion.activa}">
			if(!esValido("fechaInicioArt", "FECHA", true))
	            return false;
	        if(!esValido("fechaFinArt", "FECHA", true))
	            return false;
	        
	        var fechaInicio = document.getElementById("fechaInicio").value;
	        var fechaFin = document.getElementById("fechaFin").value;
	        var fechaInicioArt = document.getElementById("fechaInicioArt").value;
	        var fechaFinArt = document.getElementById("fechaFinArt").value;

	        if(!validarFechaMenorIgual(fechaInicioArt, fechaFinArt)){
	        	alert("La fecha de inicio no puede ser mayor a la fecha de fin");
	        	return false;
	        }
	        if(!validarFechaMenorIgual(fechaInicio, fechaInicioArt)){
	        	alert("La fecha de inicio del artículo no puede ser menor que la fecha de inicio de la promoción");
	        	return false;
	        }
	        if(!validarFechaMenorIgual(fechaFinArt, fechaFin)){
        		if(!confirm("La fecha de fin del artículo es mayor que la fecha de fin de la promoción.\n" +
                		"Si continua se modificará la fecha de fin de la promoción.\n¿Está seguro que desea continuar?")){
        			return false;
        		}
	        }
        </c:if>
        /*if (!esValido("textoPromocion", "TEXTO", false))
            return false;*/
        return true;
	}
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Artículos">
    <cmz:acciones numAccionesVisibles="8">
      <c:choose>
        <c:when test="${formularioPromocion.formularioPestañaActiva.editable}">
          <cmz:accionSalvarLinea onclick="aceptarRegistroPestaña();"/>
          <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
        </c:when>
        <c:otherwise>
          <cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
          
          <c:if test="${formularioPromocion.editable}">
            <cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir Artículo"/>
            <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Artículo" onclick="editarRegistroPestaña(${formularioPromocion.formularioPestañaActiva.indiceRegistroActivo});" />
            <c:if test="${!promocion.activa}">
            	<cmz:accion icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar Artículo" onclick="eliminarRegistroPestaña(${formularioPromocion.formularioPestañaActiva.indiceRegistroActivo});" />
          	</c:if>
          </c:if>
          
          <cmz:accionNavegacionRegistros onclick="verRegistroPestaña" 
               total="${formularioPromocion.formularioPestañaActiva.total}" 
               actual="${formularioPromocion.formularioPestañaActiva.actual}" 
               primero="${formularioPromocion.formularioPestañaActiva.primero}"
               anterior="${formularioPromocion.formularioPestañaActiva.anterior}"
               siguiente="${formularioPromocion.formularioPestañaActiva.siguiente}"
               ultimo="${formularioPromocion.formularioPestañaActiva.ultimo}"/>
        
        </c:otherwise>
      </c:choose>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
		<tr>
			<td>Artículo:</td>
			<td colspan="3">
				<cmz:ayuda nombreAyuda="ARTICULOS" requerido="true" soloLectura="${!formularioPromocion.formularioPestañaActiva.enInsercion}" accionAyudaXML="promocionPrecioArticulo">
					<cmz:codigoAyuda idCodigo="codArt" valorCodigo="${articulo.codArt}"
						anchuraCodigo="100px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
					<cmz:descripcionAyuda idDescripcion="desArt" valorDescripcion="${articulo.desArt}"
						anchuraDescripcion="320px" editable="${formularioPromocion.formularioPestañaActiva.enInsercion}"></cmz:descripcionAyuda>
				</cmz:ayuda>
			</td>
		</tr>  
		<tr>
	        <td>Precio tarifa:</td>
	        <td>
	          <c:set var="precioTarifa"><cmz:formateaNumero valor="${articulo.precioTarifa}" numDecimales="4"/></c:set>
	          <cmz:campoTexto id="precioTarifa" valor="${precioTarifa}" editable="false" 
	              soloLectura="true" anchura="100px" longitudMaxima="14" requerido="true"></cmz:campoTexto>
	        </td>
	        <td align="right">Precio tarifa con impuestos:</td>
	        <td>
	          <c:set var="precioTarifaConImpuestos"><cmz:formateaNumero valor="${articulo.precioTarifaConImpuestos}" numDecimales="2"/></c:set>
	          <cmz:campoTexto id="precioTarifaConImpuestos" valor="${precioTarifaConImpuestos}" editable="false" 
	              soloLectura="true" anchura="100px" longitudMaxima="14"></cmz:campoTexto>
	        </td>
	    </tr>
	    <tr>
	        <td>Precio promoción:</td>
	        <td>
	          <c:set var="precioVenta"><cmz:formateaNumero valor="${articulo.precioVenta}" numDecimales="4"/></c:set>
	          <cmz:campoTexto id="precioVenta" valor="${precioVenta}" editable="${formularioPromocion.formularioPestañaActiva.editable}" 
	              soloLectura="${!formularioPromocion.formularioPestañaActiva.editable}" anchura="100px" longitudMaxima="14"
	              onChange="validarPrecioPromocion();"></cmz:campoTexto>
	        </td>
	        <td align="right">Precio promoción con impuestos:</td>
	        <td>
	          <c:set var="precioTotal"><cmz:formateaNumero valor="${articulo.precioTotal}" numDecimales="2"/></c:set>
	          <cmz:campoTexto id="precioTotal" valor="${precioTotal}" editable="${formularioPromocion.formularioPestañaActiva.editable}" 
	              soloLectura="${!formularioPromocion.formularioPestañaActiva.editable}" anchura="100px" longitudMaxima="14"
	              onChange="validarPrecioTotal();"></cmz:campoTexto>
	        </td>
      	</tr>  
      	<tr>
      		<td>Puntos:</td>
	        <td>
	          <cmz:campoTexto id="puntos" valor="${articulo.puntos}" editable="${formularioPromocion.formularioPestañaActiva.editable}" 
	              soloLectura="${!formularioPromocion.formularioPestañaActiva.editable}" anchura="100px" longitudMaxima="5" requerido="true"></cmz:campoTexto>
	        </td>
      	</tr>
      	<c:if test="${promocion.activa}">                    
      	<tr>
            <td>Fecha Inicio:</td>
            <td>
            	<c:set var="fechaInicioArt"><fmt:formatDate pattern="dd/MM/yyyy" value="${articulo.fechaInicio}"/></c:set>
                <cmz:campoFecha id="fechaInicioArt" valor="${fechaInicioArt}" requerido="true"
                    editable="${formularioPromocion.formularioPestañaActiva.editable}" soloLectura="${!formularioPromocion.formularioPestañaActiva.editable}" />
            </td>
            <td align="right">Fecha Fin:</td>
            <td>
            	<c:set var="fechaFinArt"><fmt:formatDate pattern="dd/MM/yyyy" value="${articulo.fechaFin}"/></c:set>
                <cmz:campoFecha id="fechaFinArt" valor="${fechaFinArt}" requerido="true"
                   	editable="${formularioPromocion.formularioPestañaActiva.editable}" soloLectura="${!formularioPromocion.formularioPestañaActiva.editable}" />
            </td>
       </tr>
       </c:if>
       <tr>
       		<td>Texto promoción:</td>
			<td colspan="3">
				<cmz:campoAreaTexto id="textoPromocion" valor="${articulo.textoPromocion}" longitudMaxima="255" editable="${formularioPromocion.formularioPestañaActiva.editable}" 
					soloLectura="${!formularioPromocion.formularioPestañaActiva.editable}" altura="80" anchura="425"></cmz:campoAreaTexto>
			</td>
		</tr>
    </table>
  </cmz:cuerpoPanel>
 </cmz:panel>
