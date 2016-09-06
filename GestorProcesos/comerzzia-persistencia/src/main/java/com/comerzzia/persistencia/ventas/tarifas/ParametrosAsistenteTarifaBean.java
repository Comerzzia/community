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

package com.comerzzia.persistencia.ventas.tarifas;

import com.comerzzia.util.base.MantenimientoBean;

public class ParametrosAsistenteTarifaBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -4693218994646756419L;

	public static final String OPERACION_ACT_PRECIOS_VENTA 		= "actualizarPreciosVenta";
	public static final String OPERACION_ACT_PRECIOS_VENTA_PV 	= "actualizarPreciosVentaPV";
	public static final String OPERACION_ACT_PRECIOS_VENTA_PC 	= "actualizarPreciosVentaPC";
	public static final String OPERACION_ACT_PRECIOS_VENTA_PT 	= "actualizarPreciosVentaPT";
	public static final String OPERACION_ACT_PRECIOS_COSTO 		= "actualizarPreciosCosto";
	public static final String OPERACION_ACT_IMPUESTOS 			= "actualizarImpuestos";
	public static final String OPERACION_ACT_ELIMINAR 			= "actualizarEliminar";
	public static final String OPERACION_INS_INSERTAR 		= "insertarSolo";
	public static final String OPERACION_INS_ACTUALIZAR 	= "insertarActualizar";
	
	private String codTarActual;
	private String codTarOrigen;
	private String desTar;
	private String resultado;
	private String criterio = "";
	private String codArtDesde = "";
	private String desArtDesde;
	private String codArtHasta = "";
	private String desArtHasta;
	private String codFamDesde = "";
	private String desFamDesde;
	private String codFamHasta = "";
	private String desFamHasta;
	private String codProDesde = "";
	private String desProDesde;
	private String codProHasta = "";
	private String desProHasta;
	private int paso;
	private Double porcentajeIncDec;
	private Double importeIncDec;
	private Double factorMargen;
	private boolean redondear;

	// resultados
	private int insertados;
	private int actualizados;
	private int versionados;
	private int tratados;
	
	//actualizaciones
	private Long idActualizacion;
	//atributo para mostrar o no la información de artículos versionados.
	private boolean controlVersiones = true;
	
	protected void initNuevoBean() {
	}

	public String getCodTarActual() {
		return codTarActual;
	}

	public void setCodTarActual(String codTarActual) {
		this.codTarActual = (codTarActual != null) ? codTarActual : "";
	}

	public String getCodTarOrigen() {
		return codTarOrigen;
	}

	public void setCodTarOrigen(String codTarOrigen) {
		this.codTarOrigen = (codTarOrigen != null) ? codTarOrigen : "";
	}

	public String getResultado() {
		return resultado;
	}

	public void setResultado(String resultado) {
		this.resultado = (resultado != null) ? resultado : "";
	}

	public String getCriterio() {
		return criterio;
	}

	public void setCriterio(String criterio) {
		this.criterio = (criterio != null) ? criterio : "";
	}

	public String getCodArtDesde() {
		return codArtDesde;
	}

	public void setCodArtDesde(String codArtDesde) {
		this.codArtDesde = (codArtDesde != null) ? codArtDesde.toUpperCase() : "";
	}

	public String getCodArtHasta() {
		return codArtHasta;
	}

	public void setCodArtHasta(String codArtHasta) {
		this.codArtHasta = (codArtHasta != null) ? codArtHasta.toUpperCase() : "";
	}

	public String getCodFamDesde() {
		return codFamDesde;
	}

	public void setCodFamDesde(String codFamDesde) {
		this.codFamDesde = (codFamDesde != null) ? codFamDesde.toUpperCase() : "";
	}

	public String getCodFamHasta() {
		return codFamHasta;
	}

	public void setCodFamHasta(String codFamHasta) {
		this.codFamHasta = (codFamHasta != null) ? codFamHasta.toUpperCase() : "";
	}

	public String getCodProDesde() {
		return codProDesde;
	}

	public void setCodProDesde(String codProDesde) {
		this.codProDesde = (codProDesde != null) ? codProDesde.toUpperCase() : "";
	}

	public String getCodProHasta() {
		return codProHasta;
	}

	public void setCodProHasta(String codProHasta) {
		this.codProHasta = (codProHasta != null) ? codProHasta.toUpperCase() : "";
	}

	public String getDesArtDesde() {
		return desArtDesde;
	}

	public void setDesArtDesde(String desArtDesde) {
		this.desArtDesde = (desArtDesde != null) ? desArtDesde : "";
	}

	public String getDesArtHasta() {
		return desArtHasta;
	}

	public void setDesArtHasta(String desArtHasta) {
		this.desArtHasta = (desArtHasta != null) ? desArtHasta : "";
	}

	public String getDesFamDesde() {
		return desFamDesde;
	}

	public void setDesFamDesde(String desFamDesde) {
		this.desFamDesde = (desFamDesde != null) ? desFamDesde : "";
	}

	public String getDesFamHasta() {
		return desFamHasta;
	}

	public void setDesFamHasta(String desFamHasta) {
		this.desFamHasta = (desFamHasta != null) ? desFamHasta : "";
	}

	public String getDesProDesde() {
		return desProDesde;
	}

	public void setDesProDesde(String desProDesde) {
		this.desProDesde = (desProDesde != null) ? desProDesde : "";
	}

	public String getDesProHasta() {
		return desProHasta;
	}

	public void setDesProHasta(String desProHasta) {
		this.desProHasta = (desProHasta != null) ? desProHasta : "";
	}

	public int getInsertados() {
		return insertados;
	}

	public void setInsertados(int insertados) {
		this.insertados = insertados;
	}

	public int getActualizados() {
		return actualizados;
	}

	public void setActualizados(int actualizados) {
		this.actualizados = actualizados;
	}

	public int getVersionados() {
		return versionados;
	}

	public void setVersionados(int versionados) {
		this.versionados = versionados;
	}

	public int getTratados() {
		return tratados;
	}

	public void setTratados(int tratados) {
		this.tratados = tratados;
	}

	public int getPaso() {
		return paso;
	}

	public void setPaso(int paso) {
		this.paso = paso;
	}

	public String getDesTar() {
		return desTar;
	}

	public void setDesTar(String desTar) {
		this.desTar = (desTar != null) ? desTar : "";
	}

	public Double getPorcentajeIncDec() {
		return porcentajeIncDec;
	}

	public void setPorcentajeIncDec(Double porcentajeIncDec) {
		this.porcentajeIncDec = porcentajeIncDec;
	}

	public Double getImporteIncDec() {
		return importeIncDec;
	}

	public void setImporteIncDec(Double importeIncDec) {
		this.importeIncDec = importeIncDec;
	}

	public Double getFactorMargen() {
		return factorMargen;
	}

	public void setFactorMargen(Double factorMargen) {
		this.factorMargen = factorMargen;
	}
	
	public boolean isTarifaActualGeneral(){
		return (getCodTarActual()!=null && getCodTarActual().equals(TarifaBean.TARIFA_GENERAL));
	}
	public boolean isTarifaOrigenGeneral(){
		return (getCodTarOrigen()!=null && getCodTarOrigen().equals(TarifaBean.TARIFA_GENERAL));
	}
	
	public boolean isRedondear() {
		return redondear;
	}

	public void setRedondear(boolean redondear) {
		this.redondear = redondear;
	}

	public String getResumenInsercionMasiva() {
		StringBuilder str = new StringBuilder();
		str.append("Origen de los artículos: ");
		str.append(getCodTarOrigen());
		getResumenSeleccion(str);
		str.append("\nCriterio de actualización: <");
		if (isOperacionInsertarActualizar()) {
			str.append("Insertar artículos nuevos y actualizar los existentes");
		} 
		else if (isOperacionInsertarSolo()) {
			str.append("Insertar artículos nuevos");
		}

		str.append(">.");

		return str.toString();
	}

	public String getResumenActualizacionMasiva() {
		StringBuilder str = new StringBuilder();

		str.append("Operación: ");
		if (isOperacionActualizarPrecioVenta()) {
			str.append("Actualizar precios de venta");
		} 
		else if (isOperacionActualizarPrecioCosto()) {
			str.append("Actualizar precios de costo con los valores actuales. \n  (Se actualizarán los precios de venta sujetos a margen sobre costo)");
		} 
		else if (isOperacionActualizarEliminando()) {
			str.append("Eliminar artículos de la tarifa");
		}
		else if (isOperacionActualizarImpuestos()) {
			str.append("Actualizar precios de venta + impuestos con la vigencia actual");
		}
		getResumenSeleccion(str);
		if (isOperacionActualizarPrecioVentaPV() || isOperacionActualizarPrecioVentaPT() || isOperacionActualizarPrecioVentaPC()) {
			str.append("\nSe aplicará <");
			if (getPorcentajeIncDec() != null) {
				str.append("Incremento/Decremento del ");
				str.append(getPorcentajeIncDec());
				str.append(" % ");
			} 
			else if (getImporteIncDec() != null) {
				str.append("Importe Incremento/Decremento de ");
				str.append(getImporteIncDec());
			} 
			else if (getFactorMargen() != null) {
				str.append("Factor de Margen = ");
				str.append(getFactorMargen());
			}
			str.append("> sobre <");
			if (getCriterio().equals(OPERACION_ACT_PRECIOS_VENTA_PV)) { 
				str.append("Precio de venta");
			} 
			else if (getCriterio().equals(OPERACION_ACT_PRECIOS_VENTA_PT)) {
				str.append("Precio de venta + impuestos");
			} 
			else if (getCriterio().equals(OPERACION_ACT_PRECIOS_VENTA_PC)) {
				str.append("Precio de costo");
			}
			str.append(">.");
		}
		else if (isOperacionActualizarPrecioCosto() && getPorcentajeIncDec()!=null){
			str.append("\nSe aplicará Porcentaje de incremento / decremento");
		}
		if (isRedondear()) {
			str.append("\nSe aplicará redondeo al precio de venta + impuestos.");
		}
		return str.toString();
	}

	public String getResultadoActualizacionMasiva() {
		StringBuilder str = new StringBuilder();
		str.append("Artículos tratados: ");
		str.append(getTratados());
		str.append("\nArtículos actualizados: ");
		str.append(getActualizados());
		if (controlVersiones){
			str.append("\n\nArtículos versionados: ");
			str.append(getVersionados());
		}
		return str.toString();
	}


	public String getResultadoInsercionMasiva() {
		StringBuilder str = new StringBuilder();
		str.append("Artículos tratados: ");
		str.append(getTratados());
		str.append("\n\nArtículos insertados: ");
		str.append(getInsertados());
		str.append("\nArtículos actualizados: ");
		str.append(getActualizados());
		if (controlVersiones){
			str.append("\n\nArtículos versionados: ");
			str.append(getVersionados());
		}
		return str.toString();
	}

	private void getResumenSeleccion(StringBuilder str) {
		if (isOperacionActualizarImpuestos()){
			return;
		}
		str.append("\nCriterio de Selección:");
		str.append("\n\tArtículos: ");
		if (getCodArtDesde().isEmpty() && getCodArtHasta().isEmpty()) {
			str.append("Todos");
		} 
		else if (!getCodArtDesde().isEmpty() && getCodArtHasta().isEmpty()) {
			str.append("Desde ");
			str.append(getCodArtDesde());
		} 
		else if (getCodArtDesde().isEmpty() && !getCodArtHasta().isEmpty()) {
			str.append("Hasta ");
			str.append(getCodArtHasta());
		} 
		else if (!getCodArtDesde().isEmpty() && !getCodArtHasta().isEmpty()) {
			str.append("Desde ");
			str.append(getCodArtDesde());
			str.append(" a ");
			str.append(getCodArtHasta());
		}
		str.append("\n\tFamilias: ");
		if (getCodFamDesde().isEmpty() && getCodFamHasta().isEmpty()) {
			str.append("Todas");
		} 
		else if (!getCodFamDesde().isEmpty() && getCodFamHasta().isEmpty()) {
			str.append("Desde ");
			str.append(getCodFamDesde());
		} 
		else if (getCodFamDesde().isEmpty() && !getCodFamHasta().isEmpty()) {
			str.append("Hasta ");
			str.append(getCodFamHasta());
		} 
		else if (!getCodFamDesde().isEmpty() && !getCodFamHasta().isEmpty()) {
			str.append("Desde ");
			str.append(getCodFamDesde());
			str.append(" a ");
			str.append(getCodFamHasta());
		}
		str.append("\n\tProveedores: ");
		if (getCodProDesde().isEmpty() && getCodProHasta().isEmpty()) {
			str.append("Todos");
		} 
		else if (!getCodProDesde().isEmpty() && getCodProHasta().isEmpty()) {
			str.append("Desde ");
			str.append(getCodProDesde());
		} 
		else if (getCodProDesde().isEmpty() && !getCodProHasta().isEmpty()) {
			str.append("Hasta ");
			str.append(getCodProHasta());
		} 
		else if (!getCodProDesde().isEmpty() && !getCodProHasta().isEmpty()) {
			str.append("Desde ");
			str.append(getCodProDesde());
			str.append(" a ");
			str.append(getCodProHasta());
		}
	}

	public boolean isOperacionActualizarPrecioVenta(){
		return getCriterio().equals(OPERACION_ACT_PRECIOS_VENTA_PC)
			|| getCriterio().equals(OPERACION_ACT_PRECIOS_VENTA_PT)
			|| getCriterio().equals(OPERACION_ACT_PRECIOS_VENTA_PV)
			|| getCriterio().equals(OPERACION_ACT_PRECIOS_VENTA);
	}
	public boolean isOperacionActualizarPrecioCosto(){
		return getCriterio().equals(OPERACION_ACT_PRECIOS_COSTO);
	}
	public boolean isOperacionActualizarEliminando(){
		return getCriterio().equals(OPERACION_ACT_ELIMINAR);
	}
	public boolean isOperacionActualizarImpuestos(){
		return getCriterio().equals(OPERACION_ACT_IMPUESTOS);
	}
	public boolean isOperacionActualizarPrecioVentaPV(){
		return getCriterio().equals(OPERACION_ACT_PRECIOS_VENTA_PV);
	}
	public boolean isOperacionActualizarPrecioVentaPT(){
		return getCriterio().equals(OPERACION_ACT_PRECIOS_VENTA_PT);
	}
	public boolean isOperacionActualizarPrecioVentaPC(){
		return getCriterio().equals(OPERACION_ACT_PRECIOS_VENTA_PC);
	}
	public boolean isOperacionInsertarSolo(){
		return getCriterio().equals(OPERACION_INS_INSERTAR);
	}
	public boolean isOperacionInsertarActualizar(){
		return getCriterio().equals(OPERACION_INS_ACTUALIZAR);
	}

	public Long getIdActualizacion() {
		return idActualizacion;
	}

	public void setIdActualizacion(Long idActualizacion) {
		this.idActualizacion = idActualizacion;
	}

	public boolean isControlVersiones() {
		return controlVersiones;
	}

	public void setControlVersiones(boolean controlVersiones) {
		this.controlVersiones = controlVersiones;
	}
	
	
	
}
