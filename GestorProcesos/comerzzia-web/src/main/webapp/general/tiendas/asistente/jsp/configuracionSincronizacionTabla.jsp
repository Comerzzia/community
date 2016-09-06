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

<c:set var="tienda" value="${asistenteTienda.tienda}" />

<script type="text/javascript">
    function checkFormPestaña() { 
    	<c:forEach items="${tienda.listaParametros}" var="parametro">
    	if(!esValido("<c:out value="${parametro}"/>", "TEXTO", true))
	    	return false;
    	</c:forEach>   	
	    return true;
    }
</script>

<c:if test="${!empty tienda.listaParametros}">
	<cmz:panel>
		<cmz:cabeceraPanel titulo="Parámetros de Configuración" />
		<cmz:cuerpoPanel>
			<table cellpadding="2px" cellspacing="2px" border="0px">
				<c:forEach items="${tienda.listaParametros}" var="parametro">
					<tr>
						<td><c:out value="${parametro}"></c:out>:</td>
						<td><cmz:campoTexto id="${parametro}"
							valor="${tienda.parametros[parametro]}" requerido="true"
							anchura="300px" longitudMaxima="45"
							editable="${formularioTienda.editable}"
							soloLectura="${!formularioTienda.editable}" /></td>
					</tr>
				</c:forEach>
			</table>
		</cmz:cuerpoPanel>
	</cmz:panel>
</c:if>
