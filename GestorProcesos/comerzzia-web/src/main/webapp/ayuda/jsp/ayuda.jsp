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

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:useBean id="ayuda" type="com.comerzzia.persistencia.core.ayudas.AyudaBean" scope="request"></jsp:useBean>
<jsp:useBean id="paramBuscarAyudas" type="com.comerzzia.persistencia.core.ayudas.ParametrosBuscarAyudasBean" scope="session" />
<jsp:useBean id="paginaResultados" class="com.comerzzia.util.paginacion.PaginaResultados" scope="request" />

<html>
  <head>
  	<base target="_self">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ayuda de <c:out value="${ayuda.tituloVentana}"/></title>

    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    
    <script>
	    <c:set var="codigoVisible" value="${ayuda.campoCodigoVisible}"></c:set>
	    
	    function inicio() {
			document.getElementById("descripcion").focus();
	    }

    	function filtrar(indice) {
        	document.getElementById("descripcion").value = indice + '%';
        	document.getElementById("operacion").value = "consultar";
        	document.getElementById("imgWait").style.visibility = "visible";
		    document.frmDatos.submit(); 
        }

	    function keyDownEnter() {
		    document.getElementById("operacion").value = "consultar";
			document.getElementById("imgWait").style.visibility = "visible";
		    document.getElementById("frmDatos").submit();
        }

	    function keyDownEsc() {
            window.close();
        }

	    function selecciona(codigo, descripcion) {
        	window.returnValue = codigo + "|" + descripcion;
            window.close();
        }

	    // Solicitar una página en un formulario de búsqueda
	    function paginar(pagina) {
    		document.getElementById("operacion").value = "paginar";
    		document.getElementById("pagina").value = pagina;
    		document.getElementById("frmDatos").submit();
	    }	    

	 	// Ordenar por una columna los resultados de una búsqueda
	    function ordenar(columna) {
    		document.getElementById("operacion").value = "ordenar";
    		document.getElementById("columna").value = columna;
    		document.getElementById("frmDatos").submit();
	    }
	    
	</script>
  </head>
  <body class="ventanaModal" onkeydown="keyDown(event)" onload="inicio()">
	  <cmz:panelPrincipal>
	  	<cmz:cabeceraPanelPrincipal titulo="${ayuda.tituloVentana}"></cmz:cabeceraPanelPrincipal>
	  	<cmz:cuerpoPanelPrincipal>
	  		<table height="100%" width="100%" cellpadding="0" cellspacing="0">
	  			<tr valign="top">
					<td>
				  		<cmz:panel>
				  			<cmz:cuerpoPanel>
				  				<table cellspacing='1' cellpadding='0' border='0' width="100%" height="100%">
									<tr align="center">
										<%
										    String letras = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
										    char letra;
										    for(int i=0; i<letras.length(); i++) {
										        letra = letras.charAt(i);
										    
										%>
										<td bgcolor='white' class="index" onclick="filtrar('<%=letra%>')" style="cursor: pointer;">
											<nobr><%=letra%></nobr>
										</td>
										<%
										        if (letra == 'N') {
										%>
											</tr>
											<tr align="center">
										<%
										        }
										        if (letra == 'Z') {
										%>
											<td bgcolor='white'><nobr></nobr></td>
										<%
										        }
										%>
										<%
										    }
										%>
									</tr>	
				  				</table>
				  			</cmz:cuerpoPanel>
				  		</cmz:panel>
					</td>
	  			</tr>
	  			<tr height="100%" valign="top">
					<td>
		  			    <form name="frmDatos" id="frmDatos" action="ayuda" method="POST">
  			  	  		  <input type="hidden" name="nombreAyuda" id="nombreAyuda" value="${ayuda.nombre}"/>	
			           	  <input id="operacion" name="operacion" type="hidden" value="" />
			           	  <input id="columna" name="columna" type="hidden" value="" />
			           	  <input id="pagina" name="pagina" type="hidden" value="" />
				  		  <cmz:panel>
				  		  	<cmz:cabeceraPanelResultados titulo="Buscador" numPorPagina="${paramBuscarAyudas.tamañoPagina}"></cmz:cabeceraPanelResultados>
				  			<cmz:cuerpoPanel>
			                  <cmz:listaPaginada>
			                    <cmz:cabeceraListaPaginada ordenActual="${paramBuscarAyudas.orden}">
					  			  <c:if test="${codigoVisible}">
						  			<cmz:itemCabeceraListaPaginada nombre="${ayuda.etiquetaCodigo}" columna="1" ordenColumna="${ayuda.campoCodigo}"></cmz:itemCabeceraListaPaginada>
					  			  </c:if>
					  			  <cmz:itemCabeceraListaPaginada nombre="${ayuda.etiquetaDescripcion}" columna="2" ordenColumna="${ayuda.campoDescripcion}"></cmz:itemCabeceraListaPaginada>
			                    </cmz:cabeceraListaPaginada>
					  			<c:if test="${codigoVisible}">
						  		  <td>
						  			<table cellpadding="1" cellspacing="1" width="100%">
						  			  <tr>
										<td><cmz:campoTexto id="codigo" valor="${paramBuscarAyudas.codigo}" anchura="100%"></cmz:campoTexto></td>
						  			  </tr>
						  			</table>
						  		  </td>
					  			</c:if>
					  			<td>
					  			  <table cellpadding="1" cellspacing="1" width="100%">
					  				<tr>
									  <td><cmz:campoTexto id="descripcion" valor="${paramBuscarAyudas.descripcion}" anchura="100%"></cmz:campoTexto></td>
					  				</tr>
					  			  </table>
					  			</td>
					  			<c:if test="${paginaResultados.pagina != null}">
			                      <cmz:contenidoListaPaginada variable="resultado" paginaResultados="${paginaResultados}">
                                    <c:set var="doblesComillas">"</c:set>
                                    <c:set var="codDoble">&#034;</c:set>
                                    <c:set var="barraVert">|</c:set>
                                    <c:set var="codEspacio">&#32;</c:set>
                                    <c:set var="comillaSimple">'</c:set>
                                    <c:set var="codSimple">\&#039;</c:set>
                                    <c:set var="barraInvertida">\</c:set>
                                    <c:set var="codBarraInvertida">\&#92;</c:set>
                                    <c:set var="descripcionFormateada" value="${fn:replace(resultado.descripcion,barraInvertida,codBarraInvertida)}"/>
                                    <c:set var="descripcionFormateada" value="${fn:replace(descripcionFormateada,comillaSimple,codSimple)}"/>
                                    <c:set var="descripcionFormateada" value="${fn:replace(descripcionFormateada,doblesComillas,codDoble)}"/>
                                    <c:set var="descripcionFormateada" value="${fn:replace(descripcionFormateada,barraVert,codEspacio)}"/>
				  				    <c:if test="${codigoVisible}">
									  <cmz:itemContenidoListaPaginada valor="${resultado.codigo}" onclick="selecciona('${resultado.codigo}','${descripcionFormateada}');"></cmz:itemContenidoListaPaginada>
				  				    </c:if>
								    <cmz:itemContenidoListaPaginada valor="${resultado.descripcion}" onclick="selecciona('${resultado.codigo}','${descripcionFormateada}');"></cmz:itemContenidoListaPaginada>
			                      </cmz:contenidoListaPaginada>
					  			</c:if>
			                  </cmz:listaPaginada>
				  			</cmz:cuerpoPanel>
				  		  </cmz:panel>
 				  		</form>
					</td>
	  			</tr>
	  		</table>
	  	</cmz:cuerpoPanelPrincipal>
	  </cmz:panelPrincipal>
      <div style="position:absolute; top:20px; right:10px; visibility: visible;">
        <img id="imgWait" style="visibility:hidden" src="comun/images/iconos/wait.gif" WIDTH="100" HEIGHT="10">
      </div>
  </body>
</html>
