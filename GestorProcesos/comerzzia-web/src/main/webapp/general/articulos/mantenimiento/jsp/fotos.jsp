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

<c:if test="${formularioArticulo.editable}">
<cmz:panel>
		<cmz:cabeceraPanel titulo="Añadir / Cambiar Imagen" />
		<cmz:cuerpoPanel>
			<iframe src="uploadFoto.screen" id="fotoFrame" name="fotoFrame" marginwidth="0" marginheight="0" scrolling="no" style="width:100%; height: 50;" frameborder="0"></iframe>
		</cmz:cuerpoPanel>
</cmz:panel>
</c:if>

<c:choose>
<c:when test="${!empty formularioArticulo.formularioPestañaActiva.registros}">
<c:set var="indice" value="-1" />
<c:forEach items="${formularioArticulo.formularioPestañaActiva.registros}" var="foto">

		<c:choose>
			<c:when test="${foto.tipoFoto == 'P'}">
				<c:set var="indice" value="0" />
				<c:set var="fotoP" value="true" />
				<c:set var="tituloFoto" value="Imagen Pequeña" />
			</c:when>
			<c:when test="${foto.tipoFoto == 'M'}">
				<c:set var="fotoM" value="true" />
				<c:choose>
					<c:when test="${fotoP}">
						<c:set var="indice" value="1" />	
					</c:when>
					<c:otherwise>
						<c:set var="indice" value="0" />
					</c:otherwise>
				</c:choose>
				<c:set var="tituloFoto" value="Imagen Mediana" />
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${fotoP && fotoM}">
						<c:set var="indice" value="2" />	
					</c:when>
					<c:when test="${!fotoP && !fotoM}">
						<c:set var="indice" value="0" />	
					</c:when>
					<c:otherwise>
						<c:set var="indice" value="1" />
					</c:otherwise>
				</c:choose>
				<c:set var="tituloFoto" value="Imagen Grande" />
			</c:otherwise>
		</c:choose>

	<c:if test="${foto.estadoBean != 2}">
	<cmz:panel>
		<cmz:cabeceraPanel titulo="${tituloFoto}">
			<cmz:acciones numAccionesVisibles="1">
				<c:if test="${formularioArticulo.editable}">
					<cmz:accion onclick="eliminarRegistroPestaña(${indice})" icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar foto"></cmz:accion>
				</c:if>
			</cmz:acciones>
		</cmz:cabeceraPanel>
		<cmz:cuerpoPanel>
			<table cellpadding="2px" cellspacing="2px" border="0px" width="100%">
				<tr>
					<td><img alt="Imagen"
						src="fotosArticulos?tipoFoto=${foto.tipoFoto}&codArticulo=${foto.codArticulo}"
						onError="this.src='comun/images/logos/logo_no_disponible.jpg'">
					</td>
				</tr>
			</table>
		</cmz:cuerpoPanel>
	</cmz:panel>
	</c:if>
</c:forEach>
</c:when>
<c:otherwise>
<cmz:panel>
		<cmz:cabeceraPanel titulo="Sin Imágenes">
		</cmz:cabeceraPanel>
		<cmz:cuerpoPanel>
		</cmz:cuerpoPanel>
</cmz:panel>
</c:otherwise>
</c:choose>
