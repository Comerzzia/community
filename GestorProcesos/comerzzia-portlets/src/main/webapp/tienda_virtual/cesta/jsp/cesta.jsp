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

<portlet:defineObjects/>

<jsp:useBean id="cestaTiendaVirtual" type="com.comerzzia.servicios.tiendavirtual.cesta.CestaBean" scope="request"/>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Comerzzia</title>
	
	<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}" />/tienda_virtual/css/comerzzia_portlet.css" />
	
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/comun/js/validacion.js"></script>
	
	<script type="text/javascript">
		function <portlet:namespace />volver(){
			var url = '<portlet:actionURL><portlet:param name="accion" value="buscar" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />eliminar(codArticulo){
			var url = '<portlet:actionURL><portlet:param name="accion" value="eliminarArticuloCesta" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.codArticulo.value = codArticulo;
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />guardarCambios(){
			var url = '<portlet:actionURL><portlet:param name="accion" value="guardarCambios" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />realizarPedido(){
			var url = '<portlet:actionURL><portlet:param name="accion" value="identificarCliente" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />modificarCantidad(id){
			var cantidad = document.getElementById(id).value;
			if (!_validarNumero(cantidad)) {
				alert("Debe indicar una cantidad correcta.");
				document.getElementById(id).value = "1";
				document.getElementById(id).focus();
				document.getElementById(id).select();
			}
			else {
				var url = '<portlet:actionURL><portlet:param name="accion" value="modificarArticuloCesta" /></portlet:actionURL>';
				var cadenas = id.split('_');
				document.<portlet:namespace />frmDatos.codArticulo.value = cadenas[1];
				document.<portlet:namespace />frmDatos.cantidad.value = cantidad;
				document.<portlet:namespace />frmDatos.action = url;
				document.<portlet:namespace />frmDatos.submit();
			}			
		}
	</script>
	
	
</head>


<body>
<form action="" id="<portlet:namespace />frmDatos" name="<portlet:namespace />frmDatos" method="post">
  <input type="hidden" name="codArticulo" id="codArticulo" value="" />
  <input type="hidden" name="cantidad" id="cantidad" value="" />

<table border="0" width="100%">
	  <c:if test="${!empty requestScope.mensajeError}">
	  	<tr>
	  	  <td align="center">
		  	<table align="center" width="100%">
		  	  <tr><td><font class="portlet-msg-error" ><c:out value="${requestScope.mensajeError}" /></font></td></tr>
		  	</table>
   		  </td>
	  	</tr>
	  </c:if>
	  <c:if test="${!empty requestScope.mensajeInfo}">
	  	<tr>
	  	  <td align="center">
		  	<table align="center" width="100%">
		  	  <tr><td><font class="portlet-msg-success" ><c:out value="${requestScope.mensajeInfo}" /></font></td></tr>
		  	</table>
   		  </td>
	  	</tr>
	  </c:if>
 	
          <tr>
            <td>
			  <!-- Tabla Resultados -->
              <table cellspacing="2" cellpadding="0" border="0" width="100%">
                <tr>
                  <td width="100%" valign="top">
                    <table cellspacing=0 cellpadding=0 border=0 width=100%>
                      <tr>
                        <td bgcolor='white'>
                          <table border='0' cellspacing='0' cellpadding='0' width='100%'>
                            <tr>
                              <td>
                                <table cellspacing=0 cellpadding=0 class="tablaResultados" width="100%">
                                  <thead class="results-header">
                                    <!-- Pintamos cabecera-->
                                    <th style="text-align: left" width="300px">Artículo</th>
                                    <th style="text-align: right" width="60px">Cantidad</th>
                                    <th style="text-align: right" width="90px">Precio</th>
                                    <th style="text-align: right" width="90px">Importe</th>
                                    <th nowrap="nowrap" style="text-align: center">Acciones</th>
                                  </thead>
                                  <tbody>
                                      <c:if test="${cestaTiendaVirtual.vacia}">
                                   		<tr><td height="10px"></td></tr>
                                   		<tr><td colspan="6" align="center">La cesta de artículos se encuentra vacía</td></tr>
                                   		<tr><td height="10px"></td></tr>
                                      </c:if>
                                      <!-- Pintamos resultados-->
                                      <c:forEach items="${cestaTiendaVirtual.listaArticulos}" var="articulo" varStatus="status">
                                        <c:choose>
                                          <c:when test="${status.index%2==0}">
                                            <c:set var="class" value="results-row" />
                                          </c:when>
                                          <c:otherwise>
                                            <c:set var="class" value="portlet-section-alternate results-row alt" />
                                          </c:otherwise>
                                        </c:choose>
                                        <tr class="<c:out value="${class}" />">
                                        	<c:set var="descripcion" value="${articulo.articulo.desArticulo}"></c:set>
                                        	
                                          <td nowrap="nowrap" width="300px"><c:out value="${descripcion}" /></td>
                                          <td width="65px" style="text-align: right">
                                          	<input 	style="width:30px;text-align: right" 
                                          			maxlength="3" 
                                          			class="campo" 
                                          			type="text" 
                                          			name="unidades_${articulo.articulo.codArticulo}" 
                                          			id="unidades_${articulo.articulo.codArticulo}" 
                                          			onchange="<portlet:namespace />modificarCantidad(this.id);" 
                                          			value="${articulo.cantidad}"/>
                                          </td>
                                          <td nowrap="nowrap" width="90px" style="text-align: right">
                                          	<fmt:formatNumber  value="${articulo.articulo.precioVentaConImpuestos}" minFractionDigits="2"/>
                                          </td>
                                          <td nowrap="nowrap" width="95px" style="text-align: right">
                                          	<fmt:formatNumber  value="${articulo.importeRedondeado}"  minFractionDigits="2"/>
                                          </td>
                                          <td style="text-align: center" nowrap="nowrap">
                                            <img src="${pageContext.request.contextPath}/tienda_virtual/img/eliminar_articulo.png" 
                                            	 width="16" 
                                            	 height="16" 
                                            	 border="0" 
                                            	 style="cursor: pointer;" 
                                            	 title="Eliminar artículo" 
                                            	 onclick="<portlet:namespace />eliminar('${articulo.articulo.codArticulo}')" />
                                          </td>
                                        </tr>
                                      </c:forEach>
                                    </tbody>
                                  </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <!-- Fin Tabla Resultados -->
            <!-- Inicio Tabla Pie -->
            <table cellspacing="" cellpadding="2" border="0">
              <tr>
                <td width="5%">
                </td>
                <td style="padding-top:10px">
                  <!-- Tabla Totales -->
                  <table cellspacing="0" cellpadding="0" border="0" width="200px" class="tablaResultados" align="center">
                    <tr class="results-header"> 
                      <td style="text-align: center; font-weight:bold" nowrap="nowrap" >Importe Total</td>
                    </tr>
                    <tr>
                      <td align="center" nowrap="nowrap" style="font-size:13px;font-weight:bold"><fmt:formatNumber value="${cestaTiendaVirtual.importeRedondeado}" minFractionDigits="2" />&nbsp;&#8364;</td>
                    </tr>
                  </table>
                  <!-- Fin Tabla Totales -->
                </td>
                <td width="20%">
                </td>
                <td align="right">
                  <table cellspacing="0" cellpadding="0" border="0" class="tablaResultados" align="right">
                    <tr>
                      <td>
                        <input type="button" id="btnRealizarPedido" style="width:150px" onClick="<portlet:namespace />realizarPedido()" tabindex="14" value="Realizar pedido" />&nbsp;
                        <input type="button" id="btnRealizarPedido" style="width:150px" onClick="<portlet:namespace />volver()" tabindex="15" value="Volver" />&nbsp;
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
            <!-- Fin Tabla Pie -->
</form>

</body>
</html>
