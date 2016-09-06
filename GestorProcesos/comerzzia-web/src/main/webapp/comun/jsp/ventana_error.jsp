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

<jsp:useBean id="exception" class="java.lang.Exception" scope="request" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Comerzzia</title>

	<link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
	
	<script language="javascript">
        function mostrarException() {
            if (document.getElementById("divException").style.display == "none") {
	            document.getElementById("divException").style.display = "";
	        }
	        else {
	            document.getElementById("divException").style.display = "none";
	        }
        }
        
        function cerrar() {
            window.close();
        }
        
        function keyDown() {
            if (event.keyCode == 13 || event.keyCode == 27) {
                cerrar();
            }
        }
    </script>
</head>
<body onkeydown="keyDown();">
<table width="50%" align="center" height="100%">
	<tr>
		<td><cmz:panel>
			<cmz:cuerpoPanel alineacion="center">
				<table align="center" width="350px;">
					<tr>
						<td onclick="JavaScript:mostrarException()"><img
							src='<c:url value="comun/images/iconos/error.png"/>'></td>
						<td>
						<table border="0" align="center" cellspacing="2" cellpadding="2">
							<tr>
								<td align="center"><!-- tabla del mensaje de error -->
								<table cellpadding="4" cellspacing="2" border="0" width="100%">
									<c:choose>
										<c:when test="${requestScope.mensajeError == null}">
											<tr>
												<td align="center" class="mensaje" style="font-size: 12px;" nowrap="nowrap">En
												estos momentos no podemos atender su petición.</td>
											</tr>
											<tr>
												<td align="center" class="mensaje" style="font-size: 12px;">Disculpe
												las molestias.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td align="center" class="mensaje" style="font-size: 12px;"><c:out
													value="${requestScope.mensajeError}" /></td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
								</td>
							</tr>


							<!-- botones -->

							<tr>
								<td align="center">
								  <table cellpadding="7" cellspacing="2" border="0">
									<tr>
									  <td align="center">
									    <table cellspacing="0">
									      <tr>
									        <td>
									          <input type="button" value="Aceptar" class="boton" onclick="JavaScript:cerrar()" style="width: 80px">
									        </td>
									      </tr>
									    </table>
									  </td>
									</tr>
								  </table>
								</td>
							</tr>

						</table>
						</td>
					</tr>

					<!-- Excepcion -->
					<tr>
						<td colspan="2">
						<div id="divException" style="display: none">
  						  <c:out value="Excepción: ${exception.localizedMessage}"></c:out>
                          <br><br>
                          <c:out value="Traza:"></c:out><br>
                          <c:forEach items="${exception.stackTrace}" var="traza">
                            <c:out value="${traza}"></c:out>
                            <br>
                          </c:forEach>
						</div>
						</td>
					</tr>
					<!-- Fin Excepcion -->
				</table>
			</cmz:cuerpoPanel>
		</cmz:panel></td>
	</tr>
</table>
</body>
</html>
