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

package com.comerzzia.persistencia.almacenes.traspasos;

import java.sql.Date;
import java.util.List;

import com.comerzzia.persistencia.almacenes.traspasos.detalles.DetalleTraspasoAlmacenesBean;
import com.comerzzia.util.base.MantenimientoBean;

public class TraspasoAlmacenesBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2172885135934083400L;
	
	private Long idTraspaso;
	private String codAplicacion;
	private String codAlmacenOrigen;
	private String desAlmacenOrigen;
	private String codSerie;
	private String desSerie;
	private Long numTraspaso;
	private String codConAlmacen;
	private String desConAlmacen;
	private Date fecha;
	private Date fechaSuministro;
	private Date fechaSuministroPrev;
	private int estado;
	private int subEstado;
	private String codAlmacenDestino;
	private String desAlmacenDestino;
	private String referencia;
	private String observaciones;
	
	private boolean detallesCargados = false;
	private List<DetalleTraspasoAlmacenesBean> detalles = null;

	protected void initNuevoBean() {
	}

	public Long getIdTraspaso() {
		return idTraspaso;
	}

	public void setIdTraspaso(Long idTraspaso) {
		this.idTraspaso = idTraspaso;
	}

	public String getCodAplicacion() {
		return codAplicacion;
	}

	public void setCodAplicacion(String codAplicacion) {
		this.codAplicacion = codAplicacion;
	}

	public String getCodAlmacenOrigen() {
		return codAlmacenOrigen;
	}

	public void setCodAlmacenOrigen(String codAlmacenOrigen) {
		this.codAlmacenOrigen = codAlmacenOrigen;
	}

	public String getDesAlmacenOrigen() {
		return desAlmacenOrigen;
	}

	public void setDesAlmacenOrigen(String desAlmacenOrigen) {
		this.desAlmacenOrigen = desAlmacenOrigen;
	}

	public String getCodSerie() {
		return codSerie;
	}

	public void setCodSerie(String codSerie) {
		this.codSerie = codSerie;
	}

	public String getDesSerie() {
		return desSerie;
	}

	public void setDesSerie(String desSerie) {
		this.desSerie = desSerie;
	}

	public Long getNumTraspaso() {
		return numTraspaso;
	}

	public void setNumTraspaso(Long numTraspaso) {
		this.numTraspaso = numTraspaso;
	}

	public String getCodConAlmacen() {
		return codConAlmacen;
	}

	public void setCodConAlmacen(String codConAlmacen) {
		this.codConAlmacen = codConAlmacen;
	}

	public String getDesConAlmacen() {
		return desConAlmacen;
	}

	public void setDesConAlmacen(String desConAlmacen) {
		this.desConAlmacen = desConAlmacen;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Date getFechaSuministro() {
		return fechaSuministro;
	}

	public void setFechaSuministro(Date fechaSuministro) {
		this.fechaSuministro = fechaSuministro;
	}

	public Date getFechaSuministroPrev() {
		return fechaSuministroPrev;
	}

	public void setFechaSuministroPrev(Date fechaSuministroPrev) {
		this.fechaSuministroPrev = fechaSuministroPrev;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	public int getSubEstado() {
		return subEstado;
	}

	public void setSubEstado(int subEstado) {
		this.subEstado = subEstado;
	}

	public String getCodAlmacenDestino() {
		return codAlmacenDestino;
	}

	public void setCodAlmacenDestino(String codAlmacenDestino) {
		this.codAlmacenDestino = codAlmacenDestino;
	}

	public String getDesAlmacenDestino() {
		return desAlmacenDestino;
	}

	public void setDesAlmacenDestino(String desAlmacenDestino) {
		this.desAlmacenDestino = desAlmacenDestino;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public boolean isDetallesCargados() {
		return detallesCargados;
	}

	public void setDetallesCargados(boolean detallesCargados) {
		this.detallesCargados = detallesCargados;
	}

	public List<DetalleTraspasoAlmacenesBean> getDetalles() {
		return detalles;
	}

	public void setDetalles(List<DetalleTraspasoAlmacenesBean> detalles) {
		this.detalles = detalles;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

}
