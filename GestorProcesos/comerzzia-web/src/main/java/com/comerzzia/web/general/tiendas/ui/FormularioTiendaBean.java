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

package com.comerzzia.web.general.tiendas.ui;

import java.util.List;

import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.usuarios.ServicioUsuarios;
import com.comerzzia.servicios.core.usuarios.UsuarioException;
import com.comerzzia.servicios.general.tiendas.Tienda;
import com.comerzzia.servicios.ventas.tarifas.ServicioTarifas;
import com.comerzzia.servicios.ventas.tarifas.TarifaException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.core.ui.FormularioBean;

public class FormularioTiendaBean extends FormularioBean {

	// Definición de las pestañas del formulario
	private FormularioBean pestañaGeneral = new FormularioBean("General");
	private FormularioBean pestañaCajas = new FormularioBean("Cajas");
	private FormularioBean pestañaTarifas = new FormularioBean("Tarifas");
	private FormularioBean pestañaConfiguracionSincronizacion = new FormularioBean("Configuración Sincronización");
	private FormularioBean pestañaUsuarios = new FormularioBean("Usuarios");
	
	/**
	 * Constructor
	 */
	public FormularioTiendaBean() {
		this.addPestaña(pestañaGeneral);
		this.addPestaña(pestañaCajas);
		this.addPestaña(pestañaTarifas);
		this.addPestaña(pestañaConfiguracionSincronizacion);
		this.addPestaña(pestañaUsuarios);
	}

	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();

		// Inicializamos las pestañas de cajas y de tarifas
		// estableciendo las listas de registros de cada una de ellas
		pestañaCajas.setRegistros(((Tienda) this.getRegistroActivo()).getCajas());
		pestañaTarifas.setRegistros(((Tienda) this.getRegistroActivo()).getTarifas());
		pestañaUsuarios.setRegistros(((Tienda) this.getRegistroActivo()).getUsuarios());
	}

	@SuppressWarnings("unchecked")
	public List<TarifaBean> obtenerListaTarifasDisponibles(DatosSesionBean datosSesion)
			throws TarifaException {

		// Consulto la lista total de tarifas
		List<TarifaBean> lstTarifas = (List<TarifaBean>) ServicioTarifas.consultar(datosSesion);
		// Obtengo la lista de mis tarifas
		List<TarifaTiendaBean> lstMisTarifas = pestañaTarifas.getRegistros();

		// Obtengo la lista final de tarifas
		if (lstMisTarifas != null && lstTarifas != null) {
			for (TarifaTiendaBean tarifaTienda : lstMisTarifas) {
				for (int i = 0; i < lstTarifas.size(); i++) {
					if ((tarifaTienda.getCodTarifa().equals(lstTarifas.get(i)
							.getCodTar()))
							&& (tarifaTienda.getEstadoBean() != Estado.BORRADO)) {
						lstTarifas.remove(i);
						break;
					}
				}
			}
		}

		return lstTarifas;
	}
	
	public List<TarifaBean> obtenerListaTarifas(DatosSesionBean datosSesion)
			throws TarifaException {
		
		return ServicioTarifas.consultar(datosSesion);
	}
	
	@SuppressWarnings("unchecked")
	public List<UsuarioBean> obtenerListaUsuariosDisponibles()
			throws UsuarioException {
		// Consulto la lista total de usuarios
		List<UsuarioBean> lstUsuarios = (List<UsuarioBean>) ServicioUsuarios.consultar();
		// Obtengo la lista de mis usuarios
		List<AlmacenUsuarioBean> lstMisUsuarios = pestañaUsuarios.getRegistros();

		// Obtengo la lista final de usuarios
		if (lstMisUsuarios != null) {
			for (AlmacenUsuarioBean almacenUsuario : lstMisUsuarios) {
				for (int i = 0; i < lstUsuarios.size(); i++) {
					if ((almacenUsuario.getIdUsuario() == lstUsuarios.get(i).getIdUsuario())
							&& (almacenUsuario.getEstadoBean() != Estado.BORRADO)) {
						lstUsuarios.remove(i);
						break;
					}
				}
			}
		}

		return lstUsuarios;
	}
	
	public List<UsuarioBean> obtenerListaUsuarios()
			throws UsuarioException {
		
		return ServicioUsuarios.consultar();
	}
}
