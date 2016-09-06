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

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Comerzzia</title>
	
	<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}" />/tienda_virtual/css/comerzzia_portlet.css" />
	
	
	<script type="text/javascript">
		function <portlet:namespace />volver(){
			var url = '<portlet:actionURL><portlet:param name="accion" value="buscar"/></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />verPedido(idPedido){
			document.<portlet:namespace />frmDatos.idPedido.value = idPedido;
			document.<portlet:namespace />frmDatos.action = '<portlet:actionURL><portlet:param name="accion" value="verPedido"></portlet:param></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />verPagina(numpag) {
			document.<portlet:namespace />frmDatos.pagina.value = numpag;
			document.<portlet:namespace />frmDatos.action = '<portlet:actionURL><portlet:param name="accion" value="verMisPedidos"></portlet:param></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.submit();
		}
	</script>
	
	
</head>


<body>
  <form action="" id="<portlet:namespace />frmDatos" name="<portlet:namespace />frmDatos" method="post">
    <input type="hidden" name="idPedido" id="idPedido" value="" />
    <input type="hidden" name="pagina" id="pagina" value="${requestScope.pedidos.numPagina}" />

    <c:if test="${!empty requestScope.mensajeError}">
	  <table border="0" width="100%">
	  	<tr>
	  	  <td align="center">
		  	<table align="center" width="100%">
		  	  <tr><td><font class="portlet-msg-error" ><c:out value="${requestScope.mensajeError}" /></font></td></tr>
		  	</table>
	  		  </td>
	  	</tr>
	  </table>	
    </c:if>

	<c:if test="${requestScope.pedidos.pagina != null}">
	  <table cellspacing="0" cellpadding="0" border="0" align="center">
	    <tr>
	      <td width="100%" valign="top">
	        <table border='0' cellspacing='0' cellpadding='0' width='100%'>
	          <tr>
	            <td>
	              <table cellspacing="0" cellpadding="0"  width="100%">
	                <thead class="results-header">
	                     <th style="text-align: center" width="200px">Estado</th>
	                     <th style="text-align: center" width="100px">Núm. Pedido</th>
	                     <th style="text-align: center" width="60px">Fecha</th>
	                     <th style="text-align: center" width="60px">Total</th>
	                     <th style="text-align: center" width="60px">Acciones</th>
	                </thead>
	                <tbody>
	                  <!-- Si no se han encontrado resultados -->
	                  <c:choose>
	                    <c:when test="${empty requestScope.pedidos.pagina}">
	                      <tr height="30px">
	                        <td align="center" colspan="99">
	                          No se han encontrado resultados.
	                        </td>
	                      </tr>
	                    </c:when>
	                    <c:otherwise>
	                      <c:forEach items="${requestScope.pedidos.pagina}" var="pedido" varStatus="status">
	                        <c:choose>
	                          <c:when test="${status.index%2==0}">
	                            <c:set var="class" value="results-row" />
	                          </c:when>
	                          <c:otherwise>
	                            <c:set var="class" value="portlet-section-alternate results-row alt" />
	                          </c:otherwise>
	                        </c:choose>
	                        <tr class="<c:out value="${class}" />">
	                        	<td style="text-align: center;">
	                        		<c:out value="${pedido.desEstado}"></c:out>
	                        	</td>
	                        	<td style="text-align: center;">
	                        		<c:out value="${pedido.periodo}"></c:out>&nbsp;-&nbsp;<c:out value="${pedido.codSerie}"></c:out>&nbsp;-&nbsp;<c:out value="${pedido.numPedido}"></c:out> 
	                        	</td>
	                        	<td style="text-align: center;">
	                        		<fmt:formatDate value="${pedido.fecha}" pattern="dd/MM/yyyy"/>
	                        	</td>
	                        	<td style="text-align: right;">
	                        		<fmt:formatNumber value="${pedido.total}" minFractionDigits="2"></fmt:formatNumber>
	                        	</td>
	                        	<td style="text-align: center;">
	                        		<a href="javascript:<portlet:namespace />verPedido(<c:out value="${pedido.idPedido}"/>);">
	                        			<img style="cursor: pointer;" alt="Ver pedido" title="Ver pedido" src="${pageContext.request.contextPath}/tienda_virtual/img/lupa.gif">
	                        		</a>
	                        	</td>
	                        </tr>
	                      </c:forEach>
	                    </c:otherwise>
	                  </c:choose>
	                </tbody>
	              </table>
	            </td>
	          </tr>
	          <!-- Paginación -->
	          <c:if test="${!empty requestScope.pedidos.pagina}">
	            <tr><td height="10px"></td></tr><!-- separador -->
	            <tr>
	              <td align="center">
	                <span class="paginacion">
	                  <c:choose>
	                    <c:when test="${requestScope.pedidos.numPagina > 0 && !requestScope.pedidos.esPrimeraPagina}">
	                      <img title="Primera página" src="${pageContext.request.contextPath}/tienda_virtual/img/FirstPage.gif" width="16" height="16" border="0" onClick="<portlet:namespace />verPagina('1')" style="cursor: pointer;" />&nbsp;
	                      <img title="Página anterior" src="${pageContext.request.contextPath}/tienda_virtual/img/PreviousPage.gif" width="16" height="16" border="0" onClick="<portlet:namespace />verPagina('<c:out value="${requestScope.pedidos.anteriorPagina}"/>')" style="cursor: pointer;" />&nbsp;
	                    </c:when>
	                    <c:otherwise>
	                      <img title="Primera página" src="${pageContext.request.contextPath}/tienda_virtual/img/FirstPage_unavailable.gif" width="16" height="16" border="0" />&nbsp;
	                      <img title="Página anterior" src="${pageContext.request.contextPath}/tienda_virtual/img/PreviousPage_unavailable.gif" width="16" height="16" border="0" />&nbsp;
	                    </c:otherwise>
	                  </c:choose>
	                  <b>Pág. <c:out value="${requestScope.pedidos.numPagina}/${requestScope.pedidos.numeroTotalPaginas}"/></b>&nbsp;
	                  <c:choose>
	                    <c:when test="${!requestScope.pedidos.esUltimaPagina}">
	                      <img title="Página siguiente" src="${pageContext.request.contextPath}/tienda_virtual/img/NextPage.gif" width="16" height="16" border="0" onClick="<portlet:namespace />verPagina('<c:out value="${requestScope.pedidos.siguientePagina}"/>')" style="cursor: pointer;" />&nbsp;
	                      <img title="Última página" src="${pageContext.request.contextPath}/tienda_virtual/img/LastPage.gif" width="16" height="16" border="0" onClick="<portlet:namespace />verPagina('<c:out value="${requestScope.pedidos.numeroTotalPaginas}"/>')" style="cursor: pointer;" />
	                    </c:when>
	                    <c:otherwise>
	                      <img title="Página siguiente" src="${pageContext.request.contextPath}/tienda_virtual/img/NextPage_unavailable.gif" width="16" height="16" border="0" />&nbsp;
	                      <img title="Última página" src="${pageContext.request.contextPath}/tienda_virtual/img/LastPage_unavailable.gif" width="16" height="16" border="0" />
	                    </c:otherwise>
	                  </c:choose>
	                </span>
	              </td>
	            </tr>
	          </c:if>
	        <!-- Fin Paginación -->
	        </table>
	      </td>
	    </tr>
	  </table>
	</c:if>
	<br><br>
    <!-- Fin Tabla Resultados -->
    <table cellpadding="2" border="0" width="100%">
      <tr>
        <td align="center">
          <table cellspacing="0" cellpadding="0" border="0">
            <tr>
              <td>
                <input type="button" id="btnVolver" style="width:150px" onClick="<portlet:namespace />volver()" tabindex="15" value="Volver" />&nbsp;
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </form>
</body>
</html>
