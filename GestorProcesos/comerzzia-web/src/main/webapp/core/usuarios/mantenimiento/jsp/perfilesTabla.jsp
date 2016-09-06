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

<script type="text/javascript">
	function nuevoPerfil(){
		document.getElementById("accion").value = "leerFormulario";
		document.getElementById("operacion").value = "nuevoPerfil";
		document.getElementById("frmDatos").submit();
		_esperando();
	}
</script>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Perfiles del Usuario">
  	  <cmz:acciones>
		<c:if test="${formularioUsuario.editable}">
			<c:if test="${!empty requestScope.lstPerfilesDisponibles}">
				<cmz:accion onclick="nuevoPerfil();" descripcion="Añadir nuevo perfil" icono="core/usuarios/mantenimiento/images/anadirPerfil.gif"></cmz:accion>
			</c:if>
		</c:if>
	  </cmz:acciones>
	</cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Perfil"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoLista variable="perfil" lista="${formularioUsuario.formularioPestañaActiva.registros}">
				<cmz:itemContenidoLista valor="${perfil.desPerfil}"></cmz:itemContenidoLista>
				<cmz:acciones alineacion="center">
					<c:if test="${formularioUsuario.editable}">
						<cmz:accion onclick="eliminarRegistroPestaña(${indice})" icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar perfil"></cmz:accion>
					</c:if>
				</cmz:acciones>
			</cmz:contenidoLista>
		</cmz:lista>
	</cmz:cuerpoPanel>
</cmz:panel>	
