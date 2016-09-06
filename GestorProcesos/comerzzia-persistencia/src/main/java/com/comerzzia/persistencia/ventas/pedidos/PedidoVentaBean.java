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

package com.comerzzia.persistencia.ventas.pedidos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.persistencia.ventas.pedidos.articulos.ArticuloPedidoVentaBean;
import com.comerzzia.persistencia.ventas.pedidos.pagos.PagoPedidoVentaBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;


public class PedidoVentaBean extends MantenimientoBean {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 9072226274997543877L;
	
	private Long idPedido = null;     // PK
	private String codEmpresa = null; // UK
	private Short periodo = null;     // UK
	private String codSerie = null;   // UK
	private String desSerie = null;
	private Long numPedido = null;    // UK
	private Date fecha = null;
	private Date fechaSuministroPrevista = null;
	private String codAlmacen = null;
	private String desAlmacen = null;
	private String codCaja = null;
	private String uidDiarioCaja = null;
	private String codAplicacion = "VENT";
	private String codConceptoAlmacen = null;
	private String desConceptoAlmacen = null;
	private String codCliente = null;
	private String desCliente = null;
	private String codTarifa = null;
	private String desTarifa = null;
	private Long idTipoPorte = null;
	private String urlTracking = null;
	private String personaContacto = null;
	private String referenciaCliente = null;
	private Long idGrupoImpuestos = null;
	private Long idTratamientoImpuestos = null;
	private String desTratamientoImpuestos = null;
	private Double base = null;
	private Double impuestos = null;
	private Double total = null;
	private String observaciones = null;
	private Long idUsuario = null;
	private String tarjetaFidelizacion = null;
	private Integer estado = null;
	private Integer subEstado = null;
	private String desEstado = null;
	private Integer estadoReceptor = null;
	private Integer subEstadoReceptor = null;
	private String desEstadoReceptor = null;
	private Long idPresupuesto = null;
	
	// Artículos
	private List<ArticuloPedidoVentaBean> articulos = null;
	
	// Impuestos
	private ImpuestosBean detalleImpuestos = null;
	
	// Pagos
	private List<PagoPedidoVentaBean> pagos = null;
	
	@Override
	protected void initNuevoBean() {
		setArticulos(new ArrayList<ArticuloPedidoVentaBean>());
		setDetalleImpuestos(new ImpuestosBean());
		setPagos(new ArrayList<PagoPedidoVentaBean>());
	}
	
	/**
	 * @return the idAlbaran
	 */
	public Long getIdPedido() {
		return idPedido;
	}

	/**
	 * @param idAlbaran the idAlbaran to set
	 */
	public void setIdPedido(Long idPedido) {
		this.idPedido = idPedido;
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
	public Long getNumPedido() {
		return numPedido;
	}

	/**
	 * @param numAlbaran the numAlbaran to set
	 */
	public void setNumPedido(Long numPedido) {
		this.numPedido = numPedido;
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
	public Date getFechaSuministroPrevista() {
		return fechaSuministroPrevista;
	}

	/**
	 * @param fechaSuministro the fechaSuministro to set
	 */
	public void setFechaSuministroPrevista(Date fechaSuministro) {
		this.fechaSuministroPrevista = fechaSuministro;
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
	public String getUidDiarioCaja() {
		return uidDiarioCaja;
	}

	/**
	 * @param idDiarioCaja the idDiarioCaja to set
	 */
	public void setUidDiarioCaja(String uidDiarioCaja) {
		this.uidDiarioCaja = uidDiarioCaja;
	}
	
	public String getCodAplicacion() {
		return codAplicacion;
	}

	public void setCodAplicacion(String codAplicacion) {
		this.codAplicacion = codAplicacion;
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

	public Long getIdTipoPorte() {
		return idTipoPorte;
	}

	public void setIdTipoPorte(Long idTipoPorte) {
		this.idTipoPorte = idTipoPorte;
	}

	public String getUrlTracking() {
		return urlTracking;
	}

	public void setUrlTracking(String urlTracking) {
		this.urlTracking = urlTracking;
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
	 * @return the referenciaProveedor
	 */
	public String getReferenciaCliente() {
		return referenciaCliente;
	}

	/**
	 * @param referenciaCliente the referenciaProveedor to set
	 */
	public void setReferenciaCliente(String referenciaCliente) {
		this.referenciaCliente = referenciaCliente;
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
	
	
	public String getTarjetaFidelizacion() {
		return tarjetaFidelizacion;
	}

	public void setTarjetaFidelizacion(String tarjetaFidelizacion) {
		this.tarjetaFidelizacion = tarjetaFidelizacion;
	}
	
	
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	
	
	public Integer getSubEstado() {
		return subEstado;
	}
	public void setSubEstado(Integer subEstado) {
		this.subEstado = subEstado;
	}
	
	
	public String getDesEstado() {
		return desEstado;
	}
	public void setDesEstado(String desEstado) {
		this.desEstado = desEstado;
	}
	
	
	public Integer getEstadoReceptor() {
		return estadoReceptor;
	}
	public void setEstadoReceptor(Integer estadoReceptor) {
		this.estadoReceptor = estadoReceptor;
	}
	
	
	public Integer getSubEstadoReceptor() {
		return subEstadoReceptor;
	}
	public void setSubEstadoReceptor(Integer subEstadoReceptor) {
		this.subEstadoReceptor = subEstadoReceptor;
	}
	
	
	public String getDesEstadoReceptor() {
		return desEstadoReceptor;
	}
	public void setDesEstadoReceptor(String desEstadoReceptor) {
		this.desEstadoReceptor = desEstadoReceptor;
	}
	
	
	public Long getIdPresupuesto() {
		return idPresupuesto;
	}
	public void setIdPresupuesto(Long idPresupuesto) {
		this.idPresupuesto = idPresupuesto;
	}
	
	
	// ********* Artículos ******** //
	public List<ArticuloPedidoVentaBean> getArticulos() {
		return articulos;
	}
	public void setArticulos(List<ArticuloPedidoVentaBean> articulos) {
		this.articulos = articulos;
	}
	public ArticuloPedidoVentaBean getArticulo(Integer indice) {
		return articulos.get(indice);
	}
	public void addArticulo(ArticuloPedidoVentaBean articulo) {
		articulos.add(articulo);
	}
	public boolean isTieneArticulos() {
		if(articulos != null && articulos.size() > 0){
			for (int i = 0; i < articulos.size(); i++) {
				if(articulos.get(i).getEstadoBean() != Estado.BORRADO){
					return true;
				}
			}
		}

		return false;
	}
	
	
	// ********* Impuestos ******** //
	public ImpuestosBean getDetalleImpuestos() {
		return detalleImpuestos;
	}
	public void setDetalleImpuestos(ImpuestosBean detalleImpuestos) {
		this.detalleImpuestos = detalleImpuestos;
	}
	
	
	// ********* Pagos ******** //
	public List<PagoPedidoVentaBean> getPagos() {
		return pagos;
	}
	public void setPagos(List<PagoPedidoVentaBean> pagos) {
		this.pagos = pagos;
	}
	public PagoPedidoVentaBean getPago(Integer indice) {
		return pagos.get(indice);
	}
	public void addPago(PagoPedidoVentaBean pago) {
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
}
