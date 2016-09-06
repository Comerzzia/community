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
<%@ taglib prefix="cmz" uri="/WEB-INF/tlds/cmz.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="formularioPorcentajeImpuestos" type="com.comerzzia.web.core.impuestos.porcentajes.ui.FormularioPorcentajeImpuestosBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="porcentaje" value="${formularioPorcentajeImpuestos.registroActivo}" />

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
            setFoco("porcentaje");
            <c:if test="${formularioPorcentajeImpuestos.enInsercion}">
              pintaCalendario("vigenciaDesde", "imgVigenciaDesde");
            </c:if>
        }
        
        function checkForm() {
            enEdicion = '<c:out value="${formularioPorcentajeImpuestos.enInsercion}"/>';
            
            <c:choose>
              <c:when test="${formularioPorcentajeImpuestos.enEdicion}">
                  if (!esValido("porcentaje", "NUMERICO", true, 2, true, -999, 999)) {
                      return false;
                  }
                  if (!esValido("porcentajeRecargo", "NUMERICO", true, 2, true, -999, 999)) {
                      return false;
                  }
              </c:when>
              <c:otherwise>
                if (!esValido("vigenciaDesde", "FECHA", true)) {
                    return false;
                }
              </c:otherwise>
            </c:choose>
            
            
            return true;
        }
     </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <c:choose>
              <c:when test="${!formularioPorcentajeImpuestos.editable}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Artículo"></cmz:accion>
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
          <form id="frmDatos" name="frmDatos" action="porcentajes" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>
            <input id="idObjeto" name="idObjeto" type="hidden" value="${porcentaje.idGrupoImpuestos}" />
            <input id="idTratamiento" name="idTratamiento" type="hidden" value="${porcentaje.idTratImpuestos}" />
            <input id="codImpuestos" name="codImpuestos" type="hidden" value="${porcentaje.codImp}" />
            <c:out value=""></c:out>
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Cuadro de Impuestos"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Vigencia:</td>
                    <td>
                      <c:set var="vigenciaDesde"><fmt:formatDate pattern="dd/MM/yyyy" value="${porcentaje.vigenciaDesde}"/></c:set>
                      <cmz:campoFecha id="vigenciaDesde" valor="${vigenciaDesde}" requerido="true" anchura="90px" longitudMaxima="10"
                                        editable="${formularioPorcentajeImpuestos.enInsercion}" soloLectura="${!formularioPorcentajeImpuestos.enInsercion}"/>
                    </td>
                  </tr>
                  <c:if test="${!formularioPorcentajeImpuestos.enInsercion}">
                  <tr>
                    <td>Tratamiento:</td>
                    <td>
                      <cmz:campoTexto id="desTratamientoImpuesto" valor="${porcentaje.desTratamientoImpuesto}" requerido="true" anchura="300px" longitudMaxima="45" 
                                        editable="false" soloLectura="true"/>
                    </td>
                    <td>
                      <input type="checkbox" id="aplicaRecargo" name="aplicaRecargo"  value="" <c:if test="${porcentaje.aplicaRecargo}">checked="checked"</c:if> disabled="disabled" />Aplica Recargo
                    </td>
                  </tr>
                  </c:if>
            	</table>
              </cmz:cuerpoPanel>
            </cmz:panel>      
            
            <c:if test="${!formularioPorcentajeImpuestos.enInsercion}">  
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos del Porcentaje"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                  <td>Tipo de impuesto:</td>
                    <td>
                      <cmz:campoTexto id="desImpuesto" valor="${porcentaje.desImpuesto}" requerido="true" anchura="300px" longitudMaxima="45" 
                                        editable="false" soloLectura="true"/>
                    </td>
                  </tr>
                  <tr>
                  <td>Porcentaje:</td>
                    <td>
                      <c:set var="porcentajes"><cmz:formateaNumero valor="${porcentaje.porcentaje}"/></c:set>
                      <cmz:campoTexto id="porcentaje" valor="${porcentajes}" requerido="true" anchura="90px" longitudMaxima="13" 
                                        editable="${formularioPorcentajeImpuestos.editable}" soloLectura="${!formularioPorcentajeImpuestos.editable}"/>
                    </td>
                  </tr>
                  <tr>
					<td>Recargo:</td>
                    <td>
                      <c:set var="porcentajeRecargo"><cmz:formateaNumero valor="${porcentaje.porcentajeRecargo}"/></c:set>
                      <cmz:campoTexto id="porcentajeRecargo" valor="${porcentajeRecargo}" requerido="true" anchura="90px" longitudMaxima="13" 
                                        editable="${formularioPorcentajeImpuestos.editable && porcentaje.aplicaRecargo}" soloLectura="${!formularioPorcentajeImpuestos.editable || !porcentaje.aplicaRecargo}"/>
                    </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
			</c:if>
            
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
