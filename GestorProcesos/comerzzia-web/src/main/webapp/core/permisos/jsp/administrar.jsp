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

<jsp:useBean id="misPermisos" type="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />
<jsp:useBean id="permisos" type="com.comerzzia.servicios.core.permisos.PermisosAccionBean" scope="session" />

<html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/mantenimiento.js"></script>
    <script type="text/javascript" language="javascript" src="core/permisos/js/administrar.js"></script>

  </head>
  
   <body onkeydown="keyDown(event);">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${misPermisos.accionMenu.titulo}" icono="${misPermisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
          	  <cmz:accionSalvar onclick="aceptar();" descripcion="Aceptar"/>
          	  <cmz:accionCancelar onclick="cancelar();"/>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="permisos" method="POST" target="_self">
          <input type="hidden" id="idAccion" name="idAccion" value="${permisos.accion.idAccion}" />
          <input type="hidden" id="accion" name="accion" value="" />
          <input type="hidden" id="operacion" name="operacion" value="" />
          <input type="hidden" id="idUsuario" name="idUsuario" value="" />
          <input type="hidden" id="desUsuario" name="desUsuario" value="" />
          <input type="hidden" id="idPerfil" name="idPerfil" value="" />
          <input type="hidden" id="desPerfil" name="desPerfil" value="" />
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Administración de Permisos" icono="comun/images/iconos/admin_permisos.gif">
                <cmz:acciones numAccionesVisibles="2">
                    <cmz:accion icono="comun/images/menu/perfiles.gif" onclick="addPerfil();" titulo="Añadir Perfil" descripcion="Añadir perfil"></cmz:accion>
                    <cmz:accion icono="comun/images/menu/usuarios.gif" onclick="addUsuario();" titulo="Añadir Usuario" descripcion="Añadir usuario"></cmz:accion>
                </cmz:acciones>
              </cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
	            <table cellpadding="2px" cellspacing="2px" border="0px">
					<tr>
					<td>
					<table cellspacing='1' cellpadding='1'>
					  <tr>
					    <td><!--Icono tipo id--></td><td><!--id--></td><td width="3px"><!--Separador--></td>
					    <c:forEach items="${permisos.operaciones}" var="operacion">
							<td style="padding:0 5px;writing-mode: tb-rl; filter: flipv fliph">
								<c:out value="${operacion.desOperacion}"></c:out>
							</td>
					    </c:forEach>
					    <td width="5px"><!--Separador--></td><td><!-- Botón eliminar --></td>
					    
					  </tr>
					    <c:forEach items="${permisos.listaPermisosAccion}" var="permisosEfectivos">
					    	<c:choose>
					    		<c:when test="${permisosEfectivos.permisoPerfil}">
					    			<c:set var="identificador" value="${permisosEfectivos.idPerfil}" />
					    			<c:set var="descripcion" value="${permisosEfectivos.desPerfil}" />
					    			<c:set var="tipo" value="PER" />
					    			<c:set var="img" value="perfiles" />
					    		</c:when>
					    		<c:otherwise>
					    			<c:set var="identificador" value="${permisosEfectivos.idUsuario}" />
					    			<c:set var="descripcion" value="${permisosEfectivos.desUsuario}" />
					    			<c:set var="tipo" value="USU" />
					    			<c:set var="img" value="usuarios" />
					    		</c:otherwise>
					    	</c:choose>
					    	<tr>		
					    		<td><img src="comun/images/menu/<c:out value="${img}" />.gif" /></td>		
					    		<td><c:out value="${descripcion}" /></td>
					    		<td width="3px"></td>	
					    		<c:forEach items="${permisos.operaciones}" var="operacion">
					    			<c:set var="desOperacion" value="${operacion.desOperacion}" />
					    			<c:set var="idPermiso" value="${tipo}|${identificador}|${operacion.idOperacion}" /> <!-- PER|idPerfil|idOperacion ó USU|idUsuario|idOperacion -->
					    			<c:set var="permiso" value="${permisosEfectivos.permisos[desOperacion]}" />
					    			<c:set var="imgSource" value="core/permisos/images/permiso_denegado_chico.png" />
					    			<c:set var="bytePermiso" value="0" />
					    			<c:choose>
					    				<c:when test="${permiso == null}">
							    			<c:set var="imgSource" value="core/permisos/images/permiso_heredado_chico.png" />
							    			<c:set var="bytePermiso" value="" />
					    				</c:when>
					    				<c:when test="${permiso.administrar}">
							    			<c:set var="imgSource" value="core/permisos/images/permiso_administrar_chico.png" />
							    			<c:set var="bytePermiso" value="2" />
					    				</c:when>
					    				<c:when test="${permiso.concedido}">
							    			<c:set var="imgSource" value="core/permisos/images/permiso_concedido_chico.png" />
							    			<c:set var="bytePermiso" value="1" />
					    				</c:when>
					    			</c:choose>
					    			<td align="center">
					    				<input type="hidden" id="permiso|<c:out value="${idPermiso}" />" name="permiso|<c:out value="${idPermiso}" />" value="<c:out value="${bytePermiso}" />" />
								    	<c:choose>
								    		<c:when test="${misPermisos.permisos[desOperacion].administrar}">
						    					<img style="cursor:pointer;" onclick="cambiarPermiso('<c:out value="${tipo}" />','<c:out value="${idPermiso}" />');" id="<c:out value="${idPermiso}" />" src="<c:out value="${imgSource}" />" />
								    		</c:when>
								    		<c:otherwise>
						    					<img onclick="sinPermisos('<c:out value="${desOperacion}" />');" src="<c:out value="${imgSource}" />" />
								    		</c:otherwise>
								    	</c:choose>
					    			</td>
					    		</c:forEach>	
					    	</tr>
					    </c:forEach>
					   	</table>																		
					</td>
					</tr>
	            </table>  
              </cmz:cuerpoPanel>
            </cmz:panel>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
      </cmz:main>
   </body>
</html>
