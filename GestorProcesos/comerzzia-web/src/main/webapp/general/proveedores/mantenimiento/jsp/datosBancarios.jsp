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

<c:set var="proveedor" value="${formularioProveedor.registroActivo}" />

<script type="text/javascript">
    function checkFormPestaña() {
    	if (!esValido("banco", "TEXTO", false)) {
            return false;
        }
        if (!esValido("domicilioBanco", "TEXTO", false)) {
            return false;
        }
        if (!esValido("poblacionBanco", "TEXTO", false)) {
            return false;
        }
        if (!esValido("ccc", "ENTERO", false)) {
            return false;
        }
        return true;
    }
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Datos Bancarios"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
	<table cellpadding="2px" cellspacing="2px" border="0px">
	  <tr>
	    <td>Nombre:</td>
	    <td>
	      <cmz:campoTexto id="banco" valor="${proveedor.banco}" requerido="false" anchura="320px" longitudMaxima="45"
	                      editable="${formularioProveedor.editable}" soloLectura="${!formularioProveedor.editable}"/>
	    </td>
	  </tr>
	
	  <tr>
	    <td>Domicilio:</td>
	    <td>
	      <cmz:campoTexto id="domicilioBanco" valor="${proveedor.domicilioBanco}" requerido="false" anchura="350px" longitudMaxima="50"
	                      editable="${formularioProveedor.editable}" soloLectura="${!formularioProveedor.editable}"/>
	    </td>
	  </tr>
	
	  <tr>
	    <td>Población:</td>
	    <td>
	      <cmz:campoTexto id="poblacionBanco" valor="${proveedor.poblacionBanco}" requerido="false" anchura="350px" longitudMaxima="50"
	                      editable="${formularioProveedor.editable}" soloLectura="${!formularioProveedor.editable}"/>
	    </td>
	  </tr>
	
	  <tr>
	    <td>CCC:</td>
	    <td>
	      <cmz:campoTexto id="ccc" valor="${proveedor.ccc}" requerido="false" anchura="200px" longitudMaxima="20"
	                      editable="${formularioProveedor.editable}" soloLectura="${!formularioProveedor.editable}"/>
	    </td>
	  </tr>
	</table>  
  </cmz:cuerpoPanel>
</cmz:panel>  
