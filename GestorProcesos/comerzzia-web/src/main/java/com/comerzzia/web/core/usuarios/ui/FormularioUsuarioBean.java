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

package com.comerzzia.web.core.usuarios.ui;

import java.util.List;

import com.comerzzia.persistencia.core.perfiles.PerfilBean;
import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.persistencia.core.usuarios.perfiles.PerfilUsuarioBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.servicios.core.perfiles.PerfilException;
import com.comerzzia.servicios.core.perfiles.ServicioPerfiles;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.AlmacenException;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.core.ui.FormularioBean;

public class FormularioUsuarioBean extends FormularioBean {

	// Definición de las pestañas del formulario
	private FormularioBean pestañaPerfiles = new FormularioBean();
	private FormularioBean pestañaAlmacenes = new FormularioBean();

	/**
	 * Constructor
	 */
	public FormularioUsuarioBean() {
		this.addPestaña(pestañaPerfiles);
		this.addPestaña(pestañaAlmacenes);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.comerzzia.web.core.ui.FormularioBean#inicializaRegistroActivo()
	 */
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();

		// Inicializamos las pestañas estableciendo las listas de resitros de
		// cada una de ellas
		pestañaPerfiles.setRegistros(((UsuarioBean) this.getRegistroActivo())
				.getLstPerfiles());
		pestañaAlmacenes.setRegistros(((UsuarioBean) this.getRegistroActivo())
				.getLstAlmacenes());
	}

	@SuppressWarnings("unchecked")
	public List<PerfilBean> obtenerListaPerfilesDisponibles()
			throws PerfilException {
		// Consulto la lista total de perfiles
		List<PerfilBean> lstPerfiles = (List<PerfilBean>) ServicioPerfiles
				.consultar();
		// Obtengo la lista de mis perfiles
		List<PerfilUsuarioBean> lstMisPerfiles = pestañaPerfiles.getRegistros();

		// Obtengo la lista final de perfiles
		if (lstMisPerfiles != null) {
			for (PerfilUsuarioBean perfilUsuario : lstMisPerfiles) {
				for (int i = 0; i < lstPerfiles.size(); i++) {
					if ((perfilUsuario.getIdPerfil().equals(lstPerfiles.get(i)
							.getIdPerfil()))
							&& (perfilUsuario.getEstadoBean() != Estado.BORRADO)) {
						lstPerfiles.remove(i);
						break;
					}
				}
			}
		}

		return lstPerfiles;

	}

	@SuppressWarnings("unchecked")
	public List<AlmacenBean> obtenerListaAlmacenesDisponibles(DatosSesionBean datosSesion)
			throws AlmacenException {
		// Consulto la lista total de almacenes
		List<AlmacenBean> lstAlmacenes = (List<AlmacenBean>) ServicioAlmacenes.consultar(datosSesion);
		// Obtengo la lista de mis almacenes
		List<AlmacenUsuarioBean> lstMisAlmacenes = pestañaAlmacenes
				.getRegistros();

		// Obtengo la lista final de almacenes
		if (lstMisAlmacenes != null) {
			for (AlmacenUsuarioBean almacenUsuario : lstMisAlmacenes) {
				for (int i = 0; i < lstAlmacenes.size(); i++) {
					if ((almacenUsuario.getCodAlmacen().equals(lstAlmacenes.get(i)
							.getCodAlm()))
							&& (almacenUsuario.getEstadoBean() != Estado.BORRADO)) {
						lstAlmacenes.remove(i);
						break;
					}
				}
			}
		}

		return lstAlmacenes;
	}
}
