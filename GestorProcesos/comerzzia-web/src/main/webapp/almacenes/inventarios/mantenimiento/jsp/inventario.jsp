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


<jsp:useBean id="formularioInventario" type="com.comerzzia.web.almacenes.inventarios.ui.FormularioInventarioBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="inventario" value="${formularioInventario.registroActivo}" />

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
            <c:if test="${inventario.codConceptoAlmacen == null}">
            	setFoco("codConceptoAlmacen");
            </c:if>
            <c:if test="${inventario.codConceptoAlmacen != null}">
        		setFoco("codArticulo");
        	</c:if>
            pintaCalendario("fechaInventario", "imgFechaInventario");
        }
        
        function checkForm() {
        	if(!esValido("codConceptoAlmacen", "AYUDA", true, "desConceptoAlmacen", "CONCEPTOS_ALMACENES_REGU"))
    	       	return false;
        	if(!esValido("codAlmacen", "AYUDA", true, "desAlmacen", "ALMACEN"))
    	       	return false;
        	if(!esValido("fechaInventario", "FECHA", true))
            	return false;
        	if(!validarFechaMenorIgualQueHoy(document.getElementById("fechaInventario").value)){
        		alert("La fecha de inventario debe ser menor o igual a hoy");
            	return false;
        	}
        	if(!esValido("codArticulo", "AYUDA", true, "desArticulo", "ARTICULOS"))
    	       	return false;
        	if(!esValido("desglose1", "TEXTO", true))
            	return false;     
        	if(!esValido("desglose2", "TEXTO", true))
            	return false;     
            if(!esValido("cantidadMedida", "NUMERICO", false, 2, true))
            	return false;
            if(!esValido("cantidad", "NUMERICO", true, 2, true))
            	return false;         
           
            return true;
        }

        function añadir() {
            if(checkForm()){
	        	document.getElementById("accion").value = "salvar";
	        	document.getElementById("frmDatos").submit();
	        	_esperando();
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
        	    	
        	var url = "inventario.cmz" +
		            "?codAlmacen=" + document.getElementById("codAlmacen").value +
		            "&codArticulo=" + document.getElementById("codArticulo").value;
        	         
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

                    // se ocultan los campos "Cantidad" y "Stock UM Alt Actual" en función de si el artículo tiene unidad de medida alternativa o no
					if (response.getElementsByTagName("unidadMedidaAlternativa").item(0) != null && response.getElementsByTagName("unidadMedidaAlternativa").item(0).firstChild.data.length >0) {
						document.getElementById("unidadMedida").value = response.getElementsByTagName("unidadMedidaAlternativa").item(0).firstChild.data;
						document.getElementById("filaUMAlt").style.display = "";
					} else {
						document.getElementById("filaUMAlt").style.display = "none";
					}
					
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

					if(document.getElementById("desglose1").value == "" && document.getElementById("desglose2").value == ""){
						document.getElementById("stockActual").value = "";
						document.getElementById("stockUMAlt").value = "";
					}else{
	                    var stockUMAlt = response.getElementsByTagName('stockUMAlt').item(0).firstChild.data;
	                    document.getElementById("stockUMAlt").value =  formateaNumero(stockUMAlt, 0, "");
	                    var stockActual = response.getElementsByTagName('stockActual').item(0).firstChild.data;
	                    document.getElementById("stockActual").value =  formateaNumero(stockActual, 0, "");
					}

                    var precio = response.getElementsByTagName('precio').item(0).firstChild.data;
                    document.getElementById("precio").value =  formateaNumero(precio, 4, "");

                  	//Establecemos la cantidad establecida por el dun14 si este tuviera
                    try {
                    	document.getElementById("cantidadMedida").value = formateaNumero(response.getElementsByTagName("cantidadDun14").item(0).firstChild.data, 0);
                    }
                    catch (ignore) {}

                    setFoco("cantidadMedida", "cantidad");
                    
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

        function ayudaArticulos() {
        	var rt = buscar('ARTICULOS','codArticulo', 'desArticulo');

            if (rt) {        
                validarArticulo();
            }
        }

        function inicializarArticulo() {
        	document.getElementById("desArticulo").value = "";
        	document.getElementById("desglose1").value = "";
        	document.getElementById("desglose2").value = "";
        	document.getElementById("cantidadMedida").value = "";
        	document.getElementById("cantidad").value = "";
        	document.getElementById("stockUMAlt").value = "";
        	document.getElementById("stockActual").value = "";
        	document.getElementById("precio").value = "";
        	document.getElementById("unidadMedida").value = "";
        }

        function ayudaAlmacenes() {
        	buscar('ALMACENES','codAlmacen', 'desAlmacen');
        	inicializarArticulo();
        }
        

        function inicializarAlmacen() {
        	buscarXML('ALMACENES','codAlmacen', 'desAlmacen');
        	document.getElementById("codArticulo").value = "";
        	inicializarArticulo();
        }

        function buscarDesglosesArticulo(){
            var rt = buscar('DESGLOSES_ARTICULO', 'desglose1', 'desglose2', null, 'codArticulo');
            if(rt){
				validarDesgloses();
            }
        }

        function validarDesgloses() {     	
        	var url = "inventario.cmz" +
                      "?codAlmacen=" + document.getElementById("codAlmacen").value +
                      "&codArticulo=" + document.getElementById("codArticulo").value +
        			  "&desglose1=" + document.getElementById("desglose1").value +
        			  "&desglose2=" + document.getElementById("desglose2").value;
                      
            response = xmlRequest(url);

            inicializarStocks();

            if (response != null) {
                if (response.getElementsByTagName("ERROR").item(0)) {
                    alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
                    document.getElementById("desglose1").focus();
                    document.getElementById("desglose1").select();
                    
                    return false;
                }
                else {
                    var stockUMAlt = response.getElementsByTagName('stockUMAlt').item(0).firstChild.data;
                    document.getElementById("stockUMAlt").value =  formateaNumero(stockUMAlt, 0, "");
                    var stockActual = response.getElementsByTagName('stockActual').item(0).firstChild.data;
                    document.getElementById("stockActual").value =  formateaNumero(stockActual, 0, "");

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

        function inicializarStocks(){
        	document.getElementById("stockUMAlt").value = "";
        	document.getElementById("stockActual").value = "";
        }

		function imprimir(){
            document.getElementById("accion").value = "almacenes.lstInventarioAlmacen";
            document.getElementById("operacion").value = "nuevo";
			document.getElementById("frmDatos").submit();
			_esperando();
		}
    </script>
  </head>

  <body  onload="inicio();" onkeydown="keyDown(event);">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}" >
        	<cmz:acciones numAccionesVisibles="1">
            	<cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir inventario" onclick="imprimir()" />
            	<cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            	<c:if test="${permisos.puedeAdministrar}">
              		<cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            	</c:if>
            </cmz:acciones>
        </cmz:cabeceraPanelCMZ>       
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="inventarios" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="unidadMedida" name="unidadMedida" type="hidden" value=""/>
            <input id="precio" name="precio" type="hidden" value=""/>
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Almacén"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Concepto:</td>
                    <td>
                      <cmz:ayuda requerido="true" soloLectura="false" nombreAyuda="CONCEPTOS_ALMACENES_REGU">
                        <cmz:codigoAyuda idCodigo="codConceptoAlmacen" valorCodigo="${inventario.codConceptoAlmacen}" anchuraCodigo="40px" longitudMaximaCodigo="4"></cmz:codigoAyuda>
                        <cmz:descripcionAyuda idDescripcion="desConceptoAlmacen" valorDescripcion="${inventario.desConceptoAlmacen}" anchuraDescripcion="300px" editable="true"></cmz:descripcionAyuda>
                      </cmz:ayuda> 
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Almacén:</td>
                    <td>
                      <cmz:ayuda requerido="true" soloLectura="false" nombreAyuda="ALMACENES" onclick="ayudaAlmacenes();">
          				<cmz:codigoAyuda idCodigo="codAlmacen" valorCodigo="${inventario.codAlmacen}" anchuraCodigo="40px" longitudMaximaCodigo="4" onchange="inicializarAlmacen();"></cmz:codigoAyuda>
          				<cmz:descripcionAyuda idDescripcion="desAlmacen" valorDescripcion="${inventario.desAlmacen}" anchuraDescripcion="300px" editable="true"></cmz:descripcionAyuda>
          			  </cmz:ayuda>                      
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Fecha inventario:</td>
                    <td>
                    <c:set var="fechaInventario"><fmt:formatDate pattern="dd/MM/yyyy" value="${inventario.fechaInventario}"/></c:set>
                    <cmz:campoFecha id="fechaInventario" valor="${fechaInventario}" mostrarCheckbox="false" requerido="true" editable="true" soloLectura="false"/></td>
                  </tr>
               </table>
             </cmz:cuerpoPanel>
           </cmz:panel>
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Artículo">
              	<cmz:acciones numAccionesVisibles="1">
              		<cmz:accionSalvar onclick="añadir();" titulo="Añadir"/>
              	</cmz:acciones>
              </cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Artículo:</td>
                    <td colspan="4">
                        <cmz:ayuda requerido="true" soloLectura="false" nombreAyuda="ARTICULOS" onclick="ayudaArticulos();">
                          <cmz:codigoAyuda idCodigo="codArticulo" anchuraCodigo="90px" longitudMaximaCodigo="13" onchange="validarArticulo();"></cmz:codigoAyuda>
                          <cmz:descripcionAyuda idDescripcion="desArticulo" anchuraDescripcion="300px"></cmz:descripcionAyuda>
                        </cmz:ayuda>
                    </td>
                  </tr>
                  
                  <tr>
				      <c:choose>
				        <c:when test="${empty formularioInventario.tituloDesglose1}">
				          <input name="desglose1" id="desglose1" type="hidden" value="*" />
				        </c:when>
				        <c:otherwise>
				            <td><c:out value="${formularioInventario.tituloDesglose1}" />:</td>
				            <td>
				              <cmz:campoTexto id="desglose1" requerido="true" editable="${formularioInventario.editable}" soloLectura="true" longitudMaxima="15" anchura="120px" clase="campo soloLectura requerido"></cmz:campoTexto>
				              <img src="comun/images/iconos/desplegable.gif" style="VERTICAL-ALIGN:top;CURSOR: pointer; HEIGHT: 16px; VERTICAL-ALIGN: top" align="absMiddle" border="0" valign="middle"  onClick="buscarDesglosesArticulo();"  WIDTH="16" HEIGHT="16"/>	
				            </td>
				        </c:otherwise>
				      </c:choose>				      
				      <c:choose>
				        <c:when test="${empty formularioInventario.tituloDesglose2}">
				          <input name="desglose2" id="desglose2" type="hidden" value="*" />
				        </c:when>
				        <c:otherwise>
				            <td><c:out value="${formularioInventario.tituloDesglose2}" />:</td>
				            <td>
				              <cmz:campoTexto id="desglose2" requerido="true" editable="false" soloLectura="true" longitudMaxima="15" anchura="120px" clase="campo soloLectura requerido"></cmz:campoTexto>
				              <img src="comun/images/iconos/desplegable.gif" style="VERTICAL-ALIGN:top;CURSOR: pointer; HEIGHT: 16px; VERTICAL-ALIGN: top" align="absMiddle" border="0" valign="middle"  onClick="buscarDesglosesArticulo();"  WIDTH="16" HEIGHT="16"/>	
				            </td>
				        </c:otherwise>
				      </c:choose>
			      </tr>
                  
                  <tr id="filaUMAlt" style="display:none">
                  	<td>Cantidad:</td>
                  	<td>
                  		<cmz:campoTexto id="cantidadMedida" anchura="90px" longitudMaxima="13" editable="true" soloLectura="false"></cmz:campoTexto>
                  	</td>
                  	<td>Stock UM Alt. actual:</td>
                  	<td>
                  		<cmz:campoTexto id="stockUMAlt" anchura="90px" longitudMaxima="13" editable="false" soloLectura="true" ></cmz:campoTexto>
                  	</td>
			      </tr>
                  
                  <tr>
                    <td>Unidades:</td>
                    <td>
                      <cmz:campoTexto id="cantidad" anchura="90px" longitudMaxima="13" editable="true" soloLectura="false" requerido="true"></cmz:campoTexto>
                    </td>
                    <td>Stock actual:</td>
                  	<td>
                  		<cmz:campoTexto id="stockActual" anchura="90px" longitudMaxima="13" editable="false" soloLectura="true" ></cmz:campoTexto>
                  	</td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>           
            
			<cmz:panel>
			  <cmz:cabeceraPanel titulo="Inventariado">
			  </cmz:cabeceraPanel>			  
			  <cmz:cuerpoPanel>
			    <cmz:lista>
			      <cmz:cabeceraLista>
			        <cmz:itemCabeceraLista nombre="Artículo"></cmz:itemCabeceraLista>
			        <cmz:itemCabeceraLista nombre="Descripción"></cmz:itemCabeceraLista>
                    <c:if test="${!empty formularioInventario.tituloDesglose1}">
                      <cmz:itemCabeceraLista nombre="${formularioInventario.tituloDesglose1}"></cmz:itemCabeceraLista>
                    </c:if>
                    <c:if test="${!empty formularioInventario.tituloDesglose2}">
                      <cmz:itemCabeceraLista nombre="${formularioInventario.tituloDesglose2}"></cmz:itemCabeceraLista>
                    </c:if>
			        <cmz:itemCabeceraLista nombre="Cantidad" estilo="text-align: right;"></cmz:itemCabeceraLista>
			        <cmz:itemCabeceraLista nombre="Unidades" estilo="text-align: right;"></cmz:itemCabeceraLista>
			        <cmz:itemCabeceraLista nombre="Stock act." estilo="text-align: right;"></cmz:itemCabeceraLista>
			        <cmz:itemCabeceraLista nombre="Diferencia" estilo="text-align: right;"></cmz:itemCabeceraLista>
			      </cmz:cabeceraLista>			      
			      <cmz:contenidoLista variable="regularizaciones" lista="${inventario.regularizaciones}">
			        <cmz:itemContenidoLista valor="${regularizaciones.codArticulo}"></cmz:itemContenidoLista>
			        <cmz:itemContenidoLista valor="${regularizaciones.desArticulo}"></cmz:itemContenidoLista>
                    <c:if test="${!empty formularioInventario.tituloDesglose1}">
                      <cmz:itemContenidoLista valor="${regularizaciones.desglose1}"></cmz:itemContenidoLista>
                    </c:if>
                    <c:if test="${!empty formularioInventario.tituloDesglose2}">
			          <cmz:itemContenidoLista valor="${regularizaciones.desglose2}"></cmz:itemContenidoLista>
                    </c:if>
			        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${regularizaciones.cantidadMedida}" /></cmz:itemContenidoLista>
			        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${regularizaciones.cantidad + regularizaciones.stockActual}" /></cmz:itemContenidoLista>
			        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${regularizaciones.stockActual}" /></cmz:itemContenidoLista>
			        <cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${regularizaciones.cantidad}" /></cmz:itemContenidoLista>
			      </cmz:contenidoLista>
			    </cmz:lista>
			  </cmz:cuerpoPanel>
			</cmz:panel>			
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
