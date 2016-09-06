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

<jsp:useBean id="permisos" class="com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean" scope="request" />
<jsp:useBean id="trabajoInforme" type="com.comerzzia.persistencia.core.informes.TrabajoInformeBean" scope="session" />

    <script type="text/javascript">
	    function editarVersionInforme(idVersion){
	    }

	    function borrarVersionInforme(idVersion){
	    }

	    function nuevaVersionInforme(){
		}
    </script>
    
            <cmz:panel>
            	<cmz:cabeceraPanel titulo="Versiones"/>
			  	<cmz:cuerpoPanel>
				  	<c:forEach items="${listaVersionesInforme}" var="version">
			            <cmz:panel>
			              <cmz:cabeceraPanel titulo="${version.titulo}" >
					          <cmz:acciones numAccionesVisibles="1" idAcciones="informe_versiones">
					              <cmz:accion titulo="Imprimir" icono="comun/images/iconos/impresora.gif" descripcion="Imprimir informe" onclick="imprimir(${version.idVersion})" />
					          </cmz:acciones>
				          </cmz:cabeceraPanel>
			              <cmz:cuerpoPanel>
			                <table cellpadding="0px" cellspacing="0px" border="0px">
			                  <tr>
			                    <td><c:out value="${version.descripcion}"></c:out></td>
			                  </tr>
			                </table>
			              </cmz:cuerpoPanel>
			            </cmz:panel>
			         </c:forEach>
			    </cmz:cuerpoPanel>
            </cmz:panel>
    
