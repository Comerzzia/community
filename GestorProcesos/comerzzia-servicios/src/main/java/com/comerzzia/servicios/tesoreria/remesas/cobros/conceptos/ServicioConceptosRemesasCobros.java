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

package com.comerzzia.servicios.tesoreria.remesas.cobros.conceptos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.tesoreria.remesas.cobros.conceptos.ConceptoRemesaCobroBean;
import com.comerzzia.persistencia.tesoreria.remesas.cobros.conceptos.ConceptosRemesasCobrosDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioConceptosRemesasCobros {

	protected static Logger log = Logger.getMLogger(ServicioConceptosRemesasCobros.class);
	
	public static List<ConceptoRemesaCobroBean> consultar(Long idCobro, DatosSesionBean datosSesion)throws ConceptoRemesaCobroException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando conceptos para el documento con identificador " + idCobro);
			conn.abrirConexion(Database.getConnection());
			
			return ConceptosRemesasCobrosDao.consultar(conn, datosSesion.getConfigEmpresa(), idCobro);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando conceptos de un documento: " +  e.getMessage();
			
		    throw new ConceptoRemesaCobroException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

}


