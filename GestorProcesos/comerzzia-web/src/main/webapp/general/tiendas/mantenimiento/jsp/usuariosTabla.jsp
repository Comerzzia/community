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

<cmz:panel>
	<cmz:cabeceraPanel titulo="Usuarios de la Tienda">
  	  <cmz:acciones>
		<c:if test="${formularioTienda.editable}">
			<c:if test="${!empty requestScope.lstUsuariosDisponibles}">
				<cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir nuevo usuario"/>
			</c:if>
		</c:if>
	  </cmz:acciones>
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Código" columna="1"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Descripción" columna="2"></cmz:itemCabeceraLista>
				<c:if test="${formularioTienda.editable}">
				<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
				</c:if>
			</cmz:cabeceraLista>
			<cmz:contenidoLista variable="usuario" lista="${formularioTienda.formularioPestañaActiva.registros}">
				<cmz:itemContenidoLista valor="${usuario.usuario}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${usuario.desUsuario}"></cmz:itemContenidoLista>				
				<c:if test="${formularioTienda.editable}">
				<cmz:acciones alineacion="center">
					<cmz:accion onclick="eliminarRegistroPestaña(${indice})" icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar usuario"></cmz:accion>
				</cmz:acciones>
				</c:if>			
			</cmz:contenidoLista>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>	
