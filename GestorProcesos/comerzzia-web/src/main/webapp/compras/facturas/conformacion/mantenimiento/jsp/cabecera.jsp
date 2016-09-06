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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="factura" value="${formularioConformacionFacturas.registroActivo}" />

<script type="text/javascript">
	function checkFormPestaña() {
		if (!esValido("desProveedor", "TEXTO", true)) {
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
	    if(!esValido("cif", "TEXTO", true)) {
            return false;
	    }
	    if(!esValido("fechaRecFactura", "FECHA", true)) {
            return false;
	    }
	    if(!esValido("fechaFacturaProveedor", "FECHA", true)) {
            return false;
	    }
	    if (!esValido("referencia", "TEXTO", true)) {
	        return false;
	    }
	    if (!esValido("concepto", "TEXTO", true)) {
	        return false;
	    }
	    if(!esValido("codSerie", "AYUDA", true, "desSerie", "SERIES")){
	       	return false;
	    }
	    if (!esValido("observaciones", "TEXTO", false)) {
            return false;
        }
        
	    return true;
	}
    
</script>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Proveedor"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table cellpadding="2px" cellspacing="2px" border="0px">
			  <tr>
			    <td>Proveedor:</td>
			    <td><cmz:campoTexto id="codProveedor" valor="${factura.codProveedor}" anchura="100px" editable="false" soloLectura="true"/></td>
		        <td><cmz:campoTexto id="desProveedor" valor="${factura.desProveedor}" editable="${formularioConformacionFacturas.enInsercion}" 
		        		soloLectura="${!formularioConformacionFacturas.enInsercion}" requerido="true" anchura="300px" longitudMaxima="45"/></td>
			  </tr>			  
			  <tr>	        
		        <td>Domicilio:</td>
		        <td colspan="2"><cmz:campoTexto id="domicilio" valor="${factura.domicilio}" editable="${formularioConformacionFacturas.enInsercion}" 
		        		soloLectura="${!formularioConformacionFacturas.enInsercion}" anchura="300px" longitudMaxima="50"/></td>
		      </tr>  		
			  <tr>	        
		        <td>Población:</td>
		        <td colspan="2"><cmz:campoTexto id="poblacion" valor="${factura.poblacion}" editable="${formularioConformacionFacturas.enInsercion}" 
		        		soloLectura="${!formularioConformacionFacturas.enInsercion}" anchura="300px" longitudMaxima="50"/></td>
		      </tr>  		
			  <tr>	        
		        <td>Provincia:</td>
		        <td colspan="2"><cmz:campoTexto id="provincia" valor="${factura.provincia}" editable="${formularioConformacionFacturas.enInsercion}" 
		        		soloLectura="${!formularioConformacionFacturas.enInsercion}" anchura="300px" longitudMaxima="50"/></td>
		      </tr>		      
		      <tr>	  
		        <td>Código Postal:</td>
		        <td colspan="2"><cmz:campoTexto id="cp" valor="${factura.cp}" editable="${formularioConformacionFacturas.enInsercion}" 
		        		soloLectura="${!formularioConformacionFacturas.enInsercion}" anchura="100px" longitudMaxima="8"/></td>
		      </tr> 		      
		      <tr>
		        <td>CIF:</td>
		        <td colspan="2">
		          <cmz:campoTexto id="cif" valor="${factura.cif}" requerido="true" editable="${formularioConformacionFacturas.enInsercion}" 
		          		soloLectura="${!formularioConformacionFacturas.enInsercion}" anchura="120px" longitudMaxima="20"/>
				  <img src="comun/images/iconos/info.gif" align="absMiddle" border="0" valign="middle" onClick="validarCifNif(document.frmDatos.cif.value)" style="cursor: pointer;" alt="Validar CIF"/>	                            
		        </td>
		      </tr> 
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>

<table cellpadding="2px" cellspacing="2px" border="0px">
	<tr>
		<td>Fecha rec. factura:</td>
		<td><c:set var="fechaRecFactura"><fmt:formatDate pattern="dd/MM/yyyy" value="${factura.fechaRecFactura}" /></c:set> 
			<cmz:campoFecha id="fechaRecFactura" valor="${fechaRecFactura}" editable="${formularioConformacionFacturas.enInsercion}" 
				soloLectura="${!formularioConformacionFacturas.enInsercion}" requerido="true" />
		</td>
	</tr>
	<tr>
		<td>Fecha factura Proveedor:</td>
		<td><c:set var="fechaFacturaProveedor"><fmt:formatDate pattern="dd/MM/yyyy" value="${factura.fechaFacturaProveedor}" /></c:set> 
			<cmz:campoFecha id="fechaFacturaProveedor" valor="${fechaFacturaProveedor}" editable="${formularioConformacionFacturas.enInsercion}" 
				soloLectura="${!formularioConformacionFacturas.enInsercion}" requerido="true" />
		</td>
		<td align="right">Nº factura del proveedor:</td>
		<td><cmz:campoTexto id="referencia" valor="${factura.referencia}" requerido="true" editable="${formularioConformacionFacturas.enInsercion}" 
				soloLectura="${!formularioConformacionFacturas.enInsercion}" anchura="100px" longitudMaxima="50"/></td>
	</tr>
	<tr>
		<td>Concepto:</td>
		<td><cmz:campoTexto id="concepto" valor="${factura.concepto}" requerido="true" editable="${formularioConformacionFacturas.enInsercion}" 
				soloLectura="${!formularioConformacionFacturas.enInsercion}" anchura="250px" longitudMaxima="50"/></td>
	</tr>
	<tr>
		<td>Serie de la factura:</td>
		<td colspan="3"><cmz:ayuda nombreAyuda="SERIES" requerido="true" soloLectura="${!formularioConformacionFacturas.enInsercion}">
			<cmz:codigoAyuda idCodigo="codSerie" valorCodigo="${factura.codSerie}" longitudMaximaCodigo="5" anchuraCodigo="100px" />
			<cmz:descripcionAyuda idDescripcion="desSerie"	valorDescripcion="${factura.desSerie}" anchuraDescripcion="300px" />
		</cmz:ayuda></td>
	</tr>
	<tr>
		<td valign="top">Observaciones:</td>
		<td><cmz:campoAreaTexto id="observaciones"	valor="${factura.observaciones}" anchura="300px" editable="${formularioConformacionFacturas.enInsercion}" 
				soloLectura="${!formularioConformacionFacturas.enInsercion}" altura="80" longitudMaxima="255" /></td>
	</tr>
</table>
