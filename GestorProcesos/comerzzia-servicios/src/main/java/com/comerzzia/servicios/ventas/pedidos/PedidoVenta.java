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

package com.comerzzia.servicios.ventas.pedidos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.estados.EstadoBean;
import com.comerzzia.persistencia.core.estados.Estados;
import com.comerzzia.persistencia.core.estados.EstadosSubestados;
import com.comerzzia.persistencia.core.impuestos.ILineaDocumento;
import com.comerzzia.persistencia.core.impuestos.ImpuestoException;
import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.grupos.GrupoImpuestosBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.conceptoalmacenes.ConceptoAlmacenBean;
import com.comerzzia.persistencia.ventas.pedidos.EstadosPedidosVenta;
import com.comerzzia.persistencia.ventas.pedidos.PedidoVentaBean;
import com.comerzzia.persistencia.ventas.pedidos.articulos.ArticuloPedidoVentaBean;
import com.comerzzia.persistencia.ventas.pedidos.pagos.PagoPedidoVentaBean;
import com.comerzzia.servicios.core.estados.EstadoException;
import com.comerzzia.servicios.core.estados.ServicioEstados;
import com.comerzzia.servicios.core.impuestos.ServicioImpuestos;
import com.comerzzia.servicios.core.impuestos.grupos.ServicioGruposImpuestos;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajesImpuestosBean;
import com.comerzzia.servicios.core.impuestos.porcentajes.ServicioPorcentajesImpuestos;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.servicios.general.conceptoalmacenes.ServicioConceptoAlmacenes;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVentaException;
import com.comerzzia.servicios.ventas.pedidos.articulos.ArticuloPedidoVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.pedidos.pagos.PagoPedidoVentaConstraintViolationException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.numeros.Numero;

public class PedidoVenta extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1811631536224716131L;
	
	private PedidoVentaBean pedido = null;
	private ConceptoAlmacenBean conceptoAlmacen = null;
	private PorcentajesImpuestosBean porcentajesImpuestos = null;
	private ClienteBean cliente = null;
	private Estados estadosEmisor = null;
	private Estados estadosReceptor = null;
	private EstadosSubestados estadosLineas = null;
	private Double totalPagos = 0.0;
	private Double restantePagos = 0.0;
	
	public PedidoVenta() {
		this.pedido = new PedidoVentaBean();
	}
	public PedidoVenta(PedidoVentaBean pedido) {
		this.pedido = pedido;
		
		try {
			setPorcentajesImpuestos();
		}
		catch (Exception ignore) {
		}
	}
	
	
	protected void initNuevoBean() {
	}
	
	
	protected PedidoVentaBean getBean() {
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
	
	
	public void setConceptoAlmacen(String codConceptoAlmacen, String codAlmacen, DatosSesionBean datosSesion) throws PedidoVentaException, PedidoVentaConstraintViolationException {
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
				
				//Si el concepto de almacén tiene almacén de origen actualizamos los valores del almacén
				AlmacenBean almacen = null;
				if(conceptoAlmacen.getCodAlm_origen() != null) {
					almacen = ServicioAlmacenes.consultar(conceptoAlmacen.getCodAlm_origen(), datosSesion);
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
				throw new PedidoVentaException(e.getMessage(), e);
			}
		}
		
		// Si el cliente es una tienda, evitar que su almacén sea el mismo que el almacén seleccionado
		if(cliente.isEsTienda() && cliente.getCodAlmacenTienda().equals(codAlmacen)) {
			throw new PedidoVentaConstraintViolationException("El almacén del cliente es el mismo que el del almacén seleccionado. Modifique alguno de los valores introducidos.");
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
	 * @throws PedidoVentaException
	 */
	public void setFecha(Date fecha) throws PedidoVentaException {
		// Si la fecha no es la misma que la que tiene el pedido
		if (pedido.getFecha() == null || !pedido.getFecha().equals(fecha)) {
			// Obtenemos el grupo de impuestos activos para la fecha
			GrupoImpuestosBean grupoImpuestos;
			try {
				grupoImpuestos = ServicioGruposImpuestos.consultar(fecha);
			} 
			catch (Exception e) {
				throw new PedidoVentaException("Error al obtener el grupo de impuestos activos: " + e.getMessage(), e);
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
					throw new PedidoVentaException("No se puede cambiar la fecha del pedido " 
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
	
	
	public String getCodCliente() {
		return pedido.getCodCliente();
	}
	
	
	public String getDesCliente() {
		return pedido.getDesCliente();
	}
	public void setDesCliente(String desCliente) {
		pedido.setDesCliente(desCliente);
	}
	
	
	public ClienteBean getCliente() {
		return cliente;
	}
	public void setCliente(ClienteBean cliente) {
		this.cliente = cliente;
	}
	
	
	/**
	 * Establece el cliente del pedido y el tratamiento de impuestos según el del cliente
	 * No se podrá cambiar el cliente de un pedido si este tiene artículos
	 * @param codCliente
	 * @param datosSesion
	 * @throws AlbaranVentaException
	 */
	public void setCliente(String codCliente, DatosSesionBean datosSesion) throws PedidoVentaException {
		// Si hay un cambio de cliente o el cliente está vacío
		if (cliente == null || pedido.getCodCliente() == null || !pedido.getCodCliente().equals(codCliente)) {

			// Obtenemos los datos del cliente y su tratamiento de impuestos
			try {
				cliente = ServicioClientes.consultar(codCliente, datosSesion);
				
				// El cliente sólo se establece cuando el pedido es nuevo y no tiene artículos
				if (pedido.getEstadoBean() == Estado.NUEVO
						&& pedido.getArticulos().size() == 0) {
					pedido.setCodCliente(cliente.getCodCli());
					pedido.setDesCliente(cliente.getDesCli());
					pedido.setIdTratamientoImpuestos(cliente.getIdTratImp());
					this.porcentajesImpuestos = null;
					
					calcularTotales();
				}
			}
			catch (Exception e) {
				throw new PedidoVentaException(e.getMessage(), e);
			}
		}
	}
	
	
	public Estados getEstadosEmisor() {
		return estadosEmisor;
	}
	public void setEstadosEmisor(Estados estadosEmisor) {
		this.estadosEmisor = estadosEmisor;
	}
	
	
	public Estados getEstadosReceptor() {
		return estadosReceptor;
	}
	public void setEstadosReceptor(Estados estadosReceptor) {
		this.estadosReceptor = estadosReceptor;
	}
	
	
	public EstadosSubestados getEstadosLineas() {
		return estadosLineas;
	}
	public void setEstadosLineas(EstadosSubestados estadosLineas) {
		this.estadosLineas = estadosLineas;
	}
	
	
	public String getCodTarifa() {
		return pedido.getCodTarifa();
	}
	public void setCodTarifa(String codTarifa) {
		pedido.setCodTarifa(codTarifa);
	}
	
	
	public String getDesTarifa() {
		return pedido.getDesTarifa();
	}
	public void setDesTarifa(String desTarifa) {
		pedido.setDesTarifa(desTarifa);
	}
	
	
	public String getPersonaContacto() {
		return pedido.getPersonaContacto();
	}
	public void setPersonaContacto(String personaContacto) {
		pedido.setPersonaContacto(personaContacto);
	}
	
	
	public String getReferenciaCliente() {
		return pedido.getReferenciaCliente();
	}
	public void setReferenciaCliente(String referenciaCliente) {
		pedido.setReferenciaCliente(referenciaCliente);
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
	
	
	public String getDesEstadoReceptor() {
		return pedido.getDesEstadoReceptor();
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
	
	
	
	
	public void setIdTipoPorte(Long idTipoPorte) {
		pedido.setIdTipoPorte(idTipoPorte);
	}

	public List<ArticuloPedidoVentaBean> getArticulos() {
		return pedido.getArticulos();
	}
	public void setArticulos(List<ArticuloPedidoVentaBean> listaArticulos) {
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
	
	
	public List<PagoPedidoVentaBean> getPagos() {
		return pedido.getPagos();
	}
	public void setPagos(List<PagoPedidoVentaBean> pagos) {
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
	
	
	public void calcularTotales() throws PedidoVentaException {
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
	
	
	private ImpuestosBean calcularImpuestos() throws PedidoVentaException {
		try {
			// Obtenemos la lista de artículos no barrados del pedido y no rechazados
			List<ILineaDocumento> articulos = new ArrayList<ILineaDocumento>();
			for (ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
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
			throw new PedidoVentaException("Error calculando totales del pedido de ventas" + e.getMessage(), e);
		} 
		catch (PorcentajeImpuestoException e) {
			throw new PedidoVentaException("Error calculando totales del pedido de ventas" + e.getMessage(), e);
		}
	}
	
	
	// TODO: utilizar este método siempre para obtener los porcentajes de impuestos
	//       repasar su utilización en el constructor
	private void setPorcentajesImpuestos() throws PedidoVentaException {
		try {
			if (pedido.getIdGrupoImpuestos() != null && pedido.getIdTratamientoImpuestos() != null) {
				this.porcentajesImpuestos = ServicioPorcentajesImpuestos.consultar(
						pedido.getIdGrupoImpuestos(), pedido.getIdTratamientoImpuestos());
			}
		}
		catch (PorcentajeImpuestoException e) {
			throw new PedidoVentaException("Error obteniendo porcentajes de impuestos para el albarán de compras" + e.getMessage(), e);
		}
	}
	
	
	public void calcularTotalesPagos() {
		// Inicializar las cantidades
		totalPagos = 0.0;
		restantePagos = 0.0;
		
		for (PagoPedidoVentaBean pago : pedido.getPagos()) {
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
	public boolean checkTotales() throws PedidoVentaException {
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
	 * @throws PagoPedidoVentaConstraintViolationException 
	 */
	public void checkTotalesPagos() throws PagoPedidoVentaConstraintViolationException {
		// Calcular los pagos primero
		calcularTotalesPagos();
		
		if (Math.abs(totalPagos) > Math.abs(pedido.getTotal())) {
			throw new PagoPedidoVentaConstraintViolationException("El importe total de los pagos es superior al importe del pedido");
		}
	}
	
	
	public void checkPedidoPuedeModificarse() throws PedidoVentaConstraintViolationException {
		if (pedido.getEstado() == EstadosPedidosVenta.ESTADO_EMISOR_PREPARADO ||
				pedido.getEstado() == EstadosPedidosVenta.ESTADO_EMISOR_SERVIDO ||
				pedido.getEstado() == EstadosPedidosVenta.ESTADO_EMISOR_RECHAZADO) {
			String mensaje = null;
			
			switch (pedido.getEstado()) {
				case EstadosPedidosVenta.ESTADO_EMISOR_PREPARADO:
					mensaje = "El pedido ya está preparado";
					break;
				
				case EstadosPedidosVenta.ESTADO_EMISOR_SERVIDO:
					mensaje = "El pedido ya está servido";
					break;
				
				case EstadosPedidosVenta.ESTADO_EMISOR_RECHAZADO:
					mensaje = "El pedido está rechazado";
					break;
			}
			
			throw new PedidoVentaConstraintViolationException(mensaje);
		}
	}
	
	
	public void checkPedidoPuedeBorrarse() throws PedidoVentaConstraintViolationException {
		// Mismas comprobaciones que para saber si es editable, por eso la llamada
		checkPedidoPuedeModificarse();
	}
	
	
	public void checkPedidoPuedeConfirmarse() throws PedidoVentaConstraintViolationException {
		if (!isEstaSolicitud()) {
			throw new PedidoVentaConstraintViolationException("El estado del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido() + " no permite su confirmación");
		}
	}
	
	
	public void checkPedidoPuedeAceptarse() throws PedidoVentaConstraintViolationException {
		if (!isEstaPendienteAceptacion()) {
			throw new PedidoVentaConstraintViolationException("El estado del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido() + " no permite su aceptación");
		}
	}
	
	
	public void checkPedidoPuedePrepararse() throws PedidoVentaConstraintViolationException {
		if (!isEstaPendientePreparacion()) {
			throw new PedidoVentaConstraintViolationException("El estado del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido() + " no permite su preparación");
		}
	}
	
	
	public void checkPedidoPuedeServirse() throws PedidoVentaConstraintViolationException {
		if (!isEstaPreparado()) {
			throw new PedidoVentaConstraintViolationException("El estado del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido() + " no permite que sea servido");
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
	 * @throws PedidoVentaException
	 * @throws PagoPedidoVentaConstraintViolationException
	 */
	public PedidoVenta generarPedidoFaltas(DatosSesionBean datosSesion, PedidoVenta pedidoOrigen, Date fechaSuministro) throws PedidoVentaException {
		try {
			PedidoVenta pedidoFaltas = new PedidoVenta();
			pedidoFaltas.setEstadoBean(Estado.NUEVO);
			// Hacer una copia superficial del bean con los valores necesarios
			pedidoFaltas.getBean().setCodEmpresa(pedidoOrigen.getCodEmpresa());
			pedidoFaltas.getBean().setPeriodo(new Integer(Fechas.año()).shortValue());
			pedidoFaltas.getBean().setCodSerie(pedidoOrigen.getCodSerie());
			pedidoFaltas.getBean().setFecha(new Date());
			pedidoFaltas.getBean().setFechaSuministroPrevista(fechaSuministro);
			pedidoFaltas.getBean().setCodAlmacen(pedidoOrigen.getCodAlmacen());
			pedidoFaltas.getBean().setCodConceptoAlmacen(pedidoOrigen.getCodConceptoAlmacen());
			pedidoFaltas.getBean().setCodCliente(pedidoOrigen.getCodCliente());
			pedidoFaltas.getBean().setCodTarifa(pedidoOrigen.getCodTarifa());
			pedidoFaltas.getBean().setPersonaContacto(pedidoOrigen.getPersonaContacto());
			pedidoFaltas.getBean().setReferenciaCliente(pedidoOrigen.getReferenciaCliente());
			pedidoFaltas.getBean().setObservaciones(pedidoOrigen.getObservaciones());
			pedidoFaltas.getBean().setIdGrupoImpuestos(pedidoOrigen.getIdGrupoImpuestos());
			pedidoFaltas.getBean().setIdTratamientoImpuestos(pedidoOrigen.getIdTratamientoImpuestos());
			// Establecer objetos del pedido (también los conjuntos de estados para que no sean consultados cuando se necesitem)
			pedidoFaltas.setConceptoAlmacen(pedidoOrigen.getConceptoAlmacen());
			pedidoFaltas.setCliente(pedidoOrigen.getCliente());
			pedidoFaltas.setEstadosEmisor(pedidoOrigen.getEstadosEmisor());
			pedidoFaltas.setEstadosReceptor(pedidoOrigen.getEstadosReceptor());
			pedidoFaltas.setEstadosLineas(pedidoOrigen.getEstadosLineas());
			
			for(ArticuloPedidoVentaBean articuloPedidoOrigen : pedidoOrigen.getArticulos()) {
				// La línea tiene que estar servida parcial o nada
				if(isEstaLineaServida(articuloPedidoOrigen) 
						&& (articuloPedidoOrigen.getLineaSubEstado() == EstadosPedidosVenta.SUBESTADO_PARCIAL || 
								articuloPedidoOrigen.getLineaSubEstado() == EstadosPedidosVenta.SUBESTADO_NADA)) {
					ArticuloPedidoVentaBean articuloPedidoFaltas = new ArticuloPedidoVentaBean();
					articuloPedidoFaltas.setEstadoBean(Estado.NUEVO);
					articuloPedidoFaltas.setCodArticulo(articuloPedidoOrigen.getCodArticulo());
					articuloPedidoFaltas.setDesglose1(articuloPedidoOrigen.getDesglose1());
					articuloPedidoFaltas.setDesglose2(articuloPedidoOrigen.getDesglose2());
					articuloPedidoFaltas.setDesArticulo(articuloPedidoOrigen.getDesArticulo());
					articuloPedidoFaltas.setDescripcionAmpliada(articuloPedidoOrigen.getDescripcionAmpliada());
					articuloPedidoFaltas.setUnidadMedida(articuloPedidoOrigen.getUnidadMedida());
					
					// Obtener la cantidad medida y la cantidad a partir de lo solicitado menos lo preparado
					Double cantidadMedida = null;
					Double cantidad = null;
					
					
					// Tomamos como cantidad para el nuevo pedido la diferencia entre la cantidad aceptada y la servida
					if(articuloPedidoOrigen.getCantidadMedidaAceptada() != null
							&& articuloPedidoOrigen.getCantidadMedidaPreparada() != null) {
						cantidadMedida = Math.abs(articuloPedidoOrigen.getCantidadMedidaAceptada()) - Math.abs(articuloPedidoOrigen.getCantidadMedidaPreparada());
					}
					
					cantidad = Math.abs(articuloPedidoOrigen.getCantidadAceptada()) - Math.abs(articuloPedidoOrigen.getCantidadPreparada());
					
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
			throw new PedidoVentaException("Error al generar pedido de faltas: " + e.getMessage(), e);
		}
	}
	
	
	//***** Métodos para los estados de la cabecera *****//
	
	private void setEstadoCabeceraPedido(Integer estado, Integer subEstado, Integer estadoReceptor, Integer subEstadoReceptor) throws PedidoVentaException {
		try {
			if(estadosEmisor == null) {
				estadosEmisor = ServicioEstados.consultar(EstadosPedidosVenta.ESTADO_EMISOR_PROCESO);
			}
			
			pedido.setEstado(estadosEmisor.getEstados().get(estado).getEstado());
			pedido.setSubEstado(subEstado);
			pedido.setDesEstado(estadosEmisor.getEstados().get(estado).getDesEstado());
			
			if(estadosReceptor == null) {
				estadosReceptor = ServicioEstados.consultar(EstadosPedidosVenta.ESTADO_RECEPTOR_PROCESO);
			}
			
			pedido.setEstadoReceptor(estadosReceptor.getEstados().get(estadoReceptor).getEstado());
			pedido.setSubEstadoReceptor(subEstadoReceptor);
			pedido.setDesEstadoReceptor(estadosReceptor.getEstados().get(estadoReceptor).getDesEstado());
			
			if(getEstadoBean() == Estado.SIN_MODIFICAR) {
				setEstadoBean(Estado.MODIFICADO);
			}
		}
		catch (EstadoException e) {
			throw new PedidoVentaException("Error obteniendo estados del pedido: " + e.getMessage());
		}
	}
	
	
	/**
	 * Establece el estado del pedido A SOLICITUD
	 */
	public void setEstadoSolicitud() throws PedidoVentaException {
		// Cambiar el estado en la cabecera
		setEstadoCabeceraPedido(EstadosPedidosVenta.ESTADO_EMISOR_SOLICITUD, EstadosPedidosVenta.SUBESTADO_COMPLETO, EstadosPedidosVenta.ESTADO_RECEPTOR_SOLICITUD, EstadosPedidosVenta.SUBESTADO_COMPLETO);
	}
	
	
	/**
	 * Comprueba a partir de la cabecera del pedido si éste se haya en estado SOLICITUD
	 * 
	 * @return
	 */
	public boolean isEstaSolicitud() {
		return (pedido.getEstado() != null && pedido.getEstado() == EstadosPedidosVenta.ESTADO_EMISOR_SOLICITUD);
	}
	
	
	/**
	 * Establece el estado del pedido PENDIENTE ACEPT.
	 */
	public void setEstadoPendienteAceptacion() throws PedidoVentaException {
		// Cambiar el estado en la cabecera
		setEstadoCabeceraPedido(EstadosPedidosVenta.ESTADO_EMISOR_PDTE_ACEPT, EstadosPedidosVenta.SUBESTADO_COMPLETO, EstadosPedidosVenta.ESTADO_RECEPTOR_PDTE_ACEPT, EstadosPedidosVenta.SUBESTADO_COMPLETO);
		
		// Cambiar el estado de las líneas
		for (ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
			setEstadoLineaPendienteAceptacion(articulo);
		}
	}
	
	
	/**
	 * Comprueba a partir de la cabecera del pedido si éste se haya en estado PENDIENTE ACEPT.
	 * 
	 * @return
	 */
	public boolean isEstaPendienteAceptacion() {
		return (pedido.getEstado() != null && pedido.getEstado() == EstadosPedidosVenta.ESTADO_EMISOR_PDTE_ACEPT);
	}
	
	
	/**
	 * Establece el estado del pedido completo a PENDIENTE ACEPT., aunque existe la posibilidad
	 * de que algunas líneas estén rechazadas o aceptadas parcialmente y por lo tanto el pedido quede aceptado parcialmente
	 * o bien que todas las líneas estén rechazadadas por lo que el pedido será rechazado al completo.
	 * 
	 * @throws PedidoVentaException
	 * @throws ArticuloPedidoVentaConstraintViolationException 
	 */
	public void setEstadoPendientePreparacion() throws PedidoVentaException, ArticuloPedidoVentaConstraintViolationException {
		Integer lineasAceptadasCompletas = 0;
		Integer lineasRechazadas = 0;
		
		// Recorrer la lista de artículos asignándole el estado correspondiente (si es posible)
		for(ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
			if(!isEstaLineaRechazada(articulo)) {
				// Establacemos el estado de la línea en función de la cantidad aceptada
				setEstadoLineaPendientePreparacion(articulo);
			}
			
			if (isEstaLineaRechazada(articulo)) {
				lineasRechazadas++;
			}
			else if (articulo.getLineaSubEstado() == EstadosPedidosVenta.SUBESTADO_COMPLETO) {
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
				setEstadoCabeceraPedido(EstadosPedidosVenta.ESTADO_EMISOR_PDTE_PREPARAC, EstadosPedidosVenta.SUBESTADO_COMPLETO, EstadosPedidosVenta.ESTADO_RECEPTOR_ACEPTADO, EstadosPedidosVenta.SUBESTADO_COMPLETO);
			}
			else {
				// Aceptado parcial
				setEstadoCabeceraPedido(EstadosPedidosVenta.ESTADO_EMISOR_PDTE_PREPARAC, EstadosPedidosVenta.SUBESTADO_PARCIAL, EstadosPedidosVenta.ESTADO_RECEPTOR_ACEPTADO, EstadosPedidosVenta.SUBESTADO_PARCIAL);
			}
		}
		
		// Actualizar los totales porque los importe de las líneas pueden haber cambiado 
		calcularTotales();
	}
	
	
	public boolean isEstaPendientePreparacion() {
		return pedido.getEstado() == EstadosPedidosVenta.ESTADO_EMISOR_PDTE_PREPARAC;
	}
	
	
	/**
	 * Establece el estado del pedido completo a PREPARADO, aunque existe la posibilidad
	 * de que algunas líneas estén rechazadas o preparadas parcialmente y por lo tanto el pedido quede preparado parcialmente
	 * o bien que todas las líneas estén rechazadadas por lo que el pedido será rechazado al completo.
	 * 
	 * @throws PedidoVentaException
	 * @throws ArticuloPedidoVentaConstraintViolationException 
	 */
	public void setEstadoPreparado() throws PedidoVentaException, ArticuloPedidoVentaConstraintViolationException {
		Integer lineasPreparadasCompletas = 0;
		Integer lineasRechazadas = 0;
		
		// Recorrer la lista de artículos asignándole el estado correspondiente (si es posible)
		for(ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
			if(!isEstaLineaRechazada(articulo)) {
				// Establacemos el estado de la línea en función de la cantidad preparada
				setEstadoLineaPreparada(articulo);
			}
			
			if (isEstaLineaRechazada(articulo)) {
				lineasRechazadas++;
			}
			else if (articulo.getLineaSubEstado() == EstadosPedidosVenta.SUBESTADO_COMPLETO) {
				lineasPreparadasCompletas++;
			}
			
			// Actualizar el importe con las cantidades aceptadas
			articulo.calcularImporte(); 
		}
		
		if(lineasRechazadas == pedido.getArticulos().size()) {
			// Rechazado completo
			setEstadoRechazado();
		}
		else {
			if(lineasPreparadasCompletas == pedido.getArticulos().size()) {
				// Preparado completo
				setEstadoCabeceraPedido(EstadosPedidosVenta.ESTADO_EMISOR_PREPARADO, EstadosPedidosVenta.SUBESTADO_COMPLETO, EstadosPedidosVenta.ESTADO_RECEPTOR_PDTE_RECEP, EstadosPedidosVenta.SUBESTADO_COMPLETO);
			}
			else {
				// Preparado parcial
				setEstadoCabeceraPedido(EstadosPedidosVenta.ESTADO_EMISOR_PREPARADO, EstadosPedidosVenta.SUBESTADO_PARCIAL, EstadosPedidosVenta.ESTADO_RECEPTOR_PDTE_RECEP, EstadosPedidosVenta.SUBESTADO_PARCIAL);
			}
		}
		
		// Actualizar los totales porque los importe de las líneas pueden haber cambiado 
		calcularTotales();
	}
	
	
	public boolean isEstaPreparado() {
		return pedido.getEstado() == EstadosPedidosVenta.ESTADO_EMISOR_PREPARADO;
	}
	
	
	public void setEstadoRechazado() throws PedidoVentaException {
		setEstadoCabeceraPedido(EstadosPedidosVenta.ESTADO_EMISOR_RECHAZADO, EstadosPedidosVenta.SUBESTADO_COMPLETO, EstadosPedidosVenta.ESTADO_RECEPTOR_RECHAZADO, EstadosPedidosVenta.SUBESTADO_COMPLETO);
	}
	
	
	public boolean isEstaRechazado() {
		return pedido.getEstado() == EstadosPedidosVenta.ESTADO_EMISOR_RECHAZADO;
	}
	
	
	public void setEstadoServido() throws PedidoVentaException {
		boolean servidoCompleto = true; // Control para saber si el pedido está servido al completo o no
		
		for(ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
			// Sólo cambiar el estado a las líneas que no estuvieran rechazadas con anterioridad 
			if(!isEstaLineaRechazada(articulo)) {
				setEstadoLineaServida(articulo);
				
				// Si no se ha dado con ninguna línea parcial y la línea es parcial el pedido ya no estará servido al completo
				if(servidoCompleto && articulo.getLineaSubEstado() == EstadosPedidosVenta.SUBESTADO_PARCIAL) {
					servidoCompleto = false;
				}
			}
			// Si no se ha dado con ninguna línea rechazada y la línea es rechazada el pedido ya no estará servido al completo
			else if(servidoCompleto) {
				servidoCompleto = false;
			}
		}
		
		if(servidoCompleto) {
			setEstadoCabeceraPedido(EstadosPedidosVenta.ESTADO_EMISOR_SERVIDO, EstadosPedidosVenta.SUBESTADO_COMPLETO, EstadosPedidosVenta.ESTADO_RECEPTOR_RECEPCIONADO, EstadosPedidosVenta.SUBESTADO_COMPLETO);
		}
		else {
			setEstadoCabeceraPedido(EstadosPedidosVenta.ESTADO_EMISOR_SERVIDO, EstadosPedidosVenta.SUBESTADO_PARCIAL, EstadosPedidosVenta.ESTADO_RECEPTOR_RECEPCIONADO, EstadosPedidosVenta.SUBESTADO_PARCIAL);
		}
	}
	public boolean isEstaServido() {
		return pedido.getEstado() == EstadosPedidosVenta.ESTADO_EMISOR_SERVIDO;
	}
	
	
	//***** Métodos para los estados de las líneas *****//
	
	
	public EstadosSubestados getConjuntoEstadosLineas() throws PedidoVentaException {
		try {
			if(estadosLineas == null) {
				estadosLineas = ServicioEstados.consultarSubestados(EstadosPedidosVenta.ESTADO_LINEA_PROCESO);
			}
			
			return estadosLineas;
		}
		catch (EstadoException e) {
			throw new PedidoVentaException("Error obteniendo estados y subestados del pedido: " + e.getMessage());
		}
	}
	
	
	/**
	 * Establece el estado de un artículo a partir de la instancia del objeto que representa
	 */
	private void setEstadoLineaPedido(ArticuloPedidoVentaBean articulo, Integer lineaEstado, Integer lineaSubEstado) throws PedidoVentaException {
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
	 * @throws PedidoVentaException
	 */
	public void setEstadoLineaSolicitada(ArticuloPedidoVentaBean articulo) throws PedidoVentaException {
		setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_SOLICITADA, EstadosPedidosVenta.SUBESTADO_COMPLETO);
	}
	
	
	/**
	 * Comprueba a si la línea ha sido SOLICITADA
	 * 
	 * @return
	 */
	public boolean isEstaLineaSolicitada(ArticuloPedidoVentaBean articulo) {
		return articulo.getLineaEstado() == EstadosPedidosVenta.ESTADO_LINEA_SOLICITADA;
	}
	
	
	/**
	 * Estable a estado PENDIENTE ACEPTACION la línea del artículo indicado
	 * 
	 * @param articulo
	 * @throws PedidoVentaException
	 */
	public void setEstadoLineaPendienteAceptacion(ArticuloPedidoVentaBean articulo) throws PedidoVentaException {
		setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_PDTE_ACEPT, EstadosPedidosVenta.SUBESTADO_COMPLETO);
	}
	
	
	/**
	 * Comprueba a si la línea está PENDIENTE ACEPTACION
	 * 
	 * @return
	 */
	public boolean isEstaLineaPendienteAceptacion(ArticuloPedidoVentaBean articulo) {
		return articulo.getLineaEstado() == EstadosPedidosVenta.ESTADO_LINEA_PDTE_ACEPT;
	}
	
	
	/**
	 * Establece a estado PENDIENTE ACEPT. la línea del artículo indicado si es posible,
	 * ya que en determinados casos la línea puede ser rechazada, aceptada (aunque parcialmente) o
	 * lanzar un error que terminaría la ejecución.
	 * 
	 * @param articulo
	 * @throws PedidoVentaException
	 * @throws ArticuloPedidoVentaConstraintViolationException 
	 */
	public void setEstadoLineaPendientePreparacion(ArticuloPedidoVentaBean articulo) throws PedidoVentaException, ArticuloPedidoVentaConstraintViolationException {
		// TODO: Revisar si es necesaria la condición --> Sólo si el pedido está pendiente de aceptación se realizarán comprobaciones
		if(isEstaPendienteAceptacion()) {
			// Si el artículo tiene unidad de medida alternativa, las unidades toman el valor de la cantidad medida
			if(articulo.isTieneUnidadMedidaAlternativa()) {
				articulo.setCantidadSolicitada(articulo.getCantidadMedidaSolicitada());
				articulo.setCantidadAceptada(articulo.getCantidadMedidaAceptada());
			}
			
			// Comprobar que se han especificado unidades aceptadas, pues es obligatorio
			if(articulo.getCantidadAceptada() == null) {
				throw new ArticuloPedidoVentaConstraintViolationException("No se han especificado unidades aceptadas para el artículo " + articulo.getCodArticulo() + " del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido());
			}
			
			// Si la cantidad aceptada es cero, rechazamos la línea
			if (articulo.getCantidadAceptada() == 0.0) {
				setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_RECHAZADA, EstadosPedidosVenta.SUBESTADO_COMPLETO);
			}
			else {
				// Si no existe cantidad solitada es venta directa y se acepta la línea completa
				if(articulo.getCantidadSolicitada() == null) {
					setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_PDTE_PREPARAC, EstadosPedidosVenta.SUBESTADO_COMPLETO);
				}
				else {
					// Comprobar que las unidades sean del mismo signo
					if((articulo.getCantidadSolicitada() > 0 && articulo.getCantidadAceptada() < 0)
							|| (articulo.getCantidadSolicitada() < 0 && articulo.getCantidadAceptada() > 0)) {
						throw new ArticuloPedidoVentaConstraintViolationException("Se han especificado unidades aceptadas de distinto signo que las solicitadas para el artículo " + articulo.getCodArticulo() + " del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido());
					}
					
					// Si la cantidad aceptada es mayor que la solicitada, así como en valor absoluto (signos), lanzar error
					if(Math.abs(articulo.getCantidadAceptada()) > Math.abs(articulo.getCantidadSolicitada())) {
						throw new ArticuloPedidoVentaConstraintViolationException("Se han especificado unidades aceptadas mayores que las solicitadas para el artículo " + articulo.getCodArticulo() + " del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido());
					}
					
					// Si ambas cantidades son iguales, aceptar la línea al completo
					if(articulo.getCantidadAceptada().equals(articulo.getCantidadSolicitada())) {
						setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_PDTE_PREPARAC, EstadosPedidosVenta.SUBESTADO_COMPLETO);
					}
					// Llegado este punto la línea se acepta parcialmente, porque la cantidad aceptada es menor que la solicitada
					else {
						setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_PDTE_PREPARAC, EstadosPedidosVenta.SUBESTADO_PARCIAL);
					}
				}
			}
		}
		else {
			setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_PDTE_PREPARAC, EstadosPedidosVenta.SUBESTADO_COMPLETO);
		}
	}
	
	
	/**
	 * Mueve las cantidades solicitadas a aceptadas actualizando el importe en cada línea sin cambiar el estado.
	 * 
	 * @throws PedidoVentaException
	 * @throws ArticuloPedidoVentaConstraintViolationException
	 */
	public void aceptarLineasCompleto() throws PedidoVentaException, ArticuloPedidoVentaConstraintViolationException {
		for(ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
			// Si la línea no está rechazada
			if (!isEstaLineaRechazada(articulo)) {
				articulo.setEstadoBean(Estado.MODIFICADO);
				
				articulo.setCantidadMedidaAceptada(articulo.getCantidadMedidaSolicitada());
				articulo.setCantidadAceptada(articulo.getCantidadSolicitada());
			}
		}
	}
	
	
	/**
	 * Comprueba a si la línea ha sido aceptada (estado PDTE. PREPARACION)
	 * 
	 * @return
	 */
	public boolean isEstaLineaPendientePreparacion(ArticuloPedidoVentaBean articulo) {
		return articulo.getLineaEstado() == EstadosPedidosVenta.ESTADO_LINEA_PDTE_PREPARAC;
	}
	
	
	/**
	 * Establece a estado PREPARADA la línea del artículo indicado si es posible,
	 * ya que en determinados casos la línea puede ser rechazada, preparada (aunque parcialmente) o
	 * lanzar un error que terminaría la ejecución.
	 * 
	 * @param articulo
	 * @throws PedidoVentaException
	 * @throws ArticuloPedidoVentaConstraintViolationException 
	 */
	public void setEstadoLineaPreparada(ArticuloPedidoVentaBean articulo) throws PedidoVentaException, ArticuloPedidoVentaConstraintViolationException {
		// Si el artículo tiene unidad de medida alternativa, las unidades toman el valor de la cantidad medida
		if(articulo.isTieneUnidadMedidaAlternativa()) {
			articulo.setCantidadAceptada(articulo.getCantidadMedidaAceptada());
			articulo.setCantidadPreparada(articulo.getCantidadMedidaPreparada());
		}
		
		// Comprobar que se han especificado unidades preparadas, pues es obligatorio
		if(articulo.getCantidadPreparada() == null) {
			throw new ArticuloPedidoVentaConstraintViolationException("No se han especificado unidades preparadas para el artículo " + articulo.getCodArticulo() + " del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido());
		}
		
		// Si la cantidad preparada es cero hay rotura de servicio
		if (articulo.getCantidadPreparada() == 0.0) {
			setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_PREPARADA, EstadosPedidosVenta.SUBESTADO_NADA);
		}
		else {
			// Si no existe cantidad aceptada es una línea nueva así que se prepara al completo
			if(articulo.getCantidadAceptada() == null) {
				setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_PREPARADA, EstadosPedidosVenta.SUBESTADO_COMPLETO);
			}
			else {
				// Comprobar que las unidades sean del mismo signo
				if((articulo.getCantidadAceptada() > 0 && articulo.getCantidadPreparada() < 0)
						|| (articulo.getCantidadAceptada() < 0 && articulo.getCantidadPreparada() > 0)) {
					throw new ArticuloPedidoVentaConstraintViolationException("Se han especificado unidades preparadas de distinto signo que las aceptadas para el artículo " + articulo.getCodArticulo() + " del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido());
				}
				
				// Si la cantidad preparada es mayor que la aceptada, lanzar error
				if(Math.abs(articulo.getCantidadPreparada()) > Math.abs(articulo.getCantidadAceptada())) {
					throw new ArticuloPedidoVentaConstraintViolationException("Se han especificado unidades preparadas mayores que las aceptadas para el artículo " + articulo.getCodArticulo() + " del pedido " + pedido.getPeriodo() + "/" + pedido.getCodSerie() + "/" + pedido.getNumPedido());
				}
				
				// Si ambas cantidades son iguales, preparar la línea al completo
				if(articulo.getCantidadPreparada().equals(articulo.getCantidadAceptada())) {
					setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_PREPARADA, EstadosPedidosVenta.SUBESTADO_COMPLETO);
				}
				else {  // si no la línea se prepara parcialmente, porque la cantidad aceptada es menor que la solicitada
					setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_PREPARADA, EstadosPedidosVenta.SUBESTADO_PARCIAL);
				}
			}
		}
	}
	
	
	/**
	 * Mueve las cantidades aceptadas a preparadas de aquellas líneas no rechazadas
	 * 
	 * @throws PedidoVentaException
	 * @throws ArticuloPedidoVentaConstraintViolationException
	 */
	public void prepararLineasCompleto() throws PedidoVentaException, ArticuloPedidoVentaConstraintViolationException {
		for(ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
			// Si la línea no está rechazada
			if (!isEstaLineaRechazada(articulo)) {
				articulo.setEstadoBean(Estado.MODIFICADO);
				
				articulo.setCantidadMedidaPreparada(articulo.getCantidadMedidaAceptada());
				articulo.setCantidadPreparada(articulo.getCantidadAceptada());
			}
		}
	}
	
	
	/**
	 * Comprueba a si la línea ha sido preparada (estado PREPARADA)
	 * 
	 * @return
	 */
	public boolean isEstaLineaPreparada(ArticuloPedidoVentaBean articulo) {
		return articulo.getLineaEstado() == EstadosPedidosVenta.ESTADO_LINEA_PREPARADA;
	}
	
	
	/**
	 * Establece a estado PENDIENTE ACEPT. la línea dada. Además
	 * elimina las cantidades sobrantes si se hubieran introducido para dejar la
	 * línea como estaba y actualiza el importe.
	 * 
	 * @param indice
	 * @throws PedidoVentaException
	 */
	public void setEstadoLineaRechazada(ArticuloPedidoVentaBean articulo) throws PedidoVentaException {
		articulo.setEstadoBean(Estado.MODIFICADO);
		
		// Antes de poner estado rechazado, eliminar las cantidades/unidades sobrantes
		if(isEstaLineaPendienteAceptacion(articulo)) {
			articulo.setCantidadMedidaAceptada(null);
			articulo.setCantidadAceptada(null);
		}
		else if(isEstaLineaPendientePreparacion(articulo)) {
			articulo.setCantidadMedidaPreparada(null);
			articulo.setCantidadPreparada(null);
		}
		
		// Establacemos el estado de la línea, calculamos el importe de la misma y la del pedido
		setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_RECHAZADA, EstadosPedidosVenta.SUBESTADO_COMPLETO);
		articulo.calcularImporte();
		calcularTotales();
	}
	/**
	 * Establece a estado RECHAZADA cada una de las líneas del pedido.
	 * 
	 * @throws PedidoVentaException
	 */
	public void rechazarLineasCompleto() throws PedidoVentaException {
		for(ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
			setEstadoLineaRechazada(articulo);
		}
	}
	/**
	 * Comprueba a si la línea ha sido rechazada
	 * 
	 * @return
	 */
	public boolean isEstaLineaRechazada(ArticuloPedidoVentaBean articulo) {
		return articulo.getLineaEstado() != null && articulo.getLineaEstado() == EstadosPedidosVenta.ESTADO_LINEA_RECHAZADA;
	}
	
	
	/**
	 * Estable a estado SERVIDA la línea del artículo indicado. Que sea complea o parcial
	 * dependerá del estado previo de la línea, por ejemplo, si estaba preparada completa también
	 * será servida completa.
	 * 
	 * @param indice
	 * @throws PedidoVentaException
	 */
	public void setEstadoLineaServida(ArticuloPedidoVentaBean articulo) throws PedidoVentaException {
		if(isEstaLineaPreparada(articulo)) {
			setEstadoLineaPedido(articulo, EstadosPedidosVenta.ESTADO_LINEA_SERVIDA, articulo.getLineaSubEstado());
		}
	}
	/**
	 * Comprueba a si la línea ha sido servida
	 * 
	 * @return
	 */
	public boolean isEstaLineaServida(ArticuloPedidoVentaBean articulo) {
		return articulo.getLineaEstado() == EstadosPedidosVenta.ESTADO_LINEA_SERVIDA;
	}
	
	
	/**
	 * Este método tiene la lógica para saber qué hacer cuando se quiere eliminar una línea:
	 * Si la línea ya estaba rechazada no se hace nada.
	 * Si la línea es nueva se elimina directamente de la lista.
	 * Si la línea la introdujo un usuario que está aceptado o preparando un pedido, se pondrá en estado borrado.
	 * Por último, se establecerá estado rechazado a la línea ya que no puede ser modificada de ningún modo.
	 * 
	 * @param indice
	 * @return
	 * @throws PedidoVentaException 
	 */
	public void eliminarLineaPedido(Integer indice) throws PedidoVentaException {
		ArticuloPedidoVentaBean articulo = pedido.getArticulo(indice);
		
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
					|| (isEstaPendientePreparacion() &&  articulo.getCantidadAceptada() == null)) {
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
	
	public String getUrlTracking() {
		return pedido.getUrlTracking();
	}
	
	public void setUrlTracking(String urlTracking) {
		pedido.setUrlTracking(urlTracking);
	}
}
