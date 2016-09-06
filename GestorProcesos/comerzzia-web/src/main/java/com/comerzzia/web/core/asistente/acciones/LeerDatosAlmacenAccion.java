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

package com.comerzzia.web.core.asistente.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.empresas.AsistenteConfiguracionEmpresaBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.util.log.Logger;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class LeerDatosAlmacenAccion extends Accion {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(LeerDatosAlmacenAccion.class);
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
	public String getNombre() {
		return "leerDatosAlmacen";
	}
	
	/**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();			
			
			AsistenteConfiguracionEmpresaBean asistente = (AsistenteConfiguracionEmpresaBean) sesion.getAttribute(WebKeys.ASISTENTE_CONFIGURACION_BEAN);
			asistente.setPasoAlmacen();
			
			log.debug("ejecutar() - paso=" + asistente.getPaso());
			
			leerAlmacen(asistente, request);
	    	
            return getControlador().getAccion("verFormulario").ejecutar(request);
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	private void leerAlmacen(AsistenteConfiguracionEmpresaBean asistente, HttpServletRequest request) {
		AlmacenBean almacen = asistente.getAlmacen();
		almacen.setDesAlm(request.getParameter("desAlm"));
		almacen.setDomicilio(request.getParameter("domicilio"));
		almacen.setPoblacion(request.getParameter("poblacion"));
		almacen.setProvincia(request.getParameter("provincia"));
		almacen.setCp(request.getParameter("cp"));
		almacen.setTelefono1(request.getParameter("telefono1"));
		almacen.setTelefono2(request.getParameter("telefono2"));
		almacen.setFax(request.getParameter("fax"));
		almacen.setPersonaContacto(request.getParameter("personaContacto"));
		asistente.setVentaPublico(request.getParameter("ventaPublico") != null);
	}
}
