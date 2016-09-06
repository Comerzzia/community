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

<c:set var="articulo" value="${formularioTarifa.formularioPestañaActiva.registroActivo}" />

<script type="text/javascript" language="javascript" src="ventas/tarifas/mantenimiento/js/tarifas.js"></script>
<script type="text/javascript" language="javascript" src="ventas/tarifas/mantenimiento/js/articulosFicha.js"></script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Artículo">
    <cmz:acciones numAccionesVisibles="8">
      <c:choose>
        <c:when test="${formularioTarifa.formularioPestañaActiva.editable}">
          <cmz:accionSalvarLinea onclick="aceptarRegistroPestaña();"/>
          <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
        </c:when>
        <c:otherwise>
          <cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
          
          <c:if test="${formularioTarifa.editable}">
            <cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir Artículo"/>
            <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Artículo" onclick="editarRegistroPestaña(${formularioTarifa.formularioPestañaActiva.indiceRegistroActivo});" />
            <cmz:accion icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar Artículo" onclick="eliminarRegistroPestaña(${formularioTarifa.formularioPestañaActiva.indiceRegistroActivo});" />
          </c:if>
          
          <cmz:accionNavegacionRegistros onclick="verRegistroPestaña" 
               total="${formularioTarifa.formularioPestañaActiva.total}" 
               actual="${formularioTarifa.formularioPestañaActiva.actual}" 
               primero="${formularioTarifa.formularioPestañaActiva.primero}"
               anterior="${formularioTarifa.formularioPestañaActiva.anterior}"
               siguiente="${formularioTarifa.formularioPestañaActiva.siguiente}"
               ultimo="${formularioTarifa.formularioPestañaActiva.ultimo}"/>
        </c:otherwise>
      </c:choose>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
        <td>Artículo:</td>
        <td>
          <cmz:ayuda soloLectura="${!formularioTarifa.formularioPestañaActiva.enInsercion}" nombreAyuda="ARTICULOS" requerido="true" onclick="ayudaArticuloTarifa();">
          	<cmz:codigoAyuda idCodigo="codArticulo" longitudMaximaCodigo="13" anchuraCodigo="80px" valorCodigo="${articulo.codArt}" 
          		onchange="obtenerInfoArticulo();" />
          	<cmz:descripcionAyuda idDescripcion="desArticulo" editable="false" anchuraDescripcion="300px" valorDescripcion="${articulo.desArt}" />
          </cmz:ayuda>
        </td>
      </tr>
      
      <tr>
        <td>Precio costo:</td>
        <td>
          <cmz:campoTexto id="precioCosto" valor="${articulo.precioCosto}" editable="${formularioTarifa.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioTarifa.formularioPestañaActiva.editable}" anchura="70" longitudMaxima="14" requerido="true"
              onChange="validarPrecioCosto();" >
            <cmz:formateaNumero valor="${articulo.precioCosto}" numDecimales="2"/>
          </cmz:campoTexto>
        </td>
      </tr>  
      <tr>
        <td>Factor marcaje:</td>
        <td>
          <cmz:campoTexto  id="factorMarcaje" valor="${articulo.factorMarcaje}" editable="${formularioTarifa.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioTarifa.formularioPestañaActiva.editable}" anchura="70" longitudMaxima="14" requerido="false"
              onChange="validarFactorMarcaje();">
            <cmz:formateaNumero valor="${articulo.factorMarcaje}" numDecimales="2"/>
          </cmz:campoTexto>
        </td>
      </tr>  
      <tr>
        <td>Precio marcaje:</td>
        <td>
          <cmz:campoTexto id="precioMarcaje" editable="${formularioTarifa.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioTarifa.formularioPestañaActiva.editable}" anchura="70" longitudMaxima="14" requerido="false"
              onChange="validarPrecioMarcaje();">
            <cmz:formateaNumero valor="${articulo.precioMarcaje}" numDecimales="4"/>
          </cmz:campoTexto>
        </td>
      </tr>  
      <tr>
        <td>Precio marcaje + impuestos:</td>
        <td>
          <cmz:campoTexto id="precioMarcajeImpuestos" editable="${formularioTarifa.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioTarifa.formularioPestañaActiva.editable}" anchura="70" longitudMaxima="14" requerido="false"
              onChange="validarPrecioMarcajeImpuestos();">
            <cmz:formateaNumero valor="${articulo.precioMarcajeImpuestos}" numDecimales="2"/>
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
          <cmz:campoTexto id="factorAplicado" editable="false" soloLectura="true" anchura="70" longitudMaxima="14" requerido="true">
            <cmz:formateaNumero valor="${articulo.factorAplicado}" numDecimales="2"/>
          </cmz:campoTexto>
        </td>
      </tr>  
      <tr>
        <td>Precio aplicado:</td>
        <td>
          <cmz:campoTexto id="precioVenta" editable="false" soloLectura="true" anchura="70" longitudMaxima="14" requerido="true">
            <cmz:formateaNumero valor="${articulo.precioVenta}" numDecimales="4"/>
          </cmz:campoTexto>
        </td>
      </tr>  
      <tr>
        <td>Precio aplicado + impuestos:</td>
        <td>
          <input type="hidden" value="" id="porcentajeImpuestos" name="porcentajeImpuestos"  />
          <cmz:campoTexto id="precioTotal" editable="false" soloLectura="true" anchura="70" longitudMaxima="14" requerido="true">
            <cmz:formateaNumero valor="${articulo.precioTotal}" numDecimales="2"/>
          </cmz:campoTexto>
        </td>
      </tr>
               
    </table>
  </cmz:cuerpoPanel>
 </cmz:panel>
 
