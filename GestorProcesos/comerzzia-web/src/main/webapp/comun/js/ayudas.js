/**
 * Recibe el id de los campos código y descripción y elimina sus valores
 * @param inputCodigo
 * @param inputDescripcion
 * @return
 */
function borrarDatos(inputCodigo, inputDescripcion){
	document.getElementById(inputCodigo).value = "";
	document.getElementById(inputDescripcion).value = "";
}

/**
 * Recibe el nombre de la ayuda más el input del código y la descripción.
 * @param nombreAyuda
 * @param inputCodigo
 * @param inputDescripcion
 * @return Rellena los input pasados como parámetros con sus valores correspondientes.
 */
function buscar(nombreAyuda, inputCodigo, inputDescripcion, accion, campoFiltro) {
	if(campoFiltro != null){
	    var url = "ayuda.screen?nombreAyuda=" + nombreAyuda + "&campoFiltro=" + document.getElementById(campoFiltro).value;
	}
	else{
		var url = "ayuda.screen?nombreAyuda=" + nombreAyuda;
	}

    var rt = abrirVentana(url,560,420);

    var actualizado = false;
    if (rt != null) {
        if (rt != "") {
            var lst = new Array();
            lst = rt.split("|");
            var codigo = lst[0];
            var descripcion = lst[1];
            eval('document.all("' + inputCodigo + '").value=codigo');
            eval('document.all("' + inputDescripcion + '").value=descripcion');
            actualizado = true;
            
            if(accion != null){
            	buscarAccionXML(accion, inputCodigo, inputDescripcion);
            }
        }
    }
    return actualizado;
}

function buscarXML(nombreAyuda, inputCodigo, inputDescripcion) {
	return serverFieldChanged("ayuda.cmz?nombreAyuda=" + nombreAyuda, inputCodigo, inputDescripcion);
}

function serverFieldChanged(server, cod, des) {
    eval("document.getElementById('" + des + "').value = ''");

    if (eval("document.getElementById('" + cod + "').value") != "") {
        return eval("serverUpdateField('" + server + "', '" + cod + "', '" + des + "', document.getElementById('" + cod + "').value)");
    }
    
    return true;
}

function serverUpdateField(server, cod, des, value) {
    var url = server + "&codigo=" + escape(value);

    response = xmlRequest(url);        
    if (response != null) {
        if (response.getElementsByTagName("ERROR").item(0)) {
            alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
            document.getElementById(cod).select();
            document.getElementById(cod).focus();
            return false;
        }
        else {
            document.getElementById(cod).value = response.getElementsByTagName('codigo').item(0).firstChild.data;
            document.getElementById(des).value = response.getElementsByTagName('descripcion').item(0).firstChild.data;
            return true;
        }
    }
    else {
        alert("No se ha podido conectar con el servidor");
        return false;
    }
}

function buscarAccionXML(accion, inputCodigo, inputDescripcion) {
	var response = serverFieldChangedAccion(accion + ".cmz", inputCodigo, inputDescripcion);
	if (response!= null){
		if(window.tratarXMLAyuda){
			return tratarXMLAyuda(response);
		}
		else{
			throw("No existe la función tratarXMLAyuda(response)");
		}
	}
	else{
		return false;
	}
}

function serverFieldChangedAccion(server, cod, des) {
	eval("document.getElementById('" + des + "').value = ''");
    if (eval("document.getElementById('" + cod + "').value") != "") {
        return eval("serverUpdateFieldAccion('" + server + "', '" + cod + "', document.getElementById('" + cod + "').value)");
    }
    
    return null;
}

function serverUpdateFieldAccion(server, cod, value) {
    var url = server + "?codigo=" + escape(value);

    response = xmlRequest(url);        
    if (response != null) {
        if (response.getElementsByTagName("ERROR").item(0)) {
            alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
            document.getElementById(cod).select();
            document.getElementById(cod).focus();
            return null;
        }
       	return response;
    }
    else {
        alert("No se ha podido conectar con el servidor");
        return null;
    }
}

function xmlRequest(url) {
    var req;
    
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        if (req != null) {
            req.open("GET", url, false);
            req.send(null);
        }
        else {
            return null;
        }
    }
    else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req != null) {
            req.open("GET", url, false);
            req.send();
        }
        else {
            return null;
        }
    }
    else {
        return null;
    }
    
    return req.responseXML.documentElement;
}
// Esta función está capturando el evento onkeydown sobre los input de ayuda de
// tipo código para tratar el problema de simultaneidad de eventos al pulsa la 
// tecla intro en formularios que hagan submit en tales circustancias.
// Las soluciones dadas son las siguientes:
// Internet explorer: Forzamos la validación del campo de ayuda y luego llamamos
//     a la función que trata la pulsación del intro en el body.
// Mozilla: Borramos la descripción, esperamos 20 milisegundos y llamamos a la función
//    que trata la pulsación del intro en el body. El tratamiento es diferente porque
//    en este navegador el intro sobre un input ejecuta automáticamente y en un hilo
//    de ejecución diferente un onchange.
function _onkeydownAyuda(e, obj, idDescripcion){
	var key;
	if (window.event) {
    	key = window.event.keyCode;
    }
    else {
    	key = e.which;
    }
    if (key == 13) { // Tecla intro
		if (window.event) { // Internet Explorer
			if (window.keyDownEnter){ // si tenemos función que trate el intro en el body
				window.event.cancelBubble = true;
				if(obj.onchange()){
					keyDownEnter();
		    	}
			}
		}
		else { // Mozilla Firefox
			e.stopPropagation();
	    	if (window.keyDownEnter) { // si tenemos función que trate el intro en el body
	    		document.getElementById(idDescripcion).value = "";
	    		setTimeout ('keyDownEnter()', 20);
	    	}
		}
    }
    
}

