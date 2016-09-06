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

// Funciones genéricas de Formularios


// Realizar la consulta en un formulario de búsqueda
function consultar() {
	if(__checkForm()) {
		document.getElementById("accion").value = "buscar";
		document.getElementById("operacion").value = "consultar";
		document.getElementById("frmDatos").submit();
		_esperando();
	}
}

// Solicitar una página en un formulario de búsqueda
function paginar(pagina) {
	if(__checkForm()) {
		document.getElementById("accion").value = "buscar";
		document.getElementById("operacion").value = "paginar";
		document.getElementById("pagina").value = pagina;
		document.getElementById("frmDatos").submit();
		_esperando();
	}
}

// Ordenar por una columna los resultados de una búsqueda
function ordenar(columna) {
	if(__checkForm()) {
		document.getElementById("accion").value = "buscar";
		document.getElementById("operacion").value = "ordenar";
		document.getElementById("columna").value = columna;
		document.getElementById("frmDatos").submit();
		_esperando();
	}
}

// Formulario de alta
function alta() {
	document.getElementById("accion").value = "alta";
	document.getElementById("frmDatos").submit();
	_esperando();
}

// Formulario de consulta
function ver(idObjeto) {
	checkIdObjeto();
	
	document.getElementById("accion").value = "ver";
	if (idObjeto != null) {
		document.getElementById("idObjeto").value = idObjeto;
	}
	document.getElementById("frmDatos").submit();
	_esperando();
}

// Formulario de edición
function editar(idObjeto) {
	checkIdObjeto();
	
	document.getElementById("accion").value = "editar";
	if (idObjeto != null) {
		document.getElementById("idObjeto").value = idObjeto;
	}
	document.getElementById("frmDatos").submit();
	_esperando();
}

// Eliminar objeto
function eliminar(idObjeto) {
	checkIdObjeto();
	
	if(confirm("¿Está seguro de que desea eliminar el registro?")) {
		document.getElementById("accion").value = "eliminar";
		if (idObjeto != null) {
			document.getElementById("idObjeto").value = idObjeto;
		}
		document.getElementById("frmDatos").submit();
		_esperando();
	}
}

// Volver al formulario de búsqueda
function volver() {
	document.getElementById("accion").value = "buscar";
    document.getElementById("frmDatos").submit();
	_esperando();
}

//Aceptar los cambios de un formulario
function aceptar() {
	if(__checkForm()) {
		document.getElementById("accion").value = "leerFormulario";
		document.getElementById("operacion").value = "aceptar";
	    document.getElementById("frmDatos").submit();
		_esperando();
	}
}

// Cancelar los cambios realizados en un formulario
function cancelar() {
	document.getElementById("accion").value = "leerFormulario";
	document.getElementById("operacion").value = "cancelar";
    document.getElementById("frmDatos").submit();
	_esperando();
}

// Seleccionar una pestaña
function seleccionaPestaña(id) {
    if (__checkFormPestaña()) {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("operacion").value = "pestaña";
    	document.getElementById("indice").value = id;
	    document.getElementById("frmDatos").submit();
		_esperando();
    }
}

// Cambiar vista pestaña a modo tabla
function vistaTablaPestaña(){
	document.getElementById("accion").value = "leerFormulario";
	document.getElementById("operacion").value = "vistaTablaPestaña";
    document.getElementById("frmDatos").submit();
	_esperando();
}

//Formulario de nuevo registro en pestaña
function nuevoRegistroPestaña() {
	document.getElementById("accion").value = "leerFormulario";
	document.getElementById("operacion").value = "nuevoRegistroPestaña";
	document.getElementById("frmDatos").submit();
	_esperando();
}

// Formulario de consulta de registro en pestaña
function verRegistroPestaña(indice){
	document.getElementById("accion").value = "leerFormulario";
	document.getElementById("operacion").value = "verRegistroPestaña";
	document.getElementById("indice").value = indice;
	document.getElementById("frmDatos").submit();
	_esperando();
}

// Formulario de edición de registro en pestaña
function editarRegistroPestaña(indice) {
	document.getElementById("accion").value = "leerFormulario";
	document.getElementById("operacion").value = "editarRegistroPestaña";
	document.getElementById("indice").value = indice;
	document.getElementById("frmDatos").submit();
	_esperando();
}

// Eliminar registro de pestaña
function eliminarRegistroPestaña(indice) {
	if (confirm("¿Desea borrar el registro seleccionado?")) {
		document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("operacion").value = "eliminarRegistroPestaña";
    	document.getElementById("indice").value = indice;
  	    document.getElementById("frmDatos").submit();
		_esperando();
	}
}

//Aceptar cambios del formuario de la pestaña
function aceptarRegistroPestaña() {
    if (__checkFormRegistroPestaña()) {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("operacion").value = "aceptarRegistroPestaña";
    	document.getElementById("frmDatos").submit();
		_esperando();
    }
}

// Cancelar cambios del formulario de la pestaña
function cancelarRegistroPestaña() {
	document.getElementById("accion").value = "leerFormulario";
	document.getElementById("operacion").value = "cancelarRegistroPestaña";
	document.getElementById("frmDatos").submit();
	_esperando();
}

//Comprobar que se ha definido el campo idObjeto
function checkIdObjeto() {
	if (document.getElementById("idObjeto") == null) {
		throw("No se ha definido idObjeto");
	}
}

//Comprueba si existe función de validación de formulario
//y en su caso la llama
function __checkForm() {
	if (window.checkForm) {
		return (checkForm() && __checkFormPestaña());
	}
	else {
		return true;
	}
}

//Comprueba si existe función de validación de formulario de pestaña
//y en su caso la llama
function __checkFormPestaña() {
	if (window.checkFormPestaña) {
		return checkFormPestaña();
	}
	else {
		return true;
	}
}

//Comprueba si existe función de validación de registro del formulario
//de la pestaña y en su caso la llama
function __checkFormRegistroPestaña() {
	if (window.checkFormRegistroPestaña) {
		return checkFormRegistroPestaña();
	}
	else {
		return true;
	}
}
