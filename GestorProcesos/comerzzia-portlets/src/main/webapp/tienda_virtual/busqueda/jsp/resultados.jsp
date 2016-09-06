<%--
 * Copyright 2009-2014 RED.ES - Desarrollado por TIER1
 * 
 * Licencia con arreglo a la EUPL, versi�n 1.1 o -en cuanto 
 * sean aprobadas por la comisi�n Europea- versiones 
 * posteriores de la EUPL (la "Licencia").
 * Solo podr� usarse esta obra si se respeta la Licencia.
 * 
 * http://ec.europa.eu/idabc/eupl.html
 * 
 * Salvo cuando lo exija la legislaci�n aplicable o se acuerde
 * por escrito, el programa distribuido con arreglo a la
 * Licencia se distribuye "TAL CUAL",
 * SIN GARANT�AS NI CONDICIONES DE NING�N TIPO, 
 * ni expresas ni impl�citas.
 * V�ase la Licencia en el idioma concreto que rige
 * los permisos y limitaciones que establece la Licencia.
--%>

<%@ page language="java" contentType="text/html; charset=windows-1252"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>


<c:if test="${paginaResultados.pagina != null}">
  <table class="comerzzia-resultados" cellspacing="0" cellpadding="0" border="0" width="100%" height="100%">
    <tr>
      <td width="100%" valign="top">
        <table border='0' cellspacing='0' cellpadding='0' width='100%'>
          <tr>
            <td>
              <table cellspacing="0" cellpadding="0"  width="100%">
                <thead class="results-header">
                  <c:choose>
                    <c:when test="${empty paginaResultados.pagina}">
                      <!-- Si no se han encontrado resultados: Pintamos cabecera -->
                      <th class="cabecera-fotos"><!-- espacio para cabecera de foto --></th>
                      <th class="cabeceraResultados" width="60px">Art�culo</th>
                      
                      
                      <th class="cabeceraResultados" width="50px">Precio</th>
                      <th class="cabeceraResultados" width="50px">Disponible</th>
                      <th class="cabeceraResultados" width="80px">Cesta</th>
                    </c:when>
                    <c:otherwise>
                      <!-- Si tenemos resultados: Pintamos cabecera con ordenaci�n -->
                      <th class="cabecera-fotos"><!-- espacio para cabecera de foto --></th>
                      <th class="results-header">
                        <a href="#" onclick="<portlet:namespace />ordenar(1)" class="cabeceraResultados">Art�culo</a>
                        <c:if test="${formularioTiendaVirtual.paramBuscar.orden=='DESART'}">
                          <img src="${pageContext.request.contextPath}/tienda_virtual/img/orden_asc.gif" width="10" height="6" border="0" />
                        </c:if>
                        <c:if test="${formularioTiendaVirtual.paramBuscar.orden=='DESART DESC'}">
                          <img src="${pageContext.request.contextPath}/tienda_virtual/img/orden_des.gif" width="10" height="6" border="0" />
                        </c:if>
                      </th>
                      <th class="cabeceraResultados" width="50px">
                          Precio
                      </th>
                      <th class="cabeceraResultados" width="50px">
                          Disponible
                      </th>
                      <th class="cabeceraResultados" width="80px">Cesta</th>
                    </c:otherwise>
                  </c:choose>
                </thead>
                <tbody>
                  <!-- Si no se han encontrado resultados -->
                  <c:choose>
                    <c:when test="${empty paginaResultados.pagina}">
                      <tr height="30px">
                        <td align="center" colspan="99">
                          No se han encontrado resultados.
                        </td>
                      </tr>
                    </c:when>
                    <c:otherwise>
                      <c:forEach items="${paginaResultados.pagina}" var="articulo" varStatus="status">
                        <c:choose>
                          <c:when test="${status.index%2==0}">
                            <c:set var="class" value="results-row" />
                          </c:when>
                          <c:otherwise>
                            <c:set var="class" value="portlet-section-alternate results-row alt" />
                          </c:otherwise>
                        </c:choose>
                        <tr class="<c:out value="${class}" />">
                          <td nowrap="nowrap" style="text-align: left">
                           <img alt="Foto" 
                          		title="Foto" 
                          		src="${pageContext.request.contextPath}/fotosArticulos?tipoFoto=P&codArticulo=${articulo.codArticulo}" 
                          		onError="this.src='${pageContext.request.contextPath}/tienda_virtual/img/no_disponible_pequena.png'"
                          		onclick="<portlet:namespace />myPopUp('${pageContext.request.contextPath}/tienda_virtual/busqueda/jsp/popupFotoArticulo.jsp?codArticulo=${articulo.codArticulo}', '${articulo.desArticulo}')" 
                          		style="cursor: pointer;">
                          </td>
                          <td nowrap="nowrap" style="text-align: left">
                            <a href="#" title="Ver art�culo" style="cursor: pointer" onclick="<portlet:namespace />verFicha('<c:out value="${articulo.codArticulo}"/>')">
                              <c:out value="${articulo.desArticulo}" />
                            </a>
                          </td>
                          
                          <td nowrap="nowrap" style="text-align: right">
                          	<c:choose>
			  	  				<c:when test="${articulo.precioVentaConImpuestos > 0}">
			  	  					<fmt:formatNumber value="${articulo.precioVentaConImpuestos}" minFractionDigits="2" />
			  	  				</c:when>
			  	  				<c:otherwise>
			  	  					<img src="${pageContext.request.contextPath}/tienda_virtual/img/consultar_precio.png" width="16" height="16" border="0" title="consulte precio" />
			  	  				</c:otherwise>
			  	  			</c:choose>
                          </td>
                          <td nowrap="nowrap" style="text-align: center">
                              <c:choose>
                              	<c:when test="${articulo.stock > 0}">
                              		<img src="${pageContext.request.contextPath}/tienda_virtual/img/disponible.png" width="16" height="16" border="0" title="Disponible" />
                              	</c:when>
                       			<c:when test="${(articulo.stock + articulo.stockPendienteRecibir) > 0}">
                       				<img src="${pageContext.request.contextPath}/tienda_virtual/img/previsto.png" width="16" height="16" border="0" title="Pendiente Recibir" />
                       			</c:when>
                       			<c:otherwise>
                       				<img src="${pageContext.request.contextPath}/tienda_virtual/img/encargar.png" width="16" height="16" border="0" title="Por encargo" />
                       			</c:otherwise>
                              </c:choose>
                          </td>
                          <td nowrap="nowrap" align="center">
                            <input style="width:30px;text-align: right" maxlength="3" class="campotxt" type="text" name="unidades_${articulo.codArticulo}" id="unidades_${articulo.codArticulo}" value="1"/>
                            <img src="${pageContext.request.contextPath}/tienda_virtual/img/add_cesta.png" width="16" height="16" border="0" style="cursor: pointer;" title="A�adir a la cesta" onClick="<portlet:namespace />comprar('<c:out value="${articulo.codArticulo}"/>')" />
                          </td>
                        </tr>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>
                </tbody>
              </table>
            </td>
          </tr>
          <!-- Paginaci�n -->
          <c:if test="${!empty paginaResultados.pagina}">
            <tr><td height="10px"></td></tr><!-- separador -->
            <tr>
              <td align="center">
                <span class="paginacion">
                  <c:choose>
                    <c:when test="${paginaResultados.numPagina > 0 && !paginaResultados.esPrimeraPagina}">
                      <img title="Primera p�gina" src="${pageContext.request.contextPath}/tienda_virtual/img/FirstPage.gif" width="16" height="16" border="0" onClick="<portlet:namespace />verPagina('1')" style="cursor: pointer;" />&nbsp;
                      <img title="P�gina anterior" src="${pageContext.request.contextPath}/tienda_virtual/img/PreviousPage.gif" width="16" height="16" border="0" onClick="<portlet:namespace />verPagina('<c:out value="${paginaResultados.anteriorPagina}"/>')" style="cursor: pointer;" />&nbsp;
                    </c:when>
                    <c:otherwise>
                      <img title="Primera p�gina" src="${pageContext.request.contextPath}/tienda_virtual/img/FirstPage_unavailable.gif" width="16" height="16" border="0" />&nbsp;
                      <img title="P�gina anterior" src="${pageContext.request.contextPath}/tienda_virtual/img/PreviousPage_unavailable.gif" width="16" height="16" border="0" />&nbsp;
                    </c:otherwise>
                  </c:choose>
                  <b>P�g. <c:out value="${paginaResultados.numPagina}/${paginaResultados.numeroTotalPaginas}"/></b>&nbsp;
                  <c:choose>
                    <c:when test="${!paginaResultados.esUltimaPagina}">
                      <img title="P�gina siguiente" src="${pageContext.request.contextPath}/tienda_virtual/img/NextPage.gif" width="16" height="16" border="0" onClick="<portlet:namespace />verPagina('<c:out value="${paginaResultados.siguientePagina}"/>')" style="cursor: pointer;" />&nbsp;
                      <img title="�ltima p�gina" src="${pageContext.request.contextPath}/tienda_virtual/img/LastPage.gif" width="16" height="16" border="0" onClick="<portlet:namespace />verPagina('<c:out value="${paginaResultados.numeroTotalPaginas}"/>')" style="cursor: pointer;" />
                    </c:when>
                    <c:otherwise>
                      <img title="P�gina siguiente" src="${pageContext.request.contextPath}/tienda_virtual/img/NextPage_unavailable.gif" width="16" height="16" border="0" />&nbsp;
                      <img title="�ltima p�gina" src="${pageContext.request.contextPath}/tienda_virtual/img/LastPage_unavailable.gif" width="16" height="16" border="0" />
                    </c:otherwise>
                  </c:choose>
                </span>
              </td>
            </tr>
          </c:if>
        <!-- Fin Paginaci�n -->
        </table>
      </td>
    </tr>
  </table>
</c:if>
