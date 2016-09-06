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

package com.comerzzia.servicios.ventas.tickets.errores;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.net.URL;
import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.ventas.tickets.errores.ErrorTicketBean;
import com.comerzzia.persistencia.ventas.tickets.errores.ErroresTicketsDao;
import com.comerzzia.persistencia.ventas.tickets.errores.ParametrosBuscarErrorTicketsBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.util.xml.XMLDocumentException;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.util.xsd.ValidarXmlContraXsd;

public class ServicioErroresTickets {

	protected static Logger log = Logger.getMLogger(ServicioErroresTickets.class);

	public static PaginaResultados consultar(ParametrosBuscarErrorTicketsBean param, DatosSesionBean datosSesion) throws ErrorTicketException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando tickets erróneos");

			conn.abrirConexion(Database.getConnection());
			return ErroresTicketsDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar tickets erróneos: " +  e.getMessage();
			
            throw new ErrorTicketException(mensaje, e);
            
		} 
		catch (XMLDocumentException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar tickets erróneos: " +  e.getMessage();
			
			throw new ErrorTicketException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static List<ErrorTicketBean> consultarTicketsErroneos(ParametrosBuscarErrorTicketsBean param, DatosSesionBean datosSesion) throws ErrorTicketException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultarTicketsErroneos() - Consultando tickets erróneos");

			conn.abrirConexion(Database.getConnection());
			return ErroresTicketsDao.consultarTicketsErroneos(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultarTicketsErroneos() - " + e.getMessage());
			String mensaje = "Error al consultar tickets erróneos: " +  e.getMessage();
			
            throw new ErrorTicketException(mensaje, e);
            
		} 
		catch (XMLDocumentException e) {
			log.error("consultarTicketsErroneos() - " + e.getMessage());
			String mensaje = "Error al consultar tickets erróneos: " +  e.getMessage();
			
			throw new ErrorTicketException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static ErrorTicketBean consultar(String uidTicket, DatosSesionBean datosSesion)throws ErrorTicketNotFoundException, ErrorTicketException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			
			ErrorTicketBean ticket = ErroresTicketsDao.consultar(conn, uidTicket, datosSesion.getConfigEmpresa());
			if(ticket == null){
				String msg = "No se ha encontrado el ticket de error con identificador: " + uidTicket;
				log.info("consultar() - " + msg);
				throw new ErrorTicketNotFoundException(msg);
			}
			
			return ticket;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un artículo: " +  e.getMessage();
			
		    throw new ErrorTicketException(mensaje, e);
		}
		catch (XMLDocumentException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar tickets erróneos: " +  e.getMessage();
			
			throw new ErrorTicketException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static void eliminar(String uidTicket, DatosSesionBean datosSesion)throws ErrorTicketException, ErrorTicketConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando ticket de error " + uidTicket);
			conn.abrirConexion(Database.getConnection());

			ErroresTicketsDao.delete(conn, datosSesion.getConfigEmpresa(), uidTicket);
			
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el ticket de error: "+ e.getMessage());
			throw new ErrorTicketConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando ticket de error: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new ErrorTicketException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}


	public static void modificar(String uidTicket, String xml, URL url, DatosSesionBean datosSesion)throws ErrorTicketException, XSDException{
		Connection conn = new Connection();

		try {
			log.debug("modificar() - Modificando ticket de error " + uidTicket);
			//1º Controlamos que el xml sea un xml
			try{
				InputStream is = new ByteArrayInputStream(xml.getBytes("UTF-8"));
				XMLDocumentUtils.createDocumentBuilder().parse(is);
			}
			catch (Exception e) {
				throw new XSDException("El xml introducido no es correcto", e);
			}
			
			//2º Debe pasar el xsd
			try{
				ValidarXmlContraXsd.validarXmlconXsd(xml, url);
			}
			catch (Exception e) {
				throw new XSDException(e.getMessage(), e);
			}
			
			//3º TODO:Debe pasar la validación contable
			
			conn.abrirConexion(Database.getConnection());
			//Finalmente lo modificamos
			ErroresTicketsDao.updateXML(conn, datosSesion.getConfigEmpresa(), 
										xml, uidTicket);
		
		} 
		catch (SQLException e) {
			String msg = "Error modificando xml del ticket de error: " + e.getMessage();
			log.error("modificar() - " + msg);
		
			throw new ErrorTicketException(msg, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}
}
