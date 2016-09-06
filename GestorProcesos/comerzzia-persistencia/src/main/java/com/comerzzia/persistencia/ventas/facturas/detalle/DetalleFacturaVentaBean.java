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

package com.comerzzia.persistencia.ventas.facturas.detalle;

import java.util.Date;

import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.numeros.Numero;

public class DetalleFacturaVentaBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -5823879496827014993L;
	
	private Long idFacturaRep = null; // PK
	private Integer linea = null;  // PK
	private String referencia = null;
	private Date fecha = null;
	private String codArticulo = null;
	private String desArticulo = null;
	private String desglose1 = null;
	private String desglose2 = null;
	private String concepto = null;
	private String conceptoAmpliado = null;
	private String unidadMedida = null;
	private String desUnidadMedida = null;
	private Double cantidadMedida = null;
	private Double cantidad = new Double(1);
	private Double precio = null;
	private String codImpuesto = null;
	private String desImpuesto = null;
	
	private Double impuestos = null;
	
	@Override
	protected void initNuevoBean() {
	}

	public Long getIdFacturaRep() {
		return idFacturaRep;
	}

	public void setIdFacturaRep(Long idFacturaRep) {
		this.idFacturaRep = idFacturaRep;
	}

	public Integer getLinea() {
		return linea;
	}

	public void setLinea(Integer linea) {
		this.linea = linea;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
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

	public String getConcepto() {
		return concepto;
	}

	public void setConcepto(String concepto) {
		this.concepto = concepto;
	}

	public String getConceptoAmpliado() {
		return conceptoAmpliado;
	}

	public void setConceptoAmpliado(String conceptoAmpliado) {
		this.conceptoAmpliado = conceptoAmpliado;
	}

	public String getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}

	public String getDesUnidadMedida() {
		return desUnidadMedida;
	}

	public void setDesUnidadMedida(String desUnidadMedida) {
		this.desUnidadMedida = desUnidadMedida;
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

	public String getCodImpuesto() {
		return codImpuesto;
	}

	public void setCodImpuesto(String codImpuesto) {
		this.codImpuesto = codImpuesto;
	}

	public String getDesImpuesto() {
		return desImpuesto;
	}

	public void setDesImpuesto(String desImpuesto) {
		this.desImpuesto = desImpuesto;
	}

	public Double getImpuestos() {
		return impuestos;
	}

	public void setImpuestos(Double impuestos) {
		this.impuestos = impuestos;
	}
	
	public Double getImporte() {
		return Numero.redondea(cantidad * precio, 2);
	}
	
}
