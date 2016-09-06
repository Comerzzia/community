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

<c:forEach items="${formularioSincronizacion.formularioPestañaActiva.registros}" var="listaTrabajos">
  <cmz:panel>
    <cmz:cabeceraPanel titulo="${listaTrabajos.titulo}"></cmz:cabeceraPanel>
  	<cmz:cuerpoPanel>
      <cmz:lista>
        <cmz:cabeceraLista>
          <cmz:itemCabeceraLista nombre="Tienda"></cmz:itemCabeceraLista>
          <cmz:itemCabeceraLista nombre="Descripción"></cmz:itemCabeceraLista>
          <cmz:itemCabeceraLista nombre="Estado" estilo="text-align: center;"></cmz:itemCabeceraLista>
          <cmz:itemCabeceraLista nombre="Fecha Inicio"></cmz:itemCabeceraLista>
          <cmz:itemCabeceraLista nombre="Fecha Próxima Ejec."></cmz:itemCabeceraLista>
          <cmz:itemCabeceraLista nombre="Intervalo"></cmz:itemCabeceraLista>
          <cmz:itemCabeceraLista nombre="Fecha Última Ejec."></cmz:itemCabeceraLista>
          <cmz:itemCabeceraLista nombre="Resultado" estilo="text-align: center;"></cmz:itemCabeceraLista>
          <cmz:itemCabeceraLista nombre="Acciones" estilo="text-align: center;"></cmz:itemCabeceraLista>
        </cmz:cabeceraLista>
        <cmz:contenidoLista variable="trabajo" lista="${listaTrabajos.listaTrabajos}">
          <cmz:itemContenidoLista valor="${trabajo.codAlmacen}" onclick="verTrabajo('${trabajo.idTrabajo}');"></cmz:itemContenidoLista>
          <cmz:itemContenidoLista valor="${trabajo.desAlmacen}"></cmz:itemContenidoLista>
          <cmz:itemContenidoLista alineacion="center">
            <c:choose>
              <c:when test="${trabajo.parado}">
                <img src="comun/images/iconos/stop.gif" border="0" align="middle" title="Parado" alt="Parado" />
              </c:when>
              <c:when test="${trabajo.arrancado}">
                <img src="comun/images/iconos/play.gif" border="0" align="middle" title="Arrancado" alt="Arrancado" />
              </c:when>
              <c:when test="${trabajo.pausado}">
                <img src="comun/images/iconos/pause.gif" border="0" align="middle" title="Pausado" alt="Pausado" />
              </c:when>
              <c:otherwise>&nbsp;</c:otherwise>
            </c:choose>
          </cmz:itemContenidoLista>
          <cmz:itemContenidoLista>
            <fmt:formatDate value="${trabajo.fechaInicio}" pattern="dd/MM/yyyy HH:mm:ss"/>
          </cmz:itemContenidoLista>
          <cmz:itemContenidoLista>
            <fmt:formatDate value="${trabajo.fechaProximaEjecucion}" pattern="dd/MM/yyyy HH:mm:ss"/>
          </cmz:itemContenidoLista>
          <cmz:itemContenidoLista valor="${trabajo.planificacion}"></cmz:itemContenidoLista>
          <cmz:itemContenidoLista>
            <fmt:formatDate value="${trabajo.fechaUltimaEjecucion}" pattern="dd/MM/yyyy HH:mm:ss"/>
          </cmz:itemContenidoLista>
          <cmz:itemContenidoLista valor="${trabajo.resultado}" alineacion="center">
            <c:choose>
              <c:when test="${trabajo.resultado == 0}">
                <img src="comun/images/iconos/ok.gif" border="0" align="middle" title="<c:out value="${trabajo.observaciones}" />" alt="<c:out value="${trabajo.observaciones}" />" />
              </c:when>
              <c:when test="${trabajo.resultado == 1}">
                <img src="comun/images/iconos/aviso.gif" border="0" align="middle" title="<c:out value="${trabajo.observaciones}" />" alt="<c:out value="${trabajo.observaciones}" />" />
              </c:when>
              <c:when test="${trabajo.resultado == 2}">
                <img src="comun/images/iconos/error.gif" border="0" align="middle" title="<c:out value="${trabajo.observaciones}" />" alt="<c:out value="${trabajo.observaciones}" />" />
              </c:when>
            </c:choose>
          </cmz:itemContenidoLista>
          <cmz:acciones alineacion="center">
            <cmz:accion icono="comun/images/iconos/ver.gif" onclick="verTrabajo('${trabajo.idTrabajo}');" descripcion="Ver Trabajo"></cmz:accion>
            <c:if test="${trabajo.parado || trabajo.pausado}">
              <cmz:accion icono="comun/images/iconos/editar.gif" onclick="editarTrabajo('${trabajo.idTrabajo}');" descripcion="Editar Trabajo"></cmz:accion>
            </c:if>
            <c:if test="${trabajo.parado || trabajo.pausado}">
              <cmz:accion icono="comun/images/iconos/play.gif" onclick="arrancarTrabajo('${trabajo.idTrabajo}');" descripcion="Arrancar Trabajo"></cmz:accion>
            </c:if>
            <c:if test="${trabajo.pausado}">
              <cmz:accion icono="comun/images/iconos/stop.gif" onclick="pararTrabajo('${trabajo.idTrabajo}');" descripcion="Detener Trabajo"></cmz:accion>
            </c:if>
            <c:if test="${trabajo.arrancado}">
              <cmz:accion icono="comun/images/iconos/pause.gif" onclick="pausarTrabajo('${trabajo.idTrabajo}');" descripcion="Pausar Trabajo"></cmz:accion>
              <cmz:accion icono="comun/images/iconos/stop.gif" onclick="pararTrabajo('${trabajo.idTrabajo}');" descripcion="Detener Trabajo"></cmz:accion>
            </c:if>
          </cmz:acciones>
        </cmz:contenidoLista>
      </cmz:lista>
    </cmz:cuerpoPanel>
  </cmz:panel>
</c:forEach>
