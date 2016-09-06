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

package com.comerzzia.persistencia.core.empresas;

import com.comerzzia.persistencia.general.almacenes.AlmacenBean;

public class AsistenteConfiguracionEmpresaBean {
	
	public static final int PASO_INICIO = 0;
	public static final int PASO_EMPRESA = 1;
	public static final int PASO_LOGO = 2;
	public static final int PASO_ALMACEN = 3;
	public static final int PASO_DESGLOSE = 4;
	
	private int paso;
	private EmpresaBean empresa;
	private AlmacenBean almacen;
	private boolean ventaPublico;
	private boolean desglosar;
	private String tituloDesglose1;
	private String tituloDesglose2;
	
	
	public AsistenteConfiguracionEmpresaBean (){
		this.empresa = new EmpresaBean();
		this.almacen = new AlmacenBean();
		this.ventaPublico = true;
		this.desglosar = false;
		this.paso = PASO_INICIO;
	}
	
	
	public int getPaso() {
		return paso;
	}
	public void setPaso(int paso) {
		this.paso = paso;
	}
	
	
	public EmpresaBean getEmpresa() {
		return empresa;
	}
	public void setEmpresa(EmpresaBean empresa) {
		this.empresa = empresa;
	}
	
	
	public AlmacenBean getAlmacen() {
		return almacen;
	}
	public void setAlmacen(AlmacenBean almacen) {
		this.almacen = almacen;
	}
	
	
	public boolean isVentaPublico() {
		return ventaPublico;
	}
	public void setVentaPublico(boolean ventaPublico) {
		this.ventaPublico = ventaPublico;
	}
	
	
	public boolean isDesglosar() {
		return desglosar;
	}
	public void setDesglosar(boolean desglosar) {
		this.desglosar = desglosar;
	}
	
	
	public String getTituloDesglose1() {
		return tituloDesglose1;
	}
	public void setTituloDesglose1(String tituloDesglose1) {
		this.tituloDesglose1 = tituloDesglose1;
	}
	
	
	public String getTituloDesglose2() {
		return tituloDesglose2;
	}
	public void setTituloDesglose2(String tituloDesglose2) {
		this.tituloDesglose2 = tituloDesglose2;
	}
	
	
	public void setPasoInicio() {
		this.paso = PASO_INICIO;
	}	
	public boolean isPasoInicio() {
		return this.paso == PASO_INICIO;
	}
	
	
	public void setPasoEmpresa() {
		this.paso = PASO_EMPRESA;
	}
	public boolean isPasoEmpresa() {
		return this.paso == PASO_EMPRESA;
	}
	
	
	public void setPasoLogo() {
		this.paso = PASO_LOGO;
	}
	public boolean isPasoLogo() {
		return this.paso == PASO_LOGO;
	}
	
	
	public void setPasoAlmacen() {
		this.paso = PASO_ALMACEN;
	}
	public boolean isPasoAlmacen() {
		return this.paso == PASO_ALMACEN;
	}
	
	
	public void setPasoDesglose() {
		this.paso = PASO_DESGLOSE;
	}
	public boolean isPasoDesglose() {
		return this.paso == PASO_DESGLOSE;
	}
	
	
	public void setPasoSiguiente(){
		this.paso++;
	}
	public void setPasoAtras(){
		this.paso--;
	}
}
