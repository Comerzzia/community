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

<c:set var="unidad" value="${formularioArticulo.formularioPestañaActiva.registroActivo}" />

<script type="text/javascript">
    function checkFormRegistroPestaña() {
    	if (!esValido("factorConversion", "NUMERICO", true, 3, false)) {
            return false;
        }
    	if (!esValido("alto", "ENTERO", false)) {
            return false;
        }
    	if (!esValido("ancho", "ENTERO", false)) {
            return false;
        }
    	if (!esValido("fondo", "ENTERO", false)) {
            return false;
        }
    	if (!esValido("peso", "NUMERICO", false, 3, false)) {
            return false;
        }
        
        return true;
    }
 </script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Unidad de Medida">
    <cmz:acciones numAccionesVisibles="8">
      <c:choose>
        <c:when test="${formularioArticulo.formularioPestañaActiva.editable}">
          <cmz:accionSalvarLinea onclick="aceptarRegistroPestaña();"/>
          <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
        </c:when>
        <c:otherwise>
          <cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
          
          <c:if test="${formularioArticulo.editable}">
          	<c:if test="${!empty requestScope.lstUnidadesMedidas}">
	            <cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir Unidad"/>
          	</c:if>
            <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Unidad" onclick="editarRegistroPestaña(${formularioArticulo.formularioPestañaActiva.indiceRegistroActivo});" />
            <cmz:accion icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar Unidad" onclick="eliminarRegistroPestaña(${formularioArticulo.formularioPestañaActiva.indiceRegistroActivo});" />
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
        <td>Unidad de Medida:</td>
        <td>
        	<c:choose>
        		<c:when test="${formularioArticulo.formularioPestañaActiva.enInsercion}">
		        	<select name="unidadMedida" class="campo requerido">
		        		<c:forEach items="${requestScope.lstUnidadesMedidas}" var="unidad">
			        		<option value="${unidad}"><c:out value="${unidad}"/></option>
		        		</c:forEach>
		        	</select>
        		</c:when>
        		<c:otherwise>
		          <cmz:campoTexto id="unidadMedida" valor="${unidad.unidadMedida}" anchura="110" clase="campo soloLectura" soloLectura="true"></cmz:campoTexto>
        		</c:otherwise>
        	</c:choose>
        </td>
      </tr>
      
      <tr>
        <td>Factor conversión:</td>
        <td>
          <c:set var="factorConversion"><cmz:formateaNumero valor="${unidad.factorConversion}"/></c:set>	
          <cmz:campoTexto id="factorConversion" valor="${factorConversion}" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="110" longitudMaxima="13" requerido="true"></cmz:campoTexto>
        </td>
      </tr>  
                     
      <tr>
        <td>Alto:</td>
        <td>
          <cmz:campoTexto id="alto" valor="${unidad.alto}" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="110" longitudMaxima="13" requerido="false"></cmz:campoTexto>
        </td>
      </tr>
      
      <tr>
        <td>Ancho:</td>
        <td>
          <cmz:campoTexto id="ancho" valor="${unidad.ancho}" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="110" longitudMaxima="13" requerido="false"></cmz:campoTexto>
        </td>
      </tr>

      <tr>
        <td>Fondo:</td>
        <td>
          <cmz:campoTexto id="fondo" valor="${unidad.fondo}" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="110" longitudMaxima="13" requerido="false"></cmz:campoTexto>
        </td>
      </tr>

      <tr>
        <td>Peso:</td>
        <td>
          <c:set var="peso"><cmz:formateaNumero valor="${unidad.peso}" numDecimales="3"/></c:set>	
          <cmz:campoTexto id="peso" valor="${peso}" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="110" longitudMaxima="13" requerido="false"></cmz:campoTexto>
        </td>
      </tr>
    </table>
  </cmz:cuerpoPanel>
 </cmz:panel>
 
