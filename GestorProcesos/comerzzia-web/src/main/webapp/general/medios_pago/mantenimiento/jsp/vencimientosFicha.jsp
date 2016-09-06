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
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="vencimiento" value="${formularioMedioPago.formularioPestañaActiva.registroActivo}" />

<script type="text/javascript">
	function checkFormRegistroPestaña() {
		if (!esValido("desVencimiento", "TEXTO", true)) {
            return false;
        }
       	var numeroVencimientos = document.getElementById("numeroVencimientos").value;
       	if(numeroVencimientos <= 0){
			alert("El número de vencimientos debe ser mayor que 0");
			document.getElementById("numeroVencimientos").focus();
            document.getElementById("numeroVencimientos").select();
            return false;
       	}

      	if(!comprobarDias()){
          	return false;
        }
		
	    return true;
	}
	
	function comprobarDias(){
		var diasCadencia = document.getElementById("diasCadencia").value;
		var diasEntreVencimientos = document.getElementById("diasEntreVencimientos").value;

		if(!document.getElementById("diasNaturales").checked){
			if(diasCadencia%30 != 0){
				alert("El número de días de cadencia debe ser múltiplo de 30");
				document.getElementById("diasCadencia").focus();
	            document.getElementById("diasCadencia").select();
	            
				return false;
			}

			if(diasEntreVencimientos%30 != 0){
				alert("El número de días entre vencimientos debe ser múltiplo de 30");
				document.getElementById("diasEntreVencimientos").focus();
	            document.getElementById("diasEntreVencimientos").select();
	            
				return false;
			}
		}

		return true;		
	}

    function cambiarVencimientos(){
        var dias = document.getElementById("numeroVencimientos").value;
        if(dias == 1){
        	document.getElementById("tr_diasVencimientos").style.display = "none";
        	document.getElementById("diasEntreVencimientos").value = 0;
        }else{
        	document.getElementById("tr_diasVencimientos").style.display = "";
        }
    }
  
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Vencimiento">
    <cmz:acciones numAccionesVisibles="8">
      <c:choose>
        <c:when test="${formularioMedioPago.formularioPestañaActiva.editable}">
          <cmz:accionSalvarLinea onclick="aceptarRegistroPestaña();"/>
          <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
        </c:when>
        <c:otherwise>
          <cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
          
          <c:if test="${formularioMedioPago.editable}">
            <cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir Vencimiento"/>
            <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Vencimiento" onclick="editarRegistroPestaña(${formularioMedioPago.formularioPestañaActiva.indiceRegistroActivo});" />
            <cmz:accion icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar Vencimiento" onclick="eliminarRegistroPestaña(${formularioMedioPago.formularioPestañaActiva.indiceRegistroActivo});" />
          </c:if>
          
          <cmz:accionNavegacionRegistros onclick="verRegistroPestaña" 
               total="${formularioMedioPago.formularioPestañaActiva.total}" 
               actual="${formularioMedioPago.formularioPestañaActiva.actual}" 
               primero="${formularioMedioPago.formularioPestañaActiva.primero}"
               anterior="${formularioMedioPago.formularioPestañaActiva.anterior}"
               siguiente="${formularioMedioPago.formularioPestañaActiva.siguiente}"
               ultimo="${formularioMedioPago.formularioPestañaActiva.ultimo}"/>
        </c:otherwise>
      </c:choose>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
        <td>Descripción:</td>
        <td colspan="3">
          <cmz:campoTexto id="desVencimiento" valor="${vencimiento.desVencimiento}" editable="${formularioMedioPago.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioMedioPago.formularioPestañaActiva.editable}" anchura="320" longitudMaxima="45" requerido="true"></cmz:campoTexto>
        </td>
      </tr>
      
      <tr>
        <td>Nº Vencimientos:</td>
        <td>
          <cmz:campoTexto id="numeroVencimientos" valor="${vencimiento.numeroVencimientos}" onChange="cambiarVencimientos();" editable="${formularioMedioPago.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioMedioPago.formularioPestañaActiva.editable}" anchura="50" longitudMaxima="5"></cmz:campoTexto>
        </td>
        <td width="120">Días de cadencia:</td>
        <td>
          <cmz:campoTexto id="diasCadencia" valor="${vencimiento.diasCadencia}" editable="${formularioMedioPago.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioMedioPago.formularioPestañaActiva.editable}" anchura="50" longitudMaxima="5"></cmz:campoTexto>
        </td>
        <td>
          <input type="checkbox" value="" id="diasNaturales" name="diasNaturales" 
              <c:if test="${vencimiento.naturales}">checked="checked"</c:if> 
              <c:if test="${!formularioMedioPago.formularioPestañaActiva.editable}">disabled</c:if>/> Naturales
        </td>
      </tr>  
       
      <tr id="tr_diasVencimientos" <c:if test="${vencimiento.numeroVencimientos == 1}">style="display:none"</c:if>>
        <td></td>
        <td></td>
        <td width="120">Días entre vencimientos:</td>
        <td>
          <cmz:campoTexto id="diasEntreVencimientos" valor="${vencimiento.diasEntreVencimientos}" editable="${formularioMedioPago.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioMedioPago.formularioPestañaActiva.editable}" anchura="50" longitudMaxima="5"></cmz:campoTexto>
        </td>
      </tr>
      
    </table>
  </cmz:cuerpoPanel>
 </cmz:panel>
