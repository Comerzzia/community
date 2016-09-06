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

<c:set var="articulo" value="${formularioArticulo.registroActivo}" />

<script type="text/javascript">
    function checkFormPestaña() {
        if (!esValido("observaciones", "TEXTO", false)) {
            return false;
        }
        return true;
    }
</script>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Observaciones">
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:campoAreaTexto id="observaciones" anchura="100%" altura="100px" valor="${articulo.observaciones}" longitudMaxima="255" editable="${formularioArticulo.editable}" soloLectura="${!formularioArticulo.editable}"></cmz:campoAreaTexto>
	</cmz:cuerpoPanel>
</cmz:panel>
