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

package com.comerzzia.servicios.estadisticas;

public class VolumenNegocio {

	private Long numeroClientes = null;
	private Long numeroProveedores = null;
	private Long numeroArticulos = null;
	private Long numeroUsuarios = null;
	private Long numeroAlmacenes = null;
	private Long numeroMovimientosAlmacen = null;
	
	public Long getNumeroClientes() {
		return numeroClientes;
	}
	public void setNumeroClientes(Long numeroClientes) {
		this.numeroClientes = numeroClientes;
	}
	public Long getNumeroProveedores() {
		return numeroProveedores;
	}
	public void setNumeroProveedores(Long numeroProveedores) {
		this.numeroProveedores = numeroProveedores;
	}
	public Long getNumeroArticulos() {
		return numeroArticulos;
	}
	public void setNumeroArticulos(Long numeroArticulos) {
		this.numeroArticulos = numeroArticulos;
	}
	public Long getNumeroUsuarios() {
		return numeroUsuarios;
	}
	public void setNumeroUsuarios(Long numeroUsuarios) {
		this.numeroUsuarios = numeroUsuarios;
	}
	public Long getNumeroAlmacenes() {
		return numeroAlmacenes;
	}
	public void setNumeroAlmacenes(Long numeroAlmacenes) {
		this.numeroAlmacenes = numeroAlmacenes;
	}
	public Long getNumeroMovimientosAlmacen() {
		return numeroMovimientosAlmacen;
	}
	public void setNumeroMovimientosAlmacen(Long numeroMovimientosAlmacen) {
		this.numeroMovimientosAlmacen = numeroMovimientosAlmacen;
	}
}
