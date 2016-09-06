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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="asistenteConfiguracion" type="com.comerzzia.persistencia.core.empresas.AsistenteConfiguracionEmpresaBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/mantenimiento.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    
    <script type="text/javascript">
        function checkForm() {
        	var desglosar = document.getElementById("desglosar").checked;
        	if(desglosar){
	        	if(!esValido("tituloDesglose1", "TEXTO", true))
	            	return false;
	        	if(!esValido("tituloDesglose2", "TEXTO", true))
	            	return false;
        	}
           
            return true;
        }
        
        function finalizar() {
        	if(checkForm()) {
            	if(confirm("Va a finalizar el asistente de configuración y se guardarán todos los datos introducidos.\n¿Está seguro que desea finalizar?")){
	        	    document.getElementById("operacion").value = "finalizar";
	        	    document.getElementById("frmDatos").submit();
	        		_esperando();
            	}
        	}
        }

        function atras() {
        	document.getElementById("operacion").value = "atras";
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }

        function onclickDesglose(){
			var desglosar = document.getElementById("desglosar").checked;
			if(desglosar){
				document.getElementById("tr_desglose1").style.display = "";
				document.getElementById("tr_desglose2").style.display = "";
			}else{
				document.getElementById("tr_desglose1").style.display = "none";
				document.getElementById("tr_desglose2").style.display = "none";
				document.getElementById("tituloDesglose1").value = "";
				document.getElementById("tituloDesglose2").value = "";
			}
        }

    </script>
  </head>

  <body>
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="asistenteConfig" method="post">
            <input id="accion" name="accion" type="hidden" value="leerDesglose" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Configuración"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px" width="100%" class="asistenteEmpresa">
                  <tr>
                  	<td height="10px" colspan="2">
                      <input type="checkbox" value="" id="desglosar" name="desglosar" onclick="onclickDesglose();"
                      	<c:if test="${asistenteConfiguracion.desglosar}">checked="checked"</c:if>/>
                      Desglosar almacenes (tallas, colores, lotes, etc)
                    </td>
                  </tr>
                  <tr id="tr_desglose1" <c:if test="${!asistenteConfiguracion.desglosar}">style="display:none"</c:if>>
                    <td height="10px">Título desglose 1:</td>
                    <td>
                      <cmz:campoTexto id="tituloDesglose1" valor="${asistenteConfiguracion.tituloDesglose1}" requerido="true" anchura="300px" longitudMaxima="20"/>
                    </td>
                  </tr>                 
                  <tr id="tr_desglose2" <c:if test="${!asistenteConfiguracion.desglosar}">style="display:none"</c:if>>
                    <td height="10px" >Titulo desglose 2:</td>
                    <td><cmz:campoTexto id="tituloDesglose2" valor="${asistenteConfiguracion.tituloDesglose2}" requerido="true" anchura="300px" longitudMaxima="20"/></td>
                  </tr>
                  <tr><td height="190px" width="90px"></td></tr><!-- SEPARADOR -->
                </table>
                <div class="botonesAsistente">
					<cmz:boton onclick="atras();" valor="&lt;&lt; Atrás" id="btnAtras" />
					<cmz:boton onclick="finalizar();" valor="Finalizar" id="btnFinalizar" />
				</div>
              </cmz:cuerpoPanel>
            </cmz:panel>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
