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

	function tratarXMLAyuda(){
    	document.getElementById("codArt").value = response.getElementsByTagName('codArt').item(0).firstChild.data;
        document.getElementById("desArt").value = response.getElementsByTagName('desArt').item(0).firstChild.data;
        var precioTarifa = response.getElementsByTagName('precioTarifa').item(0).firstChild.data;
        document.getElementById("precioTarifa").value =  formateaNumero(precioTarifa, 4, "");
        var precioTarifaConImpuestos = response.getElementsByTagName('precioTarifaConImpuestos').item(0).firstChild.data;
        document.getElementById("precioTarifaConImpuestos").value =  formateaNumero(precioTarifaConImpuestos, 2, "");
        
        return true;
    }
	
	function validarPrecioPromocion(){
		document.getElementById("precioTotal").focus();
		if(!esValido("precioVenta", "NUMERICO", false, 4, false)){
			document.getElementById("precioVenta").select();
			document.getElementById("precioVenta").focus();
			return;
		}
		calcular();
    }
	
    function validarPrecioTotal(){
    	document.getElementById("precioVenta").value = "";
    	if(!esValido("precioTotal", "NUMERICO", false, 2, false)){
			document.getElementById("precioTotal").select();
			document.getElementById("precioTotal").focus();
			return;
		}
		calcular();
    }
    
    function calcular(){
    	var codArticulo = document.getElementById("codArt").value;
		if(codArticulo == ''){
			alert("Debe seleccionar un articulo antes de introducir el precio");
			document.getElementById("codArt").select();
			document.getElementById("codArt").focus();
			document.getElementById("precioVenta").value = "";
			document.getElementById("precioTotal").value = "";
			return false;
		}
    	var porcentajeImpuestos = obtenerPorcentajeImpuestos();
		if (porcentajeImpuestos == null){
			return false;
		}
		var precioVentaFormat = document.getElementById("precioVenta").value;
		var precioTotalFormat = document.getElementById("precioTotal").value;
		var precioVenta = desformateaNumero(precioVentaFormat);
		var precioTotal = desformateaNumero(precioTotalFormat);
		
		if (precioVenta == "" && precioTotal == ""){
			return false;
		}
		else if (precioVenta != ""){
			precioTotal = (precioVenta * porcentajeImpuestos / 100) + parseFloat(precioVenta);
		}
		else if (precioTotal != ""){
			precioVenta = (100 * precioTotal / (100 + parseFloat(porcentajeImpuestos)));
		}
		
		document.getElementById("precioVenta").value = formateaNumero(precioVenta, 4, "");
		document.getElementById("precioTotal").value = formateaNumero(precioTotal, 2, "");
		
		return true;
    }
    
    function obtenerPorcentajeImpuestos(){
    	var codArticulo = document.getElementById("codArt").value;
    	var url = "articulo.promocion.cmz?codArticulo=" + escape(codArticulo);
		
		response = xmlRequest(url);        
		if (response != null) {
			if (response.getElementsByTagName("ERROR").item(0)) {
			    alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
			    document.getElementById("precioVenta").value = "";
			    document.getElementById("precioTotal").value = "";
			    document.getElementById("porcentajeImpuestos").value = "";
			    return null;
			}
			
			return response.getElementsByTagName('porcentajeImpuestos').item(0).firstChild.data;
		}
		else {
			alert("No se ha podido conectar con el servidor");
			return null;
		}
	}
