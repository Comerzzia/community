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

package com.comerzzia.web.base;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.acciones.AccionBean;
import com.comerzzia.persistencia.core.informes.TrabajoInformeBean;
import com.comerzzia.persistencia.core.informes.VersionInformeBean;
import com.comerzzia.servicios.core.acciones.AccionException;
import com.comerzzia.servicios.core.acciones.ServicioAcciones;
import com.comerzzia.servicios.core.informes.InformeException;
import com.comerzzia.servicios.core.informes.InformeNotFoundException;
import com.comerzzia.servicios.core.informes.ServicioInformes;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.log.Logger;

public abstract class InformeAccion extends Accion{

	private static final Vista VIEWER_PAGE = new Vista("core/informes/jsp/viewer.jsp", Vista.INTERNA);
	private Vista ERROR;
	
    protected static Logger log;

	protected AccionBean accionMenu;

    public InformeAccion(){
        log = Logger.getMLogger(this.getClass());
		try {
    		accionMenu = ServicioAcciones.obtenerAccion(getNombreInforme());
		} 
        catch (AccionException e) {
			log.error("Error al obtener la acción asociada al informe " + getNombreInforme());
		}
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try{
			HttpSession session = request.getSession(false);
			String operacion = request.getParameter("operacion");
			DatosSesionBean datosSesion = (DatosSesionBean) request.getSession().getAttribute(WebKeys.DATOS_SESION);
			
			// Preguntamos por la operación. Por defecto, se ejecuta la operación nuevo.
            if (operacion == null || operacion.equals("nuevo")){
            	// comprobamos permisos
            	PermisosEfectivosAccionBean permisos = datosSesion.getPermisos(getAccionMenu());
    			if (!permisos.isPuedeEjecutar()) {
    				return SIN_PERMISO;
    			}
            	
            	// establecemos página de error
				ERROR = ERROR_PAGE;
				
				// creamos un nuevo trabajo para ese informe
				TrabajoInformeBean trabajoInforme = new TrabajoInformeBean();
				trabajoInforme.setIdInforme(getAccionMenu().getIdAccion());
				trabajoInforme.setInforme(getAccionMenu().getAccion());
				trabajoInforme.setTitulo(getAccionMenu().getTitulo());
				session.setAttribute(WebKeys.TRABAJO_INFORME, trabajoInforme);
				
				// consultamos lista de versiones disponibles
				List<VersionInformeBean> listaVersiones = ServicioInformes.consultarVersionesInforme(trabajoInforme.getIdInforme());
				request.setAttribute("listaVersionesInforme", listaVersiones);

				return nuevoInforme(request, trabajoInforme);
			}
			if (operacion.equals("imprimir")){ 
//            	// comprobamos permisos
//            	PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(getAccionMenu());
//    			if (!permisos.isPuedeEjecutar()) {
//    				return SIN_PERMISO;
//    			} // TODO: PERMISOS - informes: preguntamos de nuevo al imprimir?? en tal caso necesitamos un SIN_PERMISOS_WIN

    			// establecemos página de error
				ERROR = ERROR_WIN;

				TrabajoInformeBean trabajoInforme = (TrabajoInformeBean) session.getAttribute(WebKeys.TRABAJO_INFORME);
	        	String idVersion = request.getParameter("idVersion");
	        	if (idVersion == null || idVersion.isEmpty()){
	        		List<VersionInformeBean> listaVersiones = ServicioInformes.consultarVersionesInforme(trabajoInforme.getIdInforme());	
		        	trabajoInforme.setVersion(listaVersiones.get(0));
	        	}
	        	else{
		        	VersionInformeBean version = ServicioInformes.consultarVersionInforme(trabajoInforme.getIdInforme(), Long.parseLong(idVersion));
		        	trabajoInforme.setVersion(version);
	        	}
				
	        	// añadimos como parámetros los datos de la empresa
				trabajoInforme.addParametro("CODEMP", datosSesion.getEmpresa().getCodEmp());
				trabajoInforme.addParametro("DESEMP", datosSesion.getEmpresa().getDesEmp());

				imprimirInforme(request, trabajoInforme);
	        	return VIEWER_PAGE;
			}
			setMensaje(request, "No se ha indicado una operación correcta para ejecutar el informe.");
			return ERROR;
		}
		catch(InformeNotFoundException e){
			setMensaje(request, e.getMessage());
			return ERROR;
		} 
		catch (InformeException e) {
			return ERROR;
		}
		catch (Exception e){
			e.printStackTrace();
			return ERROR;
		}
		
	}
	
	public AccionBean getAccionMenu() {
		return this.accionMenu;
	}

	public String getNombre() {
		return getNombreInforme();
	}
	
	public abstract Vista nuevoInforme(HttpServletRequest request, TrabajoInformeBean trabajoInforme);

	public abstract void imprimirInforme(HttpServletRequest request, TrabajoInformeBean trabajoInforme) throws InformeException; 

	public abstract String getNombreInforme(); 

}
