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

<jsp:useBean id="formularioTienda" type="com.comerzzia.web.general.tiendas.ui.FormularioTiendaBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />
<jsp:useBean id="asistenteTienda" type="com.comerzzia.servicios.general.tiendas.AsistenteTienda" scope="session" />

<c:set var="tienda" value="${asistenteTienda.tienda}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/md5.js"></script>
    
    <script type="text/javascript">
	    function inicio() {
			setFoco("usuario", "desUsuario");
		}
		
    	function checkForm() {
        	<c:if test="${empty tienda.usuariosNuevos}">
	    		var numChecks = document.frmDatos.usuarios.length;
	     		if(numChecks){
	    			for(i = 0; i < numChecks; i++){
	    				if(document.frmDatos.usuarios[i].checked){
	    					return true;
	    				}
	       			}
	      		}
	     		else {
	     			if(document.frmDatos.usuarios.checked) {
                        return true;
	     			}
    			}
	     		alert("Debe seleccionar un usuario o bien crear uno nuevo");
	    		return false;
    		</c:if>
    		
    		return true;
        }

        function atras() {
    		document.getElementById("accion").value = "asistenteAlta";
    		document.getElementById("operacion").value = "anterior";
    		document.getElementById("frmDatos").submit();
    		_esperando();
    	}

        function siguiente() {
    		if (checkForm()) {
    			document.getElementById("accion").value = "asistenteAlta";
    			document.getElementById("operacion").value = "siguiente";
    			document.getElementById("frmDatos").submit();
    			_esperando();
    		}
    	}

        function nuevoUsuario(){
    		document.getElementById("accion").value = "asistenteAlta";
    		document.getElementById("operacion").value = "nuevoUsuario";
    		document.getElementById("frmDatos").submit();
    		_esperando();
    	}
        
    </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="Asistente para la Creación de una Tienda" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="1">
            <cmz:accionCancelar onclick="volver();"/>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="tiendas" method="post">            
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            <input id="clave" name="clave" type="hidden" value="" />
            
            <c:choose>
				<c:when	test="${requestScope.modoFicha}">
					<c:import url="nuevoUsuario.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="usuariosTabla.jsp"></c:import>
				</c:otherwise>
			</c:choose></form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
