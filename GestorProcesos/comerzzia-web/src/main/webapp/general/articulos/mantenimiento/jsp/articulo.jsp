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

<jsp:useBean id="formularioArticulo" type="com.comerzzia.web.general.articulos.ui.FormularioArticuloBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="articulo" value="${formularioArticulo.registroActivo}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    
    <script type="text/javascript">
        function inicio() {
            setFoco("codigoBarras", "desglose1", "factorConversion", "codArticulo", "desArticulo");
            if(window.mostrarCheckEscaparates){
            	mostrarCheckEscaparates();
        	}
        }
        
        function checkForm() {
            if (!esValido("codArticulo", "TEXTO", true)) {
                return false;
            }
            if (!esValido("desArticulo", "TEXTO", true)) {
                return false;
            }
            
            return true;
        }
        
    	function obtenerPorcentajeImpuestos(){
    		var codImpuestos = document.getElementById("codImpuesto").value;
    		if (codImpuestos == ""){
    			return null;
    		}
    		var response = validarArticuloTarifa();
    		if (response != null){
    	        document.getElementById("porcentajeImpuestos").value = response.getElementsByTagName('porcentajeImpuestos').item(0).firstChild.data;
    	        return document.getElementById("porcentajeImpuestos").value;
    		}
    		return null;
    	}
    	
    	function validarArticuloTarifa(){
    		var codImpuesto = document.getElementById("codImpuesto").value;
    		var codTarifa = document.getElementById("codTarifa").value;

    		var url = "articulo.tarifa.cmz?codImpuesto=" + codImpuesto
    					+ "&codTarifa=" + codTarifa;

    	    response = xmlRequest(url);        
    	    if (response != null) {
    	        if (response.getElementsByTagName("ERROR").item(0)) {
    	            alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
    	            return null;
    	        }
    	        return response;
    	    }
    	    else {
    	        alert("No se ha podido conectar con el servidor");
    	        return null;
    	    }
    	}


        function altaRapidaArticulo() {
        		document.getElementById("accion").value = "altaRapida";
            	document.getElementById("frmDatos").submit();       
            	_esperando();
        }
            
     </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <c:choose>
              <c:when test="${!formularioArticulo.editable}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Artículo"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  	<cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir un nuevo Artículo"/>
                	<cmz:accion icono="general/articulos/buscar/images/altaRapida.gif" onclick="altaRapidaArticulo();" titulo="Alta rápida" descripcion="Alta rápida de Artículos"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Artículo"></cmz:accion>
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
          <form id="frmDatos" name="frmDatos" action="articulos" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            <input id="idObjeto" name="idObjeto" type="hidden" value="${articulo.codArticulo}" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Artículo"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Código:</td>
                    <td>
                      <cmz:campoTexto id="codArticulo" valor="${articulo.codArticulo}" requerido="true" anchura="90px" longitudMaxima="13"
                                        editable="${formularioArticulo.enInsercion}" soloLectura="${!formularioArticulo.enInsercion}"/>
                    </td>
                    
                    <td>Descripción:</td>
                    <td><cmz:campoTexto id="desArticulo" valor="${articulo.desArticulo}" requerido="true" anchura="350px" longitudMaxima="45" 
                                        editable="${formularioArticulo.editable}" soloLectura="${!formularioArticulo.editable}"/></td>
                    
                    <td>
                      <input type="checkbox" value="" id="activo" name="activo" <c:if test="${articulo.activo}">checked="checked"</c:if> 
                             <c:if test="${!formularioArticulo.editable}">disabled</c:if>/>
                      Activo
                    </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <cmz:pestañas>
            	<cmz:cabeceraPestañas pestañaActiva="${formularioArticulo.pestañaActiva}">
            		<cmz:pestaña titulo="Datos Generales" accion="0" onclick="seleccionaPestaña(0);"></cmz:pestaña>
            		<cmz:pestaña titulo="Observaciones" accion="1" onclick="seleccionaPestaña(1);"></cmz:pestaña>
            		<cmz:pestaña titulo="Códigos Barra" accion="2" onclick="seleccionaPestaña(2);"></cmz:pestaña>
            		<cmz:pestaña titulo="Unidades de medida" accion="3" onclick="seleccionaPestaña(3);" width="120"></cmz:pestaña>
            		<cmz:pestaña titulo="Almacenes" accion="4" onclick="seleccionaPestaña(4);"></cmz:pestaña>
            		<cmz:pestaña titulo="Tarifas" accion="5" onclick="seleccionaPestaña(5);"></cmz:pestaña>
            		<cmz:pestaña titulo="Imágenes" accion="6" onclick="seleccionaPestaña(6);"></cmz:pestaña>
            	</cmz:cabeceraPestañas>
            	<cmz:cuerpoPestaña>
            		<c:choose>
                        <c:when test="${formularioArticulo.pestañaActiva == 1}">
                          <c:import url="observaciones.jsp"></c:import>
                        </c:when>
                        <c:when test="${formularioArticulo.pestañaActiva == 2}">
                        	<c:choose>
		                      <c:when test="${formularioArticulo.formularioPestañaActiva.modoVisualizacionFicha}">
		                        <c:import url="codigosBarrasFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
		                        <c:import url="codigosBarrasTabla.jsp"></c:import>
		                      </c:otherwise>
		                    </c:choose>
                        </c:when>
                        <c:when test="${formularioArticulo.pestañaActiva == 3}">
                        	<c:choose>
		                      <c:when test="${formularioArticulo.formularioPestañaActiva.modoVisualizacionFicha}">
		                          <c:import url="unidadesMedidasFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
			                      <c:import url="unidadesMedidasTabla.jsp"></c:import>
		                      </c:otherwise>
		                    </c:choose>
                        </c:when>
                        <c:when test="${formularioArticulo.pestañaActiva == 4}">
                        	<c:choose>
		                      <c:when test="${formularioArticulo.formularioPestañaActiva.modoVisualizacionFicha}">
		                          <c:import url="almacenesFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
			                      <c:import url="almacenesTabla.jsp"></c:import>
		                      </c:otherwise>
		                    </c:choose>
                        </c:when>
                        <c:when test="${formularioArticulo.pestañaActiva == 5}">
                        	<c:choose>
		                      <c:when test="${formularioArticulo.formularioPestañaActiva.modoVisualizacionFicha}">
		                          <c:import url="tarifasFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
			                      <c:import url="tarifasTabla.jsp"></c:import>
		                      </c:otherwise>
		                    </c:choose>
                        </c:when>
                        <c:when test="${formularioArticulo.pestañaActiva == 6}">
                        	<c:import url="fotos.jsp"></c:import>	
                        </c:when>
                        <c:otherwise>
                          <c:import url="datosGenerales.jsp"></c:import>
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
