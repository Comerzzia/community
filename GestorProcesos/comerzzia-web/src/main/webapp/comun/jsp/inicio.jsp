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

<jsp:useBean id="mensajes" class="com.comerzzia.servicios.general.inicio.MensajesInicio" scope="request" />

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
  </head>

  <body>
    <cmz:main>
      <cmz:panelCMZ>
        <cmz:cabeceraPanelCMZ titulo="Inicio" icono="comun/images/iconos/comerzzia.png"></cmz:cabeceraPanelCMZ>
          <cmz:cuerpoPanelCMZ>
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Avisos del Sistema"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <div style="height:100px">
                  <c:choose>
                    <c:when test="${!empty mensajes.avisosSistema}">
                      <c:forEach var="mensaje" items="${mensajes.avisosSistema}">
                        <a href="${mensaje.url}" style="color: red">${mensaje.mensaje}</a>
                        <br>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      No hay ningún mensaje del Sistema
                    </c:otherwise>
                  </c:choose>
                </div>
              </cmz:cuerpoPanel>
            </cmz:panel>
            
            <cmz:panel>
              <cmz:cabeceraPanel titulo="Elementos Pendientes"></cmz:cabeceraPanel>
              <cmz:cuerpoPanel>
                <div style="height:100px">
                  <c:choose>
                    <c:when test="${!empty mensajes.pendientesUsuario}">
                      <c:forEach var="mensaje" items="${mensajes.pendientesUsuario}">
                        <a href="${mensaje.url}" style="color: red">${mensaje.mensaje}</a>
                        <br>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      No existen elementos pendientes de su atención
                    </c:otherwise>
                  </c:choose>
                </div>
              </cmz:cuerpoPanel>
            </cmz:panel>
          </cmz:cuerpoPanelCMZ>
      </cmz:panelCMZ>
    </cmz:main>
  </body>
</html>
