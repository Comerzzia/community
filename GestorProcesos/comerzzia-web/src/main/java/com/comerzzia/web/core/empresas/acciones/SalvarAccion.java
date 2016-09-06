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

package com.comerzzia.web.core.empresas.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.empresas.EmpresaBean;
import com.comerzzia.servicios.core.empresas.EmpresaConstraintViolationException;
import com.comerzzia.servicios.core.empresas.EmpresaException;
import com.comerzzia.servicios.core.empresas.ServicioEmpresas;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SalvarAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("core/empresas/mantenimiento/jsp/empresa.jsp", Vista.INTERNA);

	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "salvar";
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
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEditar()) {
    			return SIN_PERMISO;
    		}

    		EmpresaBean empresa = (EmpresaBean) sesion.getAttribute(WebKeys.EMPRESA_BEAN);
    		//Recogemos los parámetros
    		setParameters(request, empresa);
    		
    		//Guardamos los cambios
    		ServicioEmpresas.salvar(empresa, datosSesion);
    		
    		//Volvemos a añadir la empresa a la sesión
    		datosSesion.setEmpresa(empresa);
    		
    		// Liberamos recursos
    		sesion.removeAttribute(WebKeys.EMPRESA_BEAN);
    		    		
       		// Volvemos a consultar el registro
    		try {
    			empresa = ServicioEmpresas.consultar(datosSesion);
    			
    			sesion.setAttribute(WebKeys.EMPRESA_BEAN, empresa);
    			setMensaje(request, "La empresa se ha salvado correctamente");
    			return NEXT_PAGE;
    		}
    		catch (Exception e) {
    			setMensajeError(request, "La empresa se ha salvado correctamente pero no se ha podido acceder al registro", e);
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    	}
    	catch (EmpresaConstraintViolationException e) {
    		setMensajeError(request, e.getMessage());
    		return NEXT_PAGE;
    	}
    	catch (EmpresaException e) {
    		setError(request, e);
            
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
    
    private void setParameters(HttpServletRequest request, EmpresaBean empresa){
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
    	
    }
}
