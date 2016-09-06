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

package com.comerzzia.persistencia.tiendavirtual.mediospago;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.general.mediospago.MedioPagoBean;
import com.comerzzia.persistencia.tiendavirtual.config.ConfigTiendaVirtualBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class MediosPagoDao extends MantenimientoDao {

	private static String TABLA = "T_MEDIOS_PAGO_TBL";
	
	private static Logger log = Logger.getMLogger(MediosPagoDao.class);
	
	public static List<MedioPagoBean> consultar(Connection conn, ConfigTiendaVirtualBean config) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<MedioPagoBean> resultados = new ArrayList<MedioPagoBean>();
    	
    	// Consulta
    	String sql = "SELECT CODALM, CODMEDPAG, DESMEDPAG, CONTADO, EFECTIVO, TARJETA_CREDITO, ACTIVO " +
		  			 "FROM " + getNombreElemento(config.getEsquemaTiendaVirtual(), TABLA) +
		  			 " WHERE CODALM = ? AND ACTIVO = 'S'";

    	
        try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, config.getCodAlmacen());
    		
        	log.debug("consultar() - " + pstmt);
        	rs = pstmt.executeQuery();
            while (rs.next()) {
        		MedioPagoBean medioPago = new MedioPagoBean();
        		medioPago.setCodMedioPago(rs.getString("CODMEDPAG"));
        		medioPago.setDesMedioPago(rs.getString("DESMEDPAG"));
        		medioPago.setContado(rs.getString("CONTADO"));
        		medioPago.setEfectivo(rs.getString("EFECTIVO"));
        		medioPago.setTarjetaCredito(rs.getString("TARJETA_CREDITO"));
        		medioPago.setActivo(rs.getString("ACTIVO"));
        		resultados.add(medioPago);
        	} 
            return resultados;
        }
        finally {
    		try {
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	} 
    
	
}
