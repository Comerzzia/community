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

package com.comerzzia.persistencia.ventas.tarifas;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
import com.comerzzia.util.base.MantenimientoBean;

public class TarifaBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 8472490031412304323L;

	public static final String TARIFA_GENERAL = "GENERAL";

	protected String codTar;
	protected String desTar;
	protected Long version;
	protected Date fechaVersion;
	protected Long idGrupoImpuesto;
	protected Long idTratImpuestos;
	protected String desTratImpuestos;
	private boolean articulosCargados = false;
	private List<ArticuloTarifaBean> articulos;

	protected void initNuevoBean() {
		this.articulosCargados = false;
		this.articulos = new ArrayList<ArticuloTarifaBean>();
	}

	public String getCodTar() {
		return codTar;
	}

	public void setCodTar(String codTar) {
		this.codTar = codTar.toUpperCase();
	}

	public String getDesTar() {
		return desTar;
	}

	public void setDesTar(String desTar) {
		this.desTar = desTar;
	}

	public Long getVersion() {
		return version;
	}

	public void setVersion(Long version) {
		this.version = version;
	}

	public boolean isArticulosCargados() {
		return articulosCargados;
	}

	public void setArticulosCargados(boolean articulosCargados) {
		this.articulosCargados = articulosCargados;
	}

	public List<ArticuloTarifaBean> getArticulos() {
		return articulos;
	}

	public void setArticulos(List<ArticuloTarifaBean> articulos) {
		this.articulos = articulos;
	}

	public int getNumArticulos() {
		return articulos.size();
	}

	public ArticuloTarifaBean getArticulo(int indice) {
		return articulos.get(indice);
	}

	public void addArticulo(ArticuloTarifaBean articulo) {
		if (articulos==null){
			articulos = new ArrayList<ArticuloTarifaBean>();
		}
		articulos.add(articulo);
	}

	public void deleteArticulo(int indice) {
		if (getArticulo(indice).isEstadoNuevo()) {
			articulos.remove(indice);
		} else {
			this.getArticulo(indice).borrar();
		}
	}

	public boolean isTarifaGeneral(){
		return getCodTar().equals(TARIFA_GENERAL);
	}

	public Date getFechaVersion() {
		return fechaVersion;
	}

	public void setFechaVersion(Date fechaVersion) {
		this.fechaVersion = fechaVersion;
	}

	public Long getIdGrupoImpuesto() {
		return idGrupoImpuesto;
	}

	public void setIdGrupoImpuesto(Long idGrupoImpuesto) {
		this.idGrupoImpuesto = idGrupoImpuesto;
	}

	public Long getIdTratImpuestos() {
		return idTratImpuestos;
	}

	public void setIdTratImpuestos(Long idTratImpuestos) {
		this.idTratImpuestos = idTratImpuestos;
	}

	public String getDesTratImpuestos() {
		return desTratImpuestos;
	}

	public void setDesTratImpuestos(String desTratImpuestos) {
		this.desTratImpuestos = desTratImpuestos;
	}

	public String getTARIFA_GENERAL() {
		return TARIFA_GENERAL;
	}

}
