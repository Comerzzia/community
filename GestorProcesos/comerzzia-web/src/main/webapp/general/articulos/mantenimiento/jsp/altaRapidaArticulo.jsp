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
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="tarifa" class="com.comerzzia.persistencia.ventas.tarifas.TarifaBean" scope="page" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Comerzzia</title>

	<link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
	
	<script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
	<script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
	<script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
	<script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
	<script type="text/javascript" language="javascript" src="ventas/tarifas/mantenimiento/js/tarifas.js"></script>
	<script type="text/javascript" language="javascript" src="general/articulos/mantenimiento/js/datosGenerales.js"></script>
	
	<script type="text/javascript">
		function inicio() {
			setFoco("codArticuloAlta", "desArticuloAlta");
		}
	
		function checkForm() {
			if (!esValido("codArticuloAlta", "TEXTO", true)) {
				return false;
			}
			if (!esValido("desArticuloAlta", "TEXTO", true)) {
				return false;
			}
			// Validaciones del resto de ayudas
			if (!esValido("codFamiliaAlta", "AYUDA", false, "desFamiliaAlta", "FAMILIAS")) {
				return false;
			}
			if (!esValido("codSeccion", "AYUDA", false, "desSeccion", "SECCIONES")) {
				return false;
			}
	    	if (!esValido("codCategorizacion", "AYUDA", false, "desCategorizacion", "CATEGORIZACIONES")) {
				return false;
			}    	
			// Validación de la ayuda de impuestos
			if (!esValido("codImpuesto", "TABLA", true, "un tipo de impuesto.")) {
				return false;
			}
			if (!esValido("codigoBarras", "ENTERO", false)) {
				return false;
			}
			if (!esValido("unidadesCaja", "NUMERICO", false)) {
				return false;
			}
			if (!esValido("cajasPale", "NUMERICO", false)) {
				return false;
			}
			if(document.getElementById("cajasPale").value.length > 0 && document.getElementById("unidadesCaja").value.length == 0){
				alert('Debes indicar las unidades por caja');
				document.getElementById("unidadesCaja").focus();
				return false;
			}    
			if (!esValido("cantidadUnidadMedidaEtiq", "ENTERO", false)) {
				return false;
			}
			if (!esValido("codProveedorAlta", "AYUDA", false, "desProveedorAlta", "PROVEEDORES")) {
				return false;
			}
	        if (!esValido("dtoProveedor", "NUMERICO", false, 2, false)) {
	            return false;
	        }
			if (!esValido("codFabricante", "AYUDA", false, "desFabricante", "FABRICANTES")) {
				return false;
			}
			// Validación de campos de ventas		
			if (!esValido("precioCosto", "NUMERICO", true, 2, false)) {
				return false;
			}
			if (!esValido("factorMarcaje", "NUMERICO", false)) {
				return false;
			}
			if (!esValido("precioMarcaje", "NUMERICO", false)) {
				return false;
			}		
			if (!esValido("precioMarcajeImpuestos", "NUMERICO", false)) {
				return false;
			}				
			if (document.getElementById("factorMarcaje").value == "" && document.getElementById("precioMarcaje").value == "") {
				alert("Debe indicar un factor o un precio de marcaje para poder calcular el precio aplicado.");
				document.getElementById("factorMarcaje").focus();
				return false;
			}
			return true;
		}

		function obtenerPorcentajeImpuestos() {
			var codImpuestos = document.getElementById("codImpuesto").value;
			if (codImpuestos == "") {
				return null;
			}
			var response = validarArticuloTarifa();
			if (response != null) {
				document.getElementById("porcentajeImpuestos").value = response.getElementsByTagName('porcentajeImpuestos').item(0).firstChild.data;
				return document.getElementById("porcentajeImpuestos").value;
			}
			return null;
		}
	
		function validarArticuloTarifa() {
			var codImpuesto = document.getElementById("codImpuesto").value;
			var codTarifa = document.getElementById("codTarifa").value;
	
			var url = "articulo.tarifa.cmz?codImpuesto=" + codImpuesto
					+ "&codTarifa=" + codTarifa;
	
			response = xmlRequest(url);
			if (response != null) {
				if (response.getElementsByTagName("ERROR").item(0)) {
					alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
					return null;
				}

				return response;
			} 
			else {
				alert("No se ha podido conectar con el servidor");
				return null;
			}
		}
		
		function aceptar() {
			if (checkForm()) {
				document.getElementById("accion").value = "salvarAltaRapida";
				document.getElementById("frmDatos").submit();
				_esperando();
			}
		}
	</script>
</head>

<body onload="inicio();">
<cmz:main>
  <cmz:panelCMZ>
    <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
      <cmz:acciones numAccionesVisibles="2">
      	<cmz:accionSalvar onclick="aceptar();" titulo="Añadir y nuevo"/>
      	<cmz:accionCancelar onclick="cancelar();" titulo="Finalizar"/>
      </cmz:acciones>
    </cmz:cabeceraPanelCMZ>

    <cmz:cuerpoPanelCMZ>
      <cmz:mensaje />
      <form id="frmDatos" name="frmDatos" action="articulos" method="post">
      	<input id="accion" name="accion" type="hidden" value="" /> 
      	<input id="operacion" name="operacion" type="hidden" value="" /> 
      	
      	<cmz:panel>
          <cmz:cabeceraPanel titulo="Datos del Artículo"></cmz:cabeceraPanel>
          <cmz:cuerpoPanel>
            <table cellpadding="2px" cellspacing="2px" border="0px">
              <tr>
                <td>Código:</td>
                <td>
                  <cmz:campoTexto id="codArticuloAlta" valor="${requestScope.codArticuloAlta}" requerido="true" anchura="90px" longitudMaxima="13"
                                  editable="true" soloLectura="false" />
                </td>

                <td>Descripción:</td>
                <td>
                  <cmz:campoTexto id="desArticuloAlta" valor="${param.desArticuloAlta}" requerido="true"
                				  anchura="350px" longitudMaxima="45" editable="true" soloLectura="false" />
                </td>

                <td>Variable:</td>
                <td>
                  <cmz:campoTexto id="variable" valor="${param.variable}" requerido="false" anchura="150px" longitudMaxima="45" editable="true"/>
                  <img src="comun/images/iconos/info.gif" align="absMiddle" border="0" valign="middle" style="vertical-align:top; cursor: pointer;" 
                  	   onclick="window.alert('Sustituye el símbolo # de la descripción del artículo por el valor del campo variable');" alt="Información Variable" title="Información Variable"/>
                </td>
              </tr>
            </table>
          </cmz:cuerpoPanel>
        </cmz:panel> 
        <cmz:panel>
          <cmz:cabeceraPanel titulo="Organización"/>
          <cmz:cuerpoPanel>
	        <table>
	          <tr>
	            <td>Formato:</td>
	            <td><cmz:campoTexto id="formato" valor="${param.formato}" editable="true"
	                                soloLectura="false" longitudMaxima="20" anchura="150"></cmz:campoTexto>
	            </td>
	          </tr>
	          <tr>
	            <td>Familia:</td>
	            <td>
	              <cmz:ayuda nombreAyuda="FAMILIAS" soloLectura="false">
	                <cmz:codigoAyuda idCodigo="codFamiliaAlta" longitudMaximaCodigo="6" valorCodigo="${param.codFamiliaAlta}" anchuraCodigo="50px"/>
	                <cmz:descripcionAyuda idDescripcion="desFamiliaAlta" anchuraDescripcion="200px" valorDescripcion="${param.desFamiliaAlta}"/>
	              </cmz:ayuda>
	            </td>
	          </tr>
	          <tr>
	            <td>Sección:</td>
	            <td>
	              <cmz:ayuda nombreAyuda="SECCIONES" soloLectura="false">
	                <cmz:codigoAyuda idCodigo="codSeccion" longitudMaximaCodigo="4" valorCodigo="${param.codSeccion}" anchuraCodigo="50px"/>
	                <cmz:descripcionAyuda idDescripcion="desSeccion" anchuraDescripcion="200px" valorDescripcion="${param.desSeccion}"/>
	              </cmz:ayuda>
	            </td>
	          </tr>
	          <tr>
	            <td>Categorización:</td>
	            <td>
	              <cmz:ayuda nombreAyuda="CATEGORIZACIONES" soloLectura="false">
	                <cmz:codigoAyuda idCodigo="codCategorizacion" longitudMaximaCodigo="20" valorCodigo="${param.codCategorizacion}" anchuraCodigo="100px"/>
	                <cmz:descripcionAyuda idDescripcion="desCategorizacion" anchuraDescripcion="200px" valorDescripcion="${param.desCategorizacion}"/>
	              </cmz:ayuda>
	            </td>
	          </tr>
	          <tr>
	            <td>Impuestos:</td>
	            <td>
	              <cmz:ayuda nombreAyuda="IMPUESTOS" soloLectura="false" onclick="ayudaImpuestos();">
	                <cmz:codigoAyuda idCodigo="codImpuesto" longitudMaximaCodigo="1" valorCodigo="${param.codImpuesto}" anchuraCodigo="10px"/>
	                <cmz:descripcionAyuda idDescripcion="desImpuesto" anchuraDescripcion="200px" valorDescripcion="${param.desImpuesto}" editable="true"/>
	              </cmz:ayuda>
	            </td>
	          </tr>
	          <tr>
	            <td>Codigo de Barras:</td>
	            <td>
	              <cmz:campoTexto id="codigoBarras" valor="${param.codigoBarras}" editable="true" anchura="150" longitudMaxima="20"/>
	            </td>
	          </tr>
	          <tr>
	            <td>Unidades por Caja:</td>
	            <td> 
	              <cmz:campoTexto id="unidadesCaja" valor="${param.unidadesCaja}" editable="true" anchura="110" longitudMaxima="13"/>
	            </td>
	          </tr>
	          <tr>
	            <td>Cajas por Palé:</td>
	              <td>
	                <cmz:campoTexto id="cajasPale" valor="${param.cajasPale}" editable="true" soloLectura="false" anchura="110" longitudMaxima="13"/>
	              </td>
	          </tr>
	        </table>
          </cmz:cuerpoPanel>
        </cmz:panel> 
        <cmz:panel>
          <cmz:cabeceraPanel titulo="Etiqueta"/>
          <cmz:cuerpoPanel>
            <table>
              <tr>
                <td>Unidad:</td>
                <td>
                  <cmz:ayuda nombreAyuda="UNIDADES_MEDIDAS_ETIQUETAS" soloLectura="false">
                    <cmz:codigoAyuda idCodigo="codUnidadMedidaEtiq" longitudMaximaCodigo="4" valorCodigo="${param.codUnidadMedidaEtiq}" anchuraCodigo="40px"/>
                	<cmz:descripcionAyuda idDescripcion="desUnidadMedidaEtiq" anchuraDescripcion="150px" valorDescripcion="${param.desUnidadMedidaEtiq}"/>
              	  </cmz:ayuda>
              	</td>
              </tr>
              <tr>
                <td>Cantidad:</td>
                <td>
                  <cmz:campoTexto id="cantidadUnidadMedidaEtiq" editable="true" soloLectura="false" longitudMaxima="13" anchura="110">
              		<cmz:formateaNumero valor="${param.cantidadUnidadMedidaEtiq}"></cmz:formateaNumero>
              	  </cmz:campoTexto>
                </td>
              </tr>
            </table>
          </cmz:cuerpoPanel>
        </cmz:panel>
        
        <cmz:panel>
          <cmz:cabeceraPanel titulo="Compras"/>
          <cmz:cuerpoPanel>
            <table>
              <tr>
                <td>Proveedor:</td>
                <td>
                  <cmz:ayuda nombreAyuda="PROVEEDORES" soloLectura="false">
                    <cmz:codigoAyuda idCodigo="codProveedorAlta" longitudMaximaCodigo="11" valorCodigo="${param.codProveedorAlta}" anchuraCodigo="90px"/>
	                <cmz:descripcionAyuda idDescripcion="desProveedorAlta" anchuraDescripcion="200px" valorDescripcion="${param.desProveedorAlta}"/>
              	  </cmz:ayuda>
              	</td>
              </tr>
			<tr>
              <td>Dto. Proveedor:</td>
              <td>
              	<cmz:campoTexto id="dtoProveedor" editable="true" soloLectura="false" longitudMaxima="17" anchura="70">
                  <cmz:formateaNumero valor="${param.dtoProveedor}" />
                </cmz:campoTexto>
              </td>
			</tr>
              <tr>
                <td>Referencia:</td>
                <td>
                  <cmz:campoTexto id="referencia" valor="${param.referencia}" editable="true" soloLectura="false" longitudMaxima="20" anchura="150"/>
                </td>
              </tr>
              <tr>
                <td>Fabricante:</td>
                <td>
                  <cmz:ayuda nombreAyuda="FABRICANTES" soloLectura="false">
                    <cmz:codigoAyuda idCodigo="codFabricante" longitudMaximaCodigo="11" valorCodigo="${param.codFabricante}" anchuraCodigo="90px"/>
                    <cmz:descripcionAyuda idDescripcion="desFabricante" anchuraDescripcion="200px" valorDescripcion="${param.desFabricante}"/>
                  </cmz:ayuda>
                </td>
              </tr>
            </table>
          </cmz:cuerpoPanel>
        </cmz:panel> 
        
        <cmz:panel>
          <cmz:cabeceraPanel titulo="Precios"/>
          <cmz:cuerpoPanel>
            <!-- Tarifa general -->
            <input type="hidden" value="${tarifa.TARIFA_GENERAL}" id="codTarifa" name="codTarifa" />
            <table>
              <tr>
                <td>Precio costo:</td>
                <td>
                  <cmz:campoTexto id="precioCosto" valor="${param.precioCosto}" onChange="validarPrecioCosto();" editable="true" soloLectura="false" longitudMaxima="14" anchura="70" requerido="true"/>
                </td>
                <td colspan="2">
                  <input type="checkbox" id="actualizacionAutomaticaCompra" name="actualizacionAutomaticaCompra" value=""
	                <c:if test="${param.actAutomaticaCosto}">checked="checked"</c:if> />Act. automática al comprar
	            </td>
              </tr>
              <tr>
                <td>Factor marcaje:</td>
                <td>
                  <cmz:campoTexto id="factorMarcaje" valor="${param.factorMarcaje}" onChange="validarFactorMarcaje();" editable="true" soloLectura="false" anchura="50" longitudMaxima="8"/>
              	</td>
                <td>Precio marcaje:</td>
              	<td>
              	  <cmz:campoTexto id="precioMarcaje" valor="${param.precioMarcaje}" onChange="validarPrecioMarcaje();" editable="true" soloLectura="false" longitudMaxima="14" anchura="70"/>
              	</td>
                <td>Precio marcaje + impuestos:</td>
                <td>
                  <cmz:campoTexto id="precioMarcajeImpuestos" valor="${param.precioMarcajeImpuestos}" onChange="validarPrecioMarcajeImpuestos();" editable="true" soloLectura="false" longitudMaxima="14" anchura="70"/>
              	</td>
              </tr>
              <tr>
                <td>Factor aplicado:</td>
                <td>
                  <cmz:campoTexto id="factorAplicado" valor="${param.factorAplicado}" editable="false" soloLectura="true" anchura="50"/>
              	</td>
                <td>Precio venta:</td>
                <td>
                  <cmz:campoTexto id="precioVenta" valor="${param.precioVenta}" editable="false" soloLectura="true" anchura="70"/>
	            </td>
                <td>Precio venta + impuestos:</td>
                <td>
                  <input type="hidden" value="" id="porcentajeImpuestos" name="porcentajeImpuestos" />
                  <cmz:campoTexto id="precioTotal" valor="${param.precioTotal}" editable="false" soloLectura="true" longitudMaxima="14" anchura="70"/>
                </td>
              </tr>
            </table>
          </cmz:cuerpoPanel>
        </cmz:panel></form>
      </cmz:cuerpoPanelCMZ>
    </cmz:panelCMZ>
  </cmz:main>
</body>
</html>
