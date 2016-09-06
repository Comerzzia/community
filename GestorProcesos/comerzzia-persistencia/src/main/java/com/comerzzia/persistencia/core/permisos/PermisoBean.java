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

package com.comerzzia.persistencia.core.permisos;

import com.comerzzia.persistencia.core.acciones.operaciones.OperacionBean;
import com.comerzzia.util.base.MantenimientoBean;

public class PermisoBean extends MantenimientoBean implements Comparable<PermisoBean> {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1442732502424769006L;

	private static final byte DENEGADO = 0;
	private static final byte CONCEDIDO = 1;
	private static final byte ADMINISTRAR = 2;

	private Long idAccion;
	private Long idUsuario;
	private Long idPerfil;
	private String desUsuario;
	private String desPerfil;
	private Byte permiso;
	private OperacionBean operacion;

	
	public PermisoBean(){
		this.operacion = new OperacionBean();
	}
	
	
	protected void initNuevoBean() {	
	}


	/**
	 * @return the idAccion
	 */
	public Long getIdAccion() {
		return idAccion;
	}


	/**
	 * @param idAccion the idAccion to set
	 */
	public void setIdAccion(Long idAccion) {
		this.idAccion = idAccion;
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


	/**
	 * @return the idPerfil
	 */
	public Long getIdPerfil() {
		return idPerfil;
	}


	/**
	 * @param idPerfil the idPerfil to set
	 */
	public void setIdPerfil(Long idPerfil) {
		this.idPerfil = idPerfil;
		if (!idPerfil.equals(-1L)){
			this.idUsuario = -1L;
		}
	}


	/**
	 * @return the permiso
	 */
	public Byte getPermiso() {
		return permiso;
	}


	/**
	 * @param permiso the permiso to set
	 */
	public void setPermiso(Byte permiso) {
		this.permiso = permiso;
	}


	public OperacionBean getOperacion() {
		return operacion;
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

	public void setOperacion(OperacionBean operacion) {
		this.operacion = operacion;
	}

	public boolean isAdministrar(){
		return getPermiso() == ADMINISTRAR;
	}

	public boolean isConcedido(){
		return getPermiso() == CONCEDIDO;
	}

	public boolean isDenegado(){
		return getPermiso() == DENEGADO;
	}

	public void setPermisoDenegado(){
		this.permiso = DENEGADO;
	}

	public void setPermisoAdministrar(){
		this.permiso = ADMINISTRAR;
	}

	public void setPermisoConcedido(){
		this.permiso = CONCEDIDO;
	}


	public int compareTo(PermisoBean o) {
        return this.operacion.compareTo(o.getOperacion());           
    }
	
	public boolean isPermisoUsuario(){
		return !this.getIdUsuario().equals(-1L);
	}
	
	public boolean isPermisoPerfil(){
		return !this.getIdPerfil().equals(-1L);
	}

}
