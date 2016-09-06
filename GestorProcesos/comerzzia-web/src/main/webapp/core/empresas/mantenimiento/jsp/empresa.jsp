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

<jsp:useBean id="empresa" type="com.comerzzia.persistencia.core.empresas.EmpresaBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />


<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/mantenimiento.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    
    <script type="text/javascript">
        function inicio() {
            <c:if test="${empresa.enEdicion}">
	            document.getElementById("desEmp").focus();
            </c:if>
        }
        
        function checkForm() {
            if(!esValido("desEmp", "TEXTO", true)){
                return false;
            }
            if(!esValido("domicilio", "TEXTO", false)){
                return false;
            }
            if(!esValido("poblacion", "TEXTO", false)){
                return false;
            }
            if(!esValido("provincia", "TEXTO", false)){
                return false;
            }
            if(!esValido("cp", "ENTERO", false)){
                return false;
            }
            if(!esValido("cif", "TEXTO", true)){
                return false;
            }
            if(!esValido("telefono1", "ENTERO", false)){
                return false;
            }
            if(!esValido("telefono2", "ENTERO", false)){
                return false;
            }
            if(!esValido("fax", "ENTERO", false)){
                return false;
            }
            if(!esValido("registroMercantil", "TEXTO", false)){
                return false;
            }
            return true;
        }
    
        function aceptar() {
        	if(checkForm()) {
        	    document.getElementById("accion").value = "salvar";
        	    document.getElementById("frmDatos").submit();
        		_esperando();
        	}
        }

        function cancelar() {
			ver();
        }

        function cambiarLogo() {
    	    document.getElementById("accion").value = "cambiarLogo";
    	    document.getElementById("frmDatos").submit();
        	_esperando();
        }

        function abrirAsistente(){
        	document.frmDatos.action = "asistenteConfig";
        	document.getElementById("accion").value = "ejecutar";
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
              <c:when test="${!empresa.enEdicion}">
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Empresa"></cmz:accion>
                  <cmz:accion icono="core/empresas/mantenimiento/images/cambiarLogo.gif" onclick="cambiarLogo();" titulo="Cambiar Logo" descripcion="Cambiar Logo"></cmz:accion>                
                  <c:if test="${empty empresa.desEmp}">
                    <cmz:accion icono="comun/images/menu/empresas.gif" onclick="abrirAsistente();" titulo="Asistente Configuración" descripcion="Asistente Configuración"></cmz:accion>
                  </c:if>
                  <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            	  <c:if test="${permisos.puedeAdministrar}">
              		<cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            	  </c:if>
                </c:if>
              </c:when>
              <c:otherwise>
                <cmz:accionSalvar onclick="aceptar();"/>
                <cmz:accionCancelar onclick="cancelar();"/>
              </c:otherwise>
            </c:choose>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="empresas" method="post">
			  <input id="accion" name="accion" type="hidden" value="" />
			  <input id="idObjeto" name="idObjeto" type="hidden" value="${empresa.codEmp}" />
			  <input id="estadoObjeto" name="estadoObjeto" type="hidden" value="${empresa.estadoBean}" />
			  
			  
			  <cmz:panel>
			    <cmz:cabeceraPanel titulo="Datos de la Empresa"></cmz:cabeceraPanel>
			    <cmz:cuerpoPanel>
			    	<table width="100%">
			    		<tr>
			    			<td width="500">
			    				<table cellpadding="2px" cellspacing="2px" border="0px" width="100%">
							        <tr>
							          <td>Código:</td>
							          <td>
							            <cmz:campoTexto id="codEmp" valor="${empresa.codEmp}" requerido="false" anchura="50px" longitudMaxima="4" soloLectura="true"/>
							          </td>
							        </tr>
							        
							        <tr>
							          <td>Descripción:</td>
							          <td><cmz:campoTexto id="desEmp" valor="${empresa.desEmp}" requerido="true" anchura="280px" longitudMaxima="40" 
							                              editable="${empresa.enEdicion}" soloLectura="${!empresa.enEdicion}"/></td>
							        </tr>
							        
							        <tr>
							          <td>Domicilio:</td>
							          <td><cmz:campoTexto id="domicilio" valor="${empresa.domicilio}" requerido="false" anchura="320px" longitudMaxima="50" 
							                              editable="${empresa.enEdicion}" soloLectura="${!empresa.enEdicion}"/></td>
							        </tr>
							
							        <tr>
							          <td>Población:</td>
							          <td><cmz:campoTexto id="poblacion" valor="${empresa.poblacion}" requerido="false" anchura="320px" longitudMaxima="50" 
							                              editable="${empresa.enEdicion}" soloLectura="${!empresa.enEdicion}"/></td>
							        </tr>
							
							        <tr>
							          <td>Provincia:</td>
							          <td><cmz:campoTexto id="provincia" valor="${empresa.provincia}" requerido="false" anchura="150px" longitudMaxima="50" 
							                              editable="${empresa.enEdicion}" soloLectura="${!empresa.enEdicion}"/></td>
							        </tr>
							
							        <tr>
							          <td>CP:</td>
							          <td><cmz:campoTexto id="cp" valor="${empresa.cp}" requerido="false" anchura="40px" longitudMaxima="8" 
							                              editable="${empresa.enEdicion}" soloLectura="${!empresa.enEdicion}"/></td>
							        </tr>
							
							        <tr>
							          <td>CIF:</td>
							          <td>
							          	<cmz:campoTexto id="cif" valor="${empresa.cif}" requerido="true" anchura="120px" longitudMaxima="20" 
							            				editable="${empresa.enEdicion}" soloLectura="${!empresa.enEdicion}"/>
										<c:if test="${empresa.enEdicion}">
									      <img src="comun/images/iconos/info.gif" align="absMiddle" border="0" valign="middle" onClick="validarCifNif(document.frmDatos.cif.value);" style="vertical-align:top;cursor: pointer;" alt="Validar CIF"/>
										</c:if>	                            
							          </td>
							        </tr>
							
							        <tr>
							          <td>Teléfono 1:</td>
							          <td><cmz:campoTexto id="telefono1" valor="${empresa.telefono1}" requerido="false" anchura="75px" longitudMaxima="15" 
							                              editable="${empresa.enEdicion}" soloLectura="${!empresa.enEdicion}"/></td>
							        </tr>
							
							        <tr>
							          <td>Teléfono 2:</td>
							          <td><cmz:campoTexto id="telefono2" valor="${empresa.telefono2}" requerido="false" anchura="75px" longitudMaxima="15" 
							                              editable="${empresa.enEdicion}" soloLectura="${!empresa.enEdicion}"/></td>
							        </tr>
							
							        <tr>
							          <td>Fax:</td>
							          <td><cmz:campoTexto id="fax" valor="${empresa.fax}" requerido="false" anchura="75px" longitudMaxima="15" 
							                              editable="${empresa.enEdicion}" soloLectura="${!empresa.enEdicion}"/></td>
							        </tr>

							        <tr>
							          <td valign="top">Registro Mercantil:</td>
							          <td>
							          	<cmz:campoAreaTexto id="registroMercantil" valor="${empresa.registroMercantil}" 
							          	requerido="false" longitudMaxima="255" altura="100" anchura="320" 
							          	editable="${empresa.enEdicion}" soloLectura="${!empresa.enEdicion}"/>
		                              </td>
							        </tr>
							      </table>
			    			</td>
			    			<td rowspan="10">
			    				<img alt="Logotipo" src="logoEmpresa" onError="this.src='comun/images/logos/logo_no_disponible.jpg'">
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
