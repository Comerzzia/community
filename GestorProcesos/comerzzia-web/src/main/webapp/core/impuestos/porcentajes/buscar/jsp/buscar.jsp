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

<jsp:useBean id="paramBuscarPorcentajeImpuestos" type="com.comerzzia.persistencia.core.impuestos.porcentajes.ParametrosBuscarPorcentajesImpuestosBean" scope="session" />
<jsp:useBean id="paginaResultados" class="com.comerzzia.util.paginacion.PaginaResultados" scope="request" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />


<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    
    <script type="text/javascript">
        function imprimir(){
            document.getElementById("accion").value = "general.articulos.lstArticulos";
            document.getElementById("operacion").value = "nuevo";
			document.getElementById("frmDatos").submit();
			_esperando();
		}

        function editarPorcentaje(idGrupoImpuestos, idTratamientoImpuestos, codImpuestos) {
        	document.getElementById("accion").value = "editar";
        	if (idGrupoImpuestos != null) {
        		document.getElementById("idObjeto").value = idGrupoImpuestos;
        		document.getElementById("idTratamiento").value = idTratamientoImpuestos;
        		document.getElementById("codImpuestos").value = codImpuestos;
        	}
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }

        function verPorcentaje(idGrupoImpuestos, idTratamientoImpuestos, codImpuestos) {        	
        	document.getElementById("accion").value = "ver";
        	if (idGrupoImpuestos != null ) {
        		document.getElementById("idObjeto").value = idGrupoImpuestos;
        		document.getElementById("idTratamiento").value = idTratamientoImpuestos;
        		document.getElementById("codImpuestos").value = codImpuestos;
        	}
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }

        function checkForm() {
        	if(!esValido("idGrupoImpuestos", "TABLA", true, "vigencia"))
            	return false;
        	if(!esValido("idTratamientoImpuestos", "TABLA", true, "tratamiento de impuestos"))
            	return false;

            return true;
        }
    </script>
  </head>

  <body>
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="1">
            <c:if test="${permisos.puedeAñadir}">
              <cmz:accionNuevoRegistro onclick="alta();" descripcion="Alta de un nuevo grupo de impuestos"/>
            </c:if>
            <cmz:accion titulo="Ver Permisos" icono="comun/images/iconos/permisos.gif" descripcion="Ver permisos efectivos del usuario" onclick="verPermisos(${permisos.accionMenu.idAccion})" />
            <c:if test="${permisos.puedeAdministrar}">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </c:if>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="porcentajes" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="columna" name="columna" type="hidden" value="" />
            <input id="pagina" name="pagina" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="" />
            <input id="idTratamiento" name="idTratamiento" type="hidden" value="" />
            <input id="codImpuestos" name="codImpuestos" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Búsqueda de Cuadro de Impuestos"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="0px" cellspacing="0px" border="0px">
                  <tr>
                    <td>
                      <table cellpadding="2px" cellspacing="2px" border="0px">
                        <tr>
                          <td>Vigencia:</td>
                          <td>
                            <cmz:ayuda requerido="true" nombreAyuda="GRUPOS_IMPUESTOS">
          					  <cmz:codigoAyuda idCodigo="idGrupoImpuestos" valorCodigo="${paramBuscarPorcentajeImpuestos.idGrupoImpuestos}" anchuraCodigo="90px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
          					  <cmz:descripcionAyuda idDescripcion="vigenciaDesde" valorDescripcion="${paramBuscarPorcentajeImpuestos.vigenciaDesde}" anchuraDescripcion="300px" editable="true"></cmz:descripcionAyuda>
          				  	</cmz:ayuda>
                            
                          </td>

                        
                          <!-- Separador del botón -->
                          <td width="150px"></td>
		                  
		                  <td>
	                        <cmz:botonConsultar onclick="consultar();"/>
	                      </td>
                        </tr>
                        
                        <tr>
                          <td>Tratamiento:</td>
                          <td>
                            <cmz:ayuda requerido="true" nombreAyuda="TRATAMIENTO_IMP">
          					  <cmz:codigoAyuda idCodigo="idTratamientoImpuestos" valorCodigo="${paramBuscarPorcentajeImpuestos.idTratamientoImpuestos}" anchuraCodigo="90px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
          					  <cmz:descripcionAyuda idDescripcion="desTratamiento" valorDescripcion="${paramBuscarPorcentajeImpuestos.desTratamiento}" anchuraDescripcion="300px" editable="true"></cmz:descripcionAyuda>
          				  	</cmz:ayuda> 
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <c:choose>
              <c:when test="${paginaResultados.pagina != null}">
                <cmz:panel>
                  <cmz:cabeceraPanelResultados titulo="Porcentajes" numPorPagina="${paginaResultados.tamañoPagina}"></cmz:cabeceraPanelResultados>
                  <cmz:cuerpoPanel>
                    <cmz:listaPaginada>
                      <cmz:cabeceraListaPaginada ordenActual="${paramBuscarPorcentajeImpuestos.orden}">
                        <cmz:itemCabeceraListaPaginada nombre="Tipo Impuesto" columna="1" ordenColumna="DESIMP"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Porcentaje" columna="2" ordenColumna="PORCENTAJE" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Recargo" columna="3" ordenColumna="PORCENTAJE_RECARGO" estilo="text-align: right;"></cmz:itemCabeceraListaPaginada>
                        <cmz:itemCabeceraListaPaginada nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraListaPaginada>
                      </cmz:cabeceraListaPaginada>
                      <cmz:contenidoListaPaginada variable="porcentaje" paginaResultados="${paginaResultados}">
                        <cmz:itemContenidoListaPaginada valor="${porcentaje.desImpuesto}" onclick="verPorcentaje(${porcentaje.idGrupoImpuestos}, ${porcentaje.idTratImpuestos}, ${porcentaje.codImp});"></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="right"><cmz:formateaNumero valor="${porcentaje.porcentaje}"/></cmz:itemContenidoListaPaginada>
                        <cmz:itemContenidoListaPaginada alineacion="right"><cmz:formateaNumero valor="${porcentaje.porcentajeRecargo}"/></cmz:itemContenidoListaPaginada>
                        <cmz:acciones alineacion="center">
                          <cmz:accion icono="comun/images/iconos/ver.gif" onclick="verPorcentaje(${porcentaje.idGrupoImpuestos}, ${porcentaje.idTratImpuestos}, ${porcentaje.codImp});" descripcion="Ver Porcentaje"></cmz:accion>
                          <c:if test="${permisos.puedeEditar}">
                            <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editarPorcentaje(${porcentaje.idGrupoImpuestos}, ${porcentaje.idTratImpuestos}, ${porcentaje.codImp});" descripcion="Editar Porcentaje"></cmz:accion>
                          </c:if>                          
                        </cmz:acciones>
                      </cmz:contenidoListaPaginada>
                    </cmz:listaPaginada>
                  </cmz:cuerpoPanel>
                </cmz:panel>
              </c:when>
            </c:choose>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
