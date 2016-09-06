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
import com.comerzzia.persistencia.core.empresas.EmpresaBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.util.log.Logger;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class LeerDatosEmpresaAccion extends Accion {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(LeerDatosEmpresaAccion.class);
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
	public String getNombre() {
		return "leerDatosEmpresa";
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
			asistente.setPasoEmpresa();
			
			log.debug("ejecutar() - paso=" + asistente.getPaso());						
    		
			leerEmpresa(asistente, request);
	    	
            return getControlador().getAccion("verFormulario").ejecutar(request);
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	private void leerEmpresa(AsistenteConfiguracionEmpresaBean asistente, HttpServletRequest request) {
		EmpresaBean empresa = asistente.getEmpresa();
		empresa.setDesEmp(request.getParameter("desEmp"));
    	empresa.setDomicilio(request.getParameter("domicilio"));
    	empresa.setPoblacion(request.getParameter("poblacion"));
    	empresa.setProvincia(request.getParameter("provincia"));
    	empresa.setCp(request.getParameter("cp"));
    	empresa.setCif(request.getParameter("cif"));
    	empresa.setTelefono1(request.getParameter("telefono1"));
    	empresa.setTelefono2(request.getParameter("telefono2"));
    	empresa.setFax(request.getParameter("fax"));
    	empresa.setRegistroMercantil(request.getParameter("registroMercantil"));
    	
    	// Asignar al almacén los mismos datos de la dirección de la empresa para sugerirlos por defecto en el siguiente paso
    	AlmacenBean almacen = asistente.getAlmacen();
    	almacen.setDomicilio(empresa.getDomicilio());
    	almacen.setPoblacion(empresa.getPoblacion());
    	almacen.setProvincia(empresa.getProvincia());
    	almacen.setCp(empresa.getCp());
    	almacen.setTelefono1(empresa.getTelefono1());
    	almacen.setTelefono2(empresa.getTelefono2());
    	almacen.setFax(empresa.getFax());
	}
}
