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

package com.comerzzia.servicios.general.articulos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajeImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajesImpuestosDao;
import com.comerzzia.persistencia.general.almacenes.articulos.AlmacenArticuloBean;
import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.persistencia.general.articulos.ArticulosDao;
import com.comerzzia.persistencia.general.articulos.ParametrosBuscarArticulosBean;
import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean;
import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigosBarrasArticulosDao;
import com.comerzzia.persistencia.general.articulos.fotos.FotoArticuloBean;
import com.comerzzia.persistencia.general.articulos.fotos.FotosArticulosDao;
import com.comerzzia.persistencia.general.articulos.unidadesmedidas.UnidadMedidaArticuloBean;
import com.comerzzia.persistencia.general.articulos.unidadesmedidas.UnidadesMedidasArticulosDao;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifasDao;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticulosTarifaDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoNotFoundException;
import com.comerzzia.servicios.core.impuestos.porcentajes.ServicioPorcentajesImpuestos;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.servicios.general.almacenes.articulos.AlmacenArticuloException;
import com.comerzzia.servicios.general.articulos.codigosbarras.CodigoBarrasArticuloConstraintViolationException;
import com.comerzzia.servicios.general.articulos.codigosbarras.CodigoBarrasArticuloException;
import com.comerzzia.servicios.general.articulos.codigosbarras.ServicioCodigosBarrasArticulos;
import com.comerzzia.servicios.general.articulos.fotos.FotoArticuloConstraintViolationException;
import com.comerzzia.servicios.general.articulos.fotos.FotoArticuloException;
import com.comerzzia.servicios.general.articulos.fotos.ServicioFotosArticulos;
import com.comerzzia.servicios.general.articulos.unidadesmedidas.ServicioUnidadesMedidasArticulos;
import com.comerzzia.servicios.general.articulos.unidadesmedidas.UnidadMedidaArticuloConstraintViolationException;
import com.comerzzia.servicios.general.articulos.unidadesmedidas.UnidadMedidaArticuloException;
import com.comerzzia.servicios.general.clientes.ClienteException;
import com.comerzzia.servicios.general.clientes.ClienteNotFoundException;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.servicios.ventas.tarifas.ServicioTarifas;
import com.comerzzia.servicios.ventas.tarifas.TarifaException;
import com.comerzzia.servicios.ventas.tarifas.articulos.ArticuloTarifaConstraintViolationException;
import com.comerzzia.servicios.ventas.tarifas.articulos.ServicioArticulosTarifas;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.util.paginacion.PaginaResultados;


public class ServicioArticulos {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioArticulos.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarArticulosBean param, DatosSesionBean datosSesion) throws ArticuloException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando artículos");

			conn.abrirConexion(Database.getConnection());
			return ArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar artículos: " +  e.getMessage();
			
            throw new ArticuloException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static ArticuloBean consultar(String codArticulo, DatosSesionBean datosSesion) 
			throws ArticuloNotFoundException, ArticuloException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			ArticuloBean articulo = consultar(conn, codArticulo, datosSesion);

			return articulo;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un artículo: " +  e.getMessage();
			
            throw new ArticuloException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	

	public static ArticuloBean consultar(Connection conn, String codArticulo, DatosSesionBean datosSesion) 
			throws ArticuloNotFoundException, ArticuloException {
		try {
			log.debug("consultar() - Consultando datos del artículo: " + codArticulo);
			
			ArticuloBean articulo = ArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), codArticulo);
			
			if (articulo == null) {
				String msg = "No se ha encontrado el artículo con identificador: " + codArticulo;
				log.info("consultar() - " + msg);
				
				throw new ArticuloNotFoundException(msg);
			}
			
			//consultamos la tarifa general asociada al artículo
			ArticuloTarifaBean articuloTarifa = ArticulosTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), TarifaBean.TARIFA_GENERAL, codArticulo);
			if (articuloTarifa != null){
				articulo.setArticuloTarifa(articuloTarifa);
			}
			else{
				log.warn("El artículo " + codArticulo + " no está en la tarifa GENERAL");
			}
			return articulo;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un artículo: " + e.getMessage();
			
			throw new ArticuloException(mensaje, e);
		}
	}

	
	public static ArticuloBean consultarPorCodigo(String codArticulo, DatosSesionBean datosSesion) 
			throws ArticuloNotFoundException, ArticuloException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarPorCodigo() - Consultando datos del artículo: " + codArticulo);
			conn.abrirConexion(Database.getConnection());
			
			ArticuloBean articulo = null;
			
			// Consultar el código recibido como código de barras
			CodigoBarrasArticuloBean codigoBarras = CodigosBarrasArticulosDao.consultarCodigoBarras(conn, datosSesion.getConfigEmpresa(), codArticulo);
			
			// El código es un código de barras
			if(codigoBarras != null) {
				// Obtener el artículo a partir del código de artículo asociado al código de barras
				articulo = ArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), codigoBarras.getCodArticulo());
				articulo.setCodigosBarras(new ArrayList<CodigoBarrasArticuloBean>());
				articulo.addCodigo(codigoBarras);
			}
			else { // El código es un código de artículo
				articulo = ArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), codArticulo);
			}
			
			if (articulo == null) {
				String msg = "No se ha encontrado el artículo con identificador / código de barras: " + codArticulo;
				log.info("consultarPorCodigo() - " + msg);
				
				throw new ArticuloNotFoundException(msg);
			}
			
			// Obtener las unidades de medida del artículo
			articulo.setUnidadesMedidas(ServicioUnidadesMedidasArticulos.consultarUnidadesMedidas(articulo.getCodArticulo(), datosSesion));
			
			return articulo;
		}
		catch (SQLException e) {
			log.error("consultarPorCodigo() - " + e.getMessage());
			String mensaje = "Error consultando artículo por código: " + e.getMessage();
			
			throw new ArticuloException(mensaje, e);
		}
		catch (UnidadMedidaArticuloException e) {
			log.error("consultarPorCodigo() - " + e.getMessage());
			String mensaje = "Error consultando artículo por código: " + e.getMessage();
			
			throw new ArticuloException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void salvar(ArticuloBean articulo, DatosSesionBean datosSesion) 
			throws ArticuloException, ArticuloConstraintViolationException {
	
		switch (articulo.getEstadoBean()) {
			case Estado.NUEVO:
				crear(articulo, datosSesion);
				break;
			      
			case Estado.MODIFICADO:
				modificar(articulo, datosSesion);
				break;
			      
			case Estado.BORRADO:
				eliminar(articulo.getCodArticulo(), datosSesion);
		}
	}
	
	
	public static void crear(ArticuloBean articulo, DatosSesionBean datosSesion) 
			throws ArticuloException, ArticuloConstraintViolationException {
		Connection conn = new Connection();
		try {
			log.debug("crear() - Creando nuevo artículo " + articulo.getCodArticulo());
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			articulo.setFechaAlta(new Date());
			articulo.setVersion(ContadorArticulos.obtenerContador(conn));
			articulo.setFechaVersion(new Date());
			articulo.setFechaPrecioCosto(new Date());
			
			ArticulosDao.insert(conn, datosSesion.getConfigEmpresa(), articulo);
			salvarTarifaGeneral(conn, datosSesion, articulo);
			salvarCodigosBarras(articulo, datosSesion, conn);
			salvarFotos(articulo, datosSesion, conn);
			salvarUnidadesMedidas(conn, datosSesion, articulo);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch(KeyConstraintViolationException e){
			conn.deshacerTransaccion();
			log.info("crear() - No se ha podido crear el artículo: " + e.getMessage());
			throw new ArticuloConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error creando artículo: " + e.getMessage();
    		log.error("crear() - " + msg);
    		throw new ArticuloException(msg, e);
    	} 
		catch (ContadorException e) {
    		conn.deshacerTransaccion();
			String msg = "Error obteniendo contador de versión de artículo: " + e.getMessage();
			log.error("crear() - " + msg);
			throw new ArticuloException(msg, e);
		}
    	finally {
    		conn.cerrarConexion();
    	}
	}

	public static void modificar(ArticuloBean articulo, DatosSesionBean datosSesion) 
			throws ArticuloException, ArticuloConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando artículo " + articulo.getCodArticulo());
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			ArticuloBean original = ArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), articulo.getCodArticulo());
			
			if (requiereActualizarVersion(conn, datosSesion, articulo, original)){
				articulo.setVersion(ContadorArticulos.obtenerContador(conn));
				articulo.setFechaVersion(new Date());
				ArticulosDao.actualizarVersion(conn, datosSesion.getConfigEmpresa(), articulo);
			}
			
			ArticulosDao.update(conn, datosSesion.getConfigEmpresa(), articulo);
			salvarTarifaGeneral(conn, datosSesion, articulo);
			salvarCodigosBarras(articulo, datosSesion, conn);
			salvarFotos(articulo, datosSesion, conn);
			salvarUnidadesMedidas(conn, datosSesion, articulo);
			salvarAlmacenes(conn, datosSesion, articulo);
			salvarTarifas(conn, datosSesion, articulo, original);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error modificando artículo: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		throw new ArticuloException(msg, e);
    	}
		catch (ContadorException e) {
    		conn.deshacerTransaccion();
			String msg = "Error obteniendo contador de versión de artículo: " + e.getMessage();
			log.error("modificar() - " + msg);
			throw new ArticuloException(msg, e);
		}
    	finally {
    		conn.cerrarConexion();
    	}
	}

	public static void eliminar(String codArticulo, DatosSesionBean datosSesion) 
			throws ArticuloException, ArticuloConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando artículo " + codArticulo);
			 
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// borramos unidades de medida
			UnidadesMedidasArticulosDao.delete(conn, datosSesion.getConfigEmpresa(), codArticulo);
			
			// borramos códigos de barras
			CodigosBarrasArticulosDao.delete(conn, datosSesion.getConfigEmpresa(), codArticulo);

			// borramos fotos
			FotosArticulosDao.delete(conn, datosSesion.getConfigEmpresa(), codArticulo);

			// borramos artículos tarifas
			List<ArticuloTarifaBean> articulosTarifa = ServicioArticulosTarifas.consultarTarifasArticulo(codArticulo, datosSesion);
			for (ArticuloTarifaBean articuloTarifa : articulosTarifa) {
				articuloTarifa.borrar();
				ServicioTarifas.salvarArticuloTarifa(conn, articuloTarifa, datosSesion);
			}
			
			//borramos el artículo del historico de las tarifas
			ServicioArticulosTarifas.borrarHistorico(conn, codArticulo, datosSesion);
			
			// borramos el artículo
			ArticulosDao.delete(conn, datosSesion.getConfigEmpresa(), codArticulo);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch(ForeingKeyConstraintViolationException e){
			conn.deshacerTransaccion();
			log.info("eliminar() - No se ha podido eliminar el artículo: "+ e.getMessage());
			throw new ArticuloConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
    		String msg = "Error eliminando artículo: " + e.getMessage();
    		log.error("eliminar() - " + msg);
    		throw new ArticuloException(msg, e);
		} 
		catch (ArticuloTarifaConstraintViolationException e) {
			conn.deshacerTransaccion();
    		String msg = "Error eliminando tarifa de artículo: " + e.getMessage();
    		log.error("eliminar() - " + msg);
    		throw new ArticuloConstraintViolationException(msg, e);
		} 
		catch (TarifaException e) {
			conn.deshacerTransaccion();
    		String msg = "Error eliminando tarifa de artículo: " + e.getMessage();
    		log.error("eliminar() - " + msg);
    		throw new ArticuloException(msg, e);
		}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	private static void salvarCodigosBarras(ArticuloBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws CodigoBarrasArticuloException, CodigoBarrasArticuloConstraintViolationException  {
		if (articulo.isCodigosCargados()) {
			for (CodigoBarrasArticuloBean codigo : articulo.getCodigosBarras()) {
				// Actualizamos PK del objeto
				codigo.setCodArticulo(articulo.getCodArticulo());

				ServicioCodigosBarrasArticulos.salvar(codigo, datosSesion, conn);
			}
		}
	}


	private static void salvarFotos(ArticuloBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws FotoArticuloException, FotoArticuloConstraintViolationException  {
		if (articulo.isFotosCargadas()) {
			for (FotoArticuloBean foto : articulo.getFotos()) {
				// Actualizamos PK del objeto
				foto.setCodArticulo(articulo.getCodArticulo());
		
				ServicioFotosArticulos.salvar(foto, datosSesion, conn);
			}
		}
	}


	private static void salvarUnidadesMedidas(Connection conn,DatosSesionBean datosSesion, ArticuloBean articulo) 
			throws UnidadMedidaArticuloConstraintViolationException, UnidadMedidaArticuloException{
		if (articulo.isUnidadesCargadas()) {
			for (UnidadMedidaArticuloBean unidadMedida : articulo.getUnidadesMedidas()) {
				// Actualizamos PK del objeto
				unidadMedida.setCodArticulo(articulo.getCodArticulo());
				
				ServicioUnidadesMedidasArticulos.salvar(unidadMedida, datosSesion, conn);
			}
		}
	}
	
	private static void salvarAlmacenes(Connection conn, DatosSesionBean datosSesion, ArticuloBean articulo) 
			throws AlmacenArticuloException {
		if (articulo.isAlmacenesCargados()) {
			for (AlmacenArticuloBean almacen : articulo.getAlmacenes()) {
				ServicioAlmacenes.actualizarStockMinimo(conn, almacen.getStockMinimo(), almacen.getCodArt(), almacen.getCodAlm(), almacen.getDesglose1(), almacen.getDesglose2(), datosSesion.getConfigEmpresa());
				ServicioAlmacenes.actualizarStockMaximo(conn, almacen.getStockMaximo(), almacen.getCodArt(), almacen.getCodAlm(), almacen.getDesglose1(), almacen.getDesglose2(), datosSesion.getConfigEmpresa());
			}
		}
	}

	

	private static void salvarTarifaGeneral(Connection conn, DatosSesionBean datosSesion, ArticuloBean articulo) 
			throws ArticuloException, ArticuloConstraintViolationException{
		try{
			ArticuloTarifaBean articuloTarifa = articulo.getArticuloTarifa();
			articuloTarifa.setCodArt(articulo.getCodArticulo());
			if (articulo.getEstadoBean() == Estado.MODIFICADO){
				ArticuloTarifaBean original = ArticulosTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), articuloTarifa.getCodTar(), articulo.getCodArticulo());
				if (!original.getPrecioCosto().equals(articuloTarifa.getPrecioCosto())){
					articulo.setFechaPrecioCosto(new Date());
					ArticulosDao.actualizarFechaPrecioCosto(conn, datosSesion.getConfigEmpresa(), articulo);
				}
			}
			ServicioTarifas.salvarArticuloTarifa(conn, articuloTarifa, datosSesion);
		} 
		catch (SQLException e) {
			log.error("salvarTarifaGeneral() - " + e.getMessage());
			String mensaje = "Error salvando artículo de tarifa general: " + e.getMessage();
			throw new ArticuloException(mensaje, e);
		}		
		catch (ArticuloTarifaConstraintViolationException e) {
			log.error("salvarTarifaGeneral() - " + e.getMessage());
			String mensaje = "Error salvando artículo de tarifa general: " + e.getMessage();
			throw new ArticuloConstraintViolationException(mensaje, e);
		} 
		catch (TarifaException e) {
			log.error("salvarTarifaGeneral() - " + e.getMessage());
			String mensaje = "Error salvando artículo de tarifa general: " + e.getMessage();
			throw new ArticuloException(mensaje, e);
		} 
	}

	private static void salvarTarifas(Connection conn, DatosSesionBean datosSesion, ArticuloBean articulo, ArticuloBean original) 
			throws ArticuloException {
		// sólo se llama a este método cuando el estado del artículo es MODIFICADO
		try{ // si se ha cambiado el codImpuesto del artículo, tendremos que actualizar el precio con impuesto de todas las tarifas
			boolean actualizarPrecios = !articulo.getCodImpuesto().equals(original.getCodImpuesto());
			if (actualizarPrecios && !articulo.isTarifasCargadas()){
				articulo.setTarifas(ServicioArticulosTarifas.consultarTarifasArticulo(articulo.getCodArticulo(), datosSesion));
				articulo.setTarifasCargadas(true);
			}
			if (articulo.isTarifasCargadas()){
				for (ArticuloTarifaBean articuloTarifa : articulo.getTarifas()){
					// si han cambiado el codImpuesto, consultamos el porcentaje para el nuevo impuesto y recalculamos
					if (actualizarPrecios && !articuloTarifa.isTarifaGeneral()){ // la tarifa general ya ha sido actualizada 
						TarifaBean tarifa = TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(), articuloTarifa.getCodTar());
						PorcentajeImpuestoBean porcentaje = PorcentajesImpuestosDao.consultar(conn, tarifa.getIdGrupoImpuesto(), tarifa.getIdTratImpuestos(), articulo.getCodImpuesto());
						articuloTarifa.setPorcentajeImpuesto(porcentaje.getPorcentaje());
						articuloTarifa.recalculaPrecioTotal();
						articuloTarifa.setEstadoBean(Estado.MODIFICADO);
					} // el estado del artículo tarifa sólo puede ser MODIFICADO, no se permite su eliminación ni inserción
					if (articuloTarifa.getEstadoBean() == Estado.MODIFICADO){
						ServicioTarifas.actualizarArticuloTarifa(conn, articuloTarifa, datosSesion);
					}
				}
			}
		}
		catch(SQLException e){
			log.error("salvarTarifas() - " + e.getMessage());
			String mensaje = "Error salvando tarifas al intentar actualizarlas con nuevos impuestos: " + e.getMessage();
			throw new ArticuloException(mensaje, e);
		}
		catch (TarifaException e) {
			log.error("salvarTarifas() - " + e.getMessage());
			String mensaje = "Error salvando las tarifas: " + e.getMessage();
			throw new ArticuloException(mensaje, e);
		} 
	}

	private static boolean requiereActualizarVersion(Connection conn, DatosSesionBean datosSesion, 
			ArticuloBean articulo, ArticuloBean original) throws SQLException	{ 
		// Comprobamos si han cambiado alguno de los datos que obligan a versionar el artículo
		if (!original.getDesArticulo().equals(articulo.getDesArticulo())
				|| !original.getCodImpuesto().equals(articulo.getCodImpuesto())
				|| !original.getCodCategorizacion().equals(articulo.getCodCategorizacion())
				|| !original.getActivo().equals(articulo.getActivo())
				|| !original.getCodUnidadMedidaEtiq().equals(articulo.getCodUnidadMedidaEtiq())
				|| !Numero.equals(original.getCantidadUnidadMedidaEtiq(), articulo.getCantidadUnidadMedidaEtiq())
				|| !original.getEscaparate().equals(articulo.getEscaparate())) { 
			return true;
		}
		
		// Comprobamos si los codigos de barras han sufrido alguna modificacion
		if (articulo.isCodigosCargados()) {
			// Recorrer la lista de códigos de barras comprobando si han sido modificados
			for (CodigoBarrasArticuloBean codBarras : articulo.getCodigosBarras()) {
				if (codBarras.getEstadoBean() == Estado.NUEVO || codBarras.getEstadoBean() == Estado.BORRADO) {
					return true;
				}
				else if (codBarras.getEstadoBean() == Estado.MODIFICADO) {
					// Obtener los códigos de barras originales
					List<CodigoBarrasArticuloBean> codigosOriginales = CodigosBarrasArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), original.getCodArticulo());
					
					if (codigosOriginales != null) {
						// Crear un mapa con los códigos de barras del artículo original para hacer más fácil la comparación posterior
						Map<String, CodigoBarrasArticuloBean> mapaCodigosOriginales = new HashMap<String, CodigoBarrasArticuloBean>();
						for (CodigoBarrasArticuloBean codOriginal : codigosOriginales) {
							mapaCodigosOriginales.put(codOriginal.getCodigoBarras(), codOriginal);
						}
						
						// Si el estado es modificado comprobamos que haya habido algún cambio en sus atributos
						CodigoBarrasArticuloBean codOriginal = mapaCodigosOriginales.get(codBarras.getCodigoBarras());
						if (!codOriginal.getDesglose1().equals(codBarras.getDesglose1())) {
							return true;
						}
						else if (!codOriginal.getDesglose2().equals(codBarras.getDesglose2())) {
							return true;
						}
						else if (!codOriginal.getDun14().equals(codBarras.getDun14())) {
							return true;
						}
						else if (!codOriginal.getFactorConversion().equals(codBarras.getFactorConversion())) {
							return true;
						}
					}
				}
			}
		}
		return false;
	}

	
	public static void actualizarPrecioCosto(Connection conn, DatosSesionBean datosSesion, String codArticulo, Double precioCosto) 
			throws ArticuloException {
		try {
			ArticuloBean articulo = ArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), codArticulo);
			
			if (articulo.isActAutomaticaCosto()){
				ArticuloTarifaBean articuloTarifa = ArticulosTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), TarifaBean.TARIFA_GENERAL, codArticulo);
				if (!precioCosto.equals(articuloTarifa.getPrecioCosto())){
					articulo.setFechaPrecioCosto(new Date());
					ArticulosDao.actualizarFechaPrecioCosto(conn, datosSesion.getConfigEmpresa(), articulo);
					articuloTarifa.setPrecioCosto(precioCosto);
					
					//recalculamos el precio de venta.
					articuloTarifa.recalculaPrecioVentaDesdeCosto();
					
					//consultamos la tarifa general para obtener el id de grupo de impuesto y el id de tratamiento de impuestos
					TarifaBean tarifaGeneral = TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(), TarifaBean.TARIFA_GENERAL);
					
					//obtenemos el porcentaje asociado al grupo y tratamiento de impuesto de la tarifa general 
					// y al codigo de impuesto del artículo
					PorcentajeImpuestoBean porcentaje = PorcentajesImpuestosDao.consultar(conn, 
						tarifaGeneral.getIdGrupoImpuesto(), tarifaGeneral.getIdTratImpuestos(), articulo.getCodImpuesto());
					
					//establecemos el porcentaje obtenido y recalculamos el precio total.
					articuloTarifa.setPorcentajeImpuesto(porcentaje.getPorcentaje());
					articuloTarifa.recalculaPrecioTotal();

					ServicioTarifas.actualizarArticuloTarifa(conn, articuloTarifa, datosSesion);
				}
			}
		} 
		catch (SQLException e) {
			log.error("actualizarPrecioCosto() - " + e.getMessage());
			String mensaje = "Error actualizando el precio de costo del artículo." + e.getMessage();
			throw new ArticuloException(mensaje, e);
		} 
		catch (TarifaException e) {
			log.error("actualizarPrecioCosto() - " + e.getMessage());
			String mensaje = "Error actualizando el precio de costo del artículo. " + e.getMessage();
			throw new ArticuloException(mensaje, e);
		} 
	}


	// TODO: ARTICULOS - ver este método para qué y dónde
	public static double obtenerPrecioArticuloConImpuestos(String codArt, Double precio, DatosSesionBean datosSesion) 
			throws ArticuloException, ArticuloNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("obtenerPrecioArticuloConImpuestos() - Obteniendo precio con impuestos del artículo " + codArt + " y precio " + precio);
			conn.abrirConexion(Database.getConnection());
			
			// Consultar cliente genérico para obtener el ID_TRAT_IMPUESTOS
			ClienteBean cliente = ServicioClientes.consultar(conn, "0000", datosSesion);
			
			// Consultar el artículo para obtener su CODIMP
			ArticuloBean articulo = consultar(conn, codArt, datosSesion);
			
			// Obtener el porcentaje de impuestos correspondiente, con vigencia actual
			PorcentajeImpuestoBean porcentajeImpuesto = ServicioPorcentajesImpuestos.consultar(conn, new Date(), cliente.getIdTratImp(), articulo.getCodImpuesto());
			
			// Redondeo a 2 decimales del precio + el porcentaje obtenido (+ recargo si lo tiene)
			Double cuotaPorcentaje = Numero.redondea(Numero.redondea(precio * porcentajeImpuesto.getPorcentaje(), 2) / 100, 2);
			Double precioFinal = Numero.redondea(precio + cuotaPorcentaje, 2);
			
			if(porcentajeImpuesto.getPorcentajeRecargo() != null && porcentajeImpuesto.getPorcentajeRecargo() > 0) {
				Double cuotaPorcentajeRecargo = Numero.redondea(Numero.redondea(precio * porcentajeImpuesto.getPorcentajeRecargo(), 2) / 100, 2);
				precioFinal = Numero.redondea(precioFinal + cuotaPorcentajeRecargo, 2);
			}
			
			return precioFinal;
		}
		catch (SQLException e) {
			log.error("obtenerPrecioArticuloConImpuestos() - " + e.getMessage());
			String mensaje = "Error obteniendo los porcentajes de impuesto: " + e.getMessage();
			
			throw new ArticuloException(mensaje, e);
		}
		catch (ClienteException e) {
			log.error("obtenerPrecioArticuloConImpuestos() - " + e.getMessage());
			String mensaje = "Error obteniendo datos de un cliente: " + e.getMessage();
			
			throw new ArticuloException(mensaje, e);
		}
		catch (ClienteNotFoundException e) {
			log.error("obtenerPrecioArticuloConImpuestos() - " + e.getMessage());
			String mensaje = "Error obteniendo datos de un cliente: " + e.getMessage();
			
			throw new ArticuloException(mensaje, e);
		}
		catch (ArticuloException e) {
			log.error("obtenerPrecioArticuloConImpuestos() - " + e.getMessage());
			
			throw e;
		}
		catch (ArticuloNotFoundException e) {
			log.error("obtenerPrecioArticuloConImpuestos() - " + e.getMessage());
			
			throw e;
		}
		catch (PorcentajeImpuestoException e) {
			log.error("obtenerPrecioArticuloConImpuestos() - " + e.getMessage());
			String mensaje = "Error obteniendo los porcentajes de impuesto: " + e.getMessage();
			
			throw new ArticuloException(mensaje, e);
		}
		catch (PorcentajeImpuestoNotFoundException e) {
			log.error("obtenerPrecioArticuloConImpuestos() - " + e.getMessage());
			String mensaje = "Error obteniendo los porcentajes de impuesto: " + e.getMessage();
			
			throw new ArticuloException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
}
