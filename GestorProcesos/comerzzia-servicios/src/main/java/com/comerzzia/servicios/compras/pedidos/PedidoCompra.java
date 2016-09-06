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

package com.comerzzia.servicios.compras.pedidos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.compras.pedidos.EstadosPedidosCompra;
import com.comerzzia.persistencia.compras.pedidos.PedidoCompraBean;
import com.comerzzia.persistencia.compras.pedidos.articulos.ArticuloPedidoCompraBean;
import com.comerzzia.persistencia.compras.pedidos.pagos.PagoPedidoCompraBean;
import com.comerzzia.persistencia.core.estados.EstadoBean;
import com.comerzzia.persistencia.core.estados.Estados;
import com.comerzzia.persistencia.core.estados.EstadosSubestados;
import com.comerzzia.persistencia.core.impuestos.ILineaDocumento;
import com.comerzzia.persistencia.core.impuestos.ImpuestoException;
import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.grupos.GrupoImpuestosBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.persistencia.general.conceptoalmacenes.ConceptoAlmacenBean;
import com.comerzzia.persistencia.general.proveedores.ProveedorBean;
import com.comerzzia.servicios.compras.pedidos.articulos.ArticuloPedidoCompraConstraintViolationException;
import com.comerzzia.servicios.compras.pedidos.pagos.PagoPedidoCompraConstraintViolationException;
import com.comerzzia.servicios.core.estados.EstadoException;
import com.comerzzia.servicios.core.estados.ServicioEstados;
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

public class PedidoCompra extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1811631536224716131L;
	
	private PedidoCompraBean pedido = null;
	private ConceptoAlmacenBean conceptoAlmacen = null;
	private PorcentajesImpuestosBean porcentajesImpuestos = null;
	private ProveedorBean proveedor = null;
	private Estados estadosEmisor = null;
	private EstadosSubestados estadosLineas = null;
	private Double totalPagos = 0.0;
	private Double restantePagos = 0.0;
	
	
	public PedidoCompra() {
		this.pedido = new PedidoCompraBean();
	}
	public PedidoCompra(PedidoCompraBean pedido) {
		this.pedido = pedido;
		
		try {
			setPorcentajesImpuestos();
		}
		catch (Exception ignore) {
		}
	}
	
	
	protected void initNuevoBean() {
	}
	
	
	protected PedidoCompraBean getBean() {
		return pedido;
	}
	
	
	public PorcentajesImpuestosBean getPorcentajesImpuestos() {
		return porcentajesImpuestos;
	}
	public void setPorcentajesImpuestos(
			PorcentajesImpuestosBean porcentajesImpuestos) {
		this.porcentajesImpuestos = porcentajesImpuestos;
	}
	
	
	public Long getIdPedido() {
		return pedido.getIdPedido();
	}
	public void setIdPedido(Long idPedido) {
		pedido.setIdPedido(idPedido);
	}
	
	
	public String getCodEmpresa() {
		return pedido.getCodEmpresa();
	}
	public void setCodEmpresa(String codEmpresa) {
		pedido.setCodEmpresa(codEmpresa);
	}
	
	
	public Short getPeriodo() {
		return pedido.getPeriodo();
	}
	public void setPeriodo(Short periodo) {
		pedido.setPeriodo(periodo);
	}
	
	
	public String getCodSerie() {
		return pedido.getCodSerie();
	}
	public void setCodSerie(String codSerie) {
		pedido.setCodSerie(codSerie);
	}
	
	
	public String getDesSerie() {
		return pedido.getDesSerie();
	}
	public void setDesSerie(String desSerie) {
		pedido.setDesSerie(desSerie);
	}
	
	
	public Long getNumPedido() {
		return pedido.getNumPedido();
	}
	public void setNumPedido(Long numPedido) {
		pedido.setNumPedido(numPedido);
	}
	
	
	public String getCodConceptoAlmacen() {
		return pedido.getCodConceptoAlmacen();
	}
	public void setCodConceptoAlmacen(String codConceptoAlmacen) {
		pedido.setCodConceptoAlmacen(codConceptoAlmacen);
	}
	
	
	public String getDesConceptoAlmacen() {
		return pedido.getDesConceptoAlmacen();
	}
	public void setDesConceptoAlmacen(String desConceptoAlmacen) {
		pedido.setDesConceptoAlmacen(desConceptoAlmacen);
	}
	
	
	public ConceptoAlmacenBean getConceptoAlmacen() {
		return conceptoAlmacen;
	}
	public void setConceptoAlmacen(ConceptoAlmacenBean conceptoAlmacen) {
		this.conceptoAlmacen = conceptoAlmacen;
	}
	
	
	public void setConceptoAlmacen(String codConceptoAlmacen, String codAlmacen, DatosSesionBean datosSesion) throws PedidoCompraException {
		// Comprobamos si ha cambiado el concepto de almacén, si es así
		// verificamos si tiene almacén de origen y si corresponde con el que tenemos
		if (conceptoAlmacen == null || 
				(pedido.getCodConceptoAlmacen() == null || !pedido.getCodConceptoAlmacen().equals(codConceptoAlmacen)) 
				|| (pedido.getCodAlmacen() == null || !pedido.getCodAlmacen().equals(codAlmacen))) {
			try {
				// Obtenemos los datos del concepto del almacen
				conceptoAlmacen = ServicioConceptoAlmacenes.consultar(pedido.getCodAplicacion(), codConceptoAlmacen, datosSesion);
				pedido.setCodConceptoAlmacen(conceptoAlmacen.getCodConAlm());
				pedido.setDesConceptoAlmacen(conceptoAlmacen.getDesConAlm());
				
				//Si el concepto de almacén tiene almacén de destino actualizamos los valores del almacén
				AlmacenBean almacen = null;
				if(conceptoAlmacen.getCodAlm_destino() != null) {
					almacen = ServicioAlmacenes.consultar(conceptoAlmacen.getCodAlm_destino(), datosSesion);
					pedido.setCodAlmacen(almacen.getCodAlm());
					pedido.setDesAlmacen(almacen.getDesAlm());
				}
				else{
					almacen = ServicioAlmacenes.consultar(codAlmacen, datosSesion);
					pedido.setCodAlmacen(almacen.getCodAlm());
					pedido.setDesAlmacen(almacen.getDesAlm());
				}
			}
			catch (Exception e) {
				throw new PedidoCompraException(e.getMessage(), e);
			}
		}
	}
	
	
	public String getCodAlmacen() {
		return pedido.getCodAlmacen();
	}
	public void setCodAlmacen(String codAlmacen) {
		pedido.setCodAlmacen(codAlmacen);
	}
	
	
	public String getDesAlmacen() {
		return pedido.getDesAlmacen();
	}
	public void setDesAlmacen(String desAlmacen) {
		pedido.setDesAlmacen(desAlmacen);
	}
	
	
	public Date getFecha() {
		return pedido.getFecha();
	}
	
	
	/**
	 * Establece la fecha del pedido y el grupo de impuestos en función de esta
	 * Si el pedido no es nuevo solo se podrá cambiar la fecha si esta no supone
	 * un cambio de grupo de impuestos
	 * @param fecha
	 * @throws PedidoCompraException
	 */
	public void setFecha(Date fecha) throws PedidoCompraException {
		// Si la fecha no es la misma que la que tiene el pedido
		if (pedido.getFecha() == null || !pedido.getFecha().equals(fecha)) {
			// Obtenemos el grupo de impuestos activos para la fecha
			GrupoImpuestosBean grupoImpuestos;
			try {
				grupoImpuestos = ServicioGruposImpuestos.consultar(fecha);
			} 
			catch (Exception e) {
				throw new PedidoCompraException("Error al obtener el grupo de impuestos activos: " + e.getMessage(), e);
			}
			
			// Si el pedido es nuevo establecemos la fecha y el grupo de impuestos
			if (pedido.getEstadoBean() == Estado.NUEVO) {
				pedido.setFecha(fecha);
				pedido.setIdGrupoImpuestos(grupoImpuestos.getIdGrupoImpuestos());
				this.porcentajesImpuestos = null;
				
				// Recalculamos los totales del pedido por si ha cambiado el grupo de impuestos y tenemos artículos
				calcularTotales();
			}
			else { 
				// Si el pedido no es nuevo, solo permitimos cambiar la fecha 
				// si no se ha producido un cambio de grupo de impuestos activo
				if (pedido.getIdGrupoImpuestos() == grupoImpuestos.getIdGrupoImpuestos()) {
					pedido.setFecha(fecha);
				}
				else {
					throw new PedidoCompraException("No se puede cambiar la fecha del pedido " 
							+ pedido.getNumPedido() + " ya que para la fecha " + fecha 
							+ " se ha producido un cambio de vigencia del grupo de impuestos activo");
				}
			}
		}
	}
	
	
	public Date getFechaSuministroPrevista() {
		return pedido.getFechaSuministroPrevista();
	}
	public void setFechaSuministroPrevista(Date fechaSuministroPrevista) {
		pedido.setFechaSuministroPrevista(fechaSuministroPrevista);
	}
	
	
	public String getCodProveedor() {
		return pedido.getCodProveedor();
	}
	
	
	public String getDesProveedor() {
		return pedido.getDesProveedor();
	}
	public void setDesProveedor(String desProveedor) {
		pedido.setDesProveedor(desProveedor);
	}
	
	
	public ProveedorBean getProveedor() {
		return proveedor;
	}
	public void setProveedor(ProveedorBean proveedor) {
		this.proveedor = proveedor;
	}
	
	
	/**
	 * Establece el proveedor del pedido y el tratamiento de impuestos según el del proveedor
	 * No se podrá cambiar el proveedor de un pedido si este tiene artículos
	 * @param codProveedor
	 * @param datosSesion
	 * @throws PedidoCompraException
	 */
	public void setProveedor(String codproveedor, DatosSesionBean datosSesion) throws PedidoCompraException {
		// Si hay un cambio de proveedor o el proveedor está vacío
		if (proveedor == null || pedido.getCodProveedor() == null || !pedido.getCodProveedor().equals(codproveedor)) {

			// Obtenemos los datos del proveedor y su tratamiento de impuestos
			try {
				proveedor = ServicioProveedores.consultar(codproveedor, datosSesion);
				
				// El proveedor sólo se establece cuando el pedido es nuevo y no tiene artículos
				if (pedido.getEstadoBean() == Estado.NUEVO
						&& pedido.getArticulos().size() == 0) {
					pedido.setCodProveedor(proveedor.getCodPro());
					pedido.setDesProveedor(proveedor.getDesPro());
					pedido.setIdTratamientoImpuestos(proveedor.getIdTratImp());
					this.porcentajesImpuestos = null;
					
					calcularTotales();
				}
			}
			catch (Exception e) {
				throw new PedidoCompraException(e.getMessage(), e);
			}
		}
	}
	
	
	public Estados getEstadosEmisor() {
		return estadosEmisor;
	}
	public void setEstadosEmisor(Estados estadosEmisor) {
		this.estadosEmisor = estadosEmisor;
	}
	
	
	public EstadosSubestados getEstadosLineas() {
		return estadosLineas;
	}
	public void setEstadosLineas(EstadosSubestados estadosLineas) {
		this.estadosLineas = estadosLineas;
	}
	
	
	public String getPersonaContacto() {
		return pedido.getPersonaContacto();
	}
	public void setPersonaContacto(String personaContacto) {
		pedido.setPersonaContacto(personaContacto);
	}
	
	
	public String getReferenciaProveedor() {
		return pedido.getReferenciaProveedor();
	}
	public void setReferenciaProveedor(String referenciaProveedor) {
		pedido.setReferenciaProveedor(referenciaProveedor);
	}
	
	
	public String getObservaciones() {
		return pedido.getObservaciones();
	}
	public void setObservaciones(String observaciones) {
		pedido.setObservaciones(observaciones);
	}
	
	
	public int getEstadoBean() {
		return pedido.getEstadoBean();
	}
	public void setEstadoBean(int estado) {
		pedido.setEstadoBean(estado);
	}
	public boolean isEstadoNuevo() {
		return pedido.isEstadoNuevo();
	}
	
	
	public Integer getEstado() {
		return pedido.getEstado();
	}
	public Integer getSubEstado() {
		return pedido.getSubEstado();
	}
	public String getDesEstado() {
		return pedido.getDesEstado();
	}
	
	
	public Long getIdGrupoImpuestos() {
		return pedido.getIdGrupoImpuestos();
	}
	
	
	public Long getIdTratamientoImpuestos() {
		return pedido.getIdTratamientoImpuestos();
	}
	
	
	public Double getBase() {
		return pedido.getBase();
	}
	
	
	public Double getImpuestos() {
		return pedido.getImpuestos();
	}
	
	
	public Double getTotal() {
		return pedido.getTotal();
	}
	

	public List<ArticuloPedidoCompraBean> getArticulos() {
		return pedido.getArticulos();
	}
	public void setArticulos(List<ArticuloPedidoCompraBean> listaArticulos) {
		pedido.setArticulos(listaArticulos);
	}
	public boolean isTieneArticulos() {
		return pedido.isTieneArticulos();
	}
	
	
	public ImpuestosBean getDetalleImpuestos() {
		return pedido.getDetalleImpuestos();
	}
	public void setDetalleImpuestos(ImpuestosBean detalleImpuestos) {
		pedido.setDetalleImpuestos(detalleImpuestos);
	}
	
	
	public List<PagoPedidoCompraBean> getPagos() {
		return pedido.getPagos();
	}
	public void setPagos(List<PagoPedidoCompraBean> pagos) {
		pedido.setPagos(pagos);
	}
	public boolean isTienePagos() {
		return pedido.isTienePagos();
	}
	
	
	public Double getTotalPagos() {
		return totalPagos;
	}
	public Double getRestantePagos() {
		return restantePagos;
	}
	
	
	public void calcularTotales() throws PedidoCompraException {
		if (pedido.getIdGrupoImpuestos() != null && pedido.getIdTratamientoImpuestos() != null) {
			// Calculamos los impuestos y se los establacemos al pedido
			ImpuestosBean detalleImpuestos = calcularImpuestos();
			pedido.setDetalleImpuestos(detalleImpuestos);
			
			// Actualizamos los totales del pedido
			pedido.setBase(detalleImpuestos.getBase());
			pedido.setImpuestos(detalleImpuestos.getImpuestos());
			pedido.setTotal(detalleImpuestos.getTotal());
		}
	}
	
	
	private ImpuestosBean calcularImpuestos() throws PedidoCompraException {
		try {
			// Obtenemos la lista de artículos no barrados del pedido y no rechazados
			List<ILineaDocumento> articulos = new ArrayList<ILineaDocumento>();
			for (ArticuloPedidoCompraBean articulo : pedido.getArticulos()) {
				if (articulo.getEstadoBean() != Estado.BORRADO && !isEstaLineaRechazada(articulo)) {
					articulos.add(articulo);
				}
			}
			
			// Si no tenemos los porcentajes de impuestos los obtenemos para el grupo y tratamiento del pedido
			if (this.porcentajesImpuestos == null) {
				this.porcentajesImpuestos = ServicioPorcentajesImpuestos.consultar(
						pedido.getIdGrupoImpuestos(), pedido.getIdTratamientoImpuestos());
			}
			
			return ServicioImpuestos.calcularImpuestos(porcentajesImpuestos, articulos);
		}
		catch (ImpuestoException e) {
			throw new PedidoCompraException("Error calculando totales del pedido de compras" + e.getMessage(), e);
		} 
		catch (PorcentajeImpuestoException e) {
			throw new PedidoCompraException("Error calculando totales del pedido de compras" + e.getMessage(), e);
		}
	}
	
	
	// TODO: utilizar este método siempre para obtener los porcentajes de impuestos
	//       repasar su utilización en el constructor
	private void setPorcentajesImpuestos() throws PedidoCompraException {
		try {
			if (pedido.getIdGrupoImpuestos() != null && pedido.getIdTratamientoImpuestos() != null) {
				this.porcentajesImpuestos = ServicioPorcentajesImpuestos.consultar(
						pedido.getIdGrupoImpuestos(), pedido.getIdTratamientoImpuestos());
			}
		}
		catch (PorcentajeImpuestoException e) {
			throw new PedidoCompraException("Error obteniendo porcentajes de impuestos para el pedido de compras" + e.getMessage(), e);
		}
	}
	
	
	public void calcularTotalesPagos() {
		// Inicializar las cantidades
		totalPagos = 0.0;
		restantePagos = 0.0;
		
		for (PagoPedidoCompraBean pago : pedido.getPagos()) {
			if (pago.getEstadoBean() != Estado.BORRADO) {
				totalPagos = Numero.redondea(totalPagos + pago.getImporte(), 2);
			}
		}
		
		if (Math.abs(pedido.getTotal()) > Math.abs(totalPagos)) {
			restantePagos = Numero.redondea(Math.abs(pedido.getTotal()) - Math.abs(totalPagos), 2);
			
			if(pedido.getTotal() < 0) {
				restantePagos *= -1;
			}
		}
		else {
			restantePagos = 0.0;
		}
	}
	
	
	/**
	 * Comprueba que los totales del pedido coinciden con los del cálculo del detalle de impuestos
	 * @return
	 */
	public boolean checkTotales() throws PedidoCompraException {
		// Obtenemos el cáclulo del detalle de impuestos
		ImpuestosBean detalleImpuestos = calcularImpuestos();
		
		if (pedido.getBase() != detalleImpuestos.getBase()
				|| pedido.getImpuestos() != detalleImpuestos.getImpuestos()
				|| pedido.getTotal() != detalleImpuestos.getTotal()) {
			return false;
		}
		
		return true;
	}
	
	
	/**
	 * Comprueba los totales de los pagos no superen el total del pedido, en cuyo caso
	 * lanza un excepción con el mensaje que informa de tal situación.
	 * 
	 * @return
	 * @throws PagoPedidoCompraConstraintViolationException 
	 */
	public void checkTotalesPagos() throws PagoPedidoCompraConstraintViolationException {
		// Calcular los pagos primero
		calcularTotalesPagos();
		
		if (Math.abs(totalPagos) > Math.abs(pedido.getTotal())) {
			throw new PagoPedidoCompraConstraintViolationException("El importe total de los pagos es superior al importe del pedido");
		}
	}
	
	
	public void checkPedidoPuedeModificarse() throws PedidoCompraConstraintViolationException {
		if (pedido.getEstado() == EstadosPedidosCompra.ESTADO_EMISOR_RECEPCIONADO ||
				pedido.getEstado() == EstadosPedidosCompra.ESTADO_EMISOR_RECHAZADO) {
			String mensaje = null;
			
			switch (pedido.getEstado()) {
				case EstadosPedidosCompra.ESTADO_EMISOR_RECEPCIONADO:
					mensaje = "El pedido ya está recepcionado";
					break;
				
				case EstadosPedidosCompra.ESTADO_EMISOR_RECHAZADO:
					mensaje = "El pedido está rechazado";
					break;
			}
			
			throw new PedidoCompraConstraintViolationException(mensaje);
		}
	}
	
	
	public void checkPedidoPuedeBorrarse() throws PedidoCompraConstraintViolationException {
		// Mismas comprobaciones que para saber si es editable, por eso la llamada
		checkPedidoPuedeModificarse();
	}
	
	
	public void checkPedidoPuedeConfirmarse() throws PedidoCompraConstraintViolationException {
		if (!isEstaSolicitud()) {
			throw new PedidoCompraConstraintViolationException("El estado del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido() + " no permite su confirmación");
		}
	}
	
	
	public void checkPedidoPuedeAceptarse() throws PedidoCompraConstraintViolationException {
		if (!isEstaPendienteAceptacion()) {
			throw new PedidoCompraConstraintViolationException("El estado del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido() + " no permite su aceptación");
		}
	}
	
	
	public void checkPedidoPuedeRecepcionarse() throws PedidoCompraConstraintViolationException {
		if (!isEstaPendienteRecepcion()) {
			throw new PedidoCompraConstraintViolationException("El estado del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido() + " no permite finalizar su recepción");
		}
	}
	
	
	public void checkPedidoPuedeServirse() throws PedidoCompraConstraintViolationException {
		if (!isEstaRecepcionado()) {
			throw new PedidoCompraConstraintViolationException("El estado del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido() + " no permite que sea servido");
		}
	}
	
	
	/**
	 * Este método contiene la lógica para generar un pedido de faltas a partir del pedido
	 * original recibido.
	 * 
	 * @param datosSesion
	 * @param pedidoOrigen
	 * @param fechaSuministro
	 * @return
	 * @throws PedidoCompraException
	 * @throws PagoPedidoCompraConstraintViolationException
	 */
	public PedidoCompra generarPedidoFaltas(DatosSesionBean datosSesion, PedidoCompra pedidoOrigen, Date fechaSuministro) throws PedidoCompraException {
		try {
			PedidoCompra pedidoFaltas = new PedidoCompra();
			pedidoFaltas.setEstadoBean(Estado.NUEVO);
			// Hacer una copia superficial del bean con los valores necesarios
			pedidoFaltas.getBean().setCodEmpresa(pedidoOrigen.getCodEmpresa());
			pedidoFaltas.getBean().setPeriodo(new Integer(Fechas.año()).shortValue());
			pedidoFaltas.getBean().setCodSerie(pedidoOrigen.getCodSerie());
			pedidoFaltas.getBean().setFecha(new Date());
			pedidoFaltas.getBean().setFechaSuministroPrevista(fechaSuministro);
			pedidoFaltas.getBean().setCodAlmacen(pedidoOrigen.getCodAlmacen());
			pedidoFaltas.getBean().setCodConceptoAlmacen(pedidoOrigen.getCodConceptoAlmacen());
			pedidoFaltas.getBean().setCodProveedor(pedidoOrigen.getCodProveedor());
			pedidoFaltas.getBean().setPersonaContacto(pedidoOrigen.getPersonaContacto());
			pedidoFaltas.getBean().setReferenciaProveedor(pedidoOrigen.getReferenciaProveedor());
			pedidoFaltas.getBean().setObservaciones(pedidoOrigen.getObservaciones());
			pedidoFaltas.getBean().setIdGrupoImpuestos(pedidoOrigen.getIdGrupoImpuestos());
			pedidoFaltas.getBean().setIdTratamientoImpuestos(pedidoOrigen.getIdTratamientoImpuestos());
			// Establecer objetos del pedido (también los conjuntos de estados para que no sean consultados cuando se necesitem)
			pedidoFaltas.setConceptoAlmacen(pedidoOrigen.getConceptoAlmacen());
			pedidoFaltas.setProveedor(pedidoOrigen.getProveedor());
			pedidoFaltas.setEstadosEmisor(pedidoOrigen.getEstadosEmisor());
			pedidoFaltas.setEstadosLineas(pedidoOrigen.getEstadosLineas());
			
			for(ArticuloPedidoCompraBean articuloPedidoOrigen : pedidoOrigen.getArticulos()) {
				// La línea tiene que estar recepcionada parcial o nada
				if(isEstaLineaRecepcionada(articuloPedidoOrigen) 
						&& (articuloPedidoOrigen.getLineaSubEstado() == EstadosPedidosCompra.SUBESTADO_PARCIAL || 
								articuloPedidoOrigen.getLineaSubEstado() == EstadosPedidosCompra.SUBESTADO_NADA)) {
					ArticuloPedidoCompraBean articuloPedidoFaltas = new ArticuloPedidoCompraBean();
					articuloPedidoFaltas.setEstadoBean(Estado.NUEVO);
					articuloPedidoFaltas.setCodArticulo(articuloPedidoOrigen.getCodArticulo());
					articuloPedidoFaltas.setDesglose1(articuloPedidoOrigen.getDesglose1());
					articuloPedidoFaltas.setDesglose2(articuloPedidoOrigen.getDesglose2());
					articuloPedidoFaltas.setDesArticulo(articuloPedidoOrigen.getDesArticulo());
					articuloPedidoFaltas.setDescripcionAmpliada(articuloPedidoOrigen.getDescripcionAmpliada());
					articuloPedidoFaltas.setUnidadMedida(articuloPedidoOrigen.getUnidadMedida());
					
					// Obtener la cantidad medida y la cantidad a partir de lo solicitado menos lo recepcionado
					Double cantidadMedida = null;
					Double cantidad = null;
					
					
					// Tomamos como cantidad para el nuevo pedido la diferencia entre la cantidad aceptada y la servida
					if(articuloPedidoOrigen.getCantidadMedidaAceptada() != null
							&& articuloPedidoOrigen.getCantidadMedidaRecepcionada() != null) {
						cantidadMedida = Math.abs(articuloPedidoOrigen.getCantidadMedidaAceptada()) - Math.abs(articuloPedidoOrigen.getCantidadMedidaRecepcionada());
					}
					
					cantidad = Math.abs(articuloPedidoOrigen.getCantidadAceptada()) - Math.abs(articuloPedidoOrigen.getCantidadRecepcionada());
					
					// Tener en cuenta el signo
					if(articuloPedidoOrigen.getCantidadAceptada() < 0) {
						if(cantidadMedida != null) {
							cantidadMedida *= -1;
						}
						cantidad *= -1;
					}

					articuloPedidoFaltas.setCantidadMedidaSolicitada(cantidadMedida);
					articuloPedidoFaltas.setCantidadSolicitada(cantidad);
					articuloPedidoFaltas.setPrecio(articuloPedidoOrigen.getPrecio());
					articuloPedidoFaltas.setDescuento(articuloPedidoOrigen.getDescuento());
					articuloPedidoFaltas.setCodImpuesto(articuloPedidoOrigen.getCodImpuesto());
					articuloPedidoFaltas.setIdPedidoOrigen(articuloPedidoOrigen.getIdPedido());
					articuloPedidoFaltas.setLineaPedidoOrigen(articuloPedidoOrigen.getLinea());
					
					setEstadoLineaPendienteAceptacion(articuloPedidoFaltas);
					articuloPedidoFaltas.calcularImporte();
					
					pedidoFaltas.getArticulos().add(articuloPedidoFaltas);
				}
			}
			
			// Establecer estado aceptado al pedido completo
			pedidoFaltas.setEstadoPendienteAceptacion();
			
			// Calcular los importes finales del pedido
			pedidoFaltas.calcularTotales();
			
			return pedidoFaltas;
		} 
		catch (Exception e) {
			throw new PedidoCompraException("Error al generar pedido de faltas: " + e.getMessage(), e);
		}
	}
	
	
	//***** Métodos para los estados de la cabecera *****//
	
	private void setEstadoCabeceraPedido(Integer estado, Integer subEstado) throws PedidoCompraException {
		try {
			if(estadosEmisor == null) {
				estadosEmisor = ServicioEstados.consultar(EstadosPedidosCompra.ESTADO_EMISOR_PROCESO);
			}
			
			pedido.setEstado(estadosEmisor.getEstados().get(estado).getEstado());
			pedido.setSubEstado(subEstado);
			pedido.setDesEstado(estadosEmisor.getEstados().get(estado).getDesEstado());
		}
		catch (EstadoException e) {
			throw new PedidoCompraException("Error obteniendo estados del pedido: " + e.getMessage());
		}
	}
	
	
	/**
	 * Establece el estado del pedido A SOLICITUD
	 */
	public void setEstadoSolicitud() throws PedidoCompraException {
		// Cambiar el estado en la cabecera
		setEstadoCabeceraPedido(EstadosPedidosCompra.ESTADO_EMISOR_SOLICITUD, EstadosPedidosCompra.SUBESTADO_COMPLETO);
	}
	
	
	/**
	 * Comprueba a partir de la cabecera del pedido si éste se haya en estado SOLICITUD
	 * 
	 * @return
	 */
	public boolean isEstaSolicitud() {
		return (pedido.getEstado() != null && pedido.getEstado() == EstadosPedidosCompra.ESTADO_EMISOR_SOLICITUD);
	}
	
	
	/**
	 * Establece el estado del pedido PENDIENTE ACEPT.
	 */
	public void setEstadoPendienteAceptacion() throws PedidoCompraException {
		// Cambiar el estado en la cabecera
		setEstadoCabeceraPedido(EstadosPedidosCompra.ESTADO_EMISOR_PDTE_ACEPT, EstadosPedidosCompra.SUBESTADO_COMPLETO);
		
		// Cambiar el estado de las líneas
		for (ArticuloPedidoCompraBean articulo : pedido.getArticulos()) {
			setEstadoLineaPendienteAceptacion(articulo);
		}
	}
	
	
	/**
	 * Comprueba a partir de la cabecera del pedido si éste se haya en estado PENDIENTE ACEPT.
	 * 
	 * @return
	 */
	public boolean isEstaPendienteAceptacion() {
		return (pedido.getEstado() != null && pedido.getEstado() == EstadosPedidosCompra.ESTADO_EMISOR_PDTE_ACEPT);
	}
	
	
	/**
	 * Establece el estado del pedido completo a PENDIENTE RECEP., aunque existe la posibilidad
	 * de que algunas líneas estén rechazadas o aceptadas parcialmente y por lo tanto el pedido quede aceptado parcialmente
	 * o bien que todas las líneas estén rechazadadas por lo que el pedido será rechazado al completo.
	 * 
	 * @throws PedidoCompraException
	 * @throws ArticuloPedidoCompraConstraintViolationException 
	 */
	public void setEstadoPendienteRecepcion() throws PedidoCompraException, ArticuloPedidoCompraConstraintViolationException {
		Integer lineasAceptadasCompletas = 0;
		Integer lineasRechazadas = 0;
		
		// Recorrer la lista de artículos asignándole el estado correspondiente (si es posible)
		for(ArticuloPedidoCompraBean articulo : pedido.getArticulos()) {
			if(!isEstaLineaRechazada(articulo)) {
				// Establacemos el estado de la línea en función de la cantidad aceptada
				setEstadoLineaPendienteRecepcion(articulo);
			}
			
			if (isEstaLineaRechazada(articulo)) {
				lineasRechazadas++;
			}
			else if (articulo.getLineaSubEstado() == EstadosPedidosCompra.SUBESTADO_COMPLETO) {
				lineasAceptadasCompletas++;
			}
			
			// Actualizar el importe con las cantidades aceptadas
			articulo.calcularImporte(); 
		}
		
		
		if(lineasRechazadas == pedido.getArticulos().size()) {
			// Rechazado completo
			setEstadoRechazado();
		}
		else {
			if(lineasAceptadasCompletas == pedido.getArticulos().size()) {
				// Aceptado completo
				setEstadoCabeceraPedido(EstadosPedidosCompra.ESTADO_EMISOR_PDTE_RECEP, EstadosPedidosCompra.SUBESTADO_COMPLETO);
			}
			else {
				// Aceptado parcial
				setEstadoCabeceraPedido(EstadosPedidosCompra.ESTADO_EMISOR_PDTE_RECEP, EstadosPedidosCompra.SUBESTADO_PARCIAL);
			}
		}
		
		// Actualizar los totales porque los importe de las líneas pueden haber cambiado 
		calcularTotales();
	}
	
	
	public boolean isEstaPendienteRecepcion() {
		return pedido.getEstado() == EstadosPedidosCompra.ESTADO_EMISOR_PDTE_RECEP;
	}
	
	
	/**
	 * Establece el estado del pedido completo a RECEPCIONADO, aunque existe la posibilidad
	 * de que algunas líneas estén rechazadas o recepcionadas parcialmente y por lo tanto el pedido quede recepcionado parcialmente
	 * o bien que todas las líneas estén rechazadadas por lo que el pedido será rechazado al completo.
	 * 
	 * @throws PedidoCompraException
	 * @throws ArticuloPedidoCompraConstraintViolationException 
	 */
	public void setEstadoRecepcionado() throws PedidoCompraException, ArticuloPedidoCompraConstraintViolationException {
		Integer lineasRecepcionadasCompletas = 0;
		Integer lineasRechazadas = 0;
		
		// Recorrer la lista de artículos asignándole el estado correspondiente (si es posible)
		for(ArticuloPedidoCompraBean articulo : pedido.getArticulos()) {
			if(!isEstaLineaRechazada(articulo)) {
				// Establacemos el estado de la línea en función de la cantidad recepcionada
				setEstadoLineaRecepcionada(articulo);
			}
			
			if (isEstaLineaRechazada(articulo)) {
				lineasRechazadas++;
			}
			else if (articulo.getLineaSubEstado() == EstadosPedidosCompra.SUBESTADO_COMPLETO) {
				lineasRecepcionadasCompletas++;
			}
			
			// Actualizar el importe con las cantidades aceptadas
			articulo.calcularImporte(); 
		}
		
		if(lineasRechazadas == pedido.getArticulos().size()) {
			// Rechazado completo
			setEstadoRechazado();
		}
		else {
			if(lineasRecepcionadasCompletas == pedido.getArticulos().size()) {
				// Recepcionado completo
				setEstadoCabeceraPedido(EstadosPedidosCompra.ESTADO_EMISOR_RECEPCIONADO, EstadosPedidosCompra.SUBESTADO_COMPLETO);
			}
			else {
				// Recepcionado parcial
				setEstadoCabeceraPedido(EstadosPedidosCompra.ESTADO_EMISOR_RECEPCIONADO, EstadosPedidosCompra.SUBESTADO_PARCIAL);
			}
		}
		
		// Actualizar los totales porque los importe de las líneas pueden haber cambiado 
		calcularTotales();
	}
	
	
	public boolean isEstaRecepcionado() {
		return pedido.getEstado() == EstadosPedidosCompra.ESTADO_EMISOR_RECEPCIONADO;
	}
	
	
	public void setEstadoRechazado() throws PedidoCompraException {
		setEstadoCabeceraPedido(EstadosPedidosCompra.ESTADO_EMISOR_RECHAZADO, EstadosPedidosCompra.SUBESTADO_COMPLETO);
	}
	
	
	public boolean isEstaRechazado() {
		return pedido.getEstado() == EstadosPedidosCompra.ESTADO_EMISOR_RECHAZADO;
	}
	
	
	//***** Métodos para los estados de las líneas *****//
	
	
	public EstadosSubestados getConjuntoEstadosLineas() throws PedidoCompraException {
		try {
			if(estadosLineas == null) {
				estadosLineas = ServicioEstados.consultarSubestados(EstadosPedidosCompra.ESTADO_LINEA_PROCESO);
			}
			
			return estadosLineas;
		}
		catch (EstadoException e) {
			throw new PedidoCompraException("Error obteniendo estados y subestados del pedido: " + e.getMessage());
		}
	}
	
	
	/**
	 * Establece el estado de un artículo a partir de la instancia del objeto que representa
	 */
	private void setEstadoLineaPedido(ArticuloPedidoCompraBean articulo, Integer lineaEstado, Integer lineaSubEstado) throws PedidoCompraException {
		getConjuntoEstadosLineas();
		
		String estadoSubestado = lineaEstado + "|" + lineaSubEstado;
		EstadoBean estado = estadosLineas.getEstados().get(estadoSubestado);
		
		articulo.setLineaEstado(estado.getEstado());
		articulo.setLineaSubEstado((lineaSubEstado == null) ? estado.getSubEstado() : lineaSubEstado);
		articulo.setLineaDesEstado(estado.getDesEstado());
		
		if(articulo.getEstadoBean() == Estado.SIN_MODIFICAR) {
			articulo.setEstadoBean(Estado.MODIFICADO);
		}
	}
	
	
	/**
	 * Estable a estado SOLICITADA la línea del artículo indicado
	 * 
	 * @param articulo
	 * @throws PedidoCompraException
	 */
	public void setEstadoLineaSolicitada(ArticuloPedidoCompraBean articulo) throws PedidoCompraException {
		setEstadoLineaPedido(articulo, EstadosPedidosCompra.ESTADO_LINEA_SOLICITADA, EstadosPedidosCompra.SUBESTADO_COMPLETO);
	}
	
	
	/**
	 * Comprueba a si la línea ha sido SOLICITADA
	 * 
	 * @return
	 */
	public boolean isEstaLineaSolicitada(ArticuloPedidoCompraBean articulo) {
		return articulo.getLineaEstado() == EstadosPedidosCompra.ESTADO_LINEA_SOLICITADA;
	}
	
	
	/**
	 * Estable a estado PENDIENTE ACEPTACION la línea del artículo indicado
	 * 
	 * @param articulo
	 * @throws PedidoCompraException
	 */
	public void setEstadoLineaPendienteAceptacion(ArticuloPedidoCompraBean articulo) throws PedidoCompraException {
		setEstadoLineaPedido(articulo, EstadosPedidosCompra.ESTADO_LINEA_PDTE_ACEPT, EstadosPedidosCompra.SUBESTADO_COMPLETO);
	}
	
	
	/**
	 * Comprueba a si la línea está PENDIENTE ACEPTACION
	 * 
	 * @return
	 */
	public boolean isEstaLineaPendienteAceptacion(ArticuloPedidoCompraBean articulo) {
		return (articulo.getLineaEstado() != null && articulo.getLineaEstado() == EstadosPedidosCompra.ESTADO_LINEA_PDTE_ACEPT);
	}
	
	
	/**
	 * Establece a estado PENDIENTE RECEP. la línea del artículo indicado si es posible,
	 * ya que en determinados casos la línea puede ser rechazada, aceptada (aunque parcialmente) o
	 * lanzar un error que terminaría la ejecución.
	 * 
	 * @param articulo
	 * @throws PedidoCompraException
	 * @throws ArticuloPedidoCompraConstraintViolationException 
	 */
	public void setEstadoLineaPendienteRecepcion(ArticuloPedidoCompraBean articulo) throws PedidoCompraException, ArticuloPedidoCompraConstraintViolationException {
		/*
		 * Sólo realizar las comprobaciones si el artículo tiene estado pendiente de aceptación;
		 * en caso contrario se inicializa el estado directamente 
		 * (caso de nuevo artículo cuando el pedido está pendiente de recepción)
		 */
		if(isEstaLineaPendienteAceptacion(articulo)) {
			// Si el artículo tiene unidad de medida alternativa, las unidades toman el valor de la cantidad medida
			if(articulo.isTieneUnidadMedidaAlternativa()) {
				articulo.setCantidadSolicitada(articulo.getCantidadMedidaSolicitada());
				articulo.setCantidadAceptada(articulo.getCantidadMedidaAceptada());
			}
			
			// Comprobar que se han especificado unidades aceptadas, pues es obligatorio
			if(articulo.getCantidadAceptada() == null) {
				throw new ArticuloPedidoCompraConstraintViolationException("No se han especificado unidades aceptadas para el artículo " + articulo.getCodArticulo() + " del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido());
			}
			
			// Si la cantidad aceptada es cero, rechazamos la línea
			if (articulo.getCantidadAceptada() == 0.0) {
				setEstadoLineaPedido(articulo, EstadosPedidosCompra.ESTADO_LINEA_RECHAZADA, EstadosPedidosCompra.SUBESTADO_COMPLETO);
			}
			else {
				// Si no existe cantidad solitada es compra directa y se acepta la línea completa
				if(articulo.getCantidadSolicitada() == null) {
					setEstadoLineaPedido(articulo, EstadosPedidosCompra.ESTADO_LINEA_PDTE_RECEP, EstadosPedidosCompra.SUBESTADO_COMPLETO);
				}
				else {
					// Comprobar que las unidades sean del mismo signo
					if((articulo.getCantidadSolicitada() > 0 && articulo.getCantidadAceptada() < 0)
							|| (articulo.getCantidadSolicitada() < 0 && articulo.getCantidadAceptada() > 0)) {
						throw new ArticuloPedidoCompraConstraintViolationException("Se han especificado unidades aceptadas de distinto signo que las solicitadas para el artículo " + articulo.getCodArticulo() + " del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido());
					}
					
					// Si la cantidad aceptada es mayor que la solicitada, así como en valor absoluto (signos), lanzar error
					if(Math.abs(articulo.getCantidadAceptada()) > Math.abs(articulo.getCantidadSolicitada())) {
						throw new ArticuloPedidoCompraConstraintViolationException("Se han especificado unidades aceptadas mayores que las solicitadas para el artículo " + articulo.getCodArticulo() + " del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido());
					}
					
					// Si ambas cantidades son iguales, aceptar la línea al completo
					if(articulo.getCantidadAceptada().equals(articulo.getCantidadSolicitada())) {
						setEstadoLineaPedido(articulo, EstadosPedidosCompra.ESTADO_LINEA_PDTE_RECEP, EstadosPedidosCompra.SUBESTADO_COMPLETO);
					}
					// Llegado este punto la línea se acepta parcialmente, porque la cantidad aceptada es menor que la solicitada
					else {
						setEstadoLineaPedido(articulo, EstadosPedidosCompra.ESTADO_LINEA_PDTE_RECEP, EstadosPedidosCompra.SUBESTADO_PARCIAL);
					}
				}
			}
		}
		else {
			setEstadoLineaPedido(articulo, EstadosPedidosCompra.ESTADO_LINEA_PDTE_RECEP, EstadosPedidosCompra.SUBESTADO_COMPLETO);
		}
	}
	
	
	/**
	 * Mueve las cantidades solicitadas a aceptadas actualizando el importe en cada línea sin cambiar el estado.
	 * 
	 * @throws PedidoCompraException
	 * @throws ArticuloPedidoCompraConstraintViolationException
	 */
	public void aceptarLineasCompleto() throws PedidoCompraException, ArticuloPedidoCompraConstraintViolationException {
		for(ArticuloPedidoCompraBean articulo : pedido.getArticulos()) {
			// Si la línea no está rechazada
			if (!isEstaLineaRechazada(articulo)) {
				articulo.setEstadoBean(Estado.MODIFICADO);
				
				articulo.setCantidadMedidaAceptada(articulo.getCantidadMedidaSolicitada());
				articulo.setCantidadAceptada(articulo.getCantidadSolicitada());
			}
		}
	}
	
	
	/**
	 * Comprueba a si la línea ha sido aceptada (estado PDTE. RECEPCION)
	 * 
	 * @return
	 */
	public boolean isEstaLineaPendienteRecepcion(ArticuloPedidoCompraBean articulo) {
		return articulo.getLineaEstado() == EstadosPedidosCompra.ESTADO_LINEA_PDTE_RECEP;
	}
	
	
	/**
	 * Establece a estado RECEPCIONADA la línea del artículo indicado si es posible,
	 * ya que en determinados casos la línea puede ser rechazada, recepcionada (aunque parcialmente) o
	 * lanzar un error que terminaría la ejecución.
	 * 
	 * @param articulo
	 * @throws PedidoCompraException
	 * @throws ArticuloPedidoCompraConstraintViolationException 
	 */
	public void setEstadoLineaRecepcionada(ArticuloPedidoCompraBean articulo) throws PedidoCompraException, ArticuloPedidoCompraConstraintViolationException {
		// Si el artículo tiene unidad de medida alternativa, las unidades toman el valor de la cantidad medida
		if(articulo.isTieneUnidadMedidaAlternativa()) {
			articulo.setCantidadAceptada(articulo.getCantidadMedidaAceptada());
			articulo.setCantidadRecepcionada(articulo.getCantidadMedidaRecepcionada());
		}
		
		// Comprobar que se han especificado unidades recepcionadas, pues es obligatorio
		if(articulo.getCantidadRecepcionada() == null) {
			throw new ArticuloPedidoCompraConstraintViolationException("No se han especificado unidades recepcionadas para el artículo " + articulo.getCodArticulo() + " del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido());
		}
		
		// Si la cantidad recepcionada es cero hay rotura de servicio
		if (articulo.getCantidadRecepcionada() == 0.0) {
			setEstadoLineaPedido(articulo, EstadosPedidosCompra.ESTADO_LINEA_RECEPCIONADA, EstadosPedidosCompra.SUBESTADO_NADA);
		}
		else {
			// Si no existe cantidad aceptada es una línea nueva así que se recepciona al completo
			if(articulo.getCantidadAceptada() == null) {
				setEstadoLineaPedido(articulo, EstadosPedidosCompra.ESTADO_LINEA_RECEPCIONADA, EstadosPedidosCompra.SUBESTADO_COMPLETO);
			}
			else {
				// Comprobar que las unidades sean del mismo signo
				if((articulo.getCantidadAceptada() > 0 && articulo.getCantidadRecepcionada() < 0)
						|| (articulo.getCantidadAceptada() < 0 && articulo.getCantidadRecepcionada() > 0)) {
					throw new ArticuloPedidoCompraConstraintViolationException("Se han especificado unidades recepcionadas de distinto signo que las aceptadas para el artículo " + articulo.getCodArticulo() + " del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido());
				}
				
				// Si la cantidad recepcionada es mayor que la aceptada, lanzar error
				if(Math.abs(articulo.getCantidadRecepcionada()) > Math.abs(articulo.getCantidadAceptada())) {
					throw new ArticuloPedidoCompraConstraintViolationException("Se han especificado unidades recepcionadas mayores que las aceptadas para el artículo " + articulo.getCodArticulo() + " del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido());
				}
				
				// Si ambas cantidades son iguales, recepcionar la línea al completo
				if(articulo.getCantidadRecepcionada().equals(articulo.getCantidadAceptada())) {
					setEstadoLineaPedido(articulo, EstadosPedidosCompra.ESTADO_LINEA_RECEPCIONADA, EstadosPedidosCompra.SUBESTADO_COMPLETO);
				}
				else {  // si no la línea se recepcionar parcialmente, porque la cantidad aceptada es menor que la solicitada
					setEstadoLineaPedido(articulo, EstadosPedidosCompra.ESTADO_LINEA_RECEPCIONADA, EstadosPedidosCompra.SUBESTADO_PARCIAL);
				}
			}
		}
	}
	
	
	/**
	 * Mueve las cantidades aceptadas a recepcionadas de aquellas líneas no rechazadas
	 * 
	 * @throws PedidoCompraException
	 * @throws ArticuloPedidoCompraConstraintViolationException
	 */
	public void recepcionarLineasCompleto() throws PedidoCompraException, ArticuloPedidoCompraConstraintViolationException {
		for(ArticuloPedidoCompraBean articulo : pedido.getArticulos()) {
			// Si la línea no está rechazada
			if (!isEstaLineaRechazada(articulo)) {
				articulo.setEstadoBean(Estado.MODIFICADO);
				
				articulo.setCantidadMedidaRecepcionada(articulo.getCantidadMedidaAceptada());
				articulo.setCantidadRecepcionada(articulo.getCantidadAceptada());
			}
		}
	}
	
	
	/**
	 * Comprueba a si la línea ha sido recepcionada (estado recepcionada)
	 * 
	 * @return
	 */
	public boolean isEstaLineaRecepcionada(ArticuloPedidoCompraBean articulo) {
		return articulo.getLineaEstado() == EstadosPedidosCompra.ESTADO_LINEA_RECEPCIONADA;
	}
	
	
	/**
	 * Establece a estado PENDIENTE ACEPT. la línea dada. Además
	 * elimina las cantidades sobrantes si se hubieran introducido para dejar la
	 * línea como estaba y actualiza el importe.
	 * 
	 * @param indice
	 * @throws PedidoCompraException
	 */
	public void setEstadoLineaRechazada(ArticuloPedidoCompraBean articulo) throws PedidoCompraException {
		articulo.setEstadoBean(Estado.MODIFICADO);
		
		// Antes de poner estado rechazado, eliminar las cantidades/unidades sobrantes
		if(isEstaLineaPendienteAceptacion(articulo)) {
			articulo.setCantidadMedidaAceptada(null);
			articulo.setCantidadAceptada(null);
		}
		else if(isEstaLineaPendienteRecepcion(articulo)) {
			articulo.setCantidadMedidaRecepcionada(null);
			articulo.setCantidadRecepcionada(null);
		}
		
		// Establacemos el estado de la línea, calculamos el importe de la misma y la del pedido
		setEstadoLineaPedido(articulo, EstadosPedidosCompra.ESTADO_LINEA_RECHAZADA, EstadosPedidosCompra.SUBESTADO_COMPLETO);
		articulo.calcularImporte();
		calcularTotales();
	}
	/**
	 * Establece a estado RECHAZADA cada una de las líneas del pedido.
	 * 
	 * @throws PedidoCompraException
	 */
	public void rechazarLineasCompleto() throws PedidoCompraException {
		for(ArticuloPedidoCompraBean articulo : pedido.getArticulos()) {
			setEstadoLineaRechazada(articulo);
		}
	}
	/**
	 * Comprueba a si la línea ha sido rechazada
	 * 
	 * @return
	 */
	public boolean isEstaLineaRechazada(ArticuloPedidoCompraBean articulo) {
		return articulo.getLineaEstado() != null && articulo.getLineaEstado() == EstadosPedidosCompra.ESTADO_LINEA_RECHAZADA;
	}
	
	
	/**
	 * Este método tiene la lógica para saber qué hacer cuando se quiere eliminar una línea:
	 * Si la línea ya estaba rechazada no se hace nada.
	 * Si la línea es nueva se elimina directamente de la lista.
	 * Si la línea la introdujo un usuario que está aceptado o recepcionando un pedido, se pondrá en estado borrado.
	 * Por último, se establecerá estado rechazado a la línea ya que no puede ser modificada de ningún modo.
	 * 
	 * @param indice
	 * @return
	 * @throws PedidoCompraException 
	 */
	public void eliminarLineaPedido(Integer indice) throws PedidoCompraException {
		ArticuloPedidoCompraBean articulo = pedido.getArticulo(indice);
		
		// Si la línea ya estaba rechazada no hacer nada
		if (!isEstaLineaRechazada(articulo)) {
			// Si el artículo es nuevo eliminarlo directamente de la lista
			if (articulo.isEstadoNuevo()) {
				pedido.getArticulos().remove(articulo);
			}
			/*
			 * Si el pedido está en solicitud o 
			 * si el pedido está solicitado y no existe cantidad solicitada o 
			 * si el pedido está aceptado y no existe cantidad aceptada establecer estado BORRADO
			 */
			else if(isEstaSolicitud() 
					|| (isEstaPendienteAceptacion() && articulo.getCantidadSolicitada() == null) 
					|| (isEstaPendienteRecepcion() &&  articulo.getCantidadAceptada() == null)) {
				articulo.borrar();
			}
			// Si no se cumplió nada de lo anterior rechazarlo ya que la línea no puede ser eliminada
			else {
				setEstadoLineaRechazada(articulo);
			}
		}
	}
	
	public String getDesTratamientoImpuestos() {
		return pedido.getDesTratamientoImpuestos();
	}
	
	public void setDesTratamientoImpuestos(String desTratamientoImpuestos) {
		pedido.setDesTratamientoImpuestos(desTratamientoImpuestos);
	}
}
