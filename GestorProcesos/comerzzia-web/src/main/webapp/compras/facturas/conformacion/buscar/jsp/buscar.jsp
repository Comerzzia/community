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

<jsp:useBean id="paramBuscarAlbaranesFacturas" type="com.comerzzia.persistencia.compras.albaranes.ParametrosBuscarAlbaranesComprasBean" scope="session" />
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
            setFoco("codProveedor");
            pintaCalendario("fechaDesde", "imgFechaDesde");
            pintaCalendario("fechaHasta", "imgFechaHasta");
        }

        function checkForm() {
        	if(!esValido("codProveedor", "AYUDA", true, "desProveedor", "PROVEEDORES"))
    	       	return false;
            if(!esValido("fechaDesde", "FECHA", true)) 
                return false;
            if(!esValido("fechaHasta", "FECHA", true))
                return false;
            if(!esValido("codSerieDesde", "AYUDA", false, "desSerieDesde", "SERIES"))
    	       	return false;
            if(!esValido("codSerieHasta", "AYUDA", false, "desSerieHasta", "SERIES"))
    	       	return false;
            
            return true;
        }

        function conformarFactura(){
            if(checkForm()){
				document.getElementById("accion").value = "conformarFactura";
				document.getElementById("frmDatos").submit();
            }
        }

        function seleccionarAlbaranes(marca) {
            var checks = document.getElementsByTagName("input");
            
            for (var i = 0; i < checks.length; i++) {
                if(checks[i].type == "checkbox") {
                   checks[i].checked = marca;
                }
            }
        }
        
        function invertirSeleccionAlbaranes() {
            var checks = document.getElementsByTagName("input");
            
            for (var i = 0; i < checks.length; i++) {
                if(checks[i].type == "checkbox") {
                    checks[i].checked = (checks[i].checked) ? 0 : 1;
                }
            }
        }
    </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="1">
            <cmz:accion titulo="Conformar Factura" icono="compras/facturas/conformacion/buscar/images/conformarFactura.gif" descripcion="Conformar factura" onclick="conformarFactura()" />
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="conformacionFacturas" method="POST">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda de Albaranes"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td>
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                      	<tr>
			                <td>Proveedor:</td>
			                <td colspan="3">
			                	<cmz:ayuda nombreAyuda="PROVEEDORES" requerido="true">
			                		<cmz:codigoAyuda idCodigo="codProveedor" valorCodigo="${paramBuscarAlbaranesFacturas.codProveedor}" longitudMaximaCodigo="11" anchuraCodigo="100px"  />
			                		<cmz:descripcionAyuda idDescripcion="desProveedor" valorDescripcion="${paramBuscarAlbaranesFacturas.desProveedor}" anchuraDescripcion="300px"  />
			                	</cmz:ayuda>
			                </td>
			                <td><cmz:botonConsultar onclick="consultar();"/></td>
						</tr>
						
						<tr>
                          <td>Desde fecha:</td>
                          <td>
                            <c:set var="fechaDesde"><fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarAlbaranesFacturas.fechaDesde}"/></c:set>
                            <cmz:campoFecha id="fechaDesde" valor="${fechaDesde}" editable="true" requerido="true" />
                          </td>
                          <td align="right">Hasta fecha:</td>
                          <td>
                            <c:set var="fechaHasta"><fmt:formatDate pattern="dd/MM/yyyy" value="${paramBuscarAlbaranesFacturas.fechaHasta}"/></c:set>
                            <cmz:campoFecha id="fechaHasta" valor="${fechaHasta}" editable="true" requerido="true" />
                          </td>
                        </tr>
							     
                        <tr>
			                <td>Desde serie:</td>
			                <td colspan="3">
			                	<cmz:ayuda nombreAyuda="SERIES">
			                		<cmz:codigoAyuda idCodigo="codSerieDesde" valorCodigo="${paramBuscarAlbaranesFacturas.codSerie}" longitudMaximaCodigo="5" anchuraCodigo="100px"  />
			                		<cmz:descripcionAyuda idDescripcion="desSerieDesde" valorDescripcion="${paramBuscarAlbaranesFacturas.desSerie}" anchuraDescripcion="300px"  />
			                	</cmz:ayuda>
			                </td>
						</tr>	                
			            <tr>
			                <td>Hasta serie:</td>
			                <td colspan="3"> 
			                	<cmz:ayuda nombreAyuda="SERIES" >
			                		<cmz:codigoAyuda idCodigo="codSerieHasta" valorCodigo="${paramBuscarAlbaranesFacturas.codSerieHasta}" longitudMaximaCodigo="5" anchuraCodigo="100px" />
			                		<cmz:descripcionAyuda idDescripcion="desSerieHasta" valorDescripcion="${paramBuscarAlbaranesFacturas.desSerieHasta}" anchuraDescripcion="300px" />
			                	</cmz:ayuda>
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
                  <cmz:cabeceraPanelResultados numPorPagina="${paginaResultados.tamañoPagina}">
                  	<cmz:acciones numAccionesVisibles="1">
				         <cmz:accion titulo="Seleccionar Todos" icono="comun/images/iconos/checkbox.png" descripcion="Seleccionar todos" onclick="seleccionarAlbaranes(1);" />
				         <cmz:accion titulo="Deseleccionar Todos" icono="comun/images/iconos/checkboxVacio.png" descripcion="Deseleccionar todos" onclick="seleccionarAlbaranes(0);" />
				         <cmz:accion titulo="Invertir Selección" icono="comun/images/iconos/invertir.png" descripcion="Invertir selección" onclick="invertirSeleccionAlbaranes();" />
			        </cmz:acciones>
                  </cmz:cabeceraPanelResultados>
                  <cmz:cuerpoPanel>
                    <cmz:lista>
                      <cmz:cabeceraLista>
                        <cmz:itemCabeceraLista nombre="Sel." columna="1"></cmz:itemCabeceraLista>
                        <cmz:itemCabeceraLista nombre="Periodo" columna="2" estilo="text-align: center;"></cmz:itemCabeceraLista>
                        <cmz:itemCabeceraLista nombre="Serie" columna="3"></cmz:itemCabeceraLista>
                        <cmz:itemCabeceraLista nombre="Albaran" columna="4" estilo="text-align: right;"></cmz:itemCabeceraLista>
                        <cmz:itemCabeceraLista nombre="Fecha" columna="5" estilo="text-align: center;"></cmz:itemCabeceraLista>
                        <cmz:itemCabeceraLista nombre="Referencia" columna="6"></cmz:itemCabeceraLista>
                        <cmz:itemCabeceraLista nombre="Base" columna="7" estilo="text-align: right;"></cmz:itemCabeceraLista>
                        <cmz:itemCabeceraLista nombre="Impuestos" columna="8" estilo="text-align: right;"></cmz:itemCabeceraLista>
                        <cmz:itemCabeceraLista nombre="Total" columna="9" estilo="text-align: right;"></cmz:itemCabeceraLista>
                      </cmz:cabeceraLista>
                      
                      <cmz:contenidoLista variable="albaran" lista="${paginaResultados.pagina}">
                        <cmz:itemContenidoLista>
                        	<input type="checkbox" id="chk" name="chk" value="${albaran.idAlbaran}"/>
                        </cmz:itemContenidoLista>
                        <cmz:itemContenidoLista valor="${albaran.periodo}" alineacion="center"></cmz:itemContenidoLista>
                        <cmz:itemContenidoLista valor="${albaran.codSerie}"></cmz:itemContenidoLista>
                        <cmz:itemContenidoLista valor="${albaran.numAlbaran}" alineacion="right"></cmz:itemContenidoLista>
                        <cmz:itemContenidoLista alineacion="center"><fmt:formatDate pattern="dd/MM/yyyy" value="${albaran.fecha}"/></cmz:itemContenidoLista>
                        <cmz:itemContenidoLista valor="${albaran.referenciaProveedor}"></cmz:itemContenidoLista>
                        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${albaran.base}"/></cmz:itemContenidoLista>
                        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${albaran.impuestos}"/></cmz:itemContenidoLista>
                        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${albaran.total}"/></cmz:itemContenidoLista>
                      </cmz:contenidoLista>
                    </cmz:lista>
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
