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
		return true;
	}
</script>
<cmz:panel>
	<cmz:cabeceraPanel titulo="Actualización de Precios de Venta para la Tarifa ${tarifaAsistente.codTarActual}"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
				<table cellpadding="2px" cellspacing="2px" border="0px" class="actualizacionMasiva">
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
