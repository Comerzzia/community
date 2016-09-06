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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />
<jsp:useBean id="trabajoInforme" type="com.comerzzia.persistencia.core.informes.TrabajoInformeBean" scope="session" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    
    <script type="text/javascript">
	    function inicio() {
	        setFoco("codConceptoAlmacen");
	        pintaCalendario("fecha", "imgFecha");
	    }
	    
	    function volver() {
	    	document.getElementById("accion").value = "verFormulario";
	        document.getElementById("frmDatos").submit();
	    	_esperando();
	    }
	
	    function checkForm() {
	    	if(!esValido("codConceptoAlmacen", "AYUDA", true, "desConceptoAlmacen", "CONCEPTOS_ALMACENES_REGU"))
    	       	return false;
        	if(!esValido("codAlmacen", "AYUDA", true, "desAlmacen", "ALMACEN"))
    	       	return false;
        	if(!esValido("fecha", "FECHA", true))
            	return false;
        	if(!validarFechaMenorIgualQueHoy(document.getElementById("fecha").value)){
        		alert("La fecha debe ser menor o igual a hoy");
            	return false;
        	}
        	
			return true;
	    }
	
	    function imprimir(idVersion) {
	    	if(checkForm()) {
	            document.getElementById("accion").value = "almacenes.lstInventarioAlmacen";
	            document.getElementById("operacion").value = "imprimir";
		    	document.getElementById("idVersion").value = idVersion;
	    		document.getElementById("frmDatos").target = "_blank";
	    		document.getElementById("frmDatos").submit();
	    		document.getElementById("frmDatos").target = "_self";
	    	}
	    }
    </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="1">
              <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="inventarios" method="POST" target="_self">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="idVersion" name="idVersion" type="hidden" value="0" />
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Parámetros"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
	            <table cellpadding="2px" cellspacing="2px" border="0px">
	              <tr>
	                <td>Concepto:</td>
	                <td>
	                	<cmz:ayuda nombreAyuda="CONCEPTOS_ALMACENES_REGU" requerido="true">
	                		<cmz:codigoAyuda idCodigo="codConceptoAlmacen" longitudMaximaCodigo="4" anchuraCodigo="40px" />
	                		<cmz:descripcionAyuda idDescripcion="desConceptoAlmacen" anchuraDescripcion="300px" editable="true" />
	                	</cmz:ayuda>
	                </td>
				  </tr>	     
	              <tr>
	                <td>Almacén:</td>
	                <td>
	                	<cmz:ayuda nombreAyuda="ALMACENES" requerido="true">
	                		<cmz:codigoAyuda idCodigo="codAlmacen" longitudMaximaCodigo="4" anchuraCodigo="40px"  />
	                		<cmz:descripcionAyuda idDescripcion="desAlmacen" anchuraDescripcion="300px" editable="true" />
	                	</cmz:ayuda>
	                </td>
				  </tr>	            
				  <tr>
	                <td>Fecha inventario:</td>
	                <td>
	                	<cmz:campoFecha id="fecha" mostrarCheckbox="false" requerido="true" editable="true" soloLectura="false"/>
	                </td>
				  </tr>	                
	            </table>  
              </cmz:cuerpoPanel>
            </cmz:panel>
            <c:import url="/core/informes/jsp/versiones.jsp"></c:import>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
