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

package com.comerzzia.web.core.usuarios.miperfil.ui;

import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.web.core.ui.FormularioBean;

public class FormularioUsuarioMiPerfilBean extends FormularioBean {

	// Definición de las pestañas del formulario
	private FormularioBean pestañaPerfiles = new FormularioBean();
	private FormularioBean pestañaAlmacenes = new FormularioBean();

	/**
	 * Constructor
	 */
	public FormularioUsuarioMiPerfilBean() {
		this.addPestaña(pestañaPerfiles);
		this.addPestaña(pestañaAlmacenes);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.comerzzia.web.core.ui.FormularioBean#inicializaRegistroActivo()
	 */
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();

		// Inicializamos las pestañas estableciendo las listas de resitros de
		// cada una de ellas
		pestañaPerfiles.setRegistros(((UsuarioBean) this.getRegistroActivo())
				.getLstPerfiles());
		pestañaAlmacenes.setRegistros(((UsuarioBean) this.getRegistroActivo())
				.getLstAlmacenes());
	}
}
