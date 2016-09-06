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

<c:set var="trabajo" value="${formularioSincronizacion.formularioPestañaActiva.registroActivo}" />

<script type="text/javascript">
	function checkFormRegistroPestaña() {
		if(!checkFechaProximaEjecucion())
            return false;
        if(!checkPlanificacion())
            return false;
        
        return true;
	}
	function aceptarTrabajo() {
	    if (checkFormRegistroPestaña()) {
	    	document.getElementById("accion").value = "leerFormulario";
	    	document.getElementById("operacion").value = "aceptarTrabajo";
	    	document.getElementById("frmDatos").submit();
	    	_esperando();
	    }
	}

	function cancelarTrabajo() {
		document.getElementById("accion").value = "leerFormulario";
		document.getElementById("operacion").value = "cancelarTrabajo";
		document.getElementById("frmDatos").submit();
		_esperando();
	}

	function onclickPeriodo() {
		if(document.getElementById("ejecIntervalo").checked){
			document.getElementById("tablaPeriodo").style.display = "";
		}else{
			document.getElementById("tablaPeriodo").style.display = "none";
		}
	}
	function checkFechaProximaEjecucion(){
		if(document.getElementById("fechaProximaEjecucion").value != ""){
			if(!esValido("fechaProximaEjecucion", "FECHA", false))
	            return false;
			if(!esValido("horaProximaEjecucion", "HORA:MIN", true))
	            return false;
		}
		if(document.getElementById("horaProximaEjecucion").value != ""){
			if(!esValido("horaProximaEjecucion", "HORA:MIN", false))
	            return false;
			if(!esValido("fechaProximaEjecucion", "FECHA", true))
	            return false;		
		}
		return true;
	}

	function checkPlanificacion(){
		if(document.getElementById("ejecIntervalo").checked){
			if(getValorRadioButtonSeleccionado(document.frmDatos.intervalo) == "minutos"){
				if(!esValido("minutos", "MINUTOS", true))
		            return false;
			}else if(getValorRadioButtonSeleccionado(document.frmDatos.intervalo) == "horas"){
				if(!esValido("horas", "HORA", true))
		            return false;
			}else if(getValorRadioButtonSeleccionado(document.frmDatos.intervalo) == "dias"){
				if(!esValido("dias", "ENTERO", true))
		            return false;
			}else{
				alert("Debe especificar días, horas o minutos.");
				return false;
			}
		}
		return true;
	}

	function getValorRadioButtonSeleccionado(radio)
	{
	    for(var i=0; i<radio.length; i++)
	        if(radio[i].checked) 
		        return radio[i].value;
	}
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Datos del Trabajo">
    <cmz:acciones numAccionesVisibles="8">
      <c:choose>
        <c:when test="${formularioSincronizacion.formularioPestañaActiva.editable}">
          <cmz:accion onclick="aceptarTrabajo();" titulo="Aceptar" icono="comun/images/iconos/aceptar.gif"></cmz:accion>
          <cmz:accion onclick="cancelarTrabajo();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
        </c:when>
        <c:otherwise>
          <cmz:accionModoTabla onclick="vistaTablaPestaña();"/>                    
          <c:if test="${trabajo.parado || trabajo.pausado}">
          <cmz:accion icono="comun/images/iconos/editar.gif" descripcion="Editar Trabajo" onclick="editarTrabajo(${trabajo.idTrabajo});" />
          </c:if>
        </c:otherwise>
      </c:choose>
    </cmz:acciones>
  </cmz:cabeceraPanel>

	<cmz:cuerpoPanel>
		<table cellpadding="2px" cellspacing="2px" border="0px">
			<tr>
				<td>Trabajo:</td>
				<td><cmz:campoTexto id="trabajo" valor="${trabajo.trabajo}"
					anchura="300px"
					editable="${formularioSincronizacion.formularioPestañaActiva.enInsercion}"
					soloLectura="${!formularioSincronizacion.formularioPestañaActiva.enInsercion}" />
				</td>
				<td width="50px"></td>
				<td align="right">Estado:</td>
				<td><c:choose>
					<c:when test="${trabajo.parado}">
	                <img src="comun/images/iconos/stop.gif" border="0" align="absmiddle" alt="Parado" title="Parado"/>
	              </c:when>
					<c:when test="${trabajo.arrancado}">
	                <img src="comun/images/iconos/play.gif" border="0" align="absmiddle" alt="Arrancado" title="Arrancado"/>
	              </c:when>
					<c:when test="${trabajo.pausado}">
	                <img src="comun/images/iconos/pause.gif" border="0" align="absmiddle" title="Pausado" alt="Pausado" />
	              </c:when>
					<c:otherwise>&nbsp;</c:otherwise>
				</c:choose></td>
			</tr>
			<tr>
				<td>Tienda:</td>
				<td colspan="3"><cmz:campoTexto id="codAlmacen"
					valor="${trabajo.codAlmacen}" anchura="40px"
					editable="${formularioSincronizacion.formularioPestañaActiva.enInsercion}"
					soloLectura="${!formularioSincronizacion.formularioPestañaActiva.enInsercion}" />
				<cmz:campoTexto id="desAlmacen" valor="${trabajo.desAlmacen}"
					anchura="300px"
					editable="${formularioSincronizacion.formularioPestañaActiva.enInsercion}"
					soloLectura="${!formularioSincronizacion.formularioPestañaActiva.enInsercion}" />
				</td>
			</tr>
			<tr>
				<td>Fecha Próxima Ejec.:</td>
				<td><c:set var="fechaProximaEjecucion">
					<fmt:formatDate pattern="dd/MM/yyyy"
						value="${trabajo.fechaProximaEjecucion}" />
				</c:set> <cmz:campoFecha id="fechaProximaEjecucion"
					valor="${fechaProximaEjecucion}" anchura="65px"
					editable="${formularioSincronizacion.formularioPestañaActiva.editable}"
					soloLectura="${!formularioSincronizacion.formularioPestañaActiva.editable}" />
				<c:set var="horaProximaEjecucion">
					<fmt:formatDate pattern="HH:mm"
						value="${trabajo.fechaProximaEjecucion}" />
				</c:set> <cmz:campoTexto id="horaProximaEjecucion"
					valor="${horaProximaEjecucion}" anchura="40px" longitudMaxima="5"
					editable="${formularioSincronizacion.formularioPestañaActiva.editable}"
					soloLectura="${!formularioSincronizacion.formularioPestañaActiva.editable}" />
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox" value=""
					id="ejecIntervalo" name="ejecIntervalo" onclick="onclickPeriodo();"
					<c:if test="${trabajo.planificado}">checked="checked"</c:if>
					<c:if test="${!formularioSincronizacion.formularioPestañaActiva.editable}">disabled="disabled"</c:if> />
				Ejecutar periódicamente</td>
			</tr>
			<tr>
				<td colspan="2">
				<table border="0" cellpadding="2" cellspacing="2" id="tablaPeriodo"
					<c:if test="${!trabajo.planificado}">style="display:none"</c:if>>
					<tr>
						<td><input type="radio" value="minutos" id=""
							name="intervalo"
							<c:if test="${trabajo.medidaMinutos}">checked="checked"</c:if>
							<c:if test="${!formularioSincronizacion.formularioPestañaActiva.editable}">disabled="disabled"</c:if> />
						cada <cmz:campoTexto id="minutos"
							valor="${trabajo.cantidadMinutos}" anchura="40px"
							longitudMaxima="2"
							editable="${formularioSincronizacion.formularioPestañaActiva.editable}"
							soloLectura="${!formularioSincronizacion.formularioPestañaActiva.editable}" />
						minutos</td>
					</tr>
					<tr>
						<td><input type="radio" value="horas" id="" name="intervalo"
							<c:if test="${trabajo.medidaHoras}">checked="checked"</c:if>
							<c:if test="${!formularioSincronizacion.formularioPestañaActiva.editable}">disabled="disabled"</c:if> />
						cada <cmz:campoTexto id="horas" valor="${trabajo.cantidadHoras}"
							anchura="40px" longitudMaxima="2"
							editable="${formularioSincronizacion.formularioPestañaActiva.editable}"
							soloLectura="${!formularioSincronizacion.formularioPestañaActiva.editable}" />
						horas</td>
					</tr>
					<tr>
						<td><input type="radio" value="dias" id="" name="intervalo"
							<c:if test="${trabajo.medidaDias}">checked="checked"</c:if>
							<c:if test="${!formularioSincronizacion.formularioPestañaActiva.editable}">disabled="disabled"</c:if> />
						cada <cmz:campoTexto id="dias" valor="${trabajo.cantidadDias}"
							anchura="40px" longitudMaxima="2"
							editable="${formularioSincronizacion.formularioPestañaActiva.editable}"
							soloLectura="${!formularioSincronizacion.formularioPestañaActiva.editable}" />
						días</td>
					</tr>
					<!-- tr>
						<td><input type="checkbox" value="" id="lunes" name="lunes"
							<c:if test="${trabajo.diaLunes}">checked="checked"</c:if>
							<c:if test="${!formularioSincronizacion.formularioPestañaActiva.editable}">disabled="disabled"</c:if> />
						L <input type="checkbox" value="" id="martes" name="martes"
							<c:if test="${trabajo.diaMartes}">checked="checked"</c:if>
							<c:if test="${!formularioSincronizacion.formularioPestañaActiva.editable}">disabled="disabled"</c:if> />
						M <input type="checkbox" value="" id="miercoles" name="miercoles"
							<c:if test="${trabajo.diaMiercoles}">checked="checked"</c:if>
							<c:if test="${!formularioSincronizacion.formularioPestañaActiva.editable}">disabled="disabled"</c:if> />
						X <input type="checkbox" value="" id="jueves" name="jueves"
							<c:if test="${trabajo.diaJueves}">checked="checked"</c:if>
							<c:if test="${!formularioSincronizacion.formularioPestañaActiva.editable}">disabled="disabled"</c:if> />
						J <input type="checkbox" value="" id="viernes" name="viernes"
							<c:if test="${trabajo.diaViernes}">checked="checked"</c:if>
							<c:if test="${!formularioSincronizacion.formularioPestañaActiva.editable}">disabled="disabled"</c:if> />
						V <input type="checkbox" value="" id="sabado" name="sabado"
							<c:if test="${trabajo.diaSabado}">checked="checked"</c:if>
							<c:if test="${!formularioSincronizacion.formularioPestañaActiva.editable}">disabled="disabled"</c:if> />
						S <input type="checkbox" value="" id="domingo" name="domingo"
							<c:if test="${trabajo.diaDomingo}">checked="checked"</c:if>
							<c:if test="${!formularioSincronizacion.formularioPestañaActiva.editable}">disabled="disabled"</c:if> />
						D</td>
					</tr-->
				</table>
				</td>
			</tr>
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>

<cmz:panel>
	<cmz:cabeceraPanel titulo="Ultima Ejecución"></cmz:cabeceraPanel>
	<cmz:cuerpoPanel>
		<table border="0px" cellpadding="2px" cellspacing="2px">
			<tr>
	           <td>Fecha Última Ejec.:</td>
	           <td width="150px"><c:set var="fechaUltimaEjecucion"><fmt:formatDate pattern="dd/MM/yyyy HH:mm:ss" value="${trabajo.fechaUltimaEjecucion}"/></c:set>
	               <cmz:campoTexto id="fechaUltimaEjecucion" valor="${fechaUltimaEjecucion}" anchura="120px" 
	               			editable="${formularioSincronizacion.formularioPestañaActiva.enInsercion}" 
	                    	soloLectura="${!formularioSincronizacion.formularioPestañaActiva.enInsercion}" />
	           </td>
	           <td nowrap="nowrap">Resultado:
	           	   <c:choose>
		              <c:when test="${trabajo.resultado == 0}">
		                <img src="comun/images/iconos/ok.gif" border="0" align="absmiddle" />
		              </c:when>
		              <c:when test="${trabajo.resultado == 1}">
		                <img src="comun/images/iconos/aviso.gif" border="0" align="absmiddle" />
		              </c:when>
		              <c:when test="${trabajo.resultado == 2}">
		                <img src="comun/images/iconos/error.gif" border="0" align="absmiddle" />
		              </c:when>
		           </c:choose>
	           </td>
	        </tr>
	        <tr>    
		       <td valign="top">Observaciones:</td>
		       <td colspan="3">
		         <cmz:campoAreaTexto id="observaciones" anchura="600px" altura="100px" valor="${trabajo.observaciones}" 
		         	editable="${formularioFacturaCompra.formularioPestañaActiva.enInsercion}"
		    		soloLectura="${!formularioFacturaCompra.formularioPestañaActiva.enInsercion}"
		    		longitudMaxima="255"></cmz:campoAreaTexto>
		       </td>
	        </tr>   
		</table>
	</cmz:cuerpoPanel>
</cmz:panel>
