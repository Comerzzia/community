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

package com.comerzzia.servicios.tesoreria.remesas.pagos.conceptos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.tesoreria.remesas.pagos.conceptos.ConceptoRemesaPagoBean;
import com.comerzzia.persistencia.tesoreria.remesas.pagos.conceptos.ConceptosRemesasPagosDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioConceptosRemesasPagos {

	protected static Logger log = Logger.getMLogger(ServicioConceptosRemesasPagos.class);
	
	public static List<ConceptoRemesaPagoBean> consultar(Long idPago, DatosSesionBean datosSesion)throws ConceptoRemesaPagoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando conceptos para el documento con identificador " + idPago);
			conn.abrirConexion(Database.getConnection());
			
			return ConceptosRemesasPagosDao.consultar(conn, datosSesion.getConfigEmpresa(), idPago);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando conceptos de un documento: " +  e.getMessage();
			
		    throw new ConceptoRemesaPagoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

}


