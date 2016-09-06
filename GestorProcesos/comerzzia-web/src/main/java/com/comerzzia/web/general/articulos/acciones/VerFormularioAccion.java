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

package com.comerzzia.web.general.articulos.acciones;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.servicios.general.articulos.codigosbarras.ServicioCodigosBarrasArticulos;
import com.comerzzia.servicios.general.articulos.fotos.ServicioFotosArticulos;
import com.comerzzia.servicios.general.articulos.unidadesmedidas.ServicioUnidadesMedidasArticulos;
import com.comerzzia.servicios.ventas.promociones.articulos.ServicioArticulosPromociones;
import com.comerzzia.servicios.ventas.tarifas.articulos.ServicioArticulosTarifas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.articulos.ui.FormularioArticuloBean;


public class VerFormularioAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("general/articulos/mantenimiento/jsp/articulo.jsp", Vista.INTERNA);

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
			FormularioArticuloBean formulario = (FormularioArticuloBean) sesion.getAttribute(WebKeys.FORMULARIO_ARTICULO);
			inicializaPestañaActiva(formulario, datosSesion, request);
			
			return NEXT_PAGE;
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	
	private void inicializaPestañaActiva(FormularioArticuloBean formulario, DatosSesionBean datosSesion, HttpServletRequest request) throws Exception {
		// Obtenemos el artículo
		ArticuloBean articulo = (ArticuloBean) formulario.getRegistroActivo();
		
		// Actualizamos la pestaña activa
		switch (formulario.getPestañaActiva()) {
			case 2:
				if (!articulo.isCodigosCargados()){
					articulo.setCodigosBarras(ServicioCodigosBarrasArticulos.consultarCodigosBarras(articulo.getCodArticulo(), datosSesion));
					articulo.setCodigosCargados(true);
					formulario.getFormularioPestañaActiva().setRegistros(articulo.getCodigosBarras());
				}
				break;
				
			case 3:
				if (!articulo.isUnidadesCargadas()){
					articulo.setUnidadesMedidas(ServicioUnidadesMedidasArticulos.consultarUnidadesMedidas(articulo.getCodArticulo(), datosSesion));
					articulo.setUnidadesCargadas(true);
					formulario.getFormularioPestañaActiva().setRegistros(articulo.getUnidadesMedidas());
					request.setAttribute("lstUnidadesMedidas", formulario.obtenerListaUnidadesMedidas());
				}
				break;
				
			case 4:
				if (!articulo.isAlmacenesCargados()){
					articulo.setAlmacenes(ServicioAlmacenes.consultarAlmacenesArticulo(articulo.getCodArticulo(), datosSesion));
					articulo.setAlmacenesCargados(true);
					formulario.getFormularioPestañaActiva().setRegistros(articulo.getAlmacenes());
				}
				break;
			
			case 5:
				if (!articulo.isTarifasCargadas()){
					articulo.setTarifas(ServicioArticulosTarifas.consultarTarifasArticulo(articulo.getCodArticulo(), datosSesion));
					articulo.setTarifasCargadas(true);
					formulario.getFormularioPestañaActiva().setRegistros(articulo.getTarifas());
					//cargamos las promociones del artículo.
					List<ArticuloPromocionBean> promocionesArticulo = ServicioArticulosPromociones.consultar(articulo.getCodArticulo(), datosSesion);
					articulo.setPromociones(promocionesArticulo);
				}
				break;
			case 6:
				if (!articulo.isFotosCargadas()){
					articulo.setFotos(ServicioFotosArticulos.consultar(articulo.getCodArticulo(), datosSesion));
					articulo.setFotosCargadas(true);
					formulario.getFormularioPestañaActiva().setRegistros(articulo.getFotos());
				}
				break;
		}
	}
}
