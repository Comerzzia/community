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

	function checkFormRegistroPestaña() {
		if(!esValido("codArticulo", "AYUDA", true, "desArticulo", "ARTICULOS")){
			return false;
		}
		if(!esValido("precioCosto","NUMERICO", true, 2, false)){
			return false;
		}
		if (document.getElementById("factorMarcaje").value == "" && document.getElementById("precioMarcaje").value == ""){
			alert("Debe indicar un factor o un precio de marcaje para poder calcular el precio aplicado.");
			document.getElementById("factorMarcaje").focus();
			return false;
		}
	    return true;
	}

	function validarArticuloTarifa(){
		var codArticulo = document.getElementById("codArticulo").value;
		var idGrupoImpuesto = document.getElementById("idGrupoImpuesto").value; 
		var idTratImpuestos = document.getElementById("idTratImpuestos").value; 

		var url = "articulo.tarifa.cmz?codArticulo=" + escape(codArticulo)
					+ "&idGrupoImpuesto=" + idGrupoImpuesto
					+ "&idTratImpuestos=" + idTratImpuestos;

	    response = xmlRequest(url);        
	    if (response != null) {
	        if (response.getElementsByTagName("ERROR").item(0)) {
	            alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
	            document.getElementById("codArticulo").select();
	            document.getElementById("codArticulo").focus();
	            document.getElementById("desArticulo").value = "";
	            document.getElementById("precioCosto").value = "";
	            document.getElementById("porcentajeImpuestos").value = "";
	            borrarMarcajes();
	    		borrarResultados();
	            return null;
	        }
	        return response;
	    }
	    else {
	        alert("No se ha podido conectar con el servidor");
	        return null;
	    }
	}

	function ayudaArticuloTarifa(){
		if(buscar('ARTICULOS','codArticulo', 'desArticulo')){
			obtenerInfoArticulo();
		}
	}

	function obtenerInfoArticulo(){
		var response = validarArticuloTarifa();
		if (response != null){
			document.getElementById("codArticulo").value = response.getElementsByTagName('codArticulo').item(0).firstChild.data;
	        document.getElementById("desArticulo").value = response.getElementsByTagName('desArticulo').item(0).firstChild.data;
	        var precioCosto = response.getElementsByTagName('precioCosto').item(0).firstChild.data;
	        document.getElementById("precioCosto").value = formateaNumero(precioCosto, 2);
	        document.getElementById("porcentajeImpuestos").value = response.getElementsByTagName('porcentajeImpuestos').item(0).firstChild.data;
	        
		}
		borrarMarcajes();
		borrarResultados();
	}
	function obtenerPorcentajeImpuestos(){
		var response = validarArticuloTarifa();
		if (response != null){
	        document.getElementById("porcentajeImpuestos").value = response.getElementsByTagName('porcentajeImpuestos').item(0).firstChild.data;
	        return document.getElementById("porcentajeImpuestos").value;
		}
		return null;
	}

