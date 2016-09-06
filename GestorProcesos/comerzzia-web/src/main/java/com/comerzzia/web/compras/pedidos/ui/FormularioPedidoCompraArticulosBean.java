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

package com.comerzzia.web.compras.pedidos.ui;

import com.comerzzia.servicios.general.articulos.ArticuloDesgloses;
import com.comerzzia.web.core.ui.FormularioBean;


public class FormularioPedidoCompraArticulosBean extends FormularioBean {

	private static final byte VISUALIZACION_MODO_DESGLOSES = 2;
	
	private ArticuloDesgloses desgloses;
	
	/**
	 * Constructor
	 */
	public FormularioPedidoCompraArticulosBean() {
	}
	public FormularioPedidoCompraArticulosBean(String string) {
		super();
	}
	
	
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();
	}
	
	/**
	 * Establece el modo de visualización tabla del formulario
	 */
	public void setModoVisualizacionDesgloses() {
		if (enEdicion || enInsercion) {
			cancelar();
		}
		enInsercion = true;
		this.modoVisualización = VISUALIZACION_MODO_DESGLOSES;
	}
	/**
	 * Indica si el formulario está en modo de visualización tabla
	 * @return true si el formulario está en modo visualización tabla, false en caso contrario
	 */
	public boolean isModoVisualizacionDesgloses() {
		return this.modoVisualización == VISUALIZACION_MODO_DESGLOSES;
	}

	public ArticuloDesgloses getDesgloses() {
		return desgloses;
	}
	public void setDesgloses(ArticuloDesgloses desgloses) {
		this.desgloses = desgloses;
	}
	public void borrarDesgloses() {
		this.desgloses = null;
	}
}
