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

<%@ page language="java" contentType="text/html; charset=windows-1252"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>

<jsp:useBean id="formularioTiendaVirtual" class="com.comerzzia.portlets.tiendavirtual.iu.FormularioTienda" scope="request" />

<table class="comerzzia-arbol">
  <tr class="buscarArbol">
    <td nowrap="nowrap" style="font-weight:bold;padding-left:4px">
		Buscar: 
		<input 	style="width:120px" 
				maxlength="100" 
				type="text" 
				name="filtro" 
				id="filtro" 
				value="<c:out value="${formularioTiendaVirtual.paramBuscar.filtro}" />" 
				tabindex="1" 
				onkeydown="<portlet:namespace />keyDownFiltro(event);" />
		<img src="${pageContext.request.contextPath}/tienda_virtual/img/lupa.gif" 
			 width="16" 
			 height="16" 
			 border="0" 
			 style="cursor: pointer; vertical-align:middle;" 
			 title="Buscar" 
			 onClick="<portlet:namespace />filtrar();" />
    </td>
  </tr>
  <tr><td height="5px"></td></tr>
  <tr>
    <td>
		<table border="1" width="200px">
		<c:forEach items="${formularioTiendaVirtual.categoriasPrimarias}" var="categoria">
		  <tr style="cursor: pointer;" class="results-header" onclick="<portlet:namespace />seleccionarCategoriaPrimaria('${categoria.codCat}');">
		    <td>
		      <c:out value="${categoria.desCat}" />
		    </td>
		  </tr>
		  <c:if test="${categoria.codCat == formularioTiendaVirtual.categoriaPrimaria}">
			  <c:forEach items="${formularioTiendaVirtual.categoriasSecundarias}" var="subcategoria" varStatus="status">
	          	<c:choose>
		        	<c:when test="${status.index%2==0}">
		            	<c:set var="class" value="results-row" />
		          	</c:when>
		          	<c:otherwise>
		            	<c:set var="class" value="portlet-section-alternate results-row alt" />
		          	</c:otherwise>
		        </c:choose>
				<tr class="<c:out value="${class}" />" style="cursor:pointer;">
					<td onclick="<portlet:namespace />seleccionarCategoriaSecundaria('${subcategoria.codCat}');" <c:if test="${subcategoria.codCat == formularioTiendaVirtual.categoriaSecundaria}">style="font-weight: bold"</c:if>> 
				    - <c:out value="${subcategoria.desCat}" />
				    </td>
				</tr>
			  </c:forEach>
		  </c:if>
		</c:forEach>


		</table>
    </td>
  </tr>
</table>
