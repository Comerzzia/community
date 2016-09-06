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

package com.comerzzia.persistencia.general.conceptoalmacenes;

import com.comerzzia.util.base.ParametrosBuscarBean;


public class ParametrosBuscarConceptoAlmacenBean extends ParametrosBuscarBean  {
		
	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 3758487056147507855L;
	
	private String codAplicacion = "";
	private String codConAlm = "";
	private String desConAlm = "";
	private String signo = "";
	private String codAlm_origen = "";
	private String codAlm_destino = "";
	private String precioManual = "";
	private String activo = "";
	
	
	public ParametrosBuscarConceptoAlmacenBean() {
		super.setOrden("CODCONALM");
	}


	public String getCodAplicacion() {
		return codAplicacion;
	}

	public void setCodAplicacion(String codAplicacion) {
		this.codAplicacion = codAplicacion;
	}

	public String getCodConAlm() {
		return codConAlm;
	}

	public void setCodConAlm(String codConAlm) {
		this.codConAlm = codConAlm;
	}

	public String getDesConAlm() {
		return desConAlm;
	}

	public void setDesConAlm(String desConAlm) {
		this.desConAlm = desConAlm;
	}

	public String getSigno() {
		return signo;
	}

	public void setSigno(String signo) {
		this.signo = signo;
	}

	public String getCodAlm_origen() {
		return codAlm_origen;
	}

	public void setCodAlm_origen(String codAlm_origen) {
		this.codAlm_origen = codAlm_origen;
	}

	public String getCodAlm_destino() {
		return codAlm_destino;
	}

	public void setCodAlm_destino(String codAlm_destino) {
		this.codAlm_destino = codAlm_destino;
	}

	public String getPrecioManual() {
		return precioManual;
	}

	public void setPrecioManual(String precioManual) {
		this.precioManual = precioManual;
	}

	public String getActivo() {
		return activo;
	}

	public void setActivo(String activo) {
		this.activo = (activo != null) ? activo : "";
	}

	
}
