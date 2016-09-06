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

import com.comerzzia.util.base.ParametrosBuscarBean;


public class ParametrosBuscarUsuariosBean extends ParametrosBuscarBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 5809573177612695732L;

	private String usuario = "";
	private String desUsuario = "";
	private String activo = "";
	
	/**
	 * Constructor
	 */
	public ParametrosBuscarUsuariosBean() {
		super.setOrden("USUARIO");
	}


	/**
	 * @return the usuario
	 */
	public String getUsuario() {
		return usuario;
	}


	/**
	 * @param codusuario the usuario to set
	 */
	public void setUsuario(String usuario) {
		this.usuario = (usuario != null) ? usuario.toUpperCase(): "";
	}


	/**
	 * @return the desusuario
	 */
	public String getDesUsuario() {
		return desUsuario;
	}


	/**
	 * @param desusuario the desusuario to set
	 */
	public void setDesUsuario(String desUsuario) {
		this.desUsuario = (desUsuario != null) ? desUsuario : "";
	}


	public String getActivo() {
		return activo;
	}


	public void setActivo(String activo) {
		this.activo = (activo != null) ? activo : "";
	}
}
