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
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="paramBuscarFacturasCompras" type="com.comerzzia.persistencia.compras.facturas.ParametrosBuscarFacturasComprasBean" scope="session" />
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
            if(!esValido("codSerie", "TEXTO", false)) {
                return false;
            }
            if(!esValido("numFactura", "NUMERICO", false)) {
                return false;
            }
        	if(!esValido("codProveedor", "AYUDA", false, "desProveedor", "PROVEEDORES")) {
    			return false;
    		}
        	if(document.getElementById("chkFechaDesde").checked){
                if(!esValido("fechaDesde", "FECHA", false)) {
                    return false;
                }
            }
            if(document.getElementById("chkFechaHasta").checked){
                if(!esValido("fechaHasta", "FECHA", false)) {
                    return false;
                }
            }
            
            return true;
        }
    </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">          
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="facturasCompras" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda de Facturas"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td>
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Factura:</td>
                          <td>
                            <cmz:campoTexto id="periodo" valor="${paramBuscarFacturasCompras.periodo}" anchura="40px" longitudMaxima="4"/>
                          
      						<cmz:campoTexto id="codSerie" valor="${paramBuscarFacturasCompras.codSerie}" anchura="40px" longitudMaxima="5"/>
                          
      						<cmz:campoTexto id="numFactura" valor="${paramBuscarFacturasCompras.numFactura}" anchura="90px" longitudMaxima="10"/>
                          </td>
                          <td>
	                        <cmz:botonConsultar onclick="consultar();"/>
	                      </td>
                        </tr>                    
                        <tr>
			                <td>Proveedor:</td>
			                <td>
			                	<cmz:ayuda nombreAyuda="PROVEEDORES">
			                		<cmz:codigoAyuda idCodigo="codProveedor" valorCodigo="${paramBuscarFacturasCompras.codProveedor}" longitudMaximaCodigo="11" anchuraCodigo="100px"  />
			                		<cmz:descripcionAyuda idDescripcion="desProveedor" valorDescripcion="${paramBuscarFacturasCompras.desProveedor}" anchuraDescripcion="300px"  />
			                	</cmz:ayuda>
			                </td>
						</tr>
						<tr>
                          <td>Nº Factura Proveedor:</td>
                          <td>
                            <cmz:campoTexto id="referencia" valor="${paramBuscarFacturasCompras.referencia}" anchura="200px" longitudMaxima="50" />
      					  </td>
                        </tr>   
                        <tr>
			            	<td colspan="3">
			            		<table border="0" align="left" cellpadding="0" cellspacing="0">
						            <tr>
						              <td>Fecha Desde:</td>
						              <td>
						                <cmz:campoFecha id="fechaDesde" longitudMaxima="10" anchura="100px" editable="true" mostrarCheckbox="true" marcarCheckbox="${paramBuscarFacturasCompras.buscarPorFechaDesde}">
											<fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarFacturasCompras.fechaDesde}"/>
						                </cmz:campoFecha>
						              </td>
						              <td width="20px"></td>
						              <td>Fecha Hasta:</td>
						              <td>
						                <cmz:campoFecha id="fechaHasta" longitudMaxima="10" anchura="100px" editable="true" mostrarCheckbox="true" marcarCheckbox="${paramBuscarFacturasCompras.buscarPorFechaHasta}">
											<fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarFacturasCompras.fechaHasta}"/>
						                </cmz:campoFecha>
						              </td>
						            </tr>
			            		</table>
			            	</td>
			            </tr>
                      </table>
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
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarFacturasCompras.orden}">
                        <cmz:itemCabeceraListaPaginada nombre="Periodo" columna="1" ordenColumna="PERIODO" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Serie" columna="2" ordenColumna="CODSERIE"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Factura" columna="3" ordenColumna="NUMFAC" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Fecha" columna="4" ordenColumna="FECHA" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Nº Fact. Prov." columna="5" ordenColumna="REFERENCIA" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Fecha Prov." columna="6" ordenColumna="FECHA_FACT_PROVEEDOR" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Proveedor" columna="7" ordenColumna="CODPRO"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="8" ordenColumna="DESPRO"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Base" columna="9" ordenColumna="BASE" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Impuestos" columna="10" ordenColumna="IMPUESTOS" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Total" columna="11" ordenColumna="TOTAL" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      <cmz:contenidoListaPaginada variable="factura" paginaResultados="${paginaResultados}">
                        <cmz:itemContenidoListaPaginada valor="${factura.periodo}" onclick="ver('${factura.idFacturaSop}');" alineacion="center"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${factura.codSerie}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${factura.numFactura}" alineacion="right"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="center"><fmt:formatDate pattern="dd/MM/yyyy" value="${factura.fechaRecFactura}"/></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${factura.referencia}" alineacion="right"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="center"><fmt:formatDate pattern="dd/MM/yyyy" value="${factura.fechaFacturaProveedor}"/></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${factura.codProveedor}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${factura.desProveedor}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="right"><fmt:formatNumber minFractionDigits="2" maxFractionDigits="3" value="${factura.base}"/></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="right"><fmt:formatNumber minFractionDigits="2" maxFractionDigits="3" value="${factura.impuestos}"/></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="right"><fmt:formatNumber minFractionDigits="2" maxFractionDigits="3" value="${factura.total}"/></cmz:itemContenidoListaPaginada>
                        <cmz:acciones alineacion="center">
                          <cmz:accion icono="comun/images/iconos/ver.gif" onclick="ver('${factura.idFacturaSop}');" descripcion="Ver Factura"></cmz:accion>                         
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
