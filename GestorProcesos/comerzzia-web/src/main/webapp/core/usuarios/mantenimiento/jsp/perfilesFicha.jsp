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
	var idPerfiles = "";
	var desPerfiles = "";

	function checkFormRegistroPestaña() {
		if(idPerfiles == ''){
			alert("Debes elegir al menos un perfil");
			return false;
		}
	    return true;
    }
    
    function aceptarPerfiles(){
  		var i;
  		var numChecks = document.frmDatos.perfiles.length;
  		if(numChecks){
			for(i = 0; i < numChecks; i++){
   				if(document.frmDatos.perfiles[i].checked){
   		            var lst = new Array();
   		            lst = document.frmDatos.perfiles[i].value.split("|");
   					idPerfiles += lst[0] + ',';
   					desPerfiles += lst[1] + ',';
				}
   			}
   			document.getElementById("idPerfiles").value = idPerfiles.substring(0, idPerfiles.length - 1);
   			document.getElementById("desPerfiles").value = desPerfiles.substring(0, desPerfiles.length - 1);

  		}else{
            if (document.getElementById("perfiles").checked){
	            var lst = new Array();
	            lst = document.frmDatos.perfiles.value.split("|");
				idPerfiles += lst[0];
				desPerfiles += lst[1];
            }

   			document.getElementById("idPerfiles").value = idPerfiles;
   			document.getElementById("desPerfiles").value = desPerfiles;
		}	

        if (checkFormRegistroPestaña()) {
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("operacion").value = "aceptarPerfil";
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }
    }

	function cancelarPerfil() {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }
    
	function marcarTodo() {
  		var numChecks = document.frmDatos.perfiles.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
   				document.frmDatos.perfiles[i].checked = true;
   			}

  		}else{
            document.frmDatos.perfiles.checked = true;
		}	
    }

	function desmarcarTodo() {
  		var numChecks = document.frmDatos.perfiles.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
   				document.frmDatos.perfiles[i].checked = false;
   			}

  		}else{
            document.frmDatos.perfiles.checked = false;
		}	
    }

	function invertir() {
  		var numChecks = document.frmDatos.perfiles.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
				if (document.frmDatos.perfiles[i].checked) {
	   				document.frmDatos.perfiles[i].checked = false;
				} else {
					document.frmDatos.perfiles[i].checked = true;
				}
   			}

  		}else{
  	  		if (document.frmDatos.perfiles.checked) {
            	document.frmDatos.perfiles.checked = false;
  	  		} else {
  	  			document.frmDatos.perfiles.checked = true;
  	  		}
		}	
    }
	
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Perfiles Disponibles">
    <cmz:acciones numAccionesVisibles="2">
      <cmz:accion onclick="aceptarPerfiles();" titulo="Aceptar" icono="comun/images/iconos/aceptar.gif"></cmz:accion>
      <cmz:accion onclick="cancelarPerfil();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
      <cmz:accion onclick="marcarTodo();" titulo="Marcar Todo" icono="comun/images/iconos/checkbox.png"></cmz:accion>
      <cmz:accion onclick="desmarcarTodo();" titulo="Desmarcar Todo" icono="comun/images/iconos/checkboxVacio.png"></cmz:accion>
      <cmz:accion onclick="invertir();" titulo="Invertir" icono="comun/images/iconos/invertir.png"></cmz:accion>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
  	<cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Sel." columna="1"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Perfil" columna="2"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoLista variable="perfil" lista="${requestScope.lstPerfilesDisponibles}">
				<cmz:itemContenidoLista>
					<input type="checkbox" id="perfiles" name="perfiles" value="${perfil.idPerfil}|${perfil.desPerfil}"/>
				</cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${perfil.desPerfil}"></cmz:itemContenidoLista>
			</cmz:contenidoLista>
	</cmz:lista>
  </cmz:cuerpoPanel>
</cmz:panel>
