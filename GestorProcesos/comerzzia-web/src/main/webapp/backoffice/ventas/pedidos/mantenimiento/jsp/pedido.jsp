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

<jsp:useBean id="formularioPedidoVentaBackoffice" type="com.comerzzia.web.backoffice.ventas.pedidos.ui.FormularioPedidoVentaBackofficeBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="pedido" value="${formularioPedidoVentaBackoffice.registroActivo}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    
    <script type="text/javascript">
	    function checkForm() {
	        return true;
	    }

	    function inicio() {
        	setFoco("codArticulo", "codConceptoAlmacen");
        	<c:if test="${(formularioPedidoVentaBackoffice.pestañaActiva == 0) && (formularioPedidoVentaBackoffice.editable)}">
	        	pintaCalendario("fecha", "imgFecha");
	        	pintaCalendario("fechaSuministroPrevista", "imgFechaSuministroPrevista");
        	</c:if>
            if(window.inicioRegistroPestaña) {
            	inicioRegistroPestaña();
            }
        }
        
        function confirmarSolicitudPedido() {
            if(confirm("¿Está seguro de que desea confirmar la solicitud de aprovisionamiento?")) {
                document.getElementById("accion").value = "confirmarSolicitudPedido";
                document.getElementById("frmDatos").submit();
            	_esperando();
            }
        }
        
        function imprimir(){
            document.getElementById("accion").value = "backoffice.aprovisionamientos.infAprovisionamientos";
            document.getElementById("operacion").value = "nuevo";
			document.getElementById("frmDatos").submit();
		}
        
    </script>
  </head>

  <body  onload="inicio();" onkeydown="keyDown(event);">
    <cmz:main>
      <cmz:panelCMZBackoffice>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="4">
            <c:choose>
              <c:when test="${!formularioPedidoVentaBackoffice.editable}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <c:if test="${!pedido.estadoNuevo && pedido.estaSolicitud}">
                    <cmz:accion titulo="Confirmar Solicitud" icono="backoffice/ventas/pedidos/buscar/images/confirmarSolicitud.gif" descripcion="Confirmación de la solicitud de aprovisionamiento" onclick="confirmarSolicitudPedido();" />
                  </c:if>
                </c:if>
	            <cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir Pedido" onclick="imprimir()" />
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Pedido"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Nueva solicitud de aprovisionamiento" titulo="Nueva Solicitud"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Pedido"></cmz:accion>
                </c:if>
              </c:when>
              <c:otherwise>
              	<cmz:accionSalvar onclick="aceptar();"/>
                <cmz:accionCancelar onclick="cancelar();"/>
              </c:otherwise>
            </c:choose>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="pedidosVentasBackoffice" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            <input id="idObjeto" name="idObjeto" type="hidden" value="${pedido.idPedido}" />
            
            <cmz:pestañas>
              <cmz:cabeceraPestañas pestañaActiva="${formularioPedidoVentaBackoffice.pestañaActiva}">
                <cmz:pestaña titulo="Cabecera" accion="0" onclick="seleccionaPestaña(0);"></cmz:pestaña>
                <cmz:pestaña titulo="Artículos" accion="1" onclick="seleccionaPestaña(1);"></cmz:pestaña>
                <cmz:pestaña titulo="Resumen" accion="2" onclick="seleccionaPestaña(2);"></cmz:pestaña>
              </cmz:cabeceraPestañas>
              <cmz:cuerpoPestaña>
                <c:choose>
                  <c:when test="${formularioPedidoVentaBackoffice.pestañaActiva == 1}">
                    <c:choose>
                      <c:when test="${formularioPedidoVentaBackoffice.formularioPestañaArticulos.modoVisualizacionDesgloses}">
                        <c:import url="articulosDesgloses.jsp"></c:import>
                      </c:when>
                      <c:when test="${formularioPedidoVentaBackoffice.formularioPestañaArticulos.modoVisualizacionFicha}">
                        <c:import url="articulosFicha.jsp"></c:import>
                      </c:when>
                      <c:otherwise>
                        <c:import url="articulosTabla.jsp"></c:import>
                      </c:otherwise>
                    </c:choose>
                  </c:when>
                  <c:when test="${formularioPedidoVentaBackoffice.pestañaActiva == 2}">
                    <c:import url="resumen.jsp"></c:import>
                  </c:when>
                  <c:otherwise>
                    <c:import url="cabecera.jsp"></c:import>
                  </c:otherwise>
                </c:choose>
              </cmz:cuerpoPestaña>
            </cmz:pestañas>
            
            <cmz:panel>           
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Base:</td>
                    <td>
                      <cmz:campoTexto id="base" anchura="90px" longitudMaxima="13" soloLectura="${true}">
                        <cmz:formateaNumero valor="${pedido.base}" numDecimales="2"/>
                      </cmz:campoTexto>
                    </td>
                  
                    <td>Impuestos:</td>
                    <td>
                      <cmz:campoTexto id="impuestos" anchura="90px" longitudMaxima="13" soloLectura="${true}">
                        <cmz:formateaNumero valor="${pedido.impuestos}" numDecimales="2"/>
                      </cmz:campoTexto>
                    </td>
                  
                    <td>Total:</td>
                    <td>
                      <cmz:campoTexto id="total" anchura="90px" longitudMaxima="13" soloLectura="${true}">
                        <cmz:formateaNumero valor="${pedido.total}" numDecimales="2"/>
                      </cmz:campoTexto>
                    </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <cmz:panel>
              <cmz:cuerpoPanel>
                <b>ESTADO DEL APROVISIONAMIENTO: <c:out value="${pedido.desEstadoReceptor}"></c:out></b>
              </cmz:cuerpoPanel>
            </cmz:panel>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZBackoffice>
    </cmz:main>
  </body>
</html>
