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

package com.comerzzia.servicios.general.mediospago;

import java.sql.SQLException;

import com.comerzzia.persistencia.general.mediospago.MedioPagoBean;
import com.comerzzia.persistencia.general.mediospago.MediosPagoDao;
import com.comerzzia.persistencia.general.mediospago.ParametrosBuscarMediosPagoBean;
import com.comerzzia.persistencia.general.mediospago.vencimientos.VencimientoBean;
import com.comerzzia.persistencia.general.mediospago.vencimientos.VencimientosDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.mediospago.vencimientos.ContadorVencimientos;
import com.comerzzia.servicios.general.mediospago.vencimientos.ServicioVencimientos;
import com.comerzzia.servicios.general.mediospago.vencimientos.VencimientoConstraintViolationException;
import com.comerzzia.servicios.general.mediospago.vencimientos.VencimientoException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioMediosPago {

	protected static Logger log = Logger.getMLogger(ServicioMediosPago.class);
	
	public static PaginaResultados consultar(ParametrosBuscarMediosPagoBean param, DatosSesionBean datosSesion) throws MedioPagoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando medios de pago");
			conn.abrirConexion(Database.getConnection());
			return MediosPagoDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar medios de pago: " +  e.getMessage();
			
            throw new MedioPagoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static MedioPagoBean consultar(String codMedioPago, DatosSesionBean datosSesion) 
			throws MedioPagoException, MedioPagoNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos del medio de pago: " + codMedioPago);
			conn.abrirConexion(Database.getConnection());
			MedioPagoBean medioPago = MediosPagoDao.consultar(conn, datosSesion.getConfigEmpresa(), codMedioPago);
			
			if (medioPago == null) {
				String msg = "No se ha encontrado el medio de pago con identificador: " + codMedioPago;
				log.info("consultar() - " + msg);
				throw new MedioPagoNotFoundException(msg);
			}
			
			return medioPago;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un medio de pago: " +  e.getMessage();
			
		    throw new MedioPagoException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}
	
	
	public static MedioPagoBean consultarEfectivoContado(DatosSesionBean datosSesion, Connection conn) 
			throws MedioPagoException, MedioPagoNotFoundException {
		try {
			log.debug("consultarEfectivoContado() - Consultando datos del medio de pago de efectivo y contado");

			MedioPagoBean medioPago = MediosPagoDao.consultarEfectivoContado(conn, datosSesion.getConfigEmpresa());
			
			if (medioPago == null) {
				String msg = "No se ha encontrado el medio de pago de efectivo y contado";
				log.info("consultarEfectivoContado() - " + msg);
				throw new MedioPagoNotFoundException(msg);
			}
			
			return medioPago;
		}
		catch (SQLException e) {
			log.error("consultarEfectivoContado() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un medio de pago de efectivo y contado: " +  e.getMessage();
			
		    throw new MedioPagoException(mensaje, e);
		}
	}
	
	
	public static void salvar(MedioPagoBean medioPago, DatosSesionBean datosSesion) 
			throws MedioPagoException, MedioPagoConstraintViolationException {
		
		switch (medioPago.getEstadoBean()) {
			case Estado.NUEVO:
				crear(medioPago, datosSesion);
				break;
		     
			case Estado.MODIFICADO:
				modificar(medioPago, datosSesion);
				break;
		      
			case Estado.BORRADO:
				eliminar(medioPago.getCodMedioPago(), datosSesion);
		}
	}
	
	
	public static void crear(MedioPagoBean medioPago, DatosSesionBean datosSesion) 
			throws MedioPagoConstraintViolationException, MedioPagoException {
		
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nuevo medio de pago " + medioPago.getCodMedioPago());
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			MediosPagoDao.insert(conn, datosSesion.getConfigEmpresa(), medioPago);
			
			if (medioPago.isContado() && !medioPago.isVencimientosCargados()){
				//creamos nuevo vencimiento y lo asignamos al medio de pago
				VencimientoBean vencimiento = new VencimientoBean();
				vencimiento.setEstadoBean(Estado.NUEVO);
				vencimiento.setIdMedioPagoVencimiento(ContadorVencimientos.obtenerContador(conn));
				vencimiento.setDesVencimiento(medioPago.getDesMedioPago());
				if (medioPago.isEfectivo() || medioPago.isTarjetaCredito()){
					vencimiento.setNumeroVencimientos(0L);
				}
				else{
					vencimiento.setNumeroVencimientos(1L);
				}
				
				vencimiento.setDiasCadencia(0L);
				vencimiento.setDiasEntreVencimientos(0L);
				vencimiento.setDiasNaturales(false);
				vencimiento.setActivo(true);
				
				medioPago.addVencimiento(vencimiento);
				medioPago.setVencimientosCargados(true);
				
			}

			salvarVencimientos(conn, medioPago, datosSesion);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (KeyConstraintViolationException e) {
			conn.deshacerTransaccion();
			
			log.info("crear() - No se ha podido crear el medio de pago: " + e.getMessage());
			throw new MedioPagoConstraintViolationException(e.getDefaultMessage());
			
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();

			String msg = "Error creando medio de pago: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new MedioPagoException(msg, e);
    	} catch (ContadorException e) {
    		conn.deshacerTransaccion();
			
    		String msg = "Error creando vencimiento: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
			throw new VencimientoException(msg, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(MedioPagoBean medioPago, DatosSesionBean datosSesion) 
			throws MedioPagoException, MedioPagoConstraintViolationException {
		
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando medio de pago " + medioPago.getCodMedioPago());
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			if (medioPago.isContado() && (medioPago.isEfectivo() || medioPago.isTarjetaCredito())){
				//Borramos los vencimientos asociados al medio de pago.
				VencimientosDao.delete(conn, datosSesion.getConfigEmpresa(), medioPago.getCodMedioPago());
				
				//creamos nuevo vencimiento y lo asignamos al medio de pago
				VencimientoBean vencimiento = new VencimientoBean();
				vencimiento.setEstadoBean(Estado.NUEVO);
				vencimiento.setIdMedioPagoVencimiento(ContadorVencimientos.obtenerContador(conn));
				vencimiento.setDesVencimiento(medioPago.getDesMedioPago());
				vencimiento.setDiasCadencia(0L);
				vencimiento.setDiasEntreVencimientos(0L);
				vencimiento.setDiasNaturales(false);
				vencimiento.setActivo(true);
				
				vencimiento.setNumeroVencimientos(0L);
				
				medioPago.addVencimiento(vencimiento);
				medioPago.setVencimientosCargados(true);
				
				//salvarVencimientos(conn, medioPago, datosSesion);
			}
			
			
			MediosPagoDao.update(conn, datosSesion.getConfigEmpresa(), medioPago);
			salvarVencimientos(conn, medioPago, datosSesion);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error modificando medio de pago: " + e.getMessage();
	    	log.error("modificar() - " + msg);
	    		
	    	throw new MedioPagoException(msg, e);
		}
		catch (ContadorException e) {
    		conn.deshacerTransaccion();
			
    		String msg = "Error modificando vencimiento: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
			throw new VencimientoException(msg, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}
	
	
	public static void eliminar(String codMedioPago, DatosSesionBean datosSesion) 
			throws MedioPagoException, MedioPagoConstraintViolationException {
		
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando medio de pago " + codMedioPago);
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			VencimientosDao.delete(conn, datosSesion.getConfigEmpresa(), codMedioPago);
			MediosPagoDao.delete(conn, datosSesion.getConfigEmpresa(),codMedioPago);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (ForeingKeyConstraintViolationException e) {
			conn.deshacerTransaccion();
			
			log.info("eliminar() - No se ha podido eliminar el medio de pago: "+ e.getMessage());
			throw new MedioPagoConstraintViolationException(e.getDefaultMessage());
			
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
    		String msg = "Error eliminando medio de pago: " + e.getMessage();
    		log.error("eliminar() - " + msg);
    		
    		throw new MedioPagoException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	private static void salvarVencimientos(Connection conn, MedioPagoBean medioPago, DatosSesionBean datosSesion) 
			throws VencimientoException, VencimientoConstraintViolationException {
		
		if (medioPago.isVencimientosCargados()) {
			for (VencimientoBean vencimiento : medioPago.getVencimientos()) {
				// Actualizamos PK del objeto
				vencimiento.setCodMedioPago(medioPago.getCodMedioPago());
				
				ServicioVencimientos.salvar(conn, vencimiento, datosSesion);
			}
		}
	}
}
