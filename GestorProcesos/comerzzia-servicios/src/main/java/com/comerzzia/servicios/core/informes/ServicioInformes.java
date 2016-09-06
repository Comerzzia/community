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

package com.comerzzia.servicios.core.informes;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.informes.InformesDao;
import com.comerzzia.persistencia.core.informes.VersionInformeBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioInformes {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioInformes.class);

	public static List<VersionInformeBean> consultarVersionesInforme(Long idInforme) throws InformeException{
		Connection conn = new Connection();
		try {
			log.debug("consultarVersionesInforme() - Consultando versiones disponibles para el informe con id: " + idInforme);
			conn.abrirConexion(Database.getConnection());
			return InformesDao.consultarVersiones(conn, idInforme);
		}
		catch (SQLException e) {
			log.error("consultarVersionesInforme() - " + e.getMessage());
			String mensaje = "Error al consultar versiones de un informe : " +  e.getMessage();
            throw new InformeException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}


	public static VersionInformeBean consultarVersionInforme(Long idInforme, Long idVersion) 
			throws InformeException, InformeNotFoundException{
		Connection conn = new Connection();
		try {
			log.debug("consultarVersionInforme() - Consultando versión: " + idVersion + " del informe: "  + idInforme);
			conn.abrirConexion(Database.getConnection());
			VersionInformeBean versionInforme =  InformesDao.consultarVersion(conn, idInforme, idVersion);
			if (versionInforme == null){
				String msg = "No se ha encontrado la versión del informe indicada.";
				log.error("consultarVersionInforme() - " + msg);
				throw new InformeNotFoundException(msg);
			}
			return versionInforme;
		}
		catch (SQLException e) {
			log.error("consultarVersionInforme() - " + e.getMessage());
			String mensaje = "Error al consultar versión de un informe : " +  e.getMessage();
            throw new InformeException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
