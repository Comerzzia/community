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

import com.comerzzia.persistencia.backoffice.articulos.ParametrosBuscarConsultaArticulosBean;
import com.comerzzia.servicios.backoffice.articulos.ServicioConsultaArticulos;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.backoffice.articulos.ui.FormularioConsultaArticulosBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class BuscarAccion extends Accion {
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "buscar";
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
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Inicializamos el Formulario
    		FormularioConsultaArticulosBean formulario = (FormularioConsultaArticulosBean) sesion.getAttribute(WebKeys.FORMULARIO_CONSULTA_ARTICULOS);
    		formulario.inicializar();
    		
    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarConsultaArticulosBean param = (ParametrosBuscarConsultaArticulosBean) formulario.getParam();
    		
    		// Realizamos la búsqueda
            PaginaResultados pagina = ServicioConsultaArticulos.consultar(param, datosSesion);
            formulario.setRegistros(pagina.getPagina());
            
            if(pagina.getNumeroTotalPaginas() > 1)
            	setMensajeAviso(request, "El número de registros obtenido en la consulta es mayor al " +
            			"número de resultados especificado. Sólo se muestran los " + param.getTamañoPagina() + 
            			" primeros registros.");
            
            return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
}
