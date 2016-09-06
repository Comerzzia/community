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

<jsp:useBean id="formularioTienda" type="com.comerzzia.web.general.tiendas.ui.FormularioTiendaBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />
<jsp:useBean id="asistenteTienda" type="com.comerzzia.servicios.general.tiendas.AsistenteTienda" scope="session" />

<c:set var="tienda" value="${asistenteTienda.tienda}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    
    <script type="text/javascript">
    	function checkForm() {
    		var numChecks = document.frmDatos.tarifas.length;
     		if(numChecks){
    			for(i = 0; i < numChecks; i++){
    				if(document.frmDatos.tarifas[i].checked){
    					return true;
    				}
       			}

      		}
     		alert("Debe seleccionar al menos una tarifa");
    		return false;
        }

        function atras() {
    		document.getElementById("accion").value = "asistenteAlta";
    		document.getElementById("operacion").value = "anterior";
    		document.getElementById("frmDatos").submit();
    		_esperando();
    	}

        function siguiente() {
    		if (checkForm()) {
    			document.getElementById("accion").value = "asistenteAlta";
    			document.getElementById("operacion").value = "siguiente";
    			document.getElementById("frmDatos").submit();
    			_esperando();
    		}
    	}
        
    </script>
  </head>

  <body>
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="Asistente para la Creación de una Tienda" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="1">
            <cmz:accionCancelar onclick="volver();"/>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="tiendas" method="post">            
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Tarifas"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
	            <table cellpadding="2px" cellspacing="2px" border="0px" class="asistenteTienda">
                  <tr>
                    <td>
                      <cmz:lista>
					    <cmz:cabeceraLista>
						  <cmz:itemCabeceraLista nombre="Sel." columna="1"></cmz:itemCabeceraLista>
						  <cmz:itemCabeceraLista nombre="Tarifa" columna="2"></cmz:itemCabeceraLista>
						  <cmz:itemCabeceraLista nombre="Descripción" columna="3"></cmz:itemCabeceraLista>
					    </cmz:cabeceraLista>
					    <cmz:contenidoLista variable="tarifa" lista="${requestScope.lstTarifas}">
						  <cmz:itemContenidoLista>
							<input type="checkbox" id="tarifas" name="tarifas" value="${tarifa.codTar},${tarifa.desTar}"
								<c:if test="${!empty tienda.tarifasSeleccionadas[tarifa.codTar]}">checked="checked"</c:if> />
						  </cmz:itemContenidoLista>
						<cmz:itemContenidoLista valor="${tarifa.codTar}"></cmz:itemContenidoLista>
						<cmz:itemContenidoLista valor="${tarifa.desTar}"></cmz:itemContenidoLista>
					  </cmz:contenidoLista>
				    </cmz:lista>
				  </td>
				</tr>
                <tr><td height="10px"></td></tr><!-- SEPARADOR -->
                </table>
	            <div class="botonesAsistente">
					<cmz:boton onclick="atras();" valor="&lt;&lt; Atras" id="btnAtras" />
					<cmz:boton onclick="siguiente();" valor="Siguiente &gt;&gt;" id="btnSiguiente" />
			  	</div>
              </cmz:cuerpoPanel>
            </cmz:panel>           
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
