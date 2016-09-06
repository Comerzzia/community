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

<jsp:useBean id="formularioUsuario" type="com.comerzzia.web.core.usuarios.ui.FormularioUsuarioBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="usuario" value="${formularioUsuario.registroActivo}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/md5.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    
    <script type="text/javascript">
        function inicio() {
            <c:choose>
              <c:when test="${param.operacion != 'cambiarContraseña'}">
                  setFoco("usuario", "desUsuario");
              </c:when>
              <c:otherwise>
                  setFoco("password");
              </c:otherwise>
            </c:choose>
        }
        
        function checkForm() {
            if(!esValido("usuario", "TEXTO", true)){
                return false;
            }
	        if(!esValido("desUsuario", "TEXTO", true)){
	            return false;
	        }
            
            <c:if test="${formularioUsuario.enInsercion}">
	        	if(!esValido("password", "TEXTO", false)){
	            	return false;
	        	}	
	            if(!esValido("confirma", "TEXTO", false)){
	                return false;
	            }
           		if (document.getElementById("password").value != document.getElementById("confirma").value){
               		window.alert("Las contraseñas han de ser iguales");
               		return false;
               	}
           </c:if>

            return true;
        }
    
        function aceptarUsuario() {
        	if(checkForm()) {
        		<c:if test="${formularioUsuario.enInsercion}">
          		    if (document.getElementById("password").value == ""){
          		    	document.getElementById("clave").value = "";
                 	}
          		    else{
          		    	document.getElementById("clave").value = hex_md5(document.getElementById("password").value);
          		    }
	        		
        		</c:if>
				aceptar();
        	}
        }

        function restablecerContraseña() {
        	document.getElementById("accion").value = "ver";
			document.getElementById("operacion").value = "cambiarContraseña";
			document.getElementById("frmDatos").submit();
			_esperando();
        }

        function checkFormContraseña() {
            var password = document.getElementById("password").value;
            var confirma = document.getElementById("confirma").value;
        	if(!esValido("password", "TEXTO", false)){
            	return false;
        	}	
            if(!esValido("confirma", "TEXTO", false)){
                return false;
            }
            if(password != confirma){
                window.alert("Las contraseñas no son iguales");
                return false;
            }
            return true;
        }

        function aceptarContraseña() {
        	if(checkFormContraseña()) {
        		if (document.getElementById("password").value == ""){
      		    	document.getElementById("clave").value = "";
             	}
      		    else{
      		    	document.getElementById("clave").value = hex_md5(document.getElementById("password").value);
      		    }
              document.getElementById("accion").value = "restablecerContrasena";  
              document.getElementById("frmDatos").submit();	
          	  _esperando();
        	}
        }

        function cancelarContraseña() {
        	document.getElementById("accion").value = "ver";
			document.getElementById("frmDatos").submit();
			_esperando();
        }
     </script>
  </head>

  <body  onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <c:choose>
              <c:when test="${!formularioUsuario.editable}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Usuario"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir un nuevo Usuario"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Usuario"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/clave.gif" onclick="restablecerContraseña();" titulo="Restablecer Contraseña" descripcion="Restablecer Contraseña"></cmz:accion>
                </c:if>
              </c:when>
              <c:otherwise>
              	<cmz:accionSalvar onclick="aceptarUsuario();"/>
              	<cmz:accionCancelar onclick="cancelar();"/>
              </c:otherwise>
            </c:choose>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="usuarios" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${usuario.idUsuario}" />
            <input id="clave" name="clave" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            <input id="idPerfiles" name="idPerfiles" type="hidden" value=""/>
            <input id="desPerfiles" name="desPerfiles" type="hidden" value=""/>
            <input id="codAlmacenes" name="codAlmacenes" type="hidden" value=""/>
            <input id="desAlmacenes" name="desAlmacenes" type="hidden" value=""/>

            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Usuario"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Usuario:</td>
                    <td>
                      <cmz:campoTexto id="usuario" valor="${usuario.usuario}" requerido="true" anchura="180px" longitudMaxima="20"
                                        editable="${formularioUsuario.enInsercion}" soloLectura="${!formularioUsuario.enInsercion}"/>
                    </td>
                    
                    <td>
                      <input type="checkbox" value="" id="activo" name="activo" <c:if test="${usuario.activo}">checked="checked"</c:if> 
                             <c:if test="${!formularioUsuario.editable}">disabled</c:if>/>
                      Activo
                    </td>
                  </tr>
					
				  <tr>
                    <td>Descripción:</td>
                    <td><cmz:campoTexto id="desUsuario" valor="${usuario.desUsuario}" requerido="true" anchura="350px" longitudMaxima="50" 
                                        editable="${formularioUsuario.editable}" soloLectura="${!formularioUsuario.editable}"/></td>
				  </tr>	                  
				
				  <tr>
					<td>Aplicación por defecto:</td>
					<td>
					  <cmz:ayuda nombreAyuda="APLICACIONES" soloLectura="${!formularioUsuario.editable}">
						<cmz:codigoAyuda idCodigo="codAplicacion" valorCodigo="${usuario.aplicacion}"></cmz:codigoAyuda>
						<cmz:descripcionAyuda idDescripcion="desAplicacion" anchuraDescripcion="200px" valorDescripcion="${usuario.aplicacion}"></cmz:descripcionAyuda>
					  </cmz:ayuda>
					</td>
					
					<td>
					  <input type="checkbox" id="cambiarAplicacion" name="cambiarAplicacion" value="" <c:if test="${usuario.puedeCambiarAplicacion}">checked="checked"</c:if> 
		                <c:if test="${!formularioUsuario.editable}">disabled</c:if>/>Puede cambiar de aplicación
					</td>
				  </tr>

                  <c:if test="${formularioUsuario.enInsercion}">
                    <tr>
                      <td>Contraseña:</td>
                      <td>
                        <input id="password" name="password" type="password" value="${param.password}" class="campo" maxlength="20" width="180px" style="width:180px;" />
                      </td>
                    </tr>
                    
                    <tr>
                      <td>Confirmar Contraseña:</td>
                      <td>
                        <input id="confirma" name="confirma" type="password" value="${param.confirma}" class="campo" maxlength="20" width="180px" style="width:180px;" />
                      </td>
                    </tr>
                  </c:if>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <c:if test="${param.operacion=='cambiarContraseña'}">
            	<cmz:panel>
	              <cmz:cabeceraPanel titulo="Cambiar Contraseña">
	              	<cmz:acciones>
	              		<cmz:accionSalvar onclick="aceptarContraseña();"/>
	              		<cmz:accionCancelar onclick="cancelarContraseña();"/>
	              	</cmz:acciones>
	              </cmz:cabeceraPanel>
	              <cmz:cuerpoPanel>
	                <table cellpadding="2px" cellspacing="2px" border="0px">
		              <tr>
		                <td>Nueva contraseña:</td>
		                <td>
		                   <input id="password" name="password" type="password" value="" class="campo" maxlength="20" width="180px" style="width:180px;" />
		                </td>
					  </tr>	                
		              <tr>
		                <td>Repetir contraseña:</td>
		                <td>
		                   <input id="confirma" name="confirma" type="password" value="" class="campo" maxlength="20" width="180px" style="width:180px;" />
		                </td>
					  </tr>
		            </table> 
	              </cmz:cuerpoPanel>
	            </cmz:panel>
            </c:if>
            
            <cmz:pestañas>
            	<cmz:cabeceraPestañas pestañaActiva="${formularioUsuario.pestañaActiva}">
            		<cmz:pestaña titulo="Perfiles" accion="0" onclick="seleccionaPestaña(0);"></cmz:pestaña>
            		<cmz:pestaña titulo="Almacenes" accion="1" onclick="seleccionaPestaña(1);"></cmz:pestaña>
            	</cmz:cabeceraPestañas>
            	<cmz:cuerpoPestaña>
            		<c:choose>
                        <c:when test="${formularioUsuario.pestañaActiva == 1}">
                        	<c:choose>
		                      <c:when test="${requestScope.modoFicha}">
		                        <c:import url="almacenesFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
		                        <c:import url="almacenesTabla.jsp"></c:import>
		                      </c:otherwise>
		                    </c:choose>
                        </c:when>
                        <c:otherwise>
                          <c:choose>
		                      <c:when test="${requestScope.modoFicha}">
		                          <c:import url="perfilesFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
			                      <c:import url="perfilesTabla.jsp"></c:import>
		                      </c:otherwise>
		                    </c:choose>
                        </c:otherwise>
                      </c:choose>
            	</cmz:cuerpoPestaña>
            </cmz:pestañas>

          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
