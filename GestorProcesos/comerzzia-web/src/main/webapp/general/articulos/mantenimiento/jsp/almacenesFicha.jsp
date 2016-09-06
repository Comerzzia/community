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

<c:set var="almacen" value="${formularioArticulo.formularioPestañaActiva.registroActivo}" />
<c:set var="articulo" value="${formularioArticulo.registroActivo}" />

<script type="text/javascript">
    function checkFormRegistroPestaña() {
    	if (!esValido("stockMinimo", "NUMERICO", true, 3, true)) {
            return false;
        }
    	if (!esValido("stockMaximo", "NUMERICO", true, 3, true)) {
            return false;
        }
        
        return true;
    }
 </script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Almacen">
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
        <td>Código de Almacén:</td>
        <td>
          <cmz:campoTexto id="codAlmacen" valor="${almacen.codAlm}" editable="false" 
              soloLectura="true" anchura="40" longitudMaxima="4" requerido="false"></cmz:campoTexto>
        </td>
      </tr>
      
      <c:choose>
	      <c:when test="${empty formularioArticulo.tituloDesglose1}">
		      <input name="desglose1" id="desglose1" type="hidden" value="*" />
		  </c:when>
		  <c:otherwise>
		  	<tr>
				<td><c:out value="${formularioArticulo.tituloDesglose1}" />:</td>
				<c:choose>
					<c:when test="${articulo.desglose1}">
					    <td>
					    	<cmz:campoTexto id="desglose1" valor="${almacen.desglose1}" editable="false" 
              					soloLectura="true" anchura="120" longitudMaxima="15" requerido="false"></cmz:campoTexto>
					    </td>
				    </c:when>
				    <c:otherwise>
				    	<td>
							<cmz:campoTexto id="desglose1" valor="*" editable="false" soloLectura="true" anchura="120" longitudMaxima="15" requerido="false"></cmz:campoTexto>	
						</td>
				    </c:otherwise>
			    </c:choose>
			</tr>
	       </c:otherwise>
	  </c:choose>
      
      <c:choose>
	      <c:when test="${empty formularioArticulo.tituloDesglose2}">
		      <input name="desglose2" id="desglose2" type="hidden" value="*" />
		  </c:when>
		  <c:otherwise>
		  	<tr>
				<td><c:out value="${formularioArticulo.tituloDesglose2}" />:</td>
				<c:choose>
					<c:when test="${articulo.desglose2}">
					    <td>
					    	<cmz:campoTexto id="desglose2" valor="${almacen.desglose2}" editable="false" 
              					soloLectura="true" anchura="120" longitudMaxima="15" requerido="false"></cmz:campoTexto>
					    </td>
				    </c:when>
				    <c:otherwise>
				    	<td>
							<cmz:campoTexto id="desglose2" valor="*" editable="false" soloLectura="true" anchura="120" longitudMaxima="15" requerido="false"></cmz:campoTexto>	
						</td>
				    </c:otherwise>
			    </c:choose>
			</tr>
	       </c:otherwise>
	  </c:choose>
      
      <tr>
        <td>Stock:</td>
        <td>
           <c:set var="stock"><cmz:formateaNumero valor="${almacen.stock}"/></c:set>
           <cmz:campoTexto id="stock" valor="${stock}" editable="false" 
              soloLectura="true" anchura="70" longitudMaxima="13" requerido="false"></cmz:campoTexto>
        </td>
      </tr>
      
      <tr>
        <td>Stock de Unidad Alternativa:</td>
        <td>
        	<c:set var="stockUMA"><cmz:formateaNumero valor="${almacen.stockUMA}"/></c:set>
           <cmz:campoTexto id="stockUnidadAlt" valor="${stockUMA}" editable="false" 
              soloLectura="true" anchura="70" longitudMaxima="13" requerido="false"></cmz:campoTexto>
        </td>
      </tr>
      
      <tr>
        <td>Stock Mínimo:</td>
        <td>
        	<c:set var="stockMinimo"><cmz:formateaNumero valor="${almacen.stockMinimo}"/></c:set>
           <cmz:campoTexto id="stockMinimo" valor="${stockMinimo}" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="70" longitudMaxima="13" requerido="true"></cmz:campoTexto>
        </td>
      </tr>
      
      <tr>
        <td>Stock Máximo:</td>
        <td>
        	<c:set var="stockMaximo"><cmz:formateaNumero valor="${almacen.stockMaximo}"/></c:set>
           <cmz:campoTexto id="stockMaximo" valor="${stockMaximo}" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="70" longitudMaxima="13" requerido="true"></cmz:campoTexto>
        </td>
      </tr>
      
      <tr>
        <td>Stock Pendiente de Recibir:</td>
        <td>
        	<c:set var="stockPendRecibir"><cmz:formateaNumero valor="${almacen.stockPendRecibir}"/></c:set>
           <cmz:campoTexto id="stockPendRecibir" valor="${stockPendRecibir}" editable="false" 
              soloLectura="true" anchura="70" longitudMaxima="13" requerido="false"></cmz:campoTexto>
        </td>
      </tr>
      
       <tr>
        <td>Stock Pendiente de Servir:</td>
        <td>
        	<c:set var="stockPendServir"><cmz:formateaNumero valor="${almacen.stockPendServir}"/></c:set>
           <cmz:campoTexto id="stockPendServir" valor="${stockPendServir}" editable="false" 
              soloLectura="true" anchura="70" longitudMaxima="13" requerido="false"></cmz:campoTexto>
        </td>
      </tr>
    </table>
  </cmz:cuerpoPanel>
 </cmz:panel>
 
