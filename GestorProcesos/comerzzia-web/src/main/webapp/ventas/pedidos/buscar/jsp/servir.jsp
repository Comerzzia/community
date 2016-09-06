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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="resumenPedidosSeleccionados" type="java.util.List<com.comerzzia.servicios.ventas.pedidos.PedidoVenta>" scope="request" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />
<jsp:useBean id="hoy" class="java.util.Date" scope="page" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    
    <script type="text/javascript">
	    function inicio() {
	        document.getElementById("fechaSuministro").focus();
            
	        pintaCalendario("fechaSuministro", "imgFechaSuministro");
	    }
        
	    function volver() {
	    	document.getElementById("accion").value = "buscar";
	        document.getElementById("frmDatos").submit();
	    	_esperando();
	    }
	    
	    function checkForm() {
	        if (!esValido("fechaSuministro", "FECHA", true)) {
	            return false;
	        }
	        
			return true;
	    }
        
        function servir() {
            if(checkForm()) {
            	if(confirm("¿Está seguro de que desea servir los pedidos seleccionados?")) {
                    document.getElementById("frmDatos").submit();
                	_esperando();
            	}
            }
        } 
    </script>
  </head>

  <body onload="inicio();" >
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="Servir Pedidos" icono="ventas/pedidos/buscar/images/servirPedido.gif">
          <cmz:acciones numAccionesVisibles="1">
            <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="pedidosVentas" method="POST">
            <c:choose>
              <c:when test="${requestScope.multiplesPedidos}">
                <input id="accion" name="accion" type="hidden" value="servirMultiplesPedidos" />
              </c:when>
              <c:otherwise>
                <input id="accion" name="accion" type="hidden" value="servirPedido" />
              </c:otherwise>
            </c:choose>
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Parámetros"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
	            <table cellpadding="2px" cellspacing="2px" border="0px">
	              <tr>
                    <td>Fecha Suministro:</td>
                    <td>
                      <cmz:campoFecha id="fechaSuministro" editable="true" requerido="true">
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${hoy}" />
                      </cmz:campoFecha>
                    </td>
                    
                    <td align="right" width="150px">
                      <cmz:boton onclick="servir();" valor="Servir" id="btnServir"/>
                    </td>
				  </tr>
	            </table>  
              </cmz:cuerpoPanel>
            </cmz:panel>
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Pedidos Seleccionados"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <cmz:lista>
                  <cmz:cabeceraLista>
                    <cmz:itemCabeceraLista nombre="Periodo" estilo="text-align: center;"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Serie"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Pedido" estilo="text-align: right;"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Fecha" estilo="text-align: center;"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Cliente"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Descripción"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Concepto"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Descripción"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Importe" estilo="text-align: right;"></cmz:itemCabeceraLista>
                  </cmz:cabeceraLista>
                  
                  <cmz:contenidoLista variable="pedido" lista="${resumenPedidosSeleccionados}">
                    <cmz:itemContenidoLista alineacion="center" valor="${pedido.periodo}"></cmz:itemContenidoLista>
                    <cmz:itemContenidoLista valor="${pedido.codSerie}"></cmz:itemContenidoLista>
                    <cmz:itemContenidoLista alineacion="right" valor="${pedido.idPedido}"></cmz:itemContenidoLista>
                    <cmz:itemContenidoLista alineacion="center"><fmt:formatDate pattern="dd/MM/yyyy" value="${pedido.fecha}"/></cmz:itemContenidoLista>
                    <cmz:itemContenidoLista valor="${pedido.codCliente}"></cmz:itemContenidoLista>
                    <cmz:itemContenidoLista valor="${pedido.desCliente}"></cmz:itemContenidoLista>
                    <cmz:itemContenidoLista valor="${pedido.codConceptoAlmacen}"></cmz:itemContenidoLista>
                    <cmz:itemContenidoLista valor="${pedido.desConceptoAlmacen}"></cmz:itemContenidoLista>
                    <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${pedido.total}" numDecimales="2"></cmz:formateaNumero></cmz:itemContenidoLista>
                  </cmz:contenidoLista>
                </cmz:lista>
              </cmz:cuerpoPanel>
            </cmz:panel>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
