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
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" language="javascript" src="ventas/tarifas/mantenimiento/js/tarifas.js"></script>
<script type="text/javascript">
	function checkFormRegistroPestaña() {
		if(!esValido("precioCosto","NUMERICO", true, 2, false)){
			return false;
		}
		if (document.getElementById("factorMarcaje").value == "" && document.getElementById("precioMarcaje").value == ""){
			alert("Debe indicar un factor o un precio de marcaje para poder calcular el precio aplicado.");
			document.getElementById("factorMarcaje").focus();
			return false;
		}
	    return true;
	}
</script>

<c:set var="tarifa" value="${formularioArticulo.formularioPestañaActiva.registroActivo}" />
<c:set var="articulo" value="${formularioArticulo.registroActivo}" />


<cmz:panel>
  <cmz:cabeceraPanel titulo="Tarifa">
    <cmz:acciones numAccionesVisibles="8">
      <c:choose>
        <c:when test="${formularioArticulo.formularioPestañaActiva.editable}">
          <cmz:accionSalvarLinea onclick="aceptarRegistroPestaña();"/>
          <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
        </c:when>
        <c:otherwise>
          <cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
          
          <c:if test="${formularioArticulo.editable}">
            <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Código" onclick="editarRegistroPestaña(${formularioArticulo.formularioPestañaActiva.indiceRegistroActivo});" />
          </c:if>
          
          <cmz:accionNavegacionRegistros onclick="verRegistroPestaña" 
               total="${formularioArticulo.formularioPestañaActiva.total}" 
               actual="${formularioArticulo.formularioPestañaActiva.actual}" 
               primero="${formularioArticulo.formularioPestañaActiva.primero}"
               anterior="${formularioArticulo.formularioPestañaActiva.anterior}"
               siguiente="${formularioArticulo.formularioPestañaActiva.siguiente}"
               ultimo="${formularioArticulo.formularioPestañaActiva.ultimo}"/>
        </c:otherwise>
      </c:choose>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
        <td>Código de Tarifa:</td>
        <td>
          <cmz:campoTexto id="codTarifa" valor="${tarifa.codTar}" editable="false" 
              soloLectura="true" anchura="150px" requerido="false"></cmz:campoTexto>
        </td>
      </tr>
      
      <tr>
        <td>Descripción:</td>
        <td>
          <cmz:campoTexto id="desTarifa" valor="${tarifa.desTarifa}" editable="false" 
              soloLectura="true" anchura="300" requerido="false"></cmz:campoTexto>
        </td>
      </tr>  
                     
      <tr>
        <td>Precio compra:</td>
		<td>
			<cmz:campoTexto id="precioCosto" onChange="validarPrecioCosto();" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
					soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" longitudMaxima="14" anchura="70" requerido="true">
                <cmz:formateaNumero valor="${tarifa.precioCosto}" numDecimales="2"/>
			</cmz:campoTexto>
		</td>
      </tr>
      
      <tr>
        <td>Factor marcaje:</td>
        <td>
           <cmz:campoTexto id="factorMarcaje" onChange="validarFactorMarcaje();" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
              		soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="50" longitudMaxima="8" requerido="false">
                <cmz:formateaNumero valor="${tarifa.factorMarcaje}" numDecimales="2"/>
           </cmz:campoTexto>
        </td>
      </tr>
      
      <tr>
        <td>Precio marcaje:</td>
        <td>
           <cmz:campoTexto id="precioMarcaje" onChange="validarPrecioMarcaje();" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
           		   soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="70" longitudMaxima="14" requerido="false">
                 <cmz:formateaNumero valor="${tarifa.precioMarcaje}" numDecimales="4"/>
           </cmz:campoTexto>
        </td>
      </tr>
      <tr>
        <td>Precio marcaje + impuestos:</td>
        <td>
          <cmz:campoTexto id="precioMarcajeImpuestos" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="70" longitudMaxima="14" requerido="false"
              onChange="validarPrecioMarcajeImpuestos();">
            <cmz:formateaNumero valor="${tarifa.precioMarcajeImpuestos}" numDecimales="2"/>
          </cmz:campoTexto>
        </td>
      </tr>
      <tr>
      	<td colspan="2">
      		<hr>
      	</td>
      </tr>  
      <tr>
        <td>Factor aplicado:</td>
        <td>
           <cmz:campoTexto id="factorAplicado" editable="false" soloLectura="true" anchura="70" requerido="false">
              <cmz:formateaNumero valor="${tarifa.factorAplicado}" numDecimales="2"/>
           </cmz:campoTexto>
        </td>
      </tr>
      <tr>
        <td>Precio aplicado:</td>
        <td>
           <cmz:campoTexto id="precioVenta" editable="false" soloLectura="true" anchura="70" requerido="false">
              <cmz:formateaNumero valor="${tarifa.precioVenta}" numDecimales="4"/>
           </cmz:campoTexto>
        </td>
      </tr>
      <tr>
		<td>Precio aplicado + impuestos:</td>
		<td>
          	<input id="codImpuesto" name="codImpuesto" type="hidden" value="${articulo.codImpuesto}" />
			<input type="hidden" value="" id="porcentajeImpuestos" name="porcentajeImpuestos"  />
			<cmz:campoTexto id="precioTotal" editable="false" soloLectura="true" longitudMaxima="14" anchura="70">
              <cmz:formateaNumero valor="${tarifa.precioTotal}" numDecimales="2"/>
			</cmz:campoTexto>
		</td>
	  </tr>
    </table>
  </cmz:cuerpoPanel>
 </cmz:panel>
 
