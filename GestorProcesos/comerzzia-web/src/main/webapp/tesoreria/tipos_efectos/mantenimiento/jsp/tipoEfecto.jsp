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

<jsp:useBean id="tipoEfecto" type="com.comerzzia.persistencia.tesoreria.tiposefectos.TipoEfectoBean" scope="session" />
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
            document.getElementById("codTipoEfecto").focus();
        }
        
        function checkForm() {
        	if(!esValido("codTipoEfecto", "TEXTO", true))
            	return false;
        	if(!esValido("desTipoEfecto", "TEXTO", true))
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

        function onclickRemesable() {
            if (document.getElementById("remesable").checked) {
            	document.getElementById("entradaDocumentoAutomatica").disabled = false;
            }
            else {
            	document.getElementById("entradaDocumentoAutomatica").checked = false;
            	document.getElementById("entradaDocumentoAutomatica").disabled = true;
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
              <c:when test="${!tipoEfecto.enEdicion}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Tipo de Efecto"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir un nuevo Tipo de Efecto"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Tipo de Efecto"></cmz:accion>
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
          <form id="frmDatos" name="frmDatos" action="tiposEfectos" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${tipoEfecto.codTipoEfecto}" />
            <input id="estadoObjeto" name="estadoObjeto" type="hidden" value="${tipoEfecto.estadoBean}" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Tipo de Efecto"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Código:</td>
                    <td>
                      <cmz:campoTexto id="codTipoEfecto" valor="${tipoEfecto.codTipoEfecto}" requerido="true" anchura="100px" longitudMaxima="2"
                                        editable="${tipoEfecto.estadoNuevo}" soloLectura="${!tipoEfecto.estadoNuevo}"/>
                    </td>
                    
                    <td>
                      <input type="checkbox" value="" id="activo" name="activo" <c:if test="${tipoEfecto.activo}">checked="checked"</c:if> 
                             <c:if test="${!tipoEfecto.enEdicion}">disabled</c:if>/>
                      Activo
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Descripción:</td>
                    <td><cmz:campoTexto id="desTipoEfecto" valor="${tipoEfecto.desTipoEfecto}" requerido="true" anchura="320px" longitudMaxima="30" 
                                        editable="${tipoEfecto.enEdicion}" soloLectura="${!tipoEfecto.enEdicion}"/></td>
                  </tr>
                  
                  <tr>
                  	<td></td>
                    <td>
                      <input type="checkbox" value="" id="remesable" name="remesable" onclick="onclickRemesable()"
						<c:if test="${tipoEfecto.remesable}">checked="checked"</c:if>
						<c:if test="${!tipoEfecto.enEdicion}">disabled</c:if> /> Remesable
                    </td>
                  </tr>
                  
                  <tr>
                    <td></td>
                    <td>
                      <input type="checkbox" value="" id="entradaDocumentoAutomatica" name="entradaDocumentoAutomatica"
                        <c:if test="${tipoEfecto.entradaDocumentoAutomatica}">checked="checked"</c:if>
                        <c:if test="${!tipoEfecto.enEdicion || !tipoEfecto.remesable}">disabled</c:if> /> Entrada Documento automática
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
