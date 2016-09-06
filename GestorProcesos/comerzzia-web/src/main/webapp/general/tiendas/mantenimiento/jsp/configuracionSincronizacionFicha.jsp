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

<c:set var="tienda" value="${formularioTienda.registroActivo}" />

<script type="text/javascript">
	function checkFormPestaña() {
    	if(!esValido("xmlConfiguracion", "TEXTO", false)){
	    	return false;
	    }
        return true;
    }

    function verParametros(){
		if(checkFormPestaña){
			document.getElementById("accion").value = "leerFormulario";
			document.getElementById("operacion").value = "vistaTablaPestaña";
		    document.getElementById("frmDatos").submit();
			_esperando();
		}
    }
</script>

<cmz:panel>
	<cmz:cabeceraPanel titulo="XML de Configuración">
		<cmz:acciones>
	      <cmz:accion icono="comun/images/iconos/modo_tabla.gif" titulo="Ver Parametros" descripcion="Ver parametros" onclick="verParametros()" />
	    </cmz:acciones>
	</cmz:cabeceraPanel>
    <cmz:cuerpoPanel>
    	<table cellpadding="2px" cellspacing="2px" border="0px" style="width: 100%">
			<tr>
            	<td>
	            	<cmz:campoAreaTexto id="xmlConfiguracion" altura="280" anchura="100%" valor="${tienda.xmlConfiguracion}" 
	            		editable="${formularioTienda.editable}" soloLectura="${!formularioTienda.editable}" requerido="false"></cmz:campoAreaTexto>
                </td>
            </tr>  
        </table>
    </cmz:cuerpoPanel>
</cmz:panel>
