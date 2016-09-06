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

package com.comerzzia.persistencia.tiendavirtual.clientes;

import com.comerzzia.util.base.MantenimientoBean;

public class UsuarioClienteTiendaVirtualBean extends MantenimientoBean {

	/**
	 * Serial Version UID.
	 */
	private static final long serialVersionUID = 8365878471144095717L;

	private String cif;
	private String usuario;
	private String clave = "";

	protected void initNuevoBean() {
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = (clave != null) ? clave : "";
	}

	public boolean isClaveValida(String clave) {
		return this.clave.equals(clave);
	}

	public String getCif() {
		return cif;
	}

	public void setCif(String cif) {
		this.cif = cif.toUpperCase();
	}

}
