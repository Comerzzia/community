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

<jsp:useBean id="formularioRegularizacion" type="com.comerzzia.web.almacenes.regularizaciones.ui.FormularioRegularizacionBean" scope="session" />
<jsp:useBean id="paramBuscarRegularizaciones" type="com.comerzzia.persistencia.almacenes.regularizaciones.ParametrosBuscarRegularizacionesBean" scope="session" />
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
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    
    <script type="text/javascript">
        function inicio() {
        	setFoco("codArticulo");
            pintaCalendario("fecha", "imgFecha");
        }

		function imprimir(){
            document.getElementById("accion").value = "almacenes.lstRegularizacionAlmacen";
            document.getElementById("operacion").value = "nuevo";
			document.getElementById("frmDatos").submit();
			_esperando();
		}
        
        function checkForm() {
        	if(!esValido("codArticulo", "TEXTO", false))
            	return false;
        	if(!esValido("codAlmacen", "TEXTO", true))
            	return false;
        	if(!esValido("codConceptoAlmacen", "TEXTO", true))
            	return false;
        	if(!esValido("fecha", "FECHA", true))
            	return false;

            return true;
        }

    </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <c:if test="${permisos.puedeAñadir}">
              <cmz:accionNuevoRegistro onclick="alta();" descripcion="Alta de una Regularización"/>	
            </c:if>
             <cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir listado de regularizaciones" onclick="imprimir()" />
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="regularizaciones" method="POST">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda de Regularizaciones"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td>
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Artículo:</td>
                          <td>
                          <cmz:ayuda requerido="false" soloLectura="false" nombreAyuda="ARTICULOS">
          					<cmz:codigoAyuda idCodigo="codArticulo" valorCodigo="${paramBuscarRegularizaciones.codArticulo}" anchuraCodigo="90px" longitudMaximaCodigo="13"></cmz:codigoAyuda>
          					<cmz:descripcionAyuda idDescripcion="desArticulo" valorDescripcion="${paramBuscarRegularizaciones.desArticulo}" anchuraDescripcion="300px"></cmz:descripcionAyuda>
          				  </cmz:ayuda>
                          </td>
                          
                          <td>
                      		<cmz:botonConsultar onclick="consultar();"/>
                    	  </td>
                        </tr>
                        
                        <tr>
                          <td>Almacén:</td>
                          <td>
                            <cmz:ayuda requerido="true" soloLectura="false" nombreAyuda="ALMACENES">
          					  <cmz:codigoAyuda idCodigo="codAlmacen" valorCodigo="${paramBuscarRegularizaciones.codAlmacen}" anchuraCodigo="40px" longitudMaximaCodigo="4"></cmz:codigoAyuda>
          					  <cmz:descripcionAyuda idDescripcion="desAlmacen" valorDescripcion="${paramBuscarRegularizaciones.desAlmacen}" anchuraDescripcion="300px"></cmz:descripcionAyuda>
          				    </cmz:ayuda>
                          </td>
                        </tr>
                        <tr>
                          <td>Concepto:</td>
                          <td>
                          	<cmz:ayuda requerido="true" soloLectura="false" nombreAyuda="CONCEPTOS_ALMACENES_REGU">
          					  <cmz:codigoAyuda idCodigo="codConceptoAlmacen" valorCodigo="${paramBuscarRegularizaciones.codConceptoAlmacen}" anchuraCodigo="40px" longitudMaximaCodigo="4"></cmz:codigoAyuda>
          					  <cmz:descripcionAyuda idDescripcion="desConceptoAlmacen" valorDescripcion="${paramBuscarRegularizaciones.desConceptoAlmacen}" anchuraDescripcion="300px"></cmz:descripcionAyuda>
          				  	</cmz:ayuda>
                          </td>
                        </tr>
                        <tr>
                          <td>Fecha:</td>
                          <td>
						    <c:set var="fecha"><fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarRegularizaciones.fecha}"/></c:set>
                            <cmz:campoFecha id="fecha" valor="${fecha}" mostrarCheckbox="false" />
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
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarRegularizaciones.orden}">
                        <cmz:itemCabeceraListaPaginada nombre="Artículo" columna="1" ordenColumna="CODART"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Descripción" columna="2" ordenColumna="DESART"></cmz:itemCabeceraListaPaginada>
                        <c:if test="${!empty formularioRegularizacion.tituloDesglose1}">
          					<cmz:itemCabeceraListaPaginada nombre="${formularioRegularizacion.tituloDesglose1}" columna="3" ordenColumna="DESGLOSE1"></cmz:itemCabeceraListaPaginada>
        				</c:if>
        				<c:if test="${!empty formularioRegularizacion.tituloDesglose2}">
          					<cmz:itemCabeceraListaPaginada nombre="${formularioRegularizacion.tituloDesglose2}" columna="4" ordenColumna="DESGLOSE2"></cmz:itemCabeceraListaPaginada>
       	 				</c:if>
                        <cmz:itemCabeceraListaPaginada nombre="Cantidad" columna="5" ordenColumna="CANTIDAD_MEDIDA" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Unidad Medida" columna="6" ordenColumna="UNIDAD_MEDIDA"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Unidades" columna="7" ordenColumna="CANTIDAD" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Precio" columna="8" ordenColumna="PRECIO" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Importe" columna="9" ordenColumna="IMPORTE" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Observaciones" columna="10" ordenColumna="OBSERVACIONES"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      
                      <cmz:contenidoListaPaginada variable="regularizacion" paginaResultados="${paginaResultados}">
                      	<c:set var="fechaObjeto"><fmt:formatDate pattern="dd/MM/yyyy" value="${regularizacion.fecha}"/></c:set>
                        <cmz:itemContenidoListaPaginada valor="${regularizacion.codArticulo}" onclick="ver('${regularizacion.idRegularizacion}');"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${regularizacion.desArticulo}"></cmz:itemContenidoListaPaginada>
                        <c:if test="${!empty formularioRegularizacion.tituloDesglose1}">
          					<cmz:itemContenidoListaPaginada valor="${regularizacion.desglose1}"></cmz:itemContenidoListaPaginada>
        				</c:if>
        				<c:if test="${!empty formularioRegularizacion.tituloDesglose2}">
          					<cmz:itemContenidoListaPaginada valor="${regularizacion.desglose2}"></cmz:itemContenidoListaPaginada>
        				</c:if>
                        <cmz:itemContenidoListaPaginada alineacion="right"><cmz:formateaNumero valor="${regularizacion.cantidadMedida}" numDecimales="2" /></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${regularizacion.unidadMedida}"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="right"><cmz:formateaNumero valor="${regularizacion.cantidad}" numDecimales="2" /></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="right"><cmz:formateaNumero valor="${regularizacion.precio}" numDecimales="4" /></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="right"><cmz:formateaNumero numDecimales="2" valor="${regularizacion.importe}" /></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada valor="${regularizacion.observaciones}"></cmz:itemContenidoListaPaginada>
                        <cmz:acciones alineacion="center">
                          <cmz:accion icono="comun/images/iconos/ver.gif" onclick="ver('${regularizacion.idRegularizacion}');" descripcion="Ver Regularización"></cmz:accion>
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
