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
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="regularizacion" value="${formularioRegularizacion.registroActivo}" />

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
            document.getElementById("codArticulo").focus();
        	if(document.getElementById("codArticulo").value > 0) {
                <c:if test="${formularioRegularizacion.editable}">
                    validarArticulo();
                </c:if>
          	}
        	if(document.getElementById("codConceptoAlmacen").value != "") {
                <c:if test="${formularioRegularizacion.editable}">
                	validarConceptoAlmacen();
                </c:if>
          	}
            <c:if test="${formularioRegularizacion.editable}">
            pintaCalendario("fecha", "imgFecha");
            </c:if>            
        }
        
        function checkForm() {
        	if(!esValido("codArticulo", "TEXTO", true))
            	return false;
        	if(!esValido("codAlmacen", "TEXTO", true))
            	return false;
        	if(!esValido("codConceptoAlmacen", "TEXTO", true))
            	return false;
        	if(!esValido("fecha", "FECHA", true))
            	return false;
        	if(!esValido("desglose1", "TEXTO", true))
            	return false;
            if(!esValido("desglose2", "TEXTO", true))
            	return false;
            if(!esValido("cantidadMedida", "NUMERICO", false, 2, true))
            	return false;
            if(!esValido("unidadMedida", "TEXTO", false))
            	return false;
            if(!esValido("cantidad", "NUMERICO", true, 2, true))
            	return false;
            if(!esValido("precio", "NUMERICO", true, 4, true))
            	return false;
            if(!esValido("observaciones", "TEXTO", false))
            	return false;            
           
            return true;
        }

        function inicializarUnidadesMedida() {
        	inicializarComboUnidadesMedida();
          
        	var url = "articuloUM.cmz" +
            "?codArticulo=" + escape(document.getElementById("codArticulo").value);

            response = xmlRequest(url);
            cargarUnidadesMedida(response);
        }

        function cargarUnidadesMedida(response) {
        	if (response != null) {
                if (response.getElementsByTagName("ERROR").item(0)) {
                    alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
                    return false;
                }
                 
                // Si existe unidad de medida alternativa, esta será la única posible
                try {
                    var unidadMedidaAlternativa = response.getElementsByTagName("unidadMedidaAlternativa").item(0).firstChild.data;
        
                    // Cargar el combo con la unidad de medida alternativa y factor 0
                    unloadCombo(document.getElementById("unidadMedida"));
                    insertarUnidadMedida(unidadMedidaAlternativa, 0);
                }
                // Si no venía unidad de medida alternativa, obtener las unidades de medida del artículo
                catch (e) {
                    try {
                        var unidadesMedida = response.getElementsByTagName("unidadesMedida").item(0);
                        var listaUnidadesMedida = unidadesMedida.getElementsByTagName("unidadMedida");
                        
                        for(var i = 0; i < listaUnidadesMedida.length; i++) {
                            var factorConversion = listaUnidadesMedida.item(i).getElementsByTagName("factorConversion").item(0).firstChild.data;
                            var descripcion = listaUnidadesMedida.item(i).getElementsByTagName("descripcion").item(0).firstChild.data;

                            insertarUnidadMedida(descripcion, factorConversion);
                        }
                    }
                    // Si no existen unidades de medida, cargar el combo con una única unidad de medida con factor de conversion 1
                    catch (e) {
                        insertarUnidadMedida("UNID", 1.0);
                    }
                }
        	}
        }

        function inicializarComboUnidadesMedida() {
        	unloadCombo(document.getElementById("unidadMedida"));

        	var objCombo = document.getElementById("unidadMedida");
        	opcionTmp = new Option("-- Seleccionar --", "", false, false);
        	opcionTmp.factor = 1.0;
        	objCombo.options[objCombo.length] = opcionTmp;;
        }

        function unloadCombo(objCombo) {
            for (var i = objCombo.length-1; i>=0; i--){
                objCombo.options[i] = null;
            }
        }

        function insertarUnidadMedida(unidaMedida, factor) {
            var objCombo = document.getElementById("unidadMedida");
        	var opcionTmp = null;
            opcionTmp = new Option(unidaMedida, unidaMedida, false, false);
            opcionTmp.factor = factor;
            objCombo.options[objCombo.length] = opcionTmp;
            opcionTmp = null;
        }

        function seleccionarUnidadMedida(unidadMedida) {
        	var objCombo = document.getElementById("unidadMedida");
                  
            for (var i=0; i < objCombo.length; i++) {
                if (objCombo.options[i].value == unidadMedida) {
                    objCombo.selectedIndex = i;
                    return;
                }
            }
        }

        function calcularUnidades() {
            var factor = document.getElementById("unidadMedida").options[document.getElementById("unidadMedida").selectedIndex].factor;

            if (factor){
                var cantidadMedida = desformateaNumero(document.getElementById("cantidadMedida").value);
                document.getElementById("cantidad").value = formateaNumero(cantidadMedida * factor, 2);
            }

            if (document.getElementById("signo").value.length > 0) {
                calculaSigno();
            }

            calcularImporte();
        }

        function calcularImporte() {
            if (document.getElementById("signo").value.length > 0) {
                calculaSigno();
            }

            var unidades = desformateaNumero(document.getElementById("cantidad").value);
            var precio = desformateaNumero(document.getElementById("precio").value);
            
            if (unidades.length > 0 && precio.length > 0){
                var importe = unidades * precio;                
                
            	document.getElementById("importe").value = formateaNumero(importe, 2);
            }
        }

        function validarArticulo() {
            if (document.getElementById("codArticulo").value.length == 0) {
                //Borramos los desgloses también
                document.getElementById("desArticulo").value = "";
                document.getElementById("desglose1").value = "";
                document.getElementById("desglose2").value = "";
                return false;
            }
            
        	inicializarArticulo();
            
            var url = "articulo.cmz" +
                      "?codArticulo=" + escape(document.getElementById("codArticulo").value);
            
            response = xmlRequest(url);

            if (response != null) {
                if (response.getElementsByTagName("ERROR").item(0)) {
                    alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
                    document.getElementById("codArticulo").focus();
                    document.getElementById("codArticulo").select();
                    
                    return false;
                }
                else {
                    // Establecemos código y descripción del artículo
                    document.getElementById("codArticulo").value = response.getElementsByTagName("codArticulo").item(0).firstChild.data;
                    document.getElementById("desArticulo").value = response.getElementsByTagName("desArticulo").item(0).firstChild.data;
                    
                    // Establecemos el valor del desglose1
                    try {
                        document.getElementById("desglose1").value = response.getElementsByTagName("desglose1").item(0).firstChild.data;
                    }
                    catch (e) {
                    	document.getElementById("desglose1").value = "";
                    }

                    // Establecemos el valor de desglose2
                    try {
                    	document.getElementById("desglose2").value = response.getElementsByTagName("desglose2").item(0).firstChild.data;
                    }
                    catch (e) {
                    	document.getElementById("desglose2").value = "";
                    }

                    // Establecemos el precio
                    document.getElementById("precio").value = formateaNumero(response.getElementsByTagName("precioCosto").item(0).firstChild.data, 4);

                    //Establecemos la cantidad establecida por el dun14 si este tuviera
                    try {
                    	document.getElementById("cantidadMedida").value = formateaNumero(response.getElementsByTagName("cantidadDun14").item(0).firstChild.data, 0);
                    	calcularUnidades();
                    	calcularImporte();
                    }
                    catch (ignore) {}

                    // Cargamos combo de unidades de medida
                    cargarUnidadesMedida(response);

                    document.getElementById("cantidadMedida").focus();
                    
                    return true;
                }
            }
            else {
                alert("No se ha podido conectar con el servidor");
                alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
                document.getElementById("codArticulo").focus();
                document.getElementById("codArticulo").select();
                
                return false;
            }
        }

        function validarConceptoAlmacen() {
            if (document.getElementById("codConceptoAlmacen").value.length == 0) {
                //Borramos el signo y la descripción
                document.getElementById("desConceptoAlmacen").value = "";
                document.getElementById("signo").value = "";
                return false;
            }
            
        	inicializarConceptoAlmacen();
            
            var url = "conceptoAlmacenRegularizacion.cmz" +
                      "?codConceptoAlmacen=" + escape(document.getElementById("codConceptoAlmacen").value);
            
            response = xmlRequest(url);

            if (response != null) {
                if (response.getElementsByTagName("ERROR").item(0)) {
                    alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
                    document.getElementById("codConceptoAlmacen").focus();
                    document.getElementById("codConceptoAlmacen").select();
                    
                    return false;
                }
                else {
                    // Establecemos código y descripción del concepto de almacén
                    document.getElementById("codConceptoAlmacen").value = response.getElementsByTagName("codConceptoAlmacen").item(0).firstChild.data;
                    document.getElementById("desConceptoAlmacen").value = response.getElementsByTagName("desConceptoAlmacen").item(0).firstChild.data;
                    
                    // Establecemos el valor del signo
                    try {
                        document.getElementById("signo").value = response.getElementsByTagName("signo").item(0).firstChild.data;
                    }
                    catch (e) {
                    	document.getElementById("signo").value = "";
                    }
                    calculaSigno();
                    calculaSignoImporte();
                    
                    return true;
                }
            }
            else {
                alert("No se ha podido conectar con el servidor");
                alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
                document.getElementById("codConceptoAlmacen").focus();
                document.getElementById("codConceptoAlmacen").select();
                
                return false;
            }
        }

        function inicializarArticulo() {
        	document.getElementById("desArticulo").value = "";
        	document.getElementById("desglose1").value = "";
        	document.getElementById("desglose2").value = "";
        	document.getElementById("cantidadMedida").value = "";
        	inicializarComboUnidadesMedida();
        	document.getElementById("cantidad").value = "";
        	document.getElementById("precio").value = "";
        	document.getElementById("importe").value = "";
        }

        function inicializarConceptoAlmacen() {
        	document.getElementById("desConceptoAlmacen").value = "";
        	document.getElementById("signo").value = "";
        }

        function ayudaArticulos() {
        	var rt = buscar('ARTICULOS','codArticulo', 'desArticulo');

            if (rt) {        
                validarArticulo();
            }
        }

        function ayudaConceptoAlmacen() {
        	var rt = buscar('CONCEPTOS_ALMACENES_REGU','codConceptoAlmacen', 'desConceptoAlmacen');

            if (rt) {        
                validarConceptoAlmacen();
            }
        }

        function buscarDesglosesArticulo(){
            buscar('DESGLOSES_ARTICULO', 'desglose1', 'desglose2', null, 'codArticulo');
        }

        function calculaSigno() {
            var signo = (document.getElementById("signo").value=='-'?-1:1);
            var cantidad = desformateaNumero(document.getElementById("cantidadMedida").value);
            var unidades = desformateaNumero(document.getElementById("cantidad").value);
            if (cantidad != "") {
	            cantidad = Math.abs(cantidad) * signo;
	            document.getElementById("cantidadMedida").value = formateaNumero(cantidad, 2);
            }
            if (unidades != "") {
	            unidades = Math.abs(unidades) * signo;
	            document.getElementById("cantidad").value = formateaNumero(unidades, 2);
            }
        }
        function calculaSignoImporte() {
            var signo = (document.getElementById("signo").value=='-'?-1:1);
            var importe = desformateaNumero(document.getElementById("importe").value);
            if (importe != "") {
	            importe = Math.abs(importe) * signo;
	            document.getElementById("importe").value = formateaNumero(importe, 2);
            }
        }
    </script>
  </head>

  <body  onload="inicio();" onkeydown="keyDown(event);">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <c:choose>
              <c:when test="${!formularioRegularizacion.editable}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir una nueva Regularización"/>
                </c:if>
                
              </c:when>
              <c:otherwise>
              	<cmz:accionSalvar onclick="aceptar();"/>
                <cmz:accionCancelar onclick="cancelar();"/>
              </c:otherwise>
            </c:choose>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="regularizaciones" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${regularizacion.idRegularizacion}" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            <input type="hidden" id="signo" name="signo" value=""/>
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos de la Regularización"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Concepto de Almacén:</td>
                    <td>
                      <cmz:ayuda requerido="true" soloLectura="${!formularioRegularizacion.editable}" nombreAyuda="CONCEPTOS_ALMACENES_REGU" onclick="ayudaConceptoAlmacen();">
                        <cmz:codigoAyuda idCodigo="codConceptoAlmacen" valorCodigo="${regularizacion.codConceptoAlmacen}" anchuraCodigo="40px" longitudMaximaCodigo="4" onchange="validarConceptoAlmacen();"></cmz:codigoAyuda>
                        <cmz:descripcionAyuda idDescripcion="desConceptoAlmacen" valorDescripcion="${regularizacion.desConceptoAlmacen}" anchuraDescripcion="300px"></cmz:descripcionAyuda>
                      </cmz:ayuda> 
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Almacén:</td>
                    <td>
                      <cmz:ayuda requerido="true" soloLectura="${!formularioRegularizacion.editable}" nombreAyuda="ALMACENES">
          				<cmz:codigoAyuda idCodigo="codAlmacen" valorCodigo="${regularizacion.codAlmacen}" anchuraCodigo="40px" longitudMaximaCodigo="4"></cmz:codigoAyuda>
          				<cmz:descripcionAyuda idDescripcion="desAlmacen" valorDescripcion="${regularizacion.desAlmacen}" anchuraDescripcion="300px"></cmz:descripcionAyuda>
          			  </cmz:ayuda>                      
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Fecha:</td>
                    <td>
                    <c:set var="fecha"><fmt:formatDate pattern="dd/MM/yyyy" value="${regularizacion.fecha}"/></c:set>
                    <cmz:campoFecha id="fecha" valor="${fecha}" mostrarCheckbox="false" requerido="true" editable="${formularioRegularizacion.editable}" soloLectura="${!formularioRegularizacion.editable}"/></td>
                  </tr>
                  
                  <tr>
                    <td>Artículo:</td>
                    <td>
                        <cmz:ayuda requerido="true" soloLectura="${!formularioRegularizacion.editable}" nombreAyuda="ARTICULOS" onclick="ayudaArticulos();">
                          <cmz:codigoAyuda idCodigo="codArticulo" valorCodigo="${regularizacion.codArticulo}" anchuraCodigo="90px" longitudMaximaCodigo="13" onchange="validarArticulo();"></cmz:codigoAyuda>
                          <cmz:descripcionAyuda idDescripcion="desArticulo" valorDescripcion="${regularizacion.desArticulo}" anchuraDescripcion="300px"></cmz:descripcionAyuda>
                        </cmz:ayuda>
                    </td>
                  </tr>                  

			      <c:choose>
			        <c:when test="${empty formularioRegularizacion.tituloDesglose1}">
			          <input name="desglose1" id="desglose1" type="hidden" value="*" />
			        </c:when>
			        <c:otherwise>
			          <tr>
			            <td><c:out value="${formularioRegularizacion.tituloDesglose1}" />:</td>
			            <td>
			              <c:choose>
			              	<c:when test="${formularioRegularizacion.editable}">
				              <cmz:campoTexto id="desglose1" valor="${regularizacion.desglose1}" requerido="true" editable="${formularioRegularizacion.editable}" soloLectura="true" longitudMaxima="15" anchura="120px" clase="campo soloLectura requerido"></cmz:campoTexto>
			              	  <img src="comun/images/iconos/desplegable.gif" class="prismaticos" align="absMiddle" border="0" valign="middle"  onClick="buscarDesglosesArticulo();"  WIDTH="16" HEIGHT="16"/>	
			              	</c:when>
			              	<c:otherwise>
				              <cmz:campoTexto id="desglose1" valor="${regularizacion.desglose1}" requerido="true" editable="${formularioRegularizacion.editable}" soloLectura="true" longitudMaxima="15" anchura="120px"></cmz:campoTexto>
			              	</c:otherwise>
			              </c:choose>	
			            </td>
			          </tr>
			        </c:otherwise>
			      </c:choose>
			      
			      <c:choose>
			        <c:when test="${empty formularioRegularizacion.tituloDesglose2}">
			          <input name="desglose2" id="desglose2" type="hidden" value="*" />
			        </c:when>
			        <c:otherwise>
			          <tr>
			            <td><c:out value="${formularioRegularizacion.tituloDesglose2}" />:</td>
			            <td>
			              <c:choose>
			              	<c:when test="${formularioRegularizacion.editable}">
				              <cmz:campoTexto id="desglose2" valor="${regularizacion.desglose2}" requerido="true" editable="${formularioRegularizacion.editable}" soloLectura="true" longitudMaxima="15" anchura="120px" clase="campo soloLectura requerido"></cmz:campoTexto>
			              	  <img src="comun/images/iconos/desplegable.gif" class="prismaticos" align="absMiddle" border="0" valign="middle"  onClick="buscarDesglosesArticulo();"  WIDTH="16" HEIGHT="16"/>	
			              	</c:when>
			              	<c:otherwise>
				              <cmz:campoTexto id="desglose2" valor="${regularizacion.desglose2}" requerido="true" editable="${formularioRegularizacion.editable}" soloLectura="true" longitudMaxima="15" anchura="120px"></cmz:campoTexto>
			              	</c:otherwise>
			              </c:choose>	
			            </td>
			          </tr>
			        </c:otherwise>
			      </c:choose>
                  
                  <tr>
                    <td>Cantidad:</td>
                    <td>
                      <cmz:campoTexto id="cantidadMedida" anchura="90px" longitudMaxima="13" editable="${formularioRegularizacion.editable}" soloLectura="${!formularioRegularizacion.editable}" onChange="calcularUnidades();">
                      	<cmz:formateaNumero valor="${regularizacion.cantidadMedida}" numDecimales="2"></cmz:formateaNumero>
                      </cmz:campoTexto>
                    <c:choose>
			        	 <c:when test="${formularioRegularizacion.editable}">
			                <c:set var="claseCombo" value="campo" />
			              </c:when>
			              <c:otherwise>
			                <c:set var="claseCombo" value="campo soloLectura" />
			              </c:otherwise>
			            </c:choose>
			          <select id="unidadMedida" name="unidadMedida" class="${claseCombo}" onchange="calcularUnidades();" style="width: 120px" >
			            <c:choose>
			              <c:when test="${formularioRegularizacion.editable}">
			                <option value="" factor="1">-- Seleccionar --</option>
			              </c:when>
			              <c:otherwise>
			                <option value="${regularizacion.unidadMedida}"><c:out value="${regularizacion.unidadMedida}" /></option>
			              </c:otherwise>
			            </c:choose>
			          </select>
			        </td>
			      </tr>
                  
                  <tr>
                    <td>Unidades:</td>
                    <td>
                      <cmz:campoTexto id="cantidad" anchura="90px" longitudMaxima="13" requerido="true" editable="${formularioRegularizacion.editable}" soloLectura="${!formularioRegularizacion.editable}" onChange="calcularImporte();">
                      	<cmz:formateaNumero valor="${regularizacion.cantidad}" numDecimales="2"></cmz:formateaNumero>
                      </cmz:campoTexto>
                    </td>
                  </tr>
                  <tr>
                    <td>Precio:</td>
                    <td>
                      <cmz:campoTexto id="precio" anchura="90px" longitudMaxima="14" requerido="true" editable="${formularioRegularizacion.editable}" soloLectura="${!formularioRegularizacion.editable}" onChange="calcularImporte();">
                      	<cmz:formateaNumero valor="${regularizacion.precio}" numDecimales="4"></cmz:formateaNumero>
                      </cmz:campoTexto>
                    </td>
                  </tr>
                  <tr>
                    <td>Importe:</td>
                    <td>
                      <cmz:campoTexto id="importe" anchura="90px" longitudMaxima="13" editable="false" soloLectura="true">
                      	<cmz:formateaNumero numDecimales="2" valor="${regularizacion.importe}"></cmz:formateaNumero>
                      </cmz:campoTexto>
                    </td>
                  </tr>
                  
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <cmz:panel>
  			  <cmz:cabeceraPanel titulo="Observaciones"></cmz:cabeceraPanel>
  			  <cmz:cuerpoPanel>
    			<cmz:campoAreaTexto id="observaciones" anchura="100%" altura="100px" valor="${regularizacion.observaciones}" editable="${formularioRegularizacion.editable}"
    			soloLectura="${!formularioRegularizacion.editable}" longitudMaxima="255"></cmz:campoAreaTexto>
  			  </cmz:cuerpoPanel>
			</cmz:panel> 
			
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
