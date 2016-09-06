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
<%@ page import="java.util.*" %>

<c:choose>
  <c:when test="${!empty requestScope.nextPage}">
    <c:set var="nextPage" value="${requestScope.nextPage}" />
  </c:when>
  <c:otherwise>
    <c:set var="nextPage" value="inicio.screen" />
  </c:otherwise>
</c:choose>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script language="javascript">
        function aceptar() {
        	document.frmDatos.action = "<c:out value="${nextPage}"/>";
			document.frmDatos.submit();
        }
        
        function cerrar() {
            window.close();
        }
        
        function keyDown() {
            if (event.keyCode == 13) {
                aceptar();
            }
        }
    </script>
    
  </head>

  <body onkeydown="keyDown();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="Error" icono="comun/images/iconos/stop2.png"></cmz:cabeceraPanelCMZ>
          <cmz:cuerpoPanelCMZ alineacion="center">
          	<form id="frmDatos" name="frmDatos" method="post" action="">
	          	<table width="50%" align="center">
	          		<tr>
	          			<td>
	          				<cmz:panel>
				            	<cmz:cuerpoPanel alineacion="center">
				            		<table align="center" width="500px;">
				            			<tr>
				            				<td onclick="JavaScript:mostrarException()"><img src='<c:url value="comun/images/iconos/stop.png"/>'></td>
				            				<td>
												<table border="0" align="center" cellspacing="2"
				                                  cellpadding="2">
				                                  <tr>
				                                    <td align="center"><!-- tabla del mensaje-->
				                                    	<table cellpadding="4" cellspacing="2" border="0" width="100%">
															<tr>
																<td align="center" class="mensaje"
																	style="font-size: 12px;">SÓLO DISPONE DE ACCESO AL ALMACÉN ACTUAL <c:out value="${requestScope.desAlmacen}"/>. CONTACTE CON EL ADMINISTRADOR.</td>
															</tr>

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
														        <input type="button"  value="Aceptar" class="boton" onclick="JavaScript:aceptar()" style="width: 80px">
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
				            </cmz:panel>
	          			</td>
	          		</tr>
	          	</table>
          	</form>
          </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
