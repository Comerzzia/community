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

<c:set var="articulo" value="${formularioConsultaArticulos.registroActivo}" />

	<script type="text/javascript">
		function vistaTablaFormulario(){
			document.getElementById("accion").value = "leerFormulario";
			document.getElementById("operacion").value = "vistaTablaFormulario";
		    document.getElementById("frmDatos").submit();
			_esperando();
		}
	</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Artículos">
    <cmz:acciones numAccionesVisibles="8">
      <cmz:accionModoTabla onclick="vistaTablaFormulario();"/>         
          <cmz:accionNavegacionRegistros onclick="verRegistroFormulario" 
               total="${formularioConsultaArticulos.total}" 
               actual="${formularioConsultaArticulos.actual}" 
               primero="${formularioConsultaArticulos.primero}"
               anterior="${formularioConsultaArticulos.anterior}"
               siguiente="${formularioConsultaArticulos.siguiente}"
               ultimo="${formularioConsultaArticulos.ultimo}"/>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
		<tr>
			<td>Artículo:</td>
            <td>
            	<cmz:campoTexto id="codArt" valor="${articulo.codArticulo}" anchura="100px" 
            		editable="false" soloLectura="true"/>
            </td>
            <td colspan="2">
               	<cmz:campoTexto id="desArt" valor="${articulo.desArticulo}" anchura="300px" 
               		editable="false" soloLectura="true"/>
            </td>
		</tr>          
    </table>
    
    <cmz:pestañas>
		<cmz:cabeceraPestañas pestañaActiva="${formularioConsultaArticulos.pestañaActiva}">
			<cmz:pestaña titulo="Datos Generales" accion="0" onclick="seleccionaPestaña(0);"></cmz:pestaña>
			<cmz:pestaña titulo="Stock" accion="1" onclick="seleccionaPestaña(1);"></cmz:pestaña>
		</cmz:cabeceraPestañas>
		<cmz:cuerpoPestaña>
			<c:choose>
				<c:when test="${formularioConsultaArticulos.pestañaActiva == 1}">
					<c:import url="stock.jsp"></c:import>
				</c:when>
				<c:otherwise>
					<c:import url="datosGenerales.jsp"></c:import>
				</c:otherwise>
			</c:choose>
		</cmz:cuerpoPestaña>
	</cmz:pestañas>
  </cmz:cuerpoPanel>
</cmz:panel>

