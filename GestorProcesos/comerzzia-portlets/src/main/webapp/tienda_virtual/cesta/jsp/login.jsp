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

<portlet:defineObjects/>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Comerzzia</title>
	
	<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}" />/tienda_virtual/css/comerzzia_portlet.css" />
	
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/comun/js/md5.js"></script>
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/comun/js/validacion.js"></script>
	
	<script type="text/javascript">
		function <portlet:namespace />checkForm() {
        	if (document.getElementById("operacion").value == "login"){
				if(!esValido("usuario", "TEXTO", true)){
					return false;
				}
	            if(!esValido("password", "TEXTO", true)){
	            	return false;
	        	}
        	}
        	else{	
				if(!esValido("usuarioNuevo", "TEXTO", true)){
					return false;
				}
	            if(!esValido("passwordNuevo", "TEXTO", true)){
	            	return false;
	        	}
	            if(!esValido("confirmaNuevo", "TEXTO", true)){
	                return false;
	            }
		    	var password = document.getElementById("passwordNuevo").value;
	            var confirma = document.getElementById("confirmaNuevo").value;
	            if(password != confirma){
	                window.alert("Las contraseñas indicadas no se corresponden");
	                document.getElementById("passwordNuevo").value = "";
	                document.getElementById("confirmaNuevo").value = "";
	                document.getElementById("passwordNuevo").focus();
	                return false;
	            }
			}
			return true;
	    } 
		function <portlet:namespace />registrarUsuario(){
        	document.getElementById("operacion").value = "registrar";
			if (<portlet:namespace />checkForm()) {
               	document.getElementById("clave").value = hex_md5(document.getElementById("passwordNuevo").value);
				var url = '<portlet:actionURL><portlet:param name="accion" value="registrarCliente" /></portlet:actionURL>';
				document.<portlet:namespace />frmDatos.action = url;
				document.<portlet:namespace />frmDatos.submit();
			}
		}
		function <portlet:namespace />loginUsuario(){
        	document.getElementById("operacion").value = "login";
			if (<portlet:namespace />checkForm()) {
               	document.getElementById("clave").value = hex_md5(document.getElementById("password").value);
				var url = '<portlet:actionURL><portlet:param name="accion" value="registrarCliente" /></portlet:actionURL>';
				document.<portlet:namespace />frmDatos.action = url;
				document.<portlet:namespace />frmDatos.submit();
			}
		}
		function <portlet:namespace />volver(){
			var url = '<portlet:actionURL><portlet:param name="accion" value="verCesta" /></portlet:actionURL>';
			document.<portlet:namespace />frmDatos.action = url;
			document.<portlet:namespace />frmDatos.submit();
		}
	</script>
</head>


<body>
<form action="" id="<portlet:namespace />frmDatos" name="<portlet:namespace />frmDatos" method="post">
  <input type="hidden" name="clave" id="clave" value="" />
  <input type="hidden" name="operacion" id="operacion" value="" />

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
	<tr class="tituloCesta">
	  <td colspan="2">DATOS DEL USUARIO</td>
	</tr>
  <tr>
    <td valign="top" width="50%">
		  <table class="apartadoCesta" cellspacing="2" cellpadding="1" border="0" width="100%">
			<tr>
	  		  <td>
				<table cellspacing="2" cellpadding="0" border="0" class="tablaDatosCesta">
				  <tr>
			  		<td colspan="3" style="padding-bottom:15px;padding-top:15px"><b>Si ya está registrado, indique su usuario y contraseña para recuperar sus datos de cliente:</b></td>
				  </tr>
				  <tr>
					<td style="font-weight:bold;padding:5px 10px 5px 0px" nowrap="nowrap" width="100px">
					  Usuario:
					</td>
					<td align="left" valign="top" nowrap="nowrap">
					  <input style="width:130px" maxlength="20" class="campo requerido" type="text" name="usuario" id="usuario" value="<c:out value='${usuarioLogin}'/>" tabindex="1"/>
					</td>
				  </tr>
				  <tr>
	  				<td style="font-weight:bold;padding:5px 10px 5px 0px" nowrap="nowrap">
	    			  Contraseña:
	  				</td>
	       	        <td align="left" valign="top" nowrap="nowrap">
	       	          <input style="width:130px" class="campo requerido" type="password" name="password" id="password" tabindex="2"/>
	     	        </td>
	       	      </tr>
	       	      <tr><td height="5px"></td></tr>
                  <tr align="center">
                     <td colspan="2">
                       <input type="button" id="btnLogin" style="width:150px" onClick="<portlet:namespace />loginUsuario()" tabindex="3" value="Entrar" />&nbsp;
                     </td>
                   </tr>
	       	    </table>
	       	  </td>
	       	</tr>
	      </table>
	      <!-- Fin Formulario Datos Usuario -->
    </td>
    <td valign="top" width="50%">

		  <table class="apartadoCesta" cellspacing="2" cellpadding="1" border="0" width="100%">
			<tr>
	  		  <td>
				<table cellspacing="2" cellpadding="0" border="0" class="tablaDatosCesta">
				  <tr>
			  		<td colspan="3" style="padding-bottom:15px;padding-top:15px"><b>Si no está registrado, indique un usuario y contraseña para poder recuperar sus datos cómodamente en nuevas visitas y realizar un seguimiento de sus pedidos:</b></td>
				  </tr>
				  <tr>
					<td style="font-weight:bold;padding:5px 10px 5px 0px" nowrap="nowrap" width="100px">
					  Usuario:
					</td>
					<td align="left" valign="top" nowrap="nowrap">
					  <input style="width:130px" maxlength="20" class="campo requerido" type="text" name="usuarioNuevo" id="usuarioNuevo" value="<c:out value='${usuarioNuevo}'/>" tabindex="4"/>
					</td>
				  </tr>
				  <tr>
	  				<td style="font-weight:bold;padding:5px 10px 5px 0px" nowrap="nowrap">
	    			  Contraseña:
	  				</td>
	       	        <td align="left" valign="top" nowrap="nowrap">
	       	          <input style="width:130px" class="campo requerido" type="password" name="passwordNuevo" id="passwordNuevo" tabindex="5"/>
	     	        </td>
	       	      </tr>
	       	      <tr>
	       	        <td style="font-weight:bold;padding:5px 10px 5px 0px" nowrap="nowrap">
	       	          Confirmar Contraseña:
	       	        </td>
	       	        <td align="left" valign="top" nowrap="nowrap">
	       	          <input style="width:130px" class="campo requerido" type="password" name="confirmaNuevo" id="confirmaNuevo" tabindex="6"/>
	       	        </td>
	       	      </tr>
	       	      <tr><td height="5px"></td></tr>
                  <tr align="center">
                     <td colspan="2">
                       <input type="button" id="btnRegistrar" style="width:150px" onClick="<portlet:namespace />registrarUsuario()" tabindex="7" value="Registrarme" />&nbsp;
                     </td>
                   </tr>
	       	    </table>
	       	  </td>
	       	</tr>
	      </table>
    </td>
  </tr>
  <tr>
  	<td colspan="2" align="center">
       <input type="button" id="btnVolver" style="width:150px" onClick="<portlet:namespace />volver()" tabindex="8" value="Volver" />&nbsp;
  	</td>
  </tr>

 </table>
</form>

</body>
</html>
