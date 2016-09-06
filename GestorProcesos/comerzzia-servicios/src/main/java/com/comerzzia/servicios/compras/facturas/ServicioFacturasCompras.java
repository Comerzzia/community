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

import java.sql.SQLException;

import com.comerzzia.persistencia.compras.facturas.FacturaCompraBean;
import com.comerzzia.persistencia.compras.facturas.FacturasComprasDao;
import com.comerzzia.persistencia.compras.facturas.ParametrosBuscarFacturasComprasBean;
import com.comerzzia.persistencia.compras.facturas.detalle.DetalleFacturaCompraBean;
import com.comerzzia.persistencia.compras.facturas.pagos.PagoFacturaCompraBean;
import com.comerzzia.persistencia.compras.facturas.vencimientos.VencimientoFacturaCompraBean;
import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.servicios.compras.albaranes.AlbaranCompraException;
import com.comerzzia.servicios.compras.albaranes.ServicioAlbaranesCompras;
import com.comerzzia.servicios.compras.facturas.detalle.DetalleFacturaCompraConstraintViolationException;
import com.comerzzia.servicios.compras.facturas.detalle.DetalleFacturaCompraException;
import com.comerzzia.servicios.compras.facturas.detalle.ServicioDetallesFacturasCompras;
import com.comerzzia.servicios.compras.facturas.impuestos.ImpuestoFacturaCompraConstraintViolationException;
import com.comerzzia.servicios.compras.facturas.impuestos.ImpuestoFacturaCompraException;
import com.comerzzia.servicios.compras.facturas.impuestos.ServicioImpuestosFacturasCompras;
import com.comerzzia.servicios.compras.facturas.pagos.PagoFacturaCompraConstraintViolationException;
import com.comerzzia.servicios.compras.facturas.pagos.PagoFacturaCompraException;
import com.comerzzia.servicios.compras.facturas.pagos.ServicioPagosFacturasCompras;
import com.comerzzia.servicios.compras.facturas.vencimientos.ServicioVencimientosFacturasCompras;
import com.comerzzia.servicios.compras.facturas.vencimientos.VencimientoFacturaCompraConstraintViolationException;
import com.comerzzia.servicios.compras.facturas.vencimientos.VencimientoFacturaCompraException;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.pagos.ContadorPagos;
import com.comerzzia.servicios.tesoreria.pagos.vencimientos.ContadorVencimientosPagos;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioFacturasCompras {

	protected static Logger log = Logger.getMLogger(ServicioFacturasCompras.class);
	
	public static PaginaResultados consultar(ParametrosBuscarFacturasComprasBean param, DatosSesionBean datosSesion) 
			throws FacturaCompraException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando facturas de compras");
			conn.abrirConexion(Database.getConnection());
			return FacturasComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {			
			String mensaje = "Error al consultar facturas de compras: " +  e.getMessage();
			log.error("consultar() - " + mensaje);
			
            throw new FacturaCompraException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static FacturaCompra consultar(Long idFactura, DatosSesionBean datosSesion) 
			throws FacturaCompraException, FacturaCompraNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando datos de la factura: " + idFactura);
			conn.abrirConexion(Database.getConnection());
		
			FacturaCompra factura = new FacturaCompra(FacturasComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), idFactura));
			
			if (factura == null) {
				String msg = "No se ha encontrado la factura con identificador: " + idFactura;
				log.info("consultar() - " + msg);
				
				throw new FacturaCompraNotFoundException(msg);
			}
		
			return factura;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de una factura: " + e.getMessage();
		
			throw new FacturaCompraException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	
	public static void salvar(FacturaCompra factura, DatosSesionBean datosSesion) 
			throws FacturaCompraException, FacturaCompraConstraintViolationException, AlbaranCompraException {

		switch (factura.getEstadoBean()) {
			case Estado.NUEVO:
				crear(factura, datosSesion);
				break;
		}
	}
	
	
	public static void crear(FacturaCompra factura, DatosSesionBean datosSesion) 
			throws FacturaCompraException, FacturaCompraConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nueva factura de compra");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// Obtenemos el idFactura a partir del contador de facturas de compra
			factura.setIdFacturaSop(ContadorFacturasCompra.obtenerContadorId(conn));
			factura.setNumFactura(ContadorFacturasCompra.obtenerContadorFactura(factura.getCodEmpresa(), factura.getCodSerie(), factura.getPeriodo(), conn));
			
			FacturasComprasDao.insert(conn, datosSesion.getConfigEmpresa(), factura.getBean());
			salvarImpuestos(conn, datosSesion, factura);
			salvarDetalleFactura(conn, datosSesion, factura);
			salvarMediosPago(conn, datosSesion, factura);

			//Tras insertar la factura calculamos los vencimientos
			factura.inicializaVencimientosFactura(datosSesion);
			//generamos los vencimientos
			generarVencimientos(conn, datosSesion, factura);

			// Se facturan los albaranes que componen la factura
			facturarAlbaranesCompra(conn, datosSesion, factura);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (ContadorException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error creando factura de compra: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new FacturaCompraException(msg, e);
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error creando factura de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new FacturaCompraException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	private static void salvarImpuestos(Connection conn, DatosSesionBean datosSesion, FacturaCompra factura) 
			throws ImpuestoFacturaCompraException, ImpuestoFacturaCompraConstraintViolationException {
		
		// Grabamos la lista de impuestos
		for (ImpuestoBean impuesto : factura.getDetalleImpuestos().getListaImpuestos()) {
			// Actualizamos FK del objeto
			impuesto.setIdDocumento(factura.getIdFacturaSop());
			ServicioImpuestosFacturasCompras.crear(impuesto, datosSesion, conn);
		}
	}
	
	private static void salvarDetalleFactura(Connection conn, DatosSesionBean datosSesion, FacturaCompra factura) 
			throws DetalleFacturaCompraException, DetalleFacturaCompraConstraintViolationException {
		
		// Grabamos la lista de detalles
		int linea = 0;
		for (DetalleFacturaCompraBean detalleFactura : factura.getDetallesFactura()) {
			// Actualizamos FK del objeto
			detalleFactura.setIdFacturaSop(factura.getIdFacturaSop());
			detalleFactura.setLinea(++linea);
			if(detalleFactura.getConcepto() == null || detalleFactura.getConcepto().isEmpty()){
				detalleFactura.setConcepto("Factura " + factura.getReferencia());
			}
			ServicioDetallesFacturasCompras.crear(detalleFactura, datosSesion, conn);
		}
	}
	
	private static void salvarMediosPago(Connection conn, DatosSesionBean datosSesion, FacturaCompra factura) 
			throws PagoFacturaCompraException, PagoFacturaCompraConstraintViolationException {
		
		// Grabamos la lista de medios de pago 
		int linea = 0;
		for (PagoFacturaCompraBean medioPago : factura.getMediosPago()) {
			// Actualizamos FK del objeto
			medioPago.setIdFacturaSop(factura.getIdFacturaSop());
			medioPago.setLinea(++linea);
			ServicioPagosFacturasCompras.crear(medioPago, datosSesion, conn);
		}
	}
	
	private static void facturarAlbaranesCompra(Connection conn, DatosSesionBean datosSesion, FacturaCompra factura) throws FacturaCompraException{
		try{
			ServicioAlbaranesCompras.facturarAlbaranes(conn, datosSesion, factura);		
		}
		catch(AlbaranCompraException e){
			String msg = "Error facturando albaranes de compra: " + e.getMessage();
    		throw new FacturaCompraException(msg, e);
		}
	}

	private static void generarVencimientos(Connection conn, DatosSesionBean datosSesion, FacturaCompra factura) throws ContadorException, VencimientoFacturaCompraException, VencimientoFacturaCompraConstraintViolationException, SQLException{
		Long idVencimientoEnlace = 0L;
		
		for (int i = 0; i < factura.getVencimientos().size(); i++) {
			VencimientoFacturaCompraBean vencimientoFacturaCompra = factura.getVencimientos().get(i);
			vencimientoFacturaCompra.setIdVencimiento(ContadorVencimientosPagos.obtenerContador(conn));
			vencimientoFacturaCompra.setIdPago(ContadorPagos.obtenerContador(conn));

			//Mantenemos el mismo id de vencimiento para todos los vencimientos
			if(i == 0){
				idVencimientoEnlace = vencimientoFacturaCompra.getIdVencimiento();
				factura.setIdVencimientoEnlace(idVencimientoEnlace);
			}
			
			vencimientoFacturaCompra.setIdVencimientoEnlace(idVencimientoEnlace);

			//Insertar el vencimiento en la tabla de pagos y el documento en la
			//tabla de documentos de pagos
			ServicioVencimientosFacturasCompras.crear(vencimientoFacturaCompra, datosSesion, conn);
		}

		//Actualizamos los datos de la cabecera de la factura y añadimos el id_vencimiento_enlace
		modificarIdVencimientoEnlace(conn, factura, datosSesion);
	}

	private static void modificarIdVencimientoEnlace(Connection conn, FacturaCompra factura, DatosSesionBean datosSesion) throws SQLException{
		log.debug("modificarIdVencimientoEnlace() - Modificando factura de compra " + factura.getIdFacturaSop());
		FacturasComprasDao.modificarIdVencimientoEnlace(conn, datosSesion.getConfigEmpresa(), factura.getBean());
	}

	public static FacturaCompra consultar(FacturaCompra factura, DatosSesionBean datosSesion) throws FacturaCompraException, FacturaCompraNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando datos de la factura del proveedor " + factura.getCodProveedor() + " con referencia " + factura.getReferencia());
			conn.abrirConexion(Database.getConnection());
		
			FacturaCompraBean facturaCompra = FacturasComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), factura.getCodProveedor(), factura.getReferencia());
			
			if (facturaCompra == null) {
				String msg = "No se ha encontrado la factura del proveedor " + factura.getCodProveedor() + " con referencia " + factura.getReferencia();
				log.info("consultar() - " + msg);
				
				throw new FacturaCompraNotFoundException(msg);
			}
		
			return new FacturaCompra(facturaCompra);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de una factura: " + e.getMessage();
		
			throw new FacturaCompraException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

}
