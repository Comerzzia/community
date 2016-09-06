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

<jsp:useBean id="formularioTiendaVirtual" class="com.comerzzia.portlets.tiendavirtual.iu.FormularioTienda" scope="request" />
<portlet:defineObjects/>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Comercio</title>
	
	<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}" />/tienda_virtual/css/comerzzia_portlet.css" />
	
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/comun/js/md5.js"></script>
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/comun/js/validacion.js"></script>
	
	<script type="text/javascript">
		function <portlet:namespace />keyDownFiltro(e){
			if (window.event) {
		    	key = window.event.keyCode;
		    }
		    else {
		    	key = e.which;
		    }
		    if (key == 13) { // intro
		    	<portlet:namespace />filtrar();
			}
		}
		function <portlet:namespace />seleccionarCategoriaPrimaria(codCat){
			document.<portlet:namespace />frmDatos.codCatPrimaria.value = codCat;
			var url = '<portlet:actionURL><portlet:param name="accion" value="seleccionarCategoriaPrimaria" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />seleccionarCategoriaSecundaria(codCat){
			document.<portlet:namespace />frmDatos.codCatSecundaria.value = codCat;
			var url = '<portlet:actionURL><portlet:param name="accion" value="seleccionarCategoriaSecundaria" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />comprar(codArticulo){
			var id = 'unidades_' + codArticulo;			
			if (document.getElementById(id) == null) {
				var url = '<portlet:actionURL><portlet:param name="accion" value="anadirArticuloCesta" /></portlet:actionURL>';
				document.<portlet:namespace />frmDatos.codArticulo.value = codArticulo;
				document.<portlet:namespace />frmDatos.cantidad.value = 1;
				document.<portlet:namespace />frmDatos.action = url;
				document.<portlet:namespace />frmDatos.submit();
			} 
			else {
				var cantidad = document.getElementById(id).value;
				if (!_validarNumero(cantidad)) {
					alert("Debe indicar una cantidad correcta.");
					document.getElementById(id).value = "1";
					document.getElementById(id).focus();
					document.getElementById(id).select();
				}
				else {
					var url = '<portlet:actionURL><portlet:param name="accion" value="anadirArticuloCesta" /></portlet:actionURL>';
					document.<portlet:namespace />frmDatos.codArticulo.value = codArticulo;
					document.<portlet:namespace />frmDatos.cantidad.value = cantidad;
					document.<portlet:namespace />frmDatos.action = url;
					document.<portlet:namespace />frmDatos.submit();
				}
			}
		}
		function <portlet:namespace />filtrar(){
			if (document.<portlet:namespace />frmDatos.filtro.value.length<3){
				alert("Debe de indicar un filtro de al menos tres caracteres.");
				return;
			}
			var url = '<portlet:actionURL><portlet:param name="accion" value="filtrarArticulos" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />ordenar(columna){
			var url = '<portlet:actionURL>' +
				'<portlet:param name="accion" value="buscar"></portlet:param>' + 
				'<portlet:param name="operacion" value="ordenar"></portlet:param>' + 
				'</portlet:actionURL>';
			document.<portlet:namespace />frmDatos.columna.value = columna;
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}

		function <portlet:namespace />verPagina(numpag) {
			var url = '<portlet:actionURL>' +
				'<portlet:param name="accion" value="buscar"></portlet:param>' + 
				'<portlet:param name="operacion" value="paginar"></portlet:param>' + 
				'</portlet:actionURL>';
			document.<portlet:namespace />frmDatos.pagina.value = numpag;
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />verCesta() {
			var url = '<portlet:actionURL>' +
				'<portlet:param name="accion" value="verCesta"></portlet:param>' + 
				'</portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />login() {
			if (document.getElementById("usuario").value.length == 0){
	            window.alert("Es necesario introducir el Usuario");
	        	return false;
	        }
	        
			if (document.getElementById("password").value.length == 0){
	    		document.getElementById("clave").value = "";
	    	}else{
	    		document.getElementById("clave").value = hex_md5(document.getElementById("password").value);
	    	}
			var url = '<portlet:actionURL><portlet:param name="accion" value="login" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />logout() {
			var url = '<portlet:actionURL><portlet:param name="accion" value="logout" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />misPedidos() {
			var url = '<portlet:actionURL><portlet:param name="accion" value="verMisPedidos" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />verFicha(codArticulo) {
			var url = '<portlet:actionURL><portlet:param name="accion" value="verFichaArticulo" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.codArticulo.value = codArticulo;
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />myPopUp(url, titulo) {
			var popup = Liferay.Popup({title: titulo,modal:true,width:420,height:420});
			jQuery(popup).load(url);
		}		
	</script>
	
	
</head>

<body>
<form action="" id="<portlet:namespace />frmDatos" name="<portlet:namespace />frmDatos" method="post">
  <input type="hidden" name="clave" id="clave" value="" />	
  <input type="hidden" name="codCatPrimaria" id="codCatPrimaria" value="" />
  <input type="hidden" name="codCatSecundaria" id="codCatSecundaria" value="" />
  <input type="hidden" name="codArticulo" id="codArticulo" value="" />
  <input type="hidden" name="cantidad" id="cantidad" value="" />
  <input type="hidden" name="columna" id="columna" value="" />
  <input type="hidden" name="pagina" id="pagina" value="" />
	<table border="0" width="100%">
	  <c:if test="${!empty requestScope.mensajeError}">
	  	<tr>
	  	  <td colspan="2" align="center">
		  	<table align="center" width="100%">
		  	  <tr><td><font class="portlet-msg-error" ><c:out value="${requestScope.mensajeError}" /></font></td></tr>
		  	</table>
   		  </td>
	  	</tr>
	  </c:if>
	  <c:if test="${!empty requestScope.mensajeInfo}">
	  	<tr>
	  	  <td colspan="2" align="center">
		  	<table align="center" width="100%">
		  	  <tr><td><font class="portlet-msg-success" ><c:out value="${requestScope.mensajeInfo}" /></font></td></tr>
		  	</table>
   		  </td>
	  	</tr>
	  </c:if>
  	  <tr>
  	  	<td>
  	  		<table class="cesta-tabla">
  	  			<tr>
			  	  	<td class="comerzzia-cesta"  onclick="<portlet:namespace />verCesta();">
						<a href="#">Ver cesta</a>
						<img src="${pageContext.request.contextPath}/tienda_virtual/img/ver_cesta.gif" width="16" height="16" border="0" title="Ver la cesta" />
			  	  	</td>
				</tr>
  	  		</table>
  	  	</td>
  	  	<td  class="td-login">
  	  		<table class="comerzzia-login">
  	  			<tr>
  	  				<td align="left" >
		  	  			<c:choose>
							<c:when test="${!formularioTiendaVirtual.usuarioLogado}">  	  			
		  	  					Usuario: 
								<input type="text" value="" name="usuario" id="usuario" tabindex="2" />
								&nbsp;&nbsp;Contraseña:
								<input type="password" name="password" id="password" tabindex="3" />
								&nbsp;&nbsp;
								<input type="button" value="Entrar &gt;&gt;" style="width:70px" tabindex="4" onclick="<portlet:namespace />login();" id="btnEntrar"/>
							</c:when>
							<c:otherwise>
								<span style="font-weight:normal">Usuario:</span> <c:out value="${formularioTiendaVirtual.desUsuarioCliente}"></c:out>
								&nbsp;&nbsp;
								<input type="button" value="Mis pedidos" style="width:100px;" tabindex="4" onclick="<portlet:namespace />misPedidos();" id="btnPedidos"/>
								&nbsp;&nbsp;
								<input type="button" value="Salir" style="width:70px;" tabindex="5" onclick="<portlet:namespace />logout();" id="btnSalir"/>
							</c:otherwise>
		  	  			</c:choose>
  	  				</td>
  	  			</tr>
  	  		</table>
  	  	</td>
  	  	<td onclick="<portlet:namespace />verCesta();">
  	  		<div class="resumenCesta">
				<span style="margin-left:26px">Articulos:</span>
				<span class="valor"><c:out value="${formularioTiendaVirtual.cantidadArticulosCesta}"></c:out></span>
				<span style="margin-left:4px">Importe:</span>
				<span class="valor">
					<fmt:setLocale value="es_ES"/>
					<fmt:formatNumber type="currency" value="${formularioTiendaVirtual.importeTotalCesta}" minFractionDigits="2"/>
				</span>
			</div>
		</td>
	  </tr>
	  <tr><td height="3px" colspan="2"></td></tr><!-- Separador -->
	  <tr>
	    <td valign="top">
	      <c:import url="arbol.jsp" />
	    </td>
	    <td class="td-escaparate" height="100px" width="100%" valign="top" colspan="3">
	    
	    
	  <c:choose>
		<c:when test="${formularioTiendaVirtual.vistaEscaparate}">
	    <!-- Escaparate -->
	    	<table class="comerzzia-escaparate" width="100%">
	    		<tr><td height="5px" colspan="3"></td></tr><!-- Separador -->
	  	  		<tr>
	  	  			<c:forEach begin="0" end="2" items="${formularioTiendaVirtual.escaparate}" var="articulo">
	  	  				<td class="td-articulo">
							<img class="estrella" src="${pageContext.request.contextPath}/tienda_virtual/img/estrella.png" width="21" height="21" border="0" title="comerzzia" />
							<div class="articulo-escaparate">
									<img class="foto-escaparate" alt="Foto" title="Foto" onError="this.src='${pageContext.request.contextPath}/tienda_virtual/img/no_disponible_mediana.png'" onclick="<portlet:namespace />myPopUp('${pageContext.request.contextPath}/tienda_virtual/busqueda/jsp/popupFotoArticulo.jsp?codArticulo=${articulo.codArticulo}', '${articulo.desArticulo}')" src="${pageContext.request.contextPath}/fotosArticulos?tipoFoto=M&codArticulo=${articulo.codArticulo}">
								<div class="contenido-articulo">
									<div><c:out value="${articulo.desArticulo}" /></div>
									<span><fmt:formatNumber value="${articulo.precioVentaConImpuestos}" minFractionDigits="2" />&nbsp;&#8364;&nbsp;</span>
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
									<div class="boton_comprar">
										<img class="imagenComprar" src="${pageContext.request.contextPath}/tienda_virtual/img/boton_comprar.png"  border="0"  title="Añadir a la cesta" onClick="<portlet:namespace />comprar('<c:out value="${articulo.codArticulo}"/>')" />
				  					</div>
								</div>
							</div>
						</td>
	  	  				</c:forEach>
	  	  			</tr>
	  	  			<tr><td height="20px" colspan="3"></td></tr><!-- Separador -->
	  	  			<tr>
	  	  				<c:forEach begin="3" end="5" items="${formularioTiendaVirtual.escaparate}" var="articulo">
	  	  				<td class="td-articulo">
							<img class="estrella" src="${pageContext.request.contextPath}/tienda_virtual/img/estrella.png" width="21" height="21" border="0" title="comerzzia" />
							<div class="articulo-escaparate">
									<img class="foto-escaparate" alt="Foto" title="Foto" onError="this.src='${pageContext.request.contextPath}/tienda_virtual/img/no_disponible_mediana.png'" onclick="<portlet:namespace />myPopUp('${pageContext.request.contextPath}/tienda_virtual/busqueda/jsp/popupFotoArticulo.jsp?codArticulo=${articulo.codArticulo}', '${articulo.desArticulo}')" src="${pageContext.request.contextPath}/fotosArticulos?tipoFoto=M&codArticulo=${articulo.codArticulo}">
								<div class="contenido-articulo">
									<div><c:out value="${articulo.desArticulo}" /></div>
									<span><fmt:formatNumber value="${articulo.precioVentaConImpuestos}" minFractionDigits="2" />&nbsp;&#8364;&nbsp;</span>
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
									<div class="boton_comprar">
										<img class="imagenComprar" src="${pageContext.request.contextPath}/tienda_virtual/img/boton_comprar.png"  border="0"  title="Añadir a la cesta" onClick="<portlet:namespace />comprar('<c:out value="${articulo.codArticulo}"/>')" />
				  					</div>
								</div>
							</div>
						</td>
	  				</c:forEach>
				</tr>
				<tr><td height="20px" colspan="3"></td></tr><!-- Separador -->
				<tr>
	  	  			<c:forEach begin="6" end="8" items="${formularioTiendaVirtual.escaparate}" var="articulo">
	  	  				<td class="td-articulo">
							<img class="estrella" src="${pageContext.request.contextPath}/tienda_virtual/img/estrella.png" width="21" height="21" border="0" title="comerzzia" />
							<div class="articulo-escaparate">
									<img class="foto-escaparate" alt="Foto" title="Foto" onError="this.src='${pageContext.request.contextPath}/tienda_virtual/img/no_disponible_mediana.png'" onclick="<portlet:namespace />myPopUp('${pageContext.request.contextPath}/tienda_virtual/busqueda/jsp/popupFotoArticulo.jsp?codArticulo=${articulo.codArticulo}', '${articulo.desArticulo}')" src="${pageContext.request.contextPath}/fotosArticulos?tipoFoto=M&codArticulo=${articulo.codArticulo}">
								<div class="contenido-articulo">
									<div><c:out value="${articulo.desArticulo}" /></div>
									<span><fmt:formatNumber value="${articulo.precioVentaConImpuestos}" minFractionDigits="2" />&nbsp;&#8364;&nbsp;</span>
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
									<div class="boton_comprar">
										<img class="imagenComprar" src="${pageContext.request.contextPath}/tienda_virtual/img/boton_comprar.png"  border="0"  title="Añadir a la cesta" onClick="<portlet:namespace />comprar('<c:out value="${articulo.codArticulo}"/>')" />
				  					</div>
							  </div>
							</div>
						</td>
	  				</c:forEach>
	  	  		</tr>
	  	  		<tr><td height="10px" colspan="2"></td></tr><!-- Separador -->
	  	  	</table>
	  	  	<!-- Fin de Escaparate -->	
	  	  </c:when>
	  	  <c:when test="${formularioTiendaVirtual.vistaArticulo}">
	      	<c:import url="fichaArticulo.jsp" />
	  	  </c:when>
	  	  <c:otherwise>
	      	<c:import url="resultados.jsp" />
	  	  </c:otherwise>
	  	  </c:choose>
	    </td>
	  </tr>
	</table>
</form>

</body>
</html>
