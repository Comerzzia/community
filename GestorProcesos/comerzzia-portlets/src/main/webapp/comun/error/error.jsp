<%--
 * Copyright 2009-2014 RED.ES - Desarrollado por TIER1
 * 
 * Licencia con arreglo a la EUPL, versi�n 1.1 o -en cuanto 
 * sean aprobadas por la comisi�n Europea- versiones 
 * posteriores de la EUPL (la "Licencia").
 * Solo podr� usarse esta obra si se respeta la Licencia.
 * 
 * http://ec.europa.eu/idabc/eupl.html
 * 
 * Salvo cuando lo exija la legislaci�n aplicable o se acuerde
 * por escrito, el programa distribuido con arreglo a la
 * Licencia se distribuye "TAL CUAL",
 * SIN GARANT�AS NI CONDICIONES DE NING�N TIPO, 
 * ni expresas ni impl�citas.
 * V�ase la Licencia en el idioma concreto que rige
 * los permisos y limitaciones que establece la Licencia.
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Error</title>
	</head>
	<body>
		<div>
			<c:choose>
				<c:when test="${mensajeError != null}">
					<span class="portlet-msg-error"> <c:out value="${mensajeError}"/></span>
				</c:when>
				<c:otherwise>
					<span class="portlet-msg-error"> En estos momentos no podemos atender su petici�n. Disculpe las molestias. </span>
				</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>
