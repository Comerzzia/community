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
	var codTarifas = "";
	var desTarifas = "";

	function checkFormRegistroPestaña() {
		if(codTarifas == ''){
			alert("Debe seleccionar al menos una tarifa");
			return false;
		}
	    return true;
    }
    
    function aceptarTarifas(){
  		var i;
  		var numChecks = document.frmDatos.tarifas.length;
  		if(numChecks){
			for(i = 0; i < numChecks; i++){
   				if(document.frmDatos.tarifas[i].checked){
   		            var lst = new Array();
   		            lst = document.frmDatos.tarifas[i].value.split("|");
   					codTarifas += lst[0] + ',';
   					desTarifas += lst[1] + ',';
				}
   			}
   			document.getElementById("codTarifas").value = codTarifas.substring(0, codTarifas.length - 1);
   			document.getElementById("desTarifas").value = desTarifas.substring(0, desTarifas.length - 1);

  		}else{
            if (document.getElementById("tarifas").checked){
	            var lst = new Array();
	            lst = document.frmDatos.tarifas.value.split("|");
				codTarifas += lst[0];
				desTarifas += lst[1];
            }

   			document.getElementById("codTarifas").value = codTarifas;
   			document.getElementById("desTarifas").value = desTarifas;
		}	

        if (checkFormRegistroPestaña()) {
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("operacion").value = "aceptarRegistroPestaña";
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }
    }

	function cancelarTarifa() {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("operacion").value = "cancelarRegistroPestaña";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }
    
	function marcarTodo() {
  		var numChecks = document.frmDatos.tarifas.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
   				document.frmDatos.tarifas[i].checked = true;
   			}

  		}else{
            document.frmDatos.tarifas.checked = true;
		}	
    }

	function desmarcarTodo() {
  		var numChecks = document.frmDatos.tarifas.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
   				document.frmDatos.tarifas[i].checked = false;
   			}

  		}else{
            document.frmDatos.tarifas.checked = false;
		}	
    }

	function invertir() {
  		var numChecks = document.frmDatos.tarifas.length;
 		if(numChecks){
			for(i = 0; i < numChecks; i++){
				if (document.frmDatos.tarifas[i].checked) {
	   				document.frmDatos.tarifas[i].checked = false;
				} else {
					document.frmDatos.tarifas[i].checked = true;
				}
   			}

  		}else{
  	  		if (document.frmDatos.tarifas.checked) {
            	document.frmDatos.tarifas.checked = false;
  	  		} else {
  	  			document.frmDatos.tarifas.checked = true;
  	  		}
		}	
    }
	
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Tarifas disponibles">
    <cmz:acciones numAccionesVisibles="2">
      <cmz:accion onclick="aceptarTarifas();" titulo="Aceptar" icono="comun/images/iconos/aceptar.gif"></cmz:accion>
      <cmz:accion onclick="cancelarTarifa();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
      <cmz:accion onclick="marcarTodo();" titulo="Marcar Todo" icono="comun/images/iconos/checkbox.png"></cmz:accion>
      <cmz:accion onclick="desmarcarTodo();" titulo="Desmarcar Todo" icono="comun/images/iconos/checkboxVacio.png"></cmz:accion>
      <cmz:accion onclick="invertir();" titulo="Invertir" icono="comun/images/iconos/invertir.png"></cmz:accion>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
    <cmz:lista>
			<cmz:cabeceraLista>
				<cmz:itemCabeceraLista nombre="Sel." columna="1"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Tarifa" columna="2"></cmz:itemCabeceraLista>
				<cmz:itemCabeceraLista nombre="Descripción" columna="3"></cmz:itemCabeceraLista>
			</cmz:cabeceraLista>
			<cmz:contenidoLista variable="tarifa" lista="${requestScope.lstTarifasDisponibles}">
				<cmz:itemContenidoLista>
					<input type="checkbox" id="tarifas" name="tarifas" value="${tarifa.codTar}|${tarifa.desTar}"/>
				</cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${tarifa.codTar}"></cmz:itemContenidoLista>
				<cmz:itemContenidoLista valor="${tarifa.desTar}"></cmz:itemContenidoLista>
			</cmz:contenidoLista>
		</cmz:lista>
  </cmz:cuerpoPanel>
</cmz:panel>
