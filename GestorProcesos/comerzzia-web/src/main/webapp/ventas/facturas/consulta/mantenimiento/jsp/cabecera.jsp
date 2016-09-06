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

<c:set var="factura" value="${formularioFacturaVenta.registroActivo}" />


            <cmz:panel>
              <cmz:cabeceraPanel titulo="Cliente"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  
                  <tr>
                    <td>Domicilio:</td>
                    <td><cmz:campoTexto id="domicilio" valor="${factura.domicilio}" requerido="false" anchura="300px" longitudMaxima="50" 
                                        editable="${formularioFacturaVenta.editable}" soloLectura="${!formularioFacturaVenta.editable}"/></td>
                  </tr>
                  <tr>
                    <td>Población:</td>
                    <td><cmz:campoTexto id="poblacion" valor="${factura.poblacion}" requerido="false" anchura="300px" longitudMaxima="50" 
                                        editable="${formularioFacturaVenta.editable}" soloLectura="${!formularioFacturaVenta.editable}"/></td>
                  </tr>
                  <tr>
                    <td>Provincia:</td>
                    <td><cmz:campoTexto id="provincia" valor="${factura.provincia}" requerido="false" anchura="150px" longitudMaxima="50" 
                                        editable="${formularioFacturaVenta.editable}" soloLectura="${!formularioFacturaVenta.editable}"/></td>
                  </tr>
                  <tr>
                    <td>Código Postal:</td>
                    <td><cmz:campoTexto id="cp" valor="${factura.cp}" requerido="false" anchura="40px" longitudMaxima="8" 
                                        editable="${formularioFacturaVenta.editable}" soloLectura="${!formularioFacturaVenta.editable}"/></td>
                  </tr>
                  <tr>
                    <td>CIF:</td>
                    <td><cmz:campoTexto id="cif" valor="${factura.cif}" requerido="false" anchura="75px" longitudMaxima="20" 
                                        editable="${formularioFacturaVenta.editable}" soloLectura="${!formularioFacturaVenta.editable}"/></td>
                  </tr>
                  
                  </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <table cellpadding="2px" cellspacing="2px" border="0px">
				  <tr>
					<td>Concepto:</td>
					<td><cmz:campoTexto id="concepto" valor="${factura.concepto}" requerido="false" editable="${formularioFacturaVenta.enInsercion}" 
							soloLectura="${!formularioFacturaVenta.enInsercion}" anchura="250px" longitudMaxima="50"/></td>
				  </tr>
				  <tr>
					<td>Serie de la factura:</td>
					<td colspan="3"><cmz:ayuda nombreAyuda="SERIES" requerido="false" soloLectura="${!formularioFacturaVenta.enInsercion}">
						<cmz:codigoAyuda idCodigo="codSerie" valorCodigo="${factura.codSerie}" longitudMaximaCodigo="5" anchuraCodigo="100px" />
						<cmz:descripcionAyuda idDescripcion="desSerie"	valorDescripcion="${factura.desSerie}" anchuraDescripcion="300px" />
					</cmz:ayuda></td>
				  </tr>
                  <tr>
                    <td valign="top">Observaciones:</td>
                    <td><cmz:campoAreaTexto id="observaciones" valor="${factura.observaciones}" requerido="false" anchura="300px" altura="80" longitudMaxima="255" 
                                        editable="${formularioFacturaVenta.editable}" soloLectura="${!formularioFacturaVenta.editable}"/></td>
                  </tr>
              </table>
            
                     
