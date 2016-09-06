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

<jsp:useBean id="tipoPorte" type="com.comerzzia.persistencia.ventas.tiposportes.TipoPorteBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/mantenimiento.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    
    <script type="text/javascript">
        function inicio() {
            document.getElementById("desTipoPorte").focus();
        }
        
        function checkForm() {
        	if(!esValido("desTipoPorte", "TEXTO", true))
            	return false;
        	if(!esValido("desdeVolumenVenta", "ENTERO", false))
            	return false;
        	if(!esValido("codArtPorte", "AYUDA", true, "desArtPorte", "ARTICULOS"))
                return false;
        	if(!esValido("desdeVolumenVenta", "NUMERICO", true))
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
              <c:when test="${!tipoPorte.enEdicion}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Tipo de Porte"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir un nuevo Tipo de Porte"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Tipo de Porte"></cmz:accion>
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
          <form id="frmDatos" name="frmDatos" action="tiposPortes" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${tipoPorte.idTipoPorte}" />
            <input id="estadoObjeto" name="estadoObjeto" type="hidden" value="${tipoPorte.estadoBean}" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Tipo de Porte"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Descripción:</td>
                    <td>
                    	<cmz:campoTexto id="desTipoPorte" valor="${tipoPorte.desTipoPorte}" requerido="true" anchura="320px" longitudMaxima="45" 
                             editable="${tipoPorte.enEdicion}" soloLectura="${!tipoPorte.enEdicion}"/>
                    </td>
                  </tr>
                  <tr>
                    <td>Artículo para Cobro de Portes:</td>
                    <td>
                    	<cmz:ayuda requerido="true" soloLectura="${!tipoPorte.enEdicion}" nombreAyuda="ARTICULOS">
				          	<cmz:codigoAyuda idCodigo="codArtPorte" valorCodigo="${tipoPorte.codArtPorte}" anchuraCodigo="100px" longitudMaximaCodigo="13"></cmz:codigoAyuda>
				          	<cmz:descripcionAyuda idDescripcion="desArtPorte" valorDescripcion="${tipoPorte.desArtPorte}" anchuraDescripcion="320px"></cmz:descripcionAyuda>
				        </cmz:ayuda>
					</td>
                  </tr>
                  <tr>
                    <td>Importe Mínimo de la Venta:</td>
                    <td>
                    	<cmz:campoTexto id="desdeVolumenVenta" valor="${tipoPorte.desdeVolumenVenta}" anchura="80px" longitudMaxima="7" 
                             editable="${tipoPorte.enEdicion}" soloLectura="${!tipoPorte.enEdicion}" requerido="true"/>
                    </td>
                  </tr>
                  
                  <tr>
                    <td>URL Tracking:</td>
                    <td>
                      <cmz:campoTexto id="urlTracking" valor="${tipoPorte.urlTracking}" anchura="500px" longitudMaxima="255" 
                             editable="${tipoPorte.enEdicion}" soloLectura="${!tipoPorte.enEdicion}" requerido="false"/>
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
