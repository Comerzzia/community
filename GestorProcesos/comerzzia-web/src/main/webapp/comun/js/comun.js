/**
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
 */

// Funciones comunes

var _lastMenu = null;

function get(id ){
	return document.getElementById(id);
}
function getValue(id) {
	return document.getElementById(id).value;
}
function setValue(id, valor) {
	document.getElementById(id).value = valor;
}

// a esta función se de debe llamar en el onkeydown del body para tratar la tecla intro y esc.
// se llamará así: onkeydown="keyDown(event);"
// añadir en la jsp las funciones keyDownEnter() y/o keyDownEsc() - no son obligatorias -
function keyDown(e) {
	var key;
	var ev;
	if (window.event) {
    	ev = window.event;
    	key = ev.keyCode;
    }
    else {
    	key = e.which;
    	ev = e;
    }
    if (key == 13) { // intro
		if (window.keyDownEnter) {
			keyDownEnter();
		}
		if (window.event) {
			ev.cancelBubble = true;
		}
		else {
			ev.stopPropagation();
		}
    }
    else if (key == 27) { // escape
		if (window.keyDownEsc) {
			keyDownEsc(); 
		}  	
    }
}

//Establece el foco en el primer elemento de los indicados 
//por parámetro que no sea readonly
function setFoco() {
	try {
		for (i=0; i<arguments.length; i++) {
			try {
				if (!document.getElementById(arguments[i]).readOnly) {
					document.getElementById(arguments[i]).focus();
					break;
				}
			}
			catch (exc) {
			}
		}
	}
	catch (exc) {
	}
}

//Muestra el menú de acciones de la cabecera de los paneles
function _toggleMenu(e, menuId)
{
	 // hide any open menu
	 if (_lastMenu != null && _lastMenu != menuId) {
		 document.getElementById(_lastMenu).style.display = 'none';
		 _lastMenu = null;
	 }

	 // toggle visibility of the specified element id
	 if (document.getElementById(menuId).style.display == 'none') {
		 document.getElementById(menuId).style.display = 'block';
		 _lastMenu = menuId;

		 e.cancelBubble = true;
		 if (e.stopPropagation) {
			e.stopPropagation();
		 }
		 document.onclick = _hideLastMenu;
	 }
	 else {
		 document.getElementById(menuId).style.display = 'none';
		 document.onclick = null;
	 }
}
		
//Oculta el menú de acciones de la cabecera de los paneles
function _hideLastMenu()
{
	if (_lastMenu != null) {
		document.getElementById(_lastMenu).style.display = 'none';
		_lastMenu = null;
		document.onclick = null;
	}
}

//Ver permisos de la acción
function verPermisos(idAccion) {
	var url = 'ver.permisos.screen?idAccion=' + idAccion;
    abrirVentana(url,350,350);
}

// Administrar permisos de la acción
function adminPermisos(idAccion) {
    document.getElementById("frmDatos").action = 'administrar.permisos.screen?idAccion=' + idAccion;
	document.getElementById("frmDatos").submit();
}

function abrirVentanaModal(url, alto, ancho) {
    var rc;
    var opciones = "dialogHeight:" + alto +"px;"
                 + "dialogWidth:"+ ancho + "px;"
                 + "resizable:yes;"
                 + "scroll:yes;"
                 + "status:no;"
                 + "help:no;"
                 + "center:yes;";
                         
    rc = window.showModalDialog(url, self, opciones);
            
    return rc;
}


function abrirVentanaCentrada(url, alto, ancho, nombre, configuracion) {
	var anchoPantalla = screen.width;
	var altoPantalla = screen.height;
    var distanciaArriba = (altoPantalla/2)-(alto/2);
    var distanciaLateral = (anchoPantalla/2)-(ancho/2);
	var estilo = "";

    if (!configuracion) {
		estilo = "titlebar=no," 
               + "menubar=no," 
               + "location=no," 
               + "status=no," 
               + "scrollbars=yes," 
               + "directories=no,"
               + "toolbar=no," 
               + "border=no," 
               + "resizable=yes,"
               + "width=" + ancho + ","
               + "height=" + alto;
    }
	else {
		estilo = configuracion + ",width=" + ancho + ",height=" + alto;
    }
    
    estilo = estilo + ",top="+distanciaArriba+",left="+distanciaLateral;
	
	return window.open(url,nombre,estilo);
}


function abrirVentana() {
    if (window.showModalDialog) {
        return abrirVentanaModal(arguments[0], arguments[1], arguments[2]);
    }
    else {
        var newwindow = abrirVentanaCentrada(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]);
        if (window.focus) {
        	newwindow.focus();
        }
    }
    return false;
}

function _esperando(){
	try{
		document.body.style.cursor = "wait";
		var icono = document.getElementById("_icono_menu_item");
		if (icono){
			icono.src = "comun/images/iconos/estrella_on.gif";
			icono.style.width = "18px";
		}
	}
	catch(e){}
}
