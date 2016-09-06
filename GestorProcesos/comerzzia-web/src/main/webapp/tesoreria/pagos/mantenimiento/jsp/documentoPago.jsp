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

<jsp:useBean id="formularioDocumentoPago" type="com.comerzzia.web.tesoreria.pagos.ui.FormularioDocumentoPagoBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="tratamientoPagos" value="${formularioDocumentoPago.registroActivo}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    
    <script type="text/javascript">
        function inicio() {
          setFoco("codProveedor");
          pintaCalendario("fechaVencimiento", "imgFechaVencimiento");
      	  <c:if test="${tratamientoPagos.estadoNuevo}">
      	    pintaCalendario("fechaFactura", "imgFechaFactura");
          </c:if>
          pintaCalendario("fechaEmision", "imgFechaEmision");
        }
        
        function checkForm() {
          if (!esValido("codProveedor", "TEXTO", true)) {
                return false;
            }
          if(!esValido("fechaVencimiento", "FECHA", true)) {
                return false;
            }
          if (!esValido("documento", "TEXTO", true)) {
                return false;
            }
          if (!esValido("importe", "NUMERICO", true)) {
                return false;
            }
          if (!esValido("codTipoEfecto", "TEXTO", true)) {
                return false;
            }
            return true;
        }

        function ayudaTiposEfectos() {
        	var rt = buscar('TIPOSEFECTOS','codTipoEfecto', 'desTipoEfecto');

            if (rt) {        
            	validarTipoEfecto();
            }
        }

        function obtenerFechaActual(){
        	var fecha = new Date();
            var dia = fecha.getDate();
            if (dia < 10){
                dia = "0" + dia;
            }
            var mes = fecha.getMonth() + 1;
            if (mes < 10){
                mes= "0" + mes;
            }
            var anyo = fecha.getFullYear();
            
            return dia + "/" + mes + "/" + anyo;
        }

        function validarTipoEfecto(){
        	if (document.getElementById("codTipoEfecto").value.length == 0) {
                return false;
            }
            
            var url = "tiposEfectos.cmz" +
                      "?codTipoEfecto=" + escape(document.getElementById("codTipoEfecto").value); 
            
            response = xmlRequest(url);

            if (response != null) {
                if (response.getElementsByTagName("ERROR").item(0)) {
                    alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
                    document.getElementById("codTipoEfecto").focus();
                    document.getElementById("codTipoEfecto").select();
                    
                    return false;
                }
                else {
                    // Establecemos código y descripción del artículo
                    document.getElementById("codTipoEfecto").value = response.getElementsByTagName("codTipoEfecto").item(0).firstChild.data;
                    document.getElementById("desTipoEfecto").value = response.getElementsByTagName("desTipoEfecto").item(0).firstChild.data;
                    
                    // Establecemos si será o no remesable según el tipo de efecto.
                    try {
                        if(response.getElementsByTagName("remesable").item(0).firstChild.data == 'S'){
                        	document.getElementById("remesable").value = 'S';
                        }
                    }
                    catch (e) {
                    	document.getElementById("remesable").value = 'N';
                    }

                    // Establecemos la fecha de llegada del documento a la actual.
                    try {
                        if(response.getElementsByTagName("entradaDocumentoAutomatica").item(0).firstChild.data == 'S' &&
                                 document.getElementById("fechaEmision").value.length == 0){

                            var fechaFormateada = obtenerFechaActual();
                        	document.getElementById("fechaEmision").value = fechaFormateada;
                        }
                    }
                    catch (ignore) {
                    }
                    
                    return true;
                }
            }
            else {
                alert("No se ha podido conectar con el servidor");
                alert(response.getElementsByTagName("ERROR").item(0).firstChild.data);
                document.getElementById("codTipoEfecto").focus();
                document.getElementById("codTipoEfecto").select();
                
                return false;
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
              <c:when test="${!formularioDocumentoPago.editable}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Documento"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir un nuevo Documento"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Documento"></cmz:accion>
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
          <form id="frmDatos" name="frmDatos" action="pagos" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${tratamientoPagos.documento.idPago}" />
            <input id="estadoObjeto" name="estadoObjeto" type="hidden" value="${tratamientoPagos.documento.estadoBean}" />
            <input id="indice" name="indice" type="hidden" value=""/>
            <input id="operacion" name="operacion" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Vencimiento"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Proveedor:</td>
                    <td>
                      <cmz:ayuda nombreAyuda="PROVEEDORES" requerido="true" soloLectura="${!formularioDocumentoPago.editable}">
                    <cmz:codigoAyuda idCodigo="codProveedor" valorCodigo="${tratamientoPagos.documento.codProveedor}" longitudMaximaCodigo="11" anchuraCodigo="100px"/>
                    <cmz:descripcionAyuda idDescripcion="desProveedor" valorDescripcion="${tratamientoPagos.documento.desProveedor}" anchuraDescripcion="300px"  />
                    </cmz:ayuda>
                    </td>
                  </tr>
                  
                  <tr>
                   <td>Vencimiento:</td>
                    <td>
                      <c:set var="fechaVencimiento"><fmt:formatDate pattern="dd/MM/yyyy" value="${tratamientoPagos.documento.fechaVencimiento}"/></c:set>
                      <cmz:campoFecha id="fechaVencimiento" valor="${fechaVencimiento}" requerido="true" editable="${formularioDocumentoPago.editable}" soloLectura="${!formularioDocumentoPago.editable}" mostrarCheckbox="false"/>
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Documento:</td>
                    <td>
                      <cmz:campoTexto id="codSerie" valor="${tratamientoPagos.documento.codSerie}" requerido="false" editable="${formularioDocumentoPago.editable}" 
                        soloLectura="${!formularioDocumentoPago.editable}" longitudMaxima="5" anchura="50"/>
                      <cmz:campoTexto id="documento" valor="${tratamientoPagos.documento.documento}" requerido="true" editable="${formularioDocumentoPago.editable}" 
                        soloLectura="${!formularioDocumentoPago.editable}" longitudMaxima="20" anchura="130"/>
                    </td>
                  </tr>
                  
                  <tr>
                   <td>Fecha factura:</td>
                   <td>
                      <cmz:campoFecha id="fechaFactura" editable="${formularioDocumentoPago.enInsercion}" soloLectura="${!formularioDocumentoPago.enInsercion}" mostrarCheckbox="false">
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${tratamientoPagos.documento.fechaFactura}"/>
                      </cmz:campoFecha>
                    </td>
                  </tr>
                  
                  <tr>
                   <td>Importe:</td>
                    <td>
                      <cmz:campoTexto id="importe" requerido="true" editable="${formularioDocumentoPago.enInsercion}" soloLectura="${!formularioDocumentoPago.enInsercion}" longitudMaxima="14" anchura="70">
                        <cmz:formateaNumero valor="${tratamientoPagos.documento.importe}" numDecimales="2"></cmz:formateaNumero>
                      </cmz:campoTexto>
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Tipo efecto:</td>
                    <td>
                      <cmz:ayuda nombreAyuda="TIPOSEFECTOS" requerido="true" soloLectura="${!formularioDocumentoPago.editable}" onclick="ayudaTiposEfectos();">
                        <cmz:codigoAyuda idCodigo="codTipoEfecto" valorCodigo="${tratamientoPagos.documento.codTipoEfecto}" onchange="validarTipoEfecto();" longitudMaximaCodigo="2" anchuraCodigo="30px"/>
                        <cmz:descripcionAyuda idDescripcion="desTipoEfecto" valorDescripcion="${tratamientoPagos.documento.desTipoEfecto}" anchuraDescripcion="300px"  />
                      </cmz:ayuda>
                    </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Remesa"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <input id="remesable" name="remesable" type="hidden" value=""/>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Fecha de emisión:</td>
                    <td>
                      <cmz:campoFecha id="fechaEmision" editable="${formularioDocumentoPago.editable}" soloLectura="${!formularioDocumentoPago.editable}" mostrarCheckbox="false">
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${tratamientoPagos.documento.fechaEmision}"/>
                      </cmz:campoFecha>
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Banco pago:</td>
                    <td colspan="2">
                      <cmz:ayuda nombreAyuda="BANCOS" soloLectura="${!formularioDocumentoPago.editable}">
                        <cmz:codigoAyuda idCodigo="codBancoPago" valorCodigo="${tratamientoPagos.documento.codBancoPago}" longitudMaximaCodigo="11" anchuraCodigo="100px"/>
                        <cmz:descripcionAyuda idDescripcion="desBancoPago" valorDescripcion="${tratamientoPagos.documento.desBancoPago}" anchuraDescripcion="300px"  />
                      </cmz:ayuda>
                    </td>
                  </tr>
                  
                  <c:if test="${tratamientoPagos.documento.idRemesa != null && tratamientoPagos.documento.idRemesa != 0}">
                  <tr>
                    <td>Remesa:</td>
                    <td>
                      <cmz:campoTexto id="idRemesa" valor="${tratamientoPagos.documento.idRemesa}" requerido="true" editable="false" 
                        soloLectura="true" longitudMaxima="20" anchura="100"/>
                    </td>
                  </tr>
                    
                  <tr>
                    <td>Fecha remesa:</td>
                    <td>
                      <cmz:campoFecha id="fechaRemesa" editable="false" soloLectura="true" mostrarCheckbox="false">
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${tratamientoPagos.documento.fechaRemesa}"/>
                      </cmz:campoFecha>
                    </td>
                  </tr>
                   </c:if>
                  
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel> 
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Observaciones"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <cmz:campoAreaTexto id="observaciones" anchura="100%" altura="100px" valor="${tratamientoPagos.documento.observaciones}" editable="${formularioDocumentoPago.editable}"
                   soloLectura="${!formularioDocumentoPago.editable}" longitudMaxima="255"/>
              </cmz:cuerpoPanel>
            </cmz:panel>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
