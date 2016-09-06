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

package com.comerzzia.servicios.compras.albaranes;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean;
import com.comerzzia.persistencia.compras.albaranes.articulos.ArticuloAlbaranCompraBean;
import com.comerzzia.persistencia.compras.albaranes.pagos.PagoAlbaranCompraBean;
import com.comerzzia.persistencia.compras.pedidos.articulos.ArticuloPedidoCompraBean;
import com.comerzzia.persistencia.compras.pedidos.pagos.PagoPedidoCompraBean;
import com.comerzzia.persistencia.core.impuestos.ILineaDocumento;
import com.comerzzia.persistencia.core.impuestos.ImpuestoException;
import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.grupos.GrupoImpuestosBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.persistencia.general.conceptoalmacenes.ConceptoAlmacenBean;
import com.comerzzia.persistencia.general.proveedores.ProveedorBean;
import com.comerzzia.servicios.compras.albaranes.pagos.PagoAlbaranCompraConstraintViolationException;
import com.comerzzia.servicios.compras.pedidos.PedidoCompra;
import com.comerzzia.servicios.core.impuestos.ServicioImpuestos;
import com.comerzzia.servicios.core.impuestos.grupos.ServicioGruposImpuestos;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajesImpuestosBean;
import com.comerzzia.servicios.core.impuestos.porcentajes.ServicioPorcentajesImpuestos;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.servicios.general.conceptoalmacenes.ServicioConceptoAlmacenes;
import com.comerzzia.servicios.general.proveedores.ServicioProveedores;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.numeros.Numero;


public class AlbaranCompra extends MantenimientoBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 6189829224830530685L;

	private AlbaranCompraBean albaran;
	private ConceptoAlmacenBean conceptoAlmacen = null;
	private PorcentajesImpuestosBean porcentajesImpuestos = null;
	private ProveedorBean proveedor = null;
	private Double totalPagos = 0.0;
	private Double restantePagos = 0.0;
	
	public AlbaranCompra() {
		AlbaranCompraBean albaran = new AlbaranCompraBean();
		this.albaran = albaran;
	}
	public AlbaranCompra(AlbaranCompraBean albaran) {
		this.albaran = albaran;
		
		try {
			setPorcentajesImpuestos();
		}
		catch (Exception ignore) {
		}
	}
	/**
	 * Constructor que contiene la lógica para convertir un pedido de compra en un albarán de compra.
	 * 
	 * @param datosSesion
	 * @param pedido
	 * @param fechaSuministro
	 * @throws AlbaranCompraException
	 * @throws PagoAlbaranCompraConstraintViolationException
	 */
	public AlbaranCompra(DatosSesionBean datosSesion, PedidoCompra pedido, Date fechaSuministro) throws AlbaranCompraException, PagoAlbaranCompraConstraintViolationException {
		try {
			albaran = new AlbaranCompraBean();
			albaran.setEstadoBean(Estado.NUEVO);
			albaran.setCodEmpresa(pedido.getCodEmpresa());
			albaran.setPeriodo(new Integer(Fechas.año()).shortValue());
			albaran.setCodSerie(pedido.getCodSerie());
			albaran.setFecha(new Date());
			albaran.setFechaSuministro(fechaSuministro);
			albaran.setCodAlmacen(pedido.getCodAlmacen());
			albaran.setCodConceptoAlmacen(pedido.getCodConceptoAlmacen());
			albaran.setCodProveedor(pedido.getCodProveedor());
			albaran.setPersonaContacto(pedido.getPersonaContacto());
			albaran.setReferenciaProveedor(pedido.getReferenciaProveedor());
			albaran.setObservaciones(pedido.getObservaciones());
			albaran.setIdGrupoImpuestos(pedido.getIdGrupoImpuestos());
			albaran.setIdTratamientoImpuestos(pedido.getIdTratamientoImpuestos());
			
			// Establecer objetos del pedido
			setConceptoAlmacen(pedido.getConceptoAlmacen());
			setProveedor(pedido.getProveedor());
			
			// Establecer los artículos del albarán a partir de los del pedido
			for(ArticuloPedidoCompraBean articuloPedido : pedido.getArticulos()) {
				// Incluir únicamente las líneas que estén recepcionadas y que tenga cantidad recepcionada especificada
				if(pedido.isEstaLineaRecepcionada(articuloPedido)  
						&& articuloPedido.getCantidadRecepcionada() != 0) {
					ArticuloAlbaranCompraBean articuloAlbaran = new ArticuloAlbaranCompraBean();
					articuloAlbaran.setEstadoBean(Estado.NUEVO);
					articuloAlbaran.setFecha(new Date());
					articuloAlbaran.setCodArticulo(articuloPedido.getCodArticulo());
					articuloAlbaran.setDesArticulo(articuloPedido.getDesArticulo());
					articuloAlbaran.setDescripcionAmpliada(articuloPedido.getDescripcionAmpliada());
					articuloAlbaran.setDesglose1(articuloPedido.getDesglose1());
					articuloAlbaran.setDesglose2(articuloPedido.getDesglose2());
					articuloAlbaran.setUnidadMedida(articuloPedido.getUnidadMedida());
					articuloAlbaran.setCantidadMedida(articuloPedido.getCantidadMedida());
					articuloAlbaran.setCantidad(articuloPedido.getCantidad());
					articuloAlbaran.setPrecio(articuloPedido.getPrecio());
					articuloAlbaran.setDescuento(articuloPedido.getDescuento());
					articuloAlbaran.setImporte(articuloPedido.getImporte());
					articuloAlbaran.setCodImpuesto(articuloPedido.getCodImpuesto());
					articuloAlbaran.setIdPedido(articuloPedido.getIdPedido());
					articuloAlbaran.setPedidoLinea(articuloPedido.getLinea());
					
					albaran.addArticulo(articuloAlbaran);
				}
			}
			
			// Establecer los pagos del albarán a partir de los del pedido
			for (PagoPedidoCompraBean pagoPedido : pedido.getPagos()) {
				PagoAlbaranCompraBean pagoAlbaran = new PagoAlbaranCompraBean();
				pagoAlbaran.setEstadoBean(Estado.NUEVO);
				pagoAlbaran.setIdMedioPagoVencimiento(pagoPedido.getIdMedioPagoVencimiento());
				pagoAlbaran.setImporte(pagoPedido.getImporte());
				albaran.addPago(pagoAlbaran);
			}
			
			// Calcular totales para establecer campos con cantidades que tienen las líneas del albarán pero no el pedido
			calcularTotales();
		}
		catch (AlbaranCompraException e) {
			throw e;
		}
	}
	
	
	protected AlbaranCompraBean getBean() {
		return albaran;
	}
	
	
	protected void initNuevoBean() {
	}

	
	/**
	 * Establece la fecha del albarán y el grupo de impuestos en función de esta
	 * Si el albarán no es nuevo solo se podrá cambiar la fecha si esta no supone
	 * un cambio de grupo de impuestos
	 * @param fecha
	 * @throws AlbaranCompraException
	 */
	public void setFechaAlbaran(Date fecha) throws AlbaranCompraException {
		// Si la fecha no es la misma que la que tiene el albarán
		if (albaran.getFecha() == null || !albaran.getFecha().equals(fecha)) {
			// Obtenemos el grupo de impuestos activos para la fecha
			GrupoImpuestosBean grupoImpuestos;
			try {
				grupoImpuestos = ServicioGruposImpuestos.consultar(fecha);
			} 
			catch (Exception e) {
				throw new AlbaranCompraException("Error al obtener el grupo de impuestos activos: " + e.getMessage(), e);
			}
			
			// Si el albarán es nuevo establecemos la fecha y el grupo de impuestos
			if (albaran.getEstadoBean() == Estado.NUEVO) {
				albaran.setFecha(fecha);
				albaran.setIdGrupoImpuestos(grupoImpuestos.getIdGrupoImpuestos());
				this.porcentajesImpuestos = null;
				
				// Recalculamos los totales del albarán por si ha cambiado el grupo de impuestos y tenemos artículos
				calcularTotales();
			}
			else { 
				// Si el albarán no es nuevo, solo permitimos cambiar la fecha 
				// si no se ha producido un cambio de grupo de impuestos activo
				if (albaran.getIdGrupoImpuestos() == grupoImpuestos.getIdGrupoImpuestos()) {
					albaran.setFecha(fecha);
				}
				else {
					throw new AlbaranCompraException("No se puede cambiar la fecha del albarán " 
							+ albaran.getIdAlbaran() + " ya que para la fecha " + fecha 
							+ " se ha producido un cambio de vigencia del grupo de impuestos activo");
				}
			}
		}
	}
	
	
	public ProveedorBean getProveedor() {
		return proveedor;
	}
	public void setProveedor(ProveedorBean proveedor) {
		this.proveedor = proveedor;
	}
	/**
	 * Establece el proveedor del albarán y el tratamiento de impuestos según el del proveedor
	 * No se podrá cambiar el proveedor de un albarán si este tiene artículos
	 * @param codProveedor
	 * @param datosSesion
	 * @throws AlbaranCompraException
	 */
	public void setProveedor(String codProveedor, DatosSesionBean datosSesion) 
			throws AlbaranCompraException {
		// Si hay un cambio de proveedor o el proveedor está vacío
		if (proveedor == null || albaran.getCodProveedor() == null || !albaran.getCodProveedor().equals(codProveedor)) {

			// Obtenemos los datos del proveedor y su tratamiento de impuestos
			try {
				proveedor = ServicioProveedores.consultar(codProveedor, datosSesion);
				albaran.setCodProveedor(proveedor.getCodPro());
				albaran.setDesProveedor(proveedor.getDesPro());
				albaran.setIdTratamientoImpuestos(proveedor.getIdTratImp());
				this.porcentajesImpuestos = null;
				
				// Recalculamos los totales del albarán por si ha cambiado el grupo de impuestos y tenemos artículos
				calcularTotales();
			} 
			catch (Exception e) {
				throw new AlbaranCompraException(e.getMessage(), e);
			}
		}
	}
	
	
	/**
	 * Calcula los totales y los detalles de impuestos del albarán
	 * @throws AlbaranCompraException
	 */
	public void calcularTotales() throws AlbaranCompraException {
		if (albaran.getIdGrupoImpuestos() != null && albaran.getIdTratamientoImpuestos() != null) {
			// Calculamos los impuestos y se los establacemos al albarán
			ImpuestosBean detalleImpuestos = calcularImpuestos();
			albaran.setDetalleImpuestos(detalleImpuestos);
			
			// Actualizamos los totales del albarán
			albaran.setBase(detalleImpuestos.getBase());
			albaran.setImpuestos(detalleImpuestos.getImpuestos());
			albaran.setTotal(detalleImpuestos.getTotal());
		}
	}
	
	
	private ImpuestosBean calcularImpuestos() throws AlbaranCompraException {
		try {
			// Obtenemos la lista de artículos no barrados del albarán
			List<ILineaDocumento> articulos = new ArrayList<ILineaDocumento>();
			for (ArticuloAlbaranCompraBean articulo : albaran.getArticulos()) {
				if (articulo.getEstadoBean() != Estado.BORRADO) {
					articulos.add(articulo);
				}
			}
			
			// Si no tenemos los porcentajes de impuestos los obtenemos para el grupo y tratamiento del albarán
			if (this.porcentajesImpuestos == null) {
				this.porcentajesImpuestos = ServicioPorcentajesImpuestos.consultar(
						albaran.getIdGrupoImpuestos(), albaran.getIdTratamientoImpuestos());
			}
			
			return ServicioImpuestos.calcularImpuestos(porcentajesImpuestos, articulos);
		}
		catch (ImpuestoException e) {
			throw new AlbaranCompraException("Error calculando totales del albarán de compras" + e.getMessage(), e);
		} 
		catch (PorcentajeImpuestoException e) {
			throw new AlbaranCompraException("Error calculando totales del albarán de compras" + e.getMessage(), e);
		}
	}
	
	
	// TODO: utilizar este método siempre para obtener los porcentajes de impuestos
	//       repasar su utilización en el constructor
	private void setPorcentajesImpuestos() throws AlbaranCompraException {
		try {
			if (albaran.getIdGrupoImpuestos() != null && albaran.getIdTratamientoImpuestos() != null) {
				this.porcentajesImpuestos = ServicioPorcentajesImpuestos.consultar(
						albaran.getIdGrupoImpuestos(), albaran.getIdTratamientoImpuestos());
			}
		}
		catch (PorcentajeImpuestoException e) {
			throw new AlbaranCompraException("Error obteniendo porcentajes de impuestos para el albarán de compras" + e.getMessage(), e);
		}
	}
	
	
	public void calcularTotalesPagos() {
		// Inicializar las cantidades
		totalPagos = 0.0;
		restantePagos = 0.0;
		
		for (PagoAlbaranCompraBean pago : albaran.getPagos()) {
			if (pago.getEstadoBean() != Estado.BORRADO) {
				totalPagos = Numero.redondea(totalPagos + pago.getImporte(), 2);
			}
		}
		
		// Calcular restante únicamente si el albarán tiene importe total
		if(albaran.getTotal() != null) {
			if (Math.abs(albaran.getTotal()) > Math.abs(totalPagos)) {
				restantePagos = Numero.redondea(Math.abs(albaran.getTotal()) - Math.abs(totalPagos), 2);
				
				if(albaran.getTotal() < 0) {
					restantePagos *= -1;
				}
			}
			else {
				restantePagos = 0.0;
			}
		}
	}
	
	
	/**
	 * Comprueba que los totales del albarán coinciden con los del cálculo del detalle de impuestos
	 * @return
	 */
	public boolean checkTotales() throws AlbaranCompraException {
		// Obtenemos el cáclulo del detalle de impuestos
		ImpuestosBean detalleImpuestos = calcularImpuestos();
		
		if (albaran.getBase() != detalleImpuestos.getBase()
				|| albaran.getImpuestos() != detalleImpuestos.getImpuestos()
				|| albaran.getTotal() != detalleImpuestos.getTotal()) {
			return false;
		}
		
		return true;
	}
	
	
	/**
	 * Comprueba los totales de los pagos no superen el total del albarán, en cuyo caso
	 * lanza un excepción con el mensaje que informa de tal situación.
	 * 
	 * @return
	 * @throws PagoAlbaranCompraConstraintViolationException 
	 */
	public void checkTotalesPagos() throws PagoAlbaranCompraConstraintViolationException {
		// Calcular los pagos
		calcularTotalesPagos();
		
		if (Math.abs(totalPagos) > Math.abs(albaran.getTotal())) {
			throw new PagoAlbaranCompraConstraintViolationException("El importe total de los pagos es superior al importe del albarán");
		}
	}
	
	
	public PorcentajesImpuestosBean getPorcentajesImpuestos() {
		return porcentajesImpuestos;
	}
	
	
	public List<PagoAlbaranCompraBean> getPagos() {
		return albaran.getPagos();
	}
	public void setPagos(List<PagoAlbaranCompraBean> pagos) {
		albaran.setPagos(pagos);
	}
	public boolean isTienePagos() {
		return albaran.isTienePagos();
	}
	public Double getTotalPagos() {
		return totalPagos;
	}
	public Double getRestantePagos() {
		return restantePagos;
	}
	
	
	public void checkAlbaranPuedeModificarse() throws AlbaranCompraConstraintViolationException {
		if (albaran.isFacturado()) {
			throw new AlbaranCompraConstraintViolationException("El albarán está facturado");
		}
	}
		
	public void checkAlbaranPuedeBorrarse() throws AlbaranCompraConstraintViolationException {
		if (albaran.isFacturado()) {
			throw new AlbaranCompraConstraintViolationException("El albarán está facturado");
		}
	}
	
	
	public boolean isPuedeModificarse() {
		try {
			checkAlbaranPuedeModificarse();
			return true;
		} 
		catch (AlbaranCompraConstraintViolationException e) {
			return false;
		}
	}
	
	
	public boolean isPuedeBorrarse() {
		try {
			checkAlbaranPuedeBorrarse();
			return true;
		} 
		catch (AlbaranCompraConstraintViolationException e) {
			return false;
		}
	}


	/**
	 * @return
	 * @see com.comerzzia.util.base.MantenimientoBean#getActivo()
	 */
	public String getActivo() {
		return albaran.getActivo();
	}
	

	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getArticulos()
	 */
	public List<ArticuloAlbaranCompraBean> getArticulos() {
		return albaran.getArticulos();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getBase()
	 */
	public Double getBase() {
		return albaran.getBase();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getCodAlmacen()
	 */
	public String getCodAlmacen() {
		return albaran.getCodAlmacen();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getCodCaja()
	 */
	public String getCodCaja() {
		return albaran.getCodCaja();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getCodEmpresa()
	 */
	public String getCodEmpresa() {
		return albaran.getCodEmpresa();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getCodProveedor()
	 */
	public String getCodProveedor() {
		return albaran.getCodProveedor();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getCodSerie()
	 */
	public String getCodSerie() {
		return albaran.getCodSerie();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getDesAlmacen()
	 */
	public String getDesAlmacen() {
		return albaran.getDesAlmacen();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getDesProveedor()
	 */
	public String getDesProveedor() {
		return albaran.getDesProveedor();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getDesSerie()
	 */
	public String getDesSerie() {
		return albaran.getDesSerie();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getDetalleImpuestos()
	 */
	public ImpuestosBean getDetalleImpuestos() {
		return albaran.getDetalleImpuestos();
	}


	/**
	 * @return
	 * @see com.comerzzia.util.base.MantenimientoBean#getEstadoBean()
	 */
	public int getEstadoBean() {
		return albaran.getEstadoBean();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getFecha()
	 */
	public Date getFecha() {
		return albaran.getFecha();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getFechaSuministro()
	 */
	public Date getFechaSuministro() {
		return albaran.getFechaSuministro();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getIdAlbaran()
	 */
	public Long getIdAlbaran() {
		return albaran.getIdAlbaran();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getIdDiarioCaja()
	 */
	public Long getIdDiarioCaja() {
		return albaran.getIdDiarioCaja();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getIdFacturaSoportada()
	 */
	public Long getIdFacturaSoportada() {
		return albaran.getIdFacturaSoportada();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getIdGrupoImpuestos()
	 */
	public Long getIdGrupoImpuestos() {
		return albaran.getIdGrupoImpuestos();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getIdTratamientoImpuestos()
	 */
	public Long getIdTratamientoImpuestos() {
		return albaran.getIdTratamientoImpuestos();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getIdUsuario()
	 */
	public Long getIdUsuario() {
		return albaran.getIdUsuario();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getImpuestos()
	 */
	public Double getImpuestos() {
		return albaran.getImpuestos();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getNumAlbaran()
	 */
	public Long getNumAlbaran() {
		return albaran.getNumAlbaran();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getObservaciones()
	 */
	public String getObservaciones() {
		return albaran.getObservaciones();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getPeriodo()
	 */
	public Short getPeriodo() {
		return albaran.getPeriodo();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getPersonaContacto()
	 */
	public String getPersonaContacto() {
		return albaran.getPersonaContacto();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getReferenciaProveedor()
	 */
	public String getReferenciaProveedor() {
		return albaran.getReferenciaProveedor();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getTotal()
	 */
	public Double getTotal() {
		return albaran.getTotal();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getCodMedioPago()
	 */
	public String getCodMedioPago() {
		return albaran.getCodMedioPago();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#getDesMedioPago()
	 */
	public String getDesMedioPago() {
		return albaran.getDesMedioPago();
	}

	public String getCodMedioPagoVen() {
		return albaran.getCodMedioPagoVen();
	}

	public String getDesMedioPagoVen() {
		return albaran.getDesMedioPagoVen();
	}

	public String getCodConceptoAlmacen() {
		return albaran.getCodConceptoAlmacen();
	}

	public String getDesConceptoAlmacen() {
		return albaran.getDesConceptoAlmacen();
	}

	/**
	 * @return
	 * @see com.comerzzia.util.base.MantenimientoBean#isActivo()
	 */
	public boolean isActivo() {
		return albaran.isActivo();
	}


	/**
	 * @return
	 * @see com.comerzzia.util.base.MantenimientoBean#isEnEdicion()
	 */
	public boolean isEnEdicion() {
		return albaran.isEnEdicion();
	}


	/**
	 * @return
	 * @see com.comerzzia.util.base.MantenimientoBean#isEstadoBorrado()
	 */
	public boolean isEstadoBorrado() {
		return albaran.isEstadoBorrado();
	}


	/**
	 * @return
	 * @see com.comerzzia.util.base.MantenimientoBean#isEstadoNuevo()
	 */
	public boolean isEstadoNuevo() {
		return albaran.isEstadoNuevo();
	}


	/**
	 * @param activo
	 * @see com.comerzzia.util.base.MantenimientoBean#setActivo(boolean)
	 */
	public void setActivo(boolean activo) {
		albaran.setActivo(activo);
	}


	/**
	 * @param activo
	 * @see com.comerzzia.util.base.MantenimientoBean#setActivo(java.lang.String)
	 */
	public void setActivo(String activo) {
		albaran.setActivo(activo);
	}


	/**
	 * @param articulos
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setArticulos(java.util.List)
	 */
	public void setArticulos(List<ArticuloAlbaranCompraBean> articulos) {
		albaran.setArticulos(articulos);
	}


	/**
	 * @param codAlmacen
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setCodAlmacen(java.lang.String)
	 */
	public void setCodAlmacen(String codAlmacen) {
		albaran.setCodAlmacen(codAlmacen);
	}


	/**
	 * @param codCaja
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setCodCaja(java.lang.String)
	 */
	public void setCodCaja(String codCaja) {
		albaran.setCodCaja(codCaja);
	}


	/**
	 * @param codEmpresa
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setCodEmpresa(java.lang.String)
	 */
	public void setCodEmpresa(String codEmpresa) {
		albaran.setCodEmpresa(codEmpresa);
	}


	/**
	 * @param codSerie
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setCodSerie(java.lang.String)
	 */
	public void setCodSerie(String codSerie) {
		albaran.setCodSerie(codSerie);
	}


	/**
	 * @param desAlmacen
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setDesAlmacen(java.lang.String)
	 */
	public void setDesAlmacen(String desAlmacen) {
		albaran.setDesAlmacen(desAlmacen);
	}


	/**
	 * @param desProveedor
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setDesProveedor(java.lang.String)
	 */
	public void setDesProveedor(String desProveedor) {
		albaran.setDesProveedor(desProveedor);
	}


	/**
	 * @param desSerie
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setDesSerie(java.lang.String)
	 */
	public void setDesSerie(String desSerie) {
		albaran.setDesSerie(desSerie);
	}


	/**
	 * @param enEdicion
	 * @see com.comerzzia.util.base.MantenimientoBean#setEnEdicion(boolean)
	 */
	public void setEnEdicion(boolean enEdicion) {
		albaran.setEnEdicion(enEdicion);
	}


	/**
	 * @param estadoBean
	 * @see com.comerzzia.util.base.MantenimientoBean#setEstadoBean(int)
	 */
	public void setEstadoBean(int estadoBean) {
		albaran.setEstadoBean(estadoBean);
	}


	/**
	 * @param fechaSuministro
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setFechaSuministro(java.util.Date)
	 */
	public void setFechaSuministro(Date fechaSuministro) {
		albaran.setFechaSuministro(fechaSuministro);
	}


	/**
	 * @param idUsuario
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setIdUsuario(java.lang.Long)
	 */
	public void setIdUsuario(Long idUsuario) {
		albaran.setIdUsuario(idUsuario);
	}


	/**
	 * @param observaciones
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setObservaciones(java.lang.String)
	 */
	public void setObservaciones(String observaciones) {
		albaran.setObservaciones(observaciones);
	}


	/**
	 * @param personaContacto
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setPersonaContacto(java.lang.String)
	 */
	public void setPersonaContacto(String personaContacto) {
		albaran.setPersonaContacto(personaContacto);
	}


	/**
	 * @param referenciaProveedor
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setReferenciaProveedor(java.lang.String)
	 */
	public void setReferenciaProveedor(String referenciaProveedor) {
		albaran.setReferenciaProveedor(referenciaProveedor);
	}


	/**
	 * @param articulo
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#addArticulo(com.comerzzia.persistencia.compras.albaranes.articulos.ArticuloAlbaranCompraBean)
	 */
	public void addArticulo(ArticuloAlbaranCompraBean articulo) {
		albaran.addArticulo(articulo);
	}


	/**
	 * @param idAlbaran
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setIdAlbaran(java.lang.Long)
	 */
	public void setIdAlbaran(Long idAlbaran) {
		albaran.setIdAlbaran(idAlbaran);
	}


	/**
	 * @param detalleImpuestos
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setDetalleImpuestos(com.comerzzia.persistencia.core.impuestos.ImpuestosBean)
	 */
	public void setDetalleImpuestos(ImpuestosBean detalleImpuestos) {
		albaran.setDetalleImpuestos(detalleImpuestos);
	}


	/**
	 * @param numAlbaran
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setNumAlbaran(java.lang.Long)
	 */
	public void setNumAlbaran(Long numAlbaran) {
		albaran.setNumAlbaran(numAlbaran);
	}


	/**
	 * @param periodo
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setPeriodo(java.lang.Short)
	 */
	public void setPeriodo(Short periodo) {
		albaran.setPeriodo(periodo);
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#isFacturado()
	 */
	public boolean isFacturado() {
		return albaran.isFacturado();
	}
	
	/**
	 * @return
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#isTieneArticulos()
	 */
	public boolean isTieneArticulos() {
		return albaran.isTieneArticulos();
	}

	/**
	 * @param codMedioPago
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setCodMedioPago(java.lang.String)
	 */
	public void setCodMedioPago(String codMedioPago) {
		albaran.setCodMedioPago(codMedioPago);
	}

	/**
	 * @param codMedioPago
	 * @see com.comerzzia.persistencia.compras.albaranes.AlbaranCompraBean#setDesMedioPago(java.lang.String)
	 */
	public void setDesMedioPago(String desMedioPago) {
		albaran.setDesMedioPago(desMedioPago);
	}

	public void setCodMedioPagoVen(String codMedioPagoVen) {
		albaran.setCodMedioPagoVen(codMedioPagoVen);
	}

	public void setDesMedioPagoVen(String desMedioPagoVen) {
		albaran.setDesMedioPagoVen(desMedioPagoVen);
	}

	public void setCodConceptoAlmacen(String codConceptoAlmacen) {
		albaran.setCodConceptoAlmacen(codConceptoAlmacen);
	}

	public void setDesConceptoAlmacen(String desConceptoAlmacen) {
		albaran.setDesConceptoAlmacen(desConceptoAlmacen);
	}

	public ConceptoAlmacenBean getConceptoAlmacen(DatosSesionBean datosSesion) throws AlbaranCompraException{ 
		if(conceptoAlmacen == null){
			try{
				return ServicioConceptoAlmacenes.consultar(albaran.getCodAplicacion(), albaran.getCodConceptoAlmacen(), datosSesion);
			}
			catch (Exception e) {
				throw new AlbaranCompraException(e.getMessage(), e);
			}
		}
		else{
			return conceptoAlmacen;
		}
	}
	public void setConceptoAlmacen(ConceptoAlmacenBean conceptoAlmacen) {
		this.conceptoAlmacen = conceptoAlmacen;
	}
	public void setConceptoAlmacen(String codConceptoAlmacen, String codAlmacen, DatosSesionBean datosSesion) throws AlbaranCompraException {
		//Comprobamos si ha cambiado el concepto de almacén, si es así
		//verificamos si tiene almacén de destino y si corresponde con el que tenemos
		if ((albaran.getCodConceptoAlmacen() == null || !albaran.getCodConceptoAlmacen().equals(codConceptoAlmacen)) 
				|| (albaran.getCodAlmacen() == null || !albaran.getCodAlmacen().equals(codAlmacen))) {

			// Obtenemos los datos del concepto del almacen
			try {
				ConceptoAlmacenBean conceptoAlmacen = ServicioConceptoAlmacenes.consultar(albaran.getCodAplicacion(), codConceptoAlmacen, datosSesion);
				albaran.setCodConceptoAlmacen(conceptoAlmacen.getCodConAlm());
				albaran.setDesConceptoAlmacen(conceptoAlmacen.getDesConAlm());
				//Si el concepto de almacén tiene almacén de destino actualizamos los valores del almacén
				if(conceptoAlmacen.getCodAlm_destino() != null){
					AlmacenBean almacen = ServicioAlmacenes.consultar(conceptoAlmacen.getCodAlm_destino(), datosSesion);
					albaran.setCodAlmacen(almacen.getCodAlm());
					albaran.setDesAlmacen(almacen.getDesAlm());
				}
				else{
					AlmacenBean almacen = ServicioAlmacenes.consultar(codAlmacen, datosSesion);
					albaran.setCodAlmacen(almacen.getCodAlm());
					albaran.setDesAlmacen(almacen.getDesAlm());
				}
				this.conceptoAlmacen = null;
				
			} 
			catch (Exception e) {
				throw new AlbaranCompraException(e.getMessage(), e);
			}
		}
	}

	public void setIdFacturaSoportada(Long idFacturaSoportada) {
		albaran.setIdFacturaSoportada(idFacturaSoportada);
	}

	public String getCodAplicacion() {
		return albaran.getCodAplicacion();
	}

	public String getCodSerieFactura() {
		return albaran.getCodSerieFactura();
	}

	public Date getFechaFactura() {
		return albaran.getFechaFactura();
	}

	public Long getNumFactura() {
		return albaran.getNumFactura();
	}

	public void setCodSerieFactura(String codSerieFactura) {
		albaran.setCodSerieFactura(codSerieFactura);
	}

	public void setFechaFactura(Date fechaFactura) {
		albaran.setFechaFactura(fechaFactura);
	}

	public void setNumFactura(Long numFactura) {
		albaran.setNumFactura(numFactura);
	}

	public String getDesTratamientoImpuestos() {
		return albaran.getDesTratamientoImpuestos();
	}

	public void setDesTratamientoImpuestos(String desTratamientoImpuestos) {
		albaran.setDesTratamientoImpuestos(desTratamientoImpuestos);
	}
}
