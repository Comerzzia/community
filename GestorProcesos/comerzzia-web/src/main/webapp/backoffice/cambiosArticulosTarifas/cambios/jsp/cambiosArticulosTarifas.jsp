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

<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/calendario.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/formulario.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/ayudas.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/validacion.js"></script>
    <script type="text/javascript">
    	
        function marcarVisto(codAlmacen){
        	if(confirm("¿Desea marcar los cambios de los artículos como vistos?")){
        		document.getElementById("codAlm").value = codAlmacen;
                actualizar("articulos");
        	}
        }

        function marcarVistoTarifa(codAlmacen, codTarifa){
        	if(confirm("¿Desea marcar los cambios de la tarifa como vistos?")){
        		document.getElementById("codAlm").value = codAlmacen;
                document.getElementById("codTarifa").value = codTarifa;
                actualizar("tarifas");
        	}
        }

        function actualizar(operacion){
        	document.getElementById("accion").value = "actualizarTienda";
        	document.getElementById("operacion").value = operacion;
            document.getElementById("frmDatos").submit();
        	_esperando();
        	
        }

		function imprimir (codAlmacen){
			document.getElementById("codAlm").value = codAlmacen;
	        document.getElementById("accion").value = "backoffice.articulos.lstCambiosArticulos";
	        document.getElementById("operacion").value = "nuevo";
	        document.getElementById("frmDatos").submit();
	    	_esperando();
					
        }

		function imprimirCambiosTarifa (codAlmacen, codTarifa, versionTarifaRev, fechaVersionTarifaRev){
			document.getElementById("codAlm").value = codAlmacen;
			document.getElementById("codTarifa").value = codTarifa;
			document.getElementById("versionTarifaRev").value = versionTarifaRev;
			document.getElementById("fechaVersionTarifaRev").value = fechaVersionTarifaRev;
		    document.getElementById("accion").value = "backoffice.articulos.lstCambiosTarifas";
		    document.getElementById("operacion").value = "nuevo";
		    document.getElementById("frmDatos").submit();
			_esperando();
					
        }
    </script>
  </head>

  <body>
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="${permisos.accionMenu.titulo}" icono="${permisos.accionMenu.icono}">
           <c:if test="${permisos.puedeAdministrar}">
            <cmz:acciones numAccionesVisibles="1">
              <cmz:accion titulo="Administrar Permisos" icono="comun/images/iconos/admin_permisos.gif" descripcion="Administración de permisos" onclick="adminPermisos(${permisos.accionMenu.idAccion})" />
            </cmz:acciones> 
           </c:if>
        </cmz:cabeceraPanelCMZ>
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="cambiosArticulosTarifas" method="post">
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            <input id="indice" name="indice" type="hidden" value="" />
            <input id="codAlm" name="codAlm" type="hidden" value="" />
            <input id="codTarifa" name="codTarifa" type="hidden" value="" />
            <input id="versionTarifaRev" name="versionTarifaRev" type="hidden" value="" />
            <input id="fechaVersionTarifaRev" name="fechaVersionTarifaRev" type="hidden" value="" />
            
            <c:forEach var="tienda" items="${listaTiendas}">
				<cmz:panel>
					<c:set var="nombreTienda">Tienda <c:out value="${tienda.nombre}"></c:out></c:set>
					<cmz:cabeceraPanel titulo="${nombreTienda}">
						<c:if test="${tienda.versionArticulos != tienda.versionArticulosRevisada}">
							<cmz:acciones>
								<cmz:accion titulo="Imprimir Cambios" icono="comun/images/iconos/impresora.gif" onclick="imprimir('${tienda.codAlm}')" descripcion="Imprimir Cambios"></cmz:accion>
								<cmz:accion titulo="Marcar como Visto" icono="comun/images/iconos/aceptar.gif" onclick="marcarVisto('${tienda.codAlm}')" descripcion="Marcar como visto"></cmz:accion>
							</cmz:acciones>
						</c:if>
					</cmz:cabeceraPanel>
					<cmz:cuerpoPanel>
						<table cellpadding="2px" cellspacing="2px" border="0px">
		                  <tr>
		                    <td>Versión de artículos:</td>
		                    <td>
		                      <cmz:campoTexto id="versionArticulos" valor="${tienda.versionArticulos}" anchura="70px" longitudMaxima="10"  editable="false" soloLectura="true"/>
		                    </td>
		                    
		                    <td>Fecha versión de artículos:</td>
		                    <td>
			                    <cmz:campoTexto id="fechaVersionArticulos" anchura="120px" editable="false" soloLectura="true">
									<fmt:formatDate value="${tienda.fechaVersionArticulos}" pattern="dd/MM/yyyy - HH:mm:ss"/>		                    	
			                    </cmz:campoTexto>
		                    </td>
		                  </tr>
		                  
		                  <tr>
		                    <td>Versión revisada:</td>
		                    <td>
		                      <cmz:campoTexto id="versionArticulosRev" valor="${tienda.versionArticulosRevisada}" anchura="70px" longitudMaxima="10" editable="false" soloLectura="true"/>
		                    </td>
		                    
		                    <td>Fecha versión revisada:</td>
		                    <td>
			                    <cmz:campoTexto id="fechaVersionArticulosRev" valor="${fechaVersionRevisada}" anchura="120px" editable="false" soloLectura="true">
							    	<fmt:formatDate value="${tienda.fechaVersionArticulosRevisada}" pattern="dd/MM/yyyy - HH:mm:ss"/>                	
			                    </cmz:campoTexto>
		                    </td>
		                  </tr>
		                </table>
	                  	<cmz:lista>
	                  		<cmz:cabeceraLista>
	                  			<cmz:itemCabeceraLista nombre="Tarifa" columna="1" ordenColumna="CODTAR"></cmz:itemCabeceraLista>
								<cmz:itemCabeceraLista nombre="Descripción" columna="2" ordenColumna="DESCRIPCION"></cmz:itemCabeceraLista>
								<cmz:itemCabeceraLista nombre="Versión Activa" columna="3" ordenColumna="VERSION_TARIFA"></cmz:itemCabeceraLista>
								<cmz:itemCabeceraLista nombre="Fecha versión" columna="4" ordenColumna="FECHA_VERSION_TARIFA"></cmz:itemCabeceraLista>
								<cmz:itemCabeceraLista nombre="Versión revisada" columna="5" ordenColumna="VERSION_TARIFA_REV"></cmz:itemCabeceraLista>
								<cmz:itemCabeceraLista nombre="Fecha versión revisada" columna="6" ordenColumna="FECHA_VERSION_TARIFA_REV"></cmz:itemCabeceraLista>
								<cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
	                  		</cmz:cabeceraLista>
	                  		<cmz:contenidoLista variable="tarifa" lista="${tienda.tarifas}">
	                  			<cmz:itemContenidoLista valor="${tarifa.codTarifa}"></cmz:itemContenidoLista>
								<cmz:itemContenidoLista valor="${tarifa.desTarifa}"></cmz:itemContenidoLista>
								<cmz:itemContenidoLista valor="${tarifa.versionTarifa}"></cmz:itemContenidoLista>
								<cmz:itemContenidoLista><fmt:formatDate value="${tarifa.fechaVersionTarifa}" pattern="dd/MM/yyyy - HH:mm:ss"/></cmz:itemContenidoLista>
								<cmz:itemContenidoLista valor="${tarifa.versionTarifaRevisada}"></cmz:itemContenidoLista>
								<cmz:itemContenidoLista><fmt:formatDate value="${tarifa.fechaVersionTarifaRevisada}" pattern="dd/MM/yyyy - HH:mm:ss"/></cmz:itemContenidoLista>
								<cmz:acciones alineacion="center">
									<c:if test="${tarifa.versionTarifa != tarifa.versionTarifaRevisada}">
										<cmz:accion onclick="imprimirCambiosTarifa('${tienda.codAlm}', '${tarifa.codTarifa}', '${tarifa.versionTarifaRevisada}', '${fechaVersionTarifaRevisada}')" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir cambios"></cmz:accion>
										<cmz:accion onclick="marcarVistoTarifa('${tienda.codAlm}', '${tarifa.codTarifa}')" icono="comun/images/iconos/aceptar.gif" descripcion="Marcar como visto"></cmz:accion>										
									</c:if>
								</cmz:acciones>
	                  		</cmz:contenidoLista>
	                  	</cmz:lista>
					</cmz:cuerpoPanel>
				</cmz:panel>            
            </c:forEach>
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
