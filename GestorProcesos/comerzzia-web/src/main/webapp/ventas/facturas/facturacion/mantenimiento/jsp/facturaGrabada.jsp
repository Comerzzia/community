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

<jsp:useBean id="formularioFacturacionAlbaranesVentas" type="com.comerzzia.web.ventas.facturas.facturacion.ui.FormularioFacturacionAlbaranesVentasBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="factura" value="${formularioFacturacionAlbaranesVentas.registroActivo}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    
    <script type="text/javascript">
	    function imprimir(){
	        document.getElementById("accion").value = "ventas.facturas.infFacturaVentas";
	        document.getElementById("operacion").value = "nuevo";
			document.getElementById("frmDatos").submit();
			_esperando();
		}
    </script>
    
  </head>

  <body>
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
          	<cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir facturas" onclick="imprimir()" />
          	<cmz:accion icono="comun/images/iconos/alta.gif" onclick="volver();" titulo="Nueva factura" descripcion="Nueva factura"></cmz:accion>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="facturacionAlbaranesVentas" method="post">
         	<input id="accion" name="accion" type="hidden" value="" />
         	<input id="operacion" name="operacion" type="hidden" value="" />
            
            <cmz:panel>
				<cmz:cabeceraPanel titulo="Datos de la factura"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
					<table cellpadding="2px" cellspacing="2px" border="0px">
					  <tr>
						<td>Serie:</td>
						<td><cmz:ayuda nombreAyuda="SERIES" soloLectura="true">
							<cmz:codigoAyuda idCodigo="codSerie" valorCodigo="${factura.codSerie}" longitudMaximaCodigo="5" anchuraCodigo="100px" />
							<cmz:descripcionAyuda idDescripcion="desSerie"	valorDescripcion="${factura.desSerie}" anchuraDescripcion="300px" />
						</cmz:ayuda></td>
					  </tr>
				      <tr>
				        <td>Numero Factura:</td>
				        <td>
				          <cmz:campoTexto id="primerNumFactura" valor="${formularioFacturacionAlbaranesVentas.primeraFactura}" editable="false" 
				          	soloLectura="true" anchura="100"></cmz:campoTexto>
				          <c:if test="${formularioFacturacionAlbaranesVentas.primeraFactura != formularioFacturacionAlbaranesVentas.ultimaFactura}">
				          &nbsp;hasta&nbsp;
				          <cmz:campoTexto id="ultimoNumFactura" valor="${formularioFacturacionAlbaranesVentas.ultimaFactura}" editable="false" 
				          	soloLectura="true" anchura="100"></cmz:campoTexto>
				          </c:if>
				        </td>
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
