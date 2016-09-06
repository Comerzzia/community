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

package com.comerzzia.servicios.ventas.facturas;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.comerzzia.persistencia.core.impuestos.ILineaDocumento;
import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.ImpuestoException;
import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.facturas.vencimientos.VencimientoFacturaBean;
import com.comerzzia.persistencia.general.mediospago.MedioPagoBean;
import com.comerzzia.persistencia.general.mediospago.vencimientos.VencimientoBean;
import com.comerzzia.persistencia.tesoreria.tiposefectos.TipoEfectoBean;
import com.comerzzia.persistencia.ventas.albaranes.pagos.PagoAlbaranVentaBean;
import com.comerzzia.persistencia.ventas.facturas.FacturaVentaBean;
import com.comerzzia.persistencia.ventas.facturas.detalle.DetalleFacturaVentaBean;
import com.comerzzia.persistencia.ventas.facturas.pagos.PagoFacturaVentaBean;
import com.comerzzia.persistencia.ventas.facturas.vencimientos.VencimientoFacturaVentaBean;
import com.comerzzia.servicios.core.impuestos.ServicioImpuestos;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajesImpuestosBean;
import com.comerzzia.servicios.core.impuestos.porcentajes.ServicioPorcentajesImpuestos;
import com.comerzzia.servicios.core.impuestos.tratamientosimpuestos.ServicioTratamientosImpuestos;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.servicios.general.facturas.vencimientos.ServicioVencimientosFacturas;
import com.comerzzia.servicios.general.mediospago.ServicioMediosPago;
import com.comerzzia.servicios.general.mediospago.vencimientos.ServicioVencimientos;
import com.comerzzia.servicios.tesoreria.tiposefectos.ServicioTiposEfectos;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVenta;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.numeros.Numero;

public class FacturaVenta extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7532743565205940508L;

	protected FacturaVentaBean factura;
	
	private List<AlbaranVenta> albaranes = null;

	private ImpuestosBean detalleImpuestosAlbaranes = null;

	private PorcentajesImpuestosBean porcentajesImpuestos = null;

	private Long idMedioPagoVencimiento = null;
	private String desMedioPagoVencimiento = null;
	
	public FacturaVenta() {
		this.factura = new FacturaVentaBean();
		this.albaranes = new ArrayList<AlbaranVenta>();
	}
	
	public FacturaVenta(FacturaVentaBean factura){
		this.factura = factura;
	}
	
	protected void initNuevoBean() {
	}

	/**
	 * Carga inicialmente los datos del cliente en la factura además de la fecha de la factura
	 * @param codCliente
	 * @param datosSesion
	 * @throws FacturaVentaException
	 */
	public void cargarDatosCliente(String codCliente, DatosSesionBean datosSesion) 
			throws FacturaVentaException {
		
		try{
			ClienteBean cliente = ServicioClientes.consultar(codCliente, datosSesion);
			factura.setCodCliente(cliente.getCodCli());
			factura.setDesCliente(cliente.getDesCli());
			factura.setDomicilio(cliente.getDomicilio());
			factura.setPoblacion(cliente.getPoblacion());
			factura.setProvincia(cliente.getProvincia());
			factura.setCp(cliente.getCp());
			factura.setCif(cliente.getCif());
			factura.setPeriodo(new Integer(Fechas.año()).shortValue());
			idMedioPagoVencimiento = cliente.getIdMedioPagoVencimiento();
			desMedioPagoVencimiento = cliente.getDesMedioPagoVencimiento();
			
		} 
		catch (Exception e) {
			throw new FacturaVentaException(e.getMessage(), e);
		}
	}

	/**
	 * Añade un albarán a la lista de albaranes seleccionados para la facturación de los albaranes.
	 * Comprueba que el albaran cumple los requisitos para poder formar parte de la factura.
	 * Establece el grupo de impuestos y el tratamiento de impuestos de la factura.
	 * @param albaran
	 * @throws FacturaVentaException
	 */
	public void setAlbaran(AlbaranVenta albaran) throws FacturarAlbaranVentaException {		
		if(albaran.isFacturado())
			throw new FacturarAlbaranVentaException("El albarán " + albaran.getNumAlbaran() + " ya está facturado.");
		
		if(!albaran.getCodCliente().equals(factura.getCodCliente()))
			throw new FacturarAlbaranVentaException("El albarán " + albaran.getNumAlbaran() + " no pertenece al cliente " + factura.getCodCliente() + ".");
			
		if(getNumAlbaranes() > 0){
			
			if(!albaranes.get(0).getIdGrupoImpuestos().equals(albaran.getIdGrupoImpuestos())){
				throw new FacturarAlbaranVentaException("Los albaranes seleccionados deben tener el mismo grupo de impuestos.");
			}		
			if(!albaranes.get(0).getIdTratamientoImpuestos().equals(albaran.getIdTratamientoImpuestos())){
				throw new FacturarAlbaranVentaException("Los albaranes seleccionados deben tener el mismo tratamiento de impuestos.");
			}
		
		}else{	
			factura.setIdGrupoImpuestos(albaran.getIdGrupoImpuestos());
			factura.setIdTratImpuestos(albaran.getIdTratamientoImpuestos());
			
			try {
				factura.setDesTratImpuestos(ServicioTratamientosImpuestos.consultar(albaran.getIdTratamientoImpuestos()).getDesTratImp());
			}
			catch (Exception ignore) {}
		}
		
		this.albaranes.add(albaran);
	}

	/**
	 * Calcula la suma de impuestos de los albaranes de la factura
	 * @throws FacturaVentaException
	 */
	public void calcularSumaImpuestosAlbaranes() throws FacturaVentaException{
		try{
			List<ILineaDocumento> lineas = new ArrayList<ILineaDocumento>();
			for (AlbaranVenta albaran : albaranes){
				for (ImpuestoBean impuesto : albaran.getDetalleImpuestos().getListaImpuestos()){
					lineas.add(impuesto);
				}
			}
			ImpuestosBean impuestos = ServicioImpuestos.calcularImpuestos(getIdGrupoImpuestos(), getIdTratImpuestos(), lineas);
			this.detalleImpuestosAlbaranes = impuestos;
			factura.setDetalleImpuestos(impuestos);
			
			try {
				setPorcentajesImpuestos();
			}
			catch (Exception ignore) {}
			
			for (ImpuestoBean impuesto : impuestos.getListaImpuestos()){
				DetalleFacturaVentaBean detalleFactura = new DetalleFacturaVentaBean();
				detalleFactura.setEstadoBean(Estado.NUEVO);
				detalleFactura.setCodImpuesto(impuesto.getCodImpuesto());
				detalleFactura.setDesImpuesto(porcentajesImpuestos.getPorcentajesImpuestos().get(impuesto.getCodImpuesto()).getDesImpuesto());
				detalleFactura.setPrecio(impuesto.getBase());
				detalleFactura.setImpuestos(impuesto.getImpuestos());
				factura.addDetalleFactura(detalleFactura);
			}
			
			factura.setBase(impuestos.getBase());
			factura.setImpuestos(impuestos.getImpuestos());
			factura.setTotal(impuestos.getTotal());
		
		}
		catch (ImpuestoException e) {
			throw new FacturaVentaException("Error calculando la suma de impuestos de los albaranes de ventas " + e.getMessage(), e);
		} 
		
	}

	/**
	 * Calcula los porcentajes de impuestos del grupo y tratamiento de impuestos de la factura
	 * @throws FacturaVentaException
	 */
	private void setPorcentajesImpuestos() throws FacturaVentaException {
		try {
			if (factura.getIdGrupoImpuestos() != null && factura.getIdTratImpuestos() != null) {
				this.porcentajesImpuestos = ServicioPorcentajesImpuestos.consultar(getIdGrupoImpuestos(), getIdTratImpuestos());
			}
		}
		catch (PorcentajeImpuestoException e) {
			throw new FacturaVentaException("Error obteniendo porcentajes de impuestos para el albarán de ventas " + e.getMessage(), e);
		}
	}

	public boolean validarImportePagos(){
		double totalPagos = 0;
		for (PagoFacturaVentaBean medioPago : factura.getMediosPago()){
			totalPagos += medioPago.getImporte();
		}
		totalPagos = Numero.redondea(totalPagos, 2);
		if(totalPagos != factura.getTotal())
			return false;
		else
			return true;
	}

	@SuppressWarnings("unchecked")
	public void inicializaMediosPagoFactura(DatosSesionBean datosSesion) throws FacturaVentaException{
		try{
			//Inicializamos las variables que vamos a necesitar para contabilizar los pagos
			HashMap<Long, Double> contado = new HashMap<Long, Double>();
			HashMap<Long, PagoFacturaVentaBean> credito = new HashMap<Long, PagoFacturaVentaBean>();
			Double importeTotalPagos = 0D;
			
			//Inicializamos los medios de pago de la factura
			factura.setMediosPago(new ArrayList<PagoFacturaVentaBean>());

			//Recorremos la lista de albaranes
			for (AlbaranVenta albaran : getAlbaranes()) {
				
				//Recorremos los pagos del albarán
				for (PagoAlbaranVentaBean pagoAlbaranVenta : albaran.getPagos()) {
					
					//Obtenemos el vencimiento del pago del albarán de venta
					VencimientoBean vencimiento = ServicioVencimientos.consultar(pagoAlbaranVenta.getIdMedioPagoVencimiento(), datosSesion);
					
					//Obtenemos el medio de pago
					MedioPagoBean medioPago = ServicioMediosPago.consultar(vencimiento.getCodMedioPago(), datosSesion);
					
					//Si es contado y efectivo ó contado y tarjeta de crédito
					if(medioPago.isContado() && (medioPago.isEfectivo() || medioPago.isTarjetaCredito())){
						if(contado.containsKey(pagoAlbaranVenta.getIdMedioPagoVencimiento())){
							contado.put(pagoAlbaranVenta.getIdMedioPagoVencimiento(), contado.get(pagoAlbaranVenta.getIdMedioPagoVencimiento()) + pagoAlbaranVenta.getImporte());
						}
						else{
							contado.put(pagoAlbaranVenta.getIdMedioPagoVencimiento(), pagoAlbaranVenta.getImporte());
						}
					}
					else{
						PagoFacturaVentaBean pagoFacturaVenta = new PagoFacturaVentaBean(); 
						pagoFacturaVenta.setIdMedioPagoVencimiento(pagoAlbaranVenta.getIdMedioPagoVencimiento());
						pagoFacturaVenta.setNumeroOperacion(Long.toString(albaran.getIdAlbaran()));
						pagoFacturaVenta.setImporte(pagoAlbaranVenta.getImporte());
						 
						credito.put(pagoAlbaranVenta.getIdMedioPagoVencimiento(), pagoFacturaVenta);
					}
				}
			}	
			
			//Medios de pago contado y efectivo ó tarjeta de crédito
			Iterator it = contado.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry e = (Map.Entry)it.next();
				PagoFacturaVentaBean pagoFacturaVenta = new PagoFacturaVentaBean();
				pagoFacturaVenta.setIdMedioPagoVencimiento((Long)e.getKey());
				pagoFacturaVenta.setImporte((Double)e.getValue());
				importeTotalPagos = importeTotalPagos + (Double)e.getValue();
				factura.addMedioPago(pagoFacturaVenta);
			}
	
			//Demás medios de pago
			it = credito.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry e = (Map.Entry)it.next();
				PagoFacturaVentaBean pagoFacturaVenta = (PagoFacturaVentaBean)e.getValue();
				importeTotalPagos = importeTotalPagos + pagoFacturaVenta.getImporte();
				factura.addMedioPago(pagoFacturaVenta);
			}
			
			//Medio de pago del cliente
			if(Double.compare(factura.getTotal(), importeTotalPagos) != 0){
				//Obtenemos el cliente
				ClienteBean cliente = ServicioClientes.consultar(factura.getCodCliente(), datosSesion);
				
				if (cliente.getIdMedioPagoVencimiento()!=null) {
					PagoFacturaVentaBean pagoFacturaVenta = new PagoFacturaVentaBean();
					pagoFacturaVenta.setIdMedioPagoVencimiento(cliente.getIdMedioPagoVencimiento());
					pagoFacturaVenta.setImporte(factura.getTotal() - importeTotalPagos);
		
					//Añadimos el medio de pago a la factura
					factura.addMedioPago(pagoFacturaVenta);
				}
			}
			
		}	
		catch (Exception e) {
			throw new FacturaVentaException(e.getMessage(), e);
		}
	}

	public void inicializaVencimientosFactura(DatosSesionBean datosSesion) throws FacturaVentaException{
		try{
			//Inicializamos los vencimientos de la factura
			factura.setVencimientos(new ArrayList<VencimientoFacturaVentaBean>());
			
			for (PagoFacturaVentaBean medioPagoVenta : factura.getMediosPago()) {
				//Obtengo el vencimiento para el medio de pago
				VencimientoBean vencimiento = ServicioVencimientos.consultar(medioPagoVenta.getIdMedioPagoVencimiento(), datosSesion);
				
				//Si tenemos vencimientos los insertamos
				if(vencimiento.isTieneVencimientos()){
					//Si tenemos vencimientos los calculamos y retornamos una lista de VencimientoFacturaBean 
					List<VencimientoFacturaBean> lstVencimientos = ServicioVencimientosFacturas.generarVencimientos(vencimiento, medioPagoVenta.getImporte(), factura.getFecha());
					 
					for (VencimientoFacturaBean vencimientoFactura : lstVencimientos) {
						//Crear el vencimiento
						VencimientoFacturaVentaBean vencimientoFacturaVenta = new VencimientoFacturaVentaBean(vencimientoFactura); 
						vencimientoFacturaVenta.setCodSerie(factura.getCodSerie());
						vencimientoFacturaVenta.setDocumento(factura.getNumFactura().toString());
						vencimientoFacturaVenta.setFechaFactura(factura.getFecha());
						vencimientoFacturaVenta.setFechaAlta(new Date());
						
						//Obtenemos los medios de pago para el vencimiento
						MedioPagoBean medioPagoBean = ServicioMediosPago.consultar(vencimiento.getCodMedioPago(), datosSesion);

						//Obtenemos los tipos de efecto
						TipoEfectoBean tipoEfecto = ServicioTiposEfectos.consultar(medioPagoBean.getCodTipoEfecto(), datosSesion);
						
						//Crear el documento del vencimiento
						vencimientoFacturaVenta.setCodEmpresa(factura.getCodEmpresa());
						vencimientoFacturaVenta.setCodCliente(factura.getCodCliente());
						vencimientoFacturaVenta.setCodTipoEfecto(tipoEfecto.getCodTipoEfecto());
						vencimientoFacturaVenta.setRemesable((tipoEfecto.isRemesable())? "S" : "N");
						if(tipoEfecto.isRemesable() && tipoEfecto.isEntradaDocumentoAutomatica()){
							vencimientoFacturaVenta.setFechaEntradaDocumento(vencimientoFacturaVenta.getFechaVencimiento());	
						}
						vencimientoFacturaVenta.setBorrado("N");
						
						factura.addVencimiento(vencimientoFacturaVenta);
					}
				}
			}
			
		}
		catch (Exception e) {
			throw new FacturaVentaException(e.getMessage(), e);
		}
	}
	
	public FacturaVentaBean getBean(){
		return factura;
	}
	
	public String getActivo() {
		return factura.getActivo();
	}

	public Double getBase() {
		return factura.getBase();
	}

	public String getCif() {
		return factura.getCif();
	}

	public String getCodCliente() {
		return factura.getCodCliente();
	}

	public String getCodEmpresa() {
		return factura.getCodEmpresa();
	}

	public String getCodSerie() {
		return factura.getCodSerie();
	}

	public String getConcepto() {
		return factura.getConcepto();
	}

	public String getCp() {
		return factura.getCp();
	}

	public String getDesCliente() {
		return factura.getDesCliente();
	}

	public String getDesSerie() {
		return factura.getDesSerie();
	}

	public ImpuestosBean getDetalleImpuestos() {
		return factura.getDetalleImpuestos();
	}

	public int getNumAlbaranes(){
		return this.albaranes.size();
	}

	public List<AlbaranVenta> getAlbaranes(){
		return this.albaranes;
	}

	public List<DetalleFacturaVentaBean> getDetallesFactura() {
		return factura.getDetallesFactura();
	}

	public String getDomicilio() {
		return factura.getDomicilio();
	}

	public int getEstadoBean() {
		return factura.getEstadoBean();
	}

	public Date getFecha() {
		return factura.getFecha();
	}

	public Long getIdFacturaRep() {
		return factura.getIdFacturaRep();
	}

	public Long getIdGrupoImpuestos() {
		return factura.getIdGrupoImpuestos();
	}

	public Long getIdTratImpuestos() {
		return factura.getIdTratImpuestos();
	}

	public Long getIdVencimientoEnlace() {
		return factura.getIdVencimientoEnlace();
	}

	public Double getImpuestos() {
		return factura.getImpuestos();
	}

	public List<PagoFacturaVentaBean> getMediosPago() {
		return factura.getMediosPago();
	}

	public List<VencimientoFacturaVentaBean> getVencimientos() {
		return factura.getVencimientos();
	}

	public int getNumDetalles() {
		return factura.getNumDetalles();
	}

	public Long getNumFactura() {
		return factura.getNumFactura();
	}

	public String getObservaciones() {
		return factura.getObservaciones();
	}

	public Short getPeriodo() {
		return factura.getPeriodo();
	}

	public String getPoblacion() {
		return factura.getPoblacion();
	}

	public String getProvincia() {
		return factura.getProvincia();
	}

	public String getReferencia() {
		return factura.getReferencia();
	}

	public Double getTotal() {
		return factura.getTotal();
	}

	public boolean isActivo() {
		return factura.isActivo();
	}

	public boolean isDetalleImpuestosCargados() {
		return factura.isDetalleImpuestosCargados();
	}

	public boolean isDetallesCargados() {
		return factura.isDetallesFacturaCargados();
	}

	public boolean isEnEdicion() {
		return factura.isEnEdicion();
	}

	public boolean isEstadoBorrado() {
		return factura.isEstadoBorrado();
	}

	public boolean isEstadoNuevo() {
		return factura.isEstadoNuevo();
	}

	public boolean isMediosPagoCargados() {
		return factura.isMediosPagoCargados();
	}

	public boolean isVencimientosCargados() {
		return factura.isVencimientosCargados();
	}

	public void setActivo(boolean activo) {
		factura.setActivo(activo);
	}

	public void setActivo(String activo) {
		factura.setActivo(activo);
	}

	public void setBase(Double base) {
		factura.setBase(base);
	}

	public void setCif(String cif) {
		factura.setCif(cif);
	}

	public void setCodCliente(String codCli) {
		factura.setCodCliente(codCli);
	}

	public void setCodEmpresa(String codEmp) {
		factura.setCodEmpresa(codEmp);
	}

	public void setCodSerie(String codSerie) {
		factura.setCodSerie(codSerie);
	}

	public void setConcepto(String concepto) {
		factura.setConcepto(concepto);
	}

	public void setCp(String cp) {
		factura.setCp(cp);
	}

	public void setDesCliente(String desCli) {
		factura.setDesCliente(desCli);
	}

	public void setDesSerie(String desSerie) {
		factura.setDesSerie(desSerie);
	}

	public void setDetalleImpuestos(ImpuestosBean detalleImpuestos) {
		factura.setDetalleImpuestos(detalleImpuestos);
	}

	public void setDetalleImpuestosCargados(boolean detalleImpuestosCargados) {
		factura.setDetalleImpuestosCargados(detalleImpuestosCargados);
	}

	public void setDetallesFactura(List<DetalleFacturaVentaBean> detallesFactura) {
		factura.setDetallesFactura(detallesFactura);
	}

	public void setDetallesCargados(boolean detallesCargados) {
		factura.setDetallesFacturaCargados(detallesCargados);
	}

	public void setDomicilio(String domicilio) {
		factura.setDomicilio(domicilio);
	}

	public void setEnEdicion(boolean enEdicion) {
		factura.setEnEdicion(enEdicion);
	}

	public void setEstadoBean(int estadoBean) {
		factura.setEstadoBean(estadoBean);
	}

	public void setFecha(Date fecha) {
		factura.setFecha(fecha);
	}

	public void setIdFacturaRep(Long idFacturaRep) {
		factura.setIdFacturaRep(idFacturaRep);
	}

	public void setIdGrupoImpuestos(Long idGrupoImpuestos) {
		factura.setIdGrupoImpuestos(idGrupoImpuestos);
	}

	public void setIdTratImpuestos(Long idTratImpuestos) {
		factura.setIdTratImpuestos(idTratImpuestos);
	}

	public void setIdVencimientoEnlace(Long idVencimientoEnlace) {
		factura.setIdVencimientoEnlace(idVencimientoEnlace);
	}

	public void setImpuestos(Double impuestos) {
		factura.setImpuestos(impuestos);
	}

	public void setMediosPago(List<PagoFacturaVentaBean> mediosPago) {
		factura.setMediosPago(mediosPago);
	}

	public void setMediosPagoCargados(boolean mediosPagoCargados) {
		factura.setMediosPagoCargados(mediosPagoCargados);
	}

	public void setNumFactura(Long numFac) {
		factura.setNumFactura(numFac);
	}

	public void setObservaciones(String observaciones) {
		factura.setObservaciones(observaciones);
	}

	public void setPeriodo(Short periodo) {
		factura.setPeriodo(periodo);
	}

	public void setPoblacion(String poblacion) {
		factura.setPoblacion(poblacion);
	}

	public void setProvincia(String provincia) {
		factura.setProvincia(provincia);
	}

	public void setReferencia(String referencia) {
		factura.setReferencia(referencia);
	}

	public void setTotal(Double total) {
		factura.setTotal(total);
	}

	public String getDesTratImpuestos() {
		return factura.getDesTratImpuestos();
	}

	public void setDesTratImpuestos(String desTratImpuestos) {
		factura.setDesTratImpuestos(desTratImpuestos);
	}
	
	public ImpuestosBean getDetalleImpuestosAlbaranes() {
		return detalleImpuestosAlbaranes;
	}

	public PorcentajesImpuestosBean getPorcentajesImpuestos() {
		return porcentajesImpuestos;
	}

	public Long getIdMedioPagoVencimiento() {
		return idMedioPagoVencimiento;
	}

	public void setIdMedioPagoVencimiento(Long idMedioPagoVencimiento) {
		this.idMedioPagoVencimiento = idMedioPagoVencimiento;
	}

	public String getDesMedioPagoVencimiento() {
		return desMedioPagoVencimiento;
	}

	public void setDesMedioPagoVencimiento(String desMedioPagoVencimiento) {
		this.desMedioPagoVencimiento = desMedioPagoVencimiento;
	}

}
