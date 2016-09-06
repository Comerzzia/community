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

// Funciones genéricas de Mantenimientos

// Definición de estados
var __ESTADO_SIN_MODIFICAR = 0;
var __ESTADO_MODIFICADO = 1;
var __ESTADO_BORRADO = 2;
var __ESTADO_NUEVO = 3;


function __checkForm() {
	if (window.checkForm) {
		return checkForm();
	}
	else {
		return true;
	}
}

function consultar() {
	if(__checkForm()) {
		document.getElementById("accion").value = "buscar";
		document.getElementById("operacion").value = "consultar";
		document.getElementById("frmDatos").submit();
		_esperando();
	}
}

function paginar(pagina) {
	if(__checkForm()) {
		document.getElementById("accion").value = "buscar";
		document.getElementById("operacion").value = "paginar";
		document.getElementById("pagina").value = pagina;
		document.getElementById("frmDatos").submit();
		_esperando();
	}
}

function ordenar(columna) {
	if(__checkForm()) {
		document.getElementById("accion").value = "buscar";
		document.getElementById("operacion").value = "ordenar";
		document.getElementById("columna").value = columna;
		document.getElementById("frmDatos").submit();
		_esperando();
	}
}

function alta() {
	document.getElementById("accion").value = "alta";
	document.getElementById("frmDatos").submit();
	_esperando();
}

function ver(idObjeto) {
	validarIdObjeto();
	
	document.getElementById("accion").value = "ver";
	if (idObjeto != null) {
		document.getElementById("idObjeto").value = idObjeto;
	}
	document.getElementById("frmDatos").submit();
	_esperando();
}

function editar(idObjeto) {
	document.getElementById("accion").value = "editar";
	if (idObjeto != null) {
		document.getElementById("idObjeto").value = idObjeto;
	}
	document.getElementById("frmDatos").submit();
	_esperando();
}

function eliminar(idObjeto) {
	if(confirm("¿Está seguro de que desea eliminar el registro?")) {
		document.getElementById("accion").value = "eliminar";
		if (idObjeto != null) {
			document.getElementById("idObjeto").value = idObjeto;
		}
		document.getElementById("frmDatos").submit();
		_esperando();
	}
}

function volver() {
	document.getElementById("accion").value = "buscar";
    document.getElementById("frmDatos").submit();
	_esperando();
}

function cancelar() {
	validarIdObjeto();
	
	if (document.getElementById("estadoObjeto").value == __ESTADO_NUEVO) {
		volver();
	}
	else {
		ver();
	}
}

function validarIdObjeto() {
	if (document.getElementById("idObjeto") == null) {
		throw("No se ha definido idObjeto");
	}
}

