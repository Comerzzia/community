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

<jsp:useBean id="formularioPromocion" type="com.comerzzia.web.ventas.promociones.ui.FormularioPromocionBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<c:set var="promocion" value="${formularioPromocion.registroActivo}" />

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
        	setFoco("codArt", "descripcion");
            <c:if test="${formularioPromocion.editable && !promocion.activa}">
            pintaCalendario("fechaInicio", "imgFechaInicio");
            pintaCalendario("fechaFin", "imgFechaFin");
            </c:if>
            <c:if test="${formularioPromocion.formularioPestañaActiva.modoVisualizacionFicha && formularioPromocion.formularioPestañaActiva.editable && promocion.activa}">
            pintaCalendario("fechaInicioArt", "imgFechaInicioArt");
            pintaCalendario("fechaFinArt", "imgFechaFinArt");
            </c:if>
        }
        
        function checkForm() {
        	if(!esValido("descripcion", "TEXTO", true))
            	return false;
        	if(!esValido("codTar", "AYUDA", true, "desTar", "TARIFAS"))
                return false;
        	if(!esValido("fechaInicio", "FECHA", true))
                return false;
            if(!esValido("fechaFin", "FECHA", true))
                return false;
            if(!validarFechaMenorIgual(document.getElementById("fechaInicio").value, document.getElementById("fechaFin").value)){
	        	alert("La fecha de inicio no puede ser mayor a la fecha de fin");
	        	return false;
	        }
            
            return true;
        }
        
        function consultarArticulos() {
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("operacion").value = "consultarArticulos";
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }

        function activar(accion){
            if(accion == 1){
                if(confirm("¿Está seguro de que desea activar la promoción?")){
        			document.getElementById("accion").value = "activar";
        			document.getElementById("frmDatos").submit();
        			_esperando();
                }
            }else{
            	abrirVentana("anular.promocion.screen?operacion=anular", 200, 300);
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
              <c:when test="${!formularioPromocion.editable}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeEditar}">
                  <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editar();" titulo="Editar" descripcion="Editar Promocion"></cmz:accion>
                </c:if>                 	
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir una nueva Promocion"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Promocion"></cmz:accion>
                </c:if>
                <c:if test="${!promocion.finalizada}">
	              <c:choose>
	              	<c:when test="${!promocion.activa}">
	              		<cmz:accion icono="comun/images/iconos/aceptar.gif" onclick="activar(1);" titulo="Activar" descripcion="Activar Promocion"></cmz:accion>
	                </c:when>
	                <c:otherwise>
	                	<cmz:accion icono="comun/images/iconos/error.gif" onclick="activar(0);" titulo="Anular" descripcion="Anular Promocion"></cmz:accion>
	                </c:otherwise>
	              </c:choose>
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
          <form id="frmDatos" name="frmDatos" action="promociones" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${promocion.idPromocion}" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value="" />
            <input id="idGrupoImpuesto" name="idGrupoImpuesto" type="hidden" value="" />
			<input id="idTratImpuestos" name="idTratImpuestos" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos de la Promocion"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
                  <tr>
                    <td>Descripción:</td>
                    <td colspan="3">
                    	<cmz:campoTexto id="descripcion" valor="${promocion.descripcion}" requerido="true" anchura="300px" longitudMaxima="50" 
                             editable="${formularioPromocion.editable && !promocion.activa}" soloLectura="${!formularioPromocion.editable || promocion.activa}"/>
                    </td>
                    <c:if test="${!formularioPromocion.enInsercion}">
	                    <td width="30px"></td> <!-- SEPARADOR -->
	                    <td>Estado:</td>
	                    <td>
	                    	<c:choose>
	                    		<c:when test="${promocion.finalizada}">
	                    			<c:out value="Finalizada"></c:out>
	                    		</c:when>
	                    		<c:otherwise>
	                    		  <c:choose>
	                    			<c:when test="${!promocion.activa}">
	                    				<c:out value="Sin activar"></c:out>
	                    			</c:when>
	                    			<c:otherwise>
	                    				<c:out value="Activa"></c:out>
	                    			</c:otherwise>
	                    		  </c:choose>
	                    		</c:otherwise>
	                    	</c:choose>
	                    </td>
                    </c:if>
                  </tr>
                  <tr>
                    <td>Tarifa:</td>
                    <td colspan="3">
                    	<cmz:ayuda requerido="${formularioPromocion.enInsercion}" soloLectura="${!formularioPromocion.enInsercion}" nombreAyuda="TARIFAS">
				          	<cmz:codigoAyuda idCodigo="codTar" valorCodigo="${promocion.codTar}" anchuraCodigo="100px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
				          	<cmz:descripcionAyuda idDescripcion="desTar" valorDescripcion="${promocion.desTar}" anchuraDescripcion="200px"></cmz:descripcionAyuda>
				        </cmz:ayuda>
					</td>
                  </tr>
                  <tr>
                    <td>Fecha Inicio:</td>
                    <td>
                    	<c:set var="fechaInicio"><fmt:formatDate pattern="dd/MM/yyyy" value="${promocion.fechaInicio}"/></c:set>
                        <cmz:campoFecha id="fechaInicio" valor="${fechaInicio}" requerido="true"
                        	editable="${formularioPromocion.editable && !promocion.activa}" soloLectura="${!formularioPromocion.editable || promocion.activa}" />
                    </td>
                    <td>Fecha Fin:</td>
                    <td>
                    	<c:set var="fechaFin"><fmt:formatDate pattern="dd/MM/yyyy" value="${promocion.fechaFin}"/></c:set>
                        <cmz:campoFecha id="fechaFin" valor="${fechaFin}" requerido="true"
                        	editable="${formularioPromocion.editable && !promocion.activa}" soloLectura="${!formularioPromocion.editable || promocion.activa}" />
                    </td>
                  </tr>
                  <tr>
                  	<td></td>
                  	<td colspan="3">
                      	<input type="checkbox" value="" id="soloFidelizacion" name="soloFidelizacion" 
                      		<c:if test="${promocion.soloFidelizacion}">checked="checked"</c:if> 
                            <c:if test="${!formularioPromocion.editable || promocion.activa}">disabled</c:if> />
                      	Promoción exclusiva para clientes fidelizados
                    </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <c:if test="${!formularioPromocion.enInsercion}">
	            <c:choose>
			        <c:when test="${formularioPromocion.formularioPestañaActiva.modoVisualizacionFicha}">
			            <c:import url="articulosPromocionFicha.jsp"></c:import>
			        </c:when>
			        <c:otherwise>
			            <c:import url="articulosPromocionTabla.jsp"></c:import>
			        </c:otherwise>
			    </c:choose>
			</c:if>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
