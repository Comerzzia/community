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
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="formularioConformacionFacturas" type="com.comerzzia.web.compras.facturas.conformacion.ui.FormularioConformacionFacturasBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="factura" value="${formularioConformacionFacturas.registroActivo}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    
    <script type="text/javascript">
        function inicio() {
        }
        
        function checkForm() {
        	return true;
        }

        function volver() {
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("operacion").value = "pestaña";
        	document.getElementById("indice").value = 0;
            document.getElementById("frmDatos").submit();
        	_esperando();
        }

    </script>
  </head>

  <body  onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="3">
          	<c:if test="${formularioConformacionFacturas.enInsercion}">
          		<cmz:accionSalvar onclick="aceptar()" titulo="Grabar Factura"/>
          		<cmz:accionCancelar onclick="cancelar();"/>
          	</c:if>
          	<cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="conformacionFacturas" method="post">
         	<input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            
            <table cellpadding="2px" cellspacing="2px" border="0px">
				<tr>
					<td>Total Factura:</td>
					<td><cmz:campoTexto id="total" anchura="100px" editable="false" soloLectura="true" >
						<cmz:formateaNumero valor="${factura.total}" numDecimales="2"></cmz:formateaNumero>
						</cmz:campoTexto>
					</td>
				</tr>
			</table>
			
			<c:choose>
				<c:when	test="${formularioConformacionFacturas.formularioPestañaActiva.modoVisualizacionFicha}">
					<c:import url="pagosFicha.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="pagosTabla.jsp"></c:import>
				</c:otherwise>
			</c:choose>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
