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

function aceptar() {
	document.getElementById("accion").value = "leer";
	document.getElementById("operacion").value = "salvar";
	document.getElementById("frmDatos").submit();
}
function keyDownEnter(){
	aceptar();
}
function keyDownEsc(){
	cancelar();
}
function cancelar(){
	document.getElementById("accion").value = "volver";
	document.getElementById("frmDatos").submit();
}
function cambiarPermiso(tipo, idPermiso){
	var idInput = "permiso|" + idPermiso;
	var permiso = document.getElementById(idInput).value;
	if (tipo == "USU"){
		if (permiso == ""){
			permiso = 0;
		}
		else{
			permiso = 1 + parseInt(permiso);
		}
		if (permiso == 3){
			permiso = "";
		}
	}
	else{ // tipo == PER
		permiso = 1 + parseInt(permiso);
		if (permiso == 3){
			permiso = 0;
		}
	}
	document.getElementById(idInput).value = permiso;
	cambiarImagen(idPermiso, document.getElementById(idInput).value);
}
function cambiarImagen(idPermiso, permiso){
	nombreImagen = "core/permisos/images/permiso_";
	if (permiso == ""){
		nombreImagen = nombreImagen + "heredado";
	}
	else if (permiso == "0"){
		nombreImagen = nombreImagen + "denegado";
	}
	else if (permiso == "1"){
		nombreImagen = nombreImagen + "concedido";
	}
	else if (permiso == "2"){
		nombreImagen = nombreImagen + "administrar";
	}
	nombreImagen = nombreImagen + "_chico.png";
	document.getElementById(idPermiso).src = nombreImagen;
}
function addUsuario(){
	if(buscar("USUARIOS", "idUsuario", "desUsuario")){
    	document.getElementById("accion").value = "leer";
    	document.getElementById("operacion").value = "altaUsuario";
    	document.getElementById("frmDatos").submit();
	}
}
function addPerfil(){
	if(buscar("PERFILES", "idPerfil", "desPerfil")){
    	document.getElementById("accion").value = "leer";
    	document.getElementById("operacion").value = "altaPerfil";
    	document.getElementById("frmDatos").submit();
	}
}
function sinPermisos(operacion){
	alert("No dispone de permisos de administración sobre la operación " + operacion);
}
