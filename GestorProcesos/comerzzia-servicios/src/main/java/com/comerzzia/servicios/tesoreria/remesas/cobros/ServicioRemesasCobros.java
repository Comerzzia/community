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

package com.comerzzia.servicios.tesoreria.remesas.cobros;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.tesoreria.cobros.DocumentoCobroBean;
import com.comerzzia.persistencia.tesoreria.cobros.DocumentosCobrosDao;
import com.comerzzia.persistencia.tesoreria.remesas.cobros.ParametrosBuscarRemesasCobrosBean;
import com.comerzzia.persistencia.tesoreria.remesas.cobros.RemesaCobroBean;
import com.comerzzia.persistencia.tesoreria.remesas.cobros.RemesasCobrosDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioRemesasCobros {

	protected static Logger log = Logger.getMLogger(ServicioRemesasCobros.class);
	
	public static PaginaResultados consultar(ParametrosBuscarRemesasCobrosBean param, DatosSesionBean datosSesion) throws RemesaCobroException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando remesas de cobros");
			conn.abrirConexion(Database.getConnection());
			
			return RemesasCobrosDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar remesas de cobros: " +  e.getMessage();
			
            throw new RemesaCobroException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static RemesaCobro consultar(Long idRemesa, DatosSesionBean datosSesion) throws RemesaCobroException, RemesaCobroNotFoundException {
		Connection conn = new Connection();
		RemesaCobro remesaCobro = null;
		
		try {
			log.debug("consultar() - Consultando remesa con identificador: " + idRemesa);
			conn.abrirConexion(Database.getConnection());
			
			remesaCobro = new RemesaCobro(RemesasCobrosDao.consultar(conn, datosSesion.getConfigEmpresa(), idRemesa));
			if (remesaCobro == null){
				String msg = "No se ha encontrado el documento con idRemesa: " + idRemesa;
				log.info("consultar() - " + msg);
				
				throw new RemesaCobroNotFoundException(msg);
			}
			return remesaCobro;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar remesa con identificador: " + idRemesa + " - " +  e.getMessage();
			
            throw new RemesaCobroException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void salvar(RemesaCobro remesaCobro, DatosSesionBean datosSesion) throws RemesaCobroException, RemesaCobroConstraintViolationException{

		switch (remesaCobro.getEstadoBean()) {
			case Estado.NUEVO:
				crear(remesaCobro, datosSesion);
				break;
			      
			case Estado.BORRADO:
				eliminar(remesaCobro.getIdRemesa(), datosSesion);
		}
	}

	private static void crear(RemesaCobro remesaCobro, DatosSesionBean datosSesion)throws RemesaCobroException, RemesaCobroConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nueva remesa de cobro ");
			conn.abrirConexion(Database.getConnection());
			
			//obtenemos el contador e insertamos la remesa
			remesaCobro.setIdRemesa(ContadorRemesasCobros.obtenerContador(conn));

			RemesasCobrosDao.insert(conn, datosSesion.getConfigEmpresa(), remesaCobro.getBean());
			
		}
		catch(KeyConstraintViolationException e){
			log.info("crear() - No se ha podido crear la remesa de cobro: " + e.getMessage());
			
			throw new RemesaCobroConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando remesa de cobro: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new RemesaCobroException(msg, e);
    	
		} catch (ContadorException e) {
			String msg = "Error obteniendo contador de remesas de cobros: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new RemesaCobroException(msg, e);
		} 
    	finally {
    		conn.cerrarConexion();
    	}
		
	}

	public static void eliminar(Long idRemesa, DatosSesionBean datosSesion)throws RemesaCobroConstraintViolationException, RemesaCobroException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando remesa de cobro con identificador " + idRemesa);
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			//Obtenemos la lista de documentos de la remesa
			List<DocumentoCobroBean> lstDocumentosRemesa = DocumentosCobrosDao.consultarDocumentosRemesa(conn, datosSesion.getConfigEmpresa(), idRemesa);
			
			for (DocumentoCobroBean documentoCobro : lstDocumentosRemesa) {
				//Quitamos la relación de la remesa con sus documentos
				DocumentosCobrosDao.quitarDocumentoRemesa(conn, datosSesion.getConfigEmpresa(), documentoCobro.getIdCobro());
			}

			//Finalmente borramos la remesa
			RemesasCobrosDao.delete(conn, datosSesion.getConfigEmpresa(), idRemesa);

			conn.commit();
			conn.finalizaTransaccion();
		}
		catch(ForeingKeyConstraintViolationException e){
			conn.deshacerTransaccion();
			
			log.info("eliminar() - No se ha podido eliminar la remesa de cobro: " + e.getMessage());
			throw new RemesaCobroConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();

			String msg = "Error eliminando remesa de cobro: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new RemesaCobroException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static void convertirEnRemesa(Long idRemesa, DatosSesionBean datosSesion)throws RemesaCobroException {
		Connection conn = new Connection();
		
		try {
			log.debug("convertirEnRemesa() - Convirtiendo en remesa la preremesa con identificador " + idRemesa);
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			//Obtenemos los datos de la remesa
			RemesaCobroBean remesaCobro = RemesasCobrosDao.consultar(conn, datosSesion.getConfigEmpresa(), idRemesa);
			remesaCobro.setEstado(remesaCobro.getESTADO_REMESA());
			remesaCobro.setDocumentos(DocumentosCobrosDao.consultarDocumentosRemesa(conn, datosSesion.getConfigEmpresa(), remesaCobro.getIdRemesa()));
			
			//Ponemos a sus documentos el CodBanco de la remesa, la FechaBaja y la FechaCobro
			for (DocumentoCobroBean documentoCobro : remesaCobro.getDocumentos()) {
				documentoCobro.setCodBancoCobro(remesaCobro.getCodBanco());
				documentoCobro.setFechaBaja(remesaCobro.getFechaRemesa());
				documentoCobro.setFechaCobro(remesaCobro.getFechaRemesa());
				
				//Actualizamos los documentos
				DocumentosCobrosDao.update(conn, datosSesion.getConfigEmpresa(), documentoCobro);
			}

			//Convertimos a remesa
			RemesasCobrosDao.convertirEnRemesa(conn, datosSesion.getConfigEmpresa(), remesaCobro);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("convertirEnRemesa() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			String msg = "Error convirtiendo a remesa: " + e.getMessage();
			log.error("convertirEnRemesa() - " + msg);
			
			throw new RemesaCobroException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
}


