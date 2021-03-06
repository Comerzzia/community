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

package com.comerzzia.web.tesoreria.remesas.cobros.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.cobros.totales.TotalesDocumentosCobrosBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.cobros.ServicioCobros;
import com.comerzzia.servicios.tesoreria.remesas.cobros.RemesaCobro;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.remesas.cobros.ui.FormularioRemesaCobroBean;

public class VerFormularioAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("tesoreria/remesas/cobros/mantenimiento/jsp/remesa.jsp", Vista.INTERNA);

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
			FormularioRemesaCobroBean formulario = (FormularioRemesaCobroBean) sesion.getAttribute(WebKeys.FORMULARIO_REMESA_COBRO);
			inicializaPestañaActiva(formulario, datosSesion, request);

			return NEXT_PAGE;
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	private void inicializaPestañaActiva(FormularioRemesaCobroBean formulario,DatosSesionBean datosSesion, HttpServletRequest request)throws Exception {
		// Obtenemos la remesa
		RemesaCobro remesaCobro = (RemesaCobro) formulario.getRegistroActivo();

		if(remesaCobro.getEstadoBean() != Estado.NUEVO){
			remesaCobro.setDocumentos(ServicioCobros.consultarDocumentosRemesa(remesaCobro.getIdRemesa(), datosSesion));
			remesaCobro.setDocumentosCargados(true);
			formulario.getFormularioPestañaActiva().setRegistros(remesaCobro.getDocumentos());
			
			//Cargamos los totales también
			TotalesDocumentosCobrosBean totales = ServicioCobros.consultarTotalesRemesa(remesaCobro.getIdRemesa(), datosSesion);
			request.setAttribute("totales", totales);
		}
	}	
}

