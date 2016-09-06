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

package com.comerzzia.servicios.ventas.tarifas;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.impuestos.grupos.GrupoImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.grupos.GruposImpuestosDao;
import com.comerzzia.persistencia.ventas.tarifas.ParametrosAsistenteTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.ParametrosBuscarTarifasBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifasDao;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaCopiaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticulosTarifaDao;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ParametrosBuscarArticulosTarifaBean;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajesImpuestosBean;
import com.comerzzia.servicios.core.impuestos.porcentajes.ServicioPorcentajesImpuestos;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.VariableException;
import com.comerzzia.servicios.core.variables.VariableNotFoundException;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.servicios.ventas.tarifas.articulos.ArticuloTarifaConstraintViolationException;
import com.comerzzia.servicios.ventas.tarifas.articulos.ArticuloTarifaException;
import com.comerzzia.servicios.ventas.tarifas.articulos.ServicioArticulosTarifas;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioTarifas {

	protected static Logger log = Logger.getMLogger(ServicioTarifas.class);

	public static PaginaResultados consultar(ParametrosBuscarTarifasBean param, DatosSesionBean datosSesion) 
			throws TarifaException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando tarifas");
			conn.abrirConexion(Database.getConnection());
			return TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(),param);
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar tarifas: " + e.getMessage();
			throw new TarifaException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	public static TarifaBean consultarTarifaGeneral(DatosSesionBean datosSesion) 
			throws TarifaException,	TarifaNotFoundException {
		return consultar(TarifaBean.TARIFA_GENERAL, datosSesion);
	}

	public static TarifaBean consultar(String codTar, DatosSesionBean datosSesion) 
			throws TarifaException, TarifaNotFoundException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando datos de la tarifa: " + codTar);
			conn.abrirConexion(Database.getConnection());
			TarifaBean tarifa = TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(), codTar);

			if (tarifa == null) {
				String msg = "No se ha encontrado la tarifa con identificador: " + codTar;
				log.info("consultar() - " + msg);
				throw new TarifaNotFoundException(msg);
			}
			return tarifa;
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de una tarifa: " + e.getMessage();
			throw new TarifaException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	public static List<TarifaBean> consultar(DatosSesionBean datosSesion) throws TarifaException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando todos las tarifas");
			conn.abrirConexion(Database.getConnection());
			return TarifasDao.consultar(conn, datosSesion.getConfigEmpresa());
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar todas las tarifas: "
					+ e.getMessage();

			throw new TarifaException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static void salvar(TarifaBean tarifa, DatosSesionBean datosSesion)
			throws TarifaException, TarifaConstraintViolationException {

		switch (tarifa.getEstadoBean()) {
			case Estado.NUEVO:
				crear(tarifa, datosSesion);
				break;
	
			case Estado.MODIFICADO:
				modificar(tarifa, datosSesion);
				break;
	
			case Estado.BORRADO:
				eliminar(tarifa.getCodTar(), datosSesion);
			}
	}

	public static void crear(TarifaBean tarifa, DatosSesionBean datosSesion)
			throws TarifaException, TarifaConstraintViolationException {
		Connection conn = new Connection();

		try {
			log.debug("crear() - Creando nueva Tarifa " + tarifa.getCodTar());

			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			// establecemos versión inicial
			tarifa.setVersion(ContadorTarifas.obtenerContador(conn));
			tarifa.setFechaVersion(new Date());

			// establecemos grupo de impuestos y tratamiento de impuestos de la tarifa general
			TarifaBean tarifaGeneral = TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(), TarifaBean.TARIFA_GENERAL);
			tarifa.setIdGrupoImpuesto(tarifaGeneral.getIdGrupoImpuesto());
			tarifa.setIdTratImpuestos(tarifaGeneral.getIdTratImpuestos());
			
			// insertamos
			TarifasDao.insert(conn, datosSesion.getConfigEmpresa(), tarifa);
			
			conn.commit();
			conn.finalizaTransaccion();
		} 
		catch (KeyConstraintViolationException e) {
			conn.deshacerTransaccion();
			log.info("crear() - No se ha podido crear la tarifa: " + e.getMessage());
			throw new TarifaConstraintViolationException("Error creando nueva tarifa: " + e.getDefaultMessage());
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error creando nueva tarifa: " + e.getMessage();
			log.error("crear() - " + msg);
			throw new TarifaException(msg, e);
		} 
		catch (ContadorException e) {
			conn.deshacerTransaccion();
			String msg = "Error obteniendo contador de versión de tarifa: " + e.getMessage();
			log.error("crear() - " + msg);
			throw new TarifaException(msg, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	
	public static void modificar(TarifaBean tarifa, DatosSesionBean datosSesion)
			throws TarifaException, ArticuloTarifaConstraintViolationException {
		Connection conn = new Connection();
		try {
			log.debug("modificar() - Modificando Tarifa " + tarifa.getCodTar());

			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			Long versionOriginal = tarifa.getVersion();
			TarifasDao.update(conn, datosSesion.getConfigEmpresa(), tarifa);
			salvarArticulos(conn, tarifa, datosSesion);
			if (!versionOriginal.equals(tarifa.getVersion())){
				tarifa.setFechaVersion(new Date());
				TarifasDao.actualizarVersion(conn, datosSesion.getConfigEmpresa(), tarifa);
			}
			conn.commit();
			conn.finalizaTransaccion();
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error modificando tarifa: " + e.getMessage();
			log.error("modificar() - " + msg);
			throw new TarifaException(msg, e);
		} 
		catch (ContadorException e) {
			conn.deshacerTransaccion();
			String msg = "Error obteniendo contador de versión de tarifa: "+ e.getMessage();
			log.error("modificar() - " + msg);
			throw new TarifaException(msg, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	public static void eliminar(String codTarifa, DatosSesionBean datosSesion)
			throws TarifaException, TarifaConstraintViolationException {
		Connection conn = new Connection();
		Long version = null;
		try {
			log.debug("eliminar() - Eliminando Tarifa " + codTarifa);
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			List<ArticuloTarifaBean> articulos = ServicioArticulosTarifas.consultarArticulosTarifa(codTarifa, datosSesion);
			if (articulos.size() > 0){
				version = ContadorTarifas.obtenerContador(conn); 
			}
			for (ArticuloTarifaBean articulo : articulos) {
				articulo.setVersion(version);
				ServicioArticulosTarifas.salvarHistorico(conn, articulo, true, datosSesion);
			}
			ArticulosTarifaDao.delete(conn, datosSesion.getConfigEmpresa(),codTarifa);
			TarifasDao.delete(conn, datosSesion.getConfigEmpresa(), codTarifa);
			conn.commit();
			conn.finalizaTransaccion();
		} 
		catch (ForeingKeyConstraintViolationException e) {
			conn.deshacerTransaccion();
			log.info("eliminar() - No se ha podido eliminar la tarifa: " + e.getMessage());
			throw new TarifaConstraintViolationException("Error eliminando tarifa: " + e.getDefaultMessage());
		} 
		catch (ContadorException e) {
			String msg = "Error obteniendo contador de versión de tarifa: " + e.getMessage();
			log.error("eliminar() - " + msg);
			throw new TarifaException(msg, e);
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error eliminando tarifa: " + e.getMessage();
			log.error("eliminar() - " + msg);

			throw new TarifaException(msg, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	public static void salvarArticuloTarifa(Connection conn, ArticuloTarifaBean articulo, DatosSesionBean datosSesion) 
			throws TarifaException, ArticuloTarifaConstraintViolationException {
		List<ArticuloTarifaBean> articulos = new ArrayList<ArticuloTarifaBean>(1);
		articulos.add(articulo);
		salvarArticulosTarifas(conn, articulo.getCodTar(), articulos, datosSesion);
	}

	public static void actualizarArticuloTarifa(Connection conn, ArticuloTarifaBean articulo, DatosSesionBean datosSesion) 
			throws TarifaException {
		try{
			articulo.setEstadoBean(Estado.MODIFICADO);
			List<ArticuloTarifaBean> articulos = new ArrayList<ArticuloTarifaBean>(1);
			articulos.add(articulo);
			salvarArticulosTarifas(conn, articulo.getCodTar(), articulos, datosSesion);
		}
		catch(ArticuloTarifaConstraintViolationException e){
			log.error("actualizarArticuloTarifa() - Error desconocido actualizando artículo de tarifa por violación de constraint. " + e.getMessage());
			// esta excepción nunca saltará porque el estado del artículo es MODIFICADO, 
			// se actualizará, nunca se insertará o borrará.
		}
	}

	
	public static int salvarArticulosTarifas(Connection conn, String codTarifa, List<ArticuloTarifaBean> articulos, DatosSesionBean datosSesion) 
			throws TarifaException, ArticuloTarifaConstraintViolationException {
		try{
			log.debug("salvarArticulosTarifas() - Salvando articulos para la tarifa " + codTarifa);
			TarifaBean tarifa = TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(), codTarifa);
			tarifa.setArticulos(articulos);
			tarifa.setArticulosCargados(true);
			Long versionOriginal = tarifa.getVersion();
			int versionados = salvarArticulos(conn, tarifa, datosSesion);
			if (!versionOriginal.equals(tarifa.getVersion())){
				tarifa.setFechaVersion(new Date());
				TarifasDao.actualizarVersion(conn, datosSesion.getConfigEmpresa(), tarifa);
			}
			return versionados;
		}
		catch(SQLException e){
			String msg = "Error salvando articulos de tarifa: " + e.getMessage();
			log.error("salvarArticulosTarifas() - " + msg);
			throw new TarifaException(msg, e);
		}
		catch (ContadorException e) {
			String msg = "Error obteniendo contador de versión de tarifa: " + e.getMessage();
			log.error("salvarArticulosTarifas() - " + msg);
			throw new TarifaException(msg, e);
		} 
	}
	
	
	private static int salvarArticulos(Connection conn, TarifaBean tarifa, DatosSesionBean datosSesion) 
			throws ArticuloTarifaException, ArticuloTarifaConstraintViolationException, ContadorException, SQLException {
		Long version = null;
		int versionados = 0;
		if (tarifa.isArticulosCargados()) {
			for (ArticuloTarifaBean articulo : tarifa.getArticulos()) {
				if (articulo.getEstadoBean()==Estado.NUEVO){
					if (version==null){
						version = ContadorTarifas.obtenerContador(conn);
					}
					articulo.setVersion(version);
					versionados ++;
				}
				else if(articulo.getEstadoBean()==Estado.BORRADO){
					if (version==null){
						version = ContadorTarifas.obtenerContador(conn);
					}
					ArticuloTarifaBean original = ArticulosTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), tarifa.getCodTar(), articulo.getCodArt());
					original.setVersion(version);
					ServicioArticulosTarifas.salvarHistorico(conn, original, true, datosSesion);
					versionados ++;
				}
				else if(articulo.getEstadoBean()==Estado.MODIFICADO){
					ArticuloTarifaBean original = ArticulosTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), tarifa.getCodTar(), articulo.getCodArt());
					if (!articulo.getPrecioVenta().equals(original.getPrecioVenta())) {
						if (version==null){
							version = ContadorTarifas.obtenerContador(conn);
						}
						ServicioArticulosTarifas.salvarHistorico(conn, original, false, datosSesion);
						articulo.setVersion(version);
						versionados ++;
					}
				}
				// Actualizamos PK del objeto
				articulo.setCodTar(tarifa.getCodTar());
				ServicioArticulosTarifas.salvar(conn, articulo, datosSesion);
			}
		}
		if (version!=null){
			tarifa.setVersion(version);
		}
		return versionados;
	}
	
	
	public static void insercionArticulosMasiva(ParametrosAsistenteTarifaBean param, DatosSesionBean datosSesion)
			throws TarifaException, ArticuloTarifaConstraintViolationException {
		Connection conn = new Connection();
		try {
			log.debug("insercionArticulosMasiva() - Inicio de la inserción masiva de artículos en la tarifa " + param.getCodTarActual() + " desde la tarifa " + param.getCodTarOrigen() + " ... ");
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			// obtenemos porcentajes de impuesto
			TarifaBean tarifa = TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(), param.getCodTarActual());
			PorcentajesImpuestosBean porcentajes = ServicioPorcentajesImpuestos.consultar(tarifa.getIdGrupoImpuesto(), tarifa.getIdTratImpuestos());

			// consultamos artículos que deseamos copiar
			List<ArticuloTarifaCopiaBean> articulosCopia = ArticulosTarifaDao.consultarArticulosCopiar(conn, datosSesion.getConfigEmpresa(), param);
			List<ArticuloTarifaBean> articulos  = new ArrayList<ArticuloTarifaBean>();
			int insertados = 0;
			int actualizados = 0;
			for (ArticuloTarifaCopiaBean articulo : articulosCopia) {
				if (articulo.getCodTar() == null) { // es nuevo, no está en la tarifa de destino
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
			param.setVersionados(salvarArticulosTarifas(conn, param.getCodTarActual(), articulos, datosSesion));
			param.setInsertados(insertados);
			param.setActualizados(actualizados);
			param.setTratados(articulosCopia.size());
		
			conn.commit();
			conn.finalizaTransaccion();
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error insertando artículos de forma masiva en tarifa: "+ e.getMessage();
			log.error("insercionArticulosMasiva() - " + msg);
			throw new TarifaException(msg, e);
		} 
		catch(PorcentajeImpuestoException e){
			conn.deshacerTransaccion();
			String msg = "Se ha producido un error al consultar los porcentajes de impuesto mientras " +
						 "se intentaba realizar la inserción masiva de artículos de tarifa:  "+ e.getMessage();
			log.error("actualizacionArticulosMasiva() - " + msg);
			throw new TarifaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	
	@SuppressWarnings("unchecked")
	public static void actualizacionArticulosMasiva(ParametrosAsistenteTarifaBean param, DatosSesionBean datosSesion)
			throws TarifaException, ArticuloTarifaConstraintViolationException {
		String redondeo1=null, redondeo2=null, redondeo3=null;
		Connection conn = new Connection();
		List<ArticuloTarifaBean> articulos = null;
		try {
			log.debug("actualizacionArticulosMasiva() - Inicio de actualización masiva de artículos para la tarifa " + param.getCodTarActual() + " ... ");
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// nos instanciamos parámetros de búsqueda para consultar artículos que se actualizarán
			ParametrosBuscarArticulosTarifaBean paramBuscar = new ParametrosBuscarArticulosTarifaBean();
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
			// ACTUALIZAR PRECIOS TOTALES (PRECIO VENTA + IMPUESTOS) A VIGENCIA ACTUAL
			if (param.isOperacionActualizarImpuestos()){ 
				log.debug("actualizacionArticulosMasiva() - Operación seleccionada: Actualización de precios venta + impuestos con vigencia actual.");

				// actualizamos el grupo de impuestos de la tarifa
				TarifaBean tarifa = TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(), param.getCodTarActual());
				GrupoImpuestosBean grupoImpuestos = GruposImpuestosDao.consultar(conn, new Date());
				tarifa.setIdGrupoImpuesto(grupoImpuestos.getIdGrupoImpuestos());
				TarifasDao.update(conn, datosSesion.getConfigEmpresa(), tarifa);

				// consultamos lista de artículos que cumplen los parámetros indicados
				articulos = (List<ArticuloTarifaBean>) ArticulosTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), paramBuscar).getPagina();

				// consultamos impuestos
				PorcentajesImpuestosBean porcentajes = ServicioPorcentajesImpuestos.consultar(tarifa.getIdGrupoImpuesto(), tarifa.getIdTratImpuestos());
				
				// actualizamos precios de totales de todos los artículos
				for (ArticuloTarifaBean articulo : articulos) {
					// establecemos porcentaje de impuestos en función del código de impuesto
					articulo.setPorcentajeImpuesto(porcentajes.getPorcentaje(articulo.getCodImpuesto()).getPorcentaje());
					articulo.recalculaPrecioTotal();
					if (param.isRedondear()){
						articulo.redondearPrecioTotal(redondeo1, redondeo2, redondeo3);
						articulo.recalculaPrecioVentaDesdeTotal();
						articulo.recalculaFactorMarcaje();
					}
					articulo.setEstadoBean(Estado.MODIFICADO);
				}
				param.setTratados(articulos.size());
			}
			// ELIMINAR ARTÍCULOS
			else if (param.isOperacionActualizarEliminando()){ 
				log.debug("actualizacionArticulosMasiva() - Operación seleccionada: Eliminación de articulos.");
				// consultamos lista de artículos que cumplen los parámetros indicados
				articulos = (List<ArticuloTarifaBean>) ArticulosTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), paramBuscar).getPagina();

				// borramos todos los artículos
				for (ArticuloTarifaBean articulo : articulos) {
					articulo.borrar();
				}
				param.setTratados(articulos.size());
			}
			
			// ACTUALIZAR PRECIO DE VENTA
			else if (param.isOperacionActualizarPrecioVenta()){
				log.debug("actualizacionArticulosMasiva() - Operación seleccionada: Actualización de precios de venta.");
				// consultamos lista de artículos que cumplen los parámetros indicados
				articulos = (List<ArticuloTarifaBean>) ArticulosTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), paramBuscar).getPagina();
				
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
			}
			
			// ACTUALIZAR PRECIO DE COSTO
			else if (param.isOperacionActualizarPrecioCosto()){ 
				log.debug("actualizacionArticulosMasiva() - Operación seleccionada: Actualización de precios de costo.");
				articulos = new ArrayList<ArticuloTarifaBean>();

				// obtenemos porcentajes de impuesto
				TarifaBean tarifa = TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(), param.getCodTarActual());
				PorcentajesImpuestosBean porcentajes = ServicioPorcentajesImpuestos.consultar(tarifa.getIdGrupoImpuesto(), tarifa.getIdTratImpuestos());

				// consultamos artículos de tarifa general que cumplen los parámetros indicados
				param.setCodTarOrigen(TarifaBean.TARIFA_GENERAL);
				List<ArticuloTarifaCopiaBean> articulosCopia = ArticulosTarifaDao.consultarArticulosCopiar(conn, datosSesion.getConfigEmpresa(), param);
				for (ArticuloTarifaCopiaBean articulo : articulosCopia) {
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
			}
			
			// salvamos cambios
			param.setVersionados(salvarArticulosTarifas(conn, param.getCodTarActual(), articulos, datosSesion));
			param.setActualizados(articulos.size());
			log.debug("actualizacionArticulosMasiva() - Fin de actualización masiva de artículos. Se han actualizado " + actualizados + " registros.");

			conn.commit();
			conn.finalizaTransaccion();
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error actualizando de forma masiva precios en artículos de tarifas: "+ e.getMessage();
			log.error("actualizacionArticulosMasiva() - " + msg);
			throw new TarifaException(msg, e);
		} 
		catch (VariableException e) {
			conn.deshacerTransaccion();
			String msg = "Error consultando variables de redondeo para la actualización de precios masiva de tarifa: "+ e.getMessage();
			log.error("actualizacionArticulosMasiva() - " + msg);
			throw new TarifaException(msg, e);
		} 
		catch (VariableNotFoundException e) {
			conn.deshacerTransaccion();
			String msg = "No se han encontrado las variables de redondeo para la actualización masiva de precios de tarifa: "+ e.getMessage();
			log.error("actualizacionArticulosMasiva() - " + msg);
			throw new TarifaException(msg, e);
		}
		catch(PorcentajeImpuestoException e){
			conn.deshacerTransaccion();
			String msg = "Se ha producido un error al consultar los porcentajes de impuesto mientras " +
						 "se intentaba actualizar los precios de los artículos de tarifa:  "+ e.getMessage();
			log.error("actualizacionArticulosMasiva() - " + msg);
			throw new TarifaException(msg, e);
		}
		catch(ArticuloTarifaConstraintViolationException e){
			conn.deshacerTransaccion();
			throw e;
		}
		catch(TarifaException e){
			conn.deshacerTransaccion();
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}

}
