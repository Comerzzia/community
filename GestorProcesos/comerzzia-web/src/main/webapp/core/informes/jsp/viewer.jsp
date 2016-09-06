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

<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />
<jsp:useBean id="trabajoInforme" type="com.comerzzia.persistencia.core.informes.TrabajoInformeBean" scope="session" />

<html>
<head>
	<title>Comerzzia - <c:out value="${trabajoInforme.titulo}" /></title>
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
</head>

<script type="text/javascript">
	function cerrar() {
		window.close();
	}
</script>

<body class="ventanaModal"  BGCOLOR="#ffffff" LINK="#000099">
	<cmz:panelPrincipal>
    	<cmz:cabeceraPanelPrincipal titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
      		<cmz:acciones numAccionesVisibles="1">
      			<cmz:accion onclick="cerrar();" titulo="Cerrar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
      		</cmz:acciones>
      	</cmz:cabeceraPanelPrincipal>
	    <cmz:cuerpoPanelPrincipal>
			<APPLET archive="jasperViewerApplet.jar, 
							lib/jcommon-1.0.15.jar,
							lib/poi-3.2-FINAL.jar, 
							lib/jfreechart-1.0.12.jar, 
							lib/xml-apis-ext-1.3.04.jar, 
							lib/batik-anim-1.7.jar, 
							lib/batik-awt-util-1.7.jar, 
							lib/batik-ext-1.7.jar, 
							lib/batik-parser-1.7.jar, 
							lib/batik-script-1.7.jar, 
							lib/batik-xml-1.7.jar, 
							lib/batik-css-1.7.jar, 
							lib/batik-util-1.7.jar, 
							lib/batik-gvt-1.7.jar, 
							lib/batik-dom-1.7.jar, 
							lib/batik-svg-dom-1.7.jar, 
							lib/batik-bridge-1.7.jar, 
							lib/jasperreports-3.5.2.jar, 
							lib/commons-logging-1.1.jar, 
							lib/barcode4j-2.0.jar, 
							lib/commons-collections-3.1.jar, 
							lib/iText-2.1.4.jar" 
					codebase="<c:out value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/core/informes/applet/" />"
					code="com.comerzzia.web.core.informes.applet.EmbeddedViewerApplet.class" 
        			width="100%" 
        			height="100%" 
    	    		align="middle">
                <div style="margin-left: 10px">
                  <br/>
                  <img src="comun/images/iconos/error_pequeno.png" alt="Error" title="Error" border="0" style="vertical-align: middle"/>
                  <span style="color: red">No existe ninguna máquina virtual Java instalada para este navegador.</span>
                  Puede descargarsela pulsando <a style="text-decoration: underline;color: blue;" href="http://www.java.com/es/download/" target="_blank">aquí</a>
                </div>
                
		    	<PARAM NAME="JASPER_PRINT_URL" VALUE ="<c:out value="${pageContext.request.contextPath}/informes" />">
			</APPLET>
		</cmz:cuerpoPanelPrincipal>
	</cmz:panelPrincipal>
</body>

</html>
