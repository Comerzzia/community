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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="version" scope="page" class="com.comerzzia.util.version.Version"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia - Login</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="core/login/css/login.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/md5.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript">
	    
	    function checkForm() {
	        if (document.getElementById("usuario").value.length == 0){
	            window.alert("Es necesario introducir el Usuario");
	        	return false;
	        }
	        return true;
	    }
	    
	    function keyDownEnter() {
            aceptar();
        }
        
	    function aceptar() {
	    	if(checkForm()) {
		    	if (document.getElementById("password").value.length == 0){
		    		document.getElementById("clave").value = "";
		    	}else{
		    		document.getElementById("clave").value = hex_md5(document.getElementById("password").value);
		    	}
		    	document.frmLogin.submit();
	    	}
	    }

        function inicio() {
            // establecemos la visibilidad del menú lateral por defecto a visible
            // y todas l
            document.cookie = "comerzzia.menuLateral.visible=1";
            document.cookie = "comerzzia.opcionMenu.visible=-1";

            document.getElementById("usuario").focus();
        }
    </script>
  </head>
  <body onload="inicio();" onkeydown="keyDown(event);">
    
    <div id="login-main">
      
      
      <div id="login-box">        
        
        <div id="login-title">
          <div id="login-version">
             <c:out value="${version.version}"></c:out>
          </div>
        </div>  

                
        <div id="login-form">
          <form id="frmLogin" name="frmLogin" method="post" action="login">
            <input type="hidden" id="accion" name="accion" value="login" />
            <input type="hidden" id="clave" name="clave" value="" />
          
		    <table border="0" cellpadding="3">
		      <tr >
		        <td colspan="2" align="left" >
		          <div>
                    <img src="comun/images/logos/logo_comerzzia.png" alt="Comerzzia" style="margin-left: 10px; height: 40px;"/>
                  </div>
                   
		          <table style="margin-top: 10px">
		          	<tr>
		          	  <td align="right"><label for="login">Usuario: </label></td>
					  <td><input type="text" name="usuario" value="" tabindex="1" id="usuario" class="login-input"/></td>
		            </tr>
		            <tr>
		              <td align="right"><label for="password">Contraseña: </label></td>
		              <td><input type="password" name="password" value="" tabindex="2" id="password" class="login-input"/></td>
		           	</tr>
		           	<tr>
		           	  <td colspan="2">
		           		<input type="button" id="frmDatos_0" value="Entrar" class="login-submit" tabindex="3" onclick="aceptar();"/>
		              </td>
		            </tr>
		          </table>
		        </td>
		      </tr>
		    </table>
          
          </form>
        </div>
      
        <div id="login-result">
          <div id="login-failed">
            <c:out value="${requestScope.mensajeError}" />
      	  </div> 
        </div>       
      </div>
    </div>
  
    <div id="login-foot">
      <div id="login-failed">
      </div>
    </div>
  </body>
</html>
