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
          setFoco("importePagado");
          pintaCalendario("fechaPago", "imgFechaPago");
        }
        
        function checkForm() {
        	if (!esValido("importePagado", "NUMERICO", true, 3, true)) {
                return false;
            }
           	if (!validarImporte()){
                return false;
            }
        	if (!esValido("codBancoPago", "TEXTO", true)) {
                return false;
            }
        	if(!esValido("fechaPago", "FECHA", true)) {
                return false;
            }
            
            return true;
        }
        
        function aceptar() {
          if(checkForm()) {
              document.getElementById("accion").value = "pagar";
              document.getElementById("frmDatos").submit();
          	_esperando();
          }
        }

        function validarImporte(){
            var importeMarcado = desformateaNumero(document.getElementById("importeMarcado").value);
            var importePagado = desformateaNumero(document.getElementById("importePagado").value);
            var aux = importeMarcado - importePagado;
            if(importePagado == 0){
            	alert("El importe pagado no puede ser 0.");
                setFoco("importePagado");
                document.getElementById("importePagado").select();
                return false;
            }
            else if (aux < 0){
                alert("El importe pagado no puede ser superior al importe marcado.");
                setFoco("importePagado");
                document.getElementById("importePagado").select();
                return false;
            }
            return true;
        }
    </script>
  </head>

  <body  onload="inicio();" onkeydown="keyDown(event);">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <cmz:accionSalvar onclick="aceptar();"/>
            <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver"></cmz:accion>            
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="pagos" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            <input id="estadoObjeto" name="estadoObjeto" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Pagar Vencimientos"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                   <td>Importe marcado:</td>
                    <td>
                      <cmz:campoTexto id="importeMarcado" editable="false" soloLectura="true" longitudMaxima="14" anchura="70">
                        <cmz:formateaNumero valor="${tratamientoPagos.importeMarcado}" numDecimales="2"></cmz:formateaNumero>
                      </cmz:campoTexto>
                    </td>
                    <td>Documentos:</td>
                    <td>
                      <cmz:campoTexto id="documentos" valor="${tratamientoPagos.numeroMarcados}" editable="false" 
                        soloLectura="true" longitudMaxima="20" anchura="100"/>
                    </td>
                  </tr>
                  
                  <tr>
                   <td>Importe pagado:</td>
                    <td>
                      <cmz:campoTexto id="importePagado" editable="${tratamientoPagos.numeroMarcados == 1}" soloLectura="${tratamientoPagos.numeroMarcados > 1}" longitudMaxima="14" anchura="70" requerido="true">
                        <c:if test="${tratamientoPagos.numeroMarcados > 1}">
                          <cmz:formateaNumero valor="${tratamientoPagos.importeMarcado}" numDecimales="2"/>
                        </c:if>
                      </cmz:campoTexto>
                    </td>
                  </tr>                  
                  
                  <tr>
                    <td>Banco:</td>
                    <td colspan="4">
                      <cmz:ayuda nombreAyuda="BANCOS" requerido="true" soloLectura="${!formularioDocumentoPago.editable}">
                        <cmz:codigoAyuda idCodigo="codBancoPago" valorCodigo="" longitudMaximaCodigo="11" anchuraCodigo="100px"/>
                        <cmz:descripcionAyuda idDescripcion="desBancoPago" valorDescripcion="" anchuraDescripcion="300px"  />
                      </cmz:ayuda>
                    </td>
                  </tr>
                  
                  <tr>
                   <td>Fecha pago:</td>
                   <td>
                      <cmz:campoFecha id="fechaPago" requerido="true" editable="${formularioDocumentoPago.editable}" soloLectura="${!formularioDocumentoPago.editable}" mostrarCheckbox="false"/>
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
