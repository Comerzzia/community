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

<jsp:useBean id="paramBuscarRemesasCobros" type="com.comerzzia.persistencia.tesoreria.remesas.cobros.ParametrosBuscarRemesasCobrosBean" scope="session" />
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
            setFoco("codBanco");
            pintaCalendario("fechaDesde", "imgFechaDesde");
            pintaCalendario("fechaHasta", "imgFechaHasta");
        }

        function checkForm() {
        	if(!esValido("codBanco", "AYUDA", false, "desBanco", "BANCOS")) {
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
        
        function convertirRemesa(idObjeto) {
        	if(confirm("¿Está seguro de que desea convertir a remesa?")) {
        		document.getElementById("accion").value = "convertirPreremesa";
        		if (idObjeto != null) {
        			document.getElementById("idObjeto").value = idObjeto;
        		}
        		document.getElementById("frmDatos").submit();
        	}
        }

        function exportarRemesa(idObjeto) {
        	if(confirm("¿Está seguro de que desea exportar la remesa?")) {
        		if (idObjeto != null) {
        			document.getElementById("idObjeto").value = idObjeto;
        		}
        		document.getElementById("frmDatos").action = "exportacionRemesasCobros";
        		document.getElementById("frmDatos").submit();
        		document.getElementById("frmDatos").action = "remesasCobros";
        	}
        }

        function imprimir(idObjeto){
            document.getElementById("accion").value = "tesoreria.cobros.infremesacobros";
            document.getElementById("operacion").value = "nuevo";
            document.getElementById("idObjeto").value = idObjeto;
			document.getElementById("frmDatos").submit();
		}
        
    </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="1">
            <c:if test="${permisos.puedeAñadir}">
              <cmz:accionNuevoRegistro onclick="alta();" descripcion="Alta de un nuevo pedido"/>
            </c:if>
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="remesasCobros" method="POST">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda de Remesas de Cobros"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td valign="top">
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Banco:</td>
                          <td>
				            <cmz:ayuda nombreAyuda="BANCOS">
				              <cmz:codigoAyuda idCodigo="codBanco" longitudMaximaCodigo="11" valorCodigo="${paramBuscarRemesasCobros.codBanco}" anchuraCodigo="90px"></cmz:codigoAyuda>
				              <cmz:descripcionAyuda idDescripcion="desBanco" anchuraDescripcion="300px" valorDescripcion="${paramBuscarRemesasCobros.desBanco}"></cmz:descripcionAyuda>
				            </cmz:ayuda>
                          </td>
                        </tr>
                        
			            <tr>
                          <td colspan="3">
                          	<table border="0" align="left" cellpadding="0" cellspacing="0">
                              <tr>
                                <td>Fecha desde:</td>
                                <td>
                                  <cmz:campoFecha id="fechaDesde" longitudMaxima="10" anchura="100px" requerido="false" editable="true" mostrarCheckbox="true" marcarCheckbox="${paramBuscarRemesasCobros.buscarPorFechaDesde}">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarRemesasCobros.fechaDesde}"/>
                                  </cmz:campoFecha>
                                </td>
                                <td width="20px"></td>
                                <td>Fecha hasta:</td>
                                <td>
                                  <cmz:campoFecha id="fechaHasta" longitudMaxima="10" anchura="100px" requerido="false" editable="true" mostrarCheckbox="true" marcarCheckbox="${paramBuscarRemesasCobros.buscarPorFechaHasta}">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarRemesasCobros.fechaHasta}"/>
                                  </cmz:campoFecha>
                                </td>
                              </tr>
                          	</table>
                          </td>
			            </tr>
                      </table>
                    </td>
                    
                    <td width="14px"></td> <!-- Separador -->
                    
                    <td valign="top">
                      <cmz:cuadroEstados titulo="Estados" estados="${paramBuscarRemesasCobros.estados.listaEstados}">
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
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarRemesasCobros.orden}">
                        <cmz:itemCabeceraListaPaginada nombre="Remesa" columna="1" ordenColumna="ID_REMESA" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Fecha" columna="2" ordenColumna="FECHA_REMESA" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Banco" columna="3" ordenColumna="CODBAN"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="4"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Estado" columna="5" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Efectos" columna="6" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Devueltos" columna="7" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Importe" columna="8" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      
                      <cmz:contenidoListaPaginada variable="remesa" paginaResultados="${paginaResultados}">
                        <cmz:itemContenidoListaPaginada valor="${remesa.idRemesa}" onclick="ver('${remesa.idRemesa}');" alineacion="right"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="center">
                          <fmt:formatDate pattern="dd/MM/yyyy" value="${remesa.fechaRemesa}"/>
                        </cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${remesa.codBanco}" alineacion="left"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${remesa.desBanco}" alineacion="left"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="center">
                          <img border="0" align="absmiddle" alt="<c:out value="${remesa.desEstado}" />" title="<c:out value="${remesa.desEstado}" />" src="<c:out value="${paramBuscarRemesasCobros.estados.estados[remesa.estado].icono}" />"/>
                        </cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${remesa.efectos}" alineacion="right"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${remesa.devueltos}" alineacion="right"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="right">
                          <cmz:formateaNumero valor="${remesa.importe}" numDecimales="2"></cmz:formateaNumero>
                        </cmz:itemContenidoListaPaginada>
                        <cmz:acciones alineacion="center">
                          <cmz:accion icono="comun/images/iconos/ver.gif" onclick="ver('${remesa.idRemesa}');" descripcion="Ver Remesa"></cmz:accion>
                          <c:if test="${permisos.puedeEliminar}">
                            <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar('${remesa.idRemesa}');" descripcion="Eliminar Remesa"></cmz:accion>
                          </c:if>
                          <c:if test="${permisos.puedeEjecutar && remesa.estado != remesa.ESTADO_PREREMESA}">
                            <cmz:accion icono="comun/images/iconos/impresora.gif" onclick="imprimir('${remesa.idRemesa}');" descripcion="Imprimir"></cmz:accion>
                          </c:if>
                          <c:if test="${permisos.puedeEjecutar && remesa.estado == remesa.ESTADO_PREREMESA}">
                            <cmz:accion icono="tesoreria/remesas/cobros/buscar/images/convertirRemesa.gif" onclick="convertirRemesa('${remesa.idRemesa}');" descripcion="Convertir en Remesa"></cmz:accion>
                          </c:if>
                          <c:if test="${permisos.puedeEjecutar && remesa.estado == remesa.ESTADO_REMESA}">
                            <cmz:accion icono="tesoreria/remesas/cobros/buscar/images/exportarRemesa.gif" onclick="exportarRemesa('${remesa.idRemesa}');" descripcion="Exportar Modelo 19"></cmz:accion>
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
