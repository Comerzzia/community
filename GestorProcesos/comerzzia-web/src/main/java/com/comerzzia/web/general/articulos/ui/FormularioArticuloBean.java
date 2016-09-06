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

package com.comerzzia.web.general.articulos.ui;

import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.persistencia.general.articulos.unidadesmedidas.UnidadMedidaArticuloBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.core.ui.FormularioBean;


public class FormularioArticuloBean extends FormularioBean {

	// Definición de las pestañas del formulario
	private FormularioBean pestañaDatosGenerales = new FormularioBean("Datos Generales");
	private FormularioBean pestañaObservaciones = new FormularioBean("Observaciones");
	private FormularioBean pestañaCodigosBarras = new FormularioBean("Codigos Barra");
	private FormularioBean pestañaFotos = new FormularioBean("Fotos");
	private FormularioBean pestañaUnidadesMedida = new FormularioBean("Unidades Medida");
	private FormularioBean pestañaAlmacenes = new FormularioBean("Almacenes");
	private FormularioBean pestañaTarifas = new FormularioBean("Tarifas");

	// Atributo para saber la configuración de la variables
	// ARTICULOS.DESGLOSE1_TITULO y ARTICULOS.DESGLOSE1_TITULO
	private String tituloDesglose1 = null;
	private String tituloDesglose2 = null;

	/**
	 * Constructor
	 */
	public FormularioArticuloBean() {
		this.addPestaña(pestañaDatosGenerales);
		this.addPestaña(pestañaObservaciones);
		this.addPestaña(pestañaCodigosBarras);
		this.addPestaña(pestañaUnidadesMedida);
		this.addPestaña(pestañaAlmacenes);
		this.addPestaña(pestañaTarifas);
		this.addPestaña(pestañaFotos);
	}
	
	/* (non-Javadoc)
	 * @see com.comerzzia.web.core.ui.FormularioBean#inicializaRegistroActivo()
	 */
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();
		
		// Inicializamos las pestañas de códigos de barras y de unidades de medida
		// estableciendo las listas de resitros de cada una de ellas
		pestañaCodigosBarras.setRegistros(((ArticuloBean)this.getRegistroActivo()).getCodigosBarras());
		pestañaFotos.setRegistros(((ArticuloBean)this.getRegistroActivo()).getFotos());
		pestañaUnidadesMedida.setRegistros(((ArticuloBean)this.getRegistroActivo()).getUnidadesMedidas());
		pestañaAlmacenes.setRegistros(((ArticuloBean)this.getRegistroActivo()).getAlmacenes());
		pestañaTarifas.setRegistros(((ArticuloBean)this.getRegistroActivo()).getTarifas());
	}
	
	@SuppressWarnings("unchecked")
	public List<String> obtenerListaUnidadesMedidas(){
		boolean unid = false;
		boolean caja = false;
		boolean pale = false;
		
		List<UnidadMedidaArticuloBean> lstUnidadesMedidas = pestañaUnidadesMedida.getRegistros(); 
		List<String> lstFinal = new ArrayList<String>();

		if(lstUnidadesMedidas != null){
			for (int i = 0; i < lstUnidadesMedidas.size(); i++) {
				if(lstUnidadesMedidas.get(i).getUnidadMedida().equals("UNID") && lstUnidadesMedidas.get(i).getEstadoBean() != Estado.BORRADO){
					unid = true;
				}
				else if(lstUnidadesMedidas.get(i).getUnidadMedida().equals("CAJA") && lstUnidadesMedidas.get(i).getEstadoBean() != Estado.BORRADO){
					caja = true;
				}
				else if(lstUnidadesMedidas.get(i).getUnidadMedida().equals("PALE") && lstUnidadesMedidas.get(i).getEstadoBean() != Estado.BORRADO){
					pale = true;
				}
			}
		}

		if(!unid){
			lstFinal.add("UNID");
		}
		if(!caja){
			lstFinal.add("CAJA");
		}
		if(!pale){
			lstFinal.add("PALE");
		}
		
		return lstFinal;
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
}
