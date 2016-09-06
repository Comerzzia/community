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

package com.comerzzia.servicios.core.permisos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.acciones.AccionBean;
import com.comerzzia.persistencia.core.acciones.operaciones.OperacionBean;
import com.comerzzia.persistencia.core.acciones.operaciones.OperacionesDao;
import com.comerzzia.persistencia.core.permisos.PermisoBean;
import com.comerzzia.persistencia.core.permisos.PermisosDao;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioPermisos {
	
	protected static Logger log = Logger.getMLogger(ServicioPermisos.class);
	
	
	/**
	 * Obtiene los permisos efectivos que el usuario tiene sobre la acción siendo estos
	 * para cada operación definida para la acción el permiso otorgado directamente al usuario 
	 * y si este no lo tiene, el mayor de los permisos otorgados a sus perfiles
	 * @param accion
	 * @param idUsuario
	 * @return
	 * @throws PermisoException
	 */
	public static PermisosEfectivosAccionBean obtenerPermisosEfectivos(AccionBean accion, 
			Long idUsuario) throws PermisoException {
		Connection conn = new Connection();
		
		PermisosEfectivosAccionBean permisosEfectivos = new PermisosEfectivosAccionBean(accion, idUsuario);
		
		try {
			log.debug("obtenerPermisosEfectivos() - Obteniendo los permisos efectivos del usuario [" + 
					   idUsuario + "] para la accion [" + accion.getAccion() + "]");
			conn.abrirConexion(Database.getConnection());
			
			// Obtenemos la lista de permisos heredados de los perfiles del usuario
			List<PermisoBean> permisosPerfiles = PermisosDao.consultarMaxPermisosAccionPerfilesUsuario(conn, 
					accion.getIdAccion(), idUsuario);
			
			// Obtenemos la lista de permisos de la acción definidos para el usuario
			List<PermisoBean> permisosUsuario = PermisosDao.consultarPermisosAccionUsuario(conn, 
					accion.getIdAccion(), idUsuario);
			
			// Esteblecemos primero la lista de permisos de los perfiles y luego la del usuario
			permisosEfectivos.setListaPermisos(permisosPerfiles);
			permisosEfectivos.setListaPermisos(permisosUsuario);

			return permisosEfectivos;
		}
		catch (SQLException e) {
			log.error("obtenerPermisosEfectivos() - " + e.getMessage());
			String mensaje = "Error al obtener los permisos efectivos de una acción: " +  e.getMessage();
			
            throw new PermisoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	/** Obtiene los permisos para la acción indicada. Se obtendrán todos los permisos tanto de usuarios como perfiles a 
	 * los que se hayan asignado o denegado. 
	 * @param accion
	 * @return PermisosAccionBean
	 * @throws PermisoException
	 */
	public static PermisosAccionBean obtenerPermisosAccion(AccionBean accion) throws PermisoException{
		Connection conn = new Connection();
		try {
			log.debug("obtenerPermisosAccion() - Obteniendo los permisos para la acción: " + accion.getAccion());
			conn.abrirConexion(Database.getConnection());
			
			PermisosAccionBean permisosAccion = new PermisosAccionBean();
			permisosAccion.setAccion(accion);
			permisosAccion.setOperaciones(OperacionesDao.consultar(conn, accion.getIdAccion()));
			
			// Obtenemos la lista de permisos de perfiles
			List<PermisoBean> permisos = PermisosDao.consultarPermisosAccion(conn, accion.getIdAccion());

			// construimos permisos de la acción separando perfiles y usuarios, y operaciones de cada uno
			for (PermisoBean permiso : permisos) {
				if (permiso.isPermisoPerfil()){
					Long idPerfil = permiso.getIdPerfil();
					if (permisosAccion.getPermisosPerfil(idPerfil) == null){
						permisosAccion.addPerfil(idPerfil, permiso.getDesPerfil());
					}
					permisosAccion.addPermisoPerfil(idPerfil, permiso);
				}
				else{
					Long idUsuario = permiso.getIdUsuario();
					if (permisosAccion.getPermisosUsuario(idUsuario) == null){
						permisosAccion.addUsuario(idUsuario, permiso.getDesUsuario());
					}
					permisosAccion.addPermisoUsuario(idUsuario, permiso);
				}
			}
			return permisosAccion;
		}
		catch (SQLException e) {
			log.error("obtenerPermisosAccion() - " + e.getMessage());
			String mensaje = "Error al obtener los permisos de una acción: " +  e.getMessage();
			
            throw new PermisoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
		
	}
	
	/** Salva los nuevos permisos de acción indicados. Aquellas operaciones de la acción sobre las que el usuario actual no
	 * dispone de permiso de administración, se mantienen en sus valores originales.
	 * @param permisosAccion
	 * @param misPermisos
	 * @throws PermisoConstraintViolationException
	 * @throws PermisoException
	 */
	public static void salvarPermisosAccion(PermisosAccionBean permisosAccion, PermisosEfectivosAccionBean misPermisos) 
			throws PermisoConstraintViolationException, PermisoException{
		Connection conn = new Connection();
		try {
			log.debug("salvarPermisosAccion() - Salvando permisos para la acción: " + permisosAccion.getAccion().getAccion());
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// borramos los permisos actuales para todas las operaciones que tengamos permisos de administración
			for (OperacionBean operacion : permisosAccion.getOperaciones()) {
				if (misPermisos.isPuedeAdministrar(operacion.getDesOperacion())){
					PermisosDao.delete(conn, permisosAccion.getAccion().getIdAccion(), operacion.getIdOperacion());
				}
			}
			
			// insertamos todos los permisos nuevos para las operaciones que tengamos permisos de administración
			List<PermisosEfectivosAccionBean> listaPermisosAccion = permisosAccion.getListaPermisosAccion();
			for (PermisosEfectivosAccionBean permisosEfectivos : listaPermisosAccion) {
				List<PermisoBean> permisos = permisosEfectivos.getListaPermisos();
				for (PermisoBean permiso : permisos) {
					if (misPermisos.isPuedeAdministrar(permiso.getOperacion().getDesOperacion())){
						PermisosDao.insert(conn, permiso);
					}
				}
			}

			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (KeyConstraintViolationException e){
			conn.deshacerTransaccion();
			log.error("salvarPermisosAccion() - No se han podido salvar los permisos: " + e.getMessage());
			throw new PermisoConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			log.error("salvarPermisosAccion() - " + e.getMessage());
			String mensaje = "Error al salvar permisos de una acción: " +  e.getMessage();
            throw new PermisoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
		
	}
	
}
