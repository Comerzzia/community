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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="detalleFactura" value="${formularioFacturaCompra.formularioPestañaActiva.registroActivo}" />

<cmz:panel>
  <cmz:cabeceraPanel titulo="Líneas">
    <cmz:acciones numAccionesVisibles="8">
      	<cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
        <cmz:accionNavegacionRegistros onclick="verRegistroPestaña" 
               total="${formularioFacturaCompra.formularioPestañaActiva.total}" 
               actual="${formularioFacturaCompra.formularioPestañaActiva.actual}" 
               primero="${formularioFacturaCompra.formularioPestañaActiva.primero}"
               anterior="${formularioFacturaCompra.formularioPestañaActiva.anterior}"
               siguiente="${formularioFacturaCompra.formularioPestañaActiva.siguiente}"
               ultimo="${formularioFacturaCompra.formularioPestañaActiva.ultimo}"/>
    </cmz:acciones>
  </cmz:cabeceraPanel>
    
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
        <td>Concepto:</td>
        <td>
          <cmz:campoTexto id="concepto" valor="${detalleFactura.concepto}" editable="${formularioFacturaCompra.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}" anchura="300px" longitudMaxima="50"></cmz:campoTexto>
        </td>
      </tr>  
      <tr>    
        <td>Concepto ampliado:</td>
        <td>
          <cmz:campoAreaTexto id="ampliado" anchura="300px" altura="50px" valor="${detalleFactura.conceptoAmpliado}" editable="${formularioFacturaCompra.formularioPestañaActiva.editable}"
    			soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}" longitudMaxima="255"></cmz:campoAreaTexto>
        </td>
      </tr>   
      <tr>
        <td>Referencia:</td>
        <td>
          <cmz:campoTexto id="referencia" valor="${detalleFactura.referencia}" editable="${formularioFacturaCompra.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}" anchura="300px" longitudMaxima="30"></cmz:campoTexto>
        </td>
      </tr>
      <tr>
		<td>Fecha:</td>
		<td><c:set var="fecha"><fmt:formatDate pattern="dd/MM/yyyy" value="${detalleFactura.fecha}" /></c:set> 
			<cmz:campoTexto id="fecha" valor="${fecha}" requerido="false" editable="${formularioFacturaCompra.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}" anchura="65"/>
		</td>
	  </tr>
	  <tr>
        <td>Artículo:</td>
        <td><cmz:ayuda nombreAyuda="ARTICULOS" soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}">
				<cmz:codigoAyuda idCodigo="codArticulo" valorCodigo="${detalleFactura.codArticulo}" longitudMaximaCodigo="13" anchuraCodigo="100"/>
				<cmz:descripcionAyuda idDescripcion="desArticulo" valorDescripcion="${detalleFactura.desArticulo}" anchuraDescripcion="300px" 
					editable="${formularioFacturaCompra.formularioPestañaActiva.editable}"/>
			</cmz:ayuda>
		</td>
      </tr>     
	  
	  <c:choose>
        <c:when test="${empty formularioFacturaCompra.tituloDesglose1}">
          <input name="desglose1" id="desglose1" type="hidden" value="*" />
        </c:when>
        <c:otherwise>
          <tr>
            <td><c:out value="${formularioFacturaCompra.tituloDesglose1}" />:</td>
            <td>
              <cmz:campoTexto id="desglose1" valor="${detalleFactura.desglose1}" requerido="false" anchura="120px"
              	editable="${formularioFacturaCompra.formularioPestañaActiva.editable}" soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}" />
            </td>
          </tr>
        </c:otherwise>
      </c:choose>
      
      <c:choose>
        <c:when test="${empty formularioFacturaCompra.tituloDesglose2}">
          <input name="desglose2" id="desglose2" type="hidden" value="*" />
        </c:when>
        <c:otherwise>
          <tr>
            <td><c:out value="${formularioFacturaCompra.tituloDesglose2}" />:</td>
            <td>
              <cmz:campoTexto id="desglose2" valor="${detalleFactura.desglose2}" requerido="false" anchura="120px"
              	editable="${formularioFacturaCompra.formularioPestañaActiva.editable}" soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}" />
            </td>
          </tr>
        </c:otherwise>
      </c:choose>
                     
      <tr>
        <td>Cantidad:</td>
        <td>
          <cmz:campoTexto id="cantidadMedida" requerido="false" soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}" 
          	editable="${formularioFacturaCompra.formularioPestañaActiva.editable}" anchura="70px">
          	<cmz:formateaNumero valor="${detalleFactura.cantidadMedida}"></cmz:formateaNumero>
          </cmz:campoTexto>
        </td>      
      </tr>
      <tr>
      	<td>Unidad Medida:</td>
        <td>
          <cmz:campoTexto id="unidadMedida" requerido="false" soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}" 
          	editable="${formularioFacturaCompra.formularioPestañaActiva.editable}" anchura="70px">
          	<cmz:formateaNumero valor="${detalleFactura.desUnidadMedida}"></cmz:formateaNumero>
          </cmz:campoTexto>
        </td>
      </tr>
      <tr>
        <td>Unidades:</td>
        <td>
          <cmz:campoTexto id="cantidad" requerido="false" soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}" 
          	editable="${formularioFacturaCompra.formularioPestañaActiva.editable}" anchura="70px">
          	<cmz:formateaNumero valor="${detalleFactura.cantidad}"></cmz:formateaNumero>
          </cmz:campoTexto>
        </td>
      </tr>
      <tr>
        <td>Precio:</td>
        <td>
          <c:set var="precio"><cmz:formateaNumero valor="${detalleFactura.precio}" numDecimales="2" /></c:set>
          <cmz:campoTexto id="precio" valor="${precio}" editable="${formularioFacturaCompra.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}" anchura="100px" longitudMaxima="13"></cmz:campoTexto>
        </td>
      </tr> 
      <tr>
        <td>Importe:</td>
        <td>
          <c:set var="importe"><cmz:formateaNumero valor="${detalleFactura.importe}" numDecimales="2" /></c:set>
          <cmz:campoTexto id="importe" valor="${importe}" editable="${formularioFacturaCompra.formularioPestañaActiva.editable}" 
              soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}" anchura="100px" longitudMaxima="13"></cmz:campoTexto>
        </td>
      </tr> 
      <tr>
        <td>Tipo de impuesto:</td>
        <td><cmz:ayuda nombreAyuda="IMPUESTOS" soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.editable}">
				<cmz:codigoAyuda idCodigo="codImpuesto" valorCodigo="${detalleFactura.codImpuesto}" longitudMaximaCodigo="1"/>
				<cmz:descripcionAyuda idDescripcion="desImpuesto" valorDescripcion="${detalleFactura.desImpuesto}" anchuraDescripcion="300px" 
					editable="${formularioFacturaCompra.formularioPestañaActiva.editable}"/>
			</cmz:ayuda>
		</td>
      </tr>        
    </table>
  </cmz:cuerpoPanel>
</cmz:panel>
