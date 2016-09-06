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

<c:set var="cliente" value="${formularioCliente.registroActivo}" />

<script type="text/javascript">
    function checkFormPestaña() {
    	if (!esValido("nombreComercial", "TEXTO", false)) {
            return false;
        }
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
		if (!esValido("codPais", "AYUDA", false, "desPais", "PAISES")) {
			return false;
		}
        if (!esValido("cp", "ENTERO", false)) {
            return false;
        }
        if (!esValido("telefono1", "ENTERO", false)) {
            return false;
        }
        if (!esValido("telefono2", "ENTERO", false)) {
            return false;
        }
        if (!esValido("fax", "ENTERO", false)) {
            return false;
        }
        if (!esValido("email", "TEXTO", false)) {
            return false;
        }
    	if (!esValido("idTratImp", "TABLA", true, "tratamiento impuestos")) {
            return false;
        }
		if (!esValido("codTar", "AYUDA", false, "desTar", "TARIFAS")) {
			return false;
		}
		if (!esValido("codSec", "AYUDA", false, "desSec", "SECCIONES")) {
			return false;
		}
        return true;
    }
    
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Contacto"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
        <td>Nombre comercial:</td>
        <td>
          <cmz:campoTexto id="nombreComercial" valor="${cliente.nombreComercial}" requerido="false" anchura="300px" longitudMaxima="45"
                            editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}"/>
        </td>
      </tr>
	
	  <tr>	        
        <td>Persona contacto:</td>
        <td><cmz:campoTexto id="personaContacto" valor="${cliente.personaContacto}" requerido="false" anchura="300px" longitudMaxima="45" 
                            editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}"/>
        </td>
      </tr>  

	  <tr>	        
        <td>Domicilio:</td>
        <td><cmz:campoTexto id="domicilio" valor="${cliente.domicilio}" requerido="false" anchura="320px" longitudMaxima="50" 
                            editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}"/>
        </td>
      </tr>  

	  <tr>	        
        <td>Población:</td>
        <td><cmz:campoTexto id="poblacion" valor="${cliente.poblacion}" requerido="false" anchura="320px" longitudMaxima="50" 
                            editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}"/>
        </td>
      </tr>  

	  <tr>	        
        <td>Provincia:</td>
        <td><cmz:campoTexto id="provincia" valor="${cliente.provincia}" requerido="false" anchura="320px" longitudMaxima="50" 
                            editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}"/>
        </td>
      </tr>  

	  <tr>	
        <td>País:</td>
	    <td>
          <cmz:ayuda requerido="false" soloLectura="${!formularioCliente.editable}" nombreAyuda="PAISES">
          	<cmz:codigoAyuda idCodigo="codPais" valorCodigo="${cliente.codPais}" anchuraCodigo="40px" longitudMaximaCodigo="4"></cmz:codigoAyuda>
          	<cmz:descripcionAyuda idDescripcion="desPais" valorDescripcion="${cliente.desPais}"></cmz:descripcionAyuda>
          </cmz:ayuda>
	    </td>
	  </tr>
	    
	  <tr>	  
        <td>Código Postal:</td>
        <td><cmz:campoTexto id="cp" valor="${cliente.cp}" requerido="false" anchura="80px" longitudMaxima="8" 
                            editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}"/>
        </td>
      </tr>  

	  <tr>	        
        <td>Teléfonos:</td>
        <td>
        	<cmz:campoTexto id="telefono1" valor="${cliente.telefono1}" requerido="false" anchura="120px" longitudMaxima="15" 
                            editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}"/>
        	<cmz:campoTexto id="telefono2" valor="${cliente.telefono2}" requerido="false" anchura="120px" longitudMaxima="15" 
                            editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}"/>
        </td>
      </tr>  

	  <tr>	        
        <td>Fax:</td>
        <td><cmz:campoTexto id="fax" valor="${cliente.fax}" requerido="false" anchura="120px" longitudMaxima="15" 
                            editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}"/>
        </td>
      </tr>  

	  <tr>	        
        <td>Email:</td>
        <td><cmz:campoTexto id="email" valor="${cliente.email}" requerido="false" anchura="380px" longitudMaxima="60" 
                            editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}"/>
        </td>
      </tr>  
    </table>
  </cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Datos Fiscales"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
        <td>CIF:</td>
        <td>
          <cmz:campoTexto id="cif" valor="${cliente.cif}" requerido="false" anchura="120px" longitudMaxima="20"
                            editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}"/>
		  <c:if test="${formularioCliente.editable}">
	          <img src="comun/images/iconos/info.gif" align="absMiddle" border="0" valign="middle" onClick="validarCifNif(document.frmDatos.cif.value)" style="vertical-align:top;cursor: pointer;" alt="Validar CIF"/>
		  </c:if>	                            
        </td>
      </tr>

      <tr>
        <td>Tratamiento impuestos:</td>
        <td>
          <cmz:ayuda requerido="true" soloLectura="${!formularioCliente.editable}" nombreAyuda="TRATAMIENTO_IMP">
          	<cmz:codigoAyuda idCodigo="idTratImp" valorCodigo="${cliente.idTratImp}"></cmz:codigoAyuda>
          	<cmz:descripcionAyuda idDescripcion="desTratImp" valorDescripcion="${cliente.desTratImp}" anchuraDescripcion="320px" editable="${formularioCliente.editable}"></cmz:descripcionAyuda>
          </cmz:ayuda>
        </td>
      </tr>
      
      <tr>
        <td>Medio de pago:</td>
        <td>
          <cmz:ayuda requerido="false" soloLectura="${!formularioCliente.editable}" nombreAyuda="MEDIOS_PAGO_VEN">
            <cmz:codigoAyuda idCodigo="idMedioPagoVencimiento" valorCodigo="${cliente.idMedioPagoVencimiento}"></cmz:codigoAyuda>
            <cmz:descripcionAyuda idDescripcion="desMedioPagoVencimiento" valorDescripcion="${cliente.desMedioPagoVencimiento}" anchuraDescripcion="320px"></cmz:descripcionAyuda>
          </cmz:ayuda>
        </td>
      </tr>
      
      <tr>
        <td>Tarifa:</td>
        <td>
          <cmz:ayuda requerido="false" soloLectura="${!formularioCliente.editable}" nombreAyuda="TARIFAS">
          	<cmz:codigoAyuda idCodigo="codTar" valorCodigo="${cliente.codTar}" anchuraCodigo="110px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
          	<cmz:descripcionAyuda idDescripcion="desTar" valorDescripcion="${cliente.desTar}" anchuraDescripcion="200px"></cmz:descripcionAyuda>
          </cmz:ayuda>
        </td>
      </tr>
      
      <tr>
        <td>Riesgo concedido:</td>
        <td>
          <cmz:campoTexto id="riesgoConcecido" requerido="false" anchura="70" longitudMaxima="9"
            editable="${formularioCliente.editable}" soloLectura="${!formularioCliente.editable}">
             <cmz:formateaNumero valor="${cliente.riesgoConcedido}"></cmz:formateaNumero>               
          </cmz:campoTexto>
        </td>
      </tr>
    </table>  
  </cmz:cuerpoPanel>
</cmz:panel>  

<cmz:panel>
  <cmz:cabeceraPanel titulo="Organización"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
        <td>Sector:</td>
        <td>
          <cmz:ayuda requerido="false" soloLectura="${!formularioCliente.editable}" nombreAyuda="SECTORES">
          	<cmz:codigoAyuda idCodigo="codSec" valorCodigo="${cliente.codSec}" anchuraCodigo="40px" longitudMaximaCodigo="4"></cmz:codigoAyuda>
          	<cmz:descripcionAyuda idDescripcion="desSec" valorDescripcion="${cliente.desSec}" anchuraDescripcion="200px"></cmz:descripcionAyuda>
          </cmz:ayuda>
        </td>
      </tr>
    </table>  
  </cmz:cuerpoPanel>
</cmz:panel>  
