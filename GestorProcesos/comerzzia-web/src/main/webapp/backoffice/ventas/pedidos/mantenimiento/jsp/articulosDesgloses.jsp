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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="formulario" value="${formularioPedidoVentaBackoffice.formularioPestañaActiva}" />
<c:set var="articulo" value="${formularioPedidoVentaBackoffice.formularioPestañaActiva.registroActivo}" />
<c:set var="pedido" value="${formularioPedidoVentaBackoffice.registroActivo}" />
<c:set var="desgloses" value="${formularioPedidoVentaBackoffice.formularioPestañaArticulos.desgloses}" />

<script type="text/javascript">
    function ayudaArticulos() {
    	var rt = buscar('ARTICULOS','codArticulo', 'desArticulo');
        if (rt) {        
        	document.getElementById("accion").value = "leerFormulario";
        	document.getElementById("operacion").value = "cargarDesgloses";
        	document.getElementById("frmDatos").submit();
        	_esperando();
        }
    }

    function ayudaArticulosCambio() {
    	var rt = buscarXML('ARTICULOS','codArticulo', 'desArticulo');
       	document.getElementById("accion").value = "leerFormulario";
       	document.getElementById("operacion").value = "cargarDesgloses";
       	document.getElementById("frmDatos").submit();
    	_esperando();
    }
    
    function aceptarRegistroMasivoPestaña() {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("operacion").value = "aceptarArticulosDesgloses";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }
    
    function cancelarRegistroMasivoPestaña() {
    	document.getElementById("accion").value = "leerFormulario";
    	document.getElementById("operacion").value = "cancelarArticulosDesgloses";
    	document.getElementById("frmDatos").submit();
    	_esperando();
    }

    function cambiaDesglose(identificador){
		if(esValido(identificador, "ENTERO", true)) {
			calculaSigno(identificador);
			var desplazamiento = identificador.split("|")[0].length;
			var fila = identificador.split("|")[1];
			var columna = identificador.split("|")[2];
			sumaFila(fila,desplazamiento);
			sumaColumna(columna, desplazamiento + fila.length);
			sumaTotal();
		}
    }
    
    function sumaFila(fila,desplazamiento){
    	var inputs = document.getElementsByTagName("input");
		var valor = 0;
		var comparador = fila +"|";
		var cantidad;
    	for(i=0;i<inputs.length;i++){
			if(inputs[i].name.substring(desplazamiento + 1,desplazamiento + comparador.length + 1)==comparador){
				cantidad = (isNaN(parseInt(inputs[i].value))) ? "0" : inputs[i].value;
				valor += parseInt(cantidad);
	        }
    	document.getElementById("TF_"+fila).value=valor;
        }
    }
    
    function sumaColumna(columna, comienzo){
    	var inputs = document.getElementsByTagName("input");
		var valor = 0;
		var comparador = "|"+columna;
		var cantidad;
    	for(i=0;i<inputs.length;i++){
			if(inputs[i].name.substring(comienzo+1)==comparador){
				cantidad = (isNaN(parseInt(inputs[i].value))) ? "0" : inputs[i].value;
				valor += parseInt(cantidad);
        	}
    	document.getElementById("TC_"+columna).value=valor;
        }
    }
    
    function sumaTotal(){
    	var inputs = document.getElementsByTagName("input");
		var valor = 0;
		var comparador = "TF_";
    	for(i=0;i<inputs.length;i++){
			if(inputs[i].name.substring(0,3)==comparador){
				valor += parseInt(inputs[i].value);
        	}
    	document.getElementById("total").value=valor;
        }
    }
    
    function calculaSigno(identificador) {
        var signo = (document.getElementById("signo").value=='-'?-1:1);
        var unidades = desformateaNumero(document.getElementById(identificador).value);
        unidades = Math.abs(unidades) * signo;
        document.getElementById(identificador).value = formateaNumero(unidades, 0);
    }    
</script>

<cmz:panel>
  <cmz:cabeceraPanel titulo="Introducción Masiva de Artículos">
    <cmz:acciones>
       <cmz:accionSalvarLinea onclick="aceptarRegistroMasivoPestaña();"/>
       <cmz:accion onclick="cancelarRegistroMasivoPestaña();" titulo="Cancelar" icono="comun/images/iconos/cancelar.gif"></cmz:accion>
    </cmz:acciones>
  </cmz:cabeceraPanel>
  
  <input type="hidden" id="signo" name="signo" value="${pedido.conceptoAlmacen.signo}"/>
   
  <cmz:cuerpoPanel>
    <table cellpadding="2px" cellspacing="2px" border="0px">
      <tr>
        <td>Artículo:</td>
        <td colspan="3">
          <cmz:ayuda nombreAyuda="ARTICULOS" requerido="true" soloLectura="false" onclick="ayudaArticulos();" >
            <cmz:codigoAyuda idCodigo="codArticulo" valorCodigo="${desgloses.codArticulo}" longitudMaximaCodigo="13" onchange="ayudaArticulosCambio();" anchuraCodigo="90px"></cmz:codigoAyuda>
            <cmz:descripcionAyuda idDescripcion="desArticulo" valorDescripcion="${desgloses.desArticulo}" anchuraDescripcion="300px"></cmz:descripcionAyuda>
          </cmz:ayuda>
        </td>
      </tr>
    </table>
    <c:choose>
        <c:when test="${desgloses != null && !desgloses.desglose1Activo && !desgloses.desglose2Activo}">
        	<table class="tablaDesglose" cellpadding="0" cellspacing="0" border="0">
        	  <thead>
		   		<tr>
		   		  <th style="height:20px;width:80px">CANTIDAD</th>
        		  <th class="total"><input class="total" type="text" id="cantDesglose|*|*" name="cantDesglose|*|*" onfocus="this.select()" maxlength="3" value=""/></th>
        		</tr>
        	  </thead>
        	</table>
        </c:when>
        <c:when test="${desgloses != null}">
		    <table class="tablaDesglose" cellpadding="0" cellspacing="0" border="0">
		    	<thead>
		    		<tr>
		    			<th style="height:20px;width:80px">
			    			<c:if test="${desgloses.desglose1Activo}">
			    			${formularioPedidoVentaBackoffice.tituloDesglose1}
			    			</c:if>
			    			<c:if test="${desgloses.desglose1Activo && desgloses.desglose2Activo }">
			    			/
			    			</c:if>
			    			<c:if test="${desgloses.desglose2Activo}">
			    			${formularioPedidoVentaBackoffice.tituloDesglose2}
			    			</c:if>
		    			</th>
		    			<c:forEach items="${desgloses.desgloses2}" var="item2">
      					<th>&nbsp;
							<c:if test="${item2 != '*'}">
			    			${item2}
			    			</c:if>
						</th>
   						</c:forEach>
   						<th class="total">TOTAL</th>
   					</tr> 
		    	</thead>
		   	 	<tbody>
		    	<!--  cada fila -->
		    		<c:forEach items="${desgloses.desgloses1}" var="item1">
    				<tr>
    					<td>&nbsp;
    						<c:if test="${item1 != '*'}">
			    			${item1}
			    			</c:if>
    					</td>
   						<c:forEach items="${desgloses.desgloses2}" var="item2">
      					<c:choose>	
      						<c:when test="${desgloses.desgloses[item1][item2] != null}">
      							<td><input type="text" id="cantDesglose|${item1}|${item2}" name="cantDesglose|${item1}|${item2}" onfocus="this.select()" onchange="cambiaDesglose('cantDesglose|${item1}|${item2}')" maxlength="3" value=""/></td>
      						</c:when>
      						<c:otherwise>
      							<td class="vacio">&nbsp;</td>
      						</c:otherwise>
      					</c:choose>
   						</c:forEach> 
   						<td class="totales totalesC" ><input class="totales totalesC" type="text" id="TF_${item1}" name="TF_${item1}" maxlength="3" value="0" disabled/></td>
   					</tr>
					</c:forEach>
				<!-- ultima fila -->
					<tr>
						<td class="total">TOTAL</td>
						<c:forEach items="${desgloses.desgloses2}" var="item2">
      					<td class="totales"><input class="totales" type="text" id="TC_${item2}" name="TC_${item2}" maxlength="3" value="0" disabled/></td>
   						</c:forEach> 
   						<td class="total" ><input class="total" type="text" id="total" name="total" maxlength="3" value="0" disabled/></td>
   					</tr>
				</tbody>
		    </table>
    	</c:when>
       	<c:otherwise>
       		<c:if test="${!empty desgloses.codArticulo}">
       		<td style="margin:10px;font-weight:bold">NO EXISTEN DESGLOSES PARA ESTE ARTICULO</td>
       		</c:if>
       	</c:otherwise>
    </c:choose>
  </cmz:cuerpoPanel>
</cmz:panel>
