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

<c:set var="tienda" value="${asistenteTienda.tienda}" />

<script type="text/javascript">
	function nuevoUsuario(){
		document.getElementById("accion").value = "asistenteAlta";
		document.getElementById("operacion").value = "nuevoUsuario";
		document.getElementById("frmDatos").submit();
		_esperando();
	}

	function eliminarNuevoUsuario(indice){
		if (confirm("¿Desea borrar el registro seleccionado?")) {		
			document.getElementById("accion").value = "asistenteAlta";
			document.getElementById("operacion").value = "eliminarNuevoUsuario";
			document.getElementById("indice").value = indice;
			document.getElementById("frmDatos").submit();
			_esperando();
		}
	}
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Usuarios">
    <cmz:acciones numAccionesVisibles="1">
      <cmz:accion onclick="nuevoUsuario();" descripcion="Crear nuevo usuario" icono="comun/images/iconos/alta.gif"></cmz:accion>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
  	<c:if test="${!empty tienda.usuariosNuevos}">
	  <cmz:panel>
		<cmz:cabeceraPanel titulo="Nuevos Usuarios"></cmz:cabeceraPanel>
		  <cmz:cuerpoPanel>
		    <table cellpadding="2px" cellspacing="2px" border="0px" style="padding-left:3%;width:100%">
  			  <tr>
			    <td>
				  <cmz:lista>
				    <cmz:cabeceraLista>
					  <cmz:itemCabeceraLista nombre="Código" columna="1"></cmz:itemCabeceraLista>
					  <cmz:itemCabeceraLista nombre="Descripción" columna="2"></cmz:itemCabeceraLista>
				  	  <c:if test="${formularioTienda.editable}">
					    <cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
					  </c:if>
				    </cmz:cabeceraLista>
				    <cmz:contenidoLista variable="usuario" lista="${tienda.usuariosNuevos}">
					  <cmz:itemContenidoLista valor="${usuario.usuario}"></cmz:itemContenidoLista>
					  <cmz:itemContenidoLista valor="${usuario.desUsuario}"></cmz:itemContenidoLista>				
					  <c:if test="${formularioTienda.editable}">
					    <cmz:acciones alineacion="center">
						  <cmz:accion onclick="eliminarNuevoUsuario(${indice})" icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar usuario"></cmz:accion>
					    </cmz:acciones>
					  </c:if>			
				    </cmz:contenidoLista>
				  </cmz:lista>
			    </td>
			  </tr>
			</table>
		  </cmz:cuerpoPanel>
		</cmz:panel>
	</c:if>	
	<table cellpadding="2px" cellspacing="2px" border="0px" class="asistenteTienda">
  	  <tr>
		<td>
		  <cmz:lista>
		    <cmz:cabeceraLista>
			  <cmz:itemCabeceraLista nombre="Sel." columna="1"></cmz:itemCabeceraLista>
			  <cmz:itemCabeceraLista nombre="Código" columna="2"></cmz:itemCabeceraLista>
			  <cmz:itemCabeceraLista nombre="Descripción" columna="3"></cmz:itemCabeceraLista>
		    </cmz:cabeceraLista>
		    <cmz:contenidoLista variable="usuario" lista="${requestScope.lstUsuarios}">
			  <cmz:itemContenidoLista>
				<input type="checkbox" id="usuarios" name="usuarios" value="${usuario.idUsuario},${usuario.usuario},${usuario.desUsuario}"
					<c:if test="${!empty tienda.usuariosSeleccionados[usuario.usuario]}">checked="checked"</c:if> />
			  </cmz:itemContenidoLista>
			  <cmz:itemContenidoLista valor="${usuario.usuario}"></cmz:itemContenidoLista>
			  <cmz:itemContenidoLista valor="${usuario.desUsuario}"></cmz:itemContenidoLista>
		    </cmz:contenidoLista>
		  </cmz:lista>
	    </td>
	  </tr>	
	  <tr><td height="10px"></td></tr><!-- SEPARADOR -->
	</table>
    <div class="botonesAsistente">
	  <cmz:boton onclick="atras();" valor="&lt;&lt; Atras" id="btnAtras" />
	  <cmz:boton onclick="siguiente();" valor="Finalizar &gt;&gt;" id="btnSiguiente" />
	</div>
  </cmz:cuerpoPanel>
</cmz:panel>
