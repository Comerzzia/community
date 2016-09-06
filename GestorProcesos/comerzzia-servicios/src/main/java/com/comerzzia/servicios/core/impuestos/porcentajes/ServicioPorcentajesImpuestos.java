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

package com.comerzzia.servicios.core.impuestos.porcentajes;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.comerzzia.persistencia.core.impuestos.grupos.GrupoImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.grupos.GruposImpuestosDao;
import com.comerzzia.persistencia.core.impuestos.porcentajes.ParametrosBuscarPorcentajesImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajeImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajesImpuestosDao;
import com.comerzzia.persistencia.core.impuestos.tratamientosimpuestos.TratamientoImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.tratamientosimpuestos.TratamientosImpuestosDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.impuestos.grupos.ContadorGrupoImpuestos;
import com.comerzzia.servicios.core.impuestos.grupos.GrupoImpuestosException;
import com.comerzzia.servicios.core.impuestos.grupos.GrupoImpuestosNotFoundException;
import com.comerzzia.servicios.core.impuestos.grupos.ServicioGruposImpuestos;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class ServicioPorcentajesImpuestos {
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioPorcentajesImpuestos.class);
	
	public static PaginaResultados consultar(ParametrosBuscarPorcentajesImpuestosBean param) throws PorcentajeImpuestoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando porcentajes impuestos");
			conn.abrirConexion(Database.getConnection());
			return PorcentajesImpuestosDao.consultar(conn, param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar porcentajes impuestos: " +  e.getMessage();
			
            throw new PorcentajeImpuestoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static PorcentajeImpuestoBean consultar(Long idGrupoImpuesto, Long idTratImpuestos, String codImp) 
			throws PorcentajeImpuestoException, PorcentajeImpuestoNotFoundException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			PorcentajeImpuestoBean porcentajeImpuesto = consultar(conn, idGrupoImpuesto, idTratImpuestos, codImp);
			
			return porcentajeImpuesto;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un porcentaje de impuestos: " + e.getMessage();

			throw new PorcentajeImpuestoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static PorcentajeImpuestoBean consultar(Connection conn, Long idGrupoImpuesto, Long idTratImpuestos, String codImp) 
			throws PorcentajeImpuestoException, PorcentajeImpuestoNotFoundException {
		try {
			log.debug("consultar() - Consultando datos del grupo de impuestos con ID de grupo de impuestos "
							+ idGrupoImpuesto
							+ ", ID de tratamiento de impuestos "
							+ idTratImpuestos + " y tipo de impuesto " + codImp);
			PorcentajeImpuestoBean porcentajeImpuesto = PorcentajesImpuestosDao.consultar(conn, idGrupoImpuesto, idTratImpuestos, codImp);
			
			if (porcentajeImpuesto == null) {
				String msg = "No se ha encontrado el porcentaje de impuestos con ID de grupo de impuestos "
						+ idGrupoImpuesto
						+ ", ID de tratamiento de impuestos "
						+ idTratImpuestos + " y tipo de impuesto " + codImp;
				log.info("consultar() - " + msg);

				throw new PorcentajeImpuestoNotFoundException(msg);
			}
			
			return porcentajeImpuesto;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un porcentaje de impuestos: " + e.getMessage();
			
			throw new PorcentajeImpuestoException(mensaje, e);
		}
	}
	
	/**
	 * Obtiene un el porcentaje de impuestos para una fecha de vigencia del grupo de impuestos, 
	 * un tratamiento de impuestos y un tipo de impuestos.
	 * 
	 * @param conn
	 * @param fecha
	 * @param idTratImpuestos
	 * @param codImp
	 * @param datosSesion
	 * @return
	 * @throws PorcentajeImpuestoException
	 * @throws PorcentajeImpuestoNotFoundException
	 */
	public static PorcentajeImpuestoBean consultar(Connection conn, Date fecha, Long idTratImpuestos, String codImp) 
			throws PorcentajeImpuestoException, PorcentajeImpuestoNotFoundException {
		try {
			// Obtener el grupo de impuestos vigente
			GrupoImpuestosBean grupoImpuestos = ServicioGruposImpuestos.consultar(conn, fecha);
			
			return consultar(conn, grupoImpuestos.getIdGrupoImpuestos(), idTratImpuestos, codImp);
		}
		catch (GrupoImpuestosException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un grupo de impuestos: " + e.getMessage();
			
			throw new PorcentajeImpuestoException(mensaje, e);
		}
		catch (GrupoImpuestosNotFoundException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un grupo de impuestos: " + e.getMessage();
			
			throw new PorcentajeImpuestoNotFoundException(mensaje, e);
		}
	}
	
	
	/**
	 * Obtiene los porcentajes de impuestos asociados a un grupo de impuestos
	 * y un tratamiento determinado
	 * 
	 * @param idGrupoImpuesto
	 * @param idTratImpuestos
	 * @return
	 * @throws PorcentajeImpuestoException
	 */
	public static PorcentajesImpuestosBean consultar(Long idGrupoImpuesto, Long idTratImpuestos) 
			throws PorcentajeImpuestoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando porcentajes del grupo de impuestos "
					+ idGrupoImpuesto + " y tratamiento " + idTratImpuestos);
			
			conn.abrirConexion(Database.getConnection());
			Map<String, PorcentajeImpuestoBean> porcentajes = 
				PorcentajesImpuestosDao.consultarMapa(conn, idGrupoImpuesto, idTratImpuestos);
			
			PorcentajesImpuestosBean porcentajesImpuestos = new PorcentajesImpuestosBean(idGrupoImpuesto, idTratImpuestos);
			porcentajesImpuestos.setPorcentajesImpuestos(porcentajes);
			
			return porcentajesImpuestos;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando lista de porcentajes de impuestos: " + e.getMessage();

			throw new PorcentajeImpuestoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void salvar(PorcentajeImpuestoBean porcentaje) 
	throws PorcentajeImpuestoException, GrupoImpuestosException {

		switch (porcentaje.getEstadoBean()) {
			case Estado.NUEVO:
				crear(porcentaje);
				break;
		  
			case Estado.MODIFICADO:
				modificar(porcentaje);
				break;
		  
		}
	}
	
	public static void crear(PorcentajeImpuestoBean porcentaje) 
	throws PorcentajeImpuestoException, GrupoImpuestosException {
		
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nuevo grupo de impuesto");		
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			//Creamos un nuevo grupo de impuestos
			GrupoImpuestosBean grupo = new GrupoImpuestosBean();
			grupo.setVigenciaDesde(porcentaje.getVigenciaDesde());
			
			grupo.setIdGrupoImpuestos(ContadorGrupoImpuestos.obtenerContador(conn));
			GruposImpuestosDao.insert(conn, grupo);
			porcentaje.setIdGrupoImpuestos(grupo.getIdGrupoImpuestos());
			
			//inicializamos los porcentajes para el nuevo grupo de impuestos
			inicializarPorcentajes(conn, porcentaje);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (ContadorException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error creando grupo de impuesto: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
			throw new GrupoImpuestosException(msg, e);	
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error creando nuevo grupo impuesto: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new GrupoImpuestosException(msg, e);
		}
		finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void modificar(PorcentajeImpuestoBean porcentaje) throws PorcentajeImpuestoException {
	Connection conn = new Connection();
	
		try {
			log.debug("modificar() - Modificando porcentaje de impuesto " + porcentaje.getIdGrupoImpuestos() + ", " + porcentaje.getIdTratImpuestos() + ", " + porcentaje.getCodImp());
			conn.abrirConexion(Database.getConnection());
			PorcentajesImpuestosDao.update(conn, porcentaje);
		}
		catch (SQLException e) {
			String msg = "Error modificando porcentaje de impuesto: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new PorcentajeImpuestoException(msg, e);
		}
		finally {
    		conn.cerrarConexion();
    	}
	}
	
	public static void inicializarPorcentajes(Connection conn, PorcentajeImpuestoBean porcentaje) throws PorcentajeImpuestoException{
		
		try {
			log.debug("consultar() - Creando lista de porcentajes de impuestos para nuevo grupo");	
			
			List<TratamientoImpuestoBean> tratamientos = TratamientosImpuestosDao.consultar(conn);
			
			for (int i = 0 ; i < tratamientos.size() ; i++){
				TratamientoImpuestoBean tratamientoImpuesto = (TratamientoImpuestoBean) tratamientos.get(i);
				porcentaje.setIdTratImpuestos(tratamientoImpuesto.getIdTratImpuestos());
				PorcentajesImpuestosDao.inicializarPorcentajesImpuestos(conn, porcentaje);
			}
			
			
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error inicializando porcentajes de impuesto: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new PorcentajeImpuestoException(msg, e);
		}		
			
	}
}
