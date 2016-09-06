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

<c:set var="empresa" value="${asistente.empresa}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/mantenimiento.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    
    <script type="text/javascript">
	    function aceptar() {
	    	if(document.getElementById("logotipo").value == ''){
	    		alert("Debes insertar un logotipo.");
	    	}else{
	           document.frmDatos.action = "asistenteConfig?accion=cambiarLogo";	
	           document.frmDatos.submit();
	    	}
	    }
	    function siguiente() {
	    	document.frmDatos.action = "asistenteConfig?accion=leerLogo&operacion=siguiente";	
	    	document.frmDatos.submit();
	    }
	    function atras() {
	    	document.frmDatos.action = "asistenteConfig?accion=leerLogo&operacion=atras";	
	    	document.frmDatos.submit();
	    }
    </script>
  </head>

  <body>
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
        <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="asistenteConfig" method="post" enctype="multipart/form-data">
			  <input id="accion" name="accion" type="hidden" value="" />
			  <cmz:panel>
			    <cmz:cabeceraPanel titulo="Logotipo">
                  <cmz:acciones numAccionesVisibles="2">
                    <cmz:accionSalvar onclick="aceptar();"/>
                </cmz:acciones>
                </cmz:cabeceraPanel>
			    <cmz:cuerpoPanel>
			      <table cellpadding="2px" cellspacing="2px" border="0px" width="100%" class="asistenteEmpresa">
			        <tr style="vertical-align:top">
			          <td align="center">Logotipo: <input type="file" id="logotipo" name="logotipo" class="campo" size="60"></td>
			        </tr>
			        <tr>  
			          <td align="center">
			    		<img style="margin-right:3%" alt="Logotipo" src="logoAsistente" onError="this.src='comun/images/logos/logo_no_disponible.jpg'">
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
