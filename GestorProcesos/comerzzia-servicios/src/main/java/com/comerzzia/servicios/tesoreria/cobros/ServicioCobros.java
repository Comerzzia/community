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

package com.comerzzia.servicios.tesoreria.cobros;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.tesoreria.cobros.DocumentoCobroBean;
import com.comerzzia.persistencia.tesoreria.cobros.DocumentosCobrosDao;
import com.comerzzia.persistencia.tesoreria.cobros.ParametrosBuscarDocumentosCobrosBean;
import com.comerzzia.persistencia.tesoreria.cobros.totales.TotalesDocumentosCobrosBean;
import com.comerzzia.persistencia.tesoreria.cobros.tratamiento.TratamientoCobrosBean;
import com.comerzzia.persistencia.tesoreria.cobros.vencimientos.VencimientoDocumentoCobroBean;
import com.comerzzia.persistencia.tesoreria.cobros.vencimientos.VencimientosDocumentoCobroDao;
import com.comerzzia.persistencia.tesoreria.remesas.cobros.RemesaCobroBean;
import com.comerzzia.persistencia.tesoreria.remesas.cobros.RemesasCobrosDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.cobros.vencimientos.ContadorVencimientosCobros;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioCobros {

	protected static Logger log = Logger.getMLogger(ServicioCobros.class);
	
	public static PaginaResultados consultar(ParametrosBuscarDocumentosCobrosBean param, DatosSesionBean datosSesion) throws CobroException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando documentos de cobros");
			conn.abrirConexion(Database.getConnection());
			return DocumentosCobrosDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar documentos de cobros: " +  e.getMessage();
			
            throw new CobroException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static PaginaResultados consultarDocumentosSinRemesar(ParametrosBuscarDocumentosCobrosBean param, DatosSesionBean datosSesion) throws CobroException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarDocumentosSinRemesar() - Consultando documentos de cobros sin remesar");
			conn.abrirConexion(Database.getConnection());
			return DocumentosCobrosDao.consultarDocumentosSinRemesar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultarDocumentosSinRemesar() - " + e.getMessage());
			String mensaje = "Error al consultar documentos de cobros sin remesar: " +  e.getMessage();
			
            throw new CobroException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static List<DocumentoCobroBean> consultarDocumentosRemesa(Long idRemesa, DatosSesionBean datosSesion)throws CobroException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarDocumentosRemesa() - Consultando documentos de la remesa con identificador " + idRemesa);
			conn.abrirConexion(Database.getConnection());
			
			return DocumentosCobrosDao.consultarDocumentosRemesa(conn, datosSesion.getConfigEmpresa(), idRemesa);
		}
		catch (SQLException e) {
			log.error("consultarDocumentosRemesa() - " + e.getMessage());
			String mensaje = "Error consultando documentos de una remesa: " +  e.getMessage();
			
		    throw new CobroException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static DocumentoCobroBean consultar(Long idCobro, DatosSesionBean datosSesion) throws CobroException, CobroNotFoundException {
		Connection conn = new Connection();
		DocumentoCobroBean documentoCobro;
		
		try {
			log.debug("consultar() - Consultando documento con idCobro: " + idCobro);
			conn.abrirConexion(Database.getConnection());
			documentoCobro = DocumentosCobrosDao.consultar(conn, datosSesion.getConfigEmpresa(), idCobro);
			if (documentoCobro == null){
				String msg = "No se ha encontrado el documento con idCobro: " + idCobro;
				log.info("consultar() - " + msg);
				
				throw new CobroNotFoundException(msg);
			}
			return documentoCobro;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar documento con idCobro: " + idCobro + " - " +  e.getMessage();
			
            throw new CobroException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static TotalesDocumentosCobrosBean consultarTotales(ParametrosBuscarDocumentosCobrosBean param, DatosSesionBean datosSesion) throws CobroException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultarTotales() - Consultando totales para los documentos de cobros");
			conn.abrirConexion(Database.getConnection());
			return DocumentosCobrosDao.consultarTotales(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultarTotales() - " + e.getMessage());
			String mensaje = "Error al consultar los totales de los documentos de cobros: " +  e.getMessage();
			
            throw new CobroException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static TotalesDocumentosCobrosBean consultarTotalesDocumentosSinRemesar(ParametrosBuscarDocumentosCobrosBean param, DatosSesionBean datosSesion) throws CobroException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultarTotalesDocumentosSinRemesar() - Consultando totales para los documentos de cobros sin remesar");
			conn.abrirConexion(Database.getConnection());
			return DocumentosCobrosDao.consultarTotalesDocumentosSinRemesar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultarTotalesDocumentosSinRemesar() - " + e.getMessage());
			String mensaje = "Error al consultar los totales de los documentos de cobros sin remesar: " +  e.getMessage();
			
            throw new CobroException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static TotalesDocumentosCobrosBean consultarTotalesRemesa(Long idRemesa, DatosSesionBean datosSesion) throws CobroException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultarTotalesRemesa() - Consultando totales para los documentos con identificador de remesa: " + idRemesa);
			conn.abrirConexion(Database.getConnection());

			return DocumentosCobrosDao.consultarTotalesRemesa(conn, datosSesion.getConfigEmpresa(), idRemesa);
		}
		catch (SQLException e) {
			log.error("consultarTotalesRemesa() - " + e.getMessage());
			String mensaje = "Error al consultar los totales de los documentos de cobros remesados: " +  e.getMessage();
			
            throw new CobroException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static void salvar(DocumentoCobroBean documento, DatosSesionBean datosSesion) throws CobroException, CobroConstraintViolationException{

		switch (documento.getEstadoBean()) {
			case Estado.NUEVO:
				crear(documento, datosSesion);
				break;
			      
			case Estado.MODIFICADO:
				modificar(documento, datosSesion);
		}
	}

	private static void crear(DocumentoCobroBean documento,
			DatosSesionBean datosSesion) throws CobroException, CobroConstraintViolationException {
		Connection conn = new Connection();
		try {
			log.debug("crear() - Creando nuevo documento de cobro ");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			//obtenemos el contador e insertamos el documento
			documento.setIdCobro(ContadorCobros.obtenerContador(conn));
			documento.setCodEmpresa(datosSesion.getEmpresa().getCodEmp());
			documento.setBorrado(false);
			DocumentosCobrosDao.insert(conn, datosSesion.getConfigEmpresa(), documento);
			
			//creamos un nuevo vencimiento asociado al documento y lo salvamos
			VencimientoDocumentoCobroBean vencimiento = new VencimientoDocumentoCobroBean();
			
			vencimiento.setIdVencimiento(ContadorVencimientosCobros.obtenerContador(conn));
			vencimiento.setIdCobro(documento.getIdCobro());
			vencimiento.setFechaVencimiento(documento.getFechaVencimiento());
			vencimiento.setCodSerie(documento.getCodSerie());
			vencimiento.setDocumento(documento.getDocumento());
			vencimiento.setFechaFactura(documento.getFechaFactura());
			vencimiento.setImporte(documento.getImporte());
			
			VencimientosDocumentoCobroDao.insert(conn, datosSesion.getConfigEmpresa(), vencimiento);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch(KeyConstraintViolationException e){
			conn.deshacerTransaccion();
			log.info("crear() - No se ha podido crear el documento de cobro: " + e.getMessage());
			throw new CobroConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error creando documento de cobro: " + e.getMessage();
    		log.error("crear() - " + msg);
    		throw new CobroException(msg, e);
    	} catch (ContadorException e) {
    		conn.deshacerTransaccion();
			String msg = "Error obteniendo contador de documentos de cobros: " + e.getMessage();
			log.error("crear() - " + msg);
			throw new CobroException(msg, e);
		} 
    	finally {
    		conn.cerrarConexion();
    	}
		
	}

	private static void modificar(DocumentoCobroBean documento, DatosSesionBean datosSesion) throws CobroException {
		Connection conn = new Connection();
		try {
			log.debug("modificar() - Modificando el documento de cobro: " +  documento.getIdCobro());
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			DocumentosCobrosDao.update(conn, datosSesion.getConfigEmpresa(), documento);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error modificando documento de cobro: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		throw new CobroException(msg, e);
    	}
		finally {
    		conn.cerrarConexion();
    	}
		
	}
	
	public static void agrupar(TratamientoCobrosBean tratamientoCobros, DatosSesionBean datosSesion) throws CobroException{
		List<VencimientoDocumentoCobroBean> vencimientosMarcados = new ArrayList<VencimientoDocumentoCobroBean>();
		
		Connection conn = new Connection();
		try {
			log.debug("agrupar() - Agrupando documentos de cobros.");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			//comprobamos que coincidan los importes
			if (tratamientoCobros.getImporteAgrupado() != tratamientoCobros.getImporteMarcado()){
				String msg = "Error agrupando documentos de cobros: El importe de los documentos agrupados ha de coincidir con el importe" +
						"de los documentos marcados.";
	    		log.error("agrupar() - " + msg);
	    		throw new CobroException(msg);
			}
			
			for (DocumentoCobroBean documento : tratamientoCobros.getMarcados()){
				if ((documento.getIdRemesa() != null && documento.getIdRemesa() != 0) || documento.getFechaCobro() != null){
					//el documento está remesado o cobrado
					String msg = "Error agrupando documentos de cobros: No se pueden agrupar documentos remesados o cobrados.";
		    		log.error("agrupar() - " + msg);
		    		throw new CobroException(msg);
				}
				//construimos una lista con todos los vencimientos de todos los documentos marcados.
				List<VencimientoDocumentoCobroBean> vencimientos = VencimientosDocumentoCobroDao.consultar(conn, datosSesion.getConfigEmpresa(), documento.getIdCobro());
				vencimientosMarcados.addAll(vencimientos);
				//eliminamos el documento, ya que al ser agrupados, sus vencimientos serán asociados al documento agrupado que le corresponda.
				DocumentosCobrosDao.delete(conn, datosSesion.getConfigEmpresa(), documento.getIdCobro());
			}
			
			for (DocumentoCobroBean documentoAgrupado : tratamientoCobros.getAgrupados()){
				double importeAgrupado = documentoAgrupado.getImporte();
				List<VencimientoDocumentoCobroBean> restantes = new ArrayList<VencimientoDocumentoCobroBean>();
				List<VencimientoDocumentoCobroBean> tratados = new ArrayList<VencimientoDocumentoCobroBean>();
				
				//guardamos el nuevo documento por el que se va agrupar
				documentoAgrupado.setIdCobro(ContadorCobros.obtenerContador(conn));
				documentoAgrupado.setCodEmpresa(datosSesion.getEmpresa().getCodEmp());
				documentoAgrupado.setBorrado(false);
				DocumentosCobrosDao.insert(conn, datosSesion.getConfigEmpresa(), documentoAgrupado);
				
				for (VencimientoDocumentoCobroBean vencimientoMarcado: vencimientosMarcados){
					double importeMarcado = vencimientoMarcado.getImporte();
					
					if(importeAgrupado == importeMarcado){
						//asociamos el vencimientoOriginal con el documento
						asignarVencimiento(documentoAgrupado, vencimientoMarcado);
						
						VencimientosDocumentoCobroDao.update(conn, datosSesion.getConfigEmpresa(), vencimientoMarcado);
						
						tratados.add(vencimientoMarcado);
						break;
						
					}else if(importeAgrupado < importeMarcado){
						//creamos un nuevo vencimiento con el importe y lo asignamos al documento.
						VencimientoDocumentoCobroBean vencimiento = new VencimientoDocumentoCobroBean();
						vencimiento.setIdVencimiento(ContadorVencimientosCobros.obtenerContador(conn));
						vencimiento.setImporte(importeAgrupado);
						
						asignarVencimiento(documentoAgrupado, vencimiento);
						
						VencimientosDocumentoCobroDao.insert(conn, datosSesion.getConfigEmpresa(), vencimiento);
						
						//actualizamos el importe del vencimiento original
						vencimientoMarcado.setImporte(importeMarcado - importeAgrupado);
						
						//lo metemos en la lista para que también sea tratado
						restantes.add(vencimientoMarcado);
						tratados.add(vencimientoMarcado);
						break;
						
					} else{ // importeAgrupado > importeMarcado
						//asignamos el vencimiento y actualizamos el importe del documento
						asignarVencimiento(documentoAgrupado, vencimientoMarcado);
						
						VencimientosDocumentoCobroDao.update(conn, datosSesion.getConfigEmpresa(), vencimientoMarcado);

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
			String msg = "Error agrupando documentos de cobros: " + e.getMessage();
    		log.error("agrupar() - " + msg);
    		throw new CobroException(msg, e);
    	} catch (ContadorException e) {
    		conn.deshacerTransaccion();
			String msg = "Error obteniendo contador de documentos de cobros: " + e.getMessage();
			log.error("agrupar() - " + msg);
			throw new CobroException(msg, e);
		}
		finally {
    		conn.cerrarConexion();
    	}
		
		
	}

	private static void asignarVencimiento(DocumentoCobroBean documento, VencimientoDocumentoCobroBean vencimiento) {
		vencimiento.setIdCobro(documento.getIdCobro());
		vencimiento.setFechaVencimiento(documento.getFechaVencimiento());
		vencimiento.setCodSerie(documento.getCodSerie());
		vencimiento.setDocumento(documento.getDocumento());
		vencimiento.setFechaFactura(documento.getFechaFactura());
	}
	
	public static void cobrar(TratamientoCobrosBean tratamientoCobros, DatosSesionBean datosSesion) throws CobroException {
		Connection conn = new Connection();
		try {
			log.debug("cobrar() - Cobrando documentos de cobros.");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			if (tratamientoCobros.getDocumento().getImporte() < tratamientoCobros.getImporteMarcado()){
				//obtenemos el único documento que contendrá la lista de los documentos marcados.
				DocumentoCobroBean documento = tratamientoCobros.getMarcados().get(0);
				double importeMarcado = tratamientoCobros.getImporteMarcado();
				//actualizamos el importe del documento y lo cobramos
				double importeCobrado = tratamientoCobros.getDocumento().getImporte(); 
				documento.setImporte(importeCobrado);
				documento.setCodBancoCobro(tratamientoCobros.getDocumento().getCodBancoCobro());
				documento.setFechaCobro(tratamientoCobros.getDocumento().getFechaCobro());
				documento.setFechaBaja( tratamientoCobros.getDocumento().getFechaCobro());
				
				DocumentosCobrosDao.update(conn, datosSesion.getConfigEmpresa(), documento);
				
				//actualizamos el importe de los vencimientos del documento
				List<VencimientoDocumentoCobroBean> vencimientos = VencimientosDocumentoCobroDao.consultar(conn, datosSesion.getConfigEmpresa(), documento.getIdCobro());
				for (VencimientoDocumentoCobroBean vencimiento : vencimientos){
					vencimiento.setImporte(importeCobrado);
					VencimientosDocumentoCobroDao.update(conn, datosSesion.getConfigEmpresa(), vencimiento);
				}
				
				//creamos un nuevo documento con el importe restante.
				Double importeRestante = importeMarcado - importeCobrado;
				DocumentoCobroBean documentoRestante = new DocumentoCobroBean();
				documentoRestante.setIdCobro(ContadorCobros.obtenerContador(conn));
				documentoRestante.setCodEmpresa(documento.getCodEmpresa());
				documentoRestante.setCodCliente(documento.getCodCliente());
				documentoRestante.setFechaAlta(new Date());
				documentoRestante.setFechaVencimiento(documento.getFechaVencimiento());
				documentoRestante.setFechaFactura(documento.getFechaFactura());
				documentoRestante.setBorrado(false);
				documentoRestante.setCodTipoEfecto(documento.getCodTipoEfecto());
				documentoRestante.setCodSerie(documento.getCodSerie());
				documentoRestante.setDocumento(documento.getDocumento());
				documentoRestante.setImporte(importeRestante);
				documentoRestante.setObservaciones(documento.getObservaciones());
				documentoRestante.setRemesable(documento.getRemesable());
				documentoRestante.setFechaEntradaDocumento(documento.getFechaEntradaDocumento());
				
				DocumentosCobrosDao.insert(conn, datosSesion.getConfigEmpresa(), documentoRestante);
				
				//creamos un nuevo vencimiento asociado al nuevo documento creado con el importe restante
				VencimientoDocumentoCobroBean vencimientoRestante = new VencimientoDocumentoCobroBean();
				vencimientoRestante.setIdVencimiento(ContadorVencimientosCobros.obtenerContador(conn));
				vencimientoRestante.setIdCobro(documentoRestante.getIdCobro());
				vencimientoRestante.setCodSerie(documentoRestante.getCodSerie());
				vencimientoRestante.setDocumento(documentoRestante.getDocumento());
				vencimientoRestante.setFechaFactura(documentoRestante.getFechaFactura());
				vencimientoRestante.setFechaVencimiento(documentoRestante.getFechaVencimiento());
				vencimientoRestante.setImporte(importeRestante);
				vencimientoRestante.setFechaAlta(new Date());
				
				VencimientosDocumentoCobroDao.insert(conn, datosSesion.getConfigEmpresa(), vencimientoRestante);
				
			}
			else{
				//cobramos cada documento marcado
				for(DocumentoCobroBean documento : tratamientoCobros.getMarcados()){

					documento.setCodBancoCobro(tratamientoCobros.getDocumento().getCodBancoCobro());
					documento.setFechaCobro(tratamientoCobros.getDocumento().getFechaCobro());
					documento.setFechaBaja( tratamientoCobros.getDocumento().getFechaCobro());
					
					DocumentosCobrosDao.update(conn, datosSesion.getConfigEmpresa(), documento);
					
				}
			}
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error cobrando documentos de cobros: " + e.getMessage();
    		log.error("cobrar() - " + msg);
    		throw new CobroException(msg, e);
    	} catch (ContadorException e) {
    		conn.deshacerTransaccion();
			String msg = "Error obteniendo contador de documentos de cobros: " + e.getMessage();
			log.error("cobrar() - " + msg);
			throw new CobroException(msg, e);
		}
		finally {
    		conn.cerrarConexion();
    	}
		
	}

	public static void asignarRemesa(Long idRemesa, Long idCobro, DatosSesionBean datosSesion) throws CobroException {
		Connection conn = new Connection();
		try {
			log.debug("asignarRemesa() - Asignando documento " + idCobro + " a remesa " + idRemesa);
			
			conn.abrirConexion(Database.getConnection());

			DocumentosCobrosDao.asignarRemesa(conn, datosSesion.getConfigEmpresa(), idCobro, idRemesa);
		
		}
		catch (SQLException e) {
			String msg = "Error asignando documento de cobro a remesa: " + e.getMessage();
    		log.error("asignarRemesa() - " + msg);
    	
    		throw new CobroException(msg, e);
    	} 
		finally {
    		conn.cerrarConexion();
    	}
		
	}

	public static void quitarDocumentoRemesa(Long idCobro, DatosSesionBean datosSesion) throws CobroException {
		Connection conn = new Connection();
		try {
			log.debug("quitarDocumentoRemesa() - Quitando relación entre la remesa y el documento de cobro con identificador: " + idCobro);
			
			conn.abrirConexion(Database.getConnection());

			DocumentosCobrosDao.quitarDocumentoRemesa(conn, datosSesion.getConfigEmpresa(), idCobro);
		
		}
		catch (SQLException e) {
			String msg = "Error quitando documento de cobro de la remesa: " + e.getMessage();
    		log.error("quitarDocumentoRemesa() - " + msg);
    	
    		throw new CobroException(msg, e);
    	} 
		finally {
    		conn.cerrarConexion();
    	}
		
	}
	
	public static void generarDevolucion(Long idCobro, DatosSesionBean datosSesion) throws CobroException, CobroConstraintViolationException {
		Connection conn = new Connection();
		try {
			log.debug("generarDevolucion() - Generando devolución para el documento de cobro con identificador: " + idCobro);
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			//Obtenemos todos los datos del documento de cobro a devolver
			DocumentoCobroBean documentoCobro = DocumentosCobrosDao.consultar(conn, datosSesion.getConfigEmpresa(), idCobro);
			
			//Obtenemos la remesa
			RemesaCobroBean remesaCobro = RemesasCobrosDao.consultar(conn, datosSesion.getConfigEmpresa(), documentoCobro.getIdRemesa());

			//Creamos el objeto DocumentoCobroBean que contendrá el nuevo documento
			//con algunas variaciones en cuanto al antiguo
			DocumentoCobroBean documentoCobroBean = new DocumentoCobroBean(documentoCobro);
			documentoCobroBean.setCodBancoDevolucion(remesaCobro.getCodBanco());
			documentoCobroBean.setIdCobro(ContadorCobros.obtenerContador(conn));
			
			//Insertamos el nuevo documento
			DocumentosCobrosDao.insert(conn, datosSesion.getConfigEmpresa(), documentoCobroBean);

			//Creamos el objeto VencimientoDocumentoCobroBean con los datos correspondientes
			VencimientoDocumentoCobroBean vencimientoDocumentoCobro = new VencimientoDocumentoCobroBean();
			vencimientoDocumentoCobro.setIdVencimiento(ContadorVencimientosCobros.obtenerContador(conn));
			vencimientoDocumentoCobro.setIdCobro(documentoCobroBean.getIdCobro());
			vencimientoDocumentoCobro.setCodSerie(documentoCobroBean.getCodSerie());
			vencimientoDocumentoCobro.setDocumento(documentoCobroBean.getDocumento());
			vencimientoDocumentoCobro.setFechaVencimiento(documentoCobroBean.getFechaVencimiento());
			vencimientoDocumentoCobro.setFechaAlta(documentoCobroBean.getFechaAlta());
			vencimientoDocumentoCobro.setImporte(documentoCobroBean.getImporte());

			//Insertamos el vencimiento del nuevo documento de cobro
			VencimientosDocumentoCobroDao.insert(conn, datosSesion.getConfigEmpresa(), vencimientoDocumentoCobro);
			
			//Actualizamos el documento antiguo indicando que ha sido devuelto
			documentoCobro.setIdCobroDevolucion(documentoCobroBean.getIdCobro());
			DocumentosCobrosDao.update(conn, datosSesion.getConfigEmpresa(), documentoCobro);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (ContadorException e) {
    		conn.deshacerTransaccion();
			String msg = "Error generando devolucion para el documento de cobro: " + e.getMessage();
			log.error("generarDevolucion() - " + msg);

			throw new CobroException(msg, e);
		} 
		catch(KeyConstraintViolationException e){
			conn.deshacerTransaccion();
			log.info("generarDevolucion() - No se ha podido generar la devolución para el documento de cobro: " + e.getMessage());

			throw new CobroConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error generando devolucion para el documento de cobro: " + e.getMessage();
    		log.error("generarDevolucion() - " + msg);
    	
    		throw new CobroException(msg, e);
    	} 
		finally {
    		conn.cerrarConexion();
    	}
		
	}

}


