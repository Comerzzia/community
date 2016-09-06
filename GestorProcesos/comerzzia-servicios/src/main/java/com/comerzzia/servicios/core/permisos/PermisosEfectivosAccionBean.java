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

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.comerzzia.persistencia.core.acciones.AccionBean;
import com.comerzzia.persistencia.core.permisos.PermisoBean;


public class PermisosEfectivosAccionBean implements Serializable {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 7215163570075712227L;

	private AccionBean accionMenu;
	private Long idUsuario;
	private Long idPerfil;
	private String desUsuario;
	private String desPerfil;
	private Map<String, PermisoBean> permisos;
	
	
	/**
	 * Constructor
	 */
	public PermisosEfectivosAccionBean() {
		permisos = new HashMap<String, PermisoBean>();
	}
	
	
	/**
	 * Constructor
	 * @param idAccion
	 * @param idUsuario
	 */
	public PermisosEfectivosAccionBean(AccionBean accionMenu, Long idUsuario) {
		this.accionMenu = accionMenu;
		this.idUsuario = idUsuario;
		permisos = new HashMap<String, PermisoBean>();
	}
	
	
	/**
	 * @return the idUsuario
	 */
	public Long getIdUsuario() {
		return idUsuario;
	}

	
	/**
	 * @param idUsuario the idUsuario to set
	 */
	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
		if (!idUsuario.equals(-1L)){
			this.idPerfil = -1L;
		}
	}
	
	
	
	
	public Long getIdPerfil() {
		return idPerfil;
	}


	public void setIdPerfil(Long idPerfil) {
		this.idPerfil = idPerfil;
		if (!idPerfil.equals(-1L)){
			this.idUsuario = -1L;
		}
	}


	public String getDesUsuario() {
		return desUsuario;
	}


	public void setDesUsuario(String desUsuario) {
		this.desUsuario = desUsuario;
	}


	public String getDesPerfil() {
		return desPerfil;
	}


	public void setDesPerfil(String desPerfil) {
		this.desPerfil = desPerfil;
	}


	/**
	 * @return the accionMenu
	 */
	public AccionBean getAccionMenu() {
		return accionMenu;
	}

	
	/**
	 * @param accionMenu the accionMenu to set
	 */
	public void setAccionMenu(AccionBean accionMenu) {
		this.accionMenu = accionMenu;
	}
	
	
	/**
	 * Establece la lista de permisos disponibles para la acción
	 * @param permisos
	 */
	public void setListaPermisos(List<PermisoBean> permisos) {
		for (PermisoBean permiso : permisos) {
			this.permisos.put(permiso.getOperacion().getDesOperacion(), permiso);
		}
	}

	/**
	 * Añade permiso disponible para la acción
	 * @param permisos
	 */
	public void addPermiso(PermisoBean permiso) {
		this.permisos.put(permiso.getOperacion().getDesOperacion(), permiso);
	}

	
	/**
	 * Indica si se tiene permiso para ejecutar la operación indicada
	 * @param operacion
	 * @return true si se tiene permiso para ejecutar la operación, false en caso contrario
	 */
	public boolean isPuede(String operacion) {
		// Obtenemos los permisos para la operacion
		PermisoBean permiso = permisos.get(operacion);
		if (permiso == null) {
			return false;
		}
		
		return (permiso.isConcedido() || permiso.isAdministrar());
	}
	

	/**
	 * Indica si se tiene permiso para administrar la operación indicada
	 * @param operacion
	 * @return true si se tiene permiso para administrar la operación, false en caso contrario
	 */
	public boolean isPuedeAdministrar(String operacion) {
		// Obtenemos los permisos para la operacion
		PermisoBean permiso = permisos.get(operacion);
		if (permiso == null) {
			return false;
		}
		
		return (permiso.isAdministrar());
	}

	
	/**
	 * Indica si se tiene permiso de EJECUTAR sobre la acción
	 * @return true si se tiene permiso, false en caso contrario
	 */
	public boolean isPuedeEjecutar() {
		return isPuede("EJECUTAR");
	}
	
	
	/**
	 * Indica si se tiene permiso de AÑADIR sobre la acción
	 * @return true si se tiene permiso, false en caso contrario
	 */
	public boolean isPuedeAñadir() {
		return isPuede("AÑADIR");
	}
	
	
	/**
	 * Indica si se tiene permiso de EDITAR sobre la acción
	 * @return true si se tiene permiso, false en caso contrario
	 */
	public boolean isPuedeEditar() {
		return isPuede("EDITAR");
	}
	
	
	/**
	 * Indica si se tiene permiso de ELIMINAR sobre la acción
	 * @return true si se tiene permiso, false en caso contrario
	 */
	public boolean isPuedeEliminar() {
		return isPuede("ELIMINAR");
	}

	
	/**
	 * Indica si se tiene permiso de ADMINISTRAR sobre la acción
	 * @return true si se tiene permiso, false en caso contrario
	 */
	public boolean isPuedeAdministrar() {
		// Comprobamos si se tiene permiso de administración
		// en alguna de las operaciones
		for (PermisoBean permiso : permisos.values()) {
			if (permiso.isAdministrar()) {
				return true;
			}
		}
		
		return false;
	}

	/** Devuelve un mapa con todos los permisos del usuario o perfil sobre la
	 * acción, utlizando como clave el nombre de la operación.
	 * @return Map<String, PermisoBean> 
	 */
	public Map<String, PermisoBean> getPermisos() {
		return permisos;
	}
	
	/** Devuelve la lista de permisos del usuario o perfil sobre la acción. 
	 * @return List<PermisoBean>
	 */
	public List<PermisoBean> getListaPermisos() {
		return new ArrayList<PermisoBean>(getPermisos().values());
	}
	
	/** Indica si los permisos efectivos pertenecen a un usuario.
	 * @return tru o false en si los permisos pertenecen a un usuario
	 */
	public boolean isPermisoUsuario(){
		return (getIdUsuario()!=null && !this.getIdUsuario().equals(-1L));
	}
	
	/** Indica si los permisos efectivos pertenecen a un perfil.
	 * @return tru o false en si los permisos pertenecen a un perfil
	 */
	public boolean isPermisoPerfil(){
		return (getIdPerfil()!=null && !this.getIdPerfil().equals(-1L));
	}
	
	/** Elimina toda la asignación de permisos para todas las operaciones de
	 * la acción. */
	public void borrarPermisos(){
		this.permisos.clear();
	}
	
}
