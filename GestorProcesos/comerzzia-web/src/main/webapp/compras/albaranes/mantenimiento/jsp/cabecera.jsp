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

<c:set var="albaran" value="${formularioAlbaranCompra.registroActivo}" />

<script type="text/javascript">
    function checkFormPestaña() {
    	if(!esValido("codSerie", "AYUDA", true, "desSerie", "SERIES")) {
			return false;
		}
    	if(!esValido("codConceptoAlmacen", "AYUDA", true, "desConceptoAlmacen", "CONCEPTOS_ALMACENES_COMP")) {
			return false;
		}
    	if(!esValido("codAlmacen", "AYUDA", true, "desAlmacen", "ALMACENES")) {
			return false;
		}
        if (!esValido("fecha", "FECHA", true)) {
            return false;
        }
        if (!esValido("fechaSuministro", "FECHA", true)) {
            return false;
        }
        if(!esValido("codProveedor", "AYUDA", true, "desProveedor", "PROVEEDORES")) {
			return false;
		}
    	if (!validarFechaMenorIgualQueHoy(document.getElementById("fecha").value)) {
        	alert("La fecha debe ser menor o igual a la de hoy");
        	document.getElementById("fecha").focus();
            return false;
        }
    	if (!validarFechaMenorIgual(document.getElementById("fecha").value,document.getElementById("fechaSuministro").value)) {
        	alert("La fecha de suministro debe ser mayor o igual a la fecha del albarán");
        	document.getElementById("fechaSuministro").focus();
            return false;
        }
		      
        return true;
    }

    function ayudaConceptosAlmacenes(){
    	var rt = buscar('CONCEPTOS_ALMACENES_COMP','codConceptoAlmacen', 'desConceptoAlmacen');

        if (rt) {        
        	tratarConceptosAlmacenes();
        }
    }
    
    function tratarConceptosAlmacenes() {
        if (document.getElementById("codConceptoAlmacen").value.length == 0) {
            //Borramos la descripción
            document.getElementById("desConceptoAlmacen").value = "";
            return false;
        }
        
        var url = "conceptoAlmacenCompra.cmz" +
                  "?codigo=" + escape(document.getElementById("codConceptoAlmacen").value);
        
        response = xmlRequest(url);

        if (response != null) {
            if (response.getElementsByTagName("ERROR").item(0)) {
                alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
                document.getElementById("esdConceptoAlmacen").value = "";
                document.getElementById("codConceptoAlmacen").focus();
                document.getElementById("codConceptoAlmacen").select();
                
                return false;
            }
            else {
                // Establecemos código y descripción del concepto del almacén
                document.getElementById("codConceptoAlmacen").value = response.getElementsByTagName("codConceptoAlmacen").item(0).firstChild.data;
                document.getElementById("desConceptoAlmacen").value = response.getElementsByTagName("desConceptoAlmacen").item(0).firstChild.data;

                //Establecemos los valores del almacén
                try {
                	document.getElementById("codAlmacen").value = response.getElementsByTagName("codAlmacen").item(0).firstChild.data;
                }
                catch (e) {}
                try {
                	document.getElementById("desAlmacen").value = response.getElementsByTagName("desAlmacen").item(0).firstChild.data;
                }
                catch (e) {}
                    
                document.getElementById("codConceptoAlmacen").focus();
                
                return true;
            }
        }
        else {
            alert("No se ha podido conectar con el servidor");
            alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
            document.getElementById("desConceptoAlmacen").value = "";
            document.getElementById("codConceptoAlmacen").focus();
            document.getElementById("codConceptoAlmacen").select();
            
            return false;
        }
    }
    
</script>
    
<cmz:panel>
  <cmz:cabeceraPanel titulo="Datos del Albarán"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
       <td>Albarán:</td>
       <td>
       	  <cmz:campoTexto id="periodo" valor="${albaran.periodo}" anchura="40px" longitudMaxima="4" editable="false" soloLectura="true"/>
       	  <cmz:campoTexto id="codigoSerie" valor="${albaran.codSerie}" anchura="40px" longitudMaxima="5" editable="false" soloLectura="true"/>
       	  <cmz:campoTexto id="numAlbaran" valor="${albaran.numAlbaran}" anchura="140px" longitudMaxima="10" editable="false" soloLectura="true"/>
       </td>
      </tr>
      <tr>
        <td>Serie:</td>
        <td>
          <cmz:ayuda nombreAyuda="SERIES" requerido="true" soloLectura="${!formularioAlbaranCompra.enInsercion}">
            <cmz:codigoAyuda idCodigo="codSerie" longitudMaximaCodigo="5" valorCodigo="${albaran.codSerie}" anchuraCodigo="40px"></cmz:codigoAyuda>
            <cmz:descripcionAyuda idDescripcion="desSerie" anchuraDescripcion="300px" valorDescripcion="${albaran.desSerie}"></cmz:descripcionAyuda>
          </cmz:ayuda>
        </td>
      </tr>
      <tr>
        <td>Concepto Almacén:</td>
        <td>
          <c:choose>
          	<c:when test="${albaran.tieneArticulos}">
	          <cmz:ayuda nombreAyuda="CONCEPTOS_ALMACENES_COMP" requerido="true" soloLectura="true">
	            <cmz:codigoAyuda idCodigo="codConceptoAlmacen" longitudMaximaCodigo="4" valorCodigo="${albaran.codConceptoAlmacen}" anchuraCodigo="40px"></cmz:codigoAyuda>
	            <cmz:descripcionAyuda idDescripcion="desConceptoAlmacen" anchuraDescripcion="250px" valorDescripcion="${albaran.desConceptoAlmacen}"></cmz:descripcionAyuda>
	          </cmz:ayuda>
          	</c:when>
          	<c:otherwise>
	          <cmz:ayuda nombreAyuda="CONCEPTOS_ALMACENES_COMP" requerido="true" soloLectura="${!formularioAlbaranCompra.editable}" onclick="ayudaConceptosAlmacenes();">
	            <cmz:codigoAyuda idCodigo="codConceptoAlmacen" longitudMaximaCodigo="4" valorCodigo="${albaran.codConceptoAlmacen}" anchuraCodigo="40px" onchange="tratarConceptosAlmacenes();"></cmz:codigoAyuda>
	            <cmz:descripcionAyuda idDescripcion="desConceptoAlmacen" anchuraDescripcion="250px" valorDescripcion="${albaran.desConceptoAlmacen}"></cmz:descripcionAyuda>
	          </cmz:ayuda>
          	</c:otherwise>
          </c:choose>	
        </td>
      </tr>
      <tr>
        <td>Almacén:</td>
        <td>
          <c:choose>
          	<c:when test="${albaran.tieneArticulos}">
	          <cmz:ayuda nombreAyuda="ALMACENES" requerido="true" soloLectura="true">
	            <cmz:codigoAyuda idCodigo="codAlmacen" longitudMaximaCodigo="4" valorCodigo="${albaran.codAlmacen}" anchuraCodigo="40px"></cmz:codigoAyuda>
	            <cmz:descripcionAyuda idDescripcion="desAlmacen" anchuraDescripcion="300px" valorDescripcion="${albaran.desAlmacen}"></cmz:descripcionAyuda>
	          </cmz:ayuda>
          	</c:when>
          	<c:otherwise>
	          <cmz:ayuda nombreAyuda="ALMACENES" requerido="true" soloLectura="${!formularioAlbaranCompra.editable}">
	            <cmz:codigoAyuda idCodigo="codAlmacen" longitudMaximaCodigo="4" valorCodigo="${albaran.codAlmacen}" anchuraCodigo="40px"></cmz:codigoAyuda>
	            <cmz:descripcionAyuda idDescripcion="desAlmacen" anchuraDescripcion="300px" valorDescripcion="${albaran.desAlmacen}"></cmz:descripcionAyuda>
	          </cmz:ayuda>
          	</c:otherwise>
          </c:choose>	
        </td>
      </tr>
      <tr>
        <td>Fecha:</td>
        <td>
          <cmz:campoFecha id="fecha" requerido="true" editable="${formularioAlbaranCompra.editable}" soloLectura="${!formularioAlbaranCompra.editable}">
			<fmt:formatDate pattern="dd/MM/yyyy" value="${albaran.fecha}"/>
          </cmz:campoFecha>
        </td>
      </tr>
      <tr>
        <td>Fecha Suministro:</td>
        <td>
          <c:set var="fechaSuministro"><fmt:formatDate pattern="dd/MM/yyyy" value="${albaran.fechaSuministro}"/></c:set>
          <cmz:campoFecha id="fechaSuministro" valor="${fechaSuministro}" requerido="true" editable="${formularioAlbaranCompra.editable}" soloLectura="${!formularioAlbaranCompra.editable}"/>
        </td>
      </tr>
      <tr>
        <td>Proveedor:</td>
        <td>
          <cmz:ayuda nombreAyuda="PROVEEDORES" requerido="true" soloLectura="${!formularioAlbaranCompra.editable}">
            <cmz:codigoAyuda idCodigo="codProveedor" longitudMaximaCodigo="11" valorCodigo="${albaran.codProveedor}" anchuraCodigo="90px"></cmz:codigoAyuda>
            <cmz:descripcionAyuda idDescripcion="desProveedor" anchuraDescripcion="300px" valorDescripcion="${albaran.desProveedor}"></cmz:descripcionAyuda>
          </cmz:ayuda>
        </td>
      </tr>
      <tr>
        <td>Referencia Proveedor:</td>
        <td>
          <cmz:campoTexto id="referenciaProveedor" valor="${albaran.referenciaProveedor}" anchura="200px" longitudMaxima="45"
                          editable="${formularioAlbaranCompra.editable}" soloLectura="${!formularioAlbaranCompra.editable}"/>
        </td>
      </tr>
      <tr>
        <td>Persona Contacto:</td>
        <td>
          <cmz:campoTexto id="personaContacto" valor="${albaran.personaContacto}" anchura="200px" longitudMaxima="45"
                          editable="${formularioAlbaranCompra.editable}" soloLectura="${!formularioAlbaranCompra.editable}"/>
        </td>
      </tr>
    </table>
  </cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Observaciones"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <cmz:campoAreaTexto id="observaciones" anchura="100%" altura="100px" valor="${albaran.observaciones}" editable="${formularioAlbaranCompra.editable}" soloLectura="${!formularioAlbaranCompra.editable}" longitudMaxima="255"></cmz:campoAreaTexto>
  </cmz:cuerpoPanel>
</cmz:panel>

<c:if test="${albaran.idFacturaSoportada != null}">
  <cmz:panel>
    <cmz:cabeceraPanel titulo="Factura"></cmz:cabeceraPanel>
    <cmz:cuerpoPanel>
      <table cellpadding="2px" cellspacing="2px" border="0px">
        <tr>
          <td>Número Factura:</td>
          <td>
       	    <cmz:campoTexto id="numFactura" valor="${albaran.numFactura}" anchura="150px" soloLectura="true"/>
          </td>
        </tr>
        <tr>
          <td>Serie Factura:</td>
          <td>
       	    <cmz:campoTexto id="codSerieFactura" valor="${albaran.codSerieFactura}" anchura="40px" soloLectura="true"/>
          </td>
        </tr>
        <tr>
          <td>Fecha Factura:</td>
          <td>
       	    <cmz:campoTexto id="fechaFactura" anchura="80px" soloLectura="true">
       	    	<fmt:formatDate value="${albaran.fechaFactura}" pattern="dd/MM/yyyy"/>
       	    </cmz:campoTexto>
          </td>
        </tr>
      </table>  
    </cmz:cuerpoPanel>
  </cmz:panel>  
</c:if>
