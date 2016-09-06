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

package com.comerzzia.servicios.sincronizacion.sincronizadores;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.sincronizacion.general.MedioPagoTiendaBean;
import com.comerzzia.persistencia.sincronizacion.general.MediosPagoTiendaDao;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.log.Logger;


public class SincronizadorTiendaVirtual extends SincronizadorOnline implements ISincronizador, IConfigSincronizacion {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(SincronizadorTiendaVirtual.class);
	
	
	/**
	 * Constructor
	 */
	public SincronizadorTiendaVirtual() {
		super();
	}
	
	
	/**
	 * Inserta el medio de pago si es válido para la tienda virtual,
	 * y si ya existe lo actualiza
	 * 
	 * Si no es válido en la tienda virtual lo actualiza poniendolo
	 * inactivo por si en algún momento se había enviado, para que 
	 * así deje de usarse
	 * 
	 * @param conn
	 * @param config
	 * @param medioPago
	 * @throws SQLException
	 */
	protected void insertarMedioPago(Connection conn, ConfigEmpresaBean config, 
			MedioPagoTiendaBean medioPago) throws SQLException {
		// Si el medio de pago es válido para la tienda virtual lo enviamos
		if (medioPago.isVisibleTiendaVirtual()) {
			try {
				MediosPagoTiendaDao.insert(conn, config, medioPago);
			}
			catch (KeyConstraintViolationException e) {
				MediosPagoTiendaDao.update(conn, config, medioPago);
			}
		}
		else {
			// Por si acaso en algún momento se había enviado a la tienda, 
			// lo inactivamos para que no se use más.
			medioPago.setActivo(false);
			MediosPagoTiendaDao.update(conn, config, medioPago);
		}
	}
}
