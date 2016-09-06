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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Comerzzia</title>

	<link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
	
	<script language="javascript">
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
<body>
<table width="50%" align="center" height="100%">
	<tr>
		<td><cmz:panel>
			<cmz:cuerpoPanel>
				<table align="center" width="350px;">
					<tr>
						<td>
							<img src='<c:url value="comun/images/iconos/info.png"/>'></td>
						<td>
						<table border="0" align="center" cellspacing="2" cellpadding="2">
							<tr>
								<td align="center"><!-- tabla del mensaje de información -->
								<table cellpadding="4" cellspacing="2" border="0" width="100%">
									<c:choose>
										<c:when test="${requestScope.mensajeInfo == null}">
											<tr>
												<td align="center" class="mensaje" style="font-size: 12px;" nowrap="nowrap">Se ha llevado a cabo la operación correctamente.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td align="center" class="mensaje" style="font-size: 12px;" nowrap="nowrap"><c:out 
													value="${requestScope.mensajeInfo}" /></td>
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
				</table>
			</cmz:cuerpoPanel>
		</cmz:panel></td>
	</tr>
</table>
</body>
</html>
