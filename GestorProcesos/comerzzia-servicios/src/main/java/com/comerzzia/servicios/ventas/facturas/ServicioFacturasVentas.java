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

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.persistencia.ventas.facturas.FacturasVentasDao;
import com.comerzzia.persistencia.ventas.facturas.ParametrosBuscarFacturasVentasBean;
import com.comerzzia.persistencia.ventas.facturas.detalle.DetalleFacturaVentaBean;
import com.comerzzia.persistencia.ventas.facturas.pagos.PagoFacturaVentaBean;
import com.comerzzia.persistencia.ventas.facturas.vencimientos.VencimientoFacturaVentaBean;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.cobros.ContadorCobros;
import com.comerzzia.servicios.tesoreria.cobros.vencimientos.ContadorVencimientosCobros;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVentaException;
import com.comerzzia.servicios.ventas.albaranes.ServicioAlbaranesVentas;
import com.comerzzia.servicios.ventas.facturas.detalle.DetalleFacturaVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.facturas.detalle.DetalleFacturaVentaException;
import com.comerzzia.servicios.ventas.facturas.detalle.ServicioDetallesFacturasVentas;
import com.comerzzia.servicios.ventas.facturas.impuestos.ImpuestoFacturaVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.facturas.impuestos.ImpuestoFacturaVentaException;
import com.comerzzia.servicios.ventas.facturas.impuestos.ServicioImpuestosFacturasVentas;
import com.comerzzia.servicios.ventas.facturas.pagos.PagoFacturaVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.facturas.pagos.PagoFacturaVentaException;
import com.comerzzia.servicios.ventas.facturas.pagos.ServicioPagosFacturasVentas;
import com.comerzzia.servicios.ventas.facturas.vencimientos.ServicioVencimientosFacturasVentas;
import com.comerzzia.servicios.ventas.facturas.vencimientos.VencimientoFacturaVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.facturas.vencimientos.VencimientoFacturaVentaException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioFacturasVentas {

	protected static Logger log = Logger.getMLogger(ServicioFacturasVentas.class);
	
	public static PaginaResultados consultar(ParametrosBuscarFacturasVentasBean param, DatosSesionBean datosSesion) throws FacturaVentaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando facturas de ventas");
			conn.abrirConexion(Database.getConnection());
			return FacturasVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar facturas de ventas: " +  e.getMessage();
			
            throw new FacturaVentaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static FacturaVenta consultar(Long idFacturaRep, DatosSesionBean datosSesion) 
			throws FacturaVentaException, FacturaVentaNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos de la factura de venta: " + idFacturaRep);
			conn.abrirConexion(Database.getConnection());
			
			FacturaVenta factura = new FacturaVenta(FacturasVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), idFacturaRep));
			
			if (factura == null) {
				String msg = "No se ha encontrado la factura de venta con identificador: " + idFacturaRep;
				log.info("consultar() - " + msg);
				throw new FacturaVentaNotFoundException(msg);
			}
			
			return factura;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de una factura de venta: " +  e.getMessage();
			
		    throw new FacturaVentaException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	public static void crearFactura(List<FacturaVenta> lstFacturas, DatosSesionBean datosSesion) 
			throws FacturaVentaException, FacturaVentaConstraintViolationException {
		
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nueva factura de venta");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			for (FacturaVenta factura : lstFacturas) {
				// Obtenemos el idFactura a partir del contador de facturas de venta
				factura.setIdFacturaRep(ContadorFacturasVentas.obtenerContadorId(conn));
				factura.setNumFactura(ContadorFacturasVentas.obtenerContadorFactura(factura.getCodEmpresa(), factura.getCodSerie(), factura.getPeriodo(), conn));
				
				FacturasVentasDao.insert(conn, datosSesion.getConfigEmpresa(), factura.getBean());
				salvarImpuestos(conn, datosSesion, factura);
				salvarDetalleFactura(conn, datosSesion, factura);
				salvarMediosPago(conn, datosSesion, factura);
				
				//Tras insertar la factura calculamos los vencimientos
				factura.inicializaVencimientosFactura(datosSesion);
				//generamos los vencimientos
				generarVencimientos(conn, datosSesion, factura);
				
				//Facturar los albaranes de compras
				facturarAlbaranesVentas(conn, datosSesion, factura);
			}
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (ContadorException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error creando factura de venta: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new FacturaVentaException(msg, e);
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error creando nueva factura de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new FacturaVentaException(msg, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}
	
	private static void salvarImpuestos(Connection conn, DatosSesionBean datosSesion, FacturaVenta factura) 
			throws ImpuestoFacturaVentaException, ImpuestoFacturaVentaConstraintViolationException {
		
		// Grabamos la lista de impuestos
		for (ImpuestoBean impuesto : factura.getDetalleImpuestos().getListaImpuestos()) {
			// Actualizamos FK del objeto
			impuesto.setIdDocumento(factura.getIdFacturaRep());
			ServicioImpuestosFacturasVentas.crear(impuesto, datosSesion, conn);
		}
	}

	private static void salvarDetalleFactura(Connection conn, DatosSesionBean datosSesion, FacturaVenta factura) 
		throws DetalleFacturaVentaException, DetalleFacturaVentaConstraintViolationException {
	
		// Grabamos la lista de detalles
		int linea = 0;
		for (DetalleFacturaVentaBean detalleFactura : factura.getDetallesFactura()) {
			// Actualizamos FK del objeto
			detalleFactura.setIdFacturaRep(factura.getIdFacturaRep());
			detalleFactura.setLinea(++linea);
			if(detalleFactura.getConcepto() == null || detalleFactura.getConcepto().isEmpty()){
				detalleFactura.setConcepto(factura.getConcepto());
			}
			ServicioDetallesFacturasVentas.crear(detalleFactura, datosSesion, conn);
		}
	}
	
	private static void salvarMediosPago(Connection conn, DatosSesionBean datosSesion, FacturaVenta factura) 
		throws PagoFacturaVentaException, PagoFacturaVentaConstraintViolationException {
	
		// Grabamos la lista de medios de pago 
		int linea = 0;
		for (PagoFacturaVentaBean medioPago : factura.getMediosPago()) {
			// Actualizamos FK del objeto
			medioPago.setIdFacturaRep(factura.getIdFacturaRep());
			medioPago.setLinea(++linea);
			ServicioPagosFacturasVentas.crear(medioPago, datosSesion, conn);
		}
	}
	
	private static void facturarAlbaranesVentas(Connection conn, DatosSesionBean datosSesion, FacturaVenta factura) throws FacturaVentaException{
		try{
			ServicioAlbaranesVentas.facturarAlbaranes(conn, datosSesion, factura);		
		}
		catch(AlbaranVentaException e){
			String msg = "Error facturando albaranes de venta: " + e.getMessage();
    		throw new FacturaVentaException(msg, e);
		}
	}

	private static void generarVencimientos(Connection conn, DatosSesionBean datosSesion, FacturaVenta factura) throws ContadorException, VencimientoFacturaVentaException, VencimientoFacturaVentaConstraintViolationException, SQLException {
		Long idVencimientoEnlace = 0L;
		
		for (int i = 0; i < factura.getVencimientos().size(); i++) {
			VencimientoFacturaVentaBean vencimientoFacturaVenta = factura.getVencimientos().get(i);
			vencimientoFacturaVenta.setIdVencimiento(ContadorVencimientosCobros.obtenerContador(conn));
			vencimientoFacturaVenta.setIdCobro(ContadorCobros.obtenerContador(conn));
			//Mantenemos el mismo id de vencimiento para todos los vencimientos
			if(i == 0){
				idVencimientoEnlace = vencimientoFacturaVenta.getIdVencimiento();
				factura.setIdVencimientoEnlace(idVencimientoEnlace);
			}

			vencimientoFacturaVenta.setIdVencimientoEnlace(idVencimientoEnlace);

			//Insertar el vencimiento en la tabla de cobros y el documento en la
			//tabla de documentos de cobros
			ServicioVencimientosFacturasVentas.crear(vencimientoFacturaVenta, datosSesion, conn);
		}

		//Actualizamos los datos de la cabecera de la factura y añadimos el id_vencimiento_enlace
		modificarIdVencimientoEnlace(conn, factura, datosSesion);
	}

	private static void modificarIdVencimientoEnlace(Connection conn, FacturaVenta factura, DatosSesionBean datosSesion) throws SQLException{
		log.debug("modificarIdVencimientoEnlace() - Modificando factura de venta " + factura.getIdFacturaRep());
		FacturasVentasDao.modificarIdVencimientoEnlace(conn, datosSesion.getConfigEmpresa(), factura.getBean());
	}
}
