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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="albaran" value="${formularioAlbaranCompra.registroActivo}" />
<c:set var="formulario" value="${formularioAlbaranCompra.formularioPestañaActiva}" />
<c:set var="pago" value="${formularioAlbaranCompra.formularioPestañaActiva.registroActivo}" />

<script type="text/javascript">
    function checkFormRegistroPestaña() {
		if (!esValido("idMedioPagoVencimiento", "TABLA", true, "Medio de Pago")) {
            return false;
		}
        if (!esValido("importe", "NUMERICO", true, 2, true)) {
            return false;
        }
      
        return true;
    }
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Pagos del Albarán">
    <cmz:acciones>
      <c:choose>
        <c:when test="${formulario.editable}">
          <cmz:accionSalvarLinea onclick="aceptarRegistroPestaña();"/>
          <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
        </c:when>
        <c:otherwise>
          <cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
          
          <c:if test="${formularioPedidoVenta.editable}">
            <cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir Pago"/>
            <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Pago" onclick="editarRegistroPestaña(${formulario.indiceRegistroActivo});" />
            <cmz:accion icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar Pago" onclick="eliminarRegistroPestaña(${formulario.indiceRegistroActivo});" />
          </c:if>
          
          <cmz:accionNavegacionRegistros onclick="verRegistroPestaña" 
               total="${formulario.total}" 
               actual="${formulario.actual}" 
               primero="${formulario.primero}"
               anterior="${formulario.anterior}"
               siguiente="${formulario.siguiente}"
               ultimo="${formulario.ultimo}"/>
        </c:otherwise>
      </c:choose>
    </cmz:acciones>
  </cmz:cabeceraPanel>
   
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
        <td>Medio de Pago:</td>
        <td>
          <cmz:ayuda nombreAyuda="MEDIOS_PAGO_VEN_COMPRAS" requerido="true" soloLectura="${!formulario.editable}">
            <cmz:codigoAyuda idCodigo="idMedioPagoVencimiento" valorCodigo="${pago.idMedioPagoVencimiento}" longitudMaximaCodigo="13" anchuraCodigo="90px"></cmz:codigoAyuda>
            <cmz:descripcionAyuda idDescripcion="desMedioPagoVencimiento" valorDescripcion="${pago.desMedioPagoVencimiento}" editable="${formulario.editable}" anchuraDescripcion="300px"></cmz:descripcionAyuda>
          </cmz:ayuda>
        </td>
      </tr>
      
      <tr>
        <td>Importe:</td>
        <td>
          <cmz:campoTexto id="importe" requerido="true" editable="${formulario.editable}" soloLectura="${!formulario.editable}" anchura="90px">
            <c:choose>
              <c:when test="${formulario.enInsercion}">
                <cmz:formateaNumero numDecimales="2" valor="${albaran.restantePagos}"/>
              </c:when>
              <c:otherwise>
                <cmz:formateaNumero numDecimales="2" valor="${pago.importe}"/>
              </c:otherwise>
            </c:choose>
          </cmz:campoTexto>
        </td>
      </tr>
    </table>
  </cmz:cuerpoPanel>
</cmz:panel>
