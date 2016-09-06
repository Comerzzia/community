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

package com.comerzzia.servicios.ventas.albaranes;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.impuestos.ILineaDocumento;
import com.comerzzia.persistencia.core.impuestos.ImpuestoException;
import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.grupos.GrupoImpuestosBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.conceptoalmacenes.ConceptoAlmacenBean;
import com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean;
import com.comerzzia.persistencia.ventas.albaranes.articulos.ArticuloAlbaranVentaBean;
import com.comerzzia.persistencia.ventas.albaranes.pagos.PagoAlbaranVentaBean;
import com.comerzzia.persistencia.ventas.pedidos.articulos.ArticuloPedidoVentaBean;
import com.comerzzia.persistencia.ventas.pedidos.pagos.PagoPedidoVentaBean;
import com.comerzzia.servicios.core.impuestos.ServicioImpuestos;
import com.comerzzia.servicios.core.impuestos.grupos.ServicioGruposImpuestos;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajesImpuestosBean;
import com.comerzzia.servicios.core.impuestos.porcentajes.ServicioPorcentajesImpuestos;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.servicios.general.conceptoalmacenes.ServicioConceptoAlmacenes;
import com.comerzzia.servicios.ventas.albaranes.pagos.PagoAlbaranVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.pedidos.PedidoVenta;
import com.comerzzia.servicios.ventas.tarifas.TarifaException;
import com.comerzzia.servicios.ventas.tarifas.articulos.ArticuloTarifaNotFoundException;
import com.comerzzia.servicios.ventas.tarifas.articulos.ServicioArticulosTarifas;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.numeros.Numero;


public class AlbaranVenta extends MantenimientoBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 6189829224830530685L;

	private AlbaranVentaBean albaran;
	private ConceptoAlmacenBean conceptoAlmacen = null;
	private PorcentajesImpuestosBean porcentajesImpuestos = null;
	private ClienteBean cliente = null;
	private Double totalPagos = 0.0;
	private Double restantePagos = 0.0;
	
	public AlbaranVenta() {
		AlbaranVentaBean albaran = new AlbaranVentaBean();
		this.albaran = albaran;
	}
	
	public AlbaranVenta(AlbaranVentaBean albaran) {
		this.albaran = albaran;
		
		try {
			setPorcentajesImpuestos();
		}
		catch (Exception ignore) {
		}
	}
	
	/**
	 * Constructor que contiene la lógica para convertir un pedido de venta en un albarán de venta.
	 * 
	 * @param datosSesion
	 * @param pedido
	 * @param fechaSuministro
	 * @throws AlbaranVentaException
	 * @throws PagoAlbaranVentaConstraintViolationException
	 */
	public AlbaranVenta(DatosSesionBean datosSesion, PedidoVenta pedido, Date fechaSuministro) throws AlbaranVentaException, PagoAlbaranVentaConstraintViolationException {
		try {
			albaran = new AlbaranVentaBean();
			albaran.setEstadoBean(Estado.NUEVO);
			albaran.setCodEmpresa(pedido.getCodEmpresa());
			albaran.setPeriodo(new Integer(Fechas.año()).shortValue());
			albaran.setCodSerie(pedido.getCodSerie());
			albaran.setFecha(new Date());
			albaran.setFechaSuministro(fechaSuministro);
			albaran.setCodAlmacen(pedido.getCodAlmacen());
			albaran.setCodConceptoAlmacen(pedido.getCodConceptoAlmacen());
			albaran.setCodCliente(pedido.getCodCliente());
			albaran.setCodTarifa(pedido.getCodTarifa());
			albaran.setPersonaContacto(pedido.getPersonaContacto());
			albaran.setReferenciaCliente(pedido.getReferenciaCliente());
			albaran.setObservaciones(pedido.getObservaciones());
			albaran.setIdGrupoImpuestos(pedido.getIdGrupoImpuestos());
			albaran.setIdTratamientoImpuestos(pedido.getIdTratamientoImpuestos());
			
			// Establecer objetos del pedido
			setConceptoAlmacen(pedido.getConceptoAlmacen());
			setCliente(pedido.getCliente());
			
			// Establecer los artículos del albarán a partir de los del pedido
			for(ArticuloPedidoVentaBean articuloPedido : pedido.getArticulos()) {
				// Incluir únicamente las líneas que estén servidas y que tenga cantidad preparada especificada
				if(pedido.isEstaLineaServida(articuloPedido)  
						&& articuloPedido.getCantidadPreparada() != 0) {
					ArticuloAlbaranVentaBean articuloAlbaran = new ArticuloAlbaranVentaBean();
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
					articuloAlbaran.setPrecioCosto(ServicioArticulosTarifas.obtenerPreciosArticuloTarifa(articuloAlbaran.getCodArticulo(), albaran.getCodTarifa(), albaran.getCodCliente(), datosSesion).getPrecioCosto());
					articuloAlbaran.setIdPedido(articuloPedido.getIdPedido());
					articuloAlbaran.setPedidoLinea(articuloPedido.getLinea());
					
					albaran.addArticulo(articuloAlbaran);
				}
			}
			
			// Establecer los pagos del albarán a partir de los del pedido
			for (PagoPedidoVentaBean pagoPedido : pedido.getPagos()) {
				PagoAlbaranVentaBean pagoAlbaran = new PagoAlbaranVentaBean();
				pagoAlbaran.setEstadoBean(Estado.NUEVO);
				pagoAlbaran.setIdMedioPagoVencimiento(pagoPedido.getIdMedioPagoVencimiento());
				pagoAlbaran.setImporte(pagoPedido.getImporte());
				albaran.addPago(pagoAlbaran);
			}
			
			// Calcular totales para establecer campos con cantidades que tienen las líneas del albarán pero no el pedido
			calcularTotales();
		}
		catch (AlbaranVentaException e) {
			throw e;
		}
		catch (TarifaException e) {
			throw new AlbaranVentaException(e.getMessage(), e);
		}
		catch (ArticuloTarifaNotFoundException e) {
			throw new AlbaranVentaException(e.getMessage(), e);
		}
	}
	
	protected AlbaranVentaBean getBean() {
		return albaran;
	}
	
	protected void initNuevoBean() {
	}
	
	/**
	 * Establece la fecha del albarán y el grupo de impuestos en función de esta
	 * Si el albarán no es nuevo solo se podrá cambiar la fecha si esta no supone
	 * un cambio de grupo de impuestos
	 * @param fecha
	 * @throws AlbaranVentaException
	 */
	public void setFechaAlbaran(Date fecha) throws AlbaranVentaException {
		// Si la fecha no es la misma que la que tiene el albarán
		if (albaran.getFecha() == null || !albaran.getFecha().equals(fecha)) {
			// Obtenemos el grupo de impuestos activos para la fecha
			GrupoImpuestosBean grupoImpuestos;
			try {
				grupoImpuestos = ServicioGruposImpuestos.consultar(fecha);
			} 
			catch (Exception e) {
				throw new AlbaranVentaException("Error al obtener el grupo de impuestos activos: " + e.getMessage(), e);
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
					throw new AlbaranVentaException("No se puede cambiar la fecha del albarán " 
							+ albaran.getIdAlbaran() + " ya que para la fecha " + fecha 
							+ " se ha producido un cambio de vigencia del grupo de impuestos activo");
				}
			}
		}
	}
	
	
	public ConceptoAlmacenBean getConceptoAlmacen() {
		return conceptoAlmacen;
	}
	
	public void setConceptoAlmacen(ConceptoAlmacenBean conceptoAlmacen) {
		this.conceptoAlmacen = conceptoAlmacen;
	}
	
	public void setConceptoAlmacen(String codConceptoAlmacen, String codAlmacen, DatosSesionBean datosSesion) throws AlbaranVentaException {
		//Comprobamos si ha cambiado el concepto de almacén, si es así
		//verificamos si tiene almacén de destino y si corresponde con el que tenemos
		if (conceptoAlmacen == null || 
				(albaran.getCodConceptoAlmacen() == null || !albaran.getCodConceptoAlmacen().equals(codConceptoAlmacen)) 
				|| (albaran.getCodAlmacen() == null || !albaran.getCodAlmacen().equals(codAlmacen))) {

			// Obtenemos los datos del concepto del almacen
			try {
				conceptoAlmacen = ServicioConceptoAlmacenes.consultar(albaran.getCodAplicacion(), codConceptoAlmacen, datosSesion);
				albaran.setCodConceptoAlmacen(conceptoAlmacen.getCodConAlm());
				albaran.setDesConceptoAlmacen(conceptoAlmacen.getDesConAlm());
				
				//Si el concepto de almacén tiene almacén de destino actualizamos los valores del almacén
				if(conceptoAlmacen.getCodAlm_origen() != null){
					AlmacenBean almacen = ServicioAlmacenes.consultar(conceptoAlmacen.getCodAlm_origen(), datosSesion);
					albaran.setCodAlmacen(almacen.getCodAlm());
					albaran.setDesAlmacen(almacen.getDesAlm());
				}
				else{
					AlmacenBean almacen = ServicioAlmacenes.consultar(codAlmacen, datosSesion);
					albaran.setCodAlmacen(almacen.getCodAlm());
					albaran.setDesAlmacen(almacen.getDesAlm());
				}
			} 
			catch (Exception e) {
				throw new AlbaranVentaException(e.getMessage(), e);
			}
		}
	}
	
	
	public ClienteBean getCliente() {
		return cliente;
	}
	
	public void setCliente(ClienteBean cliente) {
		this.cliente = cliente;
	}
	
	// Este método se necesita para poder cambiar el cliente de un albarán
	// sin que se cambie el tratamiento de impuestos ya que se tiene que
	// mantener el que tenía pues se va a usar para la creación de un albarán
	// desde un ticket
	public void cambiarCliente(ClienteBean cliente) {
		this.cliente = cliente;
		albaran.setCodCliente(cliente.getCodCli());
		albaran.setDesCliente(cliente.getDesCli());
	}
	
	/**
	 * Establece el cliente del albarán y el tratamiento de impuestos según el del cliente
	 * No se podrá cambiar el cliente de un albarán si este tiene artículos
	 * @param codCliente
	 * @param datosSesion
	 * @throws AlbaranVentaException
	 */
	public void setCliente(String codCliente, DatosSesionBean datosSesion) throws AlbaranVentaException {
		// Si hay un cambio de cliente o el cliente está vacío
		if (cliente == null || albaran.getCodCliente() == null || !albaran.getCodCliente().equals(codCliente)) {

			// Obtenemos los datos del cliente y su tratamiento de impuestos
			try {
				cliente = ServicioClientes.consultar(codCliente, datosSesion);
				
				// El cliente sólo se establece cuando el pedido es nuevo y no tiene artículos
				if (albaran.getEstadoBean() == Estado.NUEVO
						&& albaran.getArticulos().size() == 0) {
					albaran.setCodCliente(cliente.getCodCli());
					albaran.setDesCliente(cliente.getDesCli());
					albaran.setIdTratamientoImpuestos(cliente.getIdTratImp());
					this.porcentajesImpuestos = null;
					
					calcularTotales();
				}
			} 
			catch (Exception e) {
				throw new AlbaranVentaException(e.getMessage(), e);
			}
		}
	}
	
	/**
	 * Calcula los totales y los detalles de impuestos del albarán
	 * @throws AlbaranVentaException
	 */
	public void calcularTotales() throws AlbaranVentaException {
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
	
	private ImpuestosBean calcularImpuestos() throws AlbaranVentaException {
		try {
			// Obtenemos la lista de artículos no barrados del albarán
			List<ILineaDocumento> articulos = new ArrayList<ILineaDocumento>();
			for (ArticuloAlbaranVentaBean articulo : albaran.getArticulos()) {
				if (articulo.getEstadoBean() != Estado.BORRADO) {
					//Mientras recorremos la lista de artículos para calcular los impuestos,
					//calculamos también el precio y el importe total de cada artículo
					calcularPrecioImporteTotal(articulo);

					articulos.add(articulo);
				}
			}
			
			// Si no tenemos los porcentajes de impuestos los obtenemos para el grupo y tratamiento del albarán
			if (this.porcentajesImpuestos == null) {
				this.porcentajesImpuestos = ServicioPorcentajesImpuestos.consultar(albaran.getIdGrupoImpuestos(), albaran.getIdTratamientoImpuestos());
			}
			
			return ServicioImpuestos.calcularImpuestos(porcentajesImpuestos, articulos);
		}
		catch (ImpuestoException e) {
			throw new AlbaranVentaException("Error calculando totales del albarán de ventas" + e.getMessage(), e);
		} 
		catch (PorcentajeImpuestoException e) {
			throw new AlbaranVentaException("Error calculando totales del albarán de ventas" + e.getMessage(), e);
		}
	}
	
	private void calcularPrecioImporteTotal(ArticuloAlbaranVentaBean articulo) throws AlbaranVentaException {
		try {
			// Si no tenemos los porcentajes de impuestos los obtenemos para el grupo y tratamiento del albarán
			if (this.porcentajesImpuestos == null) {
				this.porcentajesImpuestos = ServicioPorcentajesImpuestos.consultar(albaran.getIdGrupoImpuestos(), albaran.getIdTratamientoImpuestos());
			}

			//Obtenemos el impuesto
			ImpuestosBean detalleImpuestos = ServicioImpuestos.calcularImpuesto(porcentajesImpuestos, articulo);
			
			//Se los sumamos al precio y el importe total
			articulo.setPrecioTotal(articulo.getPrecio() + detalleImpuestos.getImpuestos());
			articulo.setImporteTotal(articulo.getImporte() + detalleImpuestos.getImpuestos());
			
		} 
		catch (PorcentajeImpuestoException e) {
			throw new AlbaranVentaException("Error calculando precios totales del albarán de ventas " + e.getMessage(), e);			
		} 
		catch (ImpuestoException e) {
			throw new AlbaranVentaException("Error calculando precios totales del albarán de ventas " + e.getMessage(), e);			
		}
	}

	// TODO: utilizar este método siempre para obtener los porcentajes de impuestos
	//       repasar su utilización en el constructor
	private void setPorcentajesImpuestos() throws AlbaranVentaException {
		try {
			if (albaran.getIdGrupoImpuestos() != null && albaran.getIdTratamientoImpuestos() != null) {
				this.porcentajesImpuestos = ServicioPorcentajesImpuestos.consultar(albaran.getIdGrupoImpuestos(), albaran.getIdTratamientoImpuestos());
			}
		}
		catch (PorcentajeImpuestoException e) {
			throw new AlbaranVentaException("Error obteniendo porcentajes de impuestos para el albarán de ventas " + e.getMessage(), e);
		}
	}
	
	public void calcularTotalesPagos() {
		// Inicializar las cantidades
		totalPagos = 0.0;
		restantePagos = 0.0;
		
		for (PagoAlbaranVentaBean pago : albaran.getPagos()) {
			if (pago.getEstadoBean() != Estado.BORRADO) {
				totalPagos = Numero.redondea(totalPagos + pago.getImporte(), 2);
			}
		}
		
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
	
	/**
	 * Comprueba que los totales del albarán coinciden con los del cálculo del detalle de impuestos
	 * @return
	 */
	public boolean checkTotales() throws AlbaranVentaException {
		// Obtenemos el cáclulo del detalle de impuestos
		ImpuestosBean detalleImpuestos = calcularImpuestos();
		
		// Si el albarán proviene de un ticket permitimos una tolerancia de 5 céntimos
		/// ya que los cálculos en el TPV se realizaron sobre precios con impuestos
		double tolerancia = 0.0;
		if (albaran.isTicket()) {
			tolerancia = 0.05;
		}
		
		if (Math.abs(albaran.getBase() - detalleImpuestos.getBase()) > tolerancia
				|| Math.abs(albaran.getImpuestos() - detalleImpuestos.getImpuestos()) > tolerancia
				|| Math.abs(albaran.getTotal() - detalleImpuestos.getTotal()) > tolerancia) {
			return false;
		}
		
		return true;
	}
	
	/**
	 * Comprueba los totales de los pagos no superen el total del albarán, en cuyo caso
	 * lanza un excepción con el mensaje que informa de tal situación.
	 * 
	 * @return
	 * @throws PagoAlbaranVentaConstraintViolationException 
	 */
	public void checkTotalesPagos() throws PagoAlbaranVentaConstraintViolationException {
		// Calcular los pagos
		calcularTotalesPagos();
		
		if (Math.abs(totalPagos) > Math.abs(albaran.getTotal())) {
			throw new PagoAlbaranVentaConstraintViolationException("El importe total de los pagos es superior al importe del albarán");
		}
	}
	
	public PorcentajesImpuestosBean getPorcentajesImpuestos() {
		return porcentajesImpuestos;
	}
	
	
	public List<PagoAlbaranVentaBean> getPagos() {
		return albaran.getPagos();
	}
	
	public void setPagos(List<PagoAlbaranVentaBean> pagos) {
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
	
	public void checkAlbaranPuedeModificarse() throws AlbaranVentaConstraintViolationException {
		if (albaran.isFacturado()) {
			throw new AlbaranVentaConstraintViolationException("El albarán está facturado");
		}
		if (albaran.isTicket()) {
			throw new AlbaranVentaConstraintViolationException("El albarán proviene de un ticket");
		}
	}
		

	public void checkAlbaranPuedeBorrarse() throws AlbaranVentaConstraintViolationException {
		if (albaran.isFacturado()) {
			throw new AlbaranVentaConstraintViolationException("El albarán está facturado");
		}
		if (albaran.isTicket()) {
			throw new AlbaranVentaConstraintViolationException("El albarán proviene de un ticket");
		}
	}
	
	public boolean isPuedeModificarse() {
		try {
			checkAlbaranPuedeModificarse();
			return true;
		} 
		catch (AlbaranVentaConstraintViolationException e) {
			return false;
		}
	}
	
	
	public boolean isPuedeBorrarse() {
		try {
			checkAlbaranPuedeBorrarse();
			return true;
		} 
		catch (AlbaranVentaConstraintViolationException e) {
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
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getArticulos()
	 */
	public List<ArticuloAlbaranVentaBean> getArticulos() {
		return albaran.getArticulos();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getBase()
	 */
	public Double getBase() {
		return albaran.getBase();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getCodAlmacen()
	 */
	public String getCodAlmacen() {
		return albaran.getCodAlmacen();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getCodCaja()
	 */
	public String getCodCaja() {
		return albaran.getCodCaja();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getCodEmpresa()
	 */
	public String getCodEmpresa() {
		return albaran.getCodEmpresa();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getCodCliente()
	 */
	public String getCodCliente() {
		return albaran.getCodCliente();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getCodSerie()
	 */
	public String getCodSerie() {
		return albaran.getCodSerie();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getDesAlmacen()
	 */
	public String getDesAlmacen() {
		return albaran.getDesAlmacen();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getDesCliente()
	 */
	public String getDesCliente() {
		return albaran.getDesCliente();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getDesSerie()
	 */
	public String getDesSerie() {
		return albaran.getDesSerie();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getDetalleImpuestos()
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
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getFecha()
	 */
	public Date getFecha() {
		return albaran.getFecha();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getFechaSuministro()
	 */
	public Date getFechaSuministro() {
		return albaran.getFechaSuministro();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getIdAlbaran()
	 */
	public Long getIdAlbaran() {
		return albaran.getIdAlbaran();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getUidDiarioCaja()
	 */
	public String getUidDiarioCaja() {
		return albaran.getUidDiarioCaja();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getIdFacturaSoportada()
	 */
	public Long getIdFacturaSoportada() {
		return albaran.getIdFacturaSoportada();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getIdGrupoImpuestos()
	 */
	public Long getIdGrupoImpuestos() {
		return albaran.getIdGrupoImpuestos();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getIdTratamientoImpuestos()
	 */
	public Long getIdTratamientoImpuestos() {
		return albaran.getIdTratamientoImpuestos();
	}
	public String getDesTratamientoImpuestos() {
		return albaran.getDesTratamientoImpuestos();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getIdUsuario()
	 */
	public Long getIdUsuario() {
		return albaran.getIdUsuario();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getImpuestos()
	 */
	public Double getImpuestos() {
		return albaran.getImpuestos();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getNumAlbaran()
	 */
	public Long getNumAlbaran() {
		return albaran.getNumAlbaran();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getObservaciones()
	 */
	public String getObservaciones() {
		return albaran.getObservaciones();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getPeriodo()
	 */
	public Short getPeriodo() {
		return albaran.getPeriodo();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getPersonaContacto()
	 */
	public String getPersonaContacto() {
		return albaran.getPersonaContacto();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getReferenciaCliente()
	 */
	public String getReferenciaCliente() {
		return albaran.getReferenciaCliente();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#getTotal()
	 */
	public Double getTotal() {
		return albaran.getTotal();
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
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setArticulos(java.util.List)
	 */
	public void setArticulos(List<ArticuloAlbaranVentaBean> articulos) {
		albaran.setArticulos(articulos);
	}


	/**
	 * @param codAlmacen
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setCodAlmacen(java.lang.String)
	 */
	public void setCodAlmacen(String codAlmacen) {
		albaran.setCodAlmacen(codAlmacen);
	}


	/**
	 * @param codCaja
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setCodCaja(java.lang.String)
	 */
	public void setCodCaja(String codCaja) {
		albaran.setCodCaja(codCaja);
	}


	/**
	 * @param codEmpresa
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setCodEmpresa(java.lang.String)
	 */
	public void setCodEmpresa(String codEmpresa) {
		albaran.setCodEmpresa(codEmpresa);
	}


	/**
	 * @param codSerie
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setCodSerie(java.lang.String)
	 */
	public void setCodSerie(String codSerie) {
		albaran.setCodSerie(codSerie);
	}


	/**
	 * @param desAlmacen
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setDesAlmacen(java.lang.String)
	 */
	public void setDesAlmacen(String desAlmacen) {
		albaran.setDesAlmacen(desAlmacen);
	}


	/**
	 * @param desCliente
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setDesCliente(java.lang.String)
	 */
	public void setDesCliente(String desCliente) {
		albaran.setDesCliente(desCliente);
	}


	/**
	 * @param desSerie
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setDesSerie(java.lang.String)
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
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setFechaSuministro(java.util.Date)
	 */
	public void setFechaSuministro(Date fechaSuministro) {
		albaran.setFechaSuministro(fechaSuministro);
	}


	/**
	 * @param idUsuario
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setIdUsuario(java.lang.Long)
	 */
	public void setIdUsuario(Long idUsuario) {
		albaran.setIdUsuario(idUsuario);
	}


	/**
	 * @param observaciones
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setObservaciones(java.lang.String)
	 */
	public void setObservaciones(String observaciones) {
		albaran.setObservaciones(observaciones);
	}


	/**
	 * @param personaContacto
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setPersonaContacto(java.lang.String)
	 */
	public void setPersonaContacto(String personaContacto) {
		albaran.setPersonaContacto(personaContacto);
	}


	/**
	 * @param setReferenciaCliente
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setReferenciaCliente(java.lang.String)
	 */
	public void setReferenciaCliente(String referenciaCliente) {
		albaran.setReferenciaCliente(referenciaCliente);
	}


	/**
	 * @param articulo
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#addArticulo(com.comerzzia.persistencia.ventas.albaranes.articulos.ArticuloAlbaranVentaBean)
	 */
	public void addArticulo(ArticuloAlbaranVentaBean articulo) {
		albaran.addArticulo(articulo);
	}


	/**
	 * @param idAlbaran
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setIdAlbaran(java.lang.Long)
	 */
	public void setIdAlbaran(Long idAlbaran) {
		albaran.setIdAlbaran(idAlbaran);
	}


	/**
	 * @param detalleImpuestos
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setDetalleImpuestos(com.comerzzia.persistencia.core.impuestos.ImpuestosBean)
	 */
	public void setDetalleImpuestos(ImpuestosBean detalleImpuestos) {
		albaran.setDetalleImpuestos(detalleImpuestos);
	}


	/**
	 * @param numAlbaran
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setNumAlbaran(java.lang.Long)
	 */
	public void setNumAlbaran(Long numAlbaran) {
		albaran.setNumAlbaran(numAlbaran);
	}


	/**
	 * @param periodo
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#setPeriodo(java.lang.Short)
	 */
	public void setPeriodo(Short periodo) {
		albaran.setPeriodo(periodo);
	}

	
	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#isFacturado()
	 */
	public boolean isFacturado() {
		return albaran.isFacturado();
	}
	
	
	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean#isTieneArticulos()
	 */
	public boolean isTieneArticulos() {
		return albaran.isTieneArticulos();
	}

	
	public void setCodConceptoAlmacen(String codConceptoAlmacen) {
		albaran.setCodConceptoAlmacen(codConceptoAlmacen);
	}

	
	public void setDesConceptoAlmacen(String desConceptoAlmacen) {
		albaran.setDesConceptoAlmacen(desConceptoAlmacen);
	}

	
	public String getCodAplicacion() {
		return albaran.getCodAplicacion();
	}

	public String getCodTarifa() {
		return albaran.getCodTarifa();
	}

	public String getDesTarifa() {
		return albaran.getDesTarifa();
	}

	public void setCodTarifa(String codTarifa) {
		albaran.setCodTarifa(codTarifa);
	}

	public void setDesTarifa(String desTarifa) {
		albaran.setDesTarifa(desTarifa);
	}

	public Long getIdFacturaRepercutida() {
		return albaran.getIdFacturaRepercutida();
	}

	public void setIdFacturaRepercutida(Long idFacturaRepercutida) {
		albaran.setIdFacturaRepercutida(idFacturaRepercutida);
	}

	public String getTrackingPorte() {
		return albaran.getTrackingPorte();
	}

	public void setTrackingPorte(String trackingPorte) {
		albaran.setTrackingPorte(trackingPorte);
	}
}
