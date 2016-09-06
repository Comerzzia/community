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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="tienda" value="${formularioTienda.registroActivo}" />

<script type="text/javascript">
    function checkFormPestaña() {    	
	    if (!esValido("personaContacto", "TEXTO", false)) {
            return false;
        }
        if (!esValido("domicilio", "TEXTO", false)) {
            return false;
        }
        if (!esValido("poblacion", "TEXTO", false)) {
            return false;
        }
        if (!esValido("provincia", "TEXTO", false)) {
            return false;
        }
        if (!esValido("cp", "ENTERO", false)) {
            return false;
        }
        if (!esValido("telefono1", "ENTERO", false)) {
            return false;
        }
        if (!esValido("telefono1", "ENTERO", false)) {
            return false;
        }
        if (!esValido("fax", "ENTERO", false)) {
            return false;
        }
        if(!esValido("codCliente", "AYUDA", false, "desCliente", "CLIENTES")) {
	       	return false;
        }
        if(!esValido("codConceptoAlmacen", "AYUDA", true, "desConceptoAlmacen", "CONCEPTOS_ALMACENES_VENT")){
	       	return false;
        }
        if(!esValido("codMedioPago", "AYUDA", true, "desMedioPago", "MEDIOS_PAGO_EFECTIVOS")){
	       	return false;
        }       
        if(!esValido("idTipoTienda", "AYUDA", true, "desTipoTienda", "TIENDAS_TIPOS")) {
	       	return false;
        }
        
        return true;
    }

    function forzarEnvioArticulos(){
		if(confirm("¿Está seguro que desea forzar el envío de artículos completo?")){
			document.getElementById("accion").value = "leerFormulario";
			document.getElementById("operacion").value = "forzarEnvioArticulos";
			document.getElementById("frmDatos").submit();
			_esperando();
		}
    }
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Contacto"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
	
	  <tr>	        
        <td>Persona Contacto:</td>
        <td><cmz:campoTexto id="personaContacto" valor="${tienda.personaContacto}" requerido="false" anchura="300px" longitudMaxima="45" 
                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
        </td>
      </tr>  

	  <tr>	        
        <td>Domicilio:</td>
        <td><cmz:campoTexto id="domicilio" valor="${tienda.domicilio}" requerido="false" anchura="300px" longitudMaxima="50" 
                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
        </td>
      </tr>  

	  <tr>	        
        <td>Población:</td>
        <td><cmz:campoTexto id="poblacion" valor="${tienda.poblacion}" requerido="false" anchura="300px" longitudMaxima="50" 
                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
        </td>
      </tr>  

	  <tr>	        
        <td>Provincia:</td>
        <td><cmz:campoTexto id="provincia" valor="${tienda.provincia}" requerido="false" anchura="150px" longitudMaxima="50" 
                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
        </td>
      </tr>  
	    
	  <tr>	  
        <td>Código Postal:</td>
        <td><cmz:campoTexto id="cp" valor="${tienda.cp}" requerido="false" anchura="40px" longitudMaxima="8" 
                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
        </td>
      </tr>  

	  <tr>	        
        <td>Teléfonos:</td>
        <td>
        	<cmz:campoTexto id="telefono1" valor="${tienda.telefono1}" requerido="false" anchura="75px" longitudMaxima="15" 
                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
        	<cmz:campoTexto id="telefono2" valor="${tienda.telefono2}" requerido="false" anchura="75px" longitudMaxima="15" 
                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
        </td>
      </tr>  

	  <tr>	        
        <td>Fax:</td>
        <td><cmz:campoTexto id="fax" valor="${tienda.fax}" requerido="false" anchura="75px" longitudMaxima="15" 
                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
        </td>
      </tr>
      
      <tr>
      	<td>Cliente:</td>
        <td>
          <cmz:ayuda nombreAyuda="CLIENTES" soloLectura="${!formularioTienda.enInsercion}">
			<cmz:codigoAyuda idCodigo="codCliente" longitudMaximaCodigo="11" valorCodigo="${tienda.codCliente}" anchuraCodigo="90px"></cmz:codigoAyuda>
			<cmz:descripcionAyuda idDescripcion="desCliente" anchuraDescripcion="300px" valorDescripcion="${tienda.desCliente}"></cmz:descripcionAyuda>
		  </cmz:ayuda>
        </td>
      </tr>  
 
    </table>
  </cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Datos por defecto para la Venta"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table cellpadding="2px" cellspacing="2px" border="0px">
			<tr>
				<td>Concepto de Almacén:</td>
				<td><cmz:ayuda requerido="true"	soloLectura="${!formularioTienda.editable}"	nombreAyuda="CONCEPTOS_ALMACENES_VENT">
					<cmz:codigoAyuda idCodigo="codConceptoAlmacen"
						valorCodigo="${tienda.codConceptoAlmacen}" anchuraCodigo="100px"
						longitudMaximaCodigo="4"></cmz:codigoAyuda>
					<cmz:descripcionAyuda idDescripcion="desConceptoAlmacen"
						valorDescripcion="${tienda.desConceptoAlmacen}"
						anchuraDescripcion="200px" editable="${formularioTienda.editable}"></cmz:descripcionAyuda>
				</cmz:ayuda></td>
			</tr>
			<tr>
				<td>Medio de Pago:</td>
				<td><cmz:ayuda requerido="true"	soloLectura="${!formularioTienda.editable}"	nombreAyuda="MEDIOS_PAGO_EFECTIVOS">
					<cmz:codigoAyuda idCodigo="codMedioPago"
						valorCodigo="${tienda.codMedioPago}" anchuraCodigo="100px"
						longitudMaximaCodigo="4"></cmz:codigoAyuda>
					<cmz:descripcionAyuda idDescripcion="desMedioPago"
						valorDescripcion="${tienda.desMedioPago}"
						anchuraDescripcion="200px" editable="${formularioTienda.editable}"></cmz:descripcionAyuda>
				</cmz:ayuda></td>
			</tr>
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Tipo de Tienda"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">

      <tr>
        <td>Tipo de Tienda:</td>
        <td>
          <cmz:ayuda  nombreAyuda="TIENDAS_TIPOS" soloLectura="${!formularioTienda.enInsercion}" requerido="true">
			<cmz:codigoAyuda idCodigo="idTipoTienda" longitudMaximaCodigo="11" valorCodigo="${tienda.idTipoTienda}" anchuraCodigo="90px"></cmz:codigoAyuda>
			<cmz:descripcionAyuda editable="${formularioTienda.enInsercion}" idDescripcion="desTipoTienda" anchuraDescripcion="300px" valorDescripcion="${tienda.desTipoTienda}"></cmz:descripcionAyuda>
		  </cmz:ayuda>
        </td>
      </tr>

    </table>  
  </cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Versión de Artículos"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">

      <tr>
        <td>Versión Activa:</td>
        <td><cmz:campoTexto id="versionArticulos" valor="${tienda.versionArticulos}" requerido="false" anchura="100px" 
                            editable="false" soloLectura="true"/>
        </td>
        <td>Fecha:</td>
        <td><cmz:campoTexto id="fechaVersionArticulos" requerido="false" anchura="150px" editable="false" soloLectura="true">
        		<fmt:formatDate value="${tienda.fechaVersionArticulos}" pattern="dd/MM/yyyy HH:mm:ss"/>
        	</cmz:campoTexto>                         
        </td>
        <c:if test="${formularioTienda.editable && tienda.versionArticulos != 0}">
        <td>
        	<img alt="Forzar" src="comun/images/iconos/invertir.png" title="Forzar envío de artículos completo"
        		border="0" style="cursor: pointer;float:none" onclick="forzarEnvioArticulos();">
        </td>
        </c:if>
      </tr>
      
      <tr>
        <td>Versión Revisada:</td>
        <td><cmz:campoTexto id="versionArticulosRevisada" valor="${tienda.versionArticulosRevisada}" requerido="false" anchura="100px"
                            editable="false" soloLectura="true"/>
        </td>
        <td>Fecha:</td>
        <td><cmz:campoTexto id="fechaVersionArticulosRevisada" requerido="false" anchura="150px" editable="false" soloLectura="true">
        		<fmt:formatDate value="${tienda.fechaVersionArticulosRevisada}" pattern="dd/MM/yyyy HH:mm:ss"/>
        	</cmz:campoTexto>                         
        </td>
      </tr>      
      
    </table>  
  </cmz:cuerpoPanel>
</cmz:panel>
