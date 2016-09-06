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

package com.comerzzia.persistencia.compras.albaranes.articulos;

import java.util.Date;

import com.comerzzia.persistencia.almacenes.stocks.IArticuloStock;
import com.comerzzia.persistencia.core.impuestos.ILineaDocumento;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.numeros.Numero;


public class ArticuloAlbaranCompraBean extends MantenimientoBean implements ILineaDocumento, IArticuloStock {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6862230253397711983L;
	
	private Long idAlbaran = null; // PK
	private Integer linea = null;  // PK
	private Date fecha = null;
	private String codArticulo = null;
	private String desArticulo = null;
	private String desglose1 = null;
	private String desglose2 = null;
	private String descripcionAmpliada = null;
	private String unidadMedida = null;
	private Double cantidadMedida = null;
	private Double cantidad = null;
	private Double precio = null;
	private Double descuento = null;
	private Double importe = null;
	private String codImpuesto = null;
	private Long idPedido = null;
	private Integer pedidoLinea = null;
	
	
	@Override
	protected void initNuevoBean() {
	}
	
	
	public Long getIdAlbaran() {
		return idAlbaran;
	}
	public void setIdAlbaran(Long idAlbaran) {
		this.idAlbaran = idAlbaran;
	}
	
	
	public Integer getLinea() {
		return linea;
	}
	public void setLinea(Integer linea) {
		this.linea = linea;
	}
	
	
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
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
	
	
	public Double getCantidadMedida() {
		return cantidadMedida;
	}
	public void setCantidadMedida(Double cantidadMedida) {
		this.cantidadMedida = cantidadMedida;
	}
	
	
	public Double getCantidad() {
		return cantidad;
	}
	public void setCantidad(Double cantidad) {
		this.cantidad = cantidad;
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
		this.importe = Numero.redondea(((precio * cantidad) - (precio*cantidad*descuento)/100), 2);
	}
	
	
	public String getCodImpuesto() {
		return codImpuesto;
	}
	public void setCodImpuesto(String codImpuesto) {
		this.codImpuesto = codImpuesto;
	}
	
	
	public Long getIdPedido() {
		return idPedido;
	}
	public void setIdPedido(Long idPedido) {
		this.idPedido = idPedido;
	}
	
	
	public Integer getPedidoLinea() {
		return pedidoLinea;
	}
	public void setPedidoLinea(Integer pedidoLinea) {
		this.pedidoLinea = pedidoLinea;
	}
	
	
    public void borrar() {
        this.setEstadoBean(Estado.BORRADO);
    }
}
