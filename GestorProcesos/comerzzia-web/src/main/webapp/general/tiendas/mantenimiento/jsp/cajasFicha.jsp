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

<c:set var="caja" value="${formularioTienda.formularioPestañaActiva.registroActivo}" />

<script type="text/javascript">
	function checkFormRegistroPestaña() {
		if (!esValido("codCaja", "TEXTO", true)) {
            return false;
        }
		if (!esValido("identificadorCaja", "TEXTO", false)) {
            return false;
        }
       	
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Caja">
    <cmz:acciones numAccionesVisibles="8">
      <c:choose>
        <c:when test="${formularioTienda.formularioPestañaActiva.editable}">
          <cmz:accionSalvarLinea onclick="aceptarRegistroPestaña();"/>
          <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
        </c:when>
        <c:otherwise>
          <cmz:accion icono="comun/images/iconos/modo_tabla.gif" descripcion="Vista en Modo Tabla" onclick="vistaTablaPestaña();" />
          
          <c:if test="${formularioTienda.editable}">
            <cmz:accion icono="comun/images/iconos/alta.gif" descripcion="Añadir Vencimiento" onclick="nuevoRegistroPestaña();" />
            <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Vencimiento" onclick="editarRegistroPestaña(${formularioMedioPago.formularioPestañaActiva.indiceRegistroActivo});" />
            <cmz:accion icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar Vencimiento" onclick="eliminarRegistroPestaña(${formularioMedioPago.formularioPestañaActiva.indiceRegistroActivo});" />
          </c:if>
          
          <cmz:accionNavegacionRegistros onclick="verRegistroPestaña" 
               total="${formularioTienda.formularioPestañaActiva.total}" 
               actual="${formularioTienda.formularioPestañaActiva.actual}" 
               primero="${formularioTienda.formularioPestañaActiva.primero}"
               anterior="${formularioTienda.formularioPestañaActiva.anterior}"
               siguiente="${formularioTienda.formularioPestañaActiva.siguiente}"
               ultimo="${formularioTienda.formularioPestañaActiva.ultimo}"/>
        </c:otherwise>
      </c:choose>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
        <td>Caja:</td>
        <td colspan="3">
          <cmz:campoTexto id="codCaja" valor="${caja.codCaja}" editable="${formularioTienda.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioTienda.formularioPestañaActiva.editable}" anchura="300" longitudMaxima="45" requerido="true"></cmz:campoTexto>
        </td>
      </tr>
      
      <tr>
        <td>Identificador</td>
        <td>
          <cmz:campoTexto id="identificadorCaja" valor="${caja.identificadorCaja}" editable="${formularioTienda.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioTienda.formularioPestañaActiva.editable}" anchura="40" longitudMaxima="5"></cmz:campoTexto>
        </td>
      </tr>  
                     
    </table>
  </cmz:cuerpoPanel>
 </cmz:panel>
