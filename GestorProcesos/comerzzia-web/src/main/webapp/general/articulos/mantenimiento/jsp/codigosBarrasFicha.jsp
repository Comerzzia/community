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
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="codigo" value="${formularioArticulo.formularioPestañaActiva.registroActivo}" />
<c:set var="articulo" value="${formularioArticulo.registroActivo}" />

<script type="text/javascript">
    function checkFormRegistroPestaña() {
    	if (!esValido("codigoBarras", "TEXTO", true)) {
            return false;
        }
    	if (!esValido("desglose1", "TEXTO", true)) {
            return false;
        }
    	if (!esValido("desglose2", "TEXTO", true)) {
            return false;
        }
    	var dun14 = document.getElementById("dun14").checked;
    	if (dun14) {
    		if (!esValido("factorConversion", "NUMERICO", true, 3, false)) {
                return false;
            }
    	}	
    	
        return true;
    }

    function checkDUN14() {
    	var dun14 = document.getElementById("dun14").checked;
		if (dun14) {
			document.getElementById("factConv").style.display = "";
		} else {
			document.getElementById("factConv").style.display = "none";
		}
	}
    function generarCodigo() {
        var url = "articuloCodigoBarras.cmz";
        
        response = xmlRequest(url);

        if (response != null) {
            if (response.getElementsByTagName("ERROR").item(0)) {
                alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
                document.getElementById("codigoBarras").focus();
                document.getElementById("codigoBarras").select();
                
                return false;
            }
            else {
                // Establecemos código de barras
                document.getElementById("codigoBarras").value = response.getElementsByTagName("codigoBarras").item(0).firstChild.data;
                
                return true;
            }
        }
        else {
            alert("No se ha podido conectar con el servidor");
            alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
            document.getElementById("codigoBarras").focus();
            document.getElementById("codigoBarras").select();
            
            return false;
        }
    }
 </script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Codigo de Barras">
    <cmz:acciones numAccionesVisibles="8">
      <c:choose>
        <c:when test="${formularioArticulo.formularioPestañaActiva.editable}">
          <cmz:accionSalvarLinea onclick="aceptarRegistroPestaña();"/>
          <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
        </c:when>
        <c:otherwise>
          <cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
          
          <c:if test="${formularioArticulo.editable}">
            <cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir Código"/>
            <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Código" onclick="editarRegistroPestaña(${formularioArticulo.formularioPestañaActiva.indiceRegistroActivo});" />
            <cmz:accion icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar Código" onclick="eliminarRegistroPestaña(${formularioArticulo.formularioPestañaActiva.indiceRegistroActivo});" />
          </c:if>
          
          <cmz:accionNavegacionRegistros onclick="verRegistroPestaña" 
               total="${formularioArticulo.formularioPestañaActiva.total}" 
               actual="${formularioArticulo.formularioPestañaActiva.actual}" 
               primero="${formularioArticulo.formularioPestañaActiva.primero}"
               anterior="${formularioArticulo.formularioPestañaActiva.anterior}"
               siguiente="${formularioArticulo.formularioPestañaActiva.siguiente}"
               ultimo="${formularioArticulo.formularioPestañaActiva.ultimo}"/>
        </c:otherwise>
      </c:choose>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
        <td>Código de Barras:</td>
        <td>
          <cmz:campoTexto id="codigoBarras" valor="${codigo.codigoBarras}" editable="${formularioArticulo.formularioPestañaActiva.enInsercion}" 
              soloLectura="${!formularioArticulo.formularioPestañaActiva.enInsercion}" anchura="150" longitudMaxima="20" requerido="true"></cmz:campoTexto>
        </td>
        <c:if test="${formularioArticulo.formularioPestañaActiva.enInsercion}">	
        	<td>
	        	<cmz:accion onclick="generarCodigo();" icono="comun/images/iconos/engranaje.gif" descripcion="Generar Código Automáticamente"></cmz:accion>
	        </td>
        </c:if>
      </tr>
      
      <c:choose>
	      <c:when test="${empty formularioArticulo.tituloDesglose1}">
		      <input name="desglose1" id="desglose1" type="hidden" value="*" />
		  </c:when>
		  <c:otherwise>
		  	<tr>
				<td><c:out value="${formularioArticulo.tituloDesglose1}" />:</td>
				<c:choose>
					<c:when test="${articulo.desglose1}">
					    <td>
					    	<cmz:campoTexto id="desglose1" valor="${codigo.desglose1}" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
		              			soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="120" longitudMaxima="15" requerido="true"></cmz:campoTexto>	
					    </td>
				    </c:when>
				    <c:otherwise>
				    	<c:choose>
					    	<c:when test="${formularioArticulo.formularioPestañaActiva.editable}">
						    	<td>
							    	<cmz:campoTexto id="desglose1" valor="*" editable="false" soloLectura="true" anchura="120" longitudMaxima="15" requerido="true" clase="campo soloLectura requerido"></cmz:campoTexto>	
							    </td>
						    </c:when>
						    <c:otherwise>
						    	<td>
							    	<cmz:campoTexto id="desglose1" valor="*" editable="false" soloLectura="true" anchura="120" longitudMaxima="15" requerido="true"></cmz:campoTexto>	
							    </td>
						    </c:otherwise>
					    </c:choose>
				    </c:otherwise>
			    </c:choose>
			</tr>
	       </c:otherwise>
	  </c:choose>

      <c:choose>
	      <c:when test="${empty formularioArticulo.tituloDesglose2}">
		      <input name="desglose2" id="desglose2" type="hidden" value="*" />
		  </c:when>
		  <c:otherwise>
		  	<tr>
				<td><c:out value="${formularioArticulo.tituloDesglose2}" />:</td>
				<c:choose>
					<c:when test="${articulo.desglose2}">
					    <td>
					    	<cmz:campoTexto id="desglose2" valor="${codigo.desglose2}" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
		              			soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="120" longitudMaxima="15" requerido="true"></cmz:campoTexto>	
					    </td>
				    </c:when>
				    <c:otherwise>
				    	<c:choose>
					    	<c:when test="${formularioArticulo.formularioPestañaActiva.editable}">
						    	<td>
							    	<cmz:campoTexto id="desglose2" valor="*" editable="false" soloLectura="true" anchura="120" longitudMaxima="15" requerido="true" clase="campo soloLectura requerido"></cmz:campoTexto>	
							    </td>
						    </c:when>
						    <c:otherwise>
						    	<td>
							    	<cmz:campoTexto id="desglose2" valor="*" editable="false" soloLectura="true" anchura="120" longitudMaxima="15" requerido="true"></cmz:campoTexto>	
							    </td>
						    </c:otherwise>
					    </c:choose>
				    </c:otherwise>
			    </c:choose>
			</tr>
	       </c:otherwise>
	  </c:choose>
      
      <tr>
        <td>DUN14:</td>
        <td>
           <input onclick="checkDUN14();" id="dun14" name="dun14" type="checkbox" value="" <c:if test="${codigo.dun14}">checked="checked"</c:if> 
                        <c:if test="${!formularioArticulo.formularioPestañaActiva.editable}">disabled</c:if>/>
        </td>
      </tr>
      <tr id="factConv" <c:if test="${!codigo.dun14}">style="display: none"</c:if>>
        <td>Factor conversión:</td>
        <td>
          <c:set var="factorConversion"><cmz:formateaNumero valor="${codigo.factorConversion}"/></c:set>	
          <cmz:campoTexto id="factorConversion" valor="${factorConversion}" editable="${formularioArticulo.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioArticulo.formularioPestañaActiva.editable}" anchura="110" longitudMaxima="13" requerido="true"></cmz:campoTexto>
        </td>
   	  </tr>
    </table>
  </cmz:cuerpoPanel>
 </cmz:panel>
 
