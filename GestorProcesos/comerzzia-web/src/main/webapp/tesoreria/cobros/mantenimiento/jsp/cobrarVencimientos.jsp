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
<c:set var="documentoCobro" value="${tratamientoCobros.documento}" />

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
          setFoco("importeCobrado");
          pintaCalendario("fechaCobro", "imgFechaCobro");
        }
        
        function checkForm() {
        	if (!esValido("importeCobrado", "NUMERICO", false)) {
                return false;
            }
        	if (!validarImporte()){
                return false;
            }
        	if (!esValido("codBancoCobro", "TEXTO", true)) {
                return false;
            }
        	if(!esValido("fechaCobro", "FECHA", true)) {
                return false;
            }
            
            return true;
        }
        
        function aceptar() {
          if(checkForm()) {
              document.getElementById("accion").value = "cobrar";
              document.getElementById("frmDatos").submit();
          	_esperando();
          }
        }

        function validarImporte(){
            var importeMarcado = desformateaNumero(document.getElementById("importeMarcado").value);
            var importeCobrado = desformateaNumero(document.getElementById("importeCobrado").value);
            var aux = importeMarcado - importeCobrado;
            if (aux < 0){
                alert("El importe cobrado no puede ser superior al importe marcado.");
                setFoco("importeCobrado");
                document.getElementById("importeCobrado").select();
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
          <form id="frmDatos" name="frmDatos" action="cobros" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            <input id="estadoObjeto" name="estadoObjeto" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Cobrar Vencimientos"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                   <td>Importe marcado:</td>
                    <td>
                      <cmz:campoTexto id="importeMarcado" editable="false" soloLectura="true" longitudMaxima="14" anchura="70">
                        <cmz:formateaNumero valor="${tratamientoCobros.importeMarcado}" numDecimales="2"></cmz:formateaNumero>
                      </cmz:campoTexto>
                    </td>
                    <td>Documentos:</td>
                    <td>
                      <cmz:campoTexto id="documentos" valor="${tratamientoCobros.numeroMarcados}" editable="false" 
                        soloLectura="true" longitudMaxima="20" anchura="100"/>
                    </td>
                  </tr>
                  
                  <tr>
                   <td>Importe cobrado:</td>
                    <td>
                      <cmz:campoTexto id="importeCobrado" editable="${tratamientoCobros.numeroMarcados == 1}" soloLectura="${tratamientoCobros.numeroMarcados > 1}" longitudMaxima="14" anchura="70">
                        <c:if test="${tratamientoCobros.numeroMarcados > 1}">
                          <cmz:formateaNumero valor="${tratamientoCobros.importeMarcado}" numDecimales="2"/>
                        </c:if>
                      </cmz:campoTexto>
                    </td>
                  </tr>                  
                  
                  <tr>
                    <td>Banco:</td>
                    <td colspan="4">
                      <cmz:ayuda nombreAyuda="BANCOS" requerido="true" soloLectura="${!formularioDocumentoCobro.editable}">
                        <cmz:codigoAyuda idCodigo="codBancoCobro" valorCodigo="" longitudMaximaCodigo="11" anchuraCodigo="100px"/>
                        <cmz:descripcionAyuda idDescripcion="desBancoCobro" valorDescripcion="" anchuraDescripcion="300px"  />
                      </cmz:ayuda>
                    </td>
                  </tr>
                  
                  <tr>
                   <td>Fecha cobro:</td>
                   <td>
                      <cmz:campoFecha id="fechaCobro" requerido="true" editable="${formularioDocumentoCobro.editable}" soloLectura="${!formularioDocumentoCobro.editable}" mostrarCheckbox="false"/>
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
