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
<c:set var="documentoPago" value="${tratamientoPagos.documento}" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/mantenimiento.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    
    <script type="text/javascript">
        function inicio() {
      	 <c:if test="${tratamientoPagos.importeMarcado != tratamientoPagos.importeAgrupado}">
          setFoco("fechaVencimiento");
          pintaCalendario("fechaVencimiento", "imgFechaVencimiento");
         </c:if>
        }
        
        function checkForm() {
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
        
        function agrupar() {
        	document.getElementById("accion").value = "agrupar";
            document.getElementById("frmDatos").submit();
        	_esperando();
        }

        function agregarDocumento() {
        	if(checkForm()) {
              document.getElementById("accion").value = "agregarDocumento";
              document.getElementById("frmDatos").submit();
          	  _esperando();
           }
        }

        function borrar(indice) {
        	document.getElementById("indice").value = indice;
        	document.getElementById("accion").value = "eliminarDocumentoAgrupado";
            document.getElementById("frmDatos").submit();
        	_esperando();
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

  <body  onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <c:if test="${tratamientoPagos.importeMarcado == tratamientoPagos.importeAgrupado}">
              <cmz:accion icono="comun/images/iconos/aceptar.gif" onclick="agrupar();" titulo="Agrupar"></cmz:accion>          
            </c:if>
            <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver"></cmz:accion>            
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="pagos" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value="" />
            <input id="codProveedor" name="codProveedor" type="hidden" value="${tratamientoPagos.codProveedor}" />
            <input id="remesable" name="remesable" type="hidden" value="" />
            
            <c:if test="${tratamientoPagos.importeMarcado != tratamientoPagos.importeAgrupado}">
              <cmz:panel>
                  <cmz:cabeceraPanel titulo="Agregar Documento">
                    <cmz:acciones>
                      <cmz:accion icono="comun/images/iconos/aceptar.gif" onclick="agregarDocumento();" titulo="Agregar"></cmz:accion>
                    </cmz:acciones>
                  </cmz:cabeceraPanel>
                  <cmz:cuerpoPanel>
                    <table cellpadding="2px" cellspacing="2px" border="0px" width="100%">
                      <tr>
                       <td>Vencimiento:</td>
                        <td>
                          <c:set var="fechaVencimiento"><fmt:formatDate pattern="dd/MM/yyyy" value="${documentoPago.fechaVencimiento}"/></c:set>
                          <cmz:campoFecha id="fechaVencimiento" valor="${fechaVencimiento}" requerido="true" editable="${formularioDocumentoPago.editable}" soloLectura="${!formularioDocumentoPago.editable}" mostrarCheckbox="false"/>
                        </td>
                      </tr>
                      
                      <tr>
                        <td>Documento:</td>
                        <td>
                          <cmz:campoTexto id="codSerie" valor="${documentoPago.codSerie}" editable="${formularioDocumentoPago.editable}" 
                            soloLectura="${!formularioDocumentoPago.editable}" longitudMaxima="5" anchura="50"/>
                          <cmz:campoTexto id="documento" valor="${documentoPago.documento}" requerido="true" editable="${formularioDocumentoPago.editable}" 
                            soloLectura="${!formularioDocumentoPago.editable}" longitudMaxima="20" anchura="100"/>
                        </td>
                      </tr>
                      
                      <tr>
                       <td>Importe:</td>
                        <td>
                          <cmz:campoTexto id="importe" editable="${formularioDocumentoPago.editable}" requerido="true" soloLectura="${!formularioDocumentoPago.editable}" 
                            longitudMaxima="14" anchura="70">
                            <cmz:formateaNumero valor="${documentoPago.importe}" numDecimales="2"></cmz:formateaNumero>
                          </cmz:campoTexto>
                        </td>
                      </tr>
                      
                      
                      <tr>
                        <td>Tipo efecto:</td>
                        <td>
                          <cmz:ayuda nombreAyuda="TIPOSEFECTOS" onclick="ayudaTiposEfectos()" soloLectura="${!formularioDocumentoPago.editable}" requerido="true">
                            <cmz:codigoAyuda idCodigo="codTipoEfecto" valorCodigo="${documentoPago.codTipoEfecto}" onchange="validarTipoEfecto()" longitudMaximaCodigo="2" anchuraCodigo="30px"/>
                            <cmz:descripcionAyuda idDescripcion="desTipoEfecto" valorDescripcion="${documentoPago.desTipoEfecto}" anchuraDescripcion="300px"  />
                          </cmz:ayuda>
                        </td>
                      </tr>
                      
                      <tr>
                        <td width="80">Observaciones:</td>
                        <td colspan="3">
                          <cmz:campoAreaTexto id="observaciones" valor="${documentoPago.observaciones}" longitudMaxima="255" anchura="100%" altura="100px"></cmz:campoAreaTexto>
                        </td>
                      </tr>
                    </table>
                  </cmz:cuerpoPanel>
                </cmz:panel>
            </c:if>
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Vencimientos"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <cmz:lista>
                  <cmz:cabeceraLista>
                    <cmz:itemCabeceraLista nombre="Vencimiento" columna="1"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Importe" columna="2"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Serie" columna="3"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Documento" columna="4"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Tipo Efecto" columna="5"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Descripción" columna="6"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Observaciones" columna="7"></cmz:itemCabeceraLista>
                    <cmz:itemCabeceraLista nombre="Acciones" estilo="text-align:center;"></cmz:itemCabeceraLista>
                  </cmz:cabeceraLista>
                  <cmz:contenidoLista variable="documento" lista="${tratamientoPagos.agrupados}">
                    <cmz:itemContenidoLista><fmt:formatDate value="${documento.fechaVencimiento}" pattern="dd/MM/yyyy"/></cmz:itemContenidoLista>
                    <cmz:itemContenidoListaPaginada><cmz:formateaNumero valor="${documento.importe}" numDecimales="2"/></cmz:itemContenidoListaPaginada>
                    <cmz:itemContenidoLista valor="${documento.codSerie}"></cmz:itemContenidoLista>
                    <cmz:itemContenidoLista valor="${documento.documento}"></cmz:itemContenidoLista>
                    <cmz:itemContenidoLista valor="${documento.codTipoEfecto}"></cmz:itemContenidoLista>
                    <cmz:itemContenidoLista valor="${documento.desTipoEfecto}"></cmz:itemContenidoLista>
                    <cmz:itemContenidoLista valor="${documento.observaciones}"></cmz:itemContenidoLista>
                    <cmz:acciones alineacion="center">
                      <cmz:accion onclick="borrar(${indice})" icono="comun/images/iconos/eliminar.gif" descripcion="Borrar vencimiento"></cmz:accion>
                    </cmz:acciones>
                  </cmz:contenidoLista>
                </cmz:lista>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Totales"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px" width="100%">
                  <tr>
                    <td width="180px">Importe de vencimientos marcados:</td>
                    <td>
                      <c:set var="marcado"><cmz:formateaNumero valor="${tratamientoPagos.importeMarcado}"/></c:set>
                      <cmz:campoTexto id="importeMarcados" valor="${marcado}" editable="false" soloLectura="true" longitudMaxima="13" anchura="100"/>
                    </td>
                    <td width="150px">Importe nuevos vencimientos:</td>
                    <td>
                      <c:set var="agregado"><cmz:formateaNumero valor="${tratamientoPagos.importeAgrupado}"/></c:set>
                      <cmz:campoTexto id="importeNuevos" valor="${agregado}" editable="false" soloLectura="true" longitudMaxima="13" anchura="100"/>
                    </td>
                    <td width="60px">Pendiente:</td>
                    <td>
                      <c:set var="pendiente"><cmz:formateaNumero valor="${tratamientoPagos.importePendiente}" numDecimales="2"/></c:set>
                      <cmz:campoTexto id="pendiente" valor="${pendiente}" editable="false" soloLectura="true" longitudMaxima="13" anchura="100"/>
                    </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
