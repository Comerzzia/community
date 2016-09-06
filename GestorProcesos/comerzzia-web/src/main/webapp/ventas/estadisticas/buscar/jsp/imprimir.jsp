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
	        document.getElementById("fechaDesde").focus();
	        pintaCalendario("fechaDesde", "imgFechaDesde");
            pintaCalendario("fechaHasta", "imgFechaHasta");
	    }

	    function volver() {
	    	document.getElementById("frmDatos").action = "inicio.screen";
	    	document.getElementById("accion").value = "default";
	        document.getElementById("frmDatos").submit();
	    	_esperando();
	    }
	
	    function checkForm() {
			return true;
	    }
	
	    function imprimir(idVersion) {
	    	if(checkForm()) {
	            document.getElementById("accion").value = "ventas.estadisticas.lstSituacionVentas";
	            document.getElementById("operacion").value = "imprimir";
		    	document.getElementById("idVersion").value = idVersion;
	    		document.getElementById("frmDatos").target = "_blank";
	    		document.getElementById("frmDatos").submit();
	    		document.getElementById("frmDatos").target = "_self";
	    	}
	    }
    </script>
  </head>

  <body onload="inicio();" >
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
          <form id="frmDatos" name="frmDatos" action="estadisticasVentas" method="POST" target="_self">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="idVersion" name="idVersion" type="hidden" value="0" />
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Parámetros"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
	            <table cellpadding="2px" cellspacing="2px" border="0px">
	              <tr>
	                <td>Fecha desde:</td>
	                <td>
	                	<cmz:campoFecha id="fechaDesde" mostrarCheckbox="false" />
	                </td>
				  </tr>	                
	              <tr>
	                <td>Fecha hasta:</td>
	                <td>
	                	<cmz:campoFecha id="fechaHasta" mostrarCheckbox="false" />
	                </td>
				  </tr>
				  
	              <tr>
	                <td>Cliente desde:</td>
	                <td>
	                	<cmz:ayuda nombreAyuda="CLIENTES">
	                		<cmz:codigoAyuda idCodigo="codCliDesde" longitudMaximaCodigo="11" anchuraCodigo="100px"/>
	                		<cmz:descripcionAyuda idDescripcion="desCliDesde" anchuraDescripcion="320px"  />
	                	</cmz:ayuda>
	                </td>
				  </tr>	                
	              <tr>
	                <td>Cliente hasta:</td>
	                <td>
	                	<cmz:ayuda nombreAyuda="CLIENTES">
	                		<cmz:codigoAyuda idCodigo="codCliHasta" longitudMaximaCodigo="11" anchuraCodigo="100px"/>
	                		<cmz:descripcionAyuda idDescripcion="desCliHasta" anchuraDescripcion="320px" />
	                	</cmz:ayuda>
	                </td>
				  </tr>
				  
				  <tr>
	                <td>Artículo desde:</td>
	                <td>
	                	<cmz:ayuda nombreAyuda="ARTICULOS">
	                		<cmz:codigoAyuda idCodigo="codArtDesde" longitudMaximaCodigo="13" anchuraCodigo="100px"/>
	                		<cmz:descripcionAyuda idDescripcion="desArtDesde" anchuraDescripcion="320px"  />
	                	</cmz:ayuda>
	                </td>
				  </tr>	                
	              <tr>
	                <td>Artículo hasta:</td>
	                <td>
	                	<cmz:ayuda nombreAyuda="ARTICULOS">
	                		<cmz:codigoAyuda idCodigo="codArtHasta" longitudMaximaCodigo="13" anchuraCodigo="100px"/>
	                		<cmz:descripcionAyuda idDescripcion="desArtHasta" anchuraDescripcion="320px" />
	                	</cmz:ayuda>
	                </td>
				  </tr>
				  
				  <tr>
	                <td>Familia desde:</td>
	                <td>
	                	<cmz:ayuda nombreAyuda="FAMILIAS">
	                		<cmz:codigoAyuda idCodigo="codFamDesde" longitudMaximaCodigo="6" anchuraCodigo="70px"  />
	                		<cmz:descripcionAyuda idDescripcion="desFamDesde" anchuraDescripcion="200px"  />
	                	</cmz:ayuda>
	                </td>
				  </tr>	                
	              <tr>
	                <td>Familia hasta:</td>
	                <td>
	                	<cmz:ayuda nombreAyuda="FAMILIAS">
	                		<cmz:codigoAyuda idCodigo="codFamHasta" longitudMaximaCodigo="6" anchuraCodigo="70px" />
	                		<cmz:descripcionAyuda idDescripcion="desFamHasta" anchuraDescripcion="200px" />
	                	</cmz:ayuda>
	                </td>
				  </tr>
	              <tr>
	                <td colspan="2" align="right">
	                	<input type="checkbox" id="soloActivos" name="soloActivos" value="true" />&nbsp;Mostrar sólo registros activos
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
