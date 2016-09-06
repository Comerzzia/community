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

<jsp:useBean id="almacen" type="com.comerzzia.persistencia.general.almacenes.AlmacenBean" scope="session" />
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
            document.getElementById("codAlm").focus();
        }
        
        function checkForm() {
        	if(!esValido("codAlm", "TEXTO", true))
            	return false;
        	if(!esValido("desAlm", "TEXTO", true))
            	return false;
        	if(!esValido("domicilio", "TEXTO", false))
            	return false;
            if(!esValido("poblacion", "TEXTO", false))
            	return false;
            if(!esValido("provincia", "TEXTO", false))
            	return false;
            if(!esValido("cp", "ENTERO", false))
            	return false;
            if(!esValido("telefono1", "ENTERO", false))
            	return false;
            if(!esValido("telefono2", "ENTERO", false))
            	return false;
            if(!esValido("fax", "ENTERO", false))
            	return false;
            if(!esValido("personaContacto", "TEXTO", false))
            	return false;
            if(!esValido("codCliente", "AYUDA", false, "desCliente", "CLIENTES"))
    	       	return false;

            return true;
        }
        
        function aceptar() {
        	if(checkForm()) {
            	codCliente = document.getElementById("codCliente").value;
                if(codCliente==null || codCliente==""){
            		if(confirm("No se ha especificado un cliente, ¿Desea crear un cliente con los datos del Almacén?")){
        	    		document.getElementById("accion").value = "salvar";
        	    		document.getElementById("frmDatos").submit();
        	    		_esperando();
            		}
                }else{
                	document.getElementById("accion").value = "salvar";
    	    		document.getElementById("frmDatos").submit();
    	    		_esperando();
                }
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
              <c:when test="${!almacen.enEdicion}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Almacén"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir un nuevo Almacén"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Almacén"></cmz:accion>
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
          <form id="frmDatos" name="frmDatos" action="almacenes" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${almacen.codAlm}" />
            <input id="estadoObjeto" name="estadoObjeto" type="hidden" value="${almacen.estadoBean}" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Almacén"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                
                  <tr>
                    <td>Código:</td>
                    <td>
                      <cmz:campoTexto id="codAlm" valor="${almacen.codAlm}" requerido="true" anchura="100px" longitudMaxima="4"
                                        editable="${almacen.estadoNuevo}" soloLectura="${!almacen.estadoNuevo}"/>
                    </td>
                    
                    <td>
                      <input type="checkbox" value="" id="activo" name="activo" <c:if test="${almacen.activo}">checked="checked"</c:if> 
                             <c:if test="${!almacen.enEdicion}">disabled</c:if>/>
                      Activo
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Descripción:</td>
                    <td><cmz:campoTexto id="desAlm" valor="${almacen.desAlm}" requerido="true" anchura="320px" longitudMaxima="45" 
                                        editable="${almacen.enEdicion}" soloLectura="${!almacen.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Domicilio:</td>
                    <td><cmz:campoTexto id="domicilio" valor="${almacen.domicilio}" anchura="320px" longitudMaxima="50" 
                                        editable="${almacen.enEdicion}" soloLectura="${!almacen.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Población:</td>
                    <td><cmz:campoTexto id="poblacion" valor="${almacen.poblacion}" anchura="320px" longitudMaxima="50" 
                                        editable="${almacen.enEdicion}" soloLectura="${!almacen.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Provincia:</td>
                    <td><cmz:campoTexto id="provincia" valor="${almacen.provincia}" anchura="320px" longitudMaxima="50" 
                                        editable="${almacen.enEdicion}" soloLectura="${!almacen.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Código Postal:</td>
                    <td><cmz:campoTexto id="cp" valor="${almacen.cp}" anchura="80px" longitudMaxima="8" 
                                        editable="${almacen.enEdicion}" soloLectura="${!almacen.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Teléfono 1:</td>
                    <td><cmz:campoTexto id="telefono1" valor="${almacen.telefono1}" anchura="120px" longitudMaxima="15" 
                                        editable="${almacen.enEdicion}" soloLectura="${!almacen.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Teléfono 2:</td>
                    <td><cmz:campoTexto id="telefono2" valor="${almacen.telefono2}" anchura="120px" longitudMaxima="15" 
                                        editable="${almacen.enEdicion}" soloLectura="${!almacen.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Fax:</td>
                    <td><cmz:campoTexto id="fax" valor="${almacen.fax}" anchura="120px" longitudMaxima="15" 
                                        editable="${almacen.enEdicion}" soloLectura="${!almacen.enEdicion}"/></td>
                  </tr>
                  <tr>
                    <td>Persona de Contacto:</td>
                    <td><cmz:campoTexto id="personaContacto" valor="${almacen.personaContacto}" anchura="300px" longitudMaxima="45" 
                                        editable="${almacen.enEdicion}" soloLectura="${!almacen.enEdicion}"/></td>
                  </tr>
                  
                  <tr>
                    <td>Cliente:</td>
                    <td>
                      <cmz:ayuda requerido="false" nombreAyuda="CLIENTES" soloLectura="${!almacen.estadoNuevo}">
						<cmz:codigoAyuda idCodigo="codCliente"  longitudMaximaCodigo="11" valorCodigo="${almacen.codCliente}" anchuraCodigo="90px"></cmz:codigoAyuda>
						<cmz:descripcionAyuda idDescripcion="desCliente" anchuraDescripcion="300px" valorDescripcion="${almacen.desCliente}"></cmz:descripcionAyuda>
					  </cmz:ayuda>
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
