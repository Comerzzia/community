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

package com.comerzzia.persistencia.ventas.pedidos.articulos;

import com.comerzzia.persistencia.almacenes.stocks.IArticuloStock;
import com.comerzzia.persistencia.core.impuestos.ILineaDocumento;
import com.comerzzia.persistencia.ventas.pedidos.EstadosPedidosVenta;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.numeros.Numero;


public class ArticuloPedidoVentaBean extends MantenimientoBean implements ILineaDocumento, IArticuloStock {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6862230253397711983L;
	
	private Long idPedido = null; // PK
	private Integer linea = null; // PK
	private String codArticulo = null;
	private String desArticulo = null;
	private String desglose1 = null;
	private String desglose2 = null;
	private String descripcionAmpliada = null;
	private String unidadMedida = null;
	private String unidadMedidaAlternativa = null;
	private Double cantidadMedidaSolicitada = null;
	private Double cantidadSolicitada = null;
	private Double cantidadMedidaAceptada = null;
	private Double cantidadAceptada = null;
	private Double cantidadMedidaPreparada = null;
	private Double cantidadPreparada = null;
	private Double precio = null;
	private Double descuento = null;
	private Double importe = null;
	private String codImpuesto = null;
	private Long idPromocion = null;
	private Integer lineaEstado = null;
	private Integer lineaSubEstado = null;
	private String lineaDesEstado = null;
	private Long idPedidoOrigen = null;
	private Integer lineaPedidoOrigen = null;
	
	
	protected void initNuevoBean() {
	}
	
	
	public Long getIdPedido() {
		return idPedido;
	}
	public void setIdPedido(Long idPedido) {
		this.idPedido = idPedido;
	}
	
	
	public Integer getLinea() {
		return linea;
	}
	public void setLinea(Integer linea) {
		this.linea = linea;
	}
	
	
	public String getCodArticulo() {
		return codArticulo;
	}
	public void setCodArticulo(String codArticulo) {
		this.codArticulo = codArticulo;
	}
	
	
	public String getDesArticulo() {
		return desArticulo;
	}
	public void setDesArticulo(String desArticulo) {
		this.desArticulo = desArticulo;
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
	
	
	public String getDescripcionAmpliada() {
		return descripcionAmpliada;
	}
	public void setDescripcionAmpliada(String descripcionAmpliada) {
		this.descripcionAmpliada = descripcionAmpliada;
	}
	
	
	public String getUnidadMedida() {
		return unidadMedida;
	}
	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}
	
	
	public String getUnidadMedidaAlternativa() {
		return unidadMedidaAlternativa;
	}
	public void setUnidadMedidaAlternativa(String unidadMedidaAlternativa) {
		this.unidadMedidaAlternativa = unidadMedidaAlternativa;
	}
	public boolean isTieneUnidadMedidaAlternativa() {
		return (unidadMedidaAlternativa != null && !unidadMedidaAlternativa.isEmpty());
	}
	
	
	public Double getCantidadMedidaSolicitada() {
		return cantidadMedidaSolicitada;
	}
	public void setCantidadMedidaSolicitada(Double cantidadMedidaSolicitada) {
		this.cantidadMedidaSolicitada = cantidadMedidaSolicitada;
	}
	
	
	public Double getCantidadSolicitada() {
		return cantidadSolicitada;
	}
	public void setCantidadSolicitada(Double cantidadSolicitada) {
		this.cantidadSolicitada = cantidadSolicitada;
	}
	
	
	public Double getCantidadMedidaAceptada() {
		return cantidadMedidaAceptada;
	}
	public void setCantidadMedidaAceptada(Double cantidadMedidaAceptada) {
		this.cantidadMedidaAceptada = cantidadMedidaAceptada;
	}
	
	
	public Double getCantidadAceptada() {
		return cantidadAceptada;
	}
	public void setCantidadAceptada(Double cantidadAceptada) {
		this.cantidadAceptada = cantidadAceptada;
	}
	
	
	public Double getCantidadMedidaPreparada() {
		return cantidadMedidaPreparada;
	}
	public void setCantidadMedidaPreparada(Double cantidadMedidaPreparada) {
		this.cantidadMedidaPreparada = cantidadMedidaPreparada;
	}
	
	
	public Double getCantidadPreparada() {
		return cantidadPreparada;
	}
	public void setCantidadPreparada(Double cantidadPreparada) {
		this.cantidadPreparada = cantidadPreparada;
	}
	
	/**
	 * Devuelve la cantidad medida (solicitada, aceptada o preparada), que puede ser distinta en función del estado,
	 * así que a partir de la comprobación de los valores de las distintas cantidades medidas se devuelve una u otra.
	 */
	public Double getCantidadMedida() {
		if(cantidadMedidaPreparada != null) {
			return cantidadMedidaPreparada;
		}
		else if(cantidadMedidaAceptada != null) {
			return cantidadMedidaAceptada;
		}
		else {
			return cantidadMedidaSolicitada;
		}
	}
	
	
	/**
	 * Devuelve la cantidad (solicitada, aceptada o preparada), que puede ser distinta en función del estado,
	 * así que a partir de la comprobación de los valores de las distintas cantidades se devuelve una u otra.
	 */
	public Double getCantidad() {
		// Devolvemos la cantidad en función del estado de la línea
		switch (getLineaEstado()) {
			case EstadosPedidosVenta.ESTADO_LINEA_SOLICITADA:
			case EstadosPedidosVenta.ESTADO_LINEA_PDTE_ACEPT:
				return cantidadSolicitada;
				
			case EstadosPedidosVenta.ESTADO_LINEA_PDTE_PREPARAC:
				return cantidadAceptada;
				
			case EstadosPedidosVenta.ESTADO_LINEA_PREPARADA:
			case EstadosPedidosVenta.ESTADO_LINEA_SERVIDA:
				return cantidadPreparada;
				
			default:
				return 0.0;
		}
	}
	
	
	public Double getPrecio() {
		return precio;
	}
	public void setPrecio(Double precio) {
		this.precio = precio;
	}
	
	
	public Double getDescuento() {
		return descuento;
	}
	public void setDescuento(Double descuento) {
		this.descuento = descuento;
	}
	
	
	public Double getImporte() {
		return importe;
	}
	public void setImporte(Double importe) {
		this.importe = importe;
	}
	
	
	public void calcularImporte() {
		Double cantidad = getCantidad();
		
		this.importe = Numero.redondea(((precio * cantidad) - (precio * cantidad * descuento) / 100), 2);
	}
	
	
	public String getCodImpuesto() {
		return codImpuesto;
	}
	public void setCodImpuesto(String codImpuesto) {
		this.codImpuesto = codImpuesto;
	}
	
	
	public Long getIdPromocion() {
		return idPromocion;
	}
	public void setIdPromocion(Long idPromocion) {
		this.idPromocion = idPromocion;
	}
	
	
	public Integer getLineaEstado() {
		return lineaEstado;
	}
	public void setLineaEstado(Integer lineaEstado) {
		this.lineaEstado = lineaEstado;
	}
	
	
	public Integer getLineaSubEstado() {
		return lineaSubEstado;
	}
	public void setLineaSubEstado(Integer lineaSubEstado) {
		this.lineaSubEstado = lineaSubEstado;
	}
	
	
	public String getLineaDesEstado() {
		return lineaDesEstado;
	}
	public void setLineaDesEstado(String lineaDesEstado) {
		this.lineaDesEstado = lineaDesEstado;
	}
	
	
	public Long getIdPedidoOrigen() {
		return idPedidoOrigen;
	}
	public void setIdPedidoOrigen(Long idPedidoOrigen) {
		this.idPedidoOrigen = idPedidoOrigen;
	}
	
	
	public Integer getLineaPedidoOrigen() {
		return lineaPedidoOrigen;
	}
	public void setLineaPedidoOrigen(Integer lineaPedidoOrigen) {
		this.lineaPedidoOrigen = lineaPedidoOrigen;
	}
	
	
    public void borrar() {
        this.setEstadoBean(Estado.BORRADO);
    }
}
