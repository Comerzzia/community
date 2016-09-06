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

<c:set var="factura" value="${formularioConformacionFacturas.registroActivo}" />

<cmz:panel>
	<cmz:cabeceraPanel titulo="Detalle Factura del Proveedor">
		<c:if test="${formularioConformacionFacturas.enInsercion}">
		<cmz:acciones>
			<cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir nueva base"/>
		</cmz:acciones>
		</c:if>
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Tipo imp." estilo="text-align: center;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Base" estilo="text-align: center;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Impuestos" estilo="text-align: center;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Total" estilo="text-align: center;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Concepto" estilo="text-align: center;"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>

			<cmz:contenidoListaIndexada variable="detalleFactura" lista="${formularioConformacionFacturas.formularioPestañaActiva.registros}">
				<cmz:itemContenidoLista onclick="verRegistroPestaña(${indice})"><c:out value="${detalleFactura.desImpuesto}" /></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${detalleFactura.precio}" numDecimales="2"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${detalleFactura.impuestos}" numDecimales="2"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${detalleFactura.total}" numDecimales="2"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista><c:out value="${detalleFactura.concepto}" /></cmz:itemContenidoLista>
				<cmz:acciones alineacion="center">
					<cmz:accion icono="comun/images/iconos/ver.gif"
						onclick="verRegistroPestaña(${indice})" descripcion="Ver base"></cmz:accion>
					<c:if test="${formularioConformacionFacturas.enInsercion}">
						<cmz:accion icono="comun/images/iconos/editar.gif" onclick="editarRegistroPestaña(${indice})"
							descripcion="Editar base"></cmz:accion>
						<cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminarRegistroPestaña(${indice})"
							descripcion="Eliminar base"></cmz:accion>
					</c:if>
				</cmz:acciones>
			</cmz:contenidoListaIndexada>

			<tr class="fila par">
				<td style="text-align: center; font-weight: bold;"><span><c:out	value="TOTAL" /></span></td>
				<td style="text-align: right; font-weight: bold;"><span><cmz:formateaNumero valor="${factura.base}" numDecimales="2"/></span></td>
				<td style="text-align: right; font-weight: bold;"><span><cmz:formateaNumero valor="${factura.impuestos}" numDecimales="2"/></span></td>
				<td style="text-align: right; font-weight: bold;"><span><cmz:formateaNumero valor="${factura.total}" numDecimales="2"/></span></td>
				<td width="30%"><span></span></td>
				<td><span></span></td>
			</tr>

			<tr class="fila par">
				<td style="text-align: center; font-weight: bold;"><span><c:out	value="DIFERENCIA" /></span></td>
				<td style="text-align: right; font-weight: bold;"><span><cmz:formateaNumero valor="${factura.baseDiferencia}" numDecimales="2"/></span></td>
				<td style="text-align: right; font-weight: bold;"><span><cmz:formateaNumero valor="${factura.impuestosDiferencia}" numDecimales="2"/></span></td>
				<td style="text-align: right; font-weight: bold;"><span><cmz:formateaNumero valor="${factura.totalDiferencia}" numDecimales="2"/></span></td>
				<td><span></span></td>
				<td><span></span></td>
			</tr>

		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>
