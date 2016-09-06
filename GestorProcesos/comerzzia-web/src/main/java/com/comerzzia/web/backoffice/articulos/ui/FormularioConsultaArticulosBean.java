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

package com.comerzzia.web.backoffice.articulos.ui;

import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.backoffice.articulos.ConsultaArticulosBean;
import com.comerzzia.persistencia.backoffice.articulos.ParametrosBuscarConsultaArticulosBean;
import com.comerzzia.persistencia.general.almacenes.articulos.AlmacenArticuloBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.servicios.general.almacenes.articulos.AlmacenArticuloException;
import com.comerzzia.servicios.general.tiendas.tarifas.ServicioTarifasTiendas;
import com.comerzzia.servicios.general.tiendas.tarifas.TarifaTiendaException;
import com.comerzzia.servicios.ventas.promociones.PromocionException;
import com.comerzzia.servicios.ventas.promociones.PromocionNotFoundException;
import com.comerzzia.servicios.ventas.promociones.ServicioPromociones;
import com.comerzzia.servicios.ventas.promociones.articulos.ServicioArticulosPromociones;
import com.comerzzia.servicios.ventas.tarifas.articulos.ArticuloTarifaException;
import com.comerzzia.servicios.ventas.tarifas.articulos.ServicioArticulosTarifas;
import com.comerzzia.web.core.ui.FormularioBean;

public class FormularioConsultaArticulosBean extends FormularioBean {

	// Definición de los parametros de búsqueda del formulario
	private ParametrosBuscarConsultaArticulosBean param = new ParametrosBuscarConsultaArticulosBean();
	private FormularioBean pestañaDatosGenerales = new FormularioBean();
	private FormularioBean pestañaStock = new FormularioBean();
	
	// Atributo para saber la configuración de la variables
	// ARTICULOS.DESGLOSE1_TITULO y ARTICULOS.DESGLOSE1_TITULO
	private String tituloDesglose1 = null;
	private String tituloDesglose2 = null;
	
	/**
	 * Constructor
	 */
	public FormularioConsultaArticulosBean() {
		this.setParam(param);
		this.addPestaña(pestañaDatosGenerales);
		this.addPestaña(pestañaStock);
	}
	
	/* (non-Javadoc)
	 * @see com.comerzzia.web.core.ui.FormularioBean#inicializaRegistroActivo()
	 */
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();
	}
	
	public String getTituloDesglose1() {
		return tituloDesglose1;
	}

	public void setTituloDesglose1(String tituloDesglose1) {
		this.tituloDesglose1 = tituloDesglose1;
	}

	public String getTituloDesglose2() {
		return tituloDesglose2;
	}

	public void setTituloDesglose2(String tituloDesglose2) {
		this.tituloDesglose2 = tituloDesglose2;
	}
	
	public void cargarTarifasArticulos (ConsultaArticulosBean articulo, DatosSesionBean datosSesion) 
			throws TarifaTiendaException, ArticuloTarifaException {
		
		List<TarifaTiendaBean> tarifasTienda = ServicioTarifasTiendas.consultar(articulo.getCodAlmacen(), datosSesion);
		List<ArticuloTarifaBean> tarifasArticulo = ServicioArticulosTarifas.consultarTarifasArticulo(articulo.getCodArticulo(), datosSesion);
		
		List<ArticuloTarifaBean> resultado = new ArrayList<ArticuloTarifaBean>();
		// Obtengo la lista de tarifas del articulo que tiene la tienda
		if (tarifasTienda != null && tarifasArticulo != null) {
			for (ArticuloTarifaBean tarifaArticulo : tarifasArticulo) {
				for (int i = 0; i < tarifasTienda.size(); i++) {
					if ((tarifaArticulo.getCodTar().equals(tarifasTienda.get(i).getCodTarifa()))) {
						resultado.add(tarifaArticulo);
						break;
					}
				}
			}
		}
		articulo.setTarifas(resultado);
	}
	
	public void cargarPromocionesArticulos (ConsultaArticulosBean articulo, DatosSesionBean datosSesion) 
			throws TarifaTiendaException, PromocionException, PromocionNotFoundException {
		
		List<TarifaTiendaBean> tarifasTienda = ServicioTarifasTiendas.consultar(articulo.getCodAlmacen(), datosSesion);
		List<ArticuloPromocionBean> promocionesArticulo = ServicioArticulosPromociones.consultar(articulo.getCodArticulo(), datosSesion);
		
		List<ArticuloPromocionBean> resultado = new ArrayList<ArticuloPromocionBean>();
		// Obtengo la lista de promociones del articulo que tiene la tienda
		if (tarifasTienda != null && promocionesArticulo != null) {
			for (ArticuloPromocionBean promocionArticulo : promocionesArticulo) {
				String codTarifaPromocion = ServicioPromociones.consultar(promocionArticulo.getIdPromocion(), datosSesion).getCodTar();
				for (int i = 0; i < tarifasTienda.size(); i++) {
					if ((codTarifaPromocion.equals(tarifasTienda.get(i).getCodTarifa()))) {
						resultado.add(promocionArticulo);
						break;
					}
				}
			}
		}
		articulo.setPromociones(resultado);
	}
    
    public void cargarAlmacenesArticulos (ConsultaArticulosBean articulo, DatosSesionBean datosSesion) 
    		throws AlmacenArticuloException {
    	List<AlmacenArticuloBean> almacenesArticulo = ServicioAlmacenes.consultarAlmacenesArticulo(articulo.getCodArticulo(), datosSesion);
    	articulo.setAlmacenes(almacenesArticulo);
    }
}
