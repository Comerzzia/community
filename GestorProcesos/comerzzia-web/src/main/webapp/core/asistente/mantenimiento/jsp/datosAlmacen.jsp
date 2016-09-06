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

<jsp:useBean id="asistenteConfiguracion" type="com.comerzzia.persistencia.core.empresas.AsistenteConfiguracionEmpresaBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="almacen" value="${asistenteConfiguracion.almacen}" />

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
            document.getElementById("desAlm").focus();
        }
        
        function checkForm() {
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
           
            return true;
        }
        
        function siguiente() {
        	if(checkForm()) {
        	    document.getElementById("operacion").value = "siguiente";
        	    document.getElementById("frmDatos").submit();
        		_esperando();
        	}
        }

        function atras() {
        	document.getElementById("operacion").value = "atras";
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }

    </script>
  </head>

  <body  onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="asistenteConfig" method="post">
            <input id="accion" name="accion" type="hidden" value="leerDatosAlmacen" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Almacén Central"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px" width="100%" class="asistenteEmpresa">
                  <tr>
                    <td style="width:110px">Código:</td>
                    <td>
                      <cmz:campoTexto id="codAlm" valor="${almacen.codAlm}" requerido="false" anchura="40px" longitudMaxima="4" soloLectura="true"/>
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Descripción:</td>
                    <td><cmz:campoTexto id="desAlm" valor="${almacen.desAlm}" requerido="true" anchura="320px" longitudMaxima="45"/></td>
                  </tr>
                  <tr>
                    <td>Domicilio:</td>
                    <td><cmz:campoTexto id="domicilio" valor="${almacen.domicilio}" anchura="320px" longitudMaxima="50" /></td>
                  </tr>
                  <tr>
                    <td>Población:</td>
                    <td><cmz:campoTexto id="poblacion" valor="${almacen.poblacion}" anchura="320px" longitudMaxima="50"/></td>
                  </tr>
                  <tr>
                    <td>Provincia:</td>
                    <td><cmz:campoTexto id="provincia" valor="${almacen.provincia}" anchura="320px" longitudMaxima="50"/></td>
                  </tr>
                  <tr>
                    <td>Código Postal:</td>
                    <td><cmz:campoTexto id="cp" valor="${almacen.cp}" anchura="40px" longitudMaxima="8"/></td>
                  </tr>
                  <tr>
                    <td>Teléfono 1:</td>
                    <td><cmz:campoTexto id="telefono1" valor="${almacen.telefono1}" anchura="75px" longitudMaxima="15"/></td>
                  </tr>
                  <tr>
                    <td>Teléfono 2:</td>
                    <td><cmz:campoTexto id="telefono2" valor="${almacen.telefono2}" anchura="75px" longitudMaxima="15"/></td>
                  </tr>
                  <tr>
                    <td>Fax:</td>
                    <td><cmz:campoTexto id="fax" valor="${almacen.fax}" anchura="75px" longitudMaxima="15"/></td>
                  </tr>
                  <tr>
                    <td>Persona de Contacto:</td>
                    <td><cmz:campoTexto id="personaContacto" valor="${almacen.personaContacto}" anchura="320px" longitudMaxima="45"/></td>
                  </tr>
                  <tr>
                  	<td></td>
                    <td>
                      <input type="checkbox" value="" id="ventaPublico" name="ventaPublico" 
                      	<c:if test="${asistenteConfiguracion.ventaPublico}">checked="checked"</c:if>/>
                      Este Almacén es una Tienda
                    </td>
                  </tr>
                  <tr><td height="10px"></td></tr><!-- SEPARADOR -->
                </table>
                <div class="botonesAsistente">
					<cmz:boton onclick="atras();" valor="&lt;&lt; Atrás" id="btnAtras" />
					<cmz:boton onclick="siguiente();" valor="Siguiente &gt;&gt;" id="btnSiguiente" />
				</div>
              </cmz:cuerpoPanel>
            </cmz:panel>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
