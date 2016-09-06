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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="formulario" value="${formularioAlbaranVenta.formularioPestañaActiva}" />
<c:set var="articulo" value="${formularioAlbaranVenta.formularioPestañaActiva.registroActivo}" />
<c:set var="albaran" value="${formularioAlbaranVenta.registroActivo}" />

<script type="text/javascript">
    function checkFormRegistroPestaña() {
    	if(!esValido("codArticulo", "AYUDA", true, "desArticulo", "ARTICULOS")) {
			return false;
		}
        if (document.getElementById("desArticulo").value.length == 0) {
            alert("Debe introducir un artículo válido");
            return false;
        }
        if (document.getElementById("desglose1").value.length == 0) {
            alert("Debe indicar el valor del desglose1");
            return false;
        }
        if (document.getElementById("desglose2").value.length == 0) {
            alert("Debe indicar el valor del desglose2");
            return false;
        }
        if (!esValido("cantidadMedida", "NUMERICO", false, 3, true)) {
            return false;
        }
        if (!esValido("cantidad", "NUMERICO", true, 3, true)) {
            return false;
        }
        if (!esValido("precio", "NUMERICO", true, 4, true)) {
            return false;
        }
        if (!esValido("descuento", "NUMERICO", false, 2, true)) {
            return false;
        }
      
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
        var unidades = desformateaNumero(document.getElementById("cantidad").value);
        var precio = desformateaNumero(document.getElementById("precio").value);
        var descuento = desformateaNumero(document.getElementById("descuento").value);
        
        if (unidades.length > 0 && precio.length > 0){
            if (descuento.length == 0) {
                descuento = 0;
            }
            var importe = unidades * precio;
            var descuento = importe * descuento / 100;
            importe -= descuento;
            
        	document.getElementById("importe").value = formateaNumero(importe, 2);
        }

        if (document.getElementById("signo").value.length > 0) {
            calculaSigno();
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
                  "?codArticulo=" + escape(document.getElementById("codArticulo").value) + 
                  "&codTarifa=" + '<c:out value="${albaran.codTarifa}"/>' +
                  "&codCliente=" + '<c:out value="${albaran.codCliente}"/>';
        
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

                // Establecemos el precio, en función de si el cliente es una tienda o no
                <c:choose>
                  <c:when test="${albaran.cliente.esTienda}">
                    document.getElementById("precio").value = formateaNumero(response.getElementsByTagName("precioCosto").item(0).firstChild.data, 4);
                  </c:when>
                  <c:otherwise>
                    document.getElementById("precio").value = formateaNumero(response.getElementsByTagName("precioVenta").item(0).firstChild.data, 4);
                  </c:otherwise>
                </c:choose>

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
    
    function inicializarArticulo() {
    	document.getElementById("desArticulo").value = "";
    	document.getElementById("desglose1").value = "";
    	document.getElementById("desglose2").value = "";
    	document.getElementById("cantidadMedida").value = "";
    	inicializarComboUnidadesMedida();
    	document.getElementById("cantidad").value = "";
    	document.getElementById("precio").value = "";
    	document.getElementById("descuento").value = "";
    	document.getElementById("importe").value = "";
    }

    function ayudaArticulos() {
    	var rt = buscar('ARTICULOS','codArticulo', 'desArticulo');

        if (rt) {        
            validarArticulo();
        }
    }

    
    function inicioRegistroPestaña() {
        if(document.getElementById("codArticulo").value > 0) {
              <c:if test="${formulario.editable}">
                  inicializarUnidadesMedida();
                  seleccionarUnidadMedida("<c:out value="${articulo.unidadMedida}" />");
              </c:if>
        }
    }

    function buscarDesglosesArticulo(){
        buscar('DESGLOSES_ARTICULO', 'desglose1', 'desglose2', null, 'codArticulo');
    }

    function calculaSigno() {
        var signo = (document.getElementById("signo").value=='-'?-1:1);
        var cantidad = desformateaNumero(document.getElementById("cantidadMedida").value);
        var unidades = desformateaNumero(document.getElementById("cantidad").value);
        cantidad = Math.abs(cantidad) * signo;
        unidades = Math.abs(unidades) * signo;
        document.getElementById("cantidadMedida").value = formateaNumero(cantidad, 2);
        document.getElementById("cantidad").value = formateaNumero(unidades, 2);
    }    
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Artículos del Albarán">
    <cmz:acciones>
      <c:choose>
        <c:when test="${formulario.editable}">
          <cmz:accionSalvarLinea onclick="aceptarRegistroPestaña();"/>
          <cmz:accion onclick="cancelarRegistroPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
        </c:when>
        <c:otherwise>
          <cmz:accionModoTabla onclick="vistaTablaPestaña();"/>
          
          <c:if test="${formularioAlbaranVenta.editable}">
            <cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Añadir Artículo"/>
            <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Artículo" onclick="editarRegistroPestaña(${formulario.indiceRegistroActivo});" />
            <cmz:accion icono="comun/images/iconos/eliminar.gif" descripcion="Eliminar Artículo" onclick="eliminarRegistroPestaña(${formulario.indiceRegistroActivo});" />
          </c:if>
          
          <cmz:accionNavegacionRegistros onclick="verRegistroPestaña" 
               total="${formulario.total}" 
               actual="${formulario.actual}" 
               primero="${formulario.primero}"
               anterior="${formulario.anterior}"
               siguiente="${formulario.siguiente}"
               ultimo="${formulario.ultimo}"/>
        </c:otherwise>
      </c:choose>
    </cmz:acciones>
  </cmz:cabeceraPanel>
  
  <input type="hidden" id="signo" name="signo" value="${albaran.conceptoAlmacen.signo}"/>
   
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
        <td>Artículo:</td>
        <td>
          <cmz:ayuda nombreAyuda="ARTICULOS" requerido="true" soloLectura="${!formulario.editable}" onclick="ayudaArticulos();">
            <cmz:codigoAyuda idCodigo="codArticulo" valorCodigo="${articulo.codArticulo}" longitudMaximaCodigo="13" onchange="validarArticulo();" anchuraCodigo="90px"></cmz:codigoAyuda>
            <cmz:descripcionAyuda idDescripcion="desArticulo" valorDescripcion="${articulo.desArticulo}" anchuraDescripcion="300px"></cmz:descripcionAyuda>
          </cmz:ayuda>
        </td>
      </tr>
      
      <c:choose>
        <c:when test="${empty formularioAlbaranVenta.tituloDesglose1}">
          <input name="desglose1" id="desglose1" type="hidden" value="*" />
        </c:when>
        <c:otherwise>
          <tr>
            <td><c:out value="${formularioAlbaranVenta.tituloDesglose1}" />:</td>
            <td>
              <c:choose>
              	<c:when test="${formulario.editable}">
	              <cmz:campoTexto id="desglose1" valor="${articulo.desglose1}" requerido="true" editable="${formulario.editable}" soloLectura="true" longitudMaxima="15" anchura="120px" clase="campo soloLectura requerido"></cmz:campoTexto>
              	  <img src="comun/images/iconos/desplegable.gif" class=\"prismaticos\" align="absMiddle" border="0" valign="middle"  onClick="buscarDesglosesArticulo();"  WIDTH="16" HEIGHT="16"/>	
              	</c:when>
              	<c:otherwise>
	              <cmz:campoTexto id="desglose1" valor="${articulo.desglose1}" requerido="true" editable="${formulario.editable}" soloLectura="true" longitudMaxima="15" anchura="120px"></cmz:campoTexto>
              	</c:otherwise>
              </c:choose>	
            </td>
          </tr>
        </c:otherwise>
      </c:choose>
      
      <c:choose>
        <c:when test="${empty formularioAlbaranVenta.tituloDesglose2}">
          <input name="desglose2" id="desglose2" type="hidden" value="*" />
        </c:when>
        <c:otherwise>
          <tr>
            <td><c:out value="${formularioAlbaranVenta.tituloDesglose2}" />:</td>
            <td>
              <c:choose>
              	<c:when test="${formulario.editable}">
	              <cmz:campoTexto id="desglose2" valor="${articulo.desglose2}" requerido="true" editable="${formulario.editable}" soloLectura="true" longitudMaxima="15" anchura="120px" clase="campo soloLectura requerido"></cmz:campoTexto>
              	  <img src="comun/images/iconos/desplegable.gif" class=\"prismaticos\" align="absMiddle" border="0" valign="middle"  onClick="buscarDesglosesArticulo();"  WIDTH="16" HEIGHT="16"/>	
              	</c:when>
              	<c:otherwise>
	              <cmz:campoTexto id="desglose2" valor="${articulo.desglose2}" requerido="true" editable="${formulario.editable}" soloLectura="true" longitudMaxima="15" anchura="120px"></cmz:campoTexto>
              	</c:otherwise>
              </c:choose>	
            </td>
          </tr>
        </c:otherwise>
      </c:choose>
      
      <tr>
        <td>Cantidad:</td>
        <td>
          <cmz:campoTexto id="cantidadMedida" requerido="false" soloLectura="${!formulario.editable}" onChange="calcularUnidades();" anchura="70px">
          	<cmz:formateaNumero valor="${articulo.cantidadMedida}"/>	
          </cmz:campoTexto>
          
          <c:choose>
              <c:when test="${formulario.editable}">
                <c:set var="claseCombo" value="campo" />
              </c:when>
              <c:otherwise>
                <c:set var="claseCombo" value="campo soloLectura" />
              </c:otherwise>
            </c:choose>
          <select id="unidadMedida" name="unidadMedida" class="${claseCombo}" onchange="calcularUnidades();" style="width: 120px" >
            <c:choose>
              <c:when test="${formulario.editable}">
                <option value="" factor="1">-- Seleccionar --</option>
              </c:when>
              <c:otherwise>
                <option value="${articulo.unidadMedida}"><c:out value="${articulo.unidadMedida}" /></option>
              </c:otherwise>
            </c:choose>
          </select>
        </td>
      </tr>
      
      <tr>
        <td>Unidades:</td>
        <td>
          <cmz:campoTexto id="cantidad" requerido="true" editable="${formulario.editable}" soloLectura="${!formulario.editable}" onChange="calcularImporte();" anchura="70px">
          	<cmz:formateaNumero valor="${articulo.cantidad}"/>	
          </cmz:campoTexto>
        </td>
      </tr>
      
      <tr>
        <td>Precio:</td>
        <td>
          <cmz:campoTexto id="precio" requerido="true" editable="${formulario.editable}" soloLectura="${!formulario.editable}" onChange="calcularImporte();" anchura="70px">
          	<cmz:formateaNumero valor="${articulo.precio}"/>	
          </cmz:campoTexto>
        </td>
      </tr>
      
      <tr>
        <td>Descuento:</td>
        <td>
          <cmz:campoTexto id="descuento" requerido="false" editable="${formulario.editable}" soloLectura="${!formulario.editable}" onChange="calcularImporte();" anchura="70px">
          	<cmz:formateaNumero valor="${articulo.descuento}"/>	
          </cmz:campoTexto> %
        </td>
      </tr>
      
      <tr>
        <td>Importe:</td>
        <td>
          <cmz:campoTexto id="importe" editable="false" soloLectura="true" anchura="90px">
          	<cmz:formateaNumero numDecimales="2" valor="${articulo.importe}"/>	
          </cmz:campoTexto>
        </td>
      </tr>
      
      <tr>
        <td valign="top">Descripción<br/>Ampliada:</td>
        <td>
          <cmz:campoAreaTexto id="descripcionAmpliada" valor="${articulo.descripcionAmpliada}" requerido="false" editable="${formulario.editable}" soloLectura="${!formulario.editable}" anchura="100%" altura="100px" longitudMaxima="255"></cmz:campoAreaTexto>
        </td>
      </tr>
    </table>
  </cmz:cuerpoPanel>
</cmz:panel>
