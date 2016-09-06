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

<jsp:useBean id="articuloTiendaVirtual" type="com.comerzzia.persistencia.tiendavirtual.articulos.ArticuloTiendaVirtualBean" scope="request"/>

	<script type="text/javascript">
		function <portlet:namespace />volver(){
			var url = '<portlet:actionURL><portlet:param name="accion" value="buscar" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />comprarDesdeFicha(codArticulo){
			var url = '<portlet:actionURL><portlet:param name="accion" value="anadirArticuloCesta" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.codArticulo.value = codArticulo;
			document.<portlet:namespace />frmDatos.cantidad.value = 1;
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}   
	</script>

<table border="0" width="100%">
  <tr>
    <td>
    	
       <!-- Formulario Datos Artículo -->
       <table class="ficha-articulo" cellspacing="2" cellpadding="1" border="0">
          	    <tr>
          	      <td style="text-align:center">
          	        <table cellspacing="2" cellpadding="0" border="0" width="100%">
          	          <tr>
						<td colspan="2" class="contenedor">
							<div class="imagen">
								<img alt="Foto" title="Ampliar foto" onError="this.src='${pageContext.request.contextPath}/tienda_virtual/img/no_disponible_mediana.png'" onclick="<portlet:namespace />myPopUp('${pageContext.request.contextPath}/tienda_virtual/busqueda/jsp/popupFotoArticulo.jsp?codArticulo=${articuloTiendaVirtual.codArticulo}', '${articuloTiendaVirtual.desArticulo}')" src="${pageContext.request.contextPath}/fotosArticulos?tipoFoto=M&codArticulo=${articuloTiendaVirtual.codArticulo}">
								<div>
									<a href="#" title="Ampliar Foto" onclick="<portlet:namespace />myPopUp('${pageContext.request.contextPath}/tienda_virtual/busqueda/jsp/popupFotoArticulo.jsp?codArticulo=${articuloTiendaVirtual.codArticulo}', '${articuloTiendaVirtual.desArticulo}')">
                              			[Ampliar Foto]
                            		</a>
                            	</div>
                            </div>
                            <div class="separador"></div>
							<div class="datos">
	          	              	<div class="descripcion">
    	      	              		<c:out value="${articuloTiendaVirtual.desArticulo}" />
        	  	        		</div>
			
								<div style="margin:10px 0">
									<span class="titulo">Precio:</span>
									<span class="precio titulo">
									<c:choose>
			  	  						<c:when test="${articuloTiendaVirtual.precioVentaConImpuestos > 0}">
			  	  							<fmt:formatNumber value="${articuloTiendaVirtual.precioVentaConImpuestos}" minFractionDigits="2" />&nbsp;&#8364;&nbsp;
			  	  						</c:when>
			  	  						<c:otherwise>
			  	  							<img src="${pageContext.request.contextPath}/tienda_virtual/img/consultar_precio.png" width="16" height="16" border="0" title="consulte precio" />
			  	  						</c:otherwise>
			  	  					</c:choose>
			  	  					</span>
			  	  				</div>
			  	  				
			  	  				<div style="margin:10px 0">
				  	  				<span class="titulo">Disponibilidad:</span>
				  	  				<c:choose>
										<c:when test="${articuloTiendaVirtual.stock > 0}">
											<img src="${pageContext.request.contextPath}/tienda_virtual/img/disponible.png" width="16" height="16" border="0" title="Disponible" />
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${(articuloTiendaVirtual.stock + articuloTiendaVirtual.stockPendienteRecibir) > 0}">
													<img src="${pageContext.request.contextPath}/tienda_virtual/img/previsto.png" width="16" height="16" border="0" title="Pendiente Recibir" />
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/tienda_virtual/img/encargar.png" width="16" height="16" border="0" title="Por encargo" />
												</c:otherwise>
											</c:choose>
										</c:otherwise>
					  				</c:choose>
				  				</div>
			  					<div>
			  						<img class="boton-comprar imagenComprar" src="${pageContext.request.contextPath}/tienda_virtual/img/boton_comprar.png"  border="0" title="Añadir a la cesta" onClick="<portlet:namespace />comprarDesdeFicha('<c:out value="${articuloTiendaVirtual.codArticulo}"/>')" />
			  					</div>
								<c:if test="${articuloTiendaVirtual.observaciones!=null && !empty articuloTiendaVirtual.observaciones}">
									<div>
										<span class="titulo">Observaciones:</span>
										<c:out value="${articuloTiendaVirtual.observaciones}"/>
									</div>
								</c:if>
							</div>
						
						</td>
					  </tr>	
          	        </table>
          	        <input type="button" id="btnVolver" style="width:150px;margin-top:15px" onClick="<portlet:namespace />volver()" value="Volver" />
          	      </td>
          	    </tr>
          	  </table>
            </td>
          </tr>
         </table>
