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

package com.comerzzia.servicios.compras.facturas;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.comerzzia.persistencia.compras.albaranes.pagos.PagoAlbaranCompraBean;
import com.comerzzia.persistencia.compras.facturas.FacturaCompraBean;
import com.comerzzia.persistencia.compras.facturas.detalle.DetalleFacturaCompraBean;
import com.comerzzia.persistencia.compras.facturas.pagos.PagoFacturaCompraBean;
import com.comerzzia.persistencia.compras.facturas.vencimientos.VencimientoFacturaCompraBean;
import com.comerzzia.persistencia.core.impuestos.ILineaDocumento;
import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.ImpuestoException;
import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.persistencia.general.facturas.vencimientos.VencimientoFacturaBean;
import com.comerzzia.persistencia.general.mediospago.MedioPagoBean;
import com.comerzzia.persistencia.general.mediospago.vencimientos.VencimientoBean;
import com.comerzzia.persistencia.general.proveedores.ProveedorBean;
import com.comerzzia.persistencia.tesoreria.tiposefectos.TipoEfectoBean;
import com.comerzzia.servicios.compras.albaranes.AlbaranCompra;
import com.comerzzia.servicios.core.impuestos.ServicioImpuestos;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajesImpuestosBean;
import com.comerzzia.servicios.core.impuestos.porcentajes.ServicioPorcentajesImpuestos;
import com.comerzzia.servicios.core.impuestos.tratamientosimpuestos.ServicioTratamientosImpuestos;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.facturas.vencimientos.ServicioVencimientosFacturas;
import com.comerzzia.servicios.general.mediospago.ServicioMediosPago;
import com.comerzzia.servicios.general.mediospago.vencimientos.ServicioVencimientos;
import com.comerzzia.servicios.general.proveedores.ServicioProveedores;
import com.comerzzia.servicios.tesoreria.tiposefectos.ServicioTiposEfectos;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.numeros.Numero;

public class FacturaCompra extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7422273242417684536L;

	protected FacturaCompraBean factura;

	private List<AlbaranCompra> albaranes = null;
	
	private ImpuestosBean detalleImpuestosAlbaranes = null;
	
	private PorcentajesImpuestosBean porcentajesImpuestos = null;
	
	public FacturaCompra() {
		this.factura = new FacturaCompraBean();
		this.albaranes = new ArrayList<AlbaranCompra>();
	}
	
	public FacturaCompra(FacturaCompraBean factura){
		this.factura = factura;
	}
	
	protected void initNuevoBean() {
	}
	
	/**
	 * Carga inicialmente los datos del proveedor en la factura
	 * @param codProveedor
	 * @param datosSesion
	 * @throws FacturaCompraException
	 */
	public void cargarDatosProveedor(String codProveedor, DatosSesionBean datosSesion) 
			throws FacturaCompraException {
		
		try{
			ProveedorBean proveedor = ServicioProveedores.consultar(codProveedor, datosSesion);
			factura.setCodProveedor(proveedor.getCodPro());
			factura.setDesProveedor(proveedor.getDesPro());
			factura.setDomicilio(proveedor.getDomicilio());
			factura.setPoblacion(proveedor.getPoblacion());
			factura.setProvincia(proveedor.getProvincia());
			factura.setCp(proveedor.getCp());
			factura.setCif(proveedor.getCif());
			factura.setPeriodo(new Integer(Fechas.año()).shortValue());
			factura.setFechaRecFactura(new Date());
		
		} 
		catch (Exception e) {
			throw new FacturaCompraException(e.getMessage(), e);
		}
	}
	
	/**
	 * Añade un albarán a la lista de albaranes seleccionados para conformar la factura.
	 * Comprueba que el albaran cumple los requisitos para poder formar parte de la factura.
	 * Establece el grupo de impuestos y el tratamiento de impuestos de la factura.
	 * @param albaran
	 * @throws ConformarFacturaException
	 */
	public void setAlbaran(AlbaranCompra albaran) throws ConformarFacturaException {		
		if(albaran.isFacturado())
			throw new ConformarFacturaException("El albarán " + albaran.getNumAlbaran() + " ya está facturado.");
		
		if(!albaran.getCodProveedor().equals(factura.getCodProveedor()))
			throw new ConformarFacturaException("El albarán " + albaran.getNumAlbaran() + " no pertenece al proveedor " + factura.getCodProveedor() + ".");
			
		if(getNumAlbaranes() > 0){
			if(albaranes.get(0).getIdGrupoImpuestos() != albaran.getIdGrupoImpuestos())
				throw new ConformarFacturaException("Los albaranes seleccionados deben tener el mismo grupo de impuestos.");
			if(albaranes.get(0).getIdTratamientoImpuestos() != albaran.getIdTratamientoImpuestos())
				throw new ConformarFacturaException("Los albaranes seleccionados deben tener el mismo tratamiento de impuestos.");
		
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
	 * @throws FacturaCompraException
	 */
	public void calcularSumaImpuestosAlbaranes() throws FacturaCompraException{
		try{
			List<ILineaDocumento> lineas = new ArrayList<ILineaDocumento>();
			for (AlbaranCompra albaran : albaranes){
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
				DetalleFacturaCompraBean detalleFactura = new DetalleFacturaCompraBean();
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
			throw new FacturaCompraException("Error calculando la suma de impuestos de los albaranes de compras" + e.getMessage(), e);
		} 
		
	}
	
	/**
	 * Calcula los impuestos de una linea de detalle de la factura
	 * @param detalleFactura
	 * @throws FacturaCompraException
	 */
	public void calculaImpuestosDetalle(DetalleFacturaCompraBean detalleFactura) throws FacturaCompraException{
		try{
			ImpuestosBean impuestos = ServicioImpuestos.calcularImpuesto(porcentajesImpuestos, detalleFactura);
			detalleFactura.setPrecio(impuestos.getBase());
			detalleFactura.setImpuestos(impuestos.getImpuestos());
		
		}
		catch (ImpuestoException e) {
			throw new FacturaCompraException("Error calculando impuestos del detalle de la factura del proveedor" + e.getMessage(), e);
		} 
	}
	
	/**
	 * Recalcula los impuestos de la factura
	 * @throws FacturaCompraException
	 */
	public void reCalculaImpuestos() throws FacturaCompraException{
		try{
			List<ILineaDocumento> lineas = new ArrayList<ILineaDocumento>();
			for (DetalleFacturaCompraBean detalleFactura : factura.getDetallesFactura()){
				lineas.add(detalleFactura);
			}
			ImpuestosBean impuestos = ServicioImpuestos.calcularImpuestos(getIdGrupoImpuestos(), getIdTratImpuestos(), lineas);
			factura.setDetalleImpuestos(impuestos);
			factura.setBase(impuestos.getBase());
			factura.setImpuestos(impuestos.getImpuestos());
			factura.setTotal(impuestos.getTotal());
		
			// Se inicializa a false para que se vuelva a inicializar el medio de pago del proveedor
			factura.setMediosPagoCargados(false);
		}
		catch (ImpuestoException e) {
			throw new FacturaCompraException("Error calculando el detalle de la factura del proveedor" + e.getMessage(), e);
		} 
	}
	
	/**
	 * Calcula los porcentajes de impuestos del grupo y tratamiento de impuestos de la factura
	 * @throws FacturaCompraException
	 */
	private void setPorcentajesImpuestos() throws FacturaCompraException {
		try {
			if (factura.getIdGrupoImpuestos() != null && factura.getIdTratImpuestos() != null) {
				this.porcentajesImpuestos = ServicioPorcentajesImpuestos.consultar(
						getIdGrupoImpuestos(), getIdTratImpuestos());
			}
		}
		catch (PorcentajeImpuestoException e) {
			throw new FacturaCompraException("Error obteniendo porcentajes de impuestos para el albarán de compras" + e.getMessage(), e);
		}
	}
	
	public boolean validarImportePagos(){
		double totalPagos = 0;
		for (PagoFacturaCompraBean medioPago : factura.getMediosPago()){
			totalPagos += medioPago.getImporte();
		}
		totalPagos = Numero.redondea(totalPagos, 2);
		if(totalPagos != factura.getTotal())
			return false;
		else
			return true;
	}
	
	public Double calcularDiferenciaImportePagos(){
		double totalPagos = 0;
		for (PagoFacturaCompraBean medioPago : factura.getMediosPago()){
			totalPagos += medioPago.getImporte();
		}
		totalPagos = Numero.redondea(totalPagos, 2);
		
		return factura.getTotal() - totalPagos;
	}

	@SuppressWarnings("unchecked")
	public void inicializaMediosPagoFactura(DatosSesionBean datosSesion) throws FacturaCompraException{
		try{
			//Inicializamos las variables que vamos a necesitar para contabilizar los pagos
			HashMap<Long, Double> contado = new HashMap<Long, Double>();
			HashMap<Long, PagoFacturaCompraBean> credito = new HashMap<Long, PagoFacturaCompraBean>();
			Double importeTotalPagos = 0D;
			
			//Inicializamos los medios de pago de la factura
			factura.setMediosPago(new ArrayList<PagoFacturaCompraBean>());

			//Recorremos la lista de albaranes
			for (AlbaranCompra albaran : getAlbaranes()) {
				
				//Recorremos los pagos del albarán
				for (PagoAlbaranCompraBean pagoAlbaranCompra : albaran.getPagos()) {
					
					//Obtenemos el vencimiento del pago del albarán de compra
					VencimientoBean vencimiento = ServicioVencimientos.consultar(pagoAlbaranCompra.getIdMedioPagoVencimiento(), datosSesion);
					
					//Obtenemos el medio de pago
					MedioPagoBean medioPago = ServicioMediosPago.consultar(vencimiento.getCodMedioPago(), datosSesion);
					
					//Si es contado y efectivo ó contado y tarjeta de crédito
					if(medioPago.isContado() && (medioPago.isEfectivo() || medioPago.isTarjetaCredito())){
						if(contado.containsKey(pagoAlbaranCompra.getIdMedioPagoVencimiento())){
							contado.put(pagoAlbaranCompra.getIdMedioPagoVencimiento(), contado.get(pagoAlbaranCompra.getIdMedioPagoVencimiento()) + pagoAlbaranCompra.getImporte());
						}
						else{
							contado.put(pagoAlbaranCompra.getIdMedioPagoVencimiento(), pagoAlbaranCompra.getImporte());
						}
					}
					else{
						PagoFacturaCompraBean pagoFacturaCompra = new PagoFacturaCompraBean();
						pagoFacturaCompra.setIdMedioPagoVencimiento(pagoAlbaranCompra.getIdMedioPagoVencimiento());
						pagoFacturaCompra.setDesMedioPagoVencimiento(pagoAlbaranCompra.getDesMedioPagoVencimiento());
						pagoFacturaCompra.setNumeroOperacion(Long.toString(albaran.getIdAlbaran()));
						pagoFacturaCompra.setImporte(pagoAlbaranCompra.getImporte());
						 
						credito.put(pagoAlbaranCompra.getIdMedioPagoVencimiento(), pagoFacturaCompra);
					}
				}
			}	
			
			//Medios de pago contado y efectivo ó tarjeta de crédito
			Iterator it = contado.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry e = (Map.Entry)it.next();
				PagoFacturaCompraBean pagoFacturaCompra = new PagoFacturaCompraBean();
				pagoFacturaCompra.setIdMedioPagoVencimiento((Long)e.getKey());
				pagoFacturaCompra.setDesMedioPagoVencimiento(ServicioVencimientos.consultar(pagoFacturaCompra.getIdMedioPagoVencimiento(), datosSesion).getDesVencimiento());
				pagoFacturaCompra.setImporte((Double)e.getValue());
				importeTotalPagos = importeTotalPagos + (Double)e.getValue();
				factura.addMedioPago(pagoFacturaCompra);
			}
	
			//Demás medios de pago
			it = credito.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry e = (Map.Entry)it.next();
				PagoFacturaCompraBean pagoFacturaCompra = (PagoFacturaCompraBean)e.getValue();
				importeTotalPagos = importeTotalPagos + pagoFacturaCompra.getImporte();
				factura.addMedioPago(pagoFacturaCompra);
			}
			
			//Medio de pago del proveedor
			if(Double.compare(factura.getTotal(), importeTotalPagos) != 0){
				//Obtenemos el proveedor
				ProveedorBean proveedor = ServicioProveedores.consultar(factura.getCodProveedor(), datosSesion);
				
				if (proveedor.getIdMedioPagoVencimiento()!=null) {
					PagoFacturaCompraBean pagoFacturaCompra = new PagoFacturaCompraBean();
					pagoFacturaCompra.setIdMedioPagoVencimiento(proveedor.getIdMedioPagoVencimiento());
					pagoFacturaCompra.setDesMedioPagoVencimiento(proveedor.getDesMedioPagoVencimiento());
					pagoFacturaCompra.setImporte(factura.getTotal() - importeTotalPagos);
		
					//Añadimos el medio de pago a la factura
					factura.addMedioPago(pagoFacturaCompra);
				}
			}
			
		}	
		catch (Exception e) {
			throw new FacturaCompraException(e.getMessage(), e);
		}
	}

	public void inicializaVencimientosFactura(DatosSesionBean datosSesion) throws FacturaCompraException{
		try{
			//Inicializamos los vencimientos de la factura
			factura.setVencimientos(new ArrayList<VencimientoFacturaCompraBean>());
			
			for (PagoFacturaCompraBean medioPagoCompra : factura.getMediosPago()) {
				//Obtengo el vencimiento para el medio de pago
				VencimientoBean vencimiento = ServicioVencimientos.consultar(medioPagoCompra.getIdMedioPagoVencimiento(), datosSesion);
				
				//Si tenemos vencimientos los insertamos
				if(vencimiento.isTieneVencimientos()){
					//Si tenemos vencimientos los calculamos y retornamos una lista de VencimientoFacturaBean 
					List<VencimientoFacturaBean> lstVencimientos = ServicioVencimientosFacturas.generarVencimientos(vencimiento, medioPagoCompra.getImporte(), factura.getFechaFacturaProveedor());
					 
					for (VencimientoFacturaBean vencimientoFactura : lstVencimientos) {
						//Crear el vencimiento
						VencimientoFacturaCompraBean vencimientoFacturaCompra = new VencimientoFacturaCompraBean(vencimientoFactura); 
						vencimientoFacturaCompra.setCodSerie(factura.getCodSerie());
						vencimientoFacturaCompra.setDocumento(factura.getNumFactura().toString());
						vencimientoFacturaCompra.setFechaFactura(factura.getFechaFacturaProveedor());
						vencimientoFacturaCompra.setFechaAlta(new Date());
						
						//Obtenemos los medios de pago para el vencimiento
						MedioPagoBean medioPagoBean = ServicioMediosPago.consultar(vencimiento.getCodMedioPago(), datosSesion);

						//Obtenemos los tipos de efecto
						TipoEfectoBean tipoEfecto = ServicioTiposEfectos.consultar(medioPagoBean.getCodTipoEfecto(), datosSesion);
						
						//Crear el documento del vencimiento
						vencimientoFacturaCompra.setCodEmpresa(factura.getCodEmpresa());
						vencimientoFacturaCompra.setCodProveedor(factura.getCodProveedor());
						vencimientoFacturaCompra.setCodTipoEfecto(tipoEfecto.getCodTipoEfecto());
						vencimientoFacturaCompra.setBorrado("N");
						
						factura.addVencimiento(vencimientoFacturaCompra);
					}
				}
			}
			
		}
		catch (Exception e) {
			throw new FacturaCompraException(e.getMessage(), e);
		}
	}

	protected FacturaCompraBean getBean() {
		return factura;
	}
	
	public List<AlbaranCompra> getAlbaranes(){
		return this.albaranes;
	}
	
	public ImpuestosBean getDetalleImpuestosAlbaranes() {
		return detalleImpuestosAlbaranes;
	}

	public int getNumAlbaranes(){
		return this.albaranes.size();
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

	public String getCodEmpresa() {
		return factura.getCodEmpresa();
	}

	public String getCodProveedor() {
		return factura.getCodProveedor();
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

	public String getDesProveedor() {
		return factura.getDesProveedor();
	}

	public String getDesSerie() {
		return factura.getDesSerie();
	}

	public String getDomicilio() {
		return factura.getDomicilio();
	}

	public int getEstadoBean() {
		return factura.getEstadoBean();
	}

	public Date getFechaFacturaProveedor() {
		return factura.getFechaFacturaProveedor();
	}

	public Date getFechaRecFactura() {
		return factura.getFechaRecFactura();
	}

	public Long getIdFacturaSop() {
		return factura.getIdFacturaSop();
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

	public boolean isEnEdicion() {
		return factura.isEnEdicion();
	}

	public boolean isEstadoBorrado() {
		return factura.isEstadoBorrado();
	}

	public boolean isEstadoNuevo() {
		return factura.isEstadoNuevo();
	}
	
	public void setIdFacturaSop(Long idFacturaSop) {
		factura.setIdFacturaSop(idFacturaSop);
	}

	public void setNumFactura(Long numFactura) {
		factura.setNumFactura(numFactura);
	}

	public void setEstadoBean(int estadoBean) {
		factura.setEstadoBean(estadoBean);
	}

	public void setActivo(boolean activo) {
		factura.setActivo(activo);
	}

	public void setActivo(String activo) {
		factura.setActivo(activo);
	}

	public void setCif(String cif) {
		factura.setCif(cif);
	}

	public void setCodProveedor(String codProveedor) {
		factura.setCodProveedor(codProveedor);
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

	public void setDesProveedor(String desProveedor) {
		factura.setDesProveedor(desProveedor);
	}

	public void setDesSerie(String desSerie) {
		factura.setDesSerie(desSerie);
	}

	public void setDomicilio(String domicilio) {
		factura.setDomicilio(domicilio);
	}

	public void setEnEdicion(boolean enEdicion) {
		factura.setEnEdicion(enEdicion);
	}

	public void setFechaRecFactura(Date fechaFactura) {
		factura.setFechaRecFactura(fechaFactura);
	}

	public void setFechaFacturaProveedor(Date fechaFacturaProveedor) {
		factura.setFechaFacturaProveedor(fechaFacturaProveedor);
	}

	public void setObservaciones(String observaciones) {
		factura.setObservaciones(observaciones);
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

	public ImpuestosBean getDetalleImpuestos() {
		return factura.getDetalleImpuestos();
	}

	public void setCodEmpresa(String codEmpresa) {
		factura.setCodEmpresa(codEmpresa);
	}

	public PorcentajesImpuestosBean getPorcentajesImpuestos() {
		return porcentajesImpuestos;
	}

	public String getDesTratImpuestos() {
		return factura.getDesTratImpuestos();
	}

	public List<DetalleFacturaCompraBean> getDetallesFactura() {
		return factura.getDetallesFactura();
	}

	public List<PagoFacturaCompraBean> getMediosPago() {
		return factura.getMediosPago();
	}

	public List<VencimientoFacturaCompraBean> getVencimientos() {
		return factura.getVencimientos();
	}

	public void setDetallesFactura(List<DetalleFacturaCompraBean> detallesFactura) {
		factura.setDetallesFactura(detallesFactura);
	}

	public void setMediosPago(List<PagoFacturaCompraBean> mediosPago) {
		factura.setMediosPago(mediosPago);
	}

	public boolean isDetalleImpuestosCargados() {
		return factura.isDetalleImpuestosCargados();
	}

	public boolean isDetallesFacturaCargados() {
		return factura.isDetallesFacturaCargados();
	}

	public boolean isMediosPagoCargados() {
		return factura.isMediosPagoCargados();
	}

	public void setDetalleImpuestosCargados(boolean detalleImpuestosCargados) {
		factura.setDetalleImpuestosCargados(detalleImpuestosCargados);
	}

	public void setDetallesFacturaCargados(boolean detallesFacturaCargados) {
		factura.setDetallesFacturaCargados(detallesFacturaCargados);
	}

	public void setMediosPagoCargados(boolean mediosPagoCargados) {
		factura.setMediosPagoCargados(mediosPagoCargados);
	}

	public Double getBaseDiferencia() {
		return Numero.redondea(getBase() - detalleImpuestosAlbaranes.getBase(), 2);
	}

	public Double getImpuestosDiferencia() {
		return Numero.redondea(getImpuestos() - detalleImpuestosAlbaranes.getImpuestos(), 2);
	}

	public Double getTotalDiferencia() {
		return Numero.redondea(getTotal() - detalleImpuestosAlbaranes.getTotal(), 2);
	}

	public void setIdVencimientoEnlace(Long idVencimientoEnlace) {
		factura.setIdVencimientoEnlace(idVencimientoEnlace);
	}

}
