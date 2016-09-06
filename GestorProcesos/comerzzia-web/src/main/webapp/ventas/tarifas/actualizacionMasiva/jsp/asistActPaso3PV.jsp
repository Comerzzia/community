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


<script type="text/javascript">
	function checkForm() {
		var criterio = document.getElementById("criterio").value;
		var criterioSeleccionado  = (criterio != "actualizarPreciosVenta");
		var redondear = document.getElementById("redondear").checked;
		if (!criterioSeleccionado && !redondear){
			alert("Es necesario seleccionar un criterio para actualizar el precio de venta.");
			return false;
		}
		if (!criterioSeleccionado && redondear){
			return true;
		}

		if(!esValido("porcentajeIncDec", "NUMERICO", false, 2, true)) {
			return false;
		}
		if(!esValido("importeIncDec", "NUMERICO", false, 4, true)) {
			return false;
		}
		if(!esValido("factorMargen", "NUMERICO", false, 2, false, 0, 99)) {
			return false;
		}

		var porcentaje = document.getElementById("porcentajeIncDec").value;
		var incremento = document.getElementById("importeIncDec").value;
		var factor = document.getElementById("factorMargen").value;
		
		if (criterio == 'actualizarPreciosVentaPV' && porcentaje == '' && incremento == '') {
			alert("Debe indicar un porcentaje o cantidad de incremento/decremento a aplicar al precio de venta.");
			return false;
		}
		if (criterio == 'actualizarPreciosVentaPT' && porcentaje == '' && incremento == '') {
			alert("Debe indicar un porcentaje o cantidad de incremento/decremento a aplicar al precio de venta + impuestos.");
			return false;
		}
		if (criterio == 'actualizarPreciosVentaPC' && porcentaje == '' && incremento == '' && factor == '') {
			alert("Debe indicar un porcentaje o cantidad de incremento/decremento o un factor a aplicar al precio de costo.");
			return false;
		}
		return true;
	}

	function actualizarCriterio(opcion){
		document.getElementById("criterio").value = opcion.value;
		activarDesactivarCampos();
	}
	function activarDesactivarCampos(){
		if (document.getElementById("criterio").value != 'actualizarPreciosVenta'){
			activar("importeIncDec");
			activar("porcentajeIncDec");
		}
		if (document.getElementById("criterio").value != 'actualizarPreciosVentaPC'){
			document.getElementById("factorMargen").value = "";
			document.getElementById("factorMargen").readOnly = true;
			document.getElementById("factorMargen").className = "campo soloLectura";
		}
		else{
			document.getElementById("factorMargen").readOnly = false;
			document.getElementById("factorMargen").className = "campo";
		}
	}
	function activar(idCampo){
		document.getElementById(idCampo).readOnly = false;
		document.getElementById(idCampo).className = "campo";
	}
	function desactivar(idCampo){
		document.getElementById(idCampo).readOnly = true;
		document.getElementById(idCampo).className = "campo soloLectura";
	}
	function borrarCampos(indicado){
		if (indicado != document.getElementById("porcentajeIncDec")){
			document.getElementById("porcentajeIncDec").value = "";
		}
		if (indicado != document.getElementById("importeIncDec")){
			document.getElementById("importeIncDec").value = "";
		}
		if (indicado != document.getElementById("factorMargen")){
			document.getElementById("factorMargen").value = "";
		}
	}
	function inicio(){
		activarDesactivarCampos();
	}
</script>
<cmz:panel>
	<cmz:cabeceraPanel titulo="Actualización de Precios de Venta para la Tarifa ${tarifaAsistente.codTarActual}"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
				<table cellpadding="2px" cellspacing="2px" border="0px" class="actualizacionMasiva">
					<tr>
						<td>
							<input type="radio" value="actualizarPreciosVentaPV" id="criterioOpcion" name="criterioOpcion" tabindex="1"
								<c:if test="${tarifaAsistente.operacionActualizarPrecioVentaPV}">checked="checked"</c:if>
								onclick="actualizarCriterio(this);" >
							Sobre precio de venta
						</td>
						<td>% Incremento / Decremento:</td>
						<td>
							<cmz:campoTexto id="porcentajeIncDec" anchura="100px" longitudMaxima="6"  onChange="borrarCampos(this);" soloLectura="true" >
                                <cmz:formateaNumero valor="${tarifaAsistente.porcentajeIncDec}" numDecimales="2"></cmz:formateaNumero>
							</cmz:campoTexto>
						</td>
					</tr>
					<tr>
						<td>
							<input type="radio" value="actualizarPreciosVentaPT" id="criterioOpcion" name="criterioOpcion" tabindex="2"
								<c:if test="${tarifaAsistente.operacionActualizarPrecioVentaPT}">checked="checked"</c:if>
								onclick="actualizarCriterio(this);" >
							Sobre precio de venta + impuestos
						</td>
						<td>Importe incremento / decremento:</td>
						<td>
							<cmz:campoTexto id="importeIncDec" anchura="100px" longitudMaxima="14" onChange="borrarCampos(this);" soloLectura="true" >   
                              <cmz:formateaNumero valor="${tarifaAsistente.importeIncDec}" numDecimales="2"></cmz:formateaNumero>
							</cmz:campoTexto>
						</td>
					</tr>
					<tr>
						<td>
							<input type="radio" value="actualizarPreciosVentaPC" id="criterioOpcion" name="criterioOpcion" tabindex="3"
								<c:if test="${tarifaAsistente.operacionActualizarPrecioVentaPC}">checked="checked"</c:if>
								onclick="actualizarCriterio(this);" >
							Sobre precio de costo
						</td>
						
						<td>Aplicar factor de margen sobre costo:</td>
						<td>
							<cmz:campoTexto id="factorMargen" anchura="100px" longitudMaxima="6" onChange="borrarCampos(this);" soloLectura="true"  >
                              <cmz:formateaNumero valor="${tarifaAsistente.factorMargen}" numDecimales="2"></cmz:formateaNumero>
							</cmz:campoTexto>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" value="true" id="redondear" name="redondear" 
								<c:if test="${tarifaAsistente.redondear}">checked="checked"</c:if>/>
							Aplicar redondeo a precio de venta + impuestos<br>(pueden variar los valores indicados en la regularización de precios).
						</td>
					</tr>
					<tr><td height="10px"></td></tr><!-- SEPARADOR -->
				</table>
				<div class="botonesAsistente">
					<cmz:boton onclick="atras();" valor="&lt;&lt; Atras" id="btnAtras" />
					<cmz:boton onclick="siguiente();" valor="Siguiente &gt;&gt;" id="btnSiguiente" />
				</div>
	</cmz:cuerpoPanel>
</cmz:panel>
