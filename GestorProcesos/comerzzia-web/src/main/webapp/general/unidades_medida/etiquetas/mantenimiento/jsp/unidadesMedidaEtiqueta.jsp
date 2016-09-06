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

<jsp:useBean id="umEtiqueta" type="com.comerzzia.persistencia.general.unidadesmedida.etiquetas.UnidadesMedidaEtiquetasBean" scope="session" />
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
            document.getElementById("cod_UM_Etiqueta").focus();
        }
        
        function checkForm() {
        	if(!esValido("cod_UM_Etiqueta", "TEXTO", true))
            	return false;
        	if(!esValido("des_UM_Etiqueta", "TEXTO", true))
            	return false;
        	if(!esValido("desEtiqueta", "TEXTO", true))
            	return false;
            if(!esValido("factor", "ENTERO", true))
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
              <c:when test="${!umEtiqueta.enEdicion}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Unidades de Medida de Etiquetas"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir una nueva Unidad de Medida de Etiqueta"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Unidad de Medida de Etiqueta"></cmz:accion>
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
          <form id="frmDatos" name="frmDatos" action="unidadesMedidaEtiquetas" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${umEtiqueta.cod_UM_Etiqueta}" />
            <input id="estadoObjeto" name="estadoObjeto" type="hidden" value="${umEtiqueta.estadoBean}" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos de la Unidad de Medida de Etiqueta"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Código:</td>
                    <td>
                      <cmz:campoTexto id="cod_UM_Etiqueta" valor="${umEtiqueta.cod_UM_Etiqueta}" requerido="true" anchura="40px" longitudMaxima="4"
                                        editable="${umEtiqueta.estadoNuevo}" soloLectura="${!umEtiqueta.estadoNuevo}"/>
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Descripción:</td>
                    <td><cmz:campoTexto id="des_UM_Etiqueta" valor="${umEtiqueta.des_UM_Etiqueta}" requerido="true" anchura="150px" longitudMaxima="20" 
                                        editable="${umEtiqueta.enEdicion}" soloLectura="${!umEtiqueta.enEdicion}"/></td>
                  </tr>
                  
                  <tr>
                    <td>Descripción de Etiqueta:</td>
                    <td><cmz:campoTexto id="desEtiqueta" valor="${umEtiqueta.desEtiqueta}" requerido="true" anchura="90px" longitudMaxima="10" 
                                        editable="${umEtiqueta.enEdicion}" soloLectura="${!umEtiqueta.enEdicion}"/></td>
                  </tr>
                  
                  <tr>
                    <td>Factor:</td>
                    <td><cmz:campoTexto id="factor" valor="${umEtiqueta.factor}" requerido="true" anchura="90px" longitudMaxima="10" 
                                        editable="${umEtiqueta.enEdicion}" soloLectura="${!umEtiqueta.enEdicion}"/></td>
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
