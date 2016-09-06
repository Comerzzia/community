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

package com.comerzzia.persistencia.tesoreria.tiposefectos;

import com.comerzzia.util.base.MantenimientoBean;


public class TipoEfectoBean  extends MantenimientoBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1901286743092470086L;
	
	private String codTipoEfecto;
	private String desTipoEfecto;
	private boolean remesable;
	private boolean entradaDocumentoAutomatica;
	
	
	protected void initNuevoBean() {	
	}

	public String getCodTipoEfecto() {
		return codTipoEfecto;
	}

	public void setCodTipoEfecto(String codTipoEfecto) {
		this.codTipoEfecto = codTipoEfecto.toUpperCase();
	}

	public String getDesTipoEfecto() {
		return desTipoEfecto;
	}

	public void setDesTipoEfecto(String desTipoEfecto) {
		this.desTipoEfecto = desTipoEfecto;
	}
	
	public boolean isRemesable() {
		return remesable;
	}
	
	public String getRemesable() {
		return (remesable) ? TRUE : FALSE;
	}

	public void setRemesable(boolean remesable) {
		this.remesable = remesable;
	}
	
	public void setRemesable(String remesable) {
		this.remesable = remesable.equals(TRUE);
	}

	public boolean isEntradaDocumentoAutomatica() {
		return entradaDocumentoAutomatica;
	}
	
	public String getEntradaDocumentoAutomatica() {
		return (entradaDocumentoAutomatica) ? TRUE : FALSE;
	}

	public void setEntradaDocumentoAutomatica(boolean entradaDocumentoAutomatica) {
		this.entradaDocumentoAutomatica = entradaDocumentoAutomatica;
	}
	
	public void setEntradaDocumentoAutomatica(String entradaDocumentoAutomatica) {
		this.entradaDocumentoAutomatica = entradaDocumentoAutomatica.equals(TRUE);
	}
}
