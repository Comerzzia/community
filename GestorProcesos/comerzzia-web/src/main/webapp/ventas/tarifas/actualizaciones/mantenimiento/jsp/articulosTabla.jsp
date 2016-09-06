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

<c:set var="paramBuscarArticulosActualizaciones" value="${formularioActualizacionTarifa.formularioPestañaActiva.param}" />

	<c:if test="${!formularioActualizacionTarifa.enInsercion}">

		<script type="text/javascript">
			function checkForm(){
				if (document.getElementById("desArtText")){
		        	if(!esValido("desArtText", "TEXTO", false)){
		            	return false;
		        	}
					if(!esValido("codArt", "AYUDA", false, "desArt", "ARTICULOS")){
						return false;
					}
					if(!esValido("codFam", "AYUDA", false, "desFam", "FAMILIAS")){
						return false;
					}
					if(!esValido("codPro", "AYUDA", false, "desPro", "PROVEEDORES")){
						return false;
					}
				}
				return true;
			}
      
	        function buscarRegistrosPestaña(){
				if(checkForm()){
		        	document.getElementById("accion").value = "leerFormulario";
		        	document.getElementById("operacion").value = "buscarRegistrosPestaña";
		        	document.getElementById("frmDatos").submit();
		        	_esperando();
				}
	        }
		</script>

		<c:if test="${!formularioActualizacionTarifa.editable}">
			<script type="text/javascript">
		        function keyDownEnter() {
		        	buscarRegistrosPestaña();
		        }
			</script>
			<cmz:panel>
				<cmz:cabeceraPanel titulo="Búsqueda de Artículos"></cmz:cabeceraPanel>
				<cmz:cuerpoPanel>
					<table cellpadding="2px" cellspacing="2px" border="0px">
						<tr>
							<td>Descripción:</td>
							<td><cmz:campoTexto id="desArtText"
								valor="${paramBuscarArticulosActualizaciones.desArtText}" anchura="320px"
								longitudMaxima="45" /></td>
								
							<td><cmz:botonConsultar onclick="buscarRegistrosPestaña();"/></td>
						</tr>
						<tr>
							<td>Artículo:</td>
							<td><cmz:ayuda requerido="false" soloLectura="false"
								nombreAyuda="ARTICULOS">
								<cmz:codigoAyuda idCodigo="codArt"
									valorCodigo="${paramBuscarArticulosActualizaciones.codArt}"
									anchuraCodigo="100px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
								<cmz:descripcionAyuda idDescripcion="desArt"
									valorDescripcion="${paramBuscarArticulosActualizaciones.desArt}"
									anchuraDescripcion="300px"></cmz:descripcionAyuda>
							</cmz:ayuda></td>
						</tr>
						<tr>
							<td>Familia:</td>
							<td><cmz:ayuda requerido="false" soloLectura="false"
								nombreAyuda="FAMILIAS">
								<cmz:codigoAyuda idCodigo="codFam"
									valorCodigo="${paramBuscarArticulosActualizaciones.codFam}"
									anchuraCodigo="100px" longitudMaximaCodigo="6"></cmz:codigoAyuda>
								<cmz:descripcionAyuda idDescripcion="desFam"
									valorDescripcion="${paramBuscarArticulosActualizaciones.desFam}"
									anchuraDescripcion="200px"></cmz:descripcionAyuda>
							</cmz:ayuda></td>
						</tr>
						<tr>
							<td>Proveedor:</td>
							<td><cmz:ayuda requerido="false" soloLectura="false"
								nombreAyuda="PROVEEDORES">
								<cmz:codigoAyuda idCodigo="codPro"
									valorCodigo="${paramBuscarArticulosActualizaciones.codPro}"
									anchuraCodigo="100px" longitudMaximaCodigo="11"></cmz:codigoAyuda>
								<cmz:descripcionAyuda idDescripcion="desPro"
									valorDescripcion="${paramBuscarArticulosActualizaciones.desPro}"
									anchuraDescripcion="200px"></cmz:descripcionAyuda>
							</cmz:ayuda></td>
						</tr>
					</table>
				</cmz:cuerpoPanel>
			</cmz:panel>
		</c:if> 
    
		<cmz:panel>
			<cmz:cabeceraPanel titulo="Artículos">
				<cmz:acciones>
				  <c:choose>
					<c:when test="${formularioActualizacionTarifa.editable}">
						<cmz:accionNuevaLinea onclick="nuevoRegistroPestaña();" descripcion="Alta de un nuevo artículo"/>
					</c:when>
					<c:otherwise>
						<td align="right">
							<span id="browse:items-txt1">Resultados por página</span>
							<input id="tamanoPagina" name="tamanoPagina" type="text" class="campo numero" maxlength="3" value="${paramBuscarArticulosActualizaciones.tamañoPagina}" >
						</td>
					</c:otherwise>
				  </c:choose>
				</cmz:acciones>
			</cmz:cabeceraPanel>
			<cmz:cuerpoPanel>
				<cmz:lista>
					<cmz:cabeceraLista>
						<cmz:itemCabeceraLista  nombre="Artículo" columna="1"></cmz:itemCabeceraLista>
						<cmz:itemCabeceraLista nombre="Descripción" columna="2"></cmz:itemCabeceraLista>
						<cmz:itemCabeceraLista nombre="Precio<br>Costo" estilo="text-align: right;" columna="4"></cmz:itemCabeceraLista>
						<cmz:itemCabeceraLista nombre="Factor<br>Marcaje" estilo="text-align: right;" columna="5"></cmz:itemCabeceraLista>
						<cmz:itemCabeceraLista nombre="Precio<br>Venta" estilo="text-align: right;" columna="8"></cmz:itemCabeceraLista>
						<cmz:itemCabeceraLista nombre="Precio<br>Total" estilo="text-align: right;" columna="9"></cmz:itemCabeceraLista>
						<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
					</cmz:cabeceraLista>
					<cmz:contenidoLista lista="${formularioActualizacionTarifa.formularioPestañaActiva.registros}" variable="articulo">
						<cmz:itemContenidoLista valor="${articulo.codArt}" onclick="verRegistroPestaña(${indice})"></cmz:itemContenidoLista>
						<cmz:itemContenidoLista valor="${articulo.desArt}"></cmz:itemContenidoLista>
						<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.precioCosto}" numDecimales="2"/></cmz:itemContenidoLista>
						<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.factorMarcaje}" numDecimales="2"/></cmz:itemContenidoLista>
						<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.precioVenta}" numDecimales="4"/></cmz:itemContenidoLista>
						<cmz:itemContenidoLista alineacion="right"><cmz:formateaNumero valor="${articulo.precioTotal}" numDecimales="2"/></cmz:itemContenidoLista>
						<cmz:acciones alineacion="center">
							<cmz:accion icono="comun/images/iconos/ver.gif"
								onclick="verRegistroPestaña(${indice});" descripcion="Ver artículo"></cmz:accion>
							<c:if test="${permisos.puedeEditar && formularioActualizacionTarifa.editable}">
								<cmz:accion icono="comun/images/iconos/editar.gif"
									onclick="editarRegistroPestaña(${indice});"
									descripcion="Editar artículo"></cmz:accion>
							</c:if>
							<c:if test="${permisos.puedeEliminar && formularioActualizacionTarifa.editable}">
								<cmz:accion icono="comun/images/iconos/eliminar.gif"
									onclick="eliminarRegistroPestaña(${indice});"
									descripcion="Eliminar artículo"></cmz:accion>
							</c:if>
						</cmz:acciones>
					</cmz:contenidoLista>
				</cmz:lista>
			</cmz:cuerpoPanel>
		</cmz:panel>
</c:if>
