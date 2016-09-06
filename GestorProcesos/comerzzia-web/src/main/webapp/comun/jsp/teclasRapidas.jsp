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

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Comerzzia</title>
    
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="comun/css/comerzzia.css" />
    
    <script type="text/javascript" language="javascript" src="comun/js/comun.js"></script>
    <script type="text/javascript" language="javascript" src="comun/js/mantenimiento.js"></script>

    <script type="text/javascript">
	    function aceptar() {
	    	window.close();
	    }
	    function keyDownEnter(){
			aceptar();
		}
	    function keyDownEsc(){
			aceptar();
		}
    </script>

  </head>
  
	<body onkeydown="keyDown(event);">
		<table cellspacing="0" cellpadding="0" class="cuadro">
			<tbody>
				<tr>
					<td style="width: 7px; height: 7px; background: url(&quot;comun/images/tablas/esquinas.gif&quot;) repeat scroll 0pt -88px transparent;"></td>
					<td background="comun/images/tablas/horizontal.gif" style="background-position: 0pt 7px;"></td>
					<td style="width: 7px; height: 7px; background: url(&quot;comun/images/tablas/esquinas.gif&quot;) repeat scroll 0pt -81px transparent;"></td>
				</tr>
				<tr height="16" style="background-color: rgb(238, 242, 247);">
					<td width="4" style="background: url(&quot;comun/images/tablas/vertical.gif&quot;) repeat-y scroll -11px 0pt transparent;"></td>
					<td class="fondoSecundario">
						<table width="100%" cellspacing="0" cellpadding="0">
							<tbody>
							<tr>
								<td width="22"><img onerror="this.src='comun/images/menu/menu_item.gif'" src="comun/images/iconos/teclasRapidas.gif" id="_icono_menu_item"></td>
								<td><span class="titulo">Teclas R&aacute;pidas</span></td>
							</tr>
							</tbody>
						</table>
					</td>
					<td width="4" style="background: url(&quot;comun/images/tablas/vertical.gif&quot;) repeat scroll 7px 0pt transparent;"></td>
				</tr>
				<tr>
					<td style="background: url(&quot;comun/images/tablas/esquinas.gif&quot;) repeat scroll 0pt 44px transparent;"><img width="7" height="7" src="comun/images/tablas/vacio.gif"></td>
					<td style="background: url(&quot;comun/images/tablas/horizontal.gif&quot;) repeat scroll 1px 0pt transparent;"></td>
					<td style="background: url(&quot;comun/images/tablas/esquinas.gif&quot;) repeat scroll 7px 37px transparent;"><img width="7" height="7" src="comun/images/tablas/vacio.gif"></td>
				</tr>
			
				<tr style="vertical-align: top;">
					<td width="4" style="background: url(&quot;comun/images/tablas/vertical.gif&quot;) repeat-y scroll -4px 0pt transparent;"></td>
					<td>
						<table cellspacing="2" cellpadding="0" border="0" id="cuadroBusqueda" class="cuadroBusquedaDesplegable">
							<tbody>
							<tr>
								<td>
									<div id="trapidas">
										<p class="cabeceraResultados">En cualquier pantalla de b&uacute;squeda</p>
										<div class="teclaGrupo"><label>Consultar</label><div class="teclaComb"><div class="teclaEspec">Intro</div></div></div>
										<div class="teclaGrupo"><label>Nuevo Registro</label><div class="teclaComb"><div class="teclaEspec">Alt</div><div class="mas">+</div><div class="teclaBase">Ins</div></div></div>
										<p class="cabeceraResultados">En un registro en modo edici&oacute;n</p>
										<div class="teclaGrupo"><label>Salvar el registro actual</label><div class="teclaComb"><div class="teclaBase">F9</div></div></div>
										<div class="teclaGrupo"><label>Cancelar los cambios realizados</label><div class="teclaComb"><div class="teclaEspec">Esc</div></div></div>
										<div class="teclaGrupo"><label>Nueva l&iacute;nea</label><div class="teclaComb"><div class="teclaEspec">Alt</div><div class="mas">+</div><div class="teclaBase">N</div></div></div>
										<p class="cabeceraResultados">En una l&iacute;nea en modo edici&oacute;n</p>
										<div class="teclaGrupo"><label>Acepta los cambios realizados en la l&iacute;nea</label><div class="teclaComb"><div class="teclaEspec">Alt</div><div class="mas">+</div><div class="teclaBase">L</div></div></div>
										<p class="cabeceraResultados">En el listado de l&iacute;neas de un registro</p>
										<div class="teclaGrupo"><label>Cambio al modo de visualizaci&oacute;n Tabla/Ficha</label><div class="teclaComb"><div class="teclaEspec">Alt</div><div class="mas">+</div><div class="teclaBase">M</div></div></div>
										<p class="cabeceraResultados">En cualquier campo de ayuda que se pueda modificar</p>
										<div class="teclaGrupo"><label>Abrir ventana de ayuda</label><div class="teclaComb"><div class="teclaEspec">Alt</div><div class="mas">+</div><div class="teclaBase">W</div></div></div>
									</div>
								</td>
							</tr>
							</tbody>
						</table>
					</td>
					<td width="4" style="background: url(&quot;comun/images/tablas/vertical.gif&quot;) repeat-y scroll 6px 0pt transparent;"></td>
				</tr>
				<tr>
					<td style="background: url(&quot;comun/images/tablas/esquinas.gif&quot;) repeat scroll 0pt 88px transparent;"><img width="7" height="4" alt="" src="comun/images/tablas/vacio.gif"></td>
					<td style="background: url(&quot;comun/images/tablas/horizontal.gif&quot;) repeat scroll 0pt -7px transparent; width: 100%; height: 4px;"></td>
					<td style="background: url(&quot;comun/images/tablas/esquinas.gif&quot;) repeat scroll 0pt 84px transparent;"><img width="7" height="4" alt="" src="comun/images/tablas/vacio.gif"></td>
				</tr>
			</tbody>
		</table>
	</body>
</html>
