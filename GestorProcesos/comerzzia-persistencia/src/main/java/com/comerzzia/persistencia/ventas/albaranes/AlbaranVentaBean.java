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

package com.comerzzia.persistencia.ventas.albaranes;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.persistencia.ventas.albaranes.articulos.ArticuloAlbaranVentaBean;
import com.comerzzia.persistencia.ventas.albaranes.pagos.PagoAlbaranVentaBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;

public class AlbaranVentaBean extends MantenimientoBean{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 987386374855766161L;

	//Cabecera
	private Long idAlbaran = null;  // PK 
	private String codEmpresa = null;   // UK
	private Short periodo = null;   // UK
	private String codSerie = null; // UK
	private String desSerie = null;
	private Long numAlbaran = null;     // UK
	private String codConceptoAlmacen = null;
	private String desConceptoAlmacen = null;
	private String codAplicacion = "VENT";
	private Date fecha = null;
	private Date fechaSuministro = null;
	private String referenciaCliente = null;
	private Long idTipoPorte = null;
	private String codCliente = null;
	private String desCliente = null;
	private String codTarifa = null;
	private String desTarifa = null;
	private String personaContacto = null;
	private String codAlmacen = null;
	private String desAlmacen = null;
	private String codCaja = null;
	private String uidDiarioCaja = null;
	private Long idGrupoImpuestos = null;
	private Long idTratamientoImpuestos = null;
	private String desTratamientoImpuestos = null;
	private Double base = null;
	private Double impuestos = null;
	private Double total = null;
	private String observaciones = null;
	private Long idUsuario = null;
	private Long idFacturaSoportada = null;
	private Long idFacturaRepercutida = null;
	private String tarjetaFidelizacion = null;
	private String hora = null;
	private String uidTicket = null;
	private String trackingPorte = null;
	
	//Lista de detalles
	private List<ArticuloAlbaranVentaBean> articulos = new ArrayList<ArticuloAlbaranVentaBean>();
	
	// Impuestos
	private ImpuestosBean detalleImpuestos = null;
	
	// Pagos
	private List<PagoAlbaranVentaBean> pagos = null;
	
	
	@Override
	protected void initNuevoBean() {
		setArticulos(new ArrayList<ArticuloAlbaranVentaBean>());
		setDetalleImpuestos(new ImpuestosBean());
		setPagos(new ArrayList<PagoAlbaranVentaBean>());
	}

	public Long getIdAlbaran() {
		return idAlbaran;
	}

	public void setIdAlbaran(Long idAlbaran) {
		this.idAlbaran = idAlbaran;
	}

	public String getCodEmpresa() {
		return codEmpresa;
	}

	public void setCodEmpresa(String codEmpresa) {
		this.codEmpresa = codEmpresa;
	}

	public Short getPeriodo() {
		return periodo;
	}

	public void setPeriodo(Short periodo) {
		this.periodo = periodo;
	}

	public String getCodSerie() {
		return codSerie;
	}

	public void setCodSerie(String codSerie) {
		this.codSerie = codSerie;
	}

	public String getDesSerie() {
		return desSerie;
	}

	public void setDesSerie(String desSerie) {
		this.desSerie = desSerie;
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

	protected void setCodAplicacion(String codAplicacion) {
		this.codAplicacion = codAplicacion;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Date getFechaSuministro() {
		return fechaSuministro;
	}

	public void setFechaSuministro(Date fechaSuministro) {
		this.fechaSuministro = fechaSuministro;
	}

	public String getReferenciaCliente() {
		return referenciaCliente;
	}

	public void setReferenciaCliente(String referenciaCliente) {
		this.referenciaCliente = referenciaCliente;
	}

	public Long getIdTipoPorte() {
		return idTipoPorte;
	}

	public void setIdTipoPorte(Long idTipoPorte) {
		this.idTipoPorte = idTipoPorte;
	}

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}

	public String getDesCliente() {
		return desCliente;
	}

	public void setDesCliente(String desCliente) {
		this.desCliente = desCliente;
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

	public String getPersonaContacto() {
		return personaContacto;
	}

	public void setPersonaContacto(String personaContacto) {
		this.personaContacto = personaContacto;
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

	public Long getIdGrupoImpuestos() {
		return idGrupoImpuestos;
	}

	public void setIdGrupoImpuestos(Long idGrupoImpuestos) {
		this.idGrupoImpuestos = idGrupoImpuestos;
	}

	public Long getIdTratamientoImpuestos() {
		return idTratamientoImpuestos;
	}

	public void setIdTratamientoImpuestos(Long idTratamientoImpuestos) {
		this.idTratamientoImpuestos = idTratamientoImpuestos;
	}

	public String getDesTratamientoImpuestos() {
		return desTratamientoImpuestos;
	}

	public void setDesTratamientoImpuestos(String desTratamientoImpuestos) {
		this.desTratamientoImpuestos = desTratamientoImpuestos;
	}

	public Double getBase() {
		return base;
	}

	public void setBase(Double base) {
		this.base = base;
	}

	public Double getImpuestos() {
		return impuestos;
	}

	public void setImpuestos(Double impuestos) {
		this.impuestos = impuestos;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public Long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getTarjetaFidelizacion() {
		return tarjetaFidelizacion;
	}

	public void setTarjetaFidelizacion(String tarjetaFidelizacion) {
		this.tarjetaFidelizacion = tarjetaFidelizacion;
	}

	public Long getNumAlbaran() {
		return numAlbaran;
	}

	public void setNumAlbaran(Long numAlbaran) {
		this.numAlbaran = numAlbaran;
	}

	public String getCodCaja() {
		return codCaja;
	}

	public void setCodCaja(String codCaja) {
		this.codCaja = codCaja;
	}

	public String getUidDiarioCaja() {
		return uidDiarioCaja;
	}

	public void setUidDiarioCaja(String uidDiarioCaja) {
		this.uidDiarioCaja = uidDiarioCaja;
	}

	public Long getIdFacturaRepercutida() {
		return idFacturaRepercutida;
	}

	public void setIdFacturaRepercutida(Long idFacturaRepercutida) {
		this.idFacturaRepercutida = idFacturaRepercutida;
	}

	public Long getIdFacturaSoportada() {
		return idFacturaSoportada;
	}

	public void setIdFacturaSoportada(Long idFacturaSoportada) {
		this.idFacturaSoportada = idFacturaSoportada;
	}

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}
	
	public String getUidTicket() {
		return uidTicket;
	}
	
	public void setUidTicket(String uidTicket) {
		this.uidTicket = uidTicket;
	}


	// ********* Artículos ******** //
	public List<ArticuloAlbaranVentaBean> getArticulos() {
		return articulos;
	}
	
	public void setArticulos(List<ArticuloAlbaranVentaBean> articulos) {
		this.articulos = articulos;
	}
	
	public ArticuloAlbaranVentaBean getArticulo(Integer indice) {
		return articulos.get(indice);
	}
	
	public void addArticulo(ArticuloAlbaranVentaBean articulo) {
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
	public List<PagoAlbaranVentaBean> getPagos() {
		return pagos;
	}
	public void setPagos(List<PagoAlbaranVentaBean> pagos) {
		this.pagos = pagos;
	}
	public PagoAlbaranVentaBean getPago(Integer indice) {
		return pagos.get(indice);
	}
	public void addPago(PagoAlbaranVentaBean pago) {
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
	
	
	/**
	 * Comprueba si el albarán está facturado
	 * @return true si el albarán está facturado, false en caso contrario
	 */
	public boolean isFacturado() {
		if(this.idFacturaRepercutida != null && this.idFacturaRepercutida != 0){
			return true;
		}
		else{
			return false;
		}
	}
	
	
	/**
	 * Indica si el albarán proviene de un ticket
	 * @return true si el albarán proviene de un ticket, false en caso contrario
	 */
	public boolean isTicket() {
		return (this.uidTicket != null && !this.uidTicket.isEmpty());
	}

	public String getTrackingPorte() {
		return trackingPorte;
	}

	public void setTrackingPorte(String trackingPorte) {
		this.trackingPorte = trackingPorte;
	}
}
