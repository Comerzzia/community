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

    function buscarCetgorizaciones(){
		if(buscar('CATEGORIZACIONES','codCategorizacion','desCategorizacion')){
			mostrarCheckEscaparates();
		}
    }
    
    function mostrarCheckEscaparates(){
		buscarXML('CATEGORIZACIONES','codCategorizacion','desCategorizacion');

		if(document.getElementById("codCategorizacion").value.length > 0 && document.getElementById("desCategorizacion").value.length > 0){
			document.getElementById("divEscaparate").style.visibility = 'visible';
		}
		else{
			document.getElementById("divEscaparate").style.visibility = 'hidden';
			document.getElementById("escaparate").checked = false;
		}
    }
	function ayudaImpuestos(){
		if(buscar('IMPUESTOS','codImpuesto','desImpuesto')){
			document.getElementById("porcentajeImpuestos").value = "";
			calcular();
		}
		
	
	}

