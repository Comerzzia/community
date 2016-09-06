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

package com.comerzzia.persistencia.ventas.tarifas.actualizaciones;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos.ArticuloActualizacionBean;

public class ActualizacionTarifaBean extends TarifaBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4662044249757118483L;

	private Long idActualizacion;
	private String descripcion;
	private Date fechaPrevistaAplicacion;
	private boolean articulosCargados = false;
	private List<ArticuloActualizacionBean> articulosActualizacion;
	
	protected void initNuevoBean() {
		this.articulosCargados = false;
		articulosActualizacion = new ArrayList<ArticuloActualizacionBean>();
	}

	public Long getIdActualizacion() {
		return idActualizacion;
	}

	public void setIdActualizacion(Long idActualizacion) {
		this.idActualizacion = idActualizacion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Date getFechaPrevistaAplicacion() {
		return fechaPrevistaAplicacion;
	}

	public void setFechaPrevistaAplicacion(Date fechaPrevistaAplicacion) {
		this.fechaPrevistaAplicacion = fechaPrevistaAplicacion;
	}

	public boolean isArticulosCargados() {
		return this.articulosCargados;
	}

	public void setArticulosCargados(boolean articulosCargados) {
		this.articulosCargados = articulosCargados;
	}

	public List<ArticuloActualizacionBean> getArticulosActualizacion() {
		return articulosActualizacion;
	}

	public void setArticulosActualizacion(
			List<ArticuloActualizacionBean> articulosActualizacion) {
		this.articulosActualizacion = articulosActualizacion;
	}
}
