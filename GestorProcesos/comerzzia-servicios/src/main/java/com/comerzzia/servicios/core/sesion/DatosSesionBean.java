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

package com.comerzzia.servicios.core.sesion;

import java.util.HashMap;
import java.util.Map;

import com.comerzzia.persistencia.core.acciones.AccionBean;
import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.core.empresas.EmpresaBean;
import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.servicios.core.menu.ArbolMenuBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;


/**
 * Datos de una sesión
 * 
 */
public class DatosSesionBean {

	/**
	 * Datos del usuario de la sesión
	 */
	private UsuarioBean usuario;

	/**
	 * Menu del usuario
	 */
	private ArbolMenuBean menu;
	
	/**
	 * Datos de la empresa
	 */
	private EmpresaBean empresa;
	
	/**
	 * Datos de configuración de la sesión
	 */
	private ConfigEmpresaBean configEmpresa;
	
	/**
	 * Variables de la sesión
	 */
	private Map<String, String> variables = new HashMap<String, String>();
	
    /**
     * Atributos de la sesión
     */
	private Map<String, Object> atributos = new HashMap<String, Object>();
	
	/**
	 * Cache de Permisos de Acciones asociados al usuario de la sesión
	 */
	private PermisosAccionesSesion permisos = new PermisosAccionesSesion(this);
    
	
	public UsuarioBean getUsuario() {
		return usuario;
	}

	public void setUsuario(UsuarioBean usuario) {
		this.usuario = usuario;
	}

	public ArbolMenuBean getArbolMenu() {
		return menu;
	}

	public void setArbolMenu(ArbolMenuBean menu) {
		this.menu = menu;
	}

	public EmpresaBean getEmpresa() {
		return empresa;
	}

	public void setEmpresa(EmpresaBean empresa) {
		this.empresa = empresa;
	}

	public ConfigEmpresaBean getConfigEmpresa() {
		return configEmpresa;
	}

	public void setConfigEmpresa(ConfigEmpresaBean configEmpresa) {
		this.configEmpresa = configEmpresa;
	}

	/**
	 * Establece el valor del atributo variables
	 * @param atributos Mapa con las variables que se van a guardar en sesión
	 */
	public void setVariables(Map<String, String> variables) {
		this.variables = variables;
	}

	/**
	 * Obtiene el valor del atributo variables
	 * @return Mapa con las variables guardadas en sesión
	 */
	public Map<String, String> getVariables() {
		return variables;
	}
	
	/**
     * Guarda el valor de una variable guardada en sesión
     * @param variable Nombre de la variable
     * @param valor Valor de la variable
     */
    public void setVariable(String variable, String valor) {
        variables.put(variable, valor);
    }
    
    /**
     * Obtiene el valor de una variable guardada en sesión
     * @param variable Nombre de la variable
     * @return Valor de la variable
     */
    public String getVariable(String variable) {
        return (String) variables.get(variable);
    }

	/**
	 * Establece el valor del atributo atributos
	 * @param atributos Mapa con los objetos que se van a guardar en sesión
	 */
	public void setAtributos(Map<String, Object> atributos) {
		this.atributos = atributos;
	}

	/**
	 * Obtiene el valor del atributo atributos
	 * @return Mapa con los objetos guardados en sesión
	 */
	public Map<String, Object> getAtributos() {
		return atributos;
	}
	
	
	/**
	 * Obtiene los permisos que el usuario de la sesión tiene sobre la acción indicada
	 * @param idAccion
	 * @return
	 */
	public PermisosEfectivosAccionBean getPermisos(AccionBean accion) {
		return permisos.getPermisos(accion);
	}
	
	
	/**
	 * Obtiene los permisos que el usuario de la sesión tiene sobre la acción indicada
	 * Se consulta la caché de permisos de la sesión, y si no se encuentra en ella
	 * se obtienen y se cachean para sucesivas consultas
	 * @param accion
	 * @return
	 */
	public PermisosEfectivosAccionBean getPermisosCache(AccionBean accion) {
		return permisos.getPermisosCache(accion);
	}
}
