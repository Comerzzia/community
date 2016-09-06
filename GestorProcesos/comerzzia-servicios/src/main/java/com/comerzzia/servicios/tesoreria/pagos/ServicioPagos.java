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

package com.comerzzia.servicios.tesoreria.pagos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.tesoreria.pagos.DocumentoPagoBean;
import com.comerzzia.persistencia.tesoreria.pagos.DocumentosPagosDao;
import com.comerzzia.persistencia.tesoreria.pagos.ParametrosBuscarDocumentosPagosBean;
import com.comerzzia.persistencia.tesoreria.pagos.totales.TotalesDocumentosPagosBean;
import com.comerzzia.persistencia.tesoreria.pagos.tratamiento.TratamientoPagosBean;
import com.comerzzia.persistencia.tesoreria.pagos.vencimientos.VencimientoDocumentoPagoBean;
import com.comerzzia.persistencia.tesoreria.pagos.vencimientos.VencimientosDocumentoPagoDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.pagos.vencimientos.ContadorVencimientosPagos;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioPagos {

protected static Logger log = Logger.getMLogger(ServicioPagos.class);
	
	public static PaginaResultados consultar(ParametrosBuscarDocumentosPagosBean param, DatosSesionBean datosSesion) throws PagoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando documentos de pagos");
			conn.abrirConexion(Database.getConnection());
			return DocumentosPagosDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar documentos de pagos: " +  e.getMessage();
			
            throw new PagoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static PaginaResultados consultarDocumentosSinRemesar(ParametrosBuscarDocumentosPagosBean param, DatosSesionBean datosSesion) throws PagoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarDocumentosSinRemesar() - Consultando documentos de pagos sin remesar");
			conn.abrirConexion(Database.getConnection());
			return DocumentosPagosDao.consultarDocumentosSinRemesar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultarDocumentosSinRemesar() - " + e.getMessage());
			String mensaje = "Error al consultar documentos de pagos sin remesar: " +  e.getMessage();
			
            throw new PagoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static List<DocumentoPagoBean> consultarDocumentosRemesa(Long idRemesa, DatosSesionBean datosSesion)throws PagoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarDocumentosRemesa() - Consultando documentos de la remesa con identificador " + idRemesa);
			conn.abrirConexion(Database.getConnection());
			
			return DocumentosPagosDao.consultarDocumentosRemesa(conn, datosSesion.getConfigEmpresa(), idRemesa);
		}
		catch (SQLException e) {
			log.error("consultarDocumentosRemesa() - " + e.getMessage());
			String mensaje = "Error consultando documentos de una remesa: " +  e.getMessage();
			
		    throw new PagoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static DocumentoPagoBean consultar(Long idPago, DatosSesionBean datosSesion) throws PagoException, PagoNotFoundException {
		Connection conn = new Connection();
		DocumentoPagoBean documentoPago;
		
		try {
			log.debug("consultar() - Consultando documento con idPago: " + idPago);
			conn.abrirConexion(Database.getConnection());
			documentoPago = DocumentosPagosDao.consultar(conn, datosSesion.getConfigEmpresa(), idPago);
			if (documentoPago == null){
				String msg = "No se ha encontrado el documento con idPago: " + idPago;
				log.info("consultar() - " + msg);
				
				throw new PagoNotFoundException(msg);
			}
			return documentoPago;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar documento con idPago: " + idPago + " - " +  e.getMessage();
			
            throw new PagoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static TotalesDocumentosPagosBean consultarTotales(ParametrosBuscarDocumentosPagosBean param, DatosSesionBean datosSesion) throws PagoException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultarTotales() - Consultando totales para los documentos de pagos");
			conn.abrirConexion(Database.getConnection());
			return DocumentosPagosDao.consultarTotales(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultarTotales() - " + e.getMessage());
			String mensaje = "Error al consultar los totales de los documentos de pagos: " +  e.getMessage();
			
            throw new PagoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static TotalesDocumentosPagosBean consultarTotalesDocumentosSinRemesar(ParametrosBuscarDocumentosPagosBean param, DatosSesionBean datosSesion) throws PagoException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultarTotalesDocumentosSinRemesar() - Consultando totales para los documentos de pagos sin remesar");
			conn.abrirConexion(Database.getConnection());
			return DocumentosPagosDao.consultarTotalesDocumentosSinRemesar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultarTotalesDocumentosSinRemesar() - " + e.getMessage());
			String mensaje = "Error al consultar los totales de los documentos de pagos sin remesar: " +  e.getMessage();
			
            throw new PagoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static TotalesDocumentosPagosBean consultarTotalesRemesa(Long idRemesa, DatosSesionBean datosSesion) throws PagoException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultarTotalesRemesa() - Consultando totales para los documentos con identificador de remesa: " + idRemesa);
			conn.abrirConexion(Database.getConnection());

			return DocumentosPagosDao.consultarTotalesRemesa(conn, datosSesion.getConfigEmpresa(), idRemesa);
		}
		catch (SQLException e) {
			log.error("consultarTotalesRemesa() - " + e.getMessage());
			String mensaje = "Error al consultar los totales de los documentos de pagos remesados: " +  e.getMessage();
			
            throw new PagoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static void salvar(DocumentoPagoBean documento, DatosSesionBean datosSesion) throws PagoConstraintViolationException, PagoException {
		
		switch (documento.getEstadoBean()) {
		case Estado.NUEVO:
			crear(documento, datosSesion);
			break;
		      
		case Estado.MODIFICADO:
			modificar(documento, datosSesion);
		}
		
	}

	private static void modificar(DocumentoPagoBean documento, DatosSesionBean datosSesion) throws PagoException {
		Connection conn = new Connection();
		try {
			log.debug("modificar() - Modificando el documento de pago: " +  documento.getIdPago());
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			DocumentosPagosDao.update(conn, datosSesion.getConfigEmpresa(), documento);
			
			//si el documento es remesable, establecemos la fecha de aceptación a todos sus vencimientos
			if (documento.isRemesable()){
				List<VencimientoDocumentoPagoBean> vencimientos = VencimientosDocumentoPagoDao.consultar(conn, datosSesion.getConfigEmpresa(), documento.getIdPago());
				for (VencimientoDocumentoPagoBean vencimiento : vencimientos){
					vencimiento.setFechaAceptacion(new Date());
					VencimientosDocumentoPagoDao.update(conn, datosSesion.getConfigEmpresa(), vencimiento);
				}
			}
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error modificando documento de pago: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		throw new PagoException(msg, e);
    	}
		finally {
    		conn.cerrarConexion();
    	}
		
	}

	private static void crear(DocumentoPagoBean documento, DatosSesionBean datosSesion) throws PagoConstraintViolationException, PagoException {
		Connection conn = new Connection();
		try {
			log.debug("crear() - Creando nuevo documento de pago ");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			//obtenemos el contador e insertamos el documento
			documento.setIdPago(ContadorPagos.obtenerContador(conn));
			documento.setCodEmpresa(datosSesion.getEmpresa().getCodEmp());
			documento.setBorrado(false);
			DocumentosPagosDao.insert(conn, datosSesion.getConfigEmpresa(), documento);
			
			//creamos un nuevo vencimiento asociado al documento y lo salvamos
			VencimientoDocumentoPagoBean vencimiento = new VencimientoDocumentoPagoBean();
			
			vencimiento.setIdVencimiento(ContadorVencimientosPagos.obtenerContador(conn));
			vencimiento.setIdPago(documento.getIdPago());
			vencimiento.setFechaVencimiento(documento.getFechaVencimiento());
			vencimiento.setCodSerie(documento.getCodSerie());
			vencimiento.setDocumento(documento.getDocumento());
			vencimiento.setFechaFactura(documento.getFechaFactura());
			vencimiento.setImporte(documento.getImporte());
			if (documento.isRemesable()){
				vencimiento.setFechaAceptacion(new Date());
			}
			
			VencimientosDocumentoPagoDao.insert(conn, datosSesion.getConfigEmpresa(), vencimiento);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch(KeyConstraintViolationException e){
			conn.deshacerTransaccion();
			log.info("crear() - No se ha podido crear el documento de pago: " + e.getMessage());
			throw new PagoConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error creando documento de pago: " + e.getMessage();
    		log.error("crear() - " + msg);
    		throw new PagoException(msg, e);
    	} catch (ContadorException e) {
    		conn.deshacerTransaccion();
			String msg = "Error obteniendo contador de documentos de pagos: " + e.getMessage();
			log.error("crear() - " + msg);
			throw new PagoException(msg, e);
		} 
    	finally {
    		conn.cerrarConexion();
    	}
		
	}
	
	public static void agrupar(TratamientoPagosBean tratamientoPagos, DatosSesionBean datosSesion) throws PagoException{
		List<VencimientoDocumentoPagoBean> vencimientosMarcados = new ArrayList<VencimientoDocumentoPagoBean>();
		
		Connection conn = new Connection();
		try {
			log.debug("agrupar() - Agrupando documentos de pagos.");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			//comprobamos que coincidan los importes
			if (tratamientoPagos.getImporteAgrupado() != tratamientoPagos.getImporteMarcado()){
				String msg = "Error agrupando documentos de Pagos: El importe de los documentos agrupados ha de coincidir con el importe" +
						"de los documentos marcados.";
	    		log.error("agrupar() - " + msg);
	    		throw new PagoException(msg);
			}
			
			for (DocumentoPagoBean documento : tratamientoPagos.getMarcados()){
				if ((documento.getIdRemesa() != null && documento.getIdRemesa() != 0) || documento.getFechaPago() != null){
					//el documento está remesado o cobrado
					String msg = "Error agrupando documentos de pagos: No se pueden agrupar documentos remesados o cobrados.";
		    		log.error("agrupar() - " + msg);
		    		throw new PagoException(msg);
				}
				//construimos una lista con todos los vencimientos de todos los documentos marcados.
				List<VencimientoDocumentoPagoBean> vencimientos = VencimientosDocumentoPagoDao.consultar(conn, datosSesion.getConfigEmpresa(), documento.getIdPago());
				vencimientosMarcados.addAll(vencimientos);
				//eliminamos el documento, ya que al ser agrupados, sus vencimientos serán asociados al documento agrupado que le corresponda.
				DocumentosPagosDao.delete(conn, datosSesion.getConfigEmpresa(), documento.getIdPago());
			}
			
			for (DocumentoPagoBean documentoAgrupado : tratamientoPagos.getAgrupados()){
				double importeAgrupado = documentoAgrupado.getImporte();
				List<VencimientoDocumentoPagoBean> restantes = new ArrayList<VencimientoDocumentoPagoBean>();
				List<VencimientoDocumentoPagoBean> tratados = new ArrayList<VencimientoDocumentoPagoBean>();
				
				//guardamos el nuevo documento por el que se va agrupar
				documentoAgrupado.setIdPago(ContadorPagos.obtenerContador(conn));
				documentoAgrupado.setCodEmpresa(datosSesion.getEmpresa().getCodEmp());
				documentoAgrupado.setBorrado(false);
				DocumentosPagosDao.insert(conn, datosSesion.getConfigEmpresa(), documentoAgrupado);
				
				for (VencimientoDocumentoPagoBean vencimientoMarcado: vencimientosMarcados){
					double importeMarcado = vencimientoMarcado.getImporte();
					
					if(importeAgrupado == importeMarcado){
						//asociamos el vencimientoOriginal con el documento
						asignarVencimiento(documentoAgrupado, vencimientoMarcado);
						
						VencimientosDocumentoPagoDao.update(conn, datosSesion.getConfigEmpresa(), vencimientoMarcado);
						
						tratados.add(vencimientoMarcado);
						break;
						
					}else if(importeAgrupado < importeMarcado){
						//creamos un nuevo vencimiento con el importe y lo asignamos al documento.
						VencimientoDocumentoPagoBean vencimiento = new VencimientoDocumentoPagoBean();
						vencimiento.setIdVencimiento(ContadorVencimientosPagos.obtenerContador(conn));
						vencimiento.setImporte(importeAgrupado);
						
						asignarVencimiento(documentoAgrupado, vencimiento);
						
						VencimientosDocumentoPagoDao.insert(conn, datosSesion.getConfigEmpresa(), vencimiento);
						
						//actualizamos el importe del vencimiento original
						vencimientoMarcado.setImporte(importeMarcado - importeAgrupado);
						
						//lo metemos en la lista para que también sea tratado
						restantes.add(vencimientoMarcado);
						tratados.add(vencimientoMarcado);
						break;
						
					} else{ // importeAgrupado > importeMarcado
						//asignamos el vencimiento y actualizamos el importe del documento
						asignarVencimiento(documentoAgrupado, vencimientoMarcado);
						
						VencimientosDocumentoPagoDao.update(conn, datosSesion.getConfigEmpresa(), vencimientoMarcado);

						importeAgrupado -= importeMarcado;
						
						tratados.add(vencimientoMarcado);
					}
				}
				
				//borramos de la lista original los vencimientos tratados y añadimos aquellos vencimientos con importes restantes
				vencimientosMarcados.removeAll(tratados);
				vencimientosMarcados.addAll(0, restantes);
				
				
			}
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error agrupando documentos de Pagos: " + e.getMessage();
    		log.error("agrupar() - " + msg);
    		throw new PagoException(msg, e);
    	} catch (ContadorException e) {
    		conn.deshacerTransaccion();
			String msg = "Error obteniendo contador de documentos de Pagos: " + e.getMessage();
			log.error("agrupar() - " + msg);
			throw new PagoException(msg, e);
		}
		finally {
    		conn.cerrarConexion();
    	}
		
		
	}

	private static void asignarVencimiento(DocumentoPagoBean documento, VencimientoDocumentoPagoBean vencimiento) {
		vencimiento.setIdPago(documento.getIdPago());
		vencimiento.setFechaVencimiento(documento.getFechaVencimiento());
		vencimiento.setCodSerie(documento.getCodSerie());
		vencimiento.setDocumento(documento.getDocumento());
		vencimiento.setFechaFactura(documento.getFechaFactura());
		//si el documento es remesable, establecemos la fecha de aceptación del vencimiento asociado.
		if (documento.isRemesable()){
			vencimiento.setFechaAceptacion(new Date());
		}
	}
	
	public static void pagar(TratamientoPagosBean tratamientoPagos, DatosSesionBean datosSesion) throws PagoException {
		Connection conn = new Connection();
		try {
			log.debug("pagar() - Pagando documentos de pagos.");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			double importeMarcado = tratamientoPagos.getImporteMarcado();
			double importeCobrado = tratamientoPagos.getDocumento().getImporte();
			
			if (tratamientoPagos.getDocumento().getImporte() < importeMarcado){
				//obtenemos el único documento que contendrá la lista de los documentos marcados.
				DocumentoPagoBean documento = tratamientoPagos.getMarcados().get(0);
				
				//actualizamos el importe del documento y lo cobramos
				documento.setImporte(importeCobrado);
				documento.setCodBancoPago(tratamientoPagos.getDocumento().getCodBancoPago());
				documento.setFechaPago(tratamientoPagos.getDocumento().getFechaPago());
				documento.setFechaBaja( tratamientoPagos.getDocumento().getFechaPago());
				
				DocumentosPagosDao.update(conn, datosSesion.getConfigEmpresa(), documento);
				
				//actualizamos el importe de los vencimientos del documento
				List<VencimientoDocumentoPagoBean> vencimientos = VencimientosDocumentoPagoDao.consultar(conn, datosSesion.getConfigEmpresa(), documento.getIdPago());
				for (VencimientoDocumentoPagoBean vencimiento : vencimientos){
					vencimiento.setImporte(importeCobrado);
					VencimientosDocumentoPagoDao.update(conn, datosSesion.getConfigEmpresa(), vencimiento);
				}
				
				//creamos un nuevo documento con el importe restante.
				Double importeRestante = importeMarcado - importeCobrado;
				DocumentoPagoBean documentoRestante = new DocumentoPagoBean();
				documentoRestante.setIdPago(ContadorPagos.obtenerContador(conn));
				documentoRestante.setCodEmpresa(documento.getCodEmpresa());
				documentoRestante.setCodProveedor(documento.getCodProveedor());
				documentoRestante.setFechaAlta(new Date());
				documentoRestante.setFechaVencimiento(documento.getFechaVencimiento());
				documentoRestante.setFechaFactura(documento.getFechaFactura());
				documentoRestante.setBorrado(false);
				documentoRestante.setCodTipoEfecto(documento.getCodTipoEfecto());
				documentoRestante.setCodSerie(documento.getCodSerie());
				documentoRestante.setDocumento(documento.getDocumento());
				documentoRestante.setImporte(importeRestante);
				documentoRestante.setObservaciones(documento.getObservaciones());
				documentoRestante.setRemesable(documento.isRemesable());
				documentoRestante.setFechaEmision(documento.getFechaEmision());
				
				DocumentosPagosDao.insert(conn, datosSesion.getConfigEmpresa(), documentoRestante);
				
				//creamos un nuevo vencimiento asociado al nuevo documento creado con el importe restante
				VencimientoDocumentoPagoBean vencimientoRestante = new VencimientoDocumentoPagoBean();
				vencimientoRestante.setIdVencimiento(ContadorVencimientosPagos.obtenerContador(conn));
				vencimientoRestante.setIdPago(documentoRestante.getIdPago());
				vencimientoRestante.setCodSerie(documentoRestante.getCodSerie());
				vencimientoRestante.setDocumento(documentoRestante.getDocumento());
				vencimientoRestante.setFechaFactura(documentoRestante.getFechaFactura());
				vencimientoRestante.setFechaVencimiento(documentoRestante.getFechaVencimiento());
				vencimientoRestante.setImporte(importeRestante);
				vencimientoRestante.setFechaAlta(new Date());
				if (documentoRestante.isRemesable()){
					vencimientoRestante.setFechaAceptacion(new Date());
				}
				
				VencimientosDocumentoPagoDao.insert(conn, datosSesion.getConfigEmpresa(), vencimientoRestante);
			}
			else{
				//cobramos cada documento marcado
				for(DocumentoPagoBean documento : tratamientoPagos.getMarcados()){

					documento.setCodBancoPago(tratamientoPagos.getDocumento().getCodBancoPago());
					documento.setFechaPago(tratamientoPagos.getDocumento().getFechaPago());
					documento.setFechaBaja( tratamientoPagos.getDocumento().getFechaPago());
					
					DocumentosPagosDao.update(conn, datosSesion.getConfigEmpresa(), documento);
				}
			}
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error pagando documentos de pagos: " + e.getMessage();
    		log.error("pagar() - " + msg);
    		throw new PagoException(msg, e);
    	} catch (ContadorException e) {
    		conn.deshacerTransaccion();
			String msg = "Error obteniendo contador de documentos de pagos: " + e.getMessage();
			log.error("pagar() - " + msg);
			throw new PagoException(msg, e);
		}
		finally {
    		conn.cerrarConexion();
    	}
		
	}

	public static void quitarDocumentoRemesa(Long idPago, DatosSesionBean datosSesion) throws PagoException {
		Connection conn = new Connection();
		try {
			log.debug("quitarDocumentoRemesa() - Quitando relación entre la remesa y el documento de pago con identificador: " + idPago);
			
			conn.abrirConexion(Database.getConnection());

			DocumentosPagosDao.quitarDocumentoRemesa(conn, datosSesion.getConfigEmpresa(), idPago);
		
		}
		catch (SQLException e) {
			String msg = "Error quitando documento de pago de la remesa: " + e.getMessage();
    		log.error("quitarDocumentoRemesa() - " + msg);
    	
    		throw new PagoException(msg, e);
    	} 
		finally {
    		conn.cerrarConexion();
    	}
		
	}

	public static void asignarRemesa(Long idRemesa, Long idPago, DatosSesionBean datosSesion) throws PagoException {
		Connection conn = new Connection();
		try {
			log.debug("asignarRemesa() - Asignando documento " + idPago + " a remesa " + idRemesa);
			
			conn.abrirConexion(Database.getConnection());

			DocumentosPagosDao.asignarRemesa(conn, datosSesion.getConfigEmpresa(), idPago, idRemesa);
		
		}
		catch (SQLException e) {
			String msg = "Error asignando documento de pago a remesa: " + e.getMessage();
    		log.error("asignarRemesa() - " + msg);
    	
    		throw new PagoException(msg, e);
    	} 
		finally {
    		conn.cerrarConexion();
    	}
		
	}

}
