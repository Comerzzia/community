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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="formularioActualizacionTarifa" type="com.comerzzia.web.ventas.tarifas.actualizaciones.iu.FormularioActualizacionBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="actualizacion" value="${formularioActualizacionTarifa.registroActivo}" />

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
        	<c:choose>
              <c:when test="${formularioActualizacionTarifa.editable}">
                document.getElementById("descripcion").focus();
                pintaCalendario("fechaAplicacion","imgFechaAplicacion");
              </c:when>
              <c:otherwise>
                document.getElementById("desArtText").focus();
              </c:otherwise>
            </c:choose>
            
        }

        function checkForm() {
          if(!esValido("descripcion", "TEXTO", true)){
              return false;
          }
          if(!esValido("fechaAplicacion", "FECHA", false)){
              return false;
          }
            return true;
        }

        function consultarArticulos() {
          if(checkForm()) {
            document.getElementById("accion").value = "buscarArticulos";
            document.getElementById("operacion").value = "consultar";
            document.getElementById("frmDatos").submit();
            _esperando();
          }
        }

        function insercionMasivaArticulos() {
          document.getElementById("accion").value = "asistenteInsercion";
          document.getElementById("frmDatos").submit();
          _esperando();
        }

        function actualizacionMasivaArticulos() {
          document.getElementById("accion").value = "asistenteActualizacion";
          document.getElementById("frmDatos").submit();
          _esperando();
        }

    </script>
</head>

<body onload="inicio();" onkeydown="keyDown(event);">
<cmz:main>
  <cmz:panelCMZ>
    <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}"
      icono="${permisos.accionMenu.icono}">
      <cmz:acciones numAccionesVisibles="2">
        <c:choose>
          <c:when test="${!formularioActualizacionTarifa.editable}">
            <cmz:accion icono="comun/images/iconos/volver.gif"
              onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
            <c:if test="${permisos.puedeEditar}">
              <cmz:accion icono="comun/images/iconos/editar.gif"
                onclick="editar();" titulo="Editar" descripcion="Editar Actualizacion"></cmz:accion>
            </c:if>
            <c:if test="${permisos.puedeAñadir}">
              <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir una nueva Actualizacion"/>
            </c:if>
            <c:if test="${permisos.puedeEliminar}">
              <cmz:accion icono="comun/images/iconos/eliminar.gif"
                onclick="eliminar();" titulo="Eliminar"
                descripcion="Eliminar Actualizacion"></cmz:accion>
            </c:if>
            <c:if test="${permisos.puedeAñadir}">
              <cmz:accion icono="comun/images/iconos/altaMasiva.gif"
                onclick="insercionMasivaArticulos();" titulo="Inserción Masiva de Artículos"
                descripcion="Insertar artículos de forma masiva"></cmz:accion>
            </c:if>
            <c:if test="${permisos.puedeEditar}">
              <cmz:accion icono="comun/images/iconos/editar.gif"
                onclick="actualizacionMasivaArticulos();" titulo="Actualización Masiva de Artículos"
                descripcion="Actualizar artículos de forma masiva"></cmz:accion>
            </c:if>
          </c:when>
          <c:otherwise>
            <cmz:accionSalvar onclick="aceptar();"></cmz:accionSalvar>
            <cmz:accionCancelar onclick="cancelar();"/>
          </c:otherwise>
        </c:choose>
      </cmz:acciones>
    </cmz:cabeceraPanelCMZ>

    <cmz:cuerpoPanelCMZ>
      <cmz:mensaje />
      <form id="frmDatos" name="frmDatos" action="actualizacionesTarifas" method="post">
      <input id="accion" name="accion" type="hidden" value="" /> 
      <input id="idObjeto" name="idObjeto" type="hidden" value="${actualizacion.idActualizacion}" />
      <input id="idGrupoImpuesto" name="idGrupoImpuesto" type="hidden" value="${actualizacion.idGrupoImpuesto}" />
      <input id="idTratImpuestos" name="idTratImpuestos" type="hidden" value="${actualizacion.idTratImpuestos}" />
      <input id="operacion" name="operacion" type="hidden" value="" /> 
      <input id="indice" name="indice" type="hidden" value="" /> 
      
      <cmz:panel>
        <cmz:cabeceraPanel titulo="Datos de la Tarifa"></cmz:cabeceraPanel>
        <cmz:cuerpoPanel>
          <table cellpadding="2px" cellspacing="2px" border="0px">
            <tr>
              <td>Código:</td>
              <td><cmz:campoTexto id="codTar" valor="${actualizacion.codTar}"
                requerido="true" anchura="100px" longitudMaxima="11"
                editable="false"
                soloLectura="true" /></td>
            </tr>

            <tr>
              <td>Descripción:</td>
              <td><cmz:campoTexto id="desTar" valor="${actualizacion.desTar}"
                requerido="true" anchura="320px" longitudMaxima="45"
                editable="false"
                soloLectura="true"/></td>
            </tr>
            
          </table>
        </cmz:cuerpoPanel>
      </cmz:panel>
      
      <cmz:panel>
        <cmz:cabeceraPanel titulo="Datos de la Actualización"></cmz:cabeceraPanel>
        <cmz:cuerpoPanel>
          <table cellpadding="2px" cellspacing="2px" border="0px">
            <tr>
              <td>Descripción:</td>
              <td><cmz:campoTexto id="descripcion" valor="${actualizacion.descripcion}"
                requerido="true" anchura="320px" longitudMaxima="45"
                editable="${formularioActualizacionTarifa.editable}"
                soloLectura="${!formularioActualizacionTarifa.editable}" /></td>
            </tr>
            <tr>
              <td>Fecha Prevista Aplicación:</td>
              
              <td><cmz:campoFecha id="fechaAplicacion" longitudMaxima="10" anchura="100px" requerido="false" editable="${formularioActualizacionTarifa.editable}" soloLectura="${!formularioActualizacionTarifa.editable}" mostrarCheckbox="false">
                    <fmt:formatDate pattern="dd/MM/yyyy" value="${actualizacion.fechaPrevistaAplicacion}"/>
                  </cmz:campoFecha>
              </td>
            </tr>
          </table>
        </cmz:cuerpoPanel>
      </cmz:panel>
       
      <c:choose>
        <c:when test="${formularioActualizacionTarifa.pestañaActiva == 0}">
          <c:choose>
            <c:when test="${formularioActualizacionTarifa.formularioPestañaActiva.modoVisualizacionFicha}">
              <c:import url="articulosFicha.jsp"></c:import>
            </c:when>
            <c:otherwise>
              <c:import url="articulosTabla.jsp"></c:import>
            </c:otherwise>
          </c:choose>
        </c:when>
      </c:choose>


      </form>
    </cmz:cuerpoPanelCMZ>
  </cmz:panelCMZ>
</cmz:main>
</body>
</html>
