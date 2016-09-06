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
	var codAlmacenes = "";
	var desAlmacenes = "";

	function checkFormRegistroPestaña() {
		if(codAlmacenes == ''){
			alert("Debes elegir al menos un almacén");
			return false;
		}
	    return true;
    }
    
    function aceptarAlmacenes(){
  		var i;
  		var numChecks = document.frmDatos.almacenes.length;
  		if(numChecks){
			for(i = 0; i < numChecks; i++){
   				if(document.frmDatos.almacenes[i].checked){
   		            var lst = new Array();
   		            lst = document.frmDatos.almacenes[i].value.split("|");
   					codAlmacenes += lst[0] + ',';
   					desAlmacenes += lst[1] + ',';
				}
   			}
   			document.getElementById("codAlmacenes").value = codAlmacenes.substring(0, codAlmacenes.length - 1);
   			document.getElementById("desAlmacenes").value = desAlmacenes.substring(0, desAlmacenes.length - 1);

  		}else{
            if (document.getElementById("almacenes").checked){
	            var lst = new Array();
	            lst = document.frmDatos.almacenes.value.split("|");
				codAlmacenes += lst[0];
				desAlmacenes += lst[1];
            }

   			document.getElementById("codAlmacenes").value = codAlmacenes;
   			document.getElementById("desAlmacenes").value = desAlmacenes;
		}	

        if (checkFormRegistroPestaña()) {
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("operacion").value = "aceptarAlmacen";
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }
    }

	function cancelarAlmacen() {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }
    
	function marcarTodo() {
  		var numChecks = document.frmDatos.almacenes.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
   				document.frmDatos.almacenes[i].checked = true;
   			}

  		}else{
            document.frmDatos.almacenes.checked = true;
		}	
    }

	function desmarcarTodo() {
  		var numChecks = document.frmDatos.almacenes.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
   				document.frmDatos.almacenes[i].checked = false;
   			}

  		}else{
            document.frmDatos.almacenes.checked = false;
		}	
    }

	function invertir() {
  		var numChecks = document.frmDatos.almacenes.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
				if (document.frmDatos.almacenes[i].checked) {
	   				document.frmDatos.almacenes[i].checked = false;
				} else {
					document.frmDatos.almacenes[i].checked = true;
				}
   			}

  		}else{
  	  		if (document.frmDatos.almacenes.checked) {
            	document.frmDatos.almacenes.checked = false;
  	  		} else {
  	  			document.frmDatos.almacenes.checked = true;
  	  		}
		}	
    }
	
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Almacenes Disponibles">
    <cmz:acciones numAccionesVisibles="2">
      <cmz:accion onclick="aceptarAlmacenes();" titulo="Aceptar" icono="comun/images/iconos/aceptar.gif"></cmz:accion>
      <cmz:accion onclick="cancelarAlmacen();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
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
			<cmz:contenidoLista variable="almacen" lista="${requestScope.lstAlmacenesDisponibles}">
				<cmz:itemContenidoLista>
					<input type="checkbox" id="almacenes" name="almacenes" value="${almacen.codAlm}|${almacen.desAlm}"/>
				</cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${almacen.codAlm}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${almacen.desAlm}"></cmz:itemContenidoLista>
			</cmz:contenidoLista>
	</cmz:lista>
  </cmz:cuerpoPanel>
</cmz:panel>
