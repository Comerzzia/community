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

package com.comerzzia.persistencia.compras.pedidos;

import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.estados.EstadoBean;
import com.comerzzia.persistencia.core.estados.Estados;
import com.comerzzia.persistencia.ventas.pedidos.EstadosPedidosVenta;
import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarPedidosComprasBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8737554561240793815L;
	
	private Long periodo = null;
	private String codSerie = null;
	private String desSerie = null;
	private Long numPedido = null;
	private String codAlmacen = null;
	private String desAlmacen = null;
	private String codProveedor = null;
	private String desProveedor = null;
	private String codConceptoAlmacen = null;
	private String desConceptoAlmacen = null;
	private Date fechaDesde = null;
	private boolean buscarPorFechaDesde = false;
	private Date fechaHasta = null;
	private boolean buscarPorFechaHasta = false;
	
	// Estados para filtrar las consultas de pedidos 
	private Estados estados = null;
	
	// Lista de pedidos seleccionados para servir múltiples pedidos
	private List<Long> pedidosSeleccionados = null;
	
	public ParametrosBuscarPedidosComprasBean() {
		super.setOrden("FECHA DESC");
	}
	
	
	public Long getPeriodo() {
		return periodo;
	}
	public void setPeriodo(Long periodo) {
		this.periodo = periodo;
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
	
	
	public Long getNumPedido() {
		return numPedido;
	}
	public void setNumPedido(Long numPedido) {
		this.numPedido = numPedido;
	}
	
	
	public String getCodAlmacen() {
		return codAlmacen;
	}
	public void setCodAlmacen(String codAlmacen) {
		this.codAlmacen = codAlmacen;
	}
	
	
	public String getDesAlmacen() {
		return desAlmacen;
	}


	public void setDesAlmacen(String desAlmacen) {
		this.desAlmacen = desAlmacen;
	}


	public String getCodProveedor() {
		return codProveedor;
	}
	public void setCodProveedor(String codProveedor) {
		this.codProveedor = codProveedor;
	}
	
	
	public String getDesProveedor() {
		return desProveedor;
	}
	
	public void setDesProveedor(String desProveedor) {
		this.desProveedor = desProveedor;
	}
	
	
	public String getCodConceptoAlmacen() {
		return codConceptoAlmacen;
	}


	public void setCodConceptoAlmacen(String codConceptoAlmacen) {
		this.codConceptoAlmacen = codConceptoAlmacen;
	}
	public String getDesConceptoAlmacen() {
		return desConceptoAlmacen;
	}
	
	
	public void setDesConceptoAlmacen(String desConceptoAlmacen) {
		this.desConceptoAlmacen = desConceptoAlmacen;
	}


	public Date getFechaDesde() {
		return fechaDesde;
	}
	public void setFechaDesde(Date fechaDesde) {
		this.fechaDesde = fechaDesde;
	}
	
	
	public boolean isBuscarPorFechaDesde() {
		return buscarPorFechaDesde;
	}
	public void setBuscarPorFechaDesde(boolean buscarPorFechaDesde) {
		this.buscarPorFechaDesde = buscarPorFechaDesde;
	}
	
	
	public Date getFechaHasta() {
		return fechaHasta;
	}
	public void setFechaHasta(Date fechaHasta) {
		this.fechaHasta = fechaHasta;
	}
	
	
	public boolean isBuscarPorFechaHasta() {
		return buscarPorFechaHasta;
	}
	public void setBuscarPorFechaHasta(boolean buscarPorFechaHasta) {
		this.buscarPorFechaHasta = buscarPorFechaHasta;
	}
	
	
	public Estados getEstados() {
		return estados;
	}
	public void setEstados(Estados estados) {
		this.estados = estados;
	}
	
	
	public List<Long> getPedidosSeleccionados() {
		return pedidosSeleccionados;
	}
	public void setPedidosSeleccionados(List<Long> pedidosSeleccionados) {
		this.pedidosSeleccionados = pedidosSeleccionados;
	}
	
	
	// TODO: cuando se mejore la implementación de los estados estos métodos deberían desaparecer, son provisionales
	public boolean isNingunEstadoSeleccionado() {
		for (EstadoBean estado : estados.getListaEstados()) {
			if(estado.isChecked()) {
				return false;
			}
		}
		
		return true;
	}
	
	
	public boolean isEstadoPendienteAceptacionSeleccionado() {
		for (EstadoBean estado : estados.getListaEstados()) {
			if(estado.getEstado() == EstadosPedidosVenta.ESTADO_EMISOR_PDTE_ACEPT && estado.isChecked()) {
				return true;
			}
		}
		
		return false;
	}
	
	
	public boolean isEstadoPendienteRecepcionSeleccionado() {
		for (EstadoBean estado : estados.getListaEstados()) {
			if(estado.getEstado() == EstadosPedidosVenta.ESTADO_EMISOR_PDTE_PREPARAC && estado.isChecked()) {
				return true;
			}
		}
		
		return false;
	}
}
