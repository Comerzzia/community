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

<jsp:useBean id="paramBuscarAlbaranesVentas" type="com.comerzzia.persistencia.ventas.albaranes.ParametrosBuscarAlbaranesVentasBean" scope="session" />
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
            if(!esValido("numAlbaran", "NUMERICO", false)) {
                return false;
            }
        	if(!esValido("codCliente", "AYUDA", false, "desCliente", "CLIENTES")) {
    			return false;
    		}
        	if(!esValido("codConceptoAlmacen", "AYUDA", false, "desConceptoAlmacen", "CONCEPTOS_ALMACENES_VENT")) {
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

		function imprimir(){
            document.getElementById("accion").value = "ventas.albaranes.lstAlbaranesVentas";
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
          <cmz:acciones numAccionesVisibles="2">
            <c:if test="${permisos.puedeAñadir}">
              <cmz:accionNuevoRegistro onclick="alta();" descripcion="Alta de un nuevo albarán"/>
            </c:if>
            <cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir listado albaranes" onclick="imprimir()" />
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="albaranesVentas" method="POST">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda de Albaranes"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td>
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Albarán:</td>
                          <td>
                          	  <cmz:campoTexto id="periodo" valor="${paramBuscarAlbaranesVentas.periodo}" anchura="40px" longitudMaxima="4"/>
                          	  <cmz:campoTexto id="codSerie" valor="${paramBuscarAlbaranesVentas.codSerie}" anchura="40px" longitudMaxima="5"/>
                          	  <cmz:campoTexto id="numAlbaran" valor="${paramBuscarAlbaranesVentas.numAlbaran}" anchura="140px" longitudMaxima="10"/>
                          </td>
			              <td>
			          		<cmz:botonConsultar onclick="consultar();"/>
			        	  </td>
                        </tr>
                        
                        <tr>
                          <td>Cliente:</td>
                          <td>
					          <cmz:ayuda nombreAyuda="CLIENTES">
					            <cmz:codigoAyuda idCodigo="codCliente" longitudMaximaCodigo="11" valorCodigo="${paramBuscarAlbaranesVentas.codCliente}" anchuraCodigo="90px"></cmz:codigoAyuda>
					            <cmz:descripcionAyuda idDescripcion="desCliente" anchuraDescripcion="300px" valorDescripcion="${paramBuscarAlbaranesVentas.desCliente}"></cmz:descripcionAyuda>
					          </cmz:ayuda>
                          </td>
                        </tr>
                        
						<tr>
                          <td>Concepto Almacén:</td>
                          <td>
					          <cmz:ayuda nombreAyuda="CONCEPTOS_ALMACENES_VENT">
					            <cmz:codigoAyuda idCodigo="codConceptoAlmacen" longitudMaximaCodigo="4" valorCodigo="${paramBuscarAlbaranesVentas.codConceptoAlmacen}" anchuraCodigo="40px"></cmz:codigoAyuda>
					            <cmz:descripcionAyuda idDescripcion="desConceptoAlmacen" anchuraDescripcion="250px" valorDescripcion="${paramBuscarAlbaranesVentas.desConceptoAlmacen}"></cmz:descripcionAyuda>
					          </cmz:ayuda>
                          </td>
						</tr>

			            <tr>
			            	<td colspan="3">
			            		<table border="0" align="left" cellpadding="0" cellspacing="0">
						            <tr>
						              <td>Fecha desde:</td>
						              <td>
						                <cmz:campoFecha id="fechaDesde" longitudMaxima="10" anchura="100px" requerido="false" editable="true" mostrarCheckbox="true" marcarCheckbox="${paramBuscarAlbaranesVentas.buscarPorFechaDesde}">
											<fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarAlbaranesVentas.fechaDesde}"/>
						                </cmz:campoFecha>
						              </td>
						              <td width="20px"></td>
						              <td>Fechas hasta:</td>
						              <td>
						                <cmz:campoFecha id="fechaHasta" longitudMaxima="10" anchura="100px" requerido="false" editable="true" mostrarCheckbox="true" marcarCheckbox="${paramBuscarAlbaranesVentas.buscarPorFechaHasta}">
											<fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarAlbaranesVentas.fechaHasta}"/>
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
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarAlbaranesVentas.orden}">
                        <cmz:itemCabeceraListaPaginada nombre="Periodo" columna="1" ordenColumna="PERIODO" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Serie" columna="2" ordenColumna="CODSERIE"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Albarán" columna="3" ordenColumna="NUMALB" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Fecha" columna="4" ordenColumna="FECHA" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Fecha Suministro" columna="5" ordenColumna="FECHA_SUMINISTRO" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Cliente" columna="6" ordenColumna="DESCLI"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Concepto Almacén" columna="7" ordenColumna="DESCONALM"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Persona Contacto" columna="8" ordenColumna="PERSONA_CONTACTO"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Total" columna="9" ordenColumna="TOTAL" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      
                      <cmz:contenidoListaPaginada variable="albaran" paginaResultados="${paginaResultados}">
                        <cmz:itemContenidoListaPaginada valor="${albaran.periodo}" alineacion="center" onclick="ver('${albaran.idAlbaran}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${albaran.codSerie}" onclick="ver('${albaran.idAlbaran}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${albaran.numAlbaran}" alineacion="right" onclick="ver('${albaran.idAlbaran}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="center">
                          <fmt:formatDate pattern="dd/MM/yyyy" value="${albaran.fecha}"/>
                        </cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="center">
						  <fmt:formatDate pattern="dd/MM/yyyy" value="${albaran.fechaSuministro}"/>
                        </cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${albaran.desCliente}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${albaran.desConceptoAlmacen}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${albaran.personaContacto}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="right">
                          <cmz:formateaNumero numDecimales="2" valor="${albaran.total}"/>	
                        </cmz:itemContenidoListaPaginada>
                        <cmz:acciones alineacion="center">
                          <cmz:accion icono="comun/images/iconos/ver.gif" onclick="ver('${albaran.idAlbaran}');" descripcion="Ver Albarán"></cmz:accion>
                          <c:if test="${permisos.puedeEditar}">
                            <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar('${albaran.idAlbaran}');" descripcion="Editar Albarán"></cmz:accion>
                          </c:if>
                          <c:if test="${permisos.puedeEliminar}">
                            <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar('${albaran.idAlbaran}');" descripcion="Eliminar Albarán"></cmz:accion>
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
