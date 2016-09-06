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

<jsp:useBean id="formularioFacturaVenta" type="com.comerzzia.web.ventas.facturas.consulta.ui.FormularioFacturaVentaBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="factura" value="${formularioFacturaVenta.registroActivo}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    
  </head>

  <body>
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="1">
            <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="facturasVentas" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            
            <cmz:panel>              
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Factura:</td>
                    <td>
                      <cmz:campoTexto id="periodo" valor="${factura.periodo}" requerido="false" anchura="40px" longitudMaxima="4"
                                        editable="${formularioFacturaVenta.enInsercion}" soloLectura="${!formularioFacturaVenta.enInsercion}"/>
                    
					  <cmz:campoTexto id="codSerie" valor="${factura.codSerie}" requerido="false" anchura="40px" longitudMaxima="5"
                                        editable="${formularioFacturaVenta.enInsercion}" soloLectura="${!formularioFacturaVenta.enInsercion}"/>
					  <cmz:campoTexto id="numFac" valor="${factura.numFactura}" requerido="false" anchura="90px" longitudMaxima="10" 
                                        editable="${formularioFacturaVenta.enInsercion}" soloLectura="${!formularioFacturaVenta.enInsercion}"/>
                    </td>                 
                    <td align="right">Fecha:</td>
                    <td><c:set var="fecha"><fmt:formatDate pattern="dd/MM/yyyy" value="${factura.fecha}"/></c:set>
                    	<cmz:campoTexto id="fecha" valor="${fecha}" requerido="false" anchura="65px" editable="${formularioFacturaVenta.editable}" 
                    					soloLectura="${!formularioFacturaVenta.editable}"/>
                    </td>
                  </tr>
                  <tr>  					
                    <td>Cliente:</td>
                    <td colspan="3">
                    	<cmz:campoTexto id="codCli" valor="${factura.codCliente}" requerido="false" anchura="90px" longitudMaxima="11" 
                                        editable="${formularioFacturaVenta.editable}" soloLectura="${!formularioFacturaVenta.editable}"/>
                    	<cmz:campoTexto id="desCli" valor="${factura.desCliente}" requerido="false" anchura="300px" longitudMaxima="45" 
                                        editable="${formularioFacturaVenta.editable}" soloLectura="${!formularioFacturaVenta.editable}"/>
                    </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <cmz:pestañas>
            	<cmz:cabeceraPestañas pestañaActiva="${formularioFacturaVenta.pestañaActiva}">
            		<cmz:pestaña titulo="Cabecera" accion="0" onclick="seleccionaPestaña(0);"></cmz:pestaña>
            		<cmz:pestaña titulo="Líneas" accion="1" onclick="seleccionaPestaña(1);"></cmz:pestaña>
            		<cmz:pestaña titulo="Pagos" accion="2" onclick="seleccionaPestaña(2);"></cmz:pestaña>         		
            	</cmz:cabeceraPestañas>
            	<cmz:cuerpoPestaña>
            		<c:choose>
                        <c:when test="${formularioFacturaVenta.pestañaActiva == 1}">
                        	<c:choose>
		                      <c:when test="${formularioFacturaVenta.formularioPestañaActiva.modoVisualizacionFicha}">
		                        <c:import url="detalleFacturaFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
		                        <c:import url="detalleFacturaTabla.jsp"></c:import>
		                      </c:otherwise>
		                    </c:choose>
                        </c:when>
                        <c:when test="${formularioFacturaVenta.pestañaActiva == 2}">
                        	<c:choose>
		                      <c:when test="${formularioFacturaVenta.formularioPestañaActiva.modoVisualizacionFicha}">
		                        <c:import url="pagosFicha.jsp"></c:import>
		                      </c:when>
		                      <c:otherwise>
		                        <c:import url="pagosTabla.jsp"></c:import>
		                      </c:otherwise>
		                    </c:choose>
                        </c:when>                          
                        <c:otherwise>
                          <c:import url="cabecera.jsp"></c:import>
                        </c:otherwise>
                     </c:choose>
            	</cmz:cuerpoPestaña>
            </cmz:pestañas>
                     
            <cmz:panel>           
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Base:</td>
                    <td>
                      <c:set var="base"><cmz:formateaNumero valor="${factura.base}" numDecimales="2"/></c:set>
                      <cmz:campoTexto id="base" valor="${base}" requerido="false" anchura="90px" longitudMaxima="13" 
                                        editable="${formularioFacturaVenta.editable}" soloLectura="${!formularioFacturaVenta.editable}"/>
                    </td>
                  
                    <td>Impuestos:</td>
                    <td>
                      <c:set var="impuestos"><cmz:formateaNumero valor="${factura.impuestos}" numDecimales="2"/></c:set>
                      <cmz:campoTexto id="impuestos" valor="${impuestos}" requerido="false" anchura="90px" longitudMaxima="13" 
                                        editable="${formularioFacturaVenta.editable}" soloLectura="${!formularioFacturaVenta.editable}"/>
                    </td>
                  
                    <td>Total:</td>
                    <td>
                      <c:set var="total"><cmz:formateaNumero valor="${factura.total}" numDecimales="2"/></c:set>
                      <cmz:campoTexto id="total" valor="${total}" requerido="false" anchura="90px" longitudMaxima="13" 
                                        editable="${formularioFacturaVenta.editable}" soloLectura="${!formularioFacturaVenta.editable}"/>
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
