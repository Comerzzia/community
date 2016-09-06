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

package com.comerzzia.servicios.tesoreria.remesas.pagos;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.tesoreria.pagos.DocumentoPagoBean;
import com.comerzzia.persistencia.tesoreria.pagos.DocumentosPagosDao;
import com.comerzzia.persistencia.tesoreria.remesas.pagos.ParametrosBuscarRemesasPagosBean;
import com.comerzzia.persistencia.tesoreria.remesas.pagos.RemesaPagoBean;
import com.comerzzia.persistencia.tesoreria.remesas.pagos.RemesasPagosDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioRemesasPagos {

	protected static Logger log = Logger.getMLogger(ServicioRemesasPagos.class);
	
	public static PaginaResultados consultar(ParametrosBuscarRemesasPagosBean param, DatosSesionBean datosSesion) throws RemesaPagoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando remesas de pagos");
			conn.abrirConexion(Database.getConnection());
			
			return RemesasPagosDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar remesas de pagos: " +  e.getMessage();
			
            throw new RemesaPagoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static RemesaPago consultar(Long idRemesa, DatosSesionBean datosSesion) throws RemesaPagoException, RemesaPagoNotFoundException {
		Connection conn = new Connection();
		RemesaPago remesaPago = null;
		
		try {
			log.debug("consultar() - Consultando remesa con identificador: " + idRemesa);
			conn.abrirConexion(Database.getConnection());
			
			remesaPago = new RemesaPago(RemesasPagosDao.consultar(conn, datosSesion.getConfigEmpresa(), idRemesa));
			if (remesaPago == null){
				String msg = "No se ha encontrado el documento con idRemesa: " + idRemesa;
				log.info("consultar() - " + msg);
				
				throw new RemesaPagoNotFoundException(msg);
			}
			return remesaPago;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar remesa con identificador: " + idRemesa + " - " +  e.getMessage();
			
            throw new RemesaPagoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void salvar(RemesaPago remesaPago, DatosSesionBean datosSesion) throws RemesaPagoException, RemesaPagoConstraintViolationException{

		switch (remesaPago.getEstadoBean()) {
			case Estado.NUEVO:
				crear(remesaPago, datosSesion);
				break;
			      
			case Estado.BORRADO:
				eliminar(remesaPago.getIdRemesa(), datosSesion);
		}
	}

	private static void crear(RemesaPago remesaPago, DatosSesionBean datosSesion)throws RemesaPagoException, RemesaPagoConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nueva remesa de pago");
			conn.abrirConexion(Database.getConnection());
			
			//obtenemos el contador e insertamos la remesa
			remesaPago.setIdRemesa(ContadorRemesasPagos.obtenerContador(conn));
			remesaPago.setFechaGeneracion(new Date());
			
			RemesasPagosDao.insert(conn, datosSesion.getConfigEmpresa(), remesaPago.getBean());
			
		}
		catch(KeyConstraintViolationException e){
			log.info("crear() - No se ha podido crear la remesa de pago: " + e.getMessage());
			
			throw new RemesaPagoConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando remesa de pago: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new RemesaPagoException(msg, e);
    	
		} 
		catch (ContadorException e) {
			String msg = "Error obteniendo contador de remesas de pagos: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new RemesaPagoException(msg, e);
		} 
    	finally {
    		conn.cerrarConexion();
    	}
		
	}

	public static void eliminar(Long idRemesa, DatosSesionBean datosSesion)throws RemesaPagoConstraintViolationException, RemesaPagoException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando remesa de pago con identificador " + idRemesa);
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			//Obtenemos la lista de documentos de la remesa
			List<DocumentoPagoBean> lstDocumentosRemesa = DocumentosPagosDao.consultarDocumentosRemesa(conn, datosSesion.getConfigEmpresa(), idRemesa);
			
			for (DocumentoPagoBean documentoPago : lstDocumentosRemesa) {
				//Quitamos la relación de la remesa con sus documentos
				DocumentosPagosDao.quitarDocumentoRemesa(conn, datosSesion.getConfigEmpresa(), documentoPago.getIdPago());
			}

			//Finalmente borramos la remesa
			RemesasPagosDao.delete(conn, datosSesion.getConfigEmpresa(), idRemesa);

			conn.commit();
			conn.finalizaTransaccion();
		}
		catch(ForeingKeyConstraintViolationException e){
			conn.deshacerTransaccion();
			
			log.info("eliminar() - No se ha podido eliminar la remesa de pago: " + e.getMessage());
			throw new RemesaPagoConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();

			String msg = "Error eliminando remesa de pago: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new RemesaPagoException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static void convertirEnRemesa(Long idRemesa, DatosSesionBean datosSesion)throws RemesaPagoException {
		Connection conn = new Connection();
		
		try {
			log.debug("convertirEnRemesa() - Convirtiendo en remesa la preremesa con identificador " + idRemesa);
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			//Obtenemos los datos de la remesa
			RemesaPagoBean remesaPago = RemesasPagosDao.consultar(conn, datosSesion.getConfigEmpresa(), idRemesa);
			remesaPago.setEstadoRemesa();
			remesaPago.setDocumentos(DocumentosPagosDao.consultarDocumentosRemesa(conn, datosSesion.getConfigEmpresa(), remesaPago.getIdRemesa()));
			
			//Ponemos a sus documentos el CodBanco de la remesa, la FechaBaja y la FechaPago
			for (DocumentoPagoBean documentoPago : remesaPago.getDocumentos()) {
				documentoPago.setCodBancoPago(remesaPago.getCodBanco());
				documentoPago.setFechaBaja(remesaPago.getFechaRemesa());
				documentoPago.setFechaPago(remesaPago.getFechaRemesa());
				
				//Actualizamos los documentos
				DocumentosPagosDao.update(conn, datosSesion.getConfigEmpresa(), documentoPago);
			}

			//Convertimos a remesa
			RemesasPagosDao.convertirEnRemesa(conn, datosSesion.getConfigEmpresa(), remesaPago);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("convertirEnRemesa() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			String msg = "Error convirtiendo a remesa: " + e.getMessage();
			log.error("convertirEnRemesa() - " + msg);
			
			throw new RemesaPagoException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
}


