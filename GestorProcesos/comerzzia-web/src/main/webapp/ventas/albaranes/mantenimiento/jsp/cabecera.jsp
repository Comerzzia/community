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

<c:set var="albaran" value="${formularioAlbaranVenta.registroActivo}" />

<script type="text/javascript">
    function checkFormPestaña() {
    	if(!esValido("codSerie", "AYUDA", true, "desSerie", "SERIES")) {
			return false;
		}
    	if(!esValido("codConceptoAlmacen", "AYUDA", true, "desConceptoAlmacen", "CONCEPTOS_ALMACENES_VENT")) {
			return false;
		}
    	if(!esValido("codAlmacen", "AYUDA", true, "desAlmacen", "ALMACENES")) {
			return false;
		}
        if (!esValido("fecha", "FECHA", true)) {
            return false;
        }
    	if (!validarFechaMenorIgualQueHoy(document.getElementById("fecha").value)) {
        	alert("La fecha debe ser menor o igual a la de hoy");
        	document.getElementById("fecha").focus();
            return false;
        }
        if (!esValido("fechaSuministro", "FECHA", true)) {
            return false;
        }
    	if(!esValido("codCliente", "AYUDA", true, "desCliente", "CLIENTES")) {
			return false;
		}
    	if(!esValido("codTarifa", "AYUDA", false, "desTarifa", "TARIFAS")) {
			return false;
		}
		      
        return true;
    }

    function ayudaConceptosAlmacenes(){
    	var rt = buscar('CONCEPTOS_ALMACENES_VENT','codConceptoAlmacen', 'desConceptoAlmacen');

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
        
        var url = "conceptoAlmacenVenta.cmz" +
                  "?codigo=" + escape(document.getElementById("codConceptoAlmacen").value);
        
        response = xmlRequest(url);

        if (response != null) {
            if (response.getElementsByTagName("ERROR").item(0)) {
                alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
                document.getElementById("desConceptoAlmacen").value = "";
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

    function modificarIdEnvio(){
        var url = "modificar.tracking.albaran.venta.screen";
    	var rt = abrirVentanaModal(url, "150px", "400px");

    	if(rt){
    		document.getElementById("accion").value = "modificarTracking";
    		document.getElementById("frmDatos").submit();
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
          <cmz:ayuda nombreAyuda="SERIES" requerido="true" soloLectura="${!formularioAlbaranVenta.enInsercion}">
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
	          <cmz:ayuda nombreAyuda="CONCEPTOS_ALMACENES_VENT" requerido="true" soloLectura="true">
	            <cmz:codigoAyuda idCodigo="codConceptoAlmacen" longitudMaximaCodigo="4" valorCodigo="${albaran.codConceptoAlmacen}" anchuraCodigo="40px"></cmz:codigoAyuda>
	            <cmz:descripcionAyuda idDescripcion="desConceptoAlmacen" anchuraDescripcion="250px" valorDescripcion="${albaran.desConceptoAlmacen}"></cmz:descripcionAyuda>
	          </cmz:ayuda>
          	</c:when>
          	<c:otherwise>
	          <cmz:ayuda nombreAyuda="CONCEPTOS_ALMACENES_VENT" requerido="true" soloLectura="${!formularioAlbaranVenta.editable}" onclick="ayudaConceptosAlmacenes();">
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
	          <cmz:ayuda nombreAyuda="ALMACENES" requerido="true" soloLectura="${!formularioAlbaranVenta.editable}">
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
          <cmz:campoFecha id="fecha" requerido="true" editable="${formularioAlbaranVenta.editable}" soloLectura="${!formularioAlbaranVenta.editable}">
			<fmt:formatDate pattern="dd/MM/yyyy" value="${albaran.fecha}"/>
          </cmz:campoFecha>
        </td>
      </tr>
      <tr>
        <td>Fecha Suministro:</td>
        <td>
          <cmz:campoFecha id="fechaSuministro" requerido="true" editable="${formularioAlbaranVenta.editable}" soloLectura="${!formularioAlbaranVenta.editable}">
			<fmt:formatDate pattern="dd/MM/yyyy" value="${albaran.fechaSuministro}"/>
          </cmz:campoFecha>
        </td>
      </tr>
      <tr>
        <td>Cliente:</td>
        <td>
          <c:choose>
          	<c:when test="${albaran.tieneArticulos}">
	          <cmz:ayuda nombreAyuda="CLIENTES" requerido="true" soloLectura="true">
	            <cmz:codigoAyuda idCodigo="codCliente" longitudMaximaCodigo="11" valorCodigo="${albaran.codCliente}" anchuraCodigo="90px"></cmz:codigoAyuda>
	            <cmz:descripcionAyuda idDescripcion="desCliente" anchuraDescripcion="300px" valorDescripcion="${albaran.desCliente}"></cmz:descripcionAyuda>
	          </cmz:ayuda>
          	</c:when>
          	<c:otherwise>
	          <cmz:ayuda nombreAyuda="CLIENTES" requerido="true" soloLectura="${!formularioAlbaranVenta.editable}">
	            <cmz:codigoAyuda idCodigo="codCliente" longitudMaximaCodigo="11" valorCodigo="${albaran.codCliente}" anchuraCodigo="90px"></cmz:codigoAyuda>
	            <cmz:descripcionAyuda idDescripcion="desCliente" anchuraDescripcion="300px" valorDescripcion="${albaran.desCliente}"></cmz:descripcionAyuda>
	          </cmz:ayuda>
          	</c:otherwise>
          </c:choose>	
        </td>
      </tr>
      <tr>
        <td>Tarifa:</td>
        <td>
          <c:choose>
          	<c:when test="${albaran.tieneArticulos}">
	          <cmz:ayuda nombreAyuda="TARIFAS" requerido="false" soloLectura="true">
	            <cmz:codigoAyuda idCodigo="codTarifa" longitudMaximaCodigo="11" valorCodigo="${albaran.codTarifa}" anchuraCodigo="90px"></cmz:codigoAyuda>
	            <cmz:descripcionAyuda idDescripcion="desTarifa" anchuraDescripcion="300px" valorDescripcion="${albaran.desTarifa}"></cmz:descripcionAyuda>
	          </cmz:ayuda>
          	</c:when>
          	<c:otherwise>
	          <cmz:ayuda nombreAyuda="TARIFAS" requerido="false" soloLectura="${!formularioAlbaranVenta.editable}">
	            <cmz:codigoAyuda idCodigo="codTarifa" longitudMaximaCodigo="11" valorCodigo="${albaran.codTarifa}" anchuraCodigo="90px"></cmz:codigoAyuda>
	            <cmz:descripcionAyuda idDescripcion="desTarifa" anchuraDescripcion="300px" valorDescripcion="${albaran.desTarifa}"></cmz:descripcionAyuda>
	          </cmz:ayuda>
          	</c:otherwise>
          </c:choose>	
        </td>
      </tr>
      <tr>
        <td>Persona de Contacto:</td>
        <td>
          <cmz:campoTexto id="personaContacto" valor="${albaran.personaContacto}" anchura="180px" longitudMaxima="30"
                          editable="${formularioAlbaranVenta.editable}" soloLectura="${!formularioAlbaranVenta.editable}"/>
        </td>
      </tr>
      <tr>
        <td>Referencia Cliente:</td>
        <td>
          <cmz:campoTexto id="referenciaCliente" valor="${albaran.referenciaCliente}" anchura="200px" longitudMaxima="45"
                          editable="${formularioAlbaranVenta.editable}" soloLectura="${!formularioAlbaranVenta.editable}"/>
        </td>
      </tr>
      <tr>
        <td>Id Envío:</td>
        <td>
          <input type="hidden" id="idTracking" name="idTracking" value=""/>
          <cmz:campoTexto id="tracking" valor="${albaran.trackingPorte}" anchura="200px" longitudMaxima="50"
                          editable="${formularioAlbaranVenta.editable}" soloLectura="${!formularioAlbaranVenta.editable}"/>
		  <c:if test="${!formularioAlbaranVenta.editable}">
	          <img src="comun/images/iconos/info.gif" align="absMiddle" border="0" valign="middle" onClick="modificarIdEnvio()" style="vertical-align:top;cursor: pointer;" alt="Modificar Id Envío" title="Modificar Id Envío"/>
		  </c:if>	                            
        </td>
      </tr>
    </table>
  </cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Observaciones"></cmz:cabeceraPanel>
  <cmz:cuerpoPanel>
    <cmz:campoAreaTexto id="observaciones" anchura="100%" altura="100px" valor="${albaran.observaciones}" editable="${formularioAlbaranVenta.editable}" soloLectura="${!formularioAlbaranVenta.editable}" longitudMaxima="255"></cmz:campoAreaTexto>
  </cmz:cuerpoPanel>
</cmz:panel>
