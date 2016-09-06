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

<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />
<jsp:useBean id="trabajoInforme" type="com.comerzzia.persistencia.core.informes.TrabajoInformeBean" scope="session" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    
    <script type="text/javascript">
	    function inicio() {
	        document.getElementById("codConceptoAlmacenDesde").focus();
            pintaCalendario("fechaDesde", "imgFechaDesde");
            pintaCalendario("fechaHasta", "imgFechaHasta");
	    }
	    function volver() {
	    	document.getElementById("accion").value = "buscar";
	        document.getElementById("frmDatos").submit();
	    	_esperando();
	    }
	
	    function checkForm() {
		    /* Validar tb los campos ayuda */
	    	if(!esValido("codConceptoAlmacenDesde", "AYUDA", false, "desConceptoAlmacenDesde", "CONCEPTOS_ALMACENES_VENT")) {
				return false;
			}
	    	if(!esValido("codConceptoAlmacenHasta", "AYUDA", false, "desConceptoAlmacenHasta", "CONCEPTOS_ALMACENES_VENT")) {
				return false;
			}
	    	if(!esValido("codAlmacenDesde", "AYUDA", false, "desConceptoAlmacenDesde", "ALMACENES")) {
				return false;
			}
	    	if(!esValido("codAlmacenHasta", "AYUDA", false, "desConceptoAlmacenHasta", "ALMACENES")) {
				return false;
			}
	    	if(!esValido("codClienteDesde", "AYUDA", false, "desClienteDesde", "CLIENTES")) {
				return false;
			}
	    	if(!esValido("codClienteHasta", "AYUDA", false, "desClienteHasta", "CLIENTES")) {
				return false;
			}
	    	if(!esValido("codArticuloDesde", "AYUDA", false, "desArticuloDesde", "ARTICULOS")) {
				return false;
			}
	    	if(!esValido("codArticuloHasta", "AYUDA", false, "desArticuloHasta", "ARTICULOS")) {
				return false;
			}
	    	if(!esValido("codFamiliaDesde", "AYUDA", false, "desFamiliaDesde", "FAMILIAS")) {
				return false;
			}
	    	if(!esValido("codFamiliaHasta", "AYUDA", false, "desFamiliaHasta", "FAMILIAS")) {
				return false;
			}
	        if (!esValido("fechaDesde", "FECHA", true)) {
	            return false;
	        }
	        if (!esValido("fechaHasta", "FECHA", true)) {
	            return false;
	        }
			return true;
	    }
	
	    function imprimir(idVersion) {
	    	if(checkForm()) {
	            document.getElementById("accion").value = "ventas.pedidos.lstPedidosVentas";
	            document.getElementById("operacion").value = "imprimir";
		    	document.getElementById("idVersion").value = idVersion;
	    		document.getElementById("frmDatos").target = "_blank";
	    		document.getElementById("frmDatos").submit();
	    		document.getElementById("frmDatos").target = "_self";
	    	}
	    }
    </script>
  </head>

  <body onload="inicio();" >
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="1">
              <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="pedidosVentas" method="POST" target="_self">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="idVersion" name="idVersion" type="hidden" value="0" />
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Parámetros"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
	            <table cellpadding="2px" cellspacing="2px" border="0px">
	              <tr>
	                <td>Concepto Almacén desde:</td>
	                <td>
			          <cmz:ayuda nombreAyuda="CONCEPTOS_ALMACENES_VENT">
			            <cmz:codigoAyuda idCodigo="codConceptoAlmacenDesde" longitudMaximaCodigo="4" anchuraCodigo="40px"/>
			            <cmz:descripcionAyuda idDescripcion="desConceptoAlmacenDesde" anchuraDescripcion="250px"/>
			          </cmz:ayuda>
	                </td>
				  </tr>
	              <tr>
	                <td>Concepto Almacén hasta:</td>
	                <td>
			          <cmz:ayuda nombreAyuda="CONCEPTOS_ALMACENES_VENT">
			            <cmz:codigoAyuda idCodigo="codConceptoAlmacenHasta" longitudMaximaCodigo="4" anchuraCodigo="40px"/>
			            <cmz:descripcionAyuda idDescripcion="desConceptoAlmacenHasta" anchuraDescripcion="250px"/>
			          </cmz:ayuda>
	                </td>
				  </tr>
	              <tr>
	                <td>Almacén desde:</td>
	                <td>
                      <cmz:ayuda nombreAyuda="ALMACENES">
                        <cmz:codigoAyuda idCodigo="codAlmacenDesde" longitudMaximaCodigo="4" anchuraCodigo="40px"/>
                        <cmz:descripcionAyuda idDescripcion="desAlmacenDesde" anchuraDescripcion="300px"/>
                      </cmz:ayuda>
	                </td>
				  </tr>
	              <tr>
	                <td>Almacén hasta:</td>
	                <td>
                      <cmz:ayuda nombreAyuda="ALMACENES">
                        <cmz:codigoAyuda idCodigo="codAlmacenHasta" longitudMaximaCodigo="4" anchuraCodigo="40px"/>
                        <cmz:descripcionAyuda idDescripcion="desAlmacenHasta" anchuraDescripcion="300px"/>
                      </cmz:ayuda>
	                </td>
				  </tr>
	              <tr>
	                <td>Cliente desde:</td>
	                <td>
			          <cmz:ayuda nombreAyuda="CLIENTES">
			            <cmz:codigoAyuda idCodigo="codClienteDesde" longitudMaximaCodigo="11" anchuraCodigo="90px"/>
			            <cmz:descripcionAyuda idDescripcion="desClienteDesde" anchuraDescripcion="300px"/>
			          </cmz:ayuda>
	                </td>
				  </tr>	                
	              <tr>
	                <td>Cliente hasta:</td>
	                <td>
			          <cmz:ayuda nombreAyuda="CLIENTES">
			            <cmz:codigoAyuda idCodigo="codClienteHasta" longitudMaximaCodigo="11" anchuraCodigo="90px"/>
			            <cmz:descripcionAyuda idDescripcion="desClienteHasta" anchuraDescripcion="300px"/>
			          </cmz:ayuda>
	                </td>
				  </tr>
	              <tr>
	                <td>Artículo desde:</td>
	                <td>
			          <cmz:ayuda nombreAyuda="ARTICULOS">
			            <cmz:codigoAyuda idCodigo="codArticuloDesde" longitudMaximaCodigo="13" anchuraCodigo="100px"/>
			            <cmz:descripcionAyuda idDescripcion="desArticuloDesde" anchuraDescripcion="300px"/>
			          </cmz:ayuda>
	                </td>
				  </tr>	                
	              <tr>
	                <td>Artículo hasta:</td>
	                <td>
			          <cmz:ayuda nombreAyuda="ARTICULOS">
			            <cmz:codigoAyuda idCodigo="codArticuloHasta" longitudMaximaCodigo="13" anchuraCodigo="100px"/>
			            <cmz:descripcionAyuda idDescripcion="desArticuloHasta" anchuraDescripcion="300px"/>
			          </cmz:ayuda>
	                </td>
				  </tr>
	              <tr>
	                <td>Familia desde:</td>
	                <td>
			          <cmz:ayuda nombreAyuda="FAMILIAS">
			            <cmz:codigoAyuda idCodigo="codFamiliaDesde" longitudMaximaCodigo="6" anchuraCodigo="50px"/>
			            <cmz:descripcionAyuda idDescripcion="desFamiliaDesde" anchuraDescripcion="250px"/>
			          </cmz:ayuda>
	                </td>
				  </tr>	                
	              <tr>
	                <td>Familia hasta:</td>
	                <td>
			          <cmz:ayuda nombreAyuda="FAMILIAS">
			            <cmz:codigoAyuda idCodigo="codFamiliaHasta" longitudMaximaCodigo="6" anchuraCodigo="50px"/>
			            <cmz:descripcionAyuda idDescripcion="desFamiliaHasta" anchuraDescripcion="250px"/>
			          </cmz:ayuda>
	                </td>
				  </tr>
	              <tr>
	                <td>Fecha desde:</td>
	              	<td colspan="4">
	              		<table border="0" cellpadding="0" cellspacing="0">
						  <tr>
			                <td>
			                  <cmz:campoFecha id="fechaDesde" longitudMaxima="10" anchura="100px" requerido="true" clase="campo requerido">
                                <fmt:formatDate pattern="dd/MM/yyyy" value="${requestScope.fechaDesde}" />
                              </cmz:campoFecha>
			                </td>
			                <td width="20px"></td>
			                <td>Fecha hasta:</td>
			                <td>
			                  <cmz:campoFecha id="fechaHasta" longitudMaxima="10" anchura="100px" requerido="true" clase="campo requerido">
                                <fmt:formatDate pattern="dd/MM/yyyy" value="${requestScope.fechaHasta}" />
                              </cmz:campoFecha>
			                </td>
						  </tr>	
	              		</table>
	              	</td>
				  </tr>
	            </table>  
              </cmz:cuerpoPanel>
            </cmz:panel>
            <c:import url="/core/informes/jsp/versiones.jsp"></c:import>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
