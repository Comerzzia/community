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

package com.comerzzia.persistencia.ventas.promociones;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.formateo.Formateo;

public class PromocionBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1039810621142136368L;

	private Long idPromocion;
	private String descripcion;
	private Date fechaInicio;
	private Date fechaFin;
	private String codTar;
	private String desTar;
	private boolean soloFidelizacion;
	private Long idTipoPromocion = 1L; // Tipo de promocion unico que existe ahoramismo en el sistema
	private Long versionTarifa;
	
	private boolean articulosCargados;
	private List<ArticuloPromocionBean> articulos;
	
	protected void initNuevoBean() {
		this.articulosCargados = false;
		this.articulos = new ArrayList<ArticuloPromocionBean>();
	}

	public Long getIdPromocion() {
		return idPromocion;
	}

	public void setIdPromocion(Long idPromocion) {
		this.idPromocion = idPromocion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
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

	public String getCodTar() {
		return codTar;
	}

	public void setCodTar(String codTar) {
		this.codTar = codTar;
	}

	public String getDesTar() {
		return desTar;
	}

	public void setDesTar(String desTar) {
		this.desTar = desTar;
	}
	
	public boolean isSoloFidelizacion() {
		return soloFidelizacion;
	}

	public void setSoloFidelizacion(boolean soloFidelizacion) {
		this.soloFidelizacion = soloFidelizacion;
	}
	
	public String getSoloFidelizacion() {
		return (this.soloFidelizacion) ? TRUE : FALSE;
	}
	
	public void setSoloFidelizacion(String soloFidelizacion) {
		this.soloFidelizacion = soloFidelizacion.equals(TRUE);
	}

	public Long getIdTipoPromocion() {
		return idTipoPromocion;
	}

	public void setIdTipoPromocion(Long idTipoPromocion) {
		this.idTipoPromocion = idTipoPromocion;
	}

	public Long getVersionTarifa() {
		return versionTarifa;
	}

	public void setVersionTarifa(Long versionTarifa) {
		this.versionTarifa = versionTarifa;
	}

	// ******** ARTICULOS ******** //
	public boolean isArticulosCargados() {
		return articulosCargados;
	}

	public void setArticulosCargados(boolean articulosCargados) {
		this.articulosCargados = articulosCargados;
	}

	public List<ArticuloPromocionBean> getArticulos() {
		return articulos;
	}

	public void setArticulos(List<ArticuloPromocionBean> articulos) {
		this.articulos = articulos;
	}
	
	public int getNumArticulos() {
        return articulos.size();
    }
    
    
    public ArticuloPromocionBean getArticulo(int indice) {
        return (ArticuloPromocionBean) articulos.get(indice);
    }
    
    
    public void addArticulo(ArticuloPromocionBean articulo) {
        articulos.add(articulo);
    }
    
    
    public void deleteArticulo(int indice) {
    	if(getArticulo(indice).isEstadoNuevo()) {
    		articulos.remove(indice);
		}
		else {
			this.getArticulo(indice).borrar();
		}
    }
    
    public boolean isActiva(){
    	return versionTarifa != null;
    }
    
    public boolean isFinalizada() throws FechaException{
    	if(fechaFin == null)
			return false;
    	
    	Date hoy = new Date();
    	String hoyString = Formateo.formateaFecha(hoy, "dd/MM/yyyy");
    	String fechaFinString = Formateo.formateaFecha(fechaFin, "dd/MM/yyyy");
    	return (Fechas.getFecha(hoyString).compareTo(Fechas.getFecha(fechaFinString)) > 0);
    }
}
