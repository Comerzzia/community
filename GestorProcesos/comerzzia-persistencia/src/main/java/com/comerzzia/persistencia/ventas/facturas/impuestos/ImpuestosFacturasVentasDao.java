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

package com.comerzzia.persistencia.ventas.facturas.impuestos;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class ImpuestosFacturasVentasDao extends MantenimientoDao {

protected static final String TABLA = "D_FACTURAS_REP_IMP_TBL";
	
	/** Logger */
	protected static Logger log = Logger.getMLogger(ImpuestosFacturasVentasDao.class);
	
	public static void insert(Connection conn, ConfigEmpresaBean config, ImpuestoBean impuesto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_FACTURA_REP, CODIMP, BASE, IMPUESTOS, TOTAL) VALUES " +
		      "(?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, impuesto.getIdDocumento());
			pstmt.setString(2, impuesto.getCodImpuesto());
			pstmt.setDouble(3, impuesto.getBase());
			pstmt.setDouble(4, impuesto.getImpuestos());
			pstmt.setDouble(5, impuesto.getTotal());
			
			log.debug("insert() - " + pstmt);
	    	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
			try {
				pstmt.close();
			}
			catch(Exception ignore) {;}
		}
	}
}
