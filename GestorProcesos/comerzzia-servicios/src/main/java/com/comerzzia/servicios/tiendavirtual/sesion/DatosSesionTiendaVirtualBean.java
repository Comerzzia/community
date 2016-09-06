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

package com.comerzzia.servicios.tiendavirtual.sesion;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.tiendavirtual.clientes.UsuarioClienteTiendaVirtualBean;
import com.comerzzia.persistencia.tiendavirtual.config.ConfigTiendaVirtualBean;
import com.comerzzia.persistencia.tiendavirtual.tiendas.TiendaVirtualBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;

/**
 * Datos de una sesión
 * 
 */
public class DatosSesionTiendaVirtualBean {

	/**
	 * Datos del usuario cliente de la sesión
	 */
	private UsuarioClienteTiendaVirtualBean usuarioCliente;

	/**
	 * Datos de la tienda virtual de la sesión.
	 */
	private TiendaVirtualBean tienda;

	/**
	 * Datos de configuración de la sesión
	 */
	private ConfigTiendaVirtualBean configTiendaVirtual;

	private Long idGrupoImpuestos = null;
	
	public Long getIdGrupoImpuestos() {
		return idGrupoImpuestos;
	}
	public void setIdGrupoImpuestos(Long idGrupoImpuestos) {
		this.idGrupoImpuestos = idGrupoImpuestos;
	}

	public UsuarioClienteTiendaVirtualBean getUsuarioCliente() {
		return usuarioCliente;
	}

	public void setUsuarioCliente(UsuarioClienteTiendaVirtualBean usuarioCliente) {
		this.usuarioCliente = usuarioCliente;
	}

	public ConfigTiendaVirtualBean getConfigTiendaVirtual() {
		return configTiendaVirtual;
	}

	public void setConfigTiendaVirtual(
			ConfigTiendaVirtualBean configTiendaVirtual) {
		this.configTiendaVirtual = configTiendaVirtual;
	}

	public TiendaVirtualBean getTienda() {
		return tienda;
	}

	public void setTienda(TiendaVirtualBean tienda) {
		this.tienda = tienda;
	}
	
	public boolean isUsuarioLogado(){
		return getUsuarioCliente() != null && !getUsuarioCliente().isEstadoNuevo();
	}
	
	public void logoutUsuario(){
		this.usuarioCliente = null;
	}
	
	public DatosSesionBean getDatosSesionEmpresa(){
		DatosSesionBean datosSesionEmpresa = new DatosSesionBean(); 
		ConfigEmpresaBean config = new ConfigEmpresaBean();
		config.setEsquemaEmpresa(getConfigTiendaVirtual().getEsquemaTiendaVirtual());
		datosSesionEmpresa.setConfigEmpresa(config);
		return datosSesionEmpresa;
	}

	
}
