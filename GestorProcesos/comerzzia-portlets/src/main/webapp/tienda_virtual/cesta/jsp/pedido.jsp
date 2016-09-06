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
<jsp:useBean id="datosCliente" type="com.comerzzia.persistencia.general.clientes.ClienteBean" scope="request" />

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Comerzzia</title>
	
	<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}" />/tienda_virtual/css/comerzzia_portlet.css" />
	
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/comun/js/md5.js"></script>
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/comun/js/validacion.js"></script>
	
	<script type="text/javascript">
		function <portlet:namespace />checkForm() {
	    	if(!esValido("desCli", "TEXTO", true))
	        	return false;
	    	if(!esValido("cif", "TEXTO", true))
	        	return false;
	    	if(!esValido("domicilio", "TEXTO", true))
	        	return false;
	    	if(!esValido("cp", "ENTERO", true))
	        	return false;
	    	if(!esValido("poblacion", "TEXTO", true))
	        	return false;
	    	if(!esValido("provincia", "TEXTO", true))
	        	return false;
	    	if(!esValido("telefono1", "ENTERO", true))
	        	return false;
	    	if(!esValido("telefono2", "ENTERO", false))
	        	return false;
	    	if(!esValido("observaciones", "TEXTO", false))
	        	return false;
	    	if(!validacionEmail(document.getElementById("email").value)){
				alert("El campo e-mail no tiene un formato correcto");
				document.getElementById("email").focus();
				document.getElementById("email").select();
				return false;
	    	}
	    	if (document.getElementById("observaciones").value.length > 255){
				alert("La longitud máxima para el campo observaciones es de 255 caracteres.");
				document.getElementById("observaciones").focus();
				document.getElementById("observaciones").select();
				return false;
		    }
			if(document.getElementById("desMedioPago").value == ""){
				alert("Para confirmar el pedido es necesario indicar una forma de pago");
				return false;
			}
	        return true;
	    }
		function <portlet:namespace />cancelar(){
			var url = '<portlet:actionURL><portlet:param name="accion" value="verCesta" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
		function <portlet:namespace />realizarPedido(){
			if (<portlet:namespace />checkForm()) {
				var url = '<portlet:actionURL><portlet:param name="accion" value="confirmarPedido" /></portlet:actionURL>';
				document.<portlet:namespace />frmDatos.action = url;
				document.<portlet:namespace />frmDatos.btnRealizarPedido.disabled = true;
				document.<portlet:namespace />frmDatos.btnCancelarPedido.disabled = true;
				document.<portlet:namespace />frmDatos.submit();
			}
		}
		function <portlet:namespace />rellenaRadioCheck(desMedioPago){
			document.getElementById("desMedioPago").value = desMedioPago;
		}
	</script>
	
	
</head>


<body>
<form action="" id="<portlet:namespace />frmDatos" name="<portlet:namespace />frmDatos" method="post">
<input id="desMedioPago" name="desMedioPago" value="" type="hidden"/>
<table border="0" width="100%">
  <tr>
  <c:if test="${!empty requestScope.mensajeError}">
  	<tr>
  	  <td colspan="9" align="center">
	  	<table align="center" width="100%">
	  	  <tr><td><font class="portlet-msg-error" ><c:out value="${requestScope.mensajeError}" /></font></td></tr>
	  	</table>
  		  </td>
  	</tr>
  </c:if>
  <c:if test="${!empty requestScope.mensajeInfo}">
  	<tr>
  	  <td colspan="9" align="center">
	  	<table align="center" width="100%">
	  	  <tr><td><font class="portlet-msg-success" ><c:out value="${requestScope.mensajeInfo}" /></font></td></tr>
	  	</table>
  		  </td>
  	</tr>
  </c:if>
    <td colspan="2">        
	      <!-- Formulario Datos Cliente -->
	      <table class="apartadoCesta" cellspacing="2" cellpadding="1" border="0" width="100%">
	        <tr class="tituloCesta">
	          <td>DATOS DEL CLIENTE</td>
	       	</tr>
	       	<tr><td style="height:20px"></td></tr><!-- separador -->
	        <tr>
	          <td>
	          	<table cellspacing="2" cellpadding="0" border="0" class="tablaDatosCesta">
	          	  <c:if test="${!empty datosCliente.cif}">
					  <tr>
				  		<td colspan="3" style="padding-bottom:15px;padding-top:15px"><b>Si lo desea puede modificar sus datos antes de realizar el pedido: </b></td>
					  </tr>
	          	  </c:if>
	          	  <tr>
	          	    <td style="font-weight:bold;padding:5px 20px 5px 0px" nowrap="nowrap" width="50px">
	          	      Nombre:
	          	    </td>
	          	    <td align="left" valign="top" nowrap="nowrap"  width="300px">
	          	      <input style="width:300px" maxlength="45" class="campo requerido" type="text" name="desCli" id="desCli" value="<c:out value="${datosCliente.desCli}"/>" tabindex="1"/>
	          	    </td>
	          	    <td style="font-weight:bold;padding:5px 10px 5px 40px" nowrap="nowrap" width="40px">
	          	      NIF:
	          	    </td>
	          	    <td align="left" valign="top" nowrap="nowrap">
	          	      <c:choose>
	          	      	<c:when test="${!empty datosCliente.cif}">
	          	      		<input style="width:75px" class="campo soloLectura" type="text" name="cif" id="cif" value="<c:out value="${datosCliente.cif}"/>" readonly="readonly"/>
	          	      	</c:when>
	          	      	<c:otherwise>
	          	      		<input style="width:75px" maxlength="11" class="campo requerido" type="text" name="cif" id="cif" value="<c:out value="${datosCliente.cif}"/>" tabindex="5"/>
	          	      	</c:otherwise>
	          	      </c:choose>
	          	    </td>
	          	  </tr>
	          	  <tr>
	          	    <td style="font-weight:bold;padding:5px 20px 5px 0px" nowrap="nowrap">
	          	      Dirección:
	   	            </td>
	  	            <td align="left" valign="top" nowrap="nowrap">
	  	              <input style="width:300px" maxlength="50" class="campo requerido" type="text" name="domicilio" id="domicilio" value="<c:out value="${datosCliente.domicilio}"/>" tabindex="2"/>
	  	            </td>
	  	            <td style="font-weight:bold;padding:5px 10px 5px 40px" nowrap="nowrap">
	  	              CP:
	  	            </td>
	  	            <td align="left" valign="top" nowrap="nowrap">
	  	              <input style="width:40px" maxlength="8" class="campo requerido" type="text" name="cp" id="cp" value="<c:out value="${datosCliente.cp}"/>" tabindex="6"/>
	  	            </td>
	  	          </tr>
	  	          <tr>
	  	            <td style="font-weight:bold;padding:5px 20px 5px 0px" nowrap="nowrap">
	  	              Población:
	  	            </td>
	  	            <td align="left" valign="top" nowrap="nowrap">
	  	              <input style="width:300px" maxlength="50" class="campo requerido" type="text" name="poblacion" id="poblacion" value="<c:out value="${datosCliente.poblacion}"/>" tabindex="3"/>
	  	            </td>
	  	            <td style="font-weight:bold;padding:5px 10px 5px 40px" nowrap="nowrap">
	  	              Teléfonos:
	  	            </td>
	  	            <td align="left" valign="top" nowrap="nowrap">
	  	              <input style="width:75px" maxlength="15" class="campo requerido" type="text" name="telefono1" id="telefono1" value="<c:out value="${datosCliente.telefono1}"/>" tabindex="7"/>
	  	              &nbsp;&nbsp;&nbsp;<input style="width:75px" maxlength="15" class="campo" type="text" name="telefono2" id="telefono2" value="<c:out value="${datosCliente.telefono2}"/>" tabindex="8"/>
	  	            </td>
	  	          </tr>
	  	          <tr>
	  	            <td style="font-weight:bold;padding:5px 20px 5px 0px" nowrap="nowrap">
	  	              Provincia:
	  	            </td>
	  	            <td align="left" valign="top" nowrap="nowrap">
	  	              <input style="width:150px" maxlength="50" class="campo requerido" type="text" name="provincia" id="provincia" value="<c:out value="${datosCliente.provincia}"/>" tabindex="4"/>
	  	            </td>
	  	            <td style="font-weight:bold;padding:5px 10px 5px 40px" nowrap="nowrap">
	  	              E-mail:
	  	            </td>
	  	            <td align="left" valign="top" nowrap="nowrap">
	  	              <input style="width:200px" maxlength="60" class="campo requerido" type="text" name="email" id="email" value="<c:out value="${datosCliente.email}"/>" tabindex="9"/>
	  	            </td>
	  	          </tr>
	  	          <tr>
	  	            <td colspan="4" style="font-weight:bold;padding:5px 10px 5px 0px" style="font-weight: bold" nowrap="nowrap">
	  	              Observaciones:
	  	            </td>
	  	          </tr>
	  	          <tr>
	          	    <td colspan="4" style="font-weight: bold" nowrap="nowrap">
	          	      <textarea id="observaciones" name="observaciones" tabindex="10" class="campo" style="padding-left: 5px;" rows="2" cols="170"><c:out value="${datosCliente.observaciones}"/></textarea>          	            
	          	    </td>
	          	  </tr>
	          	</table>
	         </td>
	       </tr>
	      </table>
	      <!-- Fin Formulario Datos Cliente -->
    	</td>
  	</tr>
	<tr>
    	<td width="50%" valign="top" style="padding-right: 10px">        
	      <!-- Formulario Datos Cliente -->
	      <table class="apartadoCesta" cellspacing="2" cellpadding="1" border="0" width="100%">
	        <tr class="tituloCesta">
	          <td>RESUMEN DE PEDIDO</td>
	       	</tr>
	       	<tr><td style="height:5px"></td></tr><!-- separador -->
            <tr>
              <td>
                  <!-- Tabla Totales -->
                  <table cellspacing="0" cellpadding="0" style="text-align:left;margin-left:150px" border="0" class="tablaResultados" >
                    <tr><td style="height:5px"></td></tr>
                    <tr> 
                      <td style="height:25px" nowrap="nowrap" >Importe artículos :</td>
                      <td align="right" nowrap="nowrap" style="padding-left:20px;font-size:13px;font-weight:bold"><fmt:formatNumber value="${cestaTiendaVirtual.importeRedondeado}" minFractionDigits="2" />&nbsp;&#8364;</td>
                    </tr>
                    <tr > 
                      <td style="height:25px" nowrap="nowrap" ><c:out value="${cestaTiendaVirtual.descripcionPorte}"/> :</td>
                      <td align="right" nowrap="nowrap" style="padding-left:20px;font-size:13px;font-weight:bold"><fmt:formatNumber value="${cestaTiendaVirtual.importePorte}" minFractionDigits="2" />&nbsp;&#8364;</td>
                    </tr>
                    <tr class="separadorTotales"><td height="5px"></td></tr>
                    <tr><td height="5px"></td></tr>
                    <tr> 
                      <td style="height:25px" nowrap="nowrap" >Total Pedido :</td>
                      <td align="right" nowrap="nowrap" style="color:red;padding-left:20px;font-size:13px;font-weight:bold"><fmt:formatNumber value="${cestaTiendaVirtual.importeTotalRedondeado}" minFractionDigits="2" />&nbsp;&#8364;</td>
                    </tr>
                  </table>
                  <!-- Fin Tabla Totales -->
                </td>
                </tr>
	      </table>
  	   </td>
  	   <td width="50%" valign="top" style="padding-left: 10px">
	      <table class="apartadoCesta" cellspacing="2" cellpadding="1" border="0" width="100%">
	        <tr class="tituloCesta">
	          <td>FORMA DE PAGO</td>
	       	</tr>
	       	<tr><td style="height:5px"></td></tr><!-- separador -->
            <tr>
              <td>
                  <table cellspacing="0" cellpadding="0" border="0" class="tablaResultados" >
                    <c:forEach items="${mediosPago}" var="medioPago">
	                    <tr>
	                    	<td height="25px">
	                    		<input style="margin-left:25px" type="radio" id="medioPago" name="medioPago" value="${medioPago.codMedioPago}" onclick="<portlet:namespace />rellenaRadioCheck('<c:out value="${medioPago.desMedioPago}" />')" />
	                    		<c:out value="${medioPago.desMedioPago}" />
	                    	</td>
	                    </tr>
                    </c:forEach>
                  </table>
                </td>
                </tr>
	      </table>
  	   </td>
  	</tr>
          
        <tr>
          <td colspan="2" align="center">
            <!-- Fin Tabla Resultados -->
            <!-- Inicio Tabla Pie -->
            <table cellspacing="" cellpadding="2" border="0">
              <tr>
                <td align="right">
                  <table cellspacing="0" cellpadding="0" border="0" class="tablaResultados" align="right">
                    <tr>
                      <td>
                        <input type="button" id="btnRealizarPedido" style="width:150px" onClick="<portlet:namespace />realizarPedido(${formularioTiendaVirtual.usuarioLogado})" tabindex="11" value="Confirmar pedido" />&nbsp;
                        <input type="button" id="btnCancelarPedido" style="width:150px" onClick="<portlet:namespace />cancelar()" tabindex="12" value="Cancelar" />&nbsp;
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
