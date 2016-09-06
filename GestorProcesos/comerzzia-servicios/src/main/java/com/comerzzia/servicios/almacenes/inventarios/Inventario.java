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

package com.comerzzia.servicios.almacenes.inventarios;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.almacenes.regularizaciones.RegularizacionBean;
import com.comerzzia.util.base.MantenimientoBean;

public class Inventario extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7351900805619030256L;

	private String codConceptoAlmacen;
	private String desConceptoAlmacen;
	private String codAlmacen;
	private String desAlmacen;
	private Date fechaInventario;
	
	private List<RegularizacionBean> regularizaciones;

	public Inventario(){
		this.regularizaciones = new ArrayList<RegularizacionBean>();
	}
	
	@Override
	protected void initNuevoBean() {

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

	public Date getFechaInventario() {
		return fechaInventario;
	}

	public void setFechaInventario(Date fechaInventario) {
		this.fechaInventario = fechaInventario;
	}

	public List<RegularizacionBean> getRegularizaciones() {
		if(getNumRegularizaciones() < 10){
			return regularizaciones;
		}
		else{
			return regularizaciones.subList(0, 10);
		}
	}

	public void setRegularizaciones(List<RegularizacionBean> regularizaciones) {
		this.regularizaciones = regularizaciones;
	}
	
	public void addRegularizacion(RegularizacionBean regularizacion){
		regularizaciones.add(0, regularizacion);
	}
	
	public void deleteRegularizacion(int indice){
		regularizaciones.remove(indice);
	}
	
	public int getNumRegularizaciones(){
		return regularizaciones.size();
	}
	
	public RegularizacionBean getRegularizacion(int indice){
		return regularizaciones.get(indice);
	}
}
