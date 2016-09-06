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

<jsp:useBean id="formularioTienda" type="com.comerzzia.web.general.tiendas.ui.FormularioTiendaBean" scope="session" />
<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />
<jsp:useBean id="asistenteTienda" type="com.comerzzia.servicios.general.tiendas.AsistenteTienda" scope="session" />

<c:set var="tienda" value="${asistenteTienda.tienda}" />

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
    	function inicio() {
    		setFoco("codAlm");
    	}
        
        function checkForm() {
        	if(!esValido("codAlm", "TEXTO", true))
            	return false;
	        if(!esValido("desAlm", "TEXTO", true))
	            return false;
	        if (!esValido("personaContacto", "TEXTO", false)) 
	            return false;
	        if (!esValido("domicilio", "TEXTO", false)) 
	            return false;
	        if (!esValido("poblacion", "TEXTO", false)) 
	            return false;
	        if (!esValido("provincia", "TEXTO", false)) 
	            return false;
	        if (!esValido("cp", "ENTERO", false)) 
	            return false;
	        if (!esValido("telefono1", "ENTERO", false)) 
	            return false;
	        if (!esValido("telefono2", "ENTERO", false)) 
	            return false;
	        if (!esValido("fax", "ENTERO", false)) 
	            return false;
	        if(!esValido("codConceptoAlmacen", "AYUDA", true, "desConceptoAlmacen", "CONCEPTOS_ALMACENES_VENT"))
		       	return false;
	        if(!esValido("codMedioPago", "AYUDA", true, "desMedioPago", "MEDIOS_PAGO_EFECTIVOS"))
    	       	return false;
            
	        return true;
        }

        function siguiente() {
    		if (checkForm()) {
    			document.getElementById("accion").value = "asistenteAlta";
    			document.getElementById("operacion").value = "siguiente";
    			document.getElementById("frmDatos").submit();
    			_esperando();
    		}
    	}
        
    </script>
  </head>

  <body onload="inicio();">
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="Asistente para la Creación de una Tienda" icono="${permisos.accionMenu.icono}">
          <cmz:acciones numAccionesVisibles="1">
            <cmz:accionCancelar onclick="volver();"/>
          </cmz:acciones>
        </cmz:cabeceraPanelCMZ>
        
        <cmz:cuerpoPanelCMZ>
          <cmz:mensaje/>
          <form id="frmDatos" name="frmDatos" action="tiendas" method="post">            
            <input id="accion" name="accion" type="hidden" value="" />
            <input id="operacion" name="operacion" type="hidden" value="" />
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Datos de la Tienda"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <table cellpadding="2px" cellspacing="2px" border="0px" class="asistenteTienda">
                  <tr>   
                  	<td  width="140px">Código:</td>                
                    <td colspan="3">
                    	<table cellpadding="0px" cellspacing="0px" border="0px">
                    		<tr>
                    			<td>
			                      <cmz:campoTexto id="codAlm" valor="${tienda.codAlm}" requerido="true" anchura="40px" longitudMaxima="4"
			                                        editable="${formularioTienda.enInsercion}" soloLectura="${!formularioTienda.enInsercion}"/>
			                    </td>
			                    <td width="10px"></td><!-- SEPARADOR -->
			                    <td>Descripción:</td>
			                    <td><cmz:campoTexto id="desAlm" valor="${tienda.desAlm}" requerido="true" anchura="300px" longitudMaxima="45" 
			                                        editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/></td>
								  
                    		</tr>
                    	</table>
                    </td>                         
                  </tr>
                  
                  <tr>	        
			        <td>Persona contacto:</td>
			        <td><cmz:campoTexto id="personaContacto" valor="${tienda.personaContacto}" requerido="false" anchura="300px" longitudMaxima="45" 
			                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
			        </td>
			      </tr>  
			
				  <tr>	        
			        <td>Domicilio:</td>
			        <td><cmz:campoTexto id="domicilio" valor="${tienda.domicilio}" requerido="false" anchura="320px" longitudMaxima="50" 
			                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
			        </td>
			      </tr>  
			
				  <tr>	        
			        <td>Población:</td>
			        <td><cmz:campoTexto id="poblacion" valor="${tienda.poblacion}" requerido="false" anchura="320px" longitudMaxima="50" 
			                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
			        </td>
			      </tr>  
			
				  <tr>	        
			        <td>Provincia:</td>
			        <td><cmz:campoTexto id="provincia" valor="${tienda.provincia}" requerido="false" anchura="320px" longitudMaxima="50" 
			                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
			        </td>
			      </tr>  
				    
				  <tr>	  
			        <td>Código Postal:</td>
			        <td><cmz:campoTexto id="cp" valor="${tienda.cp}" requerido="false" anchura="80px" longitudMaxima="8" 
			                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
			        </td>
			      </tr>  
			
				  <tr>	        
			        <td>Teléfonos:</td>
			        <td>
			        	<cmz:campoTexto id="telefono1" valor="${tienda.telefono1}" requerido="false" anchura="120px" longitudMaxima="15" 
			                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
			        	<cmz:campoTexto id="telefono2" valor="${tienda.telefono2}" requerido="false" anchura="120px" longitudMaxima="15" 
			                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
			        </td>
			      </tr>  
			
				  <tr>	        
			        <td>Fax:</td>
			        <td><cmz:campoTexto id="fax" valor="${tienda.fax}" requerido="false" anchura="120px" longitudMaxima="15" 
			                            editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}"/>
			        </td>
			      </tr>
			      <tr>
					<td>Concepto de Almacén para Venta:</td>
					<td><cmz:ayuda requerido="true"	soloLectura="${!formularioTienda.editable}"	nombreAyuda="CONCEPTOS_ALMACENES_VENT">
						<cmz:codigoAyuda idCodigo="codConceptoAlmacen"
							valorCodigo="${tienda.codConceptoAlmacen}" anchuraCodigo="40px"
							longitudMaximaCodigo="4"></cmz:codigoAyuda>
						<cmz:descripcionAyuda idDescripcion="desConceptoAlmacen"
							valorDescripcion="${tienda.desConceptoAlmacen}"
							anchuraDescripcion="200px" editable="${formularioTienda.editable}"></cmz:descripcionAyuda>
					</cmz:ayuda></td>
				  </tr>
			      <tr>
			        <td>Medio de pago para Venta:</td>
			        <td>
			          <cmz:ayuda requerido="true" soloLectura="${!formularioTienda.editable}" nombreAyuda="MEDIOS_PAGO_EFECTIVOS">
			            <cmz:codigoAyuda idCodigo="codMedioPago" valorCodigo="${tienda.codMedioPago}" anchuraCodigo="40px" longitudMaximaCodigo="4"></cmz:codigoAyuda>
			            <cmz:descripcionAyuda idDescripcion="desMedioPago" valorDescripcion="${tienda.desMedioPago}" anchuraDescripcion="200px" editable="${formularioTienda.editable}"></cmz:descripcionAyuda>
			          </cmz:ayuda>
			        </td>
			      </tr>
			      <tr><td height="10px"></td></tr><!-- SEPARADOR -->
                </table>
                <div class="botonesAsistente">
					<cmz:boton onclick="siguiente();" valor="Siguiente &gt;&gt;" id="btnSiguiente" />
				</div>
              </cmz:cuerpoPanel>
            </cmz:panel>           
          </form>
        </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
