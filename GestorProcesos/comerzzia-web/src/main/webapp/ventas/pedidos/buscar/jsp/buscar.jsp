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

<jsp:useBean id="paramBuscarPedidosVentas" type="com.comerzzia.persistencia.ventas.pedidos.ParametrosBuscarPedidosVentasBean" scope="session" />
<jsp:useBean id="paginaResultados" class="com.comerzzia.util.paginacion.PaginaResultados" scope="request" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    
    <script type="text/javascript">
        function inicio() {
            setFoco("periodo");
            pintaCalendario("fechaDesde", "imgFechaDesde");
            pintaCalendario("fechaHasta", "imgFechaHasta");
        }

        function checkForm() {
            if(!esValido("periodo", "NUMERICO", false)) {
                return false;
            }
            if(!esValido("numPedido", "NUMERICO", false)) {
                return false;
            }
        	if(!esValido("codConceptoAlmacen", "AYUDA", false, "desConceptoAlmacen", "CONCEPTOS_ALMACENES_VENT")) {
    			return false;
    		}
        	if(!esValido("codAlmacen", "AYUDA", false, "desAlmacen", "ALMACENES")) {
    			return false;
    		}
        	if(!esValido("codCliente", "AYUDA", false, "desCliente", "PROVEEDORES")) {
    			return false;
    		}
            if(document.getElementById("chkFechaDesde").checked){
                if(!esValido("fechaDesde", "FECHA", true)) {
                    return false;
                }
            }
            if(document.getElementById("chkFechaHasta").checked){
                if(!esValido("fechaHasta", "FECHA", true)) {
                    return false;
                }
            }
            
            return true;
        }
        
        function checkPedidosSeleccionados() {
            var inputs = document.getElementsByTagName("input");
            for (var i = 0; i < inputs.length; i++) {
                if(inputs[i].type == "checkbox") {
                    if(inputs[i].name.substring(0, 12) == "chkIdPedido_") {
                        if(inputs[i].checked) {
                            return true;
                        }
                    }
                }
            }
            
            alert("Debe seleccionar al menos un pedido");
            
            return false;
        }
        
        function aceptarPedidos() {
            if(checkPedidosSeleccionados()) {
            	if(confirm("¿Está seguro de que desea aceptar los pedidos seleccionados?")) {
                    document.getElementById("accion").value = "aceptarMultiplesPedidos";
                    document.getElementById("frmDatos").submit();
                	_esperando();
            	}
            }
        }
        
        function prepararPedidos() {
            if(checkPedidosSeleccionados()) {
            	if(confirm("¿Está seguro de que desea dar por finalizada la preparación de los pedidos seleccionados?")) {
                    document.getElementById("accion").value = "prepararMultiplesPedidos";
                    document.getElementById("frmDatos").submit();
                	_esperando();
            	}
            }
        }
        
        function servirPedidos() {
            if(checkPedidosSeleccionados()) {
            	if(confirm("¿Está seguro de que desea servir los pedidos seleccionados?")) {
                	document.getElementById("accion").value = "formularioServirPedido";
                	document.getElementById("frmDatos").submit();
                    _esperando();
            	}
            }
        }

		function imprimir(){
            document.getElementById("accion").value = "ventas.pedidos.lstPedidosVentas";
            document.getElementById("operacion").value = "nuevo";
			document.getElementById("frmDatos").submit();
			_esperando();
		}
        
     </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="5">
            <c:if test="${permisos.puedeAñadir}">
              <cmz:accionNuevoRegistro onclick="alta();" titulo="Nueva Solicitud" descripcion="Nueva solicitud de pedido"/>
            </c:if>
            <c:if test="${permisos.puedeEditar}">
              <c:choose>
                <c:when test="${paramBuscarPedidosVentas.ningunEstadoSeleccionado}">
                  <cmz:accion titulo="Aceptar" icono="ventas/pedidos/buscar/images/aceptarPedido.gif" descripcion="Aceptar los pedidos seleccionados" onclick="aceptarPedidos();" />
                  <cmz:accion titulo="Fin Preparación" icono="ventas/pedidos/buscar/images/prepararPedido.gif" descripcion="Dar por finalizada la preparación de los pedidos seleccionados" onclick="prepararPedidos();" />
                  <cmz:accion titulo="Servir" icono="ventas/pedidos/buscar/images/servirPedido.gif" descripcion="Servir los pedidos seleccionados" onclick="servirPedidos();" />
                </c:when>
                <c:otherwise>
                    <c:if test="${paramBuscarPedidosVentas.estadoPendienteAceptacionSeleccionado}">
                      <cmz:accion titulo="Aceptar" icono="ventas/pedidos/buscar/images/aceptarPedido.gif" descripcion="Aceptar los pedidos seleccionados" onclick="aceptarPedidos();" />
                    </c:if>
                    <c:if test="${paramBuscarPedidosVentas.estadoPendientePreparacionSeleccionado}">
                      <cmz:accion titulo="Fin Preparación" icono="ventas/pedidos/buscar/images/prepararPedido.gif" descripcion="Dar por finalizada la preparación de los pedidos seleccionados" onclick="prepararPedidos();" />
                    </c:if>
                    <c:if test="${paramBuscarPedidosVentas.estadoPreparadoSeleccionado}">
                      <cmz:accion titulo="Servir" icono="ventas/pedidos/buscar/images/servirPedido.gif" descripcion="Servir los pedidos seleccionados" onclick="servirPedidos();" />
                    </c:if>
                </c:otherwise>
              </c:choose>
            </c:if>
            <cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir listado pedidos" onclick="imprimir()" />
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="pedidosVentas" method="POST">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda de Pedidos"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td valign="top">
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Pedido:</td>
                          <td>
                            <cmz:campoTexto id="periodo" valor="${paramBuscarPedidosVentas.periodo}" anchura="40px" longitudMaxima="4"/>
                            <cmz:campoTexto id="codSerie" valor="${paramBuscarPedidosVentas.codSerie}" anchura="40px" longitudMaxima="5"/>
                            <cmz:campoTexto id="numPedido" valor="${paramBuscarPedidosVentas.numPedido}" anchura="140px" longitudMaxima="10"/>
                          </td>
                        </tr>
                        
                        <tr>
                          <td>Concepto Almacén:</td>
                          <td>
                            <cmz:ayuda nombreAyuda="CONCEPTOS_ALMACENES_VENT">
                              <cmz:codigoAyuda idCodigo="codConceptoAlmacen" longitudMaximaCodigo="4" valorCodigo="${paramBuscarPedidosVentas.codConceptoAlmacen}" anchuraCodigo="30px"></cmz:codigoAyuda>
                              <cmz:descripcionAyuda idDescripcion="desConceptoAlmacen" anchuraDescripcion="200px" valorDescripcion="${paramBuscarPedidosVentas.desConceptoAlmacen}"></cmz:descripcionAyuda>
                            </cmz:ayuda>
                          </td>
                        </tr>
                        
                        <tr>
                          <td>Almacén:</td>
                          <td>
                            <cmz:ayuda nombreAyuda="ALMACENES">
                              <cmz:codigoAyuda idCodigo="codAlmacen" longitudMaximaCodigo="4" valorCodigo="${paramBuscarPedidosVentas.codAlmacen}" anchuraCodigo="30px"></cmz:codigoAyuda>
                              <cmz:descripcionAyuda idDescripcion="desAlmacen" anchuraDescripcion="250px" valorDescripcion="${paramBuscarPedidosVentas.desAlmacen}"></cmz:descripcionAyuda>
                            </cmz:ayuda>
                          </td>
                        </tr>
                        
                        <tr>
                          <td style="vertical-align:top">Cliente:</td>
                          <td>
                            <cmz:ayuda nombreAyuda="CLIENTES">
                              <cmz:codigoAyuda idCodigo="codCliente" longitudMaximaCodigo="11" valorCodigo="${paramBuscarPedidosVentas.codCliente}" anchuraCodigo="90px"></cmz:codigoAyuda>
                              <cmz:descripcionAyuda idDescripcion="desCliente" anchuraDescripcion="300px" valorDescripcion="${paramBuscarPedidosVentas.desCliente}"></cmz:descripcionAyuda>
                            </cmz:ayuda>
                          </td>
                        </tr>
                        
			            <tr>
                          <td colspan="3">
                          	<table border="0" align="left" cellpadding="0" cellspacing="0">
                              <tr>
                                <td>Fecha desde:</td>
                                <td>
                                  <cmz:campoFecha id="fechaDesde" longitudMaxima="10" anchura="100px" requerido="false" editable="true" mostrarCheckbox="true" marcarCheckbox="${paramBuscarPedidosVentas.buscarPorFechaDesde}">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarPedidosVentas.fechaDesde}"/>
                                  </cmz:campoFecha>
                                </td>
                                <td width="20px"></td>
                                <td>Fechas hasta:</td>
                                <td>
                                  <cmz:campoFecha id="fechaHasta" longitudMaxima="10" anchura="100px" requerido="false" editable="true" mostrarCheckbox="true" marcarCheckbox="${paramBuscarPedidosVentas.buscarPorFechaHasta}">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarPedidosVentas.fechaHasta}"/>
                                  </cmz:campoFecha>
                                </td>
                              </tr>
                          	</table>
                          </td>
			            </tr>
                      </table>
                    </td>
                    
                    <td width="24px"></td> <!-- Separador -->
                    
                    <td valign="top">
                      <cmz:cuadroEstados titulo="Estados" estados="${paramBuscarPedidosVentas.estados.listaEstados}">
                      </cmz:cuadroEstados>
                    </td>
                    
                    <td width="24px"></td> <!-- Separador -->
                    
                    <td valign="top">
                      <cmz:botonConsultar onclick="consultar();"/>
                    </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <c:choose>
              <c:when test="${paginaResultados.pagina != null}">
                <cmz:panel>
                  <cmz:cabeceraPanelResultados numPorPagina="${paginaResultados.tamañoPagina}"></cmz:cabeceraPanelResultados>
                  <cmz:cuerpoPanel>
                    <cmz:listaPaginada>
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarPedidosVentas.orden}">
                        <cmz:itemCabeceraListaPaginada nombre="&nbsp;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Estado" columna="1" ordenColumna="ESTADO" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Periodo" columna="2" ordenColumna="PERIODO" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Serie" columna="3" ordenColumna="CODSERIE"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Pedido" columna="4" ordenColumna="NUMPED" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Fecha" columna="5" ordenColumna="FECHA" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Cliente" columna="6" ordenColumna="CODCLI"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="7" ordenColumna="DESCLI"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Concepto" columna="8" ordenColumna="CODCONALM"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="9" ordenColumna="DESCONALM"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Total" columna="10" ordenColumna="TOTAL" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      
                      <cmz:contenidoListaPaginada variable="pedido" paginaResultados="${paginaResultados}">
                        <cmz:itemContenidoListaPaginada alineacion="center">
                          <input type="checkbox" id="chkIdPedido_<c:out value="${pedido.idPedido}" />" name="chkIdPedido_<c:out value="${pedido.idPedido}" />" />
                        </cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="center">
                          <img border="0" align="absmiddle" alt="<c:out value="${pedido.desEstado}" />" title="<c:out value="${pedido.desEstado}" />" src="<c:out value="${paramBuscarPedidosVentas.estados.estados[pedido.estado].icono}" />"/>
                        </cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${pedido.periodo}" alineacion="center" onclick="ver('${pedido.idPedido}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${pedido.codSerie}" onclick="ver('${pedido.idPedido}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${pedido.numPedido}" alineacion="right" onclick="ver('${pedido.idPedido}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="center">
                          <fmt:formatDate pattern="dd/MM/yyyy" value="${pedido.fecha}"/>
                        </cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${pedido.codCliente}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${pedido.desCliente}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${pedido.codConceptoAlmacen}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${pedido.desConceptoAlmacen}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="right">
                          <cmz:formateaNumero valor="${pedido.total}" numDecimales="2"></cmz:formateaNumero>
                        </cmz:itemContenidoListaPaginada>
                        <cmz:acciones alineacion="center">
                          <cmz:accion icono="comun/images/iconos/ver.gif" onclick="ver('${pedido.idPedido}');" descripcion="Ver Pedido"></cmz:accion>
                          <c:if test="${permisos.puedeEditar}">
                            <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar('${pedido.idPedido}');" descripcion="Editar Pedido"></cmz:accion>
                          </c:if>
                          <c:if test="${permisos.puedeEliminar}">
                            <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar('${pedido.idPedido}');" descripcion="Eliminar Pedido"></cmz:accion>
                          </c:if>
                        </cmz:acciones>
                      </cmz:contenidoListaPaginada>
                    </cmz:listaPaginada>
                  </cmz:cuerpoPanel>
                </cmz:panel>
              </c:when>
            </c:choose>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
