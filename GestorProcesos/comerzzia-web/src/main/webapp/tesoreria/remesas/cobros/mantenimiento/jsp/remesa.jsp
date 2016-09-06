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

<jsp:useBean id="formularioRemesaCobro" type="com.comerzzia.web.tesoreria.remesas.cobros.ui.FormularioRemesaCobroBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />
<jsp:useBean id="totales" class="com.comerzzia.persistencia.tesoreria.cobros.totales.TotalesDocumentosCobrosBean" scope="request" />

<c:set var="remesa" value="${formularioRemesaCobro.registroActivo}" />

<c:choose>
  <c:when test="${remesa.estado == remesa.ESTADO_REMESA}">
	<c:set var="estado" value="remesa"></c:set>
  </c:when>
  <c:otherwise>
	<c:set var="estado" value="preremesa"></c:set>
  </c:otherwise>
</c:choose>	

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/calendario.js"></script>
    
    <script type="text/javascript">
        function inicio() {
        	setFoco("codBanco");
        	<c:if test="${formularioRemesaCobro.enInsercion}">
	        	pintaCalendario("fechaRemesa", "imgFechaRemesa");
        	</c:if>
        }
        
        function checkForm() {
            <c:if test="${formularioRemesaCobro.enInsercion}">
	        	if(!esValido("codBanco", "AYUDA", true, "desBanco", "BANCOS")) {
	    			return false;
	    		}
		        if(!esValido("fechaRemesa", "FECHA", true)){
		            return false;
		        }
           </c:if>
            
           return true;
        }
    
        function agregarDocumentos() {
        	document.getElementById("accion").value = "buscarDocumentos";
    	    document.getElementById("frmDatos").submit();
    		_esperando();
        }

        function eliminarRegistro(idObjeto) {
        	if(confirm('¿Está seguro de que desea quitar el documento de la <c:out value="${estado}"/>?')) {
        		document.getElementById("accion").value = "quitarDocumento";
        		if (idObjeto != null) {
        			document.getElementById("idObjeto").value = idObjeto;
        		}
        		document.getElementById("frmDatos").submit();
        		_esperando();
        	}
        }
        
        function generarDevolucion() {
       		document.getElementById("accion").value = "generarDevolucionDocumento";
       		document.getElementById("frmDatos").submit();
       		_esperando();
        }

        function convertirRemesa() {
        	if(confirm("¿Está seguro de que desea convertir a remesa?")) {
        		document.getElementById("accion").value = "convertirPreremesa";
        		document.getElementById("frmDatos").submit();
        		_esperando();
        	}
        }
     </script>
  </head>

  <body  onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="2">
            <c:choose>
              <c:when test="${formularioRemesaCobro.enInsercion}">
                <cmz:accionSalvar onclick="aceptar();"/>
                <cmz:accionCancelar onclick="cancelar();"/>
              </c:when>
              <c:when test="${!formularioRemesaCobro.enInsercion && !formularioRemesaCobro.editable}">
                <cmz:accion icono="comun/images/iconos/volver.gif" onclick="volver();" titulo="Volver" descripcion="Volver"></cmz:accion>
                <c:if test="${permisos.puedeAñadir}">
                  <cmz:accionNuevoRegistro onclick="alta();" descripcion="Añadir una nueva Remesa"/>
                </c:if>
                <c:if test="${permisos.puedeEliminar}">
                  <cmz:accion icono="comun/images/iconos/eliminar.gif" onclick="eliminar();" titulo="Eliminar" descripcion="Eliminar Remesa"></cmz:accion>
                </c:if>
                <c:if test="${permisos.puedeEjecutar && remesa.estado == remesa.ESTADO_PREREMESA}">
                  <cmz:accion icono="tesoreria/remesas/cobros/buscar/images/convertirRemesa.gif" onclick="convertirRemesa();" titulo="Convertir en Remesa" descripcion="Convertir en Remesa"></cmz:accion>
                </c:if>
              </c:when>
              <c:otherwise>
                <cmz:accionCancelar onclick="cancelar();"/>
              </c:otherwise>
            </c:choose>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="remesasCobros" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="idObjeto" name="idObjeto" type="hidden" value="${remesa.idRemesa}" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value=""/>

            <cmz:panel>
              <cmz:cabeceraPanel titulo="Remesa"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px">
               	  <c:if test="${!formularioRemesaCobro.enInsercion}">
	                <tr>
	                  <td>Remesa:</td>
	                  <td>
	                    <cmz:campoTexto id="idRemesa" valor="${remesa.idRemesa}" anchura="90px" soloLectura="true"/>
                  </td>
	                </tr>    
                  </c:if>
				 
				  <tr>	
                    <td>Banco:</td>
                    <td>
		              <cmz:ayuda nombreAyuda="BANCOS" requerido="true" soloLectura="${!formularioRemesaCobro.enInsercion}">
		                <cmz:codigoAyuda idCodigo="codBanco" longitudMaximaCodigo="11" valorCodigo="${remesa.codBanco}" anchuraCodigo="90px"></cmz:codigoAyuda>
		                <cmz:descripcionAyuda idDescripcion="desBanco" anchuraDescripcion="300px" valorDescripcion="${remesa.desBanco}"></cmz:descripcionAyuda>
		              </cmz:ayuda>
                    </td>
                  </tr>
					
				  <tr>	
                    <td>Fecha remesa:</td>
                    <td>
                       <cmz:campoFecha id="fechaRemesa" longitudMaxima="10" anchura="100px" requerido="true" editable="${formularioRemesaCobro.enInsercion}" soloLectura="${!formularioRemesaCobro.enInsercion}">
                         <fmt:formatDate pattern="dd/MM/yyyy" value="${remesa.fechaRemesa}"/>
                       </cmz:campoFecha>
                    </td>
                  </tr>

               	  <c:if test="${!formularioRemesaCobro.enInsercion}">
	                <tr>
	                  <td>Estado:</td>
	                  <td>
	                    <cmz:campoTexto id="desEstado" valor="${remesa.desEstado}" anchura="150px" soloLectura="true"/>
	                  </td>
	                </tr>    
                  </c:if>
                </table>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <c:if test="${!formularioRemesaCobro.enInsercion}">
              <cmz:panel>
                <cmz:cabeceraPanel titulo="Documentos">
			  	  <cmz:acciones numAccionesVisibles="1">
					<c:if test="${remesa.estado == remesa.ESTADO_PREREMESA}">
					  <cmz:accion onclick="agregarDocumentos();" descripcion="Agregar documentos" icono="tesoreria/remesas/cobros/mantenimiento/images/agregarDocumentos.gif" titulo="Agregar documentos"></cmz:accion>
					</c:if>
					<c:if test="${remesa.estado == remesa.ESTADO_REMESA}">
					  <cmz:accion onclick="generarDevolucion();" descripcion="Generar devolución" icono="tesoreria/remesas/cobros/mantenimiento/images/generarDevolucion.gif" titulo="Generar devolución"></cmz:accion>
					</c:if>
				  </cmz:acciones>
				</cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
					<cmz:lista>
						<cmz:cabeceraLista>
							<c:if test="${remesa.estado == remesa.ESTADO_REMESA}">
		                        <cmz:itemCabeceraLista nombre="Marca"></cmz:itemCabeceraLista>
							</c:if>
							<cmz:itemCabeceraLista nombre="Vencimiento" estilo="text-align: center;"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Cliente"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Descripción"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Importe" estilo="text-align: right;"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Serie"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Documento"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Fecha" estilo="text-align: center;"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Tipo Efecto"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Desc. Tipo Efecto"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Aceptación" estilo="text-align: center;"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Observaciones"></cmz:itemCabeceraLista>
							<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
						</cmz:cabeceraLista>
						<cmz:contenidoLista variable="documento" lista="${formularioRemesaCobro.formularioPestañaActiva.registros}">
							<c:if test="${remesa.estado == remesa.ESTADO_REMESA}">
	                          <cmz:itemContenidoListaPaginada>
	                        	<input type="checkbox" id="chk" name="chk" value="${documento.idCobro}" <c:if test="${documento.idCobroDevolucion != null}">disabled="disabled"</c:if>/>
	                          </cmz:itemContenidoListaPaginada>
							</c:if>
							<cmz:itemContenidoLista alineacion="center">
							  <fmt:formatDate value="${documento.fechaVencimiento}" pattern="dd/MM/yyyy"/>
							</cmz:itemContenidoLista>
							<cmz:itemContenidoLista valor="${documento.codCliente}"></cmz:itemContenidoLista>
							<cmz:itemContenidoLista valor="${documento.desCliente}"></cmz:itemContenidoLista>
							<cmz:itemContenidoLista alineacion="right">
							  <cmz:formateaNumero valor="${documento.importe}" numDecimales="2"/>
							</cmz:itemContenidoLista>
							<cmz:itemContenidoLista valor="${documento.codSerie}"></cmz:itemContenidoLista>
							<cmz:itemContenidoLista valor="${documento.documento}"></cmz:itemContenidoLista>
							<cmz:itemContenidoLista alineacion="center">
							  <fmt:formatDate value="${documento.fechaFactura}" pattern="dd/MM/yyyy"/>
							</cmz:itemContenidoLista>
							<cmz:itemContenidoLista valor="${documento.codTipoEfecto}"></cmz:itemContenidoLista>
							<cmz:itemContenidoLista valor="${documento.desTipoEfecto}"></cmz:itemContenidoLista>
							<cmz:itemContenidoLista alineacion="center">
							  <fmt:formatDate value="${documento.fechaEntradaDocumento}" pattern="dd/MM/yyyy"/>
							</cmz:itemContenidoLista>
							<cmz:itemContenidoLista valor="${documento.observaciones}"></cmz:itemContenidoLista>
							<c:choose>
							  <c:when test="${(documento.idCobroDevolucion == null) || (documento.idCobroDevolucion != null && remesa.estado == remesa.ESTADO_PREREMESA)}">
								<cmz:acciones alineacion="center">
								  <cmz:accion onclick="eliminarRegistro(${documento.idCobro})" icono="comun/images/iconos/eliminar.gif" descripcion="Quitar de la ${estado}"></cmz:accion>
								</cmz:acciones>
							  </c:when>
							  <c:otherwise>
								<cmz:itemContenidoLista>&nbsp;</cmz:itemContenidoLista>
							  </c:otherwise>
						    </c:choose>
						</cmz:contenidoLista>
					</cmz:lista>
                </cmz:cuerpoPanel>
              </cmz:panel>
              
              <cmz:panel>
                <cmz:cabeceraPanel/>
                <cmz:cuerpoPanel>
				  <table cellpadding="2px" cellspacing="2px" border="0px">
				    <tr>
	                  <td>Registros:</td>
	                  <td>
	                    <cmz:campoTexto id="registros" valor="${totales.numRegistros}" editable="false" soloLectura="true" anchura="40"/>
	                  </td>

	                  <td>Importe:</td>
	                  <td>
                         <cmz:campoTexto id="importe" editable="false" soloLectura="true" anchura="70">
                           <cmz:formateaNumero valor="${totales.importeTotal}" numDecimales="2"></cmz:formateaNumero>
                         </cmz:campoTexto>
	                  </td>

	                  <td>Clientes:</td>
	                  <td>
	                    <cmz:campoTexto id="clientes" valor="${totales.numClientes}" editable="false" soloLectura="true" anchura="40"/>
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
