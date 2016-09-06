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

package com.comerzzia.persistencia.general.articulos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.general.almacenes.articulos.AlmacenArticuloBean;
import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean;
import com.comerzzia.persistencia.general.articulos.fotos.FotoArticuloBean;
import com.comerzzia.persistencia.general.articulos.unidadesmedidas.UnidadMedidaArticuloBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
import com.comerzzia.util.base.MantenimientoBean;

public class ArticuloBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3323891827694710446L;

	
	private String codArticulo;
	private String desArticulo;
	
	//organizacion
	private String formato;
	private String codFamilia;
	private String desFamilia;
	private String codSeccion;
	private String desSeccion;
	private String codCategorizacion;
	private String desCategorizacion;
	private boolean escaparate = false;
	private boolean numSeries = false;
	private boolean generico = false;
	private boolean desglose1 = false;
	private boolean desglose2 = false;
	private String codImpuesto;
	private String desImpuesto;
	private String unidadMedAlt;
	private Date fechaAlta;
	private Date fechaVersion;
	private Long version;
	
	//compras
	private String codProveedor;
	private String desProveedor;
	private String referencia;
	private String codFabricante;
	private String desFabricante;
	
	private Double dtoProveedor = 0D;
	private Double precioFinal;
	
	//precios
	private boolean actAutomaticaCosto = false;
	private Date fechaPrecioCosto;
	private ArticuloTarifaBean articuloTarifa;
	
	private String observaciones;
	
	//codigos barras
	private boolean codigosCargados = false;
	private List<CodigoBarrasArticuloBean> codigosBarras;
	
	//unidades de medidas
	private boolean unidadesCargadas = false;
	private List<UnidadMedidaArticuloBean> unidadesMedidas;
	private String codUnidadMedidaEtiq;
	private String desUnidadMedidaEtiq;
	private Double cantidadUnidadMedidaEtiq;
	
	//almacenes
	private boolean almacenesCargados = false;
	private List<AlmacenArticuloBean> almacenes;
	
	//tarifas
	private boolean tarifasCargadas = false;
	private List<ArticuloTarifaBean> tarifas;
	private List<ArticuloPromocionBean> promociones = new ArrayList<ArticuloPromocionBean>();
	
	// fotos
	private boolean fotosCargadas = false;
	private List<FotoArticuloBean> fotos;

	protected void initNuevoBean() {
		codigosBarras = new ArrayList<CodigoBarrasArticuloBean>();
		this.codigosCargados = true;
		unidadesMedidas = new ArrayList<UnidadMedidaArticuloBean>();
		this.unidadesCargadas = true;
		almacenes = new ArrayList<AlmacenArticuloBean>();
		this.almacenesCargados = true;
		tarifas = new ArrayList<ArticuloTarifaBean>();
		this.tarifasCargadas = true;
		articuloTarifa = new ArticuloTarifaBean();
		articuloTarifa.setCodTar(TarifaBean.TARIFA_GENERAL);
		fotos = new ArrayList<FotoArticuloBean>();
		this.fotosCargadas = true;
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

	public String getFormato() {
		return formato != null ? formato : "";
	}

	public void setFormato(String formato) {
		this.formato = formato;
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
		return codCategorizacion != null ? codCategorizacion : "";
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

	public boolean isEscaparate() {
		return escaparate;
	}

	public void setEscaparate(boolean escaparate) {
		this.escaparate = escaparate;
	}

	public boolean isNumSeries() {
		return numSeries;
	}

	public void setNumSeries(boolean numSeries) {
		this.numSeries = numSeries;
	}

	public boolean isGenerico() {
		return generico;
	}

	public void setGenerico(boolean generico) {
		this.generico = generico;
	}

	public boolean isDesglose1() {
		return desglose1;
	}

	public void setDesglose1(boolean desglose1) {
		this.desglose1 = desglose1;
	}

	public boolean isDesglose2() {
		return desglose2;
	}

	public void setDesglose2(boolean desglose2) {
		this.desglose2 = desglose2;
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

	public String getEscaparate() {
		return (escaparate) ? TRUE : FALSE;
	}

	public void setEscaparate(String escaparate) {
		this.escaparate = escaparate.equals(TRUE);
	}

	public String getNumSeries() {
		return (numSeries) ? TRUE : FALSE;
	}

	public void setNumSeries(String numSeries) {
		this.numSeries = numSeries.equals(TRUE);
	}

	public String getGenerico() {
		return (generico) ? TRUE : FALSE;
	}

	public void setGenerico(String generico) {
		this.generico = generico.equals(TRUE);
	}

	public String getDesglose1() {
		return (desglose1) ? TRUE : FALSE;
	}

	public void setDesglose1(String desglose1) {
		this.desglose1 = desglose1.equals(TRUE);
	}

	public String getDesglose2() {
		return (desglose2) ? TRUE : FALSE;
	}

	public void setDesglose2(String desglose2) {
		this.desglose2 = desglose2.equals(TRUE);
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public String getCodFabricante() {
		return codFabricante;
	}

	public void setCodFabricante(String codFabricante) {
		this.codFabricante = codFabricante;
	}

	public String getDesFabricante() {
		return desFabricante;
	}

	public void setDesFabricante(String desFabricante) {
		this.desFabricante = desFabricante;
	}

	public String getActAutomaticaCosto() {
		return (actAutomaticaCosto) ? TRUE : FALSE;
	}

	public void setActAutomaticaCosto(String actAutomaticaCosto) {
		this.actAutomaticaCosto = actAutomaticaCosto.equals(TRUE);
	}

	public Date getFechaPrecioCosto() {
		return fechaPrecioCosto;
	}

	public void setFechaPrecioCosto(Date fechaPrecioCosto) {
		this.fechaPrecioCosto = fechaPrecioCosto;
	}

	public Double getDtoProveedor() {
		return dtoProveedor;
	}

	public void setDtoProveedor(Double dtoProveedor) {
		this.dtoProveedor = dtoProveedor;
	}

	public void setDtoProvedor(Double dtoProveedor) {
		this.dtoProveedor = dtoProveedor;
	}

	public Double getPrecioFinal() {
		return precioFinal;
	}

	public void setPrecioFinal(Double precioFinal) {
		this.precioFinal = precioFinal;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public ArticuloTarifaBean getArticuloTarifa() {
		return articuloTarifa;
	}

	public void setArticuloTarifa(ArticuloTarifaBean articuloTarifa) {
		this.articuloTarifa = articuloTarifa;
	}
	
	public void setEstadoBean(int estadoBean){
		super.setEstadoBean(estadoBean);
		getArticuloTarifa().setEstadoBean(estadoBean);
	}
	
	// ******** CÓDIGOS DE BARRAS ******** //
	public boolean isCodigosCargados() {
		return codigosCargados;
	}
	public void setCodigosCargados(boolean codigosCargados) {
		this.codigosCargados = codigosCargados;
	}
	
	public List<CodigoBarrasArticuloBean> getCodigosBarras() {
		return codigosBarras;
	}
	public void setCodigosBarras(List<CodigoBarrasArticuloBean> codigosBarras) {
		this.codigosBarras = codigosBarras;
	}
	
	public int getNumCodigosBarras() {
		return this.codigosBarras.size();
	}
	
	public CodigoBarrasArticuloBean getCodigoBarras(int indice){
		return this.codigosBarras.get(indice);
	}
	public void addCodigo(CodigoBarrasArticuloBean codigo){
		this.codigosBarras.add(codigo);
	}
	public void deleteCodigo(int indice){
		if(getCodigoBarras(indice).isEstadoNuevo()) {
			codigosBarras.remove(indice);
		}
		else {
			this.getCodigoBarras(indice).borrar();
		}
	}
	
	
	// ******** UNIDADES DE MEDIDA ******** //
	public boolean isUnidadesCargadas() {
		return unidadesCargadas;
	}
	public void setUnidadesCargadas(boolean unidadesCargadas) {
		this.unidadesCargadas = unidadesCargadas;
	}
	
	public List<UnidadMedidaArticuloBean> getUnidadesMedidas() {
		return unidadesMedidas;
	}
	public void setUnidadesMedidas(List<UnidadMedidaArticuloBean> unidadesMedidas) {
		this.unidadesMedidas = unidadesMedidas;
	}
	
	public int getNumUnidadesMedidas() {
		return this.codigosBarras.size();
	}
	
	public UnidadMedidaArticuloBean getUnidadMedida(int indice){
		return this.unidadesMedidas.get(indice);
	}
	public void addUnidadMedida(UnidadMedidaArticuloBean codigo){
		this.unidadesMedidas.add(codigo);
	}
	public void deleteUnidadMedida(int indice) {
		if(getUnidadMedida(indice).isEstadoNuevo()) {
			unidadesMedidas.remove(indice);
		}
		else {
			this.getUnidadMedida(indice).borrar();
		}
	}
	
	public String getUnidadMedAlt() {
		return unidadMedAlt;
	}
	public void setUnidadMedAlt(String unidadMedAlt) {
		this.unidadMedAlt = unidadMedAlt;
	}

	public String getCodUnidadMedidaEtiq() {
		return codUnidadMedidaEtiq != null ? codUnidadMedidaEtiq : "";
	}

	public void setCodUnidadMedidaEtiq(String codUnidadMedidaEtiq) {
		this.codUnidadMedidaEtiq = codUnidadMedidaEtiq;
	}

	public String getDesUnidadMedidaEtiq() {
		return desUnidadMedidaEtiq;
	}

	public void setDesUnidadMedidaEtiq(String desUnidadMedidaEtiq) {
		this.desUnidadMedidaEtiq = desUnidadMedidaEtiq;
	}

	public Double getCantidadUnidadMedidaEtiq() {
		return cantidadUnidadMedidaEtiq;
	}

	public void setCantidadUnidadMedidaEtiq(Double cantidadUnidadMedidaEtiq) {
		this.cantidadUnidadMedidaEtiq = cantidadUnidadMedidaEtiq;
	}

	// ******** ALMACENES ******** //
	public boolean isAlmacenesCargados() {
		return almacenesCargados;
	}

	public void setAlmacenesCargados(boolean almacenesCargados) {
		this.almacenesCargados = almacenesCargados;
	}

	public List<AlmacenArticuloBean> getAlmacenes() {
		return almacenes;
	}

	public void setAlmacenes(List<AlmacenArticuloBean> almacenes) {
		this.almacenes = almacenes;
	}

	public boolean isActAutomaticaCosto() {
		return actAutomaticaCosto;
	}

	public void setActAutomaticaCosto(boolean actAutomaticaCosto) {
		this.actAutomaticaCosto = actAutomaticaCosto;
	}

	// ******** TARIFAS ******** //
	public boolean isTarifasCargadas() {
		return tarifasCargadas;
	}

	public void setTarifasCargadas(boolean tarifasCargadas) {
		this.tarifasCargadas = tarifasCargadas;
	}

	public List<ArticuloTarifaBean> getTarifas() {
		return tarifas;
	}

	public void setTarifas(List<ArticuloTarifaBean> tarifas) {
		this.tarifas = tarifas;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public Date getFechaVersion() {
		return fechaVersion;
	}

	public void setFechaVersion(Date fechaVersion) {
		this.fechaVersion = fechaVersion;
	}

	public Long getVersion() {
		return version;
	}

	public void setVersion(Long version) {
		this.version = version;
	}

	// ******** FOTOS ******** //

	public boolean isFotosCargadas() {
		return fotosCargadas;
	}

	public void setFotosCargadas(boolean fotosCargadas) {
		this.fotosCargadas = fotosCargadas;
	}

	public List<FotoArticuloBean> getFotos() {
		return fotos;
	}

	public void setFotos(List<FotoArticuloBean> fotos) {
		this.fotos = fotos;
	}

	public int getNumFotos() {
		return this.fotos.size();
	}

	public FotoArticuloBean getFoto(int indice){
		return this.fotos.get(indice);
	}

	public void addFoto(FotoArticuloBean foto){
		this.fotos.add(foto);
	}

	public void deleteFoto(int indice){
		if(getFoto(indice).isEstadoNuevo()) {
			fotos.remove(indice);
		}
		else {
			this.getFoto(indice).borrar();
		}
	}

	public List<ArticuloPromocionBean> getPromociones() {
		return promociones;
	}

	public void setPromociones(List<ArticuloPromocionBean> promociones) {
		this.promociones = promociones;
	}
}
