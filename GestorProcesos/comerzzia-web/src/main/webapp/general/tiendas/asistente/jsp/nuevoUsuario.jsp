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
	    if(!esValido("usuario", "TEXTO", true)){
	        return false;
	    }
	    if(!esValido("desUsuario", "TEXTO", true)){
	        return false;
	    }
	   	if (document.getElementById("password").value != document.getElementById("confirma").value){
	    	window.alert("Las contraseñas han de ser iguales");
	    	return false;
	    }
	
	    return true;
	}
	
	function aceptarUsuario(){
  		if (checkFormRegistroPestaña()) {
  			document.getElementById("clave").value = hex_md5(document.getElementById("password").value);
			document.getElementById("accion").value = "asistenteAlta";
        	document.getElementById("operacion").value = "aceptarUsuario";
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }
    }

    function cancelarUsuario(){
  		document.getElementById("accion").value = "asistenteAlta";
        document.getElementById("operacion").value = "cancelarUsuario";
        document.getElementById("frmDatos").submit();
    	_esperando();
    }
	
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Nuevo Usuario">
    <cmz:acciones numAccionesVisibles="2">
      <cmz:accion onclick="aceptarUsuario();" titulo="Aceptar" icono="comun/images/iconos/aceptar.gif"></cmz:accion>
      <cmz:accion onclick="cancelarUsuario();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
		<table cellpadding="2px" cellspacing="2px" border="0px" class="asistenteTienda">
			<tr>
				<td>Usuario:</td>
				<td><cmz:campoTexto id="usuario" valor=""
					requerido="true" anchura="180px" longitudMaxima="20"/>
				</td>
			</tr>
			<tr>
				<td>Descripción:</td>
				<td><cmz:campoTexto id="desUsuario"	valor="" 
					requerido="true" anchura="350px" longitudMaxima="50"/>
				</td>
			</tr>
			<tr>
				<td>Contraseña:</td>
				<td><input id="password" name="password" type="password"
					value="" class="campo" maxlength="20" width="180px"
					style="width: 180px;" />
				</td>
			</tr>
			<tr>
				<td>Confirmar Contraseña:</td>
				<td><input id="confirma" name="confirma" type="password"
					value="" class="campo" maxlength="20" width="180px"
					style="width: 180px;" />
				</td>
			</tr>
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>
