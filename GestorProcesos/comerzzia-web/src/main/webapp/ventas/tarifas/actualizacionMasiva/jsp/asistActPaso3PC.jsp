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

<jsp:useBean id="tarifaAsistente" type="com.comerzzia.persistencia.ventas.tarifas.ParametrosAsistenteTarifaBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />


<script type="text/javascript">
	function checkForm() {
		if(!esValido("porcentajeIncDec", "NUMERICO", false, 2, true)) {
			return false;
		}
		return true;
	}

	function inicio(){
	}
</script>
<cmz:panel>
	<cmz:cabeceraPanel titulo="Actualización de Precios de Costo para la Tarifa ${tarifaAsistente.codTarActual}"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
				<table cellpadding="2px" cellspacing="2px" border="0px" class="actualizacionMasiva">
					<tr>
						<td>Porcentaje incremento / decremento:</td>
						<td>
							<cmz:campoTexto id="porcentajeIncDec" anchura="100px" longitudMaxima="6"  onChange="borrarCampos(this);" >
                                <cmz:formateaNumero valor="${tarifaAsistente.porcentajeIncDec}" numDecimales="2"/>
							</cmz:campoTexto>
						</td>
					</tr>
					<tr><td height="120px"></td></tr><!-- SEPARADOR -->
				</table>
				<div class="botonesAsistente">
					<cmz:boton onclick="atras();" valor="&lt;&lt; Atras" id="btnAtras" />
					<cmz:boton onclick="siguiente();" valor="Siguiente &gt;&gt;" id="btnSiguiente" />
				</div>
	</cmz:cuerpoPanel>
</cmz:panel>
