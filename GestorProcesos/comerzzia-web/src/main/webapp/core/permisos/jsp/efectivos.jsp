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

<jsp:useBean id="permisos" type="java.util.ArrayList<com.comerzzia.persistencia.core.permisos.PermisoBean>" scope="request" />
<jsp:useBean id="accion" type="com.comerzzia.persistencia.core.acciones.AccionBean" scope="request" />
 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/mantenimiento.js"></script>

    <script type="text/javascript">
	    function aceptar() {
	    	window.close();
	    }
	    function keyDownEnter(){
			aceptar();
		}
	    function keyDownEsc(){
			aceptar();
		}
    </script>

  </head>
  
   <body onkeydown="keyDown(event);" class="ventanaModal">
     <cmz:panelPrincipal>
        <cmz:cabeceraPanelPrincipal titulo="${accion.titulo}" icono="${accion.icono}">
          <cmz:acciones numAccionesVisibles="1">
              <cmz:accionSalvar onclick="aceptar();" descripcion="Aceptar"/>	
          </cmz:acciones>
        </cmz:cabeceraPanelPrincipal>
        
        <cmz:cuerpoPanelPrincipal>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="series" method="POST" target="_self">
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Permisos Efectivos del Usuario" icono="comun/images/iconos/permisos.gif" />
              <cmz:cuerpoPanel>
	            <table cellpadding="2px" cellspacing="2px" border="0px">
	            	<c:forEach items="${permisos}" var="permiso">
		            	<tr>
							<td>
								<c:choose>
									<c:when test="${permiso.administrar}">
										<img alt="Administrar" src="core/permisos/images/permiso_administrar.png">
									</c:when>
									<c:when test="${permiso.concedido}">
										<img alt="Concedido" src="core/permisos/images/permiso_concedido.png">
									</c:when>
									<c:otherwise>
										<img alt="Denegado" src="core/permisos/images/permiso_denegado.png">
									</c:otherwise>
								</c:choose>
							</td>	
							<td>
								<c:out value="${permiso.operacion.desOperacion}" />
							</td>	
						</tr>	                
	            	</c:forEach>
	            </table>  
              </cmz:cuerpoPanel>
            </cmz:panel>
          </form>
        </cmz:cuerpoPanelPrincipal>
      </cmz:panelPrincipal>
   </body>
 </html>
