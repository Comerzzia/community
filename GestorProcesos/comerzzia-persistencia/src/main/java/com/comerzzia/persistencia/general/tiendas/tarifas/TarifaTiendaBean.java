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

package com.comerzzia.persistencia.general.tiendas.tarifas;

import java.util.Date;

import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;

public class TarifaTiendaBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 9183825094800711525L;
	
	public static final String GENERAL = "GENERAL";

	private String codAlmacen;
	private String codTarifa;
	private String desTarifa;
	private Long versionTarifa;
	private Date fechaVersionTarifa;
	private Long versionTarifaRevisada;
	private Date fechaVersionTarifaRevisada;

	protected void initNuevoBean() {
	}

	public String getCodAlmacen() {
		return codAlmacen;
	}

	public void setCodAlmacen(String codAlmacen) {
		this.codAlmacen = codAlmacen;
	}

	public String getCodTarifa() {
		return codTarifa;
	}

	public void setCodTarifa(String codTarifa) {
		this.codTarifa = codTarifa;
	}

	public String getDesTarifa() {
		return desTarifa;
	}

	public void setDesTarifa(String desTarifa) {
		this.desTarifa = desTarifa;
	}

	public Long getVersionTarifa() {
		return versionTarifa;
	}

	public void setVersionTarifa(Long versionTarifa) {
		this.versionTarifa = versionTarifa;
	}

	public Date getFechaVersionTarifa() {
		return fechaVersionTarifa;
	}

	public void setFechaVersionTarifa(Date fechaVersionTarifa) {
		this.fechaVersionTarifa = fechaVersionTarifa;
	}

	public Long getVersionTarifaRevisada() {
		return versionTarifaRevisada;
	}

	public void setVersionTarifaRevisada(Long versionTarifaRevisada) {
		this.versionTarifaRevisada = versionTarifaRevisada;
	}

	public Date getFechaVersionTarifaRevisada() {
		return fechaVersionTarifaRevisada;
	}

	public void setFechaVersionTarifaRevisada(Date fechaVersionTarifaRevisada) {
		this.fechaVersionTarifaRevisada = fechaVersionTarifaRevisada;
	}

	public void borrar() {
		this.setEstadoBean(Estado.BORRADO);
	}
}
