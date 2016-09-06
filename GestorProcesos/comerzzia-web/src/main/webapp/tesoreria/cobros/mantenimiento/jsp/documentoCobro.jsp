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

<jsp:useBean id="formularioDocumentoCobro" type="com.comerzzia.web.tesoreria.cobros.ui.FormularioDocumentoCobroBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="tratamientoCobros" value="${formularioDocumentoCobro.registroActivo}" />

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
        	setFoco("codCliente");
        	pintaCalendario("fechaVencimiento", "imgFechaVencimiento");
        	<c:if test="${tratamientoCobros.estadoNuevo}">
        	   pintaCalendario("fechaFactura", "imgFechaFactura");
            </c:if>
        	pintaCalendario("fechaEntradaDocumento", "imgFechaEntradaDocumento");
            
        }
        
        function checkForm() {
        	if (!esValido("codCliente", "TEXTO", true)) {
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
                        	document.getElementById("remesable").checked = true;
                        }
                    }
                    catch (e) {
                    	document.getElementById("remesable").checked = false;
                    }

                    // Establecemos la fecha de llegada del documento a la actual.
                    try {
                        if(response.getElementsByTagName("entradaDocumentoAutomatica").item(0).firstChild.data == 'S' &&
                                 document.getElementById("fechaEntradaDocumento").value.length == 0){

                            var fechaFormateada = obtenerFechaActual();
                        	document.getElementById("fechaEntradaDocumento").value = fechaFormateada;
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
              <c:when test="${!formularioDocumentoCobro.editable}">
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
          <form id="frmDatos" name="frmDatos" action="cobros" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${tratamientoCobros.documento.idCobro}" />
            <input id="estadoObjeto" name="estadoObjeto" type="hidden" value="${tratamientoCobros.documento.estadoBean}" />
            <input id="indice" name="indice" type="hidden" value=""/>
            <input id="operacion" name="operacion" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Vencimiento"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Cliente:</td>
                    <td>
                      <cmz:ayuda nombreAyuda="CLIENTES" requerido="true" soloLectura="${!formularioDocumentoCobro.editable}">
                		<cmz:codigoAyuda idCodigo="codCliente" valorCodigo="${tratamientoCobros.documento.codCliente}" longitudMaximaCodigo="11" anchuraCodigo="100px"/>
                		<cmz:descripcionAyuda idDescripcion="desCliente" valorDescripcion="${tratamientoCobros.documento.desCliente}" anchuraDescripcion="300px"  />
                	  </cmz:ayuda>
                    </td>
                  </tr>
                  
                  <tr>
                   <td>Vencimiento:</td>
                    <td>
                      <c:set var="fechaVencimiento"><fmt:formatDate pattern="dd/MM/yyyy" value="${tratamientoCobros.documento.fechaVencimiento}"/></c:set>
                      <cmz:campoFecha id="fechaVencimiento" valor="${fechaVencimiento}" requerido="true" editable="${formularioDocumentoCobro.editable}" soloLectura="${!formularioDocumentoCobro.editable}" mostrarCheckbox="false"/>
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Documento:</td>
                    <td>
                      <cmz:campoTexto id="codSerie" valor="${tratamientoCobros.documento.codSerie}" requerido="false" editable="${formularioDocumentoCobro.editable}" 
                        soloLectura="${!formularioDocumentoCobro.editable}" longitudMaxima="5" anchura="50"/>
                      <cmz:campoTexto id="documento" valor="${tratamientoCobros.documento.documento}" requerido="true" editable="${formularioDocumentoCobro.editable}" 
                        soloLectura="${!formularioDocumentoCobro.editable}" longitudMaxima="20" anchura="130"/>
                    </td>
                  </tr>
                  
                  <tr>
                   <td>Fecha factura:</td>
                   <td>
                      <cmz:campoFecha id="fechaFactura" editable="${formularioDocumentoCobro.enInsercion}" soloLectura="${!formularioDocumentoCobro.enInsercion}" mostrarCheckbox="false">
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${tratamientoCobros.documento.fechaFactura}"/>
                      </cmz:campoFecha>
                    </td>
                  </tr>
                  
                  <tr>
                   <td>Importe:</td>
                    <td>
                      <cmz:campoTexto id="importe" requerido="true" editable="${formularioDocumentoCobro.enInsercion}" soloLectura="${!formularioDocumentoCobro.enInsercion}" longitudMaxima="14" anchura="70">
                        <cmz:formateaNumero valor="${tratamientoCobros.documento.importe}" numDecimales="2"></cmz:formateaNumero>
                      </cmz:campoTexto>
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Tipo efecto:</td>
                    <td>
                      <cmz:ayuda nombreAyuda="TIPOSEFECTOS" requerido="true" soloLectura="${!formularioDocumentoCobro.editable}" onclick="ayudaTiposEfectos();">
                        <cmz:codigoAyuda idCodigo="codTipoEfecto" valorCodigo="${tratamientoCobros.documento.codTipoEfecto}" onchange="validarTipoEfecto();" longitudMaximaCodigo="2" anchuraCodigo="30px"/>
                        <cmz:descripcionAyuda idDescripcion="desTipoEfecto" valorDescripcion="${tratamientoCobros.documento.desTipoEfecto}" anchuraDescripcion="300px"  />
                      </cmz:ayuda>
                    </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Remesa"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Fecha Aceptación documento:</td>
                    <td>
                      <cmz:campoFecha id="fechaEntradaDocumento" editable="${formularioDocumentoCobro.editable}" soloLectura="${!formularioDocumentoCobro.editable}" mostrarCheckbox="false">
                        <fmt:formatDate pattern="dd/MM/yyyy" value="${tratamientoCobros.documento.fechaEntradaDocumento}"/>
                      </cmz:campoFecha>
                    </td>
                    <td>
                      <input type="checkbox" id="remesable" name="remesable" value="" 
                        <c:if test="${tratamientoCobros.documento.remesable}">checked="checked"</c:if>
                        <c:if test="${!formularioDocumentoCobro.editable}">disabled</c:if>/>Remesable
                    </td>
                  </tr>
                  
                  <tr>
                    <td>Banco cobro:</td>
                    <td colspan="2">
                      <cmz:ayuda nombreAyuda="BANCOS" soloLectura="${!formularioDocumentoCobro.editable}">
                        <cmz:codigoAyuda idCodigo="codBancoCobro" valorCodigo="${tratamientoCobros.documento.codBancoCobro}" longitudMaximaCodigo="11" anchuraCodigo="100px"/>
                        <cmz:descripcionAyuda idDescripcion="desBancoCobro" valorDescripcion="${tratamientoCobros.documento.desBancoCobro}" anchuraDescripcion="300px"  />
                      </cmz:ayuda>
                    </td>
                  </tr>
                  
                  <c:if test="${tratamientoCobros.documento.idRemesa != null && tratamientoCobros.documento.idRemesa != 0}">
                  <tr>
                      <td>Remesa:</td>
                      <td>
                        <cmz:campoTexto id="idRemesa" valor="${tratamientoCobros.documento.idRemesa}" requerido="true" editable="false" 
                          soloLectura="true" longitudMaxima="20" anchura="100"/>
                      </td>
                    </tr>
                    
                    <tr>
                      <td>Fecha remesa:</td>
                      <td>
                        <cmz:campoFecha id="fechaRemesa" editable="false" soloLectura="true" mostrarCheckbox="false">
                          <fmt:formatDate pattern="dd/MM/yyyy" value="${tratamientoCobros.documento.fechaRemesa}"/>
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
                <cmz:campoAreaTexto id="observaciones" anchura="100%" altura="100px" valor="${tratamientoCobros.documento.observaciones}" editable="${formularioDocumentoCobro.editable}"
                   soloLectura="${!formularioDocumentoCobro.editable}" longitudMaxima="255"/>
              </cmz:cuerpoPanel>
            </cmz:panel>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
