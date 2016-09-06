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

<tr style="vertical-align:top">
  <td>Cliente:</td>
  <td>
    <cmz:ayuda nombreAyuda="CLIENTES" soloLectura="${!formularioTienda.editable}" requerido="true">
      <cmz:codigoAyuda idCodigo="codCliente" longitudMaximaCodigo="11" valorCodigo="${tienda.codCliente}" anchuraCodigo="90px"></cmz:codigoAyuda>
      <cmz:descripcionAyuda idDescripcion="desCliente" anchuraDescripcion="300px" valorDescripcion="${tienda.desCliente}" editable="${formularioTienda.editable}"></cmz:descripcionAyuda>
    </cmz:ayuda>
  </td>
</tr>
