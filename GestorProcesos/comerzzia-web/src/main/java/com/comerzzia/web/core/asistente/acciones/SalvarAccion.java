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
import com.comerzzia.servicios.core.empresas.ServicioEmpresas;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class SalvarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("empresas?accion=ver", Vista.INTERNA);
	
	
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
    		
    		AsistenteConfiguracionEmpresaBean asistente = (AsistenteConfiguracionEmpresaBean) sesion.getAttribute(WebKeys.ASISTENTE_CONFIGURACION_BEAN);
    		
    		ServicioEmpresas.crearEmpresaDesdeAsistente(datosSesion, asistente);
    		
    		// Añadimos la empresa a la sesión
    		datosSesion.setEmpresa(asistente.getEmpresa());

    		// Liberamos recursos
    		sesion.removeAttribute(WebKeys.ASISTENTE_CONFIGURACION_BEAN);
    		
    		return NEXT_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
}
