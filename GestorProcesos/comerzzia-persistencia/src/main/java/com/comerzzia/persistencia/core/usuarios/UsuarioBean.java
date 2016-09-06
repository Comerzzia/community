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

package com.comerzzia.persistencia.core.usuarios;

import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.usuarios.perfiles.PerfilUsuarioBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.util.base.MantenimientoBean;

public class UsuarioBean extends MantenimientoBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 2943295250151468696L;

	private Long idUsuario;
	private String usuario;
	private String desUsuario;
	private String clave = "";
	private String aplicacion;
	private boolean puedeCambiarAplicacion;

	// Perfiles
	private boolean perfilesCargados = false;
	private List<PerfilUsuarioBean> lstPerfiles;

	// Almacenes
	private boolean almacenesCargados = false;
	private List<AlmacenUsuarioBean> lstAlmacenes;

	protected void initNuevoBean() {
		perfilesCargados = true;
		almacenesCargados = true;
		lstPerfiles = new ArrayList<PerfilUsuarioBean>();
		lstAlmacenes = new ArrayList<AlmacenUsuarioBean>();
	}

	public Long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario.toUpperCase();
	}

	public String getDesUsuario() {
		return desUsuario;
	}

	public void setDesUsuario(String desUsuario) {
		this.desUsuario = desUsuario;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = (clave != null) ? clave : "";
	}

	public boolean isClaveValida(String clave) {
		return this.clave.equals(clave);
	}

	public boolean isPerfilesCargados() {
		return perfilesCargados;
	}

	public void setPerfilesCargados(boolean perfilesCargados) {
		this.perfilesCargados = perfilesCargados;
	}

	public boolean isAlmacenesCargados() {
		return almacenesCargados;
	}

	public void setAlmacenesCargados(boolean almacenesCargados) {
		this.almacenesCargados = almacenesCargados;
	}

	public List<PerfilUsuarioBean> getLstPerfiles() {
		return lstPerfiles;
	}

	public void setLstPerfiles(List<PerfilUsuarioBean> lstPerfiles) {
		this.lstPerfiles = lstPerfiles;
	}

	public List<AlmacenUsuarioBean> getLstAlmacenes() {
		return lstAlmacenes;
	}

	public void setLstAlmacenes(List<AlmacenUsuarioBean> lstAlmacenes) {
		this.lstAlmacenes = lstAlmacenes;
	}

	public String getAplicacion() {
		return aplicacion;
	}

	public void setAplicacion(String aplicacion) {
		this.aplicacion = aplicacion;
	}

	public boolean isPuedeCambiarAplicacion() {
		return puedeCambiarAplicacion;
	}

	public void setPuedeCambiarAplicacion(boolean puedeCambiarAplicacion) {
		this.puedeCambiarAplicacion = puedeCambiarAplicacion;
	}

	public void setPuedeCambiarAplicacion(String puedeCambiarAplicacion) {
		this.puedeCambiarAplicacion = puedeCambiarAplicacion.equals(TRUE);
	}

	public String getPuedeCambiarAplicacion() {
		return (puedeCambiarAplicacion) ? TRUE : FALSE;
	}
}
