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

<jsp:useBean id="paramBuscarAlbaranesVentasNoFacturados" type="com.comerzzia.persistencia.ventas.albaranes.ParametrosBuscarAlbaranesVentasBean" scope="session" />
<jsp:useBean id="formularioFacturacionAlbaranesVentas" type="com.comerzzia.web.ventas.facturas.facturacion.ui.FormularioFacturacionAlbaranesVentasBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="factura" value="${formularioFacturacionAlbaranesVentas.registroActivo}" />

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
        	<c:if test="${(paramBuscarAlbaranesVentasNoFacturados.codClienteHasta == '') || (paramBuscarAlbaranesVentasNoFacturados.codClienteDesde == paramBuscarAlbaranesVentasNoFacturados.codClienteHasta)}">
        		setFoco("desCliente");
        	</c:if>
        	pintaCalendario("fecha", "imgFecha");
        }
        
        function checkForm() {
        	<c:if test="${(paramBuscarAlbaranesVentasNoFacturados.codClienteHasta == '') || (paramBuscarAlbaranesVentasNoFacturados.codClienteDesde == paramBuscarAlbaranesVentasNoFacturados.codClienteHasta)}">
	    		if (!esValido("desCliente", "TEXTO", true)) {
	    	        return false;
	    		}
	    		if (!esValido("domicilio", "TEXTO", false)) {
	    	        return false;
	    	    }
	    	    if (!esValido("poblacion", "TEXTO", false)) {
	    	        return false;
	    	    }
	    	    if (!esValido("provincia", "TEXTO", false)) {
	    	        return false;
	    	    }
	    	    if (!esValido("cp", "ENTERO", false)) {
	    	        return false;
	    	    }
	    	    if(!esValido("cif", "TEXTO", true)) {
	                return false;
	    	    }
        	</c:if>
    	    if(!esValido("fecha", "FECHA", true)) {
                return false;
    	    }
    	    if(!esValido("codSerie", "AYUDA", true, "desSerie", "SERIES")){
    	       	return false;
    	    }
    	    if (!esValido("observaciones", "TEXTO", false)) {
                return false;
            }
            
    	    return true;
        }

    </script>
  </head>

  <body  onload="inicio();" onkeydown="keyDown(event);">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <cmz:accionSalvar onclick="aceptar();"/>
            <cmz:accionCancelar onclick="cancelar();"/>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="facturacionAlbaranesVentas" method="post">
         	<input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            
            <c:if test="${(paramBuscarAlbaranesVentasNoFacturados.codClienteHasta == '') || (paramBuscarAlbaranesVentasNoFacturados.codClienteDesde == paramBuscarAlbaranesVentasNoFacturados.codClienteHasta)}">
				<cmz:panel>
					<cmz:cabeceraPanel titulo="Cliente"></cmz:cabeceraPanel>
					<cmz:cuerpoPanel>
						<table cellpadding="2px" cellspacing="2px" border="0px">
							  <tr>
							    <td>Cliente:</td>
							    <td><cmz:campoTexto id="codCliente" valor="${factura.codCliente}" anchura="100px" editable="false" soloLectura="true"/></td>
						        <td><cmz:campoTexto id="desCliente" valor="${factura.desCliente}" editable="${formularioFacturacionAlbaranesVentas.enInsercion}" 
						        		soloLectura="${!formularioFacturacionAlbaranesVentas.enInsercion}" requerido="true" anchura="300px" longitudMaxima="45"/></td>
							  </tr>			  
							  <tr>	        
						        <td>Domicilio:</td>
						        <td colspan="2"><cmz:campoTexto id="domicilio" valor="${factura.domicilio}" editable="${formularioFacturacionAlbaranesVentas.enInsercion}" 
						        		soloLectura="${!formularioFacturacionAlbaranesVentas.enInsercion}" anchura="300px" longitudMaxima="50"/></td>
						      </tr>  		
							  <tr>	        
						        <td>Población:</td>
						        <td colspan="2"><cmz:campoTexto id="poblacion" valor="${factura.poblacion}" editable="${formularioFacturacionAlbaranesVentas.enInsercion}" 
						        		soloLectura="${!formularioFacturacionAlbaranesVentas.enInsercion}" anchura="300px" longitudMaxima="50"/></td>
						      </tr>  		
							  <tr>	        
						        <td>Provincia:</td>
						        <td colspan="2"><cmz:campoTexto id="provincia" valor="${factura.provincia}" editable="${formularioFacturacionAlbaranesVentas.enInsercion}" 
						        		soloLectura="${!formularioFacturacionAlbaranesVentas.enInsercion}" anchura="300px" longitudMaxima="50"/></td>
						      </tr>		      
						      <tr>	  
						        <td>Código Postal:</td>
						        <td colspan="2"><cmz:campoTexto id="cp" valor="${factura.cp}" editable="${formularioFacturacionAlbaranesVentas.enInsercion}" 
						        		soloLectura="${!formularioFacturacionAlbaranesVentas.enInsercion}" anchura="100px" longitudMaxima="8"/></td>
						      </tr> 		      
						      <tr>
						        <td>CIF:</td>
						        <td colspan="2">
						          <cmz:campoTexto id="cif" valor="${factura.cif}" requerido="true" editable="${formularioFacturacionAlbaranesVentas.enInsercion}" 
						          		soloLectura="${!formularioFacturacionAlbaranesVentas.enInsercion}" anchura="120px" longitudMaxima="20"/>
								  <img src="comun/images/iconos/info.gif" align="absMiddle" border="0" valign="middle" onClick="validarCifNif(document.frmDatos.cif.value)" style="cursor: pointer;" alt="Validar CIF"/>	                            
						        </td>
						      </tr> 
						      <tr>
						        <td>Medio de Pago:</td>
						        <td colspan="2">
								   <cmz:ayuda nombreAyuda="MEDIOS_PAGO_VEN" soloLectura="true">
								     <cmz:codigoAyuda idCodigo="idMedioPagoVencimiento" valorCodigo="${factura.idMedioPagoVencimiento}"></cmz:codigoAyuda>
								     <cmz:descripcionAyuda idDescripcion="desMedioPagoVencimiento" anchuraDescripcion="300px" valorDescripcion="${factura.desMedioPagoVencimiento}"></cmz:descripcionAyuda>
								   </cmz:ayuda>
						        </td>
						      </tr> 
						</table>
					</cmz:cuerpoPanel>
				</cmz:panel>
            </c:if>
			
			<cmz:panel>
				<cmz:cabeceraPanel titulo="Datos de la Factura"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
					<table cellpadding="2px" cellspacing="2px" border="0px">
						<tr>
                          <td align="right">Fecha de facturación:</td>
                          <td>
                            <cmz:campoFecha id="fecha" requerido="true" editable="${formularioFacturacionAlbaranesVentas.enInsercion}" 
											soloLectura="${!formularioFacturacionAlbaranesVentas.enInsercion}" >
								<fmt:formatDate value="${factura.fecha}" pattern="dd/MM/yyyy"/>
							</cmz:campoFecha>
                          </td>
						</tr>	
						<tr>
							<td>Concepto:</td>
							<td><cmz:campoTexto id="concepto" soloLectura="true" anchura="300px">
									Facturación desde <fmt:formatDate value="${paramBuscarAlbaranesVentasNoFacturados.fechaDesde}" pattern="dd/MM/yyyy"/> hasta <fmt:formatDate value="${paramBuscarAlbaranesVentasNoFacturados.fechaHasta}" pattern="dd/MM/yyyy"/>
								</cmz:campoTexto>
							</td>
						</tr>
						<tr>
							<td>Serie de la factura:</td>
							<td colspan="3"><cmz:ayuda nombreAyuda="SERIES" requerido="true" soloLectura="${!formularioFacturacionAlbaranesVentas.enInsercion}">
								<cmz:codigoAyuda idCodigo="codSerie" valorCodigo="${factura.codSerie}" longitudMaximaCodigo="5" anchuraCodigo="100px" />
								<cmz:descripcionAyuda idDescripcion="desSerie"	valorDescripcion="${factura.desSerie}" anchuraDescripcion="300px" />
							</cmz:ayuda></td>
						</tr>
						<tr>
							<td>Observaciones:</td>
							<td><cmz:campoAreaTexto id="observaciones"	valor="${factura.observaciones}" anchura="300px" editable="${formularioFacturacionAlbaranesVentas.enInsercion}" 
									soloLectura="${!formularioFacturacionAlbaranesVentas.enInsercion}" altura="80" longitudMaxima="255" /></td>
						</tr>
					</table>
				</cmz:cuerpoPanel>
			</cmz:panel>

			<table width="100%">
			  	 <tbody>
			  	  <tr>
			  	  	<td width="35%" valign="top">
						<cmz:panel>
						  <cmz:cabeceraPanel titulo="Suma de albaranes seleccionados"/>
						  <cmz:cuerpoPanel>
		                   	<c:choose>
			               	  <c:when test="${(paramBuscarAlbaranesVentasNoFacturados.codClienteHasta == '') || (paramBuscarAlbaranesVentasNoFacturados.codClienteDesde == paramBuscarAlbaranesVentasNoFacturados.codClienteHasta)}">
							    <table>
									<tr>
										<td>Tratamiento de impuestos:</td>
										<td><cmz:campoTexto id="desTratImp" valor="${factura.desTratImpuestos}" 
											anchura="200px" editable="false" soloLectura="true" /></td>
									</tr>
							    </table>
							    <cmz:lista>
							      <cmz:cabeceraLista>
								    <cmz:itemCabeceraLista nombre="Tipo imp." estilo="text-align: center;"></cmz:itemCabeceraLista>
							        <cmz:itemCabeceraLista nombre="Base" estilo="text-align: right;"></cmz:itemCabeceraLista>
								    <cmz:itemCabeceraLista nombre="Impuestos" estilo="text-align: right;"></cmz:itemCabeceraLista>
							        <cmz:itemCabeceraLista nombre="Total" estilo="text-align: right;"></cmz:itemCabeceraLista>
							      </cmz:cabeceraLista>
							      
							      <cmz:contenidoLista variable="impuesto" lista="${factura.detalleImpuestosAlbaranes.listaImpuestos}">
							        <c:set var="porcentajeImpuesto" value="${factura.porcentajesImpuestos.porcentajesImpuestos[impuesto.codImpuesto]}" />
							        <cmz:itemContenidoLista valor="${porcentajeImpuesto.desImpuesto}" alineacion="center"></cmz:itemContenidoLista>
							        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${impuesto.base}" numDecimales="2"/></cmz:itemContenidoLista>
							        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${impuesto.impuestos}" numDecimales="2"/></cmz:itemContenidoLista>
							        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${impuesto.total}" numDecimales="2"/></cmz:itemContenidoLista>
							      </cmz:contenidoLista>
							      
							      <tr class="fila par">
									<td style="text-align: center;font-weight:bold;"><span><c:out value="TOTAL" /></span></td>
									<td style="text-align: right;font-weight:bold;"><span><cmz:formateaNumero valor="${factura.detalleImpuestosAlbaranes.base}" numDecimales="2"/></span></td>
									<td style="text-align: right;font-weight:bold;"><span><cmz:formateaNumero valor="${factura.detalleImpuestosAlbaranes.impuestos}" numDecimales="2"/></span></td>
									<td style="text-align: right;font-weight:bold;"><span><cmz:formateaNumero valor="${factura.detalleImpuestosAlbaranes.total}" numDecimales="2"/></span></td>
								  </tr>
							    </cmz:lista>		    
			               	  </c:when>
			               	  <c:otherwise>
							    <cmz:lista>
							      <cmz:cabeceraLista>
									<cmz:itemCabeceraLista nombre="Trat. Impuestos" columna="1"></cmz:itemCabeceraLista>
			                        <cmz:itemCabeceraLista nombre="Cliente" columna="2"></cmz:itemCabeceraLista>
			                        <cmz:itemCabeceraLista nombre="Num Albaranes" columna="3"></cmz:itemCabeceraLista>
							        <cmz:itemCabeceraLista nombre="Base" estilo="text-align: right;" columna="4"></cmz:itemCabeceraLista>
								    <cmz:itemCabeceraLista nombre="Impuestos" estilo="text-align: right;" columna="5"></cmz:itemCabeceraLista>
							        <cmz:itemCabeceraLista nombre="Total" estilo="text-align: right;" columna="6"></cmz:itemCabeceraLista>
							      </cmz:cabeceraLista>
							      
			                      <cmz:contenidoLista variable="factura" lista="${requestScope.lstFacturasVenta}">
			                        <cmz:itemContenidoLista valor="${factura.desTratImpuestos}"></cmz:itemContenidoLista>
			                        <cmz:itemContenidoLista valor="${factura.desCliente}"></cmz:itemContenidoLista>
			                        <cmz:itemContenidoLista valor="${factura.numAlbaranes}"></cmz:itemContenidoLista>
			                        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${factura.base}" /></cmz:itemContenidoLista>
			                        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${factura.impuestos}" /></cmz:itemContenidoLista>
			                        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${factura.total}" /></cmz:itemContenidoLista>
			                      </cmz:contenidoLista>
							    </cmz:lista>		    
			               	  </c:otherwise>
			                </c:choose>	
						  </cmz:cuerpoPanel>
						</cmz:panel>
					</td>
				</tr>
			  </tbody>
			</table>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
