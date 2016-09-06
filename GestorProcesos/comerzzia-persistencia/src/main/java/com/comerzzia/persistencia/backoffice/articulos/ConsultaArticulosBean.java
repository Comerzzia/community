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

package com.comerzzia.persistencia.backoffice.articulos;

import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.general.almacenes.articulos.AlmacenArticuloBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
import com.comerzzia.util.base.MantenimientoBean;

public class ConsultaArticulosBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5292122556002242418L;

	private String codArticulo;
	private String desArticulo;
	private String codAlmacen;
	private String codFamilia;
	private String desFamilia;
	private String codSeccion;
	private String desSeccion;
	private String codCategorizacion;
	private String desCategorizacion;
	private String codProveedor;
	private String desProveedor;
	private String referencia;
	private List<AlmacenArticuloBean> almacenes = new ArrayList<AlmacenArticuloBean>();
	private List<ArticuloPromocionBean> promociones = new ArrayList<ArticuloPromocionBean>();
	private List<ArticuloTarifaBean> tarifas  = new ArrayList<ArticuloTarifaBean>();
	
	protected void initNuevoBean() {
	}

	public String getCodArticulo() {
		return codArticulo;
	}

	public void setCodArticulo(String codArticulo) {
		this.codArticulo = codArticulo.toUpperCase();
	}

	public String getDesArticulo() {
		return desArticulo;
	}

	public void setDesArticulo(String desArticulo) {
		this.desArticulo = desArticulo;
	}

	public String getCodAlmacen() {
		return codAlmacen;
	}

	public void setCodAlmacen(String codAlmacen) {
		this.codAlmacen = codAlmacen;
	}

	public String getCodFamilia() {
		return codFamilia;
	}

	public void setCodFamilia(String codFamilia) {
		this.codFamilia = codFamilia;
	}

	public String getDesFamilia() {
		return desFamilia;
	}

	public void setDesFamilia(String desFamilia) {
		this.desFamilia = desFamilia;
	}

	public String getCodSeccion() {
		return codSeccion;
	}

	public void setCodSeccion(String codSeccion) {
		this.codSeccion = codSeccion;
	}

	public String getDesSeccion() {
		return desSeccion;
	}

	public void setDesSeccion(String desSeccion) {
		this.desSeccion = desSeccion;
	}

	public String getCodCategorizacion() {
		return codCategorizacion;
	}

	public void setCodCategorizacion(String codCategorizacion) {
		this.codCategorizacion = codCategorizacion;
	}

	public String getDesCategorizacion() {
		return desCategorizacion;
	}

	public void setDesCategorizacion(String desCategorizacion) {
		this.desCategorizacion = desCategorizacion;
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

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public List<AlmacenArticuloBean> getAlmacenes() {
		return almacenes;
	}

	public void setAlmacenes(List<AlmacenArticuloBean> almacenes) {
		this.almacenes = almacenes;
	}

	public List<ArticuloPromocionBean> getPromociones() {
		return promociones;
	}

	public void setPromociones(List<ArticuloPromocionBean> promociones) {
		this.promociones = promociones;
	}

	public List<ArticuloTarifaBean> getTarifas() {
		return tarifas;
	}

	public void setTarifas(List<ArticuloTarifaBean> tarifas) {
		this.tarifas = tarifas;
	}
}
