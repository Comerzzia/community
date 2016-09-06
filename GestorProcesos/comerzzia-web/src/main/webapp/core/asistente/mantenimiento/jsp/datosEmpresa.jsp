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

<jsp:useBean id="asistenteConfiguracion" type="com.comerzzia.persistencia.core.empresas.AsistenteConfiguracionEmpresaBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="empresa" value="${asistenteConfiguracion.empresa}" />

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
            document.getElementById("desEmp").focus();
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
    
        function siguiente() {
        	if(checkForm()) {
        	    document.getElementById("frmDatos").submit();
        		_esperando();
        	}
        }

    	function volver(){
        	document.location.href = "inicio.screen";
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
			  <input id="accion" name="accion" type="hidden" value="leerDatosEmpresa" />
			  
			  <cmz:panel>
			    <cmz:cabeceraPanel titulo="Datos de la Empresa"></cmz:cabeceraPanel>
			    <cmz:cuerpoPanel>
					<table cellpadding="2px" cellspacing="2px" border="0px" width="100%" class="asistenteEmpresa">
						<tr>
							<td style="width:100px">Código:</td>
							<td><cmz:campoTexto id="codEmp" valor="${empresa.codEmp}"
								requerido="false" anchura="40px" longitudMaxima="4"
								soloLectura="true" /></td>
						</tr>

						<tr>
							<td>Descripción:</td>
							<td><cmz:campoTexto id="desEmp" valor="${empresa.desEmp}"
								requerido="true" anchura="280px" longitudMaxima="40" /></td>
						</tr>

						<tr>
							<td>Domicilio:</td>
							<td><cmz:campoTexto id="domicilio"
								valor="${empresa.domicilio}" requerido="false" anchura="320px"
								longitudMaxima="50" /></td>
						</tr>

						<tr>
							<td>Población:</td>
							<td><cmz:campoTexto id="poblacion"
								valor="${empresa.poblacion}" requerido="false" anchura="320px"
								longitudMaxima="50" /></td>
						</tr>

						<tr>
							<td>Provincia:</td>
							<td><cmz:campoTexto id="provincia"
								valor="${empresa.provincia}" requerido="false" anchura="320px"
								longitudMaxima="50" /></td>
						</tr>

						<tr>
							<td>CP:</td>
							<td><cmz:campoTexto id="cp" valor="${empresa.cp}"
								requerido="false" anchura="40px" longitudMaxima="8" /></td>
						</tr>

						<tr>
							<td>CIF:</td>
							<td><cmz:campoTexto id="cif" valor="${empresa.cif}"
								requerido="true" anchura="120px" longitudMaxima="20" /> <img
								src="comun/images/iconos/info.gif" align="absMiddle" border="0"
								valign="middle"
								onClick="validarCifNif(document.frmDatos.cif.value);"
								style="vertical-align:top;cursor: pointer;" alt="Validar CIF" /></td>
						</tr>

						<tr>
							<td>Teléfono 1:</td>
							<td><cmz:campoTexto id="telefono1"
								valor="${empresa.telefono1}" requerido="false" anchura="75px"
								longitudMaxima="15" /></td>
						</tr>

						<tr>
							<td>Teléfono 2:</td>
							<td><cmz:campoTexto id="telefono2"
								valor="${empresa.telefono2}" requerido="false" anchura="75px"
								longitudMaxima="15" /></td>
						</tr>

						<tr>
							<td>Fax:</td>
							<td><cmz:campoTexto id="fax" valor="${empresa.fax}"
								requerido="false" anchura="75px" longitudMaxima="15" /></td>
						</tr>
				        <tr>
				          <td valign="top">Registro Mercantil:</td>
				          <td>
				          	<cmz:campoAreaTexto id="registroMercantil" valor="${empresa.registroMercantil}" 
				          	requerido="false" longitudMaxima="255" altura="100" anchura="320"/>
                          </td>
				        </tr>
						<tr><td height="10px"></td></tr><!-- SEPARADOR -->
					</table>
					<div class="botonesAsistente">
						<cmz:boton onclick="volver();" valor="&lt;&lt; Volver" id="btnAtras" />
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
