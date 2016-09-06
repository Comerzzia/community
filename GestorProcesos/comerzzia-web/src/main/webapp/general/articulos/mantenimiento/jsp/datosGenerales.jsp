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

<c:set var="articulo" value="${formularioArticulo.registroActivo}" />
<c:set var="soloLectura" value="${!formularioArticulo.editable}" />

<script type="text/javascript" language="javascript" src="ventas/tarifas/mantenimiento/js/tarifas.js"></script>
<script type="text/javascript" language="javascript" src="general/articulos/mantenimiento/js/datosGenerales.js"></script>

<script type="text/javascript">
    function checkFormPestaña() {
        if (!esValido("formato", "TEXTO", false)) {
            return false;
        }
		if (!esValido("codFamilia", "AYUDA", false, "desFamilia", "FAMILIAS")) {
			return false;
		}
		if (!esValido("codSeccion", "AYUDA", false, "desSeccion", "SECCIONES")) {
			return false;
		}
    	if (!esValido("codCategorizacion", "AYUDA", false, "desCategorizacion", "CATEGORIZACIONES")) {
			return false;
		}    	
		if (!esValido("codImpuesto", "TABLA", true, "un tipo de impuesto.")) {
			return false;
		}
		if (!esValido("codProveedor", "AYUDA", false, "desProveedor", "PROVEEDORES")) {
			return false;
		}
		if (!esValido("dtoProveedor", "NUMERICO", false, 2, false, 0, 100)) {
            return false;
        }
        if (!esValido("referencia", "TEXTO", false)) {
            return false;
        }
		if (!esValido("codFabricante", "AYUDA", false, "desFabricante", "FABRICANTES")) {
			return false;
		}
        if (!esValido("precioCosto", "NUMERICO", true, 2, true)) {
            return false;
        }
		if (document.getElementById("factorMarcaje").value == "" && document.getElementById("precioMarcaje").value == ""){
			alert("Debe indicar un factor o un precio de marcaje para poder calcular el precio aplicado.");
			document.getElementById("factorMarcaje").focus();
			return false;
		}

        return true;
    }
</script>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Organización">
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table>
			<tr>
				<td>Formato:</td>
				<td>
					<cmz:campoTexto id="formato" valor="${articulo.formato}" editable="${formularioArticulo.editable}" soloLectura="${!formularioArticulo.editable}" longitudMaxima="20" anchura="150"></cmz:campoTexto>
				</td>
			</tr>
			<tr>
				<td>Familia:</td>
				<td>
					<cmz:ayuda nombreAyuda="FAMILIAS" soloLectura="${!formularioArticulo.editable}">
						<cmz:codigoAyuda idCodigo="codFamilia" longitudMaximaCodigo="6" valorCodigo="${articulo.codFamilia}" anchuraCodigo="50px"></cmz:codigoAyuda>
						<cmz:descripcionAyuda idDescripcion="desFamilia" anchuraDescripcion="200px" valorDescripcion="${articulo.desFamilia}"></cmz:descripcionAyuda>
					</cmz:ayuda>
				</td>
			</tr>
			<tr>
				<td>Sección:</td>
				<td>
					<cmz:ayuda nombreAyuda="SECCIONES" soloLectura="${!formularioArticulo.editable}">
						<cmz:codigoAyuda idCodigo="codSeccion" longitudMaximaCodigo="4" valorCodigo="${articulo.codSeccion}" anchuraCodigo="50px"></cmz:codigoAyuda>
						<cmz:descripcionAyuda idDescripcion="desSeccion" anchuraDescripcion="200px" valorDescripcion="${articulo.desSeccion}"></cmz:descripcionAyuda>
					</cmz:ayuda>
				</td>
			</tr>
			<tr>
				<td>Categorización:</td>
				<td>
					<cmz:ayuda nombreAyuda="CATEGORIZACIONES" soloLectura="${!formularioArticulo.editable}" onclick="buscarCetgorizaciones()">
						<cmz:codigoAyuda idCodigo="codCategorizacion" longitudMaximaCodigo="20" valorCodigo="${articulo.codCategorizacion}" anchuraCodigo="100px" onchange="mostrarCheckEscaparates()"></cmz:codigoAyuda>
						<cmz:descripcionAyuda idDescripcion="desCategorizacion" anchuraDescripcion="200px" valorDescripcion="${articulo.desCategorizacion}"></cmz:descripcionAyuda>
					</cmz:ayuda>
				</td>
				<td>
					<div id="divEscaparate" style="visibility: hidden;">
						<input type="checkbox" id="escaparate" name="escaparate"  value="" <c:if test="${articulo.escaparate}">checked="checked"</c:if> 
                           		<c:if test="${!formularioArticulo.editable}">disabled</c:if>/>En Escaparate
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<table>
						<tr>
							<c:if test="${!empty formularioArticulo.tituloDesglose1}">
			        			<td>
									<input type="checkbox" id="_desglose1" name="_desglose1" value="" <c:if test="${articulo.desglose1}">checked="checked"</c:if> 
		                             	<c:if test="${!formularioArticulo.editable}">disabled</c:if>/><c:out value="${formularioArticulo.tituloDesglose1}"></c:out>
								</td>
							</c:if>
							<c:if test="${!empty formularioArticulo.tituloDesglose2}">
								<td>
									<input type="checkbox" id="desglose2" name="desglose2" value="" <c:if test="${articulo.desglose2}">checked="checked"</c:if> 
	                             		<c:if test="${!formularioArticulo.editable}">disabled</c:if>/><c:out value="${formularioArticulo.tituloDesglose2}"></c:out>
								</td>
							</c:if>
						</tr>
						<tr>
							<td>
								<input type="checkbox" id="generico" name="generico" value="" <c:if test="${articulo.generico}">checked="checked"</c:if> 
                             		<c:if test="${!formularioArticulo.editable}">disabled</c:if>/>Genérico
							</td>
              
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>Impuestos:</td>
				<td>
					<cmz:ayuda nombreAyuda="IMPUESTOS" soloLectura="${!formularioArticulo.editable}" onclick="ayudaImpuestos();">
						<cmz:codigoAyuda idCodigo="codImpuesto" longitudMaximaCodigo="1" 
							valorCodigo="${articulo.codImpuesto}" anchuraCodigo="10px"></cmz:codigoAyuda>
						<cmz:descripcionAyuda idDescripcion="desImpuesto" anchuraDescripcion="200px" 
							valorDescripcion="${articulo.desImpuesto}" editable="${formularioArticulo.editable}" ></cmz:descripcionAyuda>
					</cmz:ayuda>
				</td>
			</tr>
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Compras">
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table>
			<tr>
				<td>Proveedor:</td>
				<td>
					<cmz:ayuda nombreAyuda="PROVEEDORES" soloLectura="${!formularioArticulo.editable}">
						<cmz:codigoAyuda idCodigo="codProveedor" longitudMaximaCodigo="11" valorCodigo="${articulo.codProveedor}" anchuraCodigo="90px"></cmz:codigoAyuda>
						<cmz:descripcionAyuda idDescripcion="desProveedor" anchuraDescripcion="200px" valorDescripcion="${articulo.desProveedor}"></cmz:descripcionAyuda>
					</cmz:ayuda>
				</td>
			</tr>
			<tr>
				<td>Dto. Proveedor:</td>
				<td>
					<cmz:campoTexto id="dtoProveedor" editable="${formularioArticulo.editable}" soloLectura="${!formularioArticulo.editable}" longitudMaxima="6" anchura="40">
                      <c:if test="${articulo.dtoProveedor > 0}">
                        <cmz:formateaNumero valor="${articulo.dtoProveedor}" />
                      </c:if>
                    </cmz:campoTexto> %
				</td>
			</tr>
			<tr>
				<td>Referencia:</td>
				<td>
					<cmz:campoTexto id="referencia" valor="${articulo.referencia}" editable="${formularioArticulo.editable}" soloLectura="${!formularioArticulo.editable}" longitudMaxima="40" anchura="250"></cmz:campoTexto>
				</td>
			</tr>
			<tr>
				<td>Fabricante:</td>
				<td>
					<cmz:ayuda nombreAyuda="FABRICANTES" soloLectura="${!formularioArticulo.editable}">
						<cmz:codigoAyuda idCodigo="codFabricante" longitudMaximaCodigo="11" valorCodigo="${articulo.codFabricante}" anchuraCodigo="90px"></cmz:codigoAyuda>
						<cmz:descripcionAyuda idDescripcion="desFabricante" anchuraDescripcion="200px" valorDescripcion="${articulo.desFabricante}"></cmz:descripcionAyuda>
					</cmz:ayuda>
				</td>
			</tr>
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Precios">
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<input type="hidden" value="${articulo.articuloTarifa.codTar}" id="codTarifa" name="codTarifa"  /><!-- Tarifa general -->
		<table>
			<tr>
				<td>Precio costo:</td>
				<td>
					<cmz:campoTexto id="precioCosto" onChange="validarPrecioCosto();" editable="${formularioArticulo.editable}" 
							soloLectura="${!formularioArticulo.editable}" longitudMaxima="14" anchura="70" requerido="true">
                        <cmz:formateaNumero valor="${articulo.articuloTarifa.precioCosto}" numDecimales="2"/>
					</cmz:campoTexto>
				</td>
				<td colspan="2">
					<input type="checkbox" id="actualizacionAutomaticaCompra" name="actualizacionAutomaticaCompra"  value="" <c:if test="${articulo.actAutomaticaCosto}">checked="checked"</c:if> 
	                             		<c:if test="${!formularioArticulo.editable}">disabled</c:if>/>Act. automática al comprar
				</td>
			</tr>
			<tr>
				<td>Últ. Actualización:</td>
				<td>
					<cmz:campoTexto id="fechaUltimaActualizacion" editable="false" soloLectura="true" anchura="120px">
						<fmt:formatDate pattern="dd/MM/yyyy - HH:mm:ss" value="${articulo.fechaPrecioCosto}"/>
					</cmz:campoTexto>
				</td>
			</tr>
			<tr>
				<td>Factor marcaje:</td>
				<td>
					<cmz:campoTexto id="factorMarcaje" onChange="validarFactorMarcaje();" valor="${factorMarcaje}" 
							editable="${formularioArticulo.editable}" soloLectura="${!formularioArticulo.editable}" anchura="50" longitudMaxima="8">
                        <cmz:formateaNumero valor="${articulo.articuloTarifa.factorMarcaje}" numDecimales="2"/>
					</cmz:campoTexto>
				</td>
				<td>Precio marcaje:</td>
				<td>
					<cmz:campoTexto id="precioMarcaje" onChange="validarPrecioMarcaje();" editable="${formularioArticulo.editable}" 
							soloLectura="${!formularioArticulo.editable}" longitudMaxima="14" anchura="70">
                         <cmz:formateaNumero valor="${articulo.articuloTarifa.precioMarcaje}" numDecimales="2"/>
					</cmz:campoTexto>
				</td>
				<td>Precio marcaje + impuestos:</td>
				<td>
					<cmz:campoTexto id="precioMarcajeImpuestos" onChange="validarPrecioMarcajeImpuestos();" editable="${formularioArticulo.editable}"
							soloLectura="${!formularioArticulo.editable}" longitudMaxima="14" anchura="70">
                        <cmz:formateaNumero valor="${articulo.articuloTarifa.precioMarcajeImpuestos}" numDecimales="2"/>
					</cmz:campoTexto>
				</td>
			</tr>
			<tr>
				<td>Factor aplicado:</td>
				<td>
					<cmz:campoTexto id="factorAplicado"  valor="${factorAplicado}" editable="false" soloLectura="true" anchura="50">
                        <cmz:formateaNumero valor="${articulo.articuloTarifa.factorAplicado}" numDecimales="2"/>
					</cmz:campoTexto>
				</td>
				<td>Precio venta:</td>
				<td>
					<cmz:campoTexto id="precioVenta" valor="${precioVenta}" editable="false" soloLectura="true" anchura="70">
                        <cmz:formateaNumero valor="${articulo.articuloTarifa.precioVenta}" numDecimales="4"/>
					</cmz:campoTexto>
				</td>
				<td>Precio venta + impuestos:</td>
				<td>
					<input type="hidden" value="" id="porcentajeImpuestos" name="porcentajeImpuestos"  />
					<cmz:campoTexto id="precioTotal" valor="${precioTotal}" editable="false" soloLectura="true" anchura="70">
                        <cmz:formateaNumero valor="${articulo.articuloTarifa.precioTotal}" numDecimales="2"/>
					</cmz:campoTexto>
				</td>
			</tr>
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>
