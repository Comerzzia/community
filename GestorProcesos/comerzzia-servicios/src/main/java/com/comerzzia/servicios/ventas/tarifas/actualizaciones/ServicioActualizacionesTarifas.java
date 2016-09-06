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

package com.comerzzia.servicios.ventas.tarifas.actualizaciones;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.ventas.tarifas.ParametrosAsistenteTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifasDao;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.ActualizacionTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.ActualizacionesTarifaDao;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.ParametrosBuscarActualizacionesTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos.ArticuloActualizacionBean;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos.ArticuloActualizacionCopiaBean;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos.ArticulosActualizacionesDao;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos.ParametrosBuscarArticulosActualizacionesBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajesImpuestosBean;
import com.comerzzia.servicios.core.impuestos.porcentajes.ServicioPorcentajesImpuestos;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.VariableException;
import com.comerzzia.servicios.core.variables.VariableNotFoundException;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.articulos.ArticuloActualizacionConstraintViolationException;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.articulos.ArticuloActualizacionException;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.articulos.ServicioArticulosActualizaciones;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioActualizacionesTarifas {

	protected static Logger log = Logger.getMLogger(ServicioActualizacionesTarifas.class);
	
	public static PaginaResultados consultar(ParametrosBuscarActualizacionesTarifaBean param,
			DatosSesionBean datosSesion) throws ActualizacionTarifaException{
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando actualizaciones de la tarifa " + param.getCodTarifa());
			conn.abrirConexion(Database.getConnection());
			return ActualizacionesTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar actualizaciones de la tarifa " + param.getCodTarifa() + ": " + e.getMessage();
			throw new ActualizacionTarifaException(mensaje, e);
		} 
		finally {
			if (conn!=null){
				conn.cerrarConexion();
			}
		}
	}

	public static ActualizacionTarifaBean consultar(long idActualizacion,
			DatosSesionBean datosSesion) throws ActualizacionTarifaNotFoundException, ActualizacionTarifaException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando datos de la actualización: " + idActualizacion);
			conn.abrirConexion(Database.getConnection());
			ActualizacionTarifaBean actualizacion = ActualizacionesTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), idActualizacion);

			if (actualizacion == null) {
				String msg = "No se ha encontrado la actualización con identificador: " + idActualizacion;
				log.info("consultar() - " + msg);
				throw new ActualizacionTarifaNotFoundException(msg);
			}
			return actualizacion;
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de una actualización: " + e.getMessage();
			throw new ActualizacionTarifaException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	public static void salvar(ActualizacionTarifaBean actualizacion,
			DatosSesionBean datosSesion) throws ActualizacionesTarifaConstraintViolationException, ActualizacionTarifaException, ArticuloActualizacionException, ArticuloActualizacionConstraintViolationException {
		switch (actualizacion.getEstadoBean()) {
		case Estado.NUEVO:
			crear(actualizacion, datosSesion);
			break;

		case Estado.MODIFICADO:
			modificar(actualizacion, datosSesion);
			break;

		case Estado.BORRADO:
			eliminar(actualizacion.getIdActualizacion(), datosSesion);
		}
		
	}

	private static void crear(ActualizacionTarifaBean actualizacion,
			DatosSesionBean datosSesion) throws ActualizacionesTarifaConstraintViolationException, ActualizacionTarifaException {
		Connection conn = new Connection();

		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			actualizacion.setIdActualizacion(ContadorActualizaciones.obtenerContador(conn));

			log.debug("crear() - Creando nueva Actualización: " + actualizacion.getIdActualizacion() + " para la tarifa: " + actualizacion.getCodTar());
			
			// insertamos
			ActualizacionesTarifaDao.insert(conn, datosSesion.getConfigEmpresa(), actualizacion);
			
			conn.commit();
			conn.finalizaTransaccion();
		} 
		catch (KeyConstraintViolationException e) {
			conn.deshacerTransaccion();
			log.info("crear() - No se ha podido crear la actualización: " + e.getMessage());
			throw new ActualizacionesTarifaConstraintViolationException("Error creando nueva actualización: " + e.getDefaultMessage());
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error creando nueva actualización: " + e.getMessage();
			log.error("crear() - " + msg);
			throw new ActualizacionTarifaException(msg, e);
		} 
		catch (ContadorException e) {
			conn.deshacerTransaccion();
			String msg = "Error obteniendo contador de actualización: " + e.getMessage();
			log.error("crear() - " + msg);
			throw new ActualizacionTarifaException(msg, e);
		} 
		finally {
			conn.cerrarConexion();
		}
		
	}
	
	private static void modificar(ActualizacionTarifaBean actualizacion,
			DatosSesionBean datosSesion) throws ArticuloActualizacionException, ArticuloActualizacionConstraintViolationException, ActualizacionTarifaException {
		Connection conn = new Connection();
		try {
			log.debug("modificar() - Modificando Actualización " + actualizacion.getIdActualizacion());

			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			ActualizacionesTarifaDao.update(conn, datosSesion.getConfigEmpresa(), actualizacion);
			salvarArticulos(conn, actualizacion, datosSesion);
			
			conn.commit();
			conn.finalizaTransaccion();
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error modificando tarifa: " + e.getMessage();
			log.error("modificar() - " + msg);
			throw new ActualizacionTarifaException(msg, e);
		} 
		finally {
			conn.cerrarConexion();
		}
		
	}

	private static void salvarArticulos(Connection conn, ActualizacionTarifaBean actualizacion, DatosSesionBean datosSesion) throws ArticuloActualizacionException, ArticuloActualizacionConstraintViolationException {
		if (actualizacion.isArticulosCargados()) {
			for (ArticuloActualizacionBean articulo : actualizacion.getArticulosActualizacion()) {
				ServicioArticulosActualizaciones.salvar(conn, articulo, datosSesion);
			}
		}
	}

	public static void eliminar(long idActualizacion, DatosSesionBean datosSesion) throws ActualizacionesTarifaConstraintViolationException, ActualizacionTarifaException {
		Connection conn = new Connection();
		try {
			log.debug("eliminar() - Eliminando Actualización: " + idActualizacion);
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			ArticulosActualizacionesDao.delete(conn, datosSesion.getConfigEmpresa(),idActualizacion);
			ActualizacionesTarifaDao.delete(conn, datosSesion.getConfigEmpresa(), idActualizacion);
			conn.commit();
			conn.finalizaTransaccion();
		} 
		catch (ForeingKeyConstraintViolationException e) {
			conn.deshacerTransaccion();
			log.info("eliminar() - No se ha podido eliminar la tarifa: " + e.getMessage());
			throw new ActualizacionesTarifaConstraintViolationException("Error eliminando tarifa: " + e.getDefaultMessage());
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error eliminando tarifa: " + e.getMessage();
			log.error("eliminar() - " + msg);

			throw new ActualizacionTarifaException(msg, e);
		} 
		finally {
			conn.cerrarConexion();
		}
		
	}

	public static void insercionArticulosMasiva( ParametrosAsistenteTarifaBean param, DatosSesionBean datosSesion) throws ArticuloActualizacionException, ArticuloActualizacionConstraintViolationException {
		Connection conn = new Connection();
		try {
			log.debug("insercionArticulosMasiva() - Inicio de la inserción masiva de artículos en la actualización " + param.getIdActualizacion() + " desde la tarifa " + param.getCodTarOrigen() + " ... ");
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			// obtenemos porcentajes de impuesto
			TarifaBean tarifa = TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(), param.getCodTarActual());
			PorcentajesImpuestosBean porcentajes = ServicioPorcentajesImpuestos.consultar(tarifa.getIdGrupoImpuesto(), tarifa.getIdTratImpuestos());

			// consultamos artículos que deseamos copiar
			List<ArticuloActualizacionCopiaBean> articulosCopia = ArticulosActualizacionesDao.consultarArticulosCopiar(conn, datosSesion.getConfigEmpresa(), param);
			List<ArticuloActualizacionBean> articulos  = new ArrayList<ArticuloActualizacionBean>();
			int insertados = 0;
			int actualizados = 0;
			for (ArticuloActualizacionCopiaBean articulo : articulosCopia) {
				if (articulo.getCodTar() == null) { // es nuevo, no está en la actualización de destino
					articulo.setIdActualizacion(param.getIdActualizacion());
					articulo.setCodTar(param.getCodTarActual());
					articulo.copiarOrigen();
					articulo.setEstadoBean(Estado.NUEVO);
					articulos.add(articulo);
					insertados++;
				} 
				else if (articulo.getCodTar() != null && param.isOperacionInsertarActualizar()) {
					if (articulo.isDistintos()){ 
						articulo.copiarOrigen();
						articulo.setEstadoBean(Estado.MODIFICADO);
						articulos.add(articulo);
						actualizados++;
					}
				}
				if (articulo.getEstadoBean()==Estado.NUEVO || articulo.getEstadoBean()==Estado.MODIFICADO){
					articulo.setPorcentajeImpuesto(porcentajes.getPorcentaje(articulo.getCodImpuesto()).getPorcentaje());
					articulo.recalculaPrecioTotal();
				}
			}
			salvarArticulosActualizacion(conn, param.getCodTarActual(), param.getIdActualizacion(), articulos, datosSesion);
			param.setInsertados(insertados);
			param.setActualizados(actualizados);
			param.setTratados(articulosCopia.size());
		
			conn.commit();
			conn.finalizaTransaccion();
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error insertando artículos de forma masiva en la actualización: "+ e.getMessage();
			log.error("insercionArticulosMasiva() - " + msg);
			throw new ArticuloActualizacionException(msg, e);
		} 
		catch(PorcentajeImpuestoException e){
			conn.deshacerTransaccion();
			String msg = "Se ha producido un error al consultar los porcentajes de impuesto mientras " +
						 "se intentaba realizar la inserción masiva de artículos de actualización:  "+ e.getMessage();
			log.error("insercionArticulosMasiva() - " + msg);
			throw new ArticuloActualizacionException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
		
	}

	@SuppressWarnings("unchecked")
	public static void actualizacionArticulosMasiva(ParametrosAsistenteTarifaBean param, DatosSesionBean datosSesion)
			throws ArticuloActualizacionException, ArticuloActualizacionConstraintViolationException, ActualizacionTarifaException {
		String redondeo1=null, redondeo2=null, redondeo3=null;
		Connection conn = new Connection();
		List<ArticuloActualizacionBean> articulos = null;
		try {
			log.debug("actualizacionArticulosMasiva() - Inicio de actualización masiva de artículos para la actualización " + param.getIdActualizacion() + " ... ");
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// nos instanciamos parámetros de búsqueda para consultar artículos que se actualizarán
			ParametrosBuscarArticulosActualizacionesBean paramBuscar = new ParametrosBuscarArticulosActualizacionesBean();
			paramBuscar.setIdActualizacion(param.getIdActualizacion());
			paramBuscar.setCodTar(param.getCodTarActual());
			paramBuscar.setCodArtDesde(param.getCodArtDesde());
			paramBuscar.setCodArtHasta(param.getCodArtHasta());
			paramBuscar.setCodFamDesde(param.getCodFamDesde());
			paramBuscar.setCodFamHasta(param.getCodFamHasta());
			paramBuscar.setCodProDesde(param.getCodProDesde());
			paramBuscar.setCodProHasta(param.getCodProHasta());
			paramBuscar.setSinPaginar(true);
			
			int actualizados = 0;
			
			if (param.isRedondear()){
				redondeo1 = ServicioVariables.consultarValor(Variables.TARIFAS_REDONDEO_NIVEL1);
				redondeo2 = ServicioVariables.consultarValor(Variables.TARIFAS_REDONDEO_NIVEL2);
				redondeo3 = ServicioVariables.consultarValor(Variables.TARIFAS_REDONDEO_NIVEL3);
			}
			
			// ELIMINAR ARTÍCULOS
			if (param.isOperacionActualizarEliminando()){ 
				log.debug("actualizacionArticulosMasiva() - Operación seleccionada: Eliminación de articulos.");
				int borrados = ArticulosActualizacionesDao.delete(conn, datosSesion.getConfigEmpresa(), paramBuscar);
				
				param.setTratados(borrados);
				actualizados = borrados;
			}
			
			// ACTUALIZAR PRECIO DE VENTA
			else if (param.isOperacionActualizarPrecioVenta()){
				log.debug("actualizacionArticulosMasiva() - Operación seleccionada: Actualización de precios de venta.");
				// consultamos lista de artículos que cumplen los parámetros indicados
				articulos = (List<ArticuloActualizacionBean>) ArticulosActualizacionesDao.consultar(conn, datosSesion.getConfigEmpresa(), paramBuscar).getPagina();
				
				// obtenemos porcentajes de impuesto
				TarifaBean tarifa = TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(), param.getCodTarActual());
				PorcentajesImpuestosBean porcentajes = ServicioPorcentajesImpuestos.consultar(tarifa.getIdGrupoImpuesto(), tarifa.getIdTratImpuestos());
				
				// actualizamos precios de venta de todos los artículos en función del criterio seleccionado
				for (ArticuloTarifaBean articulo : articulos) {
					// establecemos porcentaje de impuestos en función del código de impuesto
					articulo.setPorcentajeImpuesto(porcentajes.getPorcentaje(articulo.getCodImpuesto()).getPorcentaje());
					if (param.isOperacionActualizarPrecioVentaPV()){
						if (param.getImporteIncDec() != null){
							articulo.setPrecioVenta(articulo.getPrecioVenta() + param.getImporteIncDec());
						}
						else{ // --> (param.getPorcentajeIncDec() != null)
							articulo.setPrecioVenta((articulo.getPrecioVenta()*param.getPorcentajeIncDec()/100) + articulo.getPrecioVenta());
						}
						articulo.setEstadoBean(Estado.MODIFICADO);
					}
					else if (param.isOperacionActualizarPrecioVentaPT()){
						articulo.recalculaPrecioTotal(); // recalculamos el precio con impuestos antes de operar con él, por si el salvado en bbdd no está actualizado
						if (param.getImporteIncDec() != null){
							articulo.setPrecioTotal(articulo.getPrecioTotal() + param.getImporteIncDec());
						}
						else{ // --> (param.getPorcentajeIncDec() != null)
							articulo.setPrecioTotal((articulo.getPrecioTotal()*param.getPorcentajeIncDec()/100) + articulo.getPrecioTotal());
						}
						articulo.recalculaPrecioVentaDesdeTotal(); // recalculamos el precio de venta sin impuestos
						articulo.setEstadoBean(Estado.MODIFICADO);
					}
					else if (param.isOperacionActualizarPrecioVentaPC()){
						if (param.getImporteIncDec() != null){
							articulo.setPrecioVenta(articulo.getPrecioCosto() + param.getImporteIncDec());
						}
						else if (param.getPorcentajeIncDec() != null){
							articulo.setPrecioVenta((articulo.getPrecioCosto()*param.getPorcentajeIncDec()/100) + articulo.getPrecioCosto());
						}
						else { // --> (param.getFactorMargen() != null)
							articulo.setFactorMarcaje(param.getFactorMargen());
							articulo.recalculaPrecioVentaDesdeCosto(); // si cambiamos el factor de marcaje directamente, recalculamos precio venta
						}
						articulo.setEstadoBean(Estado.MODIFICADO);
					}
					if (articulo.getEstadoBean()==Estado.MODIFICADO){
						articulo.recalculaFactorMarcaje();
						articulo.recalculaPrecioTotal();
					}
					if (param.isRedondear()){
						articulo.redondearPrecioTotal(redondeo1, redondeo2, redondeo3);
						articulo.recalculaPrecioVentaDesdeTotal();
						articulo.recalculaFactorMarcaje();
						articulo.setEstadoBean(Estado.MODIFICADO);
					}
					param.setTratados(articulos.size());
				}
				actualizados = articulos.size();
				
				// salvamos cambios
				salvarArticulosActualizacion(conn, param.getCodTarActual(), param.getIdActualizacion(), articulos, datosSesion);
			}
			
			// ACTUALIZAR PRECIO DE COSTO
			else if (param.isOperacionActualizarPrecioCosto()){ 
				log.debug("actualizacionArticulosMasiva() - Operación seleccionada: Actualización de precios de costo.");
				articulos = new ArrayList<ArticuloActualizacionBean>();

				// obtenemos porcentajes de impuesto
				TarifaBean tarifa = TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(), param.getCodTarActual());
				PorcentajesImpuestosBean porcentajes = ServicioPorcentajesImpuestos.consultar(tarifa.getIdGrupoImpuesto(), tarifa.getIdTratImpuestos());

				// consultamos artículos de tarifa general que cumplen los parámetros indicados
				param.setCodTarOrigen(TarifaBean.TARIFA_GENERAL);
				List<ArticuloActualizacionCopiaBean> articulosCopia = ArticulosActualizacionesDao.consultarArticulosCopiar(conn, datosSesion.getConfigEmpresa(), param);
				for (ArticuloActualizacionCopiaBean articulo : articulosCopia) {
					// sólo actualizamos el artículo si existe en la tarifa que estamos actualizando además de en la general
					if (articulo.getCodArt()!=null){
						// establecemos porcentaje de impuestos en función del código de impuesto
						articulo.setPorcentajeImpuesto(porcentajes.getPorcentaje(articulo.getCodImpuesto()).getPorcentaje());
						if (param.getPorcentajeIncDec()!=null){
							articulo.setPrecioCosto((articulo.getPrecioCostoOrigen() * param.getPorcentajeIncDec() / 100.0) + articulo.getPrecioCostoOrigen());
							articulo.setEstadoBean(Estado.MODIFICADO);
						}
						else if (!articulo.getPrecioCosto().equals(articulo.getPrecioCostoOrigen())){
							articulo.setPrecioCosto(articulo.getPrecioCostoOrigen());
							articulo.setEstadoBean(Estado.MODIFICADO);
						}
						if (articulo.getEstadoBean() == Estado.MODIFICADO){
							articulo.redondearPrecioCosto(); // redondeamos precio costo
							articulo.recalculaPrecioVentaDesdeCosto(); // recalculamos precio de venta para el nuevo precio de costo
							articulo.recalculaPrecioTotal(); // recalculamos precio total para los nuevos precios de venta
							articulos.add(articulo); // añadimos este artículo para modificar
						}
						param.setTratados(param.getTratados()+1);
					}
				}
				actualizados = articulos.size();
				
				// salvamos cambios
				salvarArticulosActualizacion(conn, param.getCodTarActual(), param.getIdActualizacion(), articulos, datosSesion);
			}
			
			param.setActualizados(actualizados);
			log.debug("actualizacionArticulosMasiva() - Fin de actualización masiva de artículos. Se han actualizado " + actualizados + " registros.");

			conn.commit();
			conn.finalizaTransaccion();
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error actualizando de forma masiva precios en artículos de actualización: "+ e.getMessage();
			log.error("actualizacionArticulosMasiva() - " + msg);
			throw new ActualizacionTarifaException(msg, e);
		} 
		catch (VariableException e) {
			conn.deshacerTransaccion();
			String msg = "Error consultando variables de redondeo para la actualización de precios masiva de actualización: "+ e.getMessage();
			log.error("actualizacionArticulosMasiva() - " + msg);
			throw new ActualizacionTarifaException(msg, e);
		} 
		catch (VariableNotFoundException e) {
			conn.deshacerTransaccion();
			String msg = "No se han encontrado las variables de redondeo para la actualización masiva de precios de actualización: "+ e.getMessage();
			log.error("actualizacionArticulosMasiva() - " + msg);
			throw new ActualizacionTarifaException(msg, e);
		}
		catch(PorcentajeImpuestoException e){
			conn.deshacerTransaccion();
			String msg = "Se ha producido un error al consultar los porcentajes de impuesto mientras " +
						 "se intentaba actualizar los precios de los artículos de tarifa:  "+ e.getMessage();
			log.error("actualizacionArticulosMasiva() - " + msg);
			throw new ActualizacionTarifaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	private static void salvarArticulosActualizacion(Connection conn, String codTarifa, Long idActualizacion, List<ArticuloActualizacionBean> articulos,
			DatosSesionBean datosSesion) throws ArticuloActualizacionException, ArticuloActualizacionConstraintViolationException {
		try{
			log.debug("salvarArticulosActualizacion() - Salvando articulos para la actualizacion " + idActualizacion + " de la tarifa: " + codTarifa);
			ActualizacionTarifaBean actualizacion = ActualizacionesTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), idActualizacion);
			actualizacion.setArticulosActualizacion(articulos);
			actualizacion.setArticulosCargados(true);
			salvarArticulos(conn, actualizacion, datosSesion);
		}
		catch(SQLException e){
			String msg = "Error salvando articulos de actualización: " + e.getMessage();
			log.error("salvarArticulosActualizacion() - " + msg);
			throw new ArticuloActualizacionException(msg, e);
		}
	}
}
