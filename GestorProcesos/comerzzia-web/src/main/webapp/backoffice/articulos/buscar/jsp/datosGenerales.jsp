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

<c:set var="articulo" value="${formularioConsultaArticulos.registroActivo}" />

<table cellpadding="2px" cellspacing="2px" border="0px">
		<tr>
			<td>Familia:</td>
            <td>
            	<cmz:campoTexto id="codFamilia" valor="${articulo.codFamilia}" anchura="100px" 
            		editable="false" soloLectura="true"/>
            </td>
            <td>
            	<cmz:campoTexto id="desFamilia" valor="${articulo.desFamilia}" anchura="300px" 
            		editable="false" soloLectura="true"/>
            </td>
		</tr>  
		<tr>
	        <td>Seccion:</td>
            <td>
            	<cmz:campoTexto id="codSeccion" valor="${articulo.codSeccion}" anchura="100px" 
            		editable="false" soloLectura="true"/>
            </td>
            <td>
            	<cmz:campoTexto id="desSeccion" valor="${articulo.desSeccion}" anchura="300px" 
            		editable="false" soloLectura="true"/>
            </td>
      	</tr> 
      	<tr>
	        <td>Categorización:</td>
            <td>
            	<cmz:campoTexto id="codCategorizacion" valor="${articulo.codCategorizacion}" anchura="100px" 
            		editable="false" soloLectura="true"/>
            </td>
            <td>
            	<cmz:campoTexto id="desCategorizacion" valor="${articulo.desCategorizacion}" anchura="300px" 
            		editable="false" soloLectura="true"/>
            </td>
      	</tr>   
      	<tr>
	        <td>Proveedor:</td>
            <td>
            	<cmz:campoTexto id="codProveedor" valor="${articulo.codProveedor}" anchura="100px" 
            		editable="false" soloLectura="true"/>
            </td>
            <td>
            	<cmz:campoTexto id="desProveedor" valor="${articulo.desProveedor}" anchura="300px" 
            		editable="false" soloLectura="true"/>
            </td>
            <td>Referencia:</td>
            <td>
            	<cmz:campoTexto id="referecia" valor="${articulo.referencia}" anchura="100px" 
            		editable="false" soloLectura="true"/>
            </td>
      	</tr>                                
</table>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Tarifas">
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Código" columna="1" ordenColumna="CODTAR"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Descripción" columna="2" ordenColumna="DESCRIPCION"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Precio Venta" columna="7" ordenColumna="PRECIO_VENTA" estilo="text-align: right;" ></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Precio Venta + imp." columna="8" ordenColumna="PRECIO_TOTAL" estilo="text-align: right;" ></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoLista variable="tarifa" lista="${articulo.tarifas}">
				<cmz:itemContenidoLista valor="${tarifa.codTar}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${tarifa.desTarifa}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${tarifa.precioVenta}" numDecimales="4"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${tarifa.precioTotal}" numDecimales="2"/></cmz:itemContenidoLista>
			</cmz:contenidoLista>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Promociones"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Tarifa" columna="1"></cmz:itemCabeceraLista>
                <cmz:itemCabeceraLista nombre="Descripción" columna="2"></cmz:itemCabeceraLista>
                <cmz:itemCabeceraLista nombre="Id" columna="3"></cmz:itemCabeceraLista>
                <cmz:itemCabeceraLista nombre="Fecha inicio" columna="4" estilo="text-align: center;"></cmz:itemCabeceraLista>
                <cmz:itemCabeceraLista nombre="Fecha fin" columna="5" estilo="text-align: center;"></cmz:itemCabeceraLista>
                <cmz:itemCabeceraLista nombre="Texto" columna="6"></cmz:itemCabeceraLista>
                <cmz:itemCabeceraLista nombre="Precio" columna="7" estilo="text-align: right;"></cmz:itemCabeceraLista>
                <cmz:itemCabeceraLista nombre="Precio+imp." columna="8" estilo="text-align: right;"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoLista variable="promocion" lista="${articulo.promociones}">
                <cmz:itemContenidoLista valor="${promocion.codTarifa}"></cmz:itemContenidoLista>
                <cmz:itemContenidoLista valor="${promocion.desTarifa}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${promocion.idPromocion}"></cmz:itemContenidoLista>				
				<cmz:itemContenidoLista alineacion="center"><fmt:formatDate pattern="dd/MM/yyyy" value="${promocion.fechaInicio}"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="center"><fmt:formatDate pattern="dd/MM/yyyy" value="${promocion.fechaFin}"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${promocion.textoPromocion}"></cmz:itemContenidoLista>				
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${promocion.precioVenta}" numDecimales="4"/></cmz:itemContenidoLista>
				<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${promocion.precioTotal}" numDecimales="2"/></cmz:itemContenidoLista>
			</cmz:contenidoLista>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>
