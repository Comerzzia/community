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

<c:set var="tienda" value="${asistenteTienda.tienda}" />

<tr height="20px">
  <td width="120px">Código:</td>                
  <td colspan="3">
    <table cellpadding="0px" cellspacing="0px" border="0px">
      <tr>
        <td>
          <cmz:campoTexto id="codCliente" valor="${tienda.cliente.codCli}" requerido="true" anchura="90px" longitudMaxima="11"
                          editable="${formularioTienda.enInsercion}" soloLectura="${!formularioTienda.enInsercion}"/>
        </td>
        <td width="10px"></td><!-- SEPARADOR -->
        <td>Descripción:</td>
        <td><cmz:campoTexto id="desCliente" valor="${tienda.cliente.desCli}" requerido="true" anchura="300px" longitudMaxima="45" 
                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/></td>

      </tr>
    </table>
  </td>                         
</tr>
<tr>	        
  <td height="20px">Nombre Comercial:</td>
  <td><cmz:campoTexto id="nombreComercial" valor="${tienda.cliente.nombreComercial}" requerido="false" anchura="300px" longitudMaxima="45" 
                      editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
  </td>
</tr>
<tr>
  <td height="20px">Tratamiento impuestos:</td>
  <td>
    <cmz:ayuda requerido="true" soloLectura="${!formularioTienda.editable}" nombreAyuda="TRATAMIENTO_IMP">
      <cmz:codigoAyuda idCodigo="idTratImp" valorCodigo="${tienda.cliente.idTratImp}"></cmz:codigoAyuda>
      <cmz:descripcionAyuda idDescripcion="desTratImp" valorDescripcion="${tienda.cliente.desTratImp}" anchuraDescripcion="300px" editable="${formularioTienda.editable}"></cmz:descripcionAyuda>
    </cmz:ayuda>
  </td>
</tr>
