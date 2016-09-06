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

package com.comerzzia.web.general.unidadesmedida.etiquetas.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.unidadesmedida.etiquetas.UnidadesMedidaEtiquetasBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.unidadesmedida.etiquetas.ServicioUnidadesMedidaEtiquetas;
import com.comerzzia.servicios.general.unidadesmedida.etiquetas.UnidadesMedidaEtiquetaException;
import com.comerzzia.servicios.general.unidadesmedida.etiquetas.UnidadesMedidaEtiquetaNotFoundException;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class VerAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("general/unidades_medida/etiquetas/mantenimiento/jsp/unidadesMedidaEtiqueta.jsp", Vista.INTERNA);
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "ver";
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
    		
    		// Obtenemos la Unidad de medida de etiquetas
    		String cod_UM_Etiqueta = request.getParameter(WebKeys.ID_OBJETO);
    		UnidadesMedidaEtiquetasBean umEtiqueta = ServicioUnidadesMedidaEtiquetas.consultar(cod_UM_Etiqueta, datosSesion);
    		
    		sesion.setAttribute(WebKeys.UNIDADES_MEDIDA_ETIQUETA_BEAN, umEtiqueta);
    		    		
    		return NEXT_PAGE;
    	}
    	catch (UnidadesMedidaEtiquetaNotFoundException e) {
    		// Si no se encuentra el registro volvemos al buscador y enviamos en mensaje de error
            setMensajeError(request, "No se ha encontrado el registro", e);
            return getControlador().getAccion("buscar").ejecutar(request);
    	}
    	catch (UnidadesMedidaEtiquetaException e) {
            setError(request, e);
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
}
