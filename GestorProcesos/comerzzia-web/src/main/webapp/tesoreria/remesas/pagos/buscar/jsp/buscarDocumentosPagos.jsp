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

<jsp:useBean id="paramBuscarDocumentosPagosRemesa" type="com.comerzzia.persistencia.tesoreria.pagos.ParametrosBuscarDocumentosPagosBean" scope="session" />
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
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    
    <script type="text/javascript">
        function inicio() {
            setFoco("codProveedor");
            pintaCalendario("fechaDesde", "imgFechaDesde");
            pintaCalendario("fechaHasta", "imgFechaHasta");
        }
        
        function keyDownEnter() {
			consultar();
        }

        function consultar() {
        	if(checkForm()) {
        		document.getElementById("accion").value = "buscarDocumentos";
        		document.getElementById("operacion").value = "consultar";
        		document.getElementById("frmDatos").submit();
        		_esperando();
        	}
        }

        function paginar(pagina) {
        	if(checkForm()) {
        		document.getElementById("accion").value = "buscarDocumentos";
        		document.getElementById("operacion").value = "paginar";
        		document.getElementById("pagina").value = pagina;
        		document.getElementById("frmDatos").submit();
        		_esperando();
        	}
        }

        function ordenar(columna) {
        	if(checkForm()) {
        		document.getElementById("accion").value = "buscarDocumentos";
        		document.getElementById("operacion").value = "ordenar";
        		document.getElementById("columna").value = columna;
        		document.getElementById("frmDatos").submit();
        		_esperando();
        	}
        }

        function checkForm() {
        	if(!esValido("codProveedor", "AYUDA", false, "desProveedor", "PROVEEDOR")) {
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
        
        function agrupar() {
       		document.getElementById("accion").value = "agruparVencimientos";
       		document.getElementById("frmDatos").submit();
       		_esperando();
        }

        function agregarDocumentos() {
       		document.getElementById("accion").value = "agregarDocumento";
       		document.getElementById("frmDatos").submit();
       		_esperando();
        }

        function volverRemesa() {
        	document.getElementById("accion").value = "verFormulario";
    	    document.getElementById("frmDatos").submit();
    		_esperando();
        }

        function seleccionarDocumento(marca) {
            var checks = document.getElementsByTagName("input");
            
            for (var i = 0; i < checks.length; i++) {
                var regex = /chk_/;
                if(checks[i].type == "checkbox" && regex.test(checks[i].id)) {
                   checks[i].checked = marca;
                }
            }
        }
        
        function invertirSeleccionDocumentos() {
            var checks = document.getElementsByTagName("input");
            
            for (var i = 0; i < checks.length; i++) {
                var regex = /chk_/;
                if(checks[i].type == "checkbox" && regex.test(checks[i].id)) {
                    checks[i].checked = (checks[i].checked) ? 0 : 1;
                }
            }
        }
     </script>
  </head>

  <body onload="inicio();" onkeydown="keyDown(event);">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="1">
            <cmz:accion titulo="Volver a la Preremesa" icono="comun/images/iconos/volver.gif" descripcion="Volver a la Preremesa" onclick="volverRemesa()" />
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="remesasPagos" method="POST">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Agregar Documentos a Preremesa"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td valign="top">
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Proveedor:</td>
                          <td>
				            <cmz:ayuda nombreAyuda="PROVEEDORES">
				              <cmz:codigoAyuda idCodigo="codProveedor" longitudMaximaCodigo="11" valorCodigo="${paramBuscarDocumentosPagosRemesa.codProveedor}" anchuraCodigo="90px"></cmz:codigoAyuda>
				              <cmz:descripcionAyuda idDescripcion="desProveedor" anchuraDescripcion="300px" valorDescripcion="${paramBuscarDocumentosPagosRemesa.desProveedor}"></cmz:descripcionAyuda>
				            </cmz:ayuda>
                          </td>
                        </tr>

			            <tr>
                          <td colspan="3">
                          	<table border="0" align="left" cellpadding="0" cellspacing="0">
                              <tr>
                                <td>Desde vencimiento:</td>
                                <td>
                                  <cmz:campoFecha id="fechaDesde" longitudMaxima="10" anchura="100px" requerido="false" editable="true" mostrarCheckbox="true" marcarCheckbox="${paramBuscarDocumentosPagosRemesa.buscarPorFechaDesde}">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarDocumentosPagosRemesa.fechaDesde}"/>
                                  </cmz:campoFecha>
                                </td>
                                <td width="20px"></td>
                                <td>Hasta vencimiento:</td>
                                <td>
                                  <cmz:campoFecha id="fechaHasta" longitudMaxima="10" anchura="100px" requerido="false" editable="true" mostrarCheckbox="true" marcarCheckbox="${paramBuscarDocumentosPagosRemesa.buscarPorFechaHasta}">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarDocumentosPagosRemesa.fechaHasta}"/>
                                  </cmz:campoFecha>
                                </td>
                              </tr>
                          	</table>
                          </td>
			            </tr>
                      </table>
                    </td>
                    
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
                  <cmz:cabeceraPanelResultados numPorPagina="${paginaResultados.tamañoPagina}">
			  	    <cmz:acciones numAccionesVisibles="1">
					  <cmz:accion titulo="Agregar documentos" icono="tesoreria/remesas/pagos/buscar/images/agregarDocumento.gif" descripcion="Agregar documentos" onclick="agregarDocumentos();"></cmz:accion>
					  <c:if test="${paramBuscarDocumentosPagosRemesa.codProveedor != ''}">
					    <cmz:accion titulo="Agrupar" icono="comun/images/iconos/agrupar.gif" descripcion="Agrupar" onclick="agrupar();"></cmz:accion>
					  </c:if>
			          <cmz:accion titulo="Seleccionar todos" icono="comun/images/iconos/checkbox.png" descripcion="Seleccionar todos" onclick="seleccionarDocumento(1);" />
			          <cmz:accion titulo="Deseleccionar todos" icono="comun/images/iconos/checkboxVacio.png" descripcion="Deseleccionar todos" onclick="seleccionarDocumento(0);" />
			          <cmz:accion titulo="Invertir selección" icono="comun/images/iconos/invertir.png" descripcion="Invertir selección" onclick="invertirSeleccionDocumentos();" />
				    </cmz:acciones>
                  </cmz:cabeceraPanelResultados>
                  <cmz:cuerpoPanel>
                    <cmz:listaPaginada>
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarDocumentosPagosRemesa.orden}">
						<cmz:itemCabeceraListaPaginada nombre="Marca"></cmz:itemCabeceraListaPaginada>
						<cmz:itemCabeceraListaPaginada nombre="Vencimiento" columna="1" ordenColumna="FECHA_VENCIMIENTO" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
						<cmz:itemCabeceraListaPaginada nombre="Proveedor" columna="2" ordenColumna="CODPRO"></cmz:itemCabeceraListaPaginada>
						<cmz:itemCabeceraListaPaginada nombre="Descripción" columna="3" ordenColumna="DESPRO"></cmz:itemCabeceraListaPaginada>
						<cmz:itemCabeceraListaPaginada nombre="Importe" columna="4" ordenColumna="IMPORTE" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
						<cmz:itemCabeceraListaPaginada nombre="Serie" columna="5" ordenColumna="CODSERIE"></cmz:itemCabeceraListaPaginada>
						<cmz:itemCabeceraListaPaginada nombre="Documento" columna="6" ordenColumna="DOCUMENTO"></cmz:itemCabeceraListaPaginada>
						<cmz:itemCabeceraListaPaginada nombre="Fecha" columna="7" ordenColumna="FECHA_FACTURA" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
						<cmz:itemCabeceraListaPaginada nombre="Tipo Efecto" columna="8" ordenColumna="CODTIPOEFEC"></cmz:itemCabeceraListaPaginada>
						<cmz:itemCabeceraListaPaginada nombre="Desc. Tipo Efecto" columna="9" ordenColumna="DESTIPOEFEC"></cmz:itemCabeceraListaPaginada>
						<cmz:itemCabeceraListaPaginada nombre="Observaciones"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      
                      <cmz:contenidoListaPaginada variable="documento" paginaResultados="${paginaResultados}">
                        <cmz:itemContenidoListaPaginada>
                       	  <input type="checkbox" id="chk_${documento.idPago}" name="chk" value="${documento.idPago}"/>
                        </cmz:itemContenidoListaPaginada>
						<cmz:itemContenidoListaPaginada alineacion="center">
							<fmt:formatDate value="${documento.fechaVencimiento}" pattern="dd/MM/yyyy"/>
						</cmz:itemContenidoListaPaginada>
						<cmz:itemContenidoListaPaginada valor="${documento.codProveedor}"></cmz:itemContenidoListaPaginada>
						<cmz:itemContenidoListaPaginada valor="${documento.desProveedor}"></cmz:itemContenidoListaPaginada>
						<cmz:itemContenidoListaPaginada alineacion="right">
							<cmz:formateaNumero valor="${documento.importe}" numDecimales="2"/>
						</cmz:itemContenidoListaPaginada>
						<cmz:itemContenidoListaPaginada valor="${documento.codSerie}"></cmz:itemContenidoListaPaginada>
						<cmz:itemContenidoListaPaginada valor="${documento.documento}"></cmz:itemContenidoListaPaginada>
						<cmz:itemContenidoListaPaginada alineacion="center">
							<fmt:formatDate value="${documento.fechaFactura}" pattern="dd/MM/yyyy"/>
						</cmz:itemContenidoListaPaginada>
						<cmz:itemContenidoListaPaginada valor="${documento.codTipoEfecto}"></cmz:itemContenidoListaPaginada>
						<cmz:itemContenidoListaPaginada valor="${documento.desTipoEfecto}"></cmz:itemContenidoListaPaginada>
						<cmz:itemContenidoListaPaginada valor="${documento.observaciones}"></cmz:itemContenidoListaPaginada>
                      </cmz:contenidoListaPaginada>
                    </cmz:listaPaginada>
                  </cmz:cuerpoPanel>
                </cmz:panel>
	            <cmz:panel>
	              <cmz:cabeceraPanel/>
	              <cmz:cuerpoPanel>
				    <table cellpadding="2px" cellspacing="2px" border="0px">
					  <tr>
		                <td>Registros:</td>
		                <td>
		                  <cmz:campoTexto id="registros" valor="${totales.numRegistros}" editable="false" soloLectura="true" anchura="40"/>
		                </td>
	
		                <td>Importe:</td>
		                <td>
                          <cmz:campoTexto id="importe" editable="false" soloLectura="true" anchura="70">
                            <cmz:formateaNumero valor="${totales.importeTotal}" numDecimales="2"></cmz:formateaNumero>
                          </cmz:campoTexto>
		                </td>
	
		                <td>Proveedores:</td>
		                <td>
		                  <cmz:campoTexto id="proveedores" valor="${totales.numProveedores}" editable="false" soloLectura="true" anchura="40"/>
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
