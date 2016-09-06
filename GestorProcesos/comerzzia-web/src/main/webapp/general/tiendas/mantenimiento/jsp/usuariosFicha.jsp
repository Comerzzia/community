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
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function checkFormRegistroPestaña() {
		var numChecks = document.frmDatos.usuarios.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
				if(document.frmDatos.usuarios[i].checked){
					return true;
				}
   			}
  		}
 		else {
 			if(document.frmDatos.usuarios.checked) {
                return true;
 			}
		}
    
 		alert("Debes elegir al menos un usuario");
		return false;
    }
    
	function marcarTodo() {
  		var numChecks = document.frmDatos.usuarios.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
   				document.frmDatos.usuarios[i].checked = true;
   			}

  		}else{
            document.frmDatos.usuarios.checked = true;
		}	
    }

	function desmarcarTodo() {
  		var numChecks = document.frmDatos.usuarios.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
   				document.frmDatos.usuarios[i].checked = false;
   			}

  		}else{
            document.frmDatos.usuarios.checked = false;
		}	
    }

	function invertir() {
  		var numChecks = document.frmDatos.usuarios.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
				if (document.frmDatos.usuarios[i].checked) {
	   				document.frmDatos.usuarios[i].checked = false;
				} else {
					document.frmDatos.usuarios[i].checked = true;
				}
   			}

  		}else{
  	  		if (document.frmDatos.usuarios.checked) {
            	document.frmDatos.usuarios.checked = false;
  	  		} else {
  	  			document.frmDatos.usuarios.checked = true;
  	  		}
		}	
    }
	
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Usuarios disponibles">
    <cmz:acciones numAccionesVisibles="2">
      <cmz:accionSalvarLinea onclick="aceptarRegistroPestaña();"/>
      <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
      <cmz:accion onclick="marcarTodo();" titulo="Marcar Todo" icono="comun/images/iconos/checkbox.png"></cmz:accion>
      <cmz:accion onclick="desmarcarTodo();" titulo="Desmarcar Todo" icono="comun/images/iconos/checkboxVacio.png"></cmz:accion>
      <cmz:accion onclick="invertir();" titulo="Invertir" icono="comun/images/iconos/invertir.png"></cmz:accion>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
  	<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Sel." columna="1"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Código" columna="2"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Descripción" columna="3"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoLista variable="usuario" lista="${requestScope.lstUsuariosDisponibles}">
				<cmz:itemContenidoLista>
					<input type="checkbox" id="usuarios" name="usuarios" value="${usuario.idUsuario},${usuario.usuario},${usuario.desUsuario}"/>
				</cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${usuario.usuario}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${usuario.desUsuario}"></cmz:itemContenidoLista>
			</cmz:contenidoLista>
	</cmz:lista>
  </cmz:cuerpoPanel>
</cmz:panel>
