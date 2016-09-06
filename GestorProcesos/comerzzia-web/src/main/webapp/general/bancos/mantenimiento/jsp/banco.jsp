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

<jsp:useBean id="banco" type="com.comerzzia.persistencia.general.bancos.BancoBean" scope="session" />
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
            document.getElementById("codBan").focus();
        }
        function checkForm() {
            if(!esValido("codBan", "TEXTO", true))
            	return false;
            if(!esValido("desBan", "TEXTO", true))
            	return false;
            if(!esValido("domicilio", "TEXTO", false))
            	return false;
            if(!esValido("poblacion", "TEXTO", false))
            	return false;
            if(!esValido("provincia", "TEXTO", false))
            	return false;
            if(!esValido("telefono1", "ENTERO", false))
            	return false;
            if(!esValido("telefono2", "ENTERO", false))
            	return false;
            if(!esValido("fax", "ENTERO", false))
            	return false;
            if(!esValido("ccc", "ENTERO", false))
            	return false;
            if(!esValido("cif", "CIF", false))
            	return false;
            if(!esValido("cp", "ENTERO", false))
            	return false;
            if(!esValido("observaciones", "TEXTO", false))
            	return false;        	
            
           
            return true;
        }
        function aceptar() {
        	if(checkForm()) {
        	    document.getElementById("accion").value = "salvar";
        	    document.getElementById("frmDatos").submit();
        		_esperando();
        	}
        }
    </script>
  </head>

  <body  onload="inicio();" onkeydown="keyDown(event);">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <c:choose>
              <c:when test="${!banco.enEdicion}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Serie"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir una nueva Serie"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Serie"></cmz:accion>
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
          <form id="frmDatos" name="frmDatos" action="bancos" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${banco.codBan}" />
            <input id="estadoObjeto" name="estadoObjeto" type="hidden" value="${banco.estadoBean}" />
            
            <cmz:mensaje/>
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Banco"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Código:</td>
                    <td>
                      <cmz:campoTexto id="codBan" valor="${banco.codBan}" requerido="true" anchura="80px" longitudMaxima="11"
                                        editable="${banco.estadoNuevo}" soloLectura="${!banco.estadoNuevo}"/>
                    </td>
                    
                    <td>
                      <input type="checkbox" value="" id="activo" name="activo" <c:if test="${banco.activo}">checked="checked"</c:if> 
                             <c:if test="${!banco.enEdicion}">disabled</c:if>/>
                      Activo
                    </td>
                  </tr>
                  <tr>
                    <td>Descripción:</td>
                    <td><cmz:campoTexto id="desBan" valor="${banco.desBan}" requerido="true" anchura="300px" longitudMaxima="45" 
                                        editable="${banco.enEdicion}" soloLectura="${!banco.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Domicilio:</td>
                    <td><cmz:campoTexto id="domicilio" valor="${banco.domicilio}" requerido="false" anchura="320px" longitudMaxima="50" 
                                        editable="${banco.enEdicion}" soloLectura="${!banco.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Población:</td>
                    <td><cmz:campoTexto id="poblacion" valor="${banco.poblacion}" requerido="false" anchura="320px" longitudMaxima="50" 
                                        editable="${banco.enEdicion}" soloLectura="${!banco.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Provincia:</td>
                    <td><cmz:campoTexto id="provincia" valor="${banco.provincia}" requerido="false" anchura="150px" longitudMaxima="50" 
                                        editable="${banco.enEdicion}" soloLectura="${!banco.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Teléfono 1:</td>
                    <td><cmz:campoTexto id="telefono1" valor="${banco.telefono1}" requerido="false" anchura="75px" longitudMaxima="15" 
                                        editable="${banco.enEdicion}" soloLectura="${!banco.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Teléfono 2:</td>
                    <td><cmz:campoTexto id="telefono2" valor="${banco.telefono2}" requerido="false" anchura="75px" longitudMaxima="15" 
                                        editable="${banco.enEdicion}" soloLectura="${!banco.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Fax:</td>
                    <td><cmz:campoTexto id="fax" valor="${banco.fax}" requerido="false" anchura="75px" longitudMaxima="15" 
                                        editable="${banco.enEdicion}" soloLectura="${!banco.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>CCC:</td>
                    <td><cmz:campoTexto id="ccc" valor="${banco.ccc}" requerido="false" anchura="150px" longitudMaxima="20" 
                                        editable="${banco.enEdicion}" soloLectura="${!banco.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>CIF:</td>
                    <td><cmz:campoTexto id="cif" valor="${banco.cif}" requerido="false" anchura="75px" longitudMaxima="20" 
                                        editable="${banco.enEdicion}" soloLectura="${!banco.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>CP:</td>
                    <td><cmz:campoTexto id="cp" valor="${banco.cp}" requerido="false" anchura="40px" longitudMaxima="8" 
                                        editable="${banco.enEdicion}" soloLectura="${!banco.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td valign="top">Observaciones:</td>
                    <td>
                    	<cmz:campoAreaTexto id="observaciones" valor="${banco.observaciones}" requerido="false" anchura="350" longitudMaxima="255"
                    	 editable="${banco.enEdicion}" soloLectura="${!banco.enEdicion}" altura="120"></cmz:campoAreaTexto>
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

