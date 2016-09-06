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

package com.comerzzia.servicios.tiendavirtual.articulos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajeImpuestoBean;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.tiendavirtual.articulos.ArticuloTiendaVirtualBean;
import com.comerzzia.persistencia.tiendavirtual.articulos.ArticulosTiendaVirtualDao;
import com.comerzzia.persistencia.tiendavirtual.articulos.ParametrosBuscarArticulosTVBean;
import com.comerzzia.persistencia.tiendavirtual.articulos.tarifas.ArticuloTarifaTiendaVirtualBean;
import com.comerzzia.persistencia.tiendavirtual.articulos.tarifas.ArticulosTarifasTiendaVirtualDao;
import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoNotFoundException;
import com.comerzzia.servicios.core.impuestos.porcentajes.ServicioPorcentajesImpuestos;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioArticulosTiendaVirtual {

	protected static Logger log = Logger.getMLogger(ServicioArticulosTiendaVirtual.class);

	// TODO: TIENDA VIRTUAL: PENSAR EN CREAR UNA CLASE ARTICULO EN CAPA SERVICIO QUE CONTENGA LA FUNCIONALIDAD DEL CÁLCULO DEL PRECIO
	
	public static PaginaResultados consultar(ParametrosBuscarArticulosTVBean param, ClienteBean cliente, DatosSesionTiendaVirtualBean datosSesion)
			throws ArticuloTiendaVirtualException,  ArticuloTarifaTiendaVirtualNotFoundException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando artículos de la tienda virtual.");

			conn.abrirConexion(Database.getConnection());
			PaginaResultados paginaResultados = ArticulosTiendaVirtualDao.consultar(conn, datosSesion.getConfigTiendaVirtual(), param);
			
			for (int i = 0; i < paginaResultados.getPagina().size(); i++) {
				ArticuloTiendaVirtualBean articulo = (ArticuloTiendaVirtualBean) paginaResultados.getPagina().get(i);
				calcularPrecioArticulo(conn, datosSesion, articulo, cliente);
			}
			return paginaResultados;
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar artículos de la tienda virtual: " + e.getMessage();
			throw new ArticuloTiendaVirtualException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	public static ArticuloTiendaVirtualBean consultar(String codArticulo, ClienteBean cliente, DatosSesionTiendaVirtualBean datosSesion)
			throws ArticuloTiendaVirtualNotFoundException, ArticuloTiendaVirtualException, ArticuloTarifaTiendaVirtualNotFoundException  {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando artículo de la tienda virtual con código: " + codArticulo);

			conn.abrirConexion(Database.getConnection());
			ArticuloTiendaVirtualBean articulo = ArticulosTiendaVirtualDao.consultar(conn, datosSesion.getConfigTiendaVirtual(),codArticulo);
			if (articulo == null) {
				throw new ArticuloTiendaVirtualNotFoundException("No existe el artículo de la tienda virtual que intenta consultar.");
			}
			calcularPrecioArticulo(conn, datosSesion, articulo, cliente);
			return articulo;
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar artículo de la tienda virtual: " + e.getMessage();
			throw new ArticuloTiendaVirtualException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	public static List<ArticuloTiendaVirtualBean> consultarEscaparate(DatosSesionTiendaVirtualBean datosSesion, ClienteBean cliente, String codCategorizacion) 
			throws ArticuloTiendaVirtualException, ArticuloTarifaTiendaVirtualNotFoundException  {
		Connection conn = new Connection();
		try {
			log.debug("consultarEscaparate() - Consultando artículos del escaparate de la tienda virtual");
			
			conn.abrirConexion(Database.getConnection());
			
			List<ArticuloTiendaVirtualBean> escaparate = ArticulosTiendaVirtualDao.consultarEscaparate(conn, datosSesion.getConfigTiendaVirtual(), codCategorizacion);
			for (int i = 0; i < escaparate.size(); i++) {
				ArticuloTiendaVirtualBean articulo = (ArticuloTiendaVirtualBean) escaparate.get(i);
				calcularPrecioArticulo(conn, datosSesion, articulo, cliente);
			}
			return escaparate;
		} 
		catch (SQLException e) {
			log.error("consultarEscaparate() - " + e.getMessage());
			String mensaje = "Error al consultar artículos del escaparate de la tienda virtual: " + e.getMessage();
			throw new ArticuloTiendaVirtualException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	private static void calcularPrecioArticulo(Connection conn, DatosSesionTiendaVirtualBean datosSesion, ArticuloTiendaVirtualBean articulo, ClienteBean cliente) 
			throws SQLException, ArticuloTiendaVirtualException, ArticuloTarifaTiendaVirtualNotFoundException{
		String codTarifa = cliente.getCodTar();
		ArticuloTarifaTiendaVirtualBean articuloTarifa = null; 
		
		if (codTarifa != null){
			articuloTarifa = ArticulosTarifasTiendaVirtualDao.consultar(conn, datosSesion.getConfigTiendaVirtual(), codTarifa, articulo.getCodArticulo()); 
		}
		if (articuloTarifa == null){
			articuloTarifa = ArticulosTarifasTiendaVirtualDao.consultar(conn, datosSesion.getConfigTiendaVirtual(), TarifaBean.TARIFA_GENERAL, articulo.getCodArticulo()); 
		}
		if (articuloTarifa == null){
			log.error("calcularPrecioArticulo() - No se ha encontrado tarifa para el artículo con código: " + articulo.getCodArticulo());
			throw new ArticuloTarifaTiendaVirtualNotFoundException("No se ha encontrado tarifa para el artículo indicado");
		}
		articulo.setPrecioVenta(articuloTarifa.getPrecioVenta());
		calcularPrecioArticuloConImpuestos(conn, articulo, cliente.getIdTratImp(), datosSesion.getIdGrupoImpuestos());
	}

	private static void calcularPrecioArticuloConImpuestos(Connection conn, ArticuloTiendaVirtualBean articulo, Long idTratamientoImpuestos, Long idGrupoImpuestos)
			throws ArticuloTiendaVirtualException {

		try { 
			log.debug("obtenerPrecioArticuloConImpuestos() - Obteniendo precio con impuestos");

			// Obtener el porcentaje de impuestos correspondiente, con vigencia actual
			PorcentajeImpuestoBean porcentajeImpuesto = ServicioPorcentajesImpuestos.consultar(conn, idGrupoImpuestos, idTratamientoImpuestos, articulo.getCodImpuesto());

			// Redondeo a 2 decimales del precio + el porcentaje obtenido (+ recargo si lo tiene)
			Double cuotaPorcentaje = Numero.redondea(Numero.redondea(articulo.getPrecioVenta() * porcentajeImpuesto.getPorcentaje(), 2) / 100, 2);
			Double precioFinal = Numero.redondea(articulo.getPrecioVenta() + cuotaPorcentaje, 2);

			if (porcentajeImpuesto.getPorcentajeRecargo() != null && porcentajeImpuesto.getPorcentajeRecargo() > 0) {
				Double cuotaPorcentajeRecargo = Numero.redondea(Numero.redondea(articulo.getPrecioVenta() * porcentajeImpuesto.getPorcentajeRecargo(), 2) / 100, 2);
				precioFinal = Numero.redondea(precioFinal + cuotaPorcentajeRecargo, 2);
			}
			articulo.setPrecioVentaConImpuestos(precioFinal);
		} 
		catch (PorcentajeImpuestoException e) {
			log.error("obtenerPrecioArticuloConImpuestos() - " + e.getMessage());
			String mensaje = "Error obteniendo los porcentajes de impuesto: " + e.getMessage();
			throw new ArticuloTiendaVirtualException(mensaje, e);
		} 
		catch (PorcentajeImpuestoNotFoundException e) {
			log.error("obtenerPrecioArticuloConImpuestos() - " + e.getMessage());
			String mensaje = "Error obteniendo los porcentajes de impuesto: " + e.getMessage();
			throw new ArticuloTiendaVirtualException(mensaje, e);
		}
	}
}
