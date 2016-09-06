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

package com.comerzzia.servicios.sincronizacion.sincronizadores;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.general.tiendas.TiendaBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.persistencia.sincronizacion.articulos.ArticuloTiendaBean;
import com.comerzzia.persistencia.sincronizacion.articulos.CategorizacionTiendaBean;
import com.comerzzia.persistencia.sincronizacion.articulos.CodigoBarrasArticuloTiendaBean;
import com.comerzzia.persistencia.sincronizacion.general.ClienteTiendaBean;
import com.comerzzia.persistencia.sincronizacion.general.MedioPagoTiendaBean;
import com.comerzzia.persistencia.sincronizacion.general.TiendaTiendaBean;
import com.comerzzia.persistencia.sincronizacion.tarifas.ArticuloPromocionTiendaBean;
import com.comerzzia.persistencia.sincronizacion.tarifas.ArticuloTarifaTiendaBean;
import com.comerzzia.servicios.sincronizacion.TrabajoSincronizadorException;
import com.comerzzia.util.config.AppInfo;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.xml.XMLDocumentException;
import com.comerzzia.util.xml.XMLDocumentUtils;


public class SincronizadorOnline extends SincronizadorBBDD implements ISincronizador, IConfigSincronizacion {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(SincronizadorOnline.class);
	

	/**
	 * Constructor
	 */
	public SincronizadorOnline() {
		super();
	}
	
	
	public void inicializar(TiendaBean tienda) throws TrabajoSincronizadorException {
		this.tienda = tienda;
		inicializarContadores();
		
		try {
			// Realizamos la conexión con la base de datos
			Connection conn = new Connection();
			conn.abrirConexion(Database.getConnection());
			
			// Y la establacemos como conexión de la central y de la tienda
			connCentral = conn;
			connTienda = conn;
			
			// Y establacemos la configuración de la empresa
			ConfigEmpresaBean config = new ConfigEmpresaBean();
			config.setEsquemaEmpresa(AppInfo.getDbInfo().getEsquemaEmpresa());
			configCentral = config;
			configTienda = config;
		} 
		catch (SQLException e) {
			log.error("inicializar() - Error al conectar con la BBDD: " + e.getMessage());
			throw new TrabajoSincronizadorException("No se ha podido realizar la conexión con la base de datos: " + e.getMessage());
		}
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#enviarConfiguracion()
	 */
	@Override
	public void enviarConfiguracion() throws TrabajoSincronizadorException {
		try {
			connCentral.iniciaTransaccion();
			
			// Sincronizamos medios de pago
			sincronizarMediosPago();
			
			// Sincronizamos datos de tienda
			sincronizarTiendaCliente();
			
			connCentral.commit();
			connCentral.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("enviarConfiguracion() - Desahaciendo transacción en la central");
			connCentral.deshacerTransaccion();
			
			log.error("enviarConfiguracion() - Error al enviar configuración a la tienda " + tienda.getCodAlm() + ": " + e.getMessage());
			throw new TrabajoSincronizadorException(e.getMessage(), e);
		}
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.SincronizadorBBDD#sincronizarMedioPago(com.comerzzia.persistencia.sincronizacion.general.MedioPagoTiendaBean)
	 */
	protected void sincronizarMedioPago(MedioPagoTiendaBean medioPago) throws SQLException {
		sincronizarMedioPagoCentral(medioPago);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.SincronizadorBBDD#sincronizarCliente(com.comerzzia.persistencia.sincronizacion.general.ClienteTiendaBean)
	 */
	protected void sincronizarCliente(ClienteTiendaBean cliente) throws SQLException {
		sincronizarClienteCentral(cliente);
	}
	
	
	protected void sincronizarTienda(TiendaTiendaBean tienda) throws SQLException {
		sincronizarTiendaCentral(tienda);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#enviarArticulos()
	 */
	@Override
	public void enviarArticulos() throws TrabajoSincronizadorException {
		try {
			connCentral.iniciaTransaccion();
			
			// Sincronizamos las categorizaciones de los artículos
			sincronizarCategorizaciones();
			
			// Sincronizamos los artículos
			sincronizarArticulos();
			
			// Sincronizamos las tarifas
			sincronizarTarifas();
			
			connCentral.commit();
			connCentral.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("enviarArticulos() - Desahaciendo transacción en la central");
			connCentral.deshacerTransaccion();
			
			log.error("enviarArticulos() - Error al enviar artículos a la tienda " + tienda.getCodAlm() + ": " + e.getMessage());
			throw new TrabajoSincronizadorException(e.getMessage(), e);
		}
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.SincronizadorBBDD#sincronizarCategorizacion(com.comerzzia.persistencia.sincronizacion.articulos.CategorizacionTiendaBean)
	 */
	protected void sincronizarCategorizacion(CategorizacionTiendaBean categorizacion) throws SQLException {
		sincronizarCategorizacionCentral(categorizacion);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.SincronizadorBBDD#sincronizarArticulo(com.comerzzia.persistencia.sincronizacion.articulos.ArticuloTiendaBean)
	 */
	protected void sincronizarArticulo(ArticuloTiendaBean articulo) throws SQLException {
		sincronizarArticuloCentral(articulo);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.SincronizadorBBDD#sincronizarCodigoBarras(com.comerzzia.persistencia.sincronizacion.articulos.CodigoBarrasArticuloTiendaBean)
	 */
	protected void sincronizarCodigoBarras(CodigoBarrasArticuloTiendaBean codigoBarras) throws SQLException {
		sincronizarCodigoBarrasCentral(codigoBarras);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.SincronizadorBBDD#borrarArticuloTarifa(com.comerzzia.persistencia.sincronizacion.tarifas.ArticuloTarifaTiendaBean)
	 */
	protected void borrarArticuloTarifa(ArticuloTarifaTiendaBean articulo) throws SQLException {
		borrarArticuloTarifaCentral(articulo);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.SincronizadorBBDD#sincronizarArticuloTarifa(com.comerzzia.persistencia.sincronizacion.tarifas.ArticuloTarifaTiendaBean, com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean)
	 */
	protected void sincronizarArticuloTarifa(ArticuloTarifaTiendaBean articulo, TarifaTiendaBean tarifa) throws SQLException {
		sincronizarArticuloTarifaCentral(articulo, tarifa);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.SincronizadorBBDD#sincronizarArticuloPromocion(com.comerzzia.persistencia.sincronizacion.tarifas.ArticuloPromocionTiendaBean)
	 */
	protected void sincronizarArticuloPromocion(ArticuloPromocionTiendaBean articulo) throws SQLException {
		sincronizarArticuloPromocionCentral(articulo);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#recibirTickets()
	 */
	@Override
	public void recibirTickets() throws TrabajoSincronizadorException {
		try {
			connCentral.iniciaTransaccion();
			
			sincronizarTickets();
			
			connCentral.commit();
			connCentral.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("recibirTickets() - Desahaciendo transacción");
			connCentral.deshacerTransaccion();
			
			log.error("recibirTickets() - Error al recibir tickets de la tienda " + tienda.getCodAlm() + ": " + e.getMessage());
			throw new TrabajoSincronizadorException(e.getMessage(), e);
		}
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#finalizar()
	 */
	@Override
	public void finalizar() {
		// Cerramos la conexión
		connCentral.cerrarConexion();
	}


	
	/* 
	 * Implementación de IConfigSincronizacion 
	 * 
	 * La sincronización Online no requiere de ningún parámetro de configuración.
	 * 
	 * Tanto la lista de parámetros como el XML de configuración se devuelven vacios
	 * 
	 */ 
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.IConfigSincronizacion#getXmlConfiguracion()
	 */
	@Override
	public Document getXmlConfiguracion() throws XMLDocumentException {
		Document configuracion = XMLDocumentUtils.createDocument();
		Element root = (Element) configuracion.createElement(TAG_SINCRONIZACION);
		configuracion.appendChild(root);
		
		return configuracion;
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.IConfigSincronizacion#getListaParametros()
	 */
	@Override
	public List<String> getListaParametros() {
		return new ArrayList<String>();
	}

	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.IConfigSincronizacion#setValor(java.lang.String, java.lang.String)
	 */
	@Override
	public void setValor(String parametro, String valor) {
	}
	

	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.IConfigSincronizacion#getValor(java.lang.String)
	 */
	@Override
	public String getValor(String parametro) {
		return null;
	}


	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.IConfigSincronizacion#setXmlConfiguracion(org.w3c.dom.Document)
	 */
	@Override
	public void setXmlConfiguracion(Document configuracion) throws XMLDocumentException {
	}
}
