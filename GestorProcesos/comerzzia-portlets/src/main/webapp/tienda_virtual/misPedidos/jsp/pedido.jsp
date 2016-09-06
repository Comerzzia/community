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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:useBean id="pedido" type="com.comerzzia.servicios.ventas.pedidos.PedidoVenta" scope="request"/>
<jsp:useBean id="datosCliente" type="com.comerzzia.persistencia.general.clientes.ClienteBean" scope="request" />

<portlet:defineObjects/> 

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Comerzzia</title>
	
	<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}" />/tienda_virtual/css/comerzzia_portlet.css" />
	
	
	<script type="text/javascript">
		function <portlet:namespace />volver(){
			document.<portlet:namespace />frmDatos.action = '<portlet:actionURL><portlet:param name="accion" value="verMisPedidos" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.submit();
		}
	</script>
</head>

<style>
.datosPedido,.datosCliente{width:350px;float:left}
.etiqueta{font-weight:bold}
</style>

<body>
<form action="" id="<portlet:namespace />frmDatos" name="<portlet:namespace />frmDatos" method="post">
<input type="hidden" name="pagina" id="pagina" value="${requestScope.pagina}"/>
<div style="margin-left:20%;margin-top:30px">
<div>
<div style="font-size:14px;font-weight:bold;margin-botton:15px">
	NÚM. PEDIDO: &nbsp;&nbsp;&nbsp;<c:out value="${pedido.periodo}"/> - <c:out value="${pedido.codSerie}"/> - <c:out value="${pedido.numPedido}"/>
</div>
<div style="font-size:14px;font-weight:bold;margin-botton:15px">
	FECHA:&nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="dd/MM/yyyy"  value="${pedido.fecha}"/>
</div>
<br>
<span class="datosCliente">
	<table>
		<tr>
			<td class="etiqueta">NOMBRE:</td>
			<td><c:out value="${datosCliente.desCli}"/></td>
		</tr>
		<tr>
			<td class="etiqueta" width="100px">NIF:</td>
			<td><c:out value="${datosCliente.cif}"/></td>
		</tr>
		<tr>
			<td class="etiqueta">DOMICILIO:</td>
			<td><c:out value="${datosCliente.domicilio}"/></td>
		</tr>
		<c:if test="${!empty datosCliente.observaciones}">
			<tr>
				<td class="etiqueta">OBSERVACIONES:</td>
				<td><c:out value="${datosCliente.observaciones}"/></td>
			</tr>
		</c:if>
	</table>
</span>

<span class="datosPedido">  	
	<table>
		<tr>
			<td class="etiqueta" width="100px">EMAIL:</td>
			<td><c:out value="${datosCliente.email}"/></td>
		</tr>
		<tr>
			<td class="etiqueta">CP:</td>
			<td><c:out value="${datosCliente.cp}"/></td>
		</tr>
	</table>
</span>
</div>

<div>
	<table style="margin-top:30px" cellspacing="2" cellpadding="0" border="0" >
		<thead class="results-header">
			<th style="text-align: left" width="300px">Artículo</th>
			<th style="text-align: right" width="60px">Cantidad</th>
			<th style="text-align: right" width="90px">Precio</th>
			<th style="text-align: right" width="90px">Importe</th>
		</thead>
		<tbody>
			<c:forEach items="${pedido.articulos}" var="articulo" varStatus="status">
                <c:choose>
                  <c:when test="${status.index%2==0}">
                    <c:set var="class" value="results-row" />
                  </c:when>
                  <c:otherwise>
                    <c:set var="class" value="portlet-section-alternate results-row alt" />
                  </c:otherwise>
                </c:choose>
				<tr class="<c:out value="${class}" />">
					<td style="text-align:left"><c:out value="${articulo.desArticulo}"/></td>
					<td style="text-align: right"><fmt:formatNumber  value="${articulo.cantidadSolicitada}"/></td>
					<td style="text-align: right"><fmt:formatNumber  value="${articulo.precio}"/>&nbsp;&#8364;</td>
					<td style="text-align: right"><fmt:formatNumber  value="${articulo.importe}" />&nbsp;&#8364;</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div style="margin-top:20px">
	<table cellspacing="2" cellpadding="0" border="0" >
		<tr>
			<td style="padding-left:200px">BASE</td>
			<td style="padding-left:5px;font-weight:bold"><c:out value="${pedido.base}"/>&nbsp;&#8364;</td>
			<td style="padding-left:30px">IMPUESTOS</td>
			<td style="padding-left:5px;font-weight:bold"><c:out value="${pedido.impuestos}"/>&nbsp;&#8364;</td>
			<td style="padding-left:30px">TOTAL</td>
			<td style="padding-left:5px;color:red;font-weight:bold"><c:out value="${pedido.total}"/>&nbsp;&#8364;</td>
			<c:if test="${requestScope.tracking != null}">
			  <td style="padding-left:30px">
				<a href="${pedido.urlTracking}${requestScope.tracking}" target="_blank">
					Consultar estado entrega
				</a>
			  </td>
			</c:if>
		</tr>
	</table>
</div>
</div>
<!-- Fin Formulario Datos Usuario -->
<div style="margin-top:30px;text-align:center">
	<input type="button" id="btnVolver" style="width:150px" onClick="<portlet:namespace />volver()" tabindex="2" value="Volver" />&nbsp;
</div>

</form>

</body>
</html>
