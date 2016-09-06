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

package com.comerzzia.persistencia.ventas.tiposportes;

import com.comerzzia.util.base.MantenimientoBean;

public class TipoPorteBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 788549493586177278L;

	private Long idTipoPorte;
	private String desTipoPorte;
	private String codArtPorte;
	private String desArtPorte;
	private Long desdeVolumenVenta;
	private String urlTracking;
	
	protected void initNuevoBean() {	
	}

	public Long getIdTipoPorte() {
		return idTipoPorte;
	}

	public void setIdTipoPorte(Long idTipoPorte) {
		this.idTipoPorte = idTipoPorte;
	}

	public String getDesTipoPorte() {
		return desTipoPorte;
	}

	public void setDesTipoPorte(String desTipoPorte) {
		this.desTipoPorte = desTipoPorte;
	}

	public String getCodArtPorte() {
		return codArtPorte;
	}

	public void setCodArtPorte(String codArtPorte) {
		this.codArtPorte = codArtPorte;
	}

	public String getDesArtPorte() {
		return desArtPorte;
	}

	public void setDesArtPorte(String desArtPorte) {
		this.desArtPorte = desArtPorte;
	}

	public Long getDesdeVolumenVenta() {
		return desdeVolumenVenta;
	}

	public void setDesdeVolumenVenta(Long desdeVolumenVenta) {
		this.desdeVolumenVenta = desdeVolumenVenta;
	}

	public String getUrlTracking() {
		return urlTracking;
	}

	public void setUrlTracking(String urlTracking) {
		this.urlTracking = urlTracking;
	}
}
