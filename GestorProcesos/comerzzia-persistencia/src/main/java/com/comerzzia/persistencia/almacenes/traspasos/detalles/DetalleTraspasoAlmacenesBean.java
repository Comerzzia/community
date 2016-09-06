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

package com.comerzzia.persistencia.almacenes.traspasos.detalles;

import java.sql.Date;

import com.comerzzia.util.base.MantenimientoBean;

public class DetalleTraspasoAlmacenesBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3528581803417045796L;

	private Long idTraspaso;
	private Long linea;
	private String codArticulo;
	private String desglose1;
	private String desglose2;
	private String unidadMedida;
	private Double cantidadMedidaPropuesta;
	private Double cantidadPropuesta;
	private Double cantidadMedidaPedida;
	private Double cantidadPedida;
	private Double cantidadMedidaServida;
	private Double cantidadServida;
	private Double precio;
	private Date fechaBaja;
	private String observaciones;
	
	protected void initNuevoBean() {
	}

	public Long getIdTraspaso() {
		return idTraspaso;
	}

	public void setIdTraspaso(Long idTraspaso) {
		this.idTraspaso = idTraspaso;
	}

	public Long getLinea() {
		return linea;
	}

	public void setLinea(Long linea) {
		this.linea = linea;
	}

	public String getCodArticulo() {
		return codArticulo;
	}

	public void setCodArticulo(String codArticulo) {
		this.codArticulo = codArticulo;
	}

	public String getDesglose1() {
		return desglose1;
	}

	public void setDesglose1(String desglose1) {
		this.desglose1 = desglose1;
	}

	public String getDesglose2() {
		return desglose2;
	}

	public void setDesglose2(String desglose2) {
		this.desglose2 = desglose2;
	}

	public String getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}

	public Double getCantidadMedidaPropuesta() {
		return cantidadMedidaPropuesta;
	}

	public void setCantidadMedidaPropuesta(Double cantidadMedidaPropuesta) {
		this.cantidadMedidaPropuesta = cantidadMedidaPropuesta;
	}

	public Double getCantidadPropuesta() {
		return cantidadPropuesta;
	}

	public void setCantidadPropuesta(Double cantidadPropuesta) {
		this.cantidadPropuesta = cantidadPropuesta;
	}

	public Double getCantidadMedidaPedida() {
		return cantidadMedidaPedida;
	}

	public void setCantidadMedidaPedida(Double cantidadMedidaPedida) {
		this.cantidadMedidaPedida = cantidadMedidaPedida;
	}

	public Double getCantidadPedida() {
		return cantidadPedida;
	}

	public void setCantidadPedida(Double cantidadPedida) {
		this.cantidadPedida = cantidadPedida;
	}

	public Double getCantidadMedidaServida() {
		return cantidadMedidaServida;
	}

	public void setCantidadMedidaServida(Double cantidadMedidaServida) {
		this.cantidadMedidaServida = cantidadMedidaServida;
	}

	public Double getCantidadServida() {
		return cantidadServida;
	}

	public void setCantidadServida(Double cantidadServida) {
		this.cantidadServida = cantidadServida;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public Date getFechaBaja() {
		return fechaBaja;
	}

	public void setFechaBaja(Date fechaBaja) {
		this.fechaBaja = fechaBaja;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

}
