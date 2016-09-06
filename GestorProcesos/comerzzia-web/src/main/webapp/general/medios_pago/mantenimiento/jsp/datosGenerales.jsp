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

<c:set var="medioPago" value="${formularioMedioPago.registroActivo}" />

<script type="text/javascript">
    function checkFormPestaña() {
        var efectivo = document.getElementById("efectivo").checked;
        var tarjeta = document.getElementById("tarjetaCredito").checked;

        if (!(efectivo || tarjeta)) {
            if (!esValido("codTipoEfecto", "AYUDA", true, "desTipoEfecto", "TIPOSEFECTOS")) {
       		   return false;
            }
    	}
       	
        return true;
    }
</script>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Modalidad"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table cellpadding="2px" cellspacing="2px" border="0px">
			<tr>
				<td>
					<input type="checkbox" value="" id="contado" name="contado"
						<c:if test="${medioPago.contado}">checked="checked"</c:if>
						<c:if test="${!formularioMedioPago.editable}">disabled</c:if>
						onclick="onclickContado()" /> Contado
				</td>
				<td id="td_efectivo" <c:if test="${!medioPago.contado || (medioPago.contado && medioPago.tarjetaCredito)}">style="display:none"</c:if>>
					<input type="checkbox" value="" id="efectivo" name="efectivo"
						<c:if test="${medioPago.efectivo}">checked="checked"</c:if>
						<c:if test="${!formularioMedioPago.editable}">disabled</c:if>
						onclick="onclickEfectivo()" /> Efectivo
				</td>
				<td id="td_credito"	<c:if test="${!medioPago.contado || (medioPago.contado && medioPago.efectivo)}">style="display:none"</c:if>>
					<input type="checkbox" value="" id="tarjetaCredito"	name="tarjetaCredito"
						<c:if test="${medioPago.tarjetaCredito}">checked="checked"</c:if>
						<c:if test="${!formularioMedioPago.editable}">disabled</c:if>
						onclick="onclickCredito()" /> Tarjeta de crédito
				</td>
			</tr>
			<tr id="tr_efecto" <c:if test="${medioPago.contado && (medioPago.efectivo || medioPago.tarjetaCredito)}">style="display:none"</c:if>>
				<td>Tipo de efecto:</td>
				<td colspan="2">
					<cmz:ayuda requerido="true" soloLectura="${!formularioMedioPago.editable}" nombreAyuda="TIPOSEFECTOS">
			          	<cmz:codigoAyuda idCodigo="codTipoEfecto" valorCodigo="${medioPago.codTipoEfecto}" anchuraCodigo="50px" longitudMaximaCodigo="2"></cmz:codigoAyuda>
			          	<cmz:descripcionAyuda idDescripcion="desTipoEfecto" valorDescripcion="${medioPago.desTipoEfecto}" anchuraDescripcion="200px"></cmz:descripcionAyuda>
			        </cmz:ayuda>
				</td>
			</tr>
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Visibilidad"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table cellpadding="2px" cellspacing="2px" border="0px">
			<tr>
				<td>
					<input type="checkbox" value="" id="visibleCompra" name="visibleCompra"
						<c:if test="${medioPago.visibleCompra}">checked="checked"</c:if>
						<c:if test="${!formularioMedioPago.editable}">disabled</c:if> /> En compras
				</td>
				<td>
					<input type="checkbox" value="" id="visibleVenta" name="visibleVenta"
						<c:if test="${medioPago.visibleVenta}">checked="checked"</c:if>
						<c:if test="${!formularioMedioPago.editable}">disabled</c:if> /> En venta
				</td>
				<td id="td_tienda" <c:if test="${!medioPago.contado}">style="display:none"</c:if>>
					<input type="checkbox" value="" id="visibleTiendaVirtual" name="visibleTiendaVirtual"
						<c:if test="${medioPago.visibleTiendaVirtual}">checked="checked"</c:if>
						<c:if test="${!formularioMedioPago.editable}">disabled</c:if> /> En tienda virtual
				</td>
			</tr>
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>
