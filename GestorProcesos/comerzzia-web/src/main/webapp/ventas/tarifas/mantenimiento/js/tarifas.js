/**
 * Copyright 2009-2011 RED.ES - Desarrollado por MP Sistemas
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
 */

    function calcular(){
    	var porcentajeImpuestos = document.getElementById("porcentajeImpuestos").value;
		if (porcentajeImpuestos == ''){
			porcentajeImpuestos = obtenerPorcentajeImpuestos();
			if (porcentajeImpuestos == null){
				return false;
			}
		}
    	var precioCostoFormat = document.getElementById("precioCosto").value;
		var factorMarcajeFormat = document.getElementById("factorMarcaje").value;
		var precioMarcajeFormat = document.getElementById("precioMarcaje").value;
		var precioMarcajeImpuestosFormat = document.getElementById("precioMarcajeImpuestos").value;
		var precioCosto = desformateaNumero(precioCostoFormat);
		var factorMarcaje = desformateaNumero(factorMarcajeFormat);
		var precioMarcaje = desformateaNumero(precioMarcajeFormat);
		var precioMarcajeImpuestos = desformateaNumero(precioMarcajeImpuestosFormat);
		var factorAplicado;
		var precioAplicado;
		var precioTotal;
		if (precioCostoFormat == "" || (factorMarcaje == "" && precioMarcaje == "" && precioMarcajeImpuestos == "")){
			return false;
		}
		if (factorMarcaje != ""){
			factorAplicado = factorMarcaje;
			precioAplicado = calculaPrecioAplicado(precioCosto, factorMarcaje);
			precioTotal = calculaPrecioConImpuestos(precioAplicado, porcentajeImpuestos);
		}
		else if (precioMarcaje != ""){
			factorAplicado = calculaFactorAplicado(precioCosto, precioMarcaje);
			precioAplicado = precioMarcaje;	
			precioMarcajeImpuestos = calculaPrecioConImpuestos(precioAplicado, porcentajeImpuestos); 
			precioTotal = precioMarcajeImpuestos;
		}
		else { // --> precioMarcajeImpuestos != ""
			precioTotal = precioMarcajeImpuestos;
			precioMarcaje = calculaPrecioSinImpuestos(precioTotal, porcentajeImpuestos);
			precioAplicado = precioMarcaje;	
			factorAplicado = calculaFactorAplicado(precioCosto, precioMarcaje);
		}
		document.getElementById("precioCosto").value = formateaNumero(precioCosto,2);
		document.getElementById("factorAplicado").value = formateaNumero(factorAplicado,2);
		document.getElementById("precioVenta").value = formateaNumero(precioAplicado,4);
		document.getElementById("precioTotal").value = formateaNumero(precioTotal,2);
		document.getElementById("factorMarcaje").value = formateaNumero(factorMarcaje,2,"");
		document.getElementById("precioMarcaje").value = formateaNumero(precioMarcaje,4,"");
		document.getElementById("precioMarcajeImpuestos").value = formateaNumero(precioMarcajeImpuestos,2,"");
		return true;
    }
    function calculaFactorAplicado(precioCosto, precioMarcaje){
		if (precioMarcaje == 0){
			return 0;
		}
    	return ((precioMarcaje - precioCosto)/precioMarcaje)*100;
    }
    function calculaPrecioAplicado(precioCosto, factorMarcaje){
		return precioCosto/((100-factorMarcaje)/100);
    }
    function calculaPrecioConImpuestos(precioAplicado, porcentajeImpuestos){
		return (precioAplicado * porcentajeImpuestos / 100) + parseFloat(precioAplicado);
    }
    function calculaPrecioSinImpuestos(precioTotal, porcentajeImpuestos){
		return (100 * precioTotal / (100 + parseFloat(porcentajeImpuestos)));
    }
    function validarPrecioCosto(){
		var precioCostoFormat = document.getElementById("precioCosto").value;
		if (precioCostoFormat == ""){
			borrarResultados();
			return;
		}
		if(!esValido("precioCosto","NUMERICO", false, 2, false)){
			borrarResultados();
			document.getElementById("precioCosto").focus();
			document.getElementById("precioCosto").select();
			return;
		}
		calcular();
    }
    function validarFactorMarcaje(){
		if (!camposVariablesVacios()){
			document.getElementById("precioMarcaje").value = "";
			document.getElementById("precioMarcajeImpuestos").value = "";
			if(!esValido("factorMarcaje", "NUMERICO", false, 2, false, 0, 99)){
				document.getElementById("factorMarcaje").select();
				document.getElementById("factorMarcaje").focus();
				borrarResultados();
				return;
			}
			calcular();
		}
    }
    function validarPrecioMarcaje(){
		if (!camposVariablesVacios()){
			document.getElementById("factorMarcaje").value = "";
			document.getElementById("precioMarcajeImpuestos").value = "";
			if(!esValido("precioMarcaje", "NUMERICO", false, 4, false)){
				document.getElementById("precioMarcaje").select();
				document.getElementById("precioMarcaje").focus();
				borrarResultados();
				return;
			}
			calcular();
		}
    }
    function validarPrecioMarcajeImpuestos(){
		if (!camposVariablesVacios()){
	    	document.getElementById("factorMarcaje").value = "";
			document.getElementById("precioMarcaje").value = "";
			if(!esValido("precioMarcajeImpuestos", "NUMERICO", false, 2, false)){
				document.getElementById("precioMarcajeImpuestos").select();
				document.getElementById("precioMarcajeImpuestos").focus();
				borrarResultados();
				return;
			}
			calcular();
		}
    }
    function camposVariablesVacios(){
		var factorMarcajeFormat = document.getElementById("factorMarcaje").value;
		var precioMarcajeFormat = document.getElementById("precioMarcaje").value;
		var precioMarcajeImpuestosFormat = document.getElementById("precioMarcajeImpuestos").value;
		if (factorMarcajeFormat == "" && precioMarcajeFormat == "" && precioMarcajeImpuestosFormat == ""){
			borrarResultados();
			return true;
		}
		return false;
    }
    function borrarResultados(){
		document.getElementById("factorAplicado").value = "";
		document.getElementById("precioVenta").value = "";
		document.getElementById("precioTotal").value = "";
    }
    function borrarMarcajes(){
		document.getElementById("factorMarcaje").value = "";
		document.getElementById("precioMarcaje").value = "";
		document.getElementById("precioMarcajeImpuestos").value = "";
    }
