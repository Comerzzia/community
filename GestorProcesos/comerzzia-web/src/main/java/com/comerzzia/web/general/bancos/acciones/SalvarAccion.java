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

package com.comerzzia.web.general.bancos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.comerzzia.persistencia.general.bancos.BancoBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.bancos.BancoConstraintViolationException;
import com.comerzzia.servicios.general.bancos.BancoException;
import com.comerzzia.servicios.general.bancos.ServicioBancos;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SalvarAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("general/bancos/mantenimiento/jsp/banco.jsp", Vista.INTERNA);

	
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
    		if (!permisos.isPuedeAñadir()) {
    			return SIN_PERMISO;
    		}
    		
    		BancoBean banco = (BancoBean) sesion.getAttribute(WebKeys.BANCO_BEAN);
    		if (banco.getEstadoBean() == Estado.NUEVO) {
    			banco.setCodBan(request.getParameter("codBan"));
    			banco.setCodEmp(datosSesion.getEmpresa().getCodEmp());
    		}
    		
    		setParameters(request, banco);
    		ServicioBancos.salvar(banco, datosSesion);
    		
    		//Liberamos Recursos
    		sesion.removeAttribute(WebKeys.BANCO_BEAN);
    		
    		//Volvemos a consultar el registro
    		try {
    			banco = ServicioBancos.consultar(banco.getCodBan(), datosSesion);
    			
    			sesion.setAttribute(WebKeys.BANCO_BEAN, banco);
    			setMensaje(request, "El banco se ha salvado correctamente");
    			return NEXT_PAGE;
    		}
    		catch (Exception e) {
        		setMensajeError(request, "El banco se ha salvado correctamente pero no se ha podido acceder al registro", e);
        		return getControlador().getAccion("buscar").ejecutar(request);
    		}
    	}
    	catch (BancoConstraintViolationException e) {
    		setMensajeError(request, e.getMessage());
    		return NEXT_PAGE;
    	}
    	catch (BancoException e) {
    		setError(request, e);
            
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
    private void setParameters(HttpServletRequest request, BancoBean banco){
    	
    	banco.setDesBan(request.getParameter("desBan"));
		banco.setDomicilio(request.getParameter("domicilio")); 
		banco.setPoblacion(request.getParameter("poblacion"));
		banco.setProvincia(request.getParameter("provincia"));
		banco.setTelefono1(request.getParameter("telefono1"));
		banco.setTelefono2(request.getParameter("telefono2"));
		banco.setFax(request.getParameter("fax"));
		banco.setCcc(request.getParameter("ccc"));
		banco.setCif(request.getParameter("cif"));
		banco.setCp(request.getParameter("cp"));
		banco.setObservaciones(request.getParameter("observaciones"));  		
		banco.setActivo(request.getParameter("activo") != null); 
    	
    }
}
