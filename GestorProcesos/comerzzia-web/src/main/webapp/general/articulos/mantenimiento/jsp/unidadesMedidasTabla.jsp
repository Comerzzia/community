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

<c:set var="articulo" value="${formularioArticulo.registroActivo}" />

<script type="text/javascript">
    function checkFormPestaña() {
    	if (!esValido("cantidadUnidadMedidaEtiq", "NUMERICO", false, 3, true)) {
            return false;
        }
    	if (!esValido("unidadMedidaAlternativa", "TEXTO", false)) {
            return false;
        }
        
        return true;
    }
 </script>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Etiqueta"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table>
			<tr>
				<td>Unidad:</td>
				<td>
					<cmz:ayuda nombreAyuda="UNIDADES_MEDIDAS_ETIQUETAS" soloLectura="${!formularioArticulo.editable}">
						<cmz:codigoAyuda idCodigo="codUnidadMedidaEtiq" longitudMaximaCodigo="4" valorCodigo="${articulo.codUnidadMedidaEtiq}" anchuraCodigo="40px"></cmz:codigoAyuda>
						<cmz:descripcionAyuda idDescripcion="desUnidadMedidaEtiq" anchuraDescripcion="150px" valorDescripcion="${articulo.desUnidadMedidaEtiq}"></cmz:descripcionAyuda>
					</cmz:ayuda>
				</td>
			</tr>
			<tr>
				<td>Cantidad:</td>
				<td>
					<c:set var="cantidadUnidadMedidaEtiq"><cmz:formateaNumero valor="${articulo.cantidadUnidadMedidaEtiq}"/></c:set>
					<cmz:campoTexto id="cantidadUnidadMedidaEtiq" valor="${cantidadUnidadMedidaEtiq}" editable="${formularioArticulo.editable}" soloLectura="${!formularioArticulo.editable}" longitudMaxima="13" anchura="110"></cmz:campoTexto>
				</td>
			</tr>
		</table>		
	</cmz:cuerpoPanel>
</cmz:panel>
<cmz:panel>
	<cmz:cabeceraPanel titulo="Unidades de Medida">
		<cmz:acciones>
			<c:if test="${formularioArticulo.editable}">
				<c:if test="${!empty requestScope.lstUnidadesMedidas}">
					<cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir nueva unidad"/>
				</c:if>
			</c:if>
		</cmz:acciones>
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table width="100%">
			<tr>
				<td nowrap="nowrap" width="150px">Unidad de medida alternativa:</td>
				<td width="100%">
					<cmz:campoTexto id="unidadMedidaAlternativa" valor="${articulo.unidadMedAlt}" editable="${formularioArticulo.editable}" soloLectura="${!formularioArticulo.editable}" longitudMaxima="4" anchura="40"></cmz:campoTexto>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<cmz:lista>
						<cmz:cabeceraLista>
							<cmz:itemCabeceraLista nombre="Unidad Medidad" columna="1" ordenColumna="UNIDAD_MEDIDA"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Factor conversión" columna="2" ordenColumna="FACTOR_CONVERSION" estilo="text-align: right;"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Alto" columna="3" ordenColumna="ALTO" estilo="text-align: right;"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Ancho" columna="5" ordenColumna="ANCHO" estilo="text-align: right;"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Fondo" columna="6" ordenColumna="FONDO" estilo="text-align: right;"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Peso" columna="7" ordenColumna="PESO" estilo="text-align: right;"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
						</cmz:cabeceraLista>
						<cmz:contenidoListaIndexada variable="unidad" lista="${formularioArticulo.formularioPestañaActiva.registros}">
							<cmz:itemContenidoLista valor="${unidad.unidadMedida}" onclick="verRegistroPestaña(${indice})"></cmz:itemContenidoLista>
							<c:set var="factorConversion"><cmz:formateaNumero valor="${unidad.factorConversion}"/></c:set>
							<cmz:itemContenidoLista valor="${factorConversion}" alineacion="right"></cmz:itemContenidoLista>
							<cmz:itemContenidoLista valor="${unidad.alto}" alineacion="right"></cmz:itemContenidoLista>
							<cmz:itemContenidoLista valor="${unidad.ancho}" alineacion="right"></cmz:itemContenidoLista>
							<cmz:itemContenidoLista valor="${unidad.fondo}" alineacion="right"></cmz:itemContenidoLista>
							<c:set var="peso"><cmz:formateaNumero valor="${unidad.peso}"/></c:set>
							<cmz:itemContenidoLista valor="${peso}" alineacion="right"></cmz:itemContenidoLista>
							<cmz:acciones alineacion="center">
								<cmz:accion onclick="verRegistroPestaña(${indice})" icono="comun/images/iconos/ver.gif" descripcion="Ver unidad de medida"></cmz:accion>
								<c:if test="${formularioArticulo.editable}">
									<cmz:accion onclick="editarRegistroPestaña(${indice})" icono="comun/images/iconos/editar.gif" descripcion="Editar unidad de medida"></cmz:accion>
									<cmz:accion onclick="eliminarRegistroPestaña(${indice})" icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar unidad de medida"></cmz:accion>
								</c:if>
							</cmz:acciones>
						</cmz:contenidoListaIndexada>
					</cmz:lista>	
				</td>
			</tr>
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>
