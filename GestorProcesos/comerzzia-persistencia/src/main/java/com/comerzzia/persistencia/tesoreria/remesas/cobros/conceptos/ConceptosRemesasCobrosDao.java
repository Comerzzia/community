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

package com.comerzzia.persistencia.tesoreria.remesas.cobros.conceptos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class ConceptosRemesasCobrosDao extends MantenimientoDao {

	private static String TABLA_DOC = "D_COBROS_DOC_TBL";
	private static String TABLA_VEN = "D_COBROS_VEN_TBL";
	private static String TABLA_CAB_FACTURAS = "D_FACTURAS_REP_CAB_TBL";
	
	private static Logger log = Logger.getMLogger(ConceptosRemesasCobrosDao.class);
	
	public static List<ConceptoRemesaCobroBean> consultar(Connection conn, ConfigEmpresaBean config, Long idCobro) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<ConceptoRemesaCobroBean> resultados = new ArrayList<ConceptoRemesaCobroBean>();
    	String sql = null;
    	
    	sql = "SELECT DISTINCT VEN.ID_VENCIMIENTO_ENLACE, FAC.CODSERIE, FAC.NUMFAC, FAC.CONCEPTO " +
    		    "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA_DOC) + " DOC " +
    		    "INNER JOIN " + getNombreElemento(config.getEsquemaEmpresa(), TABLA_VEN) + " VEN ON (VEN.ID_COBRO = DOC.ID_COBRO) " +
    		    "INNER JOIN " + getNombreElemento(config.getEsquemaEmpresa(), TABLA_CAB_FACTURAS) + " FAC ON (FAC.ID_VENCIMIENTO_ENLACE = VEN.ID_VENCIMIENTO_ENLACE) " +     
    		    "WHERE DOC.ID_COBRO = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idCobro);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		ConceptoRemesaCobroBean concepto = new ConceptoRemesaCobroBean();
        		concepto.setCodSerie(rs.getString("CODSERIE"));
        		concepto.setNumFactura(rs.getLong("NUMFAC"));
        		concepto.setConcepto(rs.getString("CONCEPTO"));
        		
        		resultados.add(concepto);
        	}
        	
    		return resultados;
    	}
    	finally {
    		try{
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try{
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
}
