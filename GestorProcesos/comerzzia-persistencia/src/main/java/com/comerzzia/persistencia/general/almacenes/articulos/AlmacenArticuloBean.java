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

package com.comerzzia.persistencia.general.almacenes.articulos;

import com.comerzzia.persistencia.almacenes.stocks.IArticuloStock;
import com.comerzzia.util.base.MantenimientoBean;

public class AlmacenArticuloBean extends MantenimientoBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 7876829512344292539L;
	
	private String codAlm;
	private String desAlm;
	private String codArt;
	private String desglose1;
	private String desglose2;
	private Double stock;
	private Double stockUMA;
	private Double stockMinimo;
	private Double stockMaximo;
	private Double stockPendServir;
	private Double stockPendRecibir;
	private String ubicacion1;
	private String ubicacion2;
	private String ubicacion3;
	private String ubicacion4;
	private Double pmp;

	public AlmacenArticuloBean() {
	}

	public AlmacenArticuloBean(String codAlm, String codArt, String desglose1, String desglose2) {
		this.codArt = codArt;
		this.codAlm = codAlm;
		this.desglose1 = desglose1;
		this.desglose2 = desglose2;
		this.stock = new Double(0);
		this.stockUMA = new Double(0);
		this.stockMinimo = new Double(0);
		this.stockMaximo = new Double(0);
		this.stockPendServir = new Double(0);
		this.stockPendRecibir = new Double(0);
		this.pmp = new Double(0);
	}
	
	public AlmacenArticuloBean(String codAlmacen, IArticuloStock articulo)  {
		this.codAlm = codAlmacen;
		this.codArt = articulo.getCodArticulo();
		this.desglose1 = articulo.getDesglose1();
		this.desglose2 = articulo.getDesglose2();
		this.stock = new Double(0);
		this.stockUMA = new Double(0);
		this.stockMinimo = new Double(0);
		this.stockMaximo = new Double(0);
		this.stockPendServir = new Double(0);
		this.stockPendRecibir = new Double(0);
		this.pmp = new Double(0);
	}
	
	protected void initNuevoBean() {
	}

	public String getCodAlm() {
		return codAlm;
	}

	public void setCodAlm(String codAlm) {
		this.codAlm = codAlm.toUpperCase();
	}
	
	public String getDesAlm() {
		return desAlm;
	}

	public void setDesAlm(String desAlm) {
		this.desAlm = desAlm;
	}

	public String getCodArt() {
		return codArt;
	}

	public void setCodArt(String codArt) {
		this.codArt = codArt.toUpperCase();
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

	public Double getStock() {
		return stock;
	}

	public void setStock(Double stock) {
		this.stock = stock;
	}

	public Double getStockUMA() {
		return stockUMA;
	}

	public void setStockUMA(Double stockUMA) {
		this.stockUMA = stockUMA;
	}

	public Double getStockMinimo() {
		return stockMinimo;
	}

	public void setStockMinimo(Double stockMinimo) {
		this.stockMinimo = stockMinimo;
	}

	public Double getStockMaximo() {
		return stockMaximo;
	}

	public void setStockMaximo(Double stockMaximo) {
		this.stockMaximo = stockMaximo;
	}

	public Double getStockPendServir() {
		return stockPendServir;
	}

	public void setStockPendServir(Double stockPendServir) {
		this.stockPendServir = stockPendServir;
	}

	public Double getStockPendRecibir() {
		return stockPendRecibir;
	}

	public void setStockPendRecibir(Double stockPendRecibir) {
		this.stockPendRecibir = stockPendRecibir;
	}

	public String getUbicacion1() {
		return ubicacion1;
	}

	public void setUbicacion1(String ubicacion1) {
		this.ubicacion1 = ubicacion1;
	}

	public String getUbicacion2() {
		return ubicacion2;
	}

	public void setUbicacion2(String ubicacion2) {
		this.ubicacion2 = ubicacion2;
	}

	public String getUbicacion3() {
		return ubicacion3;
	}

	public void setUbicacion3(String ubicacion3) {
		this.ubicacion3 = ubicacion3;
	}

	public String getUbicacion4() {
		return ubicacion4;
	}

	public void setUbicacion4(String ubicacion4) {
		this.ubicacion4 = ubicacion4;
	}

	public Double getPmp() {
		return pmp;
	}

	public void setPmp(Double pmp) {
		this.pmp = pmp;
	}

	public void sumarStock(double stock) {
		this.stock += stock;
	}
	
	public void sumarStockUMA(double stockUMA) {
		this.stockUMA += stockUMA;
	}
	
	public void sumarStockPendienteServir(double stockPendienteServir) {
		this.stockPendServir += stockPendienteServir;
	}
	
	public void sumarStockPendienteRecibir(double stockPendienteRecibir) {
		this.stockPendRecibir += stockPendienteRecibir;
	}
	
	public void restarStock(double stock) {
		this.stock -= stock;
	}
	
	public void restarStockUMA(double stockUMA) {
		this.stockUMA -= stockUMA;
	}
	
	public void restarStockPendienteServir(double stockPendienteServir) {
		this.stockPendServir -= stockPendienteServir;
	}
	
	public void restarStockPendienteRecibir(double stockPendienteRecibir) {
		this.stockPendRecibir -= stockPendRecibir;
	}
}
