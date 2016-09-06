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

package com.comerzzia.servicios.tiendavirtual.pedidos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.mediospago.vencimientos.VencimientoBean;
import com.comerzzia.persistencia.tiendavirtual.articulos.ArticuloTiendaVirtualBean;
import com.comerzzia.persistencia.ventas.pedidos.PedidoVentaBean;
import com.comerzzia.persistencia.ventas.pedidos.articulos.ArticuloPedidoVentaBean;
import com.comerzzia.persistencia.ventas.pedidos.pagos.PagoPedidoVentaBean;
import com.comerzzia.servicios.general.mediospago.vencimientos.ServicioVencimientos;
import com.comerzzia.servicios.general.mediospago.vencimientos.VencimientoException;
import com.comerzzia.servicios.general.tiendas.ServicioTiendas;
import com.comerzzia.servicios.general.tiendas.Tienda;
import com.comerzzia.servicios.general.tiendas.TiendaException;
import com.comerzzia.servicios.general.tiendas.TiendaNotFoundException;
import com.comerzzia.servicios.tiendavirtual.cesta.ArticuloCestaBean;
import com.comerzzia.servicios.tiendavirtual.cesta.CestaBean;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.servicios.ventas.pedidos.PedidoVenta;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.ServicioPedidosVentas;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;

public class PedidoVentaTiendaVirtual {

	protected static Logger log = Logger.getMLogger(PedidoVentaTiendaVirtual.class);

	private Tienda tienda;
	private String codAlmacen;
	private Long idPedido;
	private PedidoVenta pedidoVenta;
	
	public PedidoVentaTiendaVirtual(){
	}
	
	public void crearCabeceraPedido(DatosSesionTiendaVirtualBean datosSesion, ClienteBean cliente) throws PedidoVentaTiendaVirtualException{
		try{
			this.codAlmacen = datosSesion.getConfigTiendaVirtual().getCodAlmacen();
			if (tienda == null){
				tienda = ServicioTiendas.consultar(codAlmacen, datosSesion.getDatosSesionEmpresa());
			}
			pedidoVenta = new PedidoVenta(new PedidoVentaBean());
			pedidoVenta.setEstadoBean(Estado.NUEVO);
			pedidoVenta.setActivo(true);
			pedidoVenta.setCliente(cliente.getCodCli(), datosSesion.getDatosSesionEmpresa());
			pedidoVenta.setCodAlmacen(codAlmacen);
			pedidoVenta.setCodConceptoAlmacen(tienda.getCodConceptoAlmacen());
			pedidoVenta.setCodEmpresa(tienda.getCodEmp());
			pedidoVenta.setCodSerie(codAlmacen);
			pedidoVenta.setCodTarifa(cliente.getCodTar()); 
			pedidoVenta.setPeriodo(new Integer(Fechas.año()).shortValue());
			pedidoVenta.setFecha(new Date());
			pedidoVenta.setEstadoSolicitud();
		}
		catch (TiendaNotFoundException e) {
			String msg = "No se ha encontrado la tienda para el código de almacén de la tienda virtual." + e.getMessage();
			log.error("generarPedidoVenta() - " + msg);
			throw new PedidoVentaTiendaVirtualException(msg, e);
		}
		catch (TiendaException e) {
			String msg = "Se ha producido un error consultando la tienda con código de almacén de la tienda virtual." + e.getMessage();
			log.error("generarPedidoVenta() - " + msg);
			throw new PedidoVentaTiendaVirtualException(msg, e);
		} 
		catch(PedidoVentaException e){
			throw new PedidoVentaTiendaVirtualException(e.getMessage(), e);
		} 
	}

	public void setLineasPedido(DatosSesionTiendaVirtualBean datosSesion, CestaBean cesta) throws PedidoVentaTiendaVirtualException{
		try{
			pedidoVenta.setArticulos(new ArrayList<ArticuloPedidoVentaBean>(cesta.getCantidadArticulos()));
			List<ArticuloCestaBean> articulosCesta = cesta.getListaArticulos();
			for (ArticuloCestaBean articuloCesta : articulosCesta) {
				ArticuloPedidoVentaBean articuloPedido = new ArticuloPedidoVentaBean();
				articuloPedido.setEstadoBean(Estado.NUEVO);
				pedidoVenta.setEstadoLineaSolicitada(articuloPedido);
				articuloPedido.setActivo(true);
				articuloPedido.setCodArticulo(articuloCesta.getArticulo().getCodArticulo());
				articuloPedido.setCodImpuesto(articuloCesta.getArticulo().getCodImpuesto());
				articuloPedido.setDesArticulo(articuloCesta.getArticulo().getDesArticulo());
				articuloPedido.setDescuento(0D); 
				articuloPedido.setDesglose1(articuloCesta.getArticulo().getDesglose1());
				articuloPedido.setDesglose2(articuloCesta.getArticulo().getDesglose2());
				articuloPedido.setPrecio(articuloCesta.getArticulo().getPrecioVenta());
				articuloPedido.setCantidadSolicitada(new Double(articuloCesta.getCantidad()));
				articuloPedido.calcularImporte();
				pedidoVenta.getArticulos().add(articuloPedido);
			}
			// establecemos los tipos de porte
			pedidoVenta.setIdTipoPorte(cesta.getIdTipoPortes());
			if (!cesta.isPortesGratuitos()){ 
				ArticuloTiendaVirtualBean articuloPortes = cesta.getArticuloPortes();
				ArticuloPedidoVentaBean articuloPedido = new ArticuloPedidoVentaBean();
				articuloPedido.setEstadoBean(Estado.NUEVO);
				pedidoVenta.setEstadoLineaSolicitada(articuloPedido);
				articuloPedido.setActivo(true);
				articuloPedido.setCodArticulo(articuloPortes.getCodArticulo());
				articuloPedido.setCodImpuesto(articuloPortes.getCodImpuesto());
				articuloPedido.setDesArticulo(articuloPortes.getDesArticulo());
				articuloPedido.setDescuento(0D); 
				articuloPedido.setDesglose1(articuloPortes.getDesglose1());
				articuloPedido.setDesglose2(articuloPortes.getDesglose2());
				articuloPedido.setPrecio(articuloPortes.getPrecioVenta());
				articuloPedido.setCantidadSolicitada(1D); 
				articuloPedido.calcularImporte();
				pedidoVenta.getArticulos().add(articuloPedido);
			}
			pedidoVenta.calcularTotales();
		}
		catch(PedidoVentaException e){
			throw new PedidoVentaTiendaVirtualException(e.getMessage(), e);
		} 
	}
	
	public void setMedioPago(DatosSesionTiendaVirtualBean datosSesion, String codMedioPago) throws PedidoVentaTiendaVirtualException {
		try{
			List<PagoPedidoVentaBean> pagos = new ArrayList<PagoPedidoVentaBean>(1);
			PagoPedidoVentaBean pago = new PagoPedidoVentaBean();
			pago.setEstadoBean(Estado.NUEVO);
			VencimientoBean vencimiento = ServicioVencimientos.consultarVencimientos(codMedioPago, datosSesion.getDatosSesionEmpresa()).get(0);
			pago.setIdMedioPagoVencimiento(vencimiento.getIdMedioPagoVencimiento());
			pago.setImporte(pedidoVenta.getTotal());
			pagos.add(pago);
			pedidoVenta.setPagos(pagos);
		}
		catch (VencimientoException e) {
			String msg = "Se ha producido un error consultando los vencimientos para establecer el medio de pago." + e.getMessage();
			log.error("generarPedidoVenta() - " + msg);
			throw new PedidoVentaTiendaVirtualException(msg, e);
		} 
		
	}

	public void generarPedidoVenta(DatosSesionTiendaVirtualBean datosSesion, Connection conn) throws PedidoVentaTiendaVirtualException{
		try{
			ServicioPedidosVentas.crear(conn, pedidoVenta, datosSesion.getDatosSesionEmpresa());
			idPedido = pedidoVenta.getIdPedido();
		}
		catch(PedidoVentaException e){
			throw new PedidoVentaTiendaVirtualException(e.getMessage(), e);
		} 
		catch (PedidoVentaConstraintViolationException e) {
			// esta excepción nunca debe saltar, pues no estamos eliminando ninguna línea de pedido
			throw new PedidoVentaTiendaVirtualException(e.getMessage(), e);
		} 
	}

	public Long getIdPedido(){
		return idPedido;
	}
	
	
}
