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

<jsp:useBean id="formularioConformacionFacturas" type="com.comerzzia.web.compras.facturas.conformacion.ui.FormularioConformacionFacturasBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    
    <script type="text/javascript">
        function inicio() {
        	setFoco("desProveedor");
        	<c:if test="${formularioConformacionFacturas.pestañaActiva == 0 && formularioConformacionFacturas.enInsercion}">
        	pintaCalendario("fechaRecFactura", "imgFechaRecFactura");
            pintaCalendario("fechaFacturaProveedor", "imgFechaFacturaProveedor");
            </c:if>
        }
        
        function checkForm() {
        	return true;
        }

    </script>
  </head>

  <body  onload="inicio();" onkeydown="keyDown(event);">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
          	<c:choose>
              <c:when test="${!formularioConformacionFacturas.enInsercion}">
              	<cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
              </c:when>
              <c:otherwise>
                <cmz:accion icono="comun/images/iconos/aceptar.gif" onclick="seleccionaPestaña(2);" titulo="Aceptar"></cmz:accion>
                <cmz:accionCancelar onclick="cancelar();"/>
              </c:otherwise>
            </c:choose>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="conformacionFacturas" method="post">
         	<input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            
            <cmz:pestañas>
            	<cmz:cabeceraPestañas pestañaActiva="${formularioConformacionFacturas.pestañaActiva}">
            		<cmz:pestaña titulo="Cabecera" accion="0" onclick="seleccionaPestaña(0);"></cmz:pestaña>
            		<cmz:pestaña titulo="Líneas" accion="1" onclick="seleccionaPestaña(1);"></cmz:pestaña>
            	</cmz:cabeceraPestañas>
            	<cmz:cuerpoPestaña>
					<c:choose>
						<c:when test="${formularioConformacionFacturas.pestañaActiva == 1}">
                        	<c:import url="lineas.jsp"></c:import>
                        </c:when>
                        <c:otherwise>
                          <c:import url="cabecera.jsp"></c:import>
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
