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
	    function aceptar() {
	    	if(document.getElementById("logotipo").value == ''){
	    		alert("Debes insertar un nuevo logotipo.");
	    	}else{
	           document.frmDatos.action = "empresas?accion=salvarLogotipo";	
	           document.frmDatos.submit();
	       		_esperando();
	    	}
	    }
    </script>
  </head>

  <body>
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
          	<cmz:accionSalvar onclick="aceptar();"/>
            <cmz:accionCancelar onclick="cancelar();"/>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <form id="frmDatos" name="frmDatos" action="empresas" method="post" enctype="multipart/form-data">
			  <input id="accion" name="accion" type="hidden" value="" />
			  <input id="idObjeto" name="idObjeto" type="hidden" value="${empresa.codEmp}" />
			  <input id="estadoObjeto" name="estadoObjeto" type="hidden" value="${empresa.estadoBean}" />
			  
			  
			  <cmz:panel>
			    <cmz:cabeceraPanel titulo="Cambiar Logotipo"></cmz:cabeceraPanel>
			    <cmz:cuerpoPanel>
			      <table cellpadding="2px" cellspacing="2px" border="0px">
			        <tr>
			          <td>Nuevo Logotipo:</td>
			          <td><input type="file" id="logotipo" name="logotipo" class="campo" size="60"></td>
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
