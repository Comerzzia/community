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

package com.comerzzia.persistencia.ventas.promociones.articulos;

import java.sql.Blob;
import java.util.Date;

import org.w3c.dom.Document;

import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.formateo.Formateo;
import com.comerzzia.util.xml.XMLDocument;

public class ArticuloPromocionBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7838423044656510501L;

	private Long idPromocion;
	private String codTarifa;
	private String desTarifa;
	private String codArt;
	private String desArt;
	private Double precioTarifa;
	private Double precioTarifaConImpuestos;
	private Double precioVenta;
	private Double precioTotal;
	private Long puntos = 0L;
	private String textoPromocion;
	private Date fechaInicio;
	private Date fechaFin;
	private Long versionTarifa;
	private XMLDocument datosPromocion = new XMLDocument();
	
	protected void initNuevoBean() {	
	}

	public Long getIdPromocion() {
		return idPromocion;
	}

	public void setIdPromocion(Long idPromocion) {
		this.idPromocion = idPromocion;
	}

	public String getCodArt() {
		return codArt;
	}

	public void setCodArt(String codArt) {
		this.codArt = codArt.toUpperCase();
	}

	public String getDesArt() {
		return desArt;
	}

	public void setDesArt(String desArt) {
		this.desArt = desArt;
	}

	public Double getPrecioTarifa() {
		return precioTarifa;
	}

	public void setPrecioTarifa(Double precioTarifa) {
		this.precioTarifa = precioTarifa;
	}

	public Double getPrecioTarifaConImpuestos() {
		return precioTarifaConImpuestos;
	}

	public void setPrecioTarifaConImpuestos(Double precioTarifaConImpuestos) {
		this.precioTarifaConImpuestos = precioTarifaConImpuestos;
	}

	public Double getPrecioVenta() {
		return precioVenta;
	}

	public void setPrecioVenta(Double precioVenta) {
		this.precioVenta = precioVenta;
	}

	public Double getPrecioTotal() {
		return precioTotal;
	}

	public void setPrecioTotal(Double precioTotal) {
		this.precioTotal = precioTotal;
	}

	public Long getPuntos() {
		return puntos;
	}

	public void setPuntos(Long puntos) {
		this.puntos = puntos;
	}

	public String getTextoPromocion() {
		return textoPromocion;
	}

	public void setTextoPromocion(String textoPromocion) {
		this.textoPromocion = textoPromocion;
	}

	public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	public Long getVersionTarifa() {
		return versionTarifa;
	}

	public void setVersionTarifa(Long versionTarifa) {
		this.versionTarifa = versionTarifa;
	}
	
	public XMLDocument getDatosPromocion() {
		return datosPromocion;
	}

	public void setDatosPromocion(XMLDocument datosPromocion) {
		this.datosPromocion = datosPromocion;
	}
	
	public void setDatosPromocion(Blob datosPromocion) {
		this.datosPromocion.setDocument(datosPromocion);
	}
	
	public void setDatosPromocion(String datosPromocion) {
		this.datosPromocion.setDocument(datosPromocion);
	}
	
	public void setDatosPromocion(Document datosPromocion) {
		this.datosPromocion.setDocument(datosPromocion);
	}

	public void borrar() {
        this.setEstadoBean(Estado.BORRADO);
    }
	
	public boolean isArticuloActivo(){
    	return versionTarifa != null;
    }
	
	public boolean isFinalizado() throws FechaException{
		if(fechaFin == null)
			return false;
		
		Date hoy = new Date();
    	String hoyString = Formateo.formateaFecha(hoy, "dd/MM/yyyy");
    	String fechaFinString = Formateo.formateaFecha(fechaFin, "dd/MM/yyyy");
    	return (Fechas.getFecha(hoyString).compareTo(Fechas.getFecha(fechaFinString)) > 0);
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
}
