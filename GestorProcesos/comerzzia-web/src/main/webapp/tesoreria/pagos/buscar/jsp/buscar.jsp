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

<jsp:useBean id="paramBuscarDocumentosPagos" type="com.comerzzia.persistencia.tesoreria.pagos.ParametrosBuscarDocumentosPagosBean" scope="session" />
<jsp:useBean id="paginaResultados" class="com.comerzzia.util.paginacion.PaginaResultados" scope="request" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />
<jsp:useBean id="totales" class="com.comerzzia.persistencia.tesoreria.pagos.totales.TotalesDocumentosPagosBean" scope="request" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ventana.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    
    <script type="text/javascript">
        function inicio() {
          setFoco("codProveedor");
          pintaCalendario("fechaVencimientoDesde", "imgFechaVencimientoDesde");
          pintaCalendario("fechaVencimientoHasta", "imgFechaVencimientoHasta");
        }
        
        function imprimir(){
            document.getElementById("accion").value = "tesoreria.pagos.lstPagos";
            document.getElementById("operacion").value = "nuevo";
			document.getElementById("frmDatos").submit();
			_esperando();
		}

        function agrupar(){
        	document.getElementById("accion").value = "agruparVencimientos";
			document.getElementById("frmDatos").submit();
			_esperando();
        }
        function pagar(){
        	document.getElementById("accion").value = "pagarVencimientos";
			document.getElementById("frmDatos").submit();
			_esperando();
        }
        function pagarDocumento(idDocumento){
        	document.getElementById("idObjeto").value = idDocumento;
            pagar();
        }

        function checkForm() {
        	if(!esValido("codProveedor", "AYUDA", false, "desProveedor", "PROVEEDORES")) {
    			return false;
    		}
        	if(!esValido("fechaVencimientoDesde", "FECHA", false)) {
                return false;
            }
        	if(!esValido("fechaVencimientoHasta", "FECHA", false)) {
                return false;
            }
        	if(!esValido("codTipoEfectoDesde", "AYUDA", false, "desTipoEfectoDesde", "TIPOSEFECTOS")) {
    			return false;
    		}
        	if(!esValido("codTipoEfectoHasta", "AYUDA", false, "desTipoEfectoHasta", "TIPOSEFECTOS")) {
    			return false;
    		}
        	if(!esValido("codSerieDesde", "AYUDA", false, "desSerieDesde", "SERIES")) {
    			return false;
    		}
        	if(!esValido("codSerieHasta", "AYUDA", false, "desSerieHasta", "SERIES")) {
    			return false;
    		}
        	
            
            return true;
        }
    </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="3">
            <c:if test="${permisos.puedeAñadir}">
              <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir un nuevo Documento"/>
            </c:if>
            <c:if test="${!(paramBuscarDocumentosPagos.codProveedor == '') && !paramBuscarDocumentosPagos.verRemesados}">
              <cmz:accion icono="comun/images/iconos/agrupar.gif" onclick="agrupar();" titulo="Agrupar" descripcion="Agrupar"></cmz:accion>
            </c:if>
            <c:if test="${!paramBuscarDocumentosPagos.verRemesados}">
              <cmz:accion icono="tesoreria/images/dineroSeleccionado.gif" onclick="pagar();" titulo="Pagar Seleccionados" descripcion="Pagar seleccionados"></cmz:accion>
            </c:if>
            <cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir listado clientes" onclick="imprimir()" />
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="pagos" method="POST">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td>
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Proveedor:</td>
                          <td>
                            <cmz:ayuda nombreAyuda="PROVEEDORES">
                              <cmz:codigoAyuda idCodigo="codProveedor" valorCodigo="${paramBuscarDocumentosPagos.codProveedor}"  longitudMaximaCodigo="11" anchuraCodigo="100px"  />
                              <cmz:descripcionAyuda idDescripcion="desProveedor" valorDescripcion="${paramBuscarDocumentosPagos.desProveedor}" anchuraDescripcion="300px"  />
                            </cmz:ayuda>
                           </td>

                          <td>
                           <cmz:botonConsultar onclick="consultar();"/>
                          </td>
                        </tr>
                        
                        <tr>
                          <td>Fecha Vencimiento desde:</td>
                          <td>
                            <c:set var="fechaVencimientoDesde"><fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarDocumentosPagos.fechaVencimientoDesde}"/></c:set>
                            <cmz:campoFecha id="fechaVencimientoDesde" valor="${fechaVencimientoDesde}" mostrarCheckbox="false" />
                          </td>
                        </tr> 
                                        
                        <tr>
                          <td>Fecha Vencimiento hasta:</td>
                          <td>
                            <c:set var="fechaVencimientoHasta"><fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarDocumentosPagos.fechaVencimientoHasta}"/></c:set>
                            <cmz:campoFecha id="fechaVencimientoHasta" valor="${fechaVencimientoHasta}" mostrarCheckbox="false" />
                          </td>
                        </tr>
                        
                        <tr>
                          <td>Tipo Efecto desde:</td>
                          <td>
                            <cmz:ayuda nombreAyuda="TIPOSEFECTOS">
                              <cmz:codigoAyuda idCodigo="codTipoEfectoDesde" valorCodigo="${paramBuscarDocumentosPagos.codTipoEfectoDesde}" longitudMaximaCodigo="2" anchuraCodigo="30px"  />
                              <cmz:descripcionAyuda idDescripcion="desTipoEfectoDesde" valorDescripcion="${paramBuscarDocumentosPagos.desTipoEfectoDesde}" anchuraDescripcion="300px"  />
                            </cmz:ayuda>
                          </td>
                        </tr>                 
                        <tr>
                          <td>Tipo Efecto hasta:</td>
                          <td>
                            <cmz:ayuda nombreAyuda="TIPOSEFECTOS">
                              <cmz:codigoAyuda idCodigo="codTipoEfectoHasta" valorCodigo="${paramBuscarDocumentosPagos.codTipoEfectoHasta}" longitudMaximaCodigo="2" anchuraCodigo="30px"  />
                              <cmz:descripcionAyuda idDescripcion="desTipoEfectoHasta" valorDescripcion="${paramBuscarDocumentosPagos.desTipoEfectoHasta}" anchuraDescripcion="300px"  />
                            </cmz:ayuda>
                          </td>
                        </tr>
                        <tr>
			                <td>Serie desde:</td>
			                <td>
			                	<cmz:ayuda nombreAyuda="SERIES">
			                		<cmz:codigoAyuda idCodigo="codSerieDesde" valorCodigo="${paramBuscarDocumentosPagos.codSerieDesde}" longitudMaximaCodigo="5" anchuraCodigo="70px"  />
			                		<cmz:descripcionAyuda idDescripcion="desSerieDesde" valorDescripcion="${paramBuscarDocumentosPagos.desSerieDesde}" anchuraDescripcion="200px"  />
			                	</cmz:ayuda>
			                </td>
						  </tr>	                
			              <tr>
			                <td>Serie hasta:</td>
			                <td>
			                	<cmz:ayuda nombreAyuda="SERIES">
			                		<cmz:codigoAyuda idCodigo="codSerieHasta" valorCodigo="${paramBuscarDocumentosPagos.codSerieHasta}" longitudMaximaCodigo="5" anchuraCodigo="70px" />
			                		<cmz:descripcionAyuda idDescripcion="desSerieHasta" valorDescripcion="${paramBuscarDocumentosPagos.desSerieHasta}" anchuraDescripcion="200px" />
			                	</cmz:ayuda>
			                </td>
						</tr>
                        <tr>
                          <td></td>
                          <td colspan="2">
                            <input type="checkbox" id="verRemesados" name="verRemesados" value="" <c:if test="${paramBuscarDocumentosPagos.verRemesados}">checked="checked"</c:if>/>Ver remesados
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
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarDocumentosPagos.orden}">
                        <cmz:itemCabeceraListaPaginada nombre="Marca" columna="1" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Vencimiento" columna="2" ordenColumna="FECHA_VENCIMIENTO" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <c:if test="${paramBuscarDocumentosPagos.codProveedor == ''}">
                          <cmz:itemCabeceraListaPaginada nombre="Proveedor" columna="12" ordenColumna="CODPRO"></cmz:itemCabeceraListaPaginada>
                          <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="13" ordenColumna="DESPRO"></cmz:itemCabeceraListaPaginada>                          
                        </c:if>
                        <cmz:itemCabeceraListaPaginada nombre="Importe" columna="3" ordenColumna="IMPORTE" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Serie" columna="4" ordenColumna="SERIE"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Documento" columna="5" ordenColumna="DOCUMENTO"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Fecha" columna="6" ordenColumna="FECHA_AVISO" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Tipo Efecto" columna="7" ordenColumna="CODTIPOEFEC"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Desc. Tipo Efecto" columna="8" ordenColumna="DESTIPOEFEC"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Emisión" columna="9" ordenColumna="FECHA_EMISION" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Remesa" columna="10" ordenColumna="ID_REMESA" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Observaciones" columna="11" ordenColumna="OBSERVACIONES"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
                      </cmz:cabeceraListaPaginada>
                      
                      <cmz:contenidoListaPaginada variable="documento" paginaResultados="${paginaResultados}">
                        <cmz:itemContenidoListaPaginada alineacion="center">
                          <input type="checkbox" id="chk" name="chk" value="${documento.idPago}"/>
                        </cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada onclick="ver(${documento.idPago})" alineacion="center"><fmt:formatDate value="${documento.fechaVencimiento}" pattern="dd/MM/yyyy"/></cmz:itemContenidoListaPaginada>
                        <c:if test="${paramBuscarDocumentosPagos.codProveedor == ''}">
                          <cmz:itemContenidoListaPaginada valor="${documento.codProveedor}"></cmz:itemContenidoListaPaginada>
                          <cmz:itemContenidoListaPaginada valor="${documento.desProveedor}"></cmz:itemContenidoListaPaginada>                          
                        </c:if>
                        <cmz:itemContenidoListaPaginada alineacion="right"><cmz:formateaNumero valor="${documento.importe}" numDecimales="2"/></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${documento.codSerie}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${documento.documento}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="center"><fmt:formatDate value="${documento.fechaFactura}" pattern="dd/MM/yyyy"/></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${documento.codTipoEfecto}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${documento.desTipoEfecto}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="center"><fmt:formatDate value="${documento.fechaEmision}" pattern="dd/MM/yyyy"/></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${documento.idRemesa}" alineacion="right"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${documento.observaciones}"></cmz:itemContenidoListaPaginada>
                        <cmz:acciones alineacion="center">
                          <cmz:accion onclick="ver(${documento.idPago})" icono="comun/images/iconos/ver.gif" descripcion="Ver documento"></cmz:accion>
                          <cmz:accion onclick="editar(${documento.idPago})" icono="comun/images/iconos/editar.gif" descripcion="Editar documento"></cmz:accion>
                          <cmz:accion onclick="eliminar(${documento.idPago})" icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar documento"></cmz:accion>
                          <cmz:accion onclick="pagarDocumento(${documento.idPago})" icono="comun/images/iconos/dinero.gif" descripcion="Pagar documento"></cmz:accion>
                        </cmz:acciones>
                      </cmz:contenidoListaPaginada>
                    </cmz:listaPaginada>
                  </cmz:cuerpoPanel>
                </cmz:panel>
                
                <cmz:panel>
                  <cmz:cabeceraPanel titulo="Totales"></cmz:cabeceraPanel>
                  <cmz:cuerpoPanel>
                    <table cellpadding="0px" cellspacing="0px" border="0px">
                      <tr>
                        <td width="52">Registros:</td>
                        <td>
                          <cmz:campoTexto id="registros" valor="${totales.numRegistros}" editable="false" soloLectura="true" anchura="40"/>
                        </td>
                        <td width="30"></td>
                        <td width="40">Proveedores:</td>
                        <td>
                          <cmz:campoTexto id="proveedores" valor="${totales.numProveedores}" editable="false" soloLectura="true" anchura="40"/>
                        </td>
                        <td width="30"></td>
                        <td width="44">Importe:</td>
                        <td>
                          <cmz:campoTexto id="importe" editable="false" soloLectura="true" anchura="70">
                            <cmz:formateaNumero valor="${totales.importeTotal}" numDecimales="2"></cmz:formateaNumero>
                          </cmz:campoTexto>
                        </td>
                      </tr>
                    </table>
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
