/**
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
 */

package com.comerzzia.web.backoffice.articulos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.backoffice.articulos.ConsultaArticulosBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.backoffice.articulos.ui.FormularioConsultaArticulosBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class VerFormularioAccion extends Accion {

	private static final String CODALMACEN_SELECCIONADO = "CODALMACEN_SELECCIONADO";
	private static final Vista NEXT_PAGE = new Vista("backoffice/articulos/buscar/jsp/buscar.jsp", Vista.INTERNA);

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
	public String getNombre() {
		return "verFormulario";
	}
	
	/**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// Actualizamos el formulario
			FormularioConsultaArticulosBean formulario = (FormularioConsultaArticulosBean) sesion.getAttribute(WebKeys.FORMULARIO_CONSULTA_ARTICULOS);
			inicializaPestañaActiva(formulario, datosSesion, request);
			
			return NEXT_PAGE;
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	private void inicializaPestañaActiva(FormularioConsultaArticulosBean formulario, DatosSesionBean datosSesion, 
				HttpServletRequest request) throws Exception {
		
		// Si el formuario esta en modo ficha, cargamos los datos del articulo seleccionado
		if(formulario.isModoVisualizacionFicha()){
			// Obtenemos el artículo
			ConsultaArticulosBean articulo = (ConsultaArticulosBean) formulario.getRegistroActivo();
			articulo.setCodAlmacen((String) datosSesion.getAtributos().get(CODALMACEN_SELECCIONADO));
			
			switch (formulario.getPestañaActiva()) {
			case 0:
				formulario.cargarTarifasArticulos(articulo, datosSesion);
				formulario.cargarPromocionesArticulos(articulo, datosSesion);
				break;
			case 1:
				formulario.cargarAlmacenesArticulos(articulo, datosSesion);
				break;	
			}
		}
	}
}
