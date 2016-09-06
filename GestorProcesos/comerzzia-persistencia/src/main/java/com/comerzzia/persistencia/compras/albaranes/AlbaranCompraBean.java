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

package com.comerzzia.persistencia.compras.albaranes;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.compras.albaranes.articulos.ArticuloAlbaranCompraBean;
import com.comerzzia.persistencia.compras.albaranes.pagos.PagoAlbaranCompraBean;
import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;


public class AlbaranCompraBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 4062757755282352592L;
	
	private Long idAlbaran = null;
	private String codEmpresa = null;
	private Short periodo = null;
	private String codSerie = null;
	private String desSerie = null;
	private String codConceptoAlmacen = null;
	private String desConceptoAlmacen = null;
	private String codAplicacion = "COMP";
	private Long numAlbaran = null;
	private Date fecha = null;
	private Date fechaSuministro = null;
	private String referenciaProveedor = null;
	protected String codProveedor = null;
	protected String desProveedor = null;
	private String codMedioPago = null;
	private String desMedioPago = null;
	private String codMedioPagoVen = null;
	private String desMedioPagoVen = null;
	private String personaContacto = null;
	private String codAlmacen = null;
	private String desAlmacen = null;
	private String codCaja = null;
	private Long idDiarioCaja = null;
	private Long idGrupoImpuestos = null;
	private Long idTratamientoImpuestos = null;
	private String desTratamientoImpuestos = null;
	private Double base = null;
	private Double impuestos = null;
	private Double total = null;
	private String observaciones = null;
	private Long idUsuario = null;
	private Long idFacturaSoportada = null;
	private String codSerieFactura = null;
	private Long numFactura = null;
	private Date fechaFactura = null;
	
	// Artículos
	private List<ArticuloAlbaranCompraBean> articulos = null;
	
	// Impuestos
	private ImpuestosBean detalleImpuestos = null;
	
	// Pagos
	private List<PagoAlbaranCompraBean> pagos = null;
	
	@Override
	protected void initNuevoBean() {
		setArticulos(new ArrayList<ArticuloAlbaranCompraBean>());
		setDetalleImpuestos(new ImpuestosBean());
		setPagos(new ArrayList<PagoAlbaranCompraBean>());
	}
	
	/**
	 * @return the idAlbaran
	 */
	public Long getIdAlbaran() {
		return idAlbaran;
	}

	/**
	 * @param idAlbaran the idAlbaran to set
	 */
	public void setIdAlbaran(Long idAlbaran) {
		this.idAlbaran = idAlbaran;
	}

	/**
	 * @return the codEmpresa
	 */
	public String getCodEmpresa() {
		return codEmpresa;
	}

	/**
	 * @param codEmpresa the codEmpresa to set
	 */
	public void setCodEmpresa(String codEmpresa) {
		this.codEmpresa = codEmpresa;
	}

	/**
	 * @return the periodo
	 */
	public Short getPeriodo() {
		return periodo;
	}

	/**
	 * @param periodo the periodo to set
	 */
	public void setPeriodo(Short periodo) {
		this.periodo = periodo;
	}

	/**
	 * @return the codSerie
	 */
	public String getCodSerie() {
		return codSerie;
	}

	/**
	 * @param codSerie the codSerie to set
	 */
	public void setCodSerie(String codSerie) {
		this.codSerie = codSerie;
	}

	/**
	 * @return the desSerie
	 */
	public String getDesSerie() {
		return desSerie;
	}

	/**
	 * @param desSerie the desSerie to set
	 */
	public void setDesSerie(String desSerie) {
		this.desSerie = desSerie;
	}

	/**
	 * @return the numAlbaran
	 */
	public Long getNumAlbaran() {
		return numAlbaran;
	}

	/**
	 * @param numAlbaran the numAlbaran to set
	 */
	public void setNumAlbaran(Long numAlbaran) {
		this.numAlbaran = numAlbaran;
	}

	/**
	 * @return the fecha
	 */
	public Date getFecha() {
		return fecha;
	}

	/**
	 * @param fecha the fecha to set
	 */
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	/**
	 * @return the fechaSuministro
	 */
	public Date getFechaSuministro() {
		return fechaSuministro;
	}

	/**
	 * @param fechaSuministro the fechaSuministro to set
	 */
	public void setFechaSuministro(Date fechaSuministro) {
		this.fechaSuministro = fechaSuministro;
	}

	/**
	 * @return the referenciaProveedor
	 */
	public String getReferenciaProveedor() {
		return referenciaProveedor;
	}

	/**
	 * @param referenciaProveedor the referenciaProveedor to set
	 */
	public void setReferenciaProveedor(String referenciaProveedor) {
		this.referenciaProveedor = referenciaProveedor;
	}

	/**
	 * @return the codProveedor
	 */
	public String getCodProveedor() {
		return codProveedor;
	}

	/**
	 * @param codProveedor the codProveedor to set
	 */
	public void setCodProveedor(String codProveedor) {
		this.codProveedor = codProveedor;
	}

	public String getCodMedioPago() {
		return codMedioPago;
	}

	public void setCodMedioPago(String codMedioPago) {
		this.codMedioPago = codMedioPago;
	}

	public String getDesMedioPago() {
		return desMedioPago;
	}

	public void setDesMedioPago(String desMedioPago) {
		this.desMedioPago = desMedioPago;
	}

	public String getCodMedioPagoVen() {
		return codMedioPagoVen;
	}

	public void setCodMedioPagoVen(String codMedioPagoVen) {
		this.codMedioPagoVen = codMedioPagoVen;
	}

	public String getDesMedioPagoVen() {
		return desMedioPagoVen;
	}

	public void setDesMedioPagoVen(String desMedioPagoVen) {
		this.desMedioPagoVen = desMedioPagoVen;
	}

	/**
	 * @return the desProveedor
	 */
	public String getDesProveedor() {
		return desProveedor;
	}

	/**
	 * @param desProveedor the desProveedor to set
	 */
	public void setDesProveedor(String desProveedor) {
		this.desProveedor = desProveedor;
	}

	/**
	 * @return the personaContacto
	 */
	public String getPersonaContacto() {
		return personaContacto;
	}

	/**
	 * @param personaContacto the personaContacto to set
	 */
	public void setPersonaContacto(String personaContacto) {
		this.personaContacto = personaContacto;
	}

	/**
	 * @return the codAlmacen
	 */
	public String getCodAlmacen() {
		return codAlmacen;
	}

	/**
	 * @param codAlmacen the codAlmacen to set
	 */
	public void setCodAlmacen(String codAlmacen) {
		this.codAlmacen = codAlmacen;
	}

	/**
	 * @return the desAlmacen
	 */
	public String getDesAlmacen() {
		return desAlmacen;
	}

	/**
	 * @param desAlmacen the desAlmacen to set
	 */
	public void setDesAlmacen(String desAlmacen) {
		this.desAlmacen = desAlmacen;
	}

	/**
	 * @return the codCaja
	 */
	public String getCodCaja() {
		return codCaja;
	}

	/**
	 * @param codCaja the codCaja to set
	 */
	public void setCodCaja(String codCaja) {
		this.codCaja = codCaja;
	}

	/**
	 * @return the idDiarioCaja
	 */
	public Long getIdDiarioCaja() {
		return idDiarioCaja;
	}

	/**
	 * @param idDiarioCaja the idDiarioCaja to set
	 */
	public void setIdDiarioCaja(Long idDiarioCaja) {
		this.idDiarioCaja = idDiarioCaja;
	}

	/**
	 * @return the idGrupoImpuestos
	 */
	public Long getIdGrupoImpuestos() {
		return idGrupoImpuestos;
	}

	/**
	 * @param idGrupoImpuestos the idGrupoImpuestos to set
	 */
	public void setIdGrupoImpuestos(Long idGrupoImpuestos) {
		this.idGrupoImpuestos = idGrupoImpuestos;
	}

	/**
	 * @return the idTratamientoImpuestos
	 */
	public Long getIdTratamientoImpuestos() {
		return idTratamientoImpuestos;
	}

	/**
	 * @param idTratamientoImpuestos the idTratamientoImpuestos to set
	 */
	public void setIdTratamientoImpuestos(Long idTratamientoImpuestos) {
		this.idTratamientoImpuestos = idTratamientoImpuestos;
	}

	public String getDesTratamientoImpuestos() {
		return desTratamientoImpuestos;
	}

	public void setDesTratamientoImpuestos(String desTratamientoImpuestos) {
		this.desTratamientoImpuestos = desTratamientoImpuestos;
	}

	/**
	 * @return the base
	 */
	public Double getBase() {
		return base;
	}

	/**
	 * @param base the base to set
	 */
	public void setBase(Double base) {
		this.base = base;
	}

	/**
	 * @return the impuestos
	 */
	public Double getImpuestos() {
		return impuestos;
	}

	/**
	 * @param impuestos the impuestos to set
	 */
	public void setImpuestos(Double impuestos) {
		this.impuestos = impuestos;
	}

	/**
	 * @return the total
	 */
	public Double getTotal() {
		return total;
	}

	/**
	 * @param total the total to set
	 */
	public void setTotal(Double total) {
		this.total = total;
	}

	/**
	 * @return the observaciones
	 */
	public String getObservaciones() {
		return observaciones;
	}

	/**
	 * @param observaciones the observaciones to set
	 */
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	/**
	 * @return the idUsuario
	 */
	public Long getIdUsuario() {
		return idUsuario;
	}

	/**
	 * @param idUsuario the idUsuario to set
	 */
	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}

	/**
	 * @return the idFacturaSoportada
	 */
	public Long getIdFacturaSoportada() {
		return idFacturaSoportada;
	}

	/**
	 * @param idFacturaSoportada the idFacturaSoportada to set
	 */
	public void setIdFacturaSoportada(Long idFacturaSoportada) {
		this.idFacturaSoportada = idFacturaSoportada;
	}
	
	
	/**
	 * Comprueba si el albarán está facturado
	 * @return true si el albarán está facturado, false en caso contrario
	 */
	public boolean isFacturado() {
		if(this.idFacturaSoportada != null && this.idFacturaSoportada != 0){
			return true;
		}
		else{
			return false;
		}
	}


	// ********* Artículos ******** //
	public List<ArticuloAlbaranCompraBean> getArticulos() {
		return articulos;
	}
	
	public void setArticulos(List<ArticuloAlbaranCompraBean> articulos) {
		this.articulos = articulos;
	}
	
	public ArticuloAlbaranCompraBean getArticulo(Integer indice) {
		return articulos.get(indice);
	}
	
	public void addArticulo(ArticuloAlbaranCompraBean articulo) {
		articulos.add(articulo);
	}

	
	public boolean isTieneArticulos() {
		if(articulos.size() > 0){
			for (int i = 0; i < articulos.size(); i++) {
				if(articulos.get(i).getEstadoBean() != Estado.BORRADO){
					return true;
				}
			}
		}

		return false;
	}

	
	/**
	 * @return the detalleImpuestos
	 */
	public ImpuestosBean getDetalleImpuestos() {
		return detalleImpuestos;
	}

	/**
	 * @param detalleImpuestos the detalleImpuestos to set
	 */
	public void setDetalleImpuestos(ImpuestosBean detalleImpuestos) {
		this.detalleImpuestos = detalleImpuestos;
	}
	
	// ********* Pagos ******** //
	public List<PagoAlbaranCompraBean> getPagos() {
		return pagos;
	}
	public void setPagos(List<PagoAlbaranCompraBean> pagos) {
		this.pagos = pagos;
	}
	public PagoAlbaranCompraBean getPago(Integer indice) {
		return pagos.get(indice);
	}
	public void addPago(PagoAlbaranCompraBean pago) {
		pagos.add(pago);
	}
	public boolean isTienePagos() {
		if(pagos != null && pagos.size() > 0){
			for (int i = 0; i < pagos.size(); i++) {
				if(pagos.get(i).getEstadoBean() != Estado.BORRADO){
					return true;
				}
			}
		}

		return false;
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

	public String getCodAplicacion() {
		return codAplicacion;
	}

	public void setCodAplicacion(String codAplicacion) {
		this.codAplicacion = codAplicacion;
	}

	public String getCodSerieFactura() {
		return codSerieFactura;
	}

	public void setCodSerieFactura(String codSerieFactura) {
		this.codSerieFactura = codSerieFactura;
	}

	public Long getNumFactura() {
		return numFactura;
	}

	public void setNumFactura(Long numFactura) {
		this.numFactura = numFactura;
	}

	public Date getFechaFactura() {
		return fechaFactura;
	}

	public void setFechaFactura(Date fechaFactura) {
		this.fechaFactura = fechaFactura;
	}
}
