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

<jsp:useBean id="formularioUsuarioMiPerfil" type="com.comerzzia.web.core.usuarios.miperfil.ui.FormularioUsuarioMiPerfilBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="usuario" value="${formularioUsuarioMiPerfil.registroActivo}" />

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
        	setFoco("usuario", "desUsuario");
        }
        
        function cambiarContraseña() {
        	document.getElementById("accion").value = "ver";
			document.getElementById("operacion").value = "cambiarContraseña";
			document.getElementById("frmDatos").submit();
			_esperando();
        }

        function checkFormContraseña() {
            var password = document.getElementById("password").value;
            var confirma = document.getElementById("confirma").value;
            if(password != confirma){
                window.alert("Las contraseñas no son iguales");
                return false;
            }
            return true;
        }

        function aceptarContraseña() {
        	if(checkFormContraseña()) {
        		if (document.getElementById("antigua").value.length == 0){
		    		document.getElementById("claveAnt").value = "";
		    	}
                else {
		    		document.getElementById("claveAnt").value = hex_md5(document.getElementById("antigua").value);
		    	}
          
        		if (document.getElementById("password").value.length == 0){
		    		document.getElementById("clave").value = "";
		    	}
                else {
		    		document.getElementById("clave").value = hex_md5(document.getElementById("password").value);
		    	}
                
                document.getElementById("accion").value = "cambiarContrasena";  
                document.getElementById("frmDatos").submit();	
          	    _esperando();
        	}
        }

        function cancelarContraseña() {
        	document.getElementById("accion").value = "ejecutar";
			document.getElementById("frmDatos").submit();
			_esperando();
        }
     </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="1">
          	<cmz:accion icono="comun/images/iconos/clave.gif" onclick="cambiarContraseña();" titulo="Cambiar Contraseña" descripcion="Cambiar Contraseña"></cmz:accion>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="miPerfil" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="clave" name="clave" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>  
            <input id="clave" name="clave" type="hidden" value="" />
            <input id="claveAnt" name="claveAnt" type="hidden" value="" />          

            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Usuario"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Usuario:</td>
                    <td>
                      <cmz:campoTexto id="usuario" valor="${usuario.usuario}" requerido="true" anchura="180px" longitudMaxima="20"
                                        editable="${formularioUsuarioMiPerfil.enInsercion}" soloLectura="${!formularioUsuarioMiPerfil.enInsercion}"/>
                    </td>
                    
                    <td>
                      <input type="checkbox" value="" id="activo" name="activo" <c:if test="${usuario.activo}">checked="checked"</c:if> 
                             <c:if test="${!formularioUsuarioMiPerfil.editable}">disabled</c:if>/>
                      Activo
                    </td>
                  </tr>
					
				  <tr>
                    <td>Descripción:</td>
                    <td><cmz:campoTexto id="desUsuario" valor="${usuario.desUsuario}" requerido="true" anchura="350px" longitudMaxima="50" 
                                        editable="${formularioUsuarioMiPerfil.editable}" soloLectura="${!formularioUsuarioMiPerfil.editable}"/></td>
				  </tr>	                  
				
				  <tr>
					<td>Aplicación por defecto:</td>
					<td>
					  <cmz:ayuda nombreAyuda="APLICACIONES" soloLectura="${!formularioUsuarioMiPerfil.editable}">
						<cmz:codigoAyuda idCodigo="codAplicacion" valorCodigo="${usuario.aplicacion}"></cmz:codigoAyuda>
						<cmz:descripcionAyuda idDescripcion="desAplicacion" anchuraDescripcion="200px" valorDescripcion="${usuario.aplicacion}"></cmz:descripcionAyuda>
					  </cmz:ayuda>
					</td>
					
					<td>
					  <input type="checkbox" id="cambiarAplicacion" name="cambiarAplicacion" value="" <c:if test="${usuario.puedeCambiarAplicacion}">checked="checked"</c:if> 
		                <c:if test="${!formularioUsuarioMiPerfil.editable}">disabled</c:if>/>Puede cambiar de aplicación
					</td>
				  </tr>
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
		                <td>Antigua contraseña:</td>
		                <td>
		                   <input id="antigua" name="antigua" type="password" value="" class="campo" maxlength="20" width="180px" style="width:180px;" />
		                </td>
					  </tr>
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
            	<cmz:cabeceraPestañas pestañaActiva="${formularioUsuarioMiPerfil.pestañaActiva}">
            		<cmz:pestaña titulo="Perfiles" accion="0" onclick="seleccionaPestaña(0);"></cmz:pestaña>
            		<cmz:pestaña titulo="Almacenes" accion="1" onclick="seleccionaPestaña(1);"></cmz:pestaña>
            	</cmz:cabeceraPestañas>
            	<cmz:cuerpoPestaña>
            		<c:choose>
                        <c:when test="${formularioUsuarioMiPerfil.pestañaActiva == 1}">
		                    <c:import url="almacenesTabla.jsp"></c:import>
                        </c:when>
                        <c:otherwise>
                        	<c:import url="perfilesTabla.jsp"></c:import>
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
