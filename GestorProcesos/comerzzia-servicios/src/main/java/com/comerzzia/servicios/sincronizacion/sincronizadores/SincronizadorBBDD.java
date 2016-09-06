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

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.w3c.dom.Element;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.core.empresas.EmpresaBean;
import com.comerzzia.persistencia.core.empresas.EmpresasDao;
import com.comerzzia.persistencia.core.impuestos.grupos.GrupoImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.grupos.GruposImpuestosDao;
import com.comerzzia.persistencia.core.impuestos.porcentajes.ParametrosBuscarPorcentajesImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajeImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajesImpuestosDao;
import com.comerzzia.persistencia.core.impuestos.tiposimpuestos.TipoImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.tiposimpuestos.TiposImpuestosDao;
import com.comerzzia.persistencia.core.impuestos.tratamientosimpuestos.TratamientoImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.tratamientosimpuestos.TratamientosImpuestosDao;
import com.comerzzia.persistencia.core.perfiles.PerfilBean;
import com.comerzzia.persistencia.core.perfiles.PerfilesDao;
import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.persistencia.core.usuarios.UsuariosDao;
import com.comerzzia.persistencia.core.variables.VariableBean;
import com.comerzzia.persistencia.core.variables.VariablesDao;
import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.persistencia.general.articulos.ArticulosDao;
import com.comerzzia.persistencia.general.articulos.VersionArticuloBean;
import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean;
import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigosBarrasArticulosDao;
import com.comerzzia.persistencia.general.categorizaciones.CategorizacionBean;
import com.comerzzia.persistencia.general.categorizaciones.CategorizacionesDao;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.clientes.ClientesDao;
import com.comerzzia.persistencia.general.mediospago.MedioPagoBean;
import com.comerzzia.persistencia.general.mediospago.MediosPagoDao;
import com.comerzzia.persistencia.general.mediospago.ParametrosBuscarMediosPagoBean;
import com.comerzzia.persistencia.general.tiendas.TiendaBean;
import com.comerzzia.persistencia.general.tiendas.TiendasDao;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifasTiendasDao;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenesUsuariosDao;
import com.comerzzia.persistencia.sincronizacion.articulos.ArticuloTiendaBean;
import com.comerzzia.persistencia.sincronizacion.articulos.ArticulosTiendaDao;
import com.comerzzia.persistencia.sincronizacion.articulos.CategorizacionTiendaBean;
import com.comerzzia.persistencia.sincronizacion.articulos.CategorizacionesTiendaDao;
import com.comerzzia.persistencia.sincronizacion.articulos.CodigoBarrasArticuloTiendaBean;
import com.comerzzia.persistencia.sincronizacion.articulos.CodigosBarrasArticulosTiendaDao;
import com.comerzzia.persistencia.sincronizacion.general.ClienteTiendaBean;
import com.comerzzia.persistencia.sincronizacion.general.ClientesTiendaDao;
import com.comerzzia.persistencia.sincronizacion.general.MedioPagoTiendaBean;
import com.comerzzia.persistencia.sincronizacion.general.MediosPagoTiendaDao;
import com.comerzzia.persistencia.sincronizacion.general.TiendaTiendaBean;
import com.comerzzia.persistencia.sincronizacion.general.TiendasTiendaDao;
import com.comerzzia.persistencia.sincronizacion.impuestos.GruposImpuestosTiendaDao;
import com.comerzzia.persistencia.sincronizacion.impuestos.PorcentajesImpuestosTiendaDao;
import com.comerzzia.persistencia.sincronizacion.impuestos.TiposImpuestosTiendaDao;
import com.comerzzia.persistencia.sincronizacion.impuestos.TratamientosImpuestosTiendaDao;
import com.comerzzia.persistencia.sincronizacion.tarifas.ArticuloPromocionTiendaBean;
import com.comerzzia.persistencia.sincronizacion.tarifas.ArticuloTarifaTiendaBean;
import com.comerzzia.persistencia.sincronizacion.tarifas.ArticulosPromocionTiendaDao;
import com.comerzzia.persistencia.sincronizacion.tarifas.ArticulosTarifaTiendaDao;
import com.comerzzia.persistencia.sincronizacion.tickets.TicketTiendaBean;
import com.comerzzia.persistencia.sincronizacion.tickets.TicketsTiendaDao;
import com.comerzzia.persistencia.sincronizacion.usuarios.PerfilesTiendaDao;
import com.comerzzia.persistencia.sincronizacion.usuarios.UsuariosTiendaDao;
import com.comerzzia.persistencia.sincronizacion.variables.VariablesTiendaDao;
import com.comerzzia.persistencia.ventas.promociones.PromocionBean;
import com.comerzzia.persistencia.ventas.promociones.PromocionesDao;
import com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ArticulosPromocionesDao;
import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifasDao;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticulosTarifaDao;
import com.comerzzia.persistencia.ventas.tickets.TicketsDao;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.servicios.sincronizacion.TrabajoSincronizadorException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.config.AppInfo;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.util.xml.XMLDocument;
import com.comerzzia.util.xml.XMLDocumentException;
import com.comerzzia.util.xml.XMLDocumentUtils;


public class SincronizadorBBDD implements ISincronizador {

	/**
	 * Información de la tienda con la que sincronizar
	 */
	protected TiendaBean tienda = null;
	
	/**
	 * Conexión a la Base de Datos de Comerzzia de la Central
	 */
	protected Connection connCentral = null;
	
	/**
	 * Conexión a la Base de Datos del TPV de la Tienda
	 */
	protected Connection connTienda = null;
	
	/**
	 * Configuración de empresa de la central
	 */
	protected ConfigEmpresaBean configCentral = null;
	
	/**
	 * Configuración de empresa de la tienda
	 */
	protected ConfigEmpresaBean configTienda = null;
	
	/**
	 * Número de tickets recibidos
	 */
	protected int numTicketsRecibidos = 0;
	
	/**
	 * Número de artículos sincronizados con la tienda
	 */
	protected int numArticulosSincronizados = 0;
	
	/**
	 * Número de artículos de tarifas sincronziados con la tienda
	 */
	protected int numArticulosTarifasSincronizados = 0;
	
	/**
	 * Número de artículos de promociones sincronizados con la tienda
	 */
	protected int numArticulosPromocionesSincronizados = 0;
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(SincronizadorBBDD.class);
	
	
	private boolean insertadoArticulo = false;
	private boolean insertadoCodigoBarras = false;
	
	
	/**
	 * Constructor
	 */
	public SincronizadorBBDD() {
		connCentral = new Connection();
		connTienda = new Connection();
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#inicializar(com.comerzzia.persistencia.general.tiendas.TiendaBean)
	 */
	@Override
	public void inicializar(TiendaBean tienda) throws TrabajoSincronizadorException {
		this.tienda = tienda;
		inicializarContadores();
		
		try {
			// Obtenemos la configuración de la tienda
			XMLDocument configuracion = tienda.getConfiguracion();
			
			// Obtenemos los parámetros de conexión
			Element baseDatos = XMLDocumentUtils.getElement(configuracion.getDocument().getDocumentElement(), "baseDatos", false);
			String driver = XMLDocumentUtils.getTagValue(baseDatos, "driver", false);
			String url = XMLDocumentUtils.getTagValue(baseDatos, "url", false);
			String usuario = XMLDocumentUtils.getTagValue(baseDatos, "usuario", false);
			String clave = XMLDocumentUtils.getTagValue(baseDatos, "clave", false);
			String esquema = XMLDocumentUtils.getTagValue(baseDatos, "esquema", false);
			
			// Realizamos la conexión con la base de datos de la tienda
			Class.forName(driver);
			connTienda.abrirConexion(DriverManager.getConnection(url, usuario, clave));
			configTienda = new ConfigEmpresaBean();
			configTienda.setEsquemaEmpresa(esquema);
		}
		catch (XMLDocumentException e) {
			log.error("inicializar() - Error al obtener la configuración de conexión con la tienda " + tienda.getCodAlm() + ": " + e.getMessage());
			throw new TrabajoSincronizadorException("No se ha podido leer la configuración de conexión de la tienda: " + e.getMessage());
		}
		catch (SQLException e) {
			log.error("inicializar() - Error al conectar con la BBDD de la Tienda " + tienda.getCodAlm() + ": " + e.getMessage());
			throw new TrabajoSincronizadorException("No se ha podido realizar la conexión con la base de datos de la tienda: " + e.getMessage());
		} 
		catch (ClassNotFoundException e) {
			log.error("inicializar() - Error al conectar con la BBDD de la Tienda " + tienda.getCodAlm() + ": " + e.getMessage());
			throw new TrabajoSincronizadorException("No se ha podido realizar la conexión con la base de datos de la tienda: " + e.getMessage());
		} 
		
		
		try {
			// Realizamos la conexión con la base de datos de la central
			connCentral.abrirConexion(Database.getConnection());
			configCentral = new ConfigEmpresaBean();
			configCentral.setEsquemaEmpresa(AppInfo.getDbInfo().getEsquemaEmpresa());
		} 
		catch (SQLException e) {
			log.error("inicializar() - Error al conectar con la BBDD de la Central: " + e.getMessage());
			throw new TrabajoSincronizadorException("No se ha podido realizar la conexión con la base de datos de la central: " + e.getMessage());
		}
	}
	
	
	protected void inicializarContadores() {
		this.numTicketsRecibidos = 0;
		this.numArticulosSincronizados = 0;
		this.numArticulosTarifasSincronizados = 0;
		this.numArticulosPromocionesSincronizados = 0;
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#enviarConfiguracion()
	 */
	@Override
	public void enviarConfiguracion() throws TrabajoSincronizadorException {
		try {
			connTienda.iniciaTransaccion();
			connCentral.iniciaTransaccion();
			
			// Sincronizamos variables
			sincronizarVariables();
			
			// Sincronizamos datos de impuestos
			sincronizarImpuestos();
			
			// Sincronizamos usuarios
			sincronizarUsuarios();
			
			// Sincronizamos medios de pago
			sincronizarMediosPago();
			
			// Sincronizamos datos de tienda
			sincronizarTiendaCliente();
			
			connTienda.commit();
			connCentral.commit();
			connTienda.finalizaTransaccion();
			connCentral.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("enviarConfiguracion() - Desahaciendo transacción en la tienda");
			connTienda.deshacerTransaccion();
			
			log.debug("enviarConfiguracion() - Desahaciendo transacción en la central");
			connCentral.deshacerTransaccion();
			
			log.error("enviarConfiguracion() - Error al enviar configuración a la tienda " + tienda.getCodAlm() + ": " + e.getMessage());
			throw new TrabajoSincronizadorException(e.getMessage(), e);
		}
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#getResumenConfiguracionEnviada()
	 */
	@Override
	public String getResumenEnvioConfiguracion() {
		return "Envío de configuración realizado correctamente";
	}
	
	
	/**
	 * Realiza la sincronización de las variables del sistema con la tienda
	 * 
	 * @throws SQLExcepion
	 */
	protected void sincronizarVariables() throws SQLException {
		sincronizarVariable(Variables.ARTICULOS_DESGLOSE1_TITULO);
		sincronizarVariable(Variables.ARTICULOS_DESGLOSE2_TITULO);
		sincronizarVariable(Variables.WEBSERVICES_WSCLIENTES);
		sincronizarVariable(Variables.TICKETS_USA_DESCUENTO_EN_LINEA);
	}
	
	
	/**
	 * Realiza la sincronización de la variable indicada con la tienda
	 * 
	 * Si la variable tiene un valor en la Central, se envía a la tienda, 
	 * intentando insertarla, y si ya existe actualizandola.
	 * Si la variable no tiene valor se elimina de la tienda por si
	 * anteriormente se había enviado
	 * 
	 * @param idVariable
	 * @throws SQLException
	 */
	protected void sincronizarVariable(String idVariable) throws SQLException {
		// Obtenemos la variable
		VariableBean variable = VariablesDao.consultar(connCentral, idVariable);
		
		if (variable == null) {
			throw new SQLException("No se ha encontrado la variable con identificador: " + idVariable);
		}
		
		// Si tenemos un valor establecido para la variable la enviamos a la tienda
		if(variable.getValor() != null && !variable.getValor().isEmpty()) {
			try {
				VariablesTiendaDao.insert(connTienda, configTienda, variable);
			} 
			catch (KeyConstraintViolationException e) {
				VariablesTiendaDao.update(connTienda, configTienda, variable);
			}
		}
		else {  // Si no la borramos de la tienda
			VariablesTiendaDao.delete(connTienda, configTienda, idVariable);
		}
	}
	
	
	/**
	 * Realiza la sincronización de datos de impuestos con la tienda
	 * 
	 * @throws SQLException
	 */
	protected void sincronizarImpuestos() throws SQLException {
		// Grupos de impuestos
		GrupoImpuestosBean grupoImpuesto = GruposImpuestosDao.consultar(connCentral, new Date());
		try {
			GruposImpuestosTiendaDao.insert(connTienda, configTienda, grupoImpuesto);
		}
		catch (KeyConstraintViolationException e) {
			GruposImpuestosTiendaDao.update(connTienda, configTienda, grupoImpuesto);
		}
		
		// Tratamientos de impuestos
		List<TratamientoImpuestoBean> tratamientosImpuestos = TratamientosImpuestosDao.consultar(connCentral);
		for (TratamientoImpuestoBean tratamiento : tratamientosImpuestos) {
			try {
				TratamientosImpuestosTiendaDao.insert(connTienda, configTienda, tratamiento);
			}
			catch (KeyConstraintViolationException e) {
				TratamientosImpuestosTiendaDao.update(connTienda, configTienda, tratamiento);
			}
		}
		
		// Tipos de impuestos
		List<TipoImpuestoBean> tiposImpuestos = TiposImpuestosDao.consultar(connCentral);
		for (TipoImpuestoBean tipoImpuesto : tiposImpuestos) {
			try {
				TiposImpuestosTiendaDao.insert(connTienda, configTienda, tipoImpuesto);
			}
			catch (KeyConstraintViolationException e) {
				TiposImpuestosTiendaDao.update(connTienda, configTienda, tipoImpuesto);
			}
		}
		
		// Porcentajes de impuestos
		ParametrosBuscarPorcentajesImpuestosBean param = new ParametrosBuscarPorcentajesImpuestosBean();
		param.setTamañoPagina(1000);
		param.setNumPagina(1);
		PaginaResultados pagina = PorcentajesImpuestosDao.consultar(connCentral, param);
		for (int i = 0; i < pagina.getPagina().size(); i++) {
			PorcentajeImpuestoBean porcentaje = (PorcentajeImpuestoBean) pagina.getPagina().get(i);
			try {
				PorcentajesImpuestosTiendaDao.insert(connTienda, configTienda, porcentaje);
			}
			catch (KeyConstraintViolationException e) {
				PorcentajesImpuestosTiendaDao.update(connTienda, configTienda, porcentaje);
			}
		}
	}
	
	
	/**
	 * Realiza la sincronización de perfiles y usuarios con la tienda
	 * 
	 * @throws SQLException
	 */
	protected void sincronizarUsuarios() throws SQLException {
		// Perfiles
		List<PerfilBean> perfiles = PerfilesDao.consultar(connCentral);
		for (PerfilBean perfil : perfiles) {
			try {
				PerfilesTiendaDao.insert(connTienda, configTienda, perfil);
			}
			catch (KeyConstraintViolationException e) {
				PerfilesTiendaDao.update(connTienda, configTienda, perfil);
			}
		}
		
		// Usuarios asignados al almacén de la tienda
		List<Long> usuarios = AlmacenesUsuariosDao.consultarUsuarios(connCentral, configCentral, tienda.getCodAlm());
		for (Long idUsuario : usuarios) {
			UsuarioBean usuario = UsuariosDao.consultar(connCentral, idUsuario);
			
			try {
				UsuariosTiendaDao.insert(connTienda, configTienda, usuario);
			}
			catch (KeyConstraintViolationException e) {
				UsuariosTiendaDao.update(connTienda, configTienda, usuario);
			}
		}
	}

	
	/**
	 * Realiza la sincronización de los datos de la tienda y de su cliente
	 * 
	 * @throws SQLException
	 */
	protected void sincronizarTiendaCliente() throws SQLException { 

		// Obtenemos el cliente definido para la tienda
		ClienteBean cliente = ClientesDao.consultar(connCentral, configCentral, tienda.getCodCliente());
		
		if (cliente == null) {
			throw new SQLException("No se ha encontrado el cliente definido para la tienda");
		}
		
		if (cliente.getCif() == null || cliente.getCif().length() == 0) {
			throw new SQLException("No se ha especificado el CIF del cliente asociado a la tienda");
		}
		
		// Sincronizamos los datos del cliente
		ClienteTiendaBean clienteTienda = new ClienteTiendaBean(cliente, tienda);
		sincronizarCliente(clienteTienda);
		
		// Sincronizamos los datos de la tienda
		TiendaTiendaBean tiendaTienda = new TiendaTiendaBean(this.tienda);
		EmpresaBean empresa = EmpresasDao.consultar(connCentral, configCentral);
		if (empresa != null) {
			tiendaTienda.setCif(empresa.getCif());
		}
		if (tiendaTienda.getCif() == null || tiendaTienda.getCif().isEmpty()) {
			tiendaTienda.setCif("0");
		}
		tiendaTienda.setCifCliente(cliente.getCif());
		tiendaTienda.setNombreComercial(cliente.getNombreComercial());
		sincronizarTienda(tiendaTienda);
	}
	
	
	/**
	 * Realiza la sincronización de los datos de la tienda entre la central y la tienda
	 * 
	 * @param tienda
	 * @throws SQLException
	 */
	protected void sincronizarTienda(TiendaTiendaBean tienda) throws SQLException {
		sincronizarTiendaCentral(tienda);
		sincronizarTiendaTienda(tienda);
	}
	
	
	/**
	 * Sincroniza los datos de la tienda en la central
	 * 
	 * @param tienda
	 * @throws SQLException
	 */
	protected void sincronizarTiendaCentral(TiendaTiendaBean tienda) throws SQLException {
		insertarTienda(connCentral, configCentral, tienda);
	}
	
	
	/**
	 * Sincroniza los datos la tienda en la tienda
	 * 
	 * @param tienda
	 * @throws SQLException
	 */
	protected void sincronizarTiendaTienda(TiendaTiendaBean tienda) throws SQLException {
		insertarTienda(connTienda, configTienda, tienda);
	}
	
	
	/**
	 * Inserta la tienda y si ya existe la actualiza
	 * 
	 * @param conn
	 * @param config
	 * @param tienda
	 * @throws SQLException
	 */
	protected void insertarTienda(Connection conn, ConfigEmpresaBean config, 
			TiendaTiendaBean tienda) throws SQLException {
		try {	
			TiendasTiendaDao.insert(conn, config, tienda);
		}
		catch (KeyConstraintViolationException e) {
			TiendasTiendaDao.update(conn, config, tienda);
		}
	}
	
	
	/**
	 * Realiza la sincronización de los datos del cliente entre la central y la tienda
	 * 
	 * @param cliente
	 * @throws SQLException
	 */
	protected void sincronizarCliente(ClienteTiendaBean cliente) throws SQLException {
		sincronizarClienteCentral(cliente);
		sincronizarClienteTienda(cliente);
	}
	
	
	/**
	 * Sincroniza los datos del cliente en la tienda
	 * 
	 * @param cliente
	 * @throws SQLException
	 */
	protected void sincronizarClienteCentral(ClienteTiendaBean cliente) throws SQLException {
		insertarCliente(connCentral, configCentral, cliente);
	}
	
	
	/**
	 * Sincroniza los datos del cliente en la tienda
	 * 
	 * @param cliente
	 * @throws SQLException
	 */
	protected void sincronizarClienteTienda(ClienteTiendaBean cliente) throws SQLException {
		insertarCliente(connTienda, configTienda, cliente);
	}
	
	
	/**
	 * Inserta el cliente y si ya existe lo actualiza
	 * 
	 * @param conn
	 * @param config
	 * @param cliente
	 * @throws SQLException
	 */
	protected void insertarCliente(Connection conn, ConfigEmpresaBean config, 
			ClienteTiendaBean cliente) throws SQLException {
		try {
			ClientesTiendaDao.insert(conn, config, cliente);
		}
		catch (KeyConstraintViolationException e) {
			ClientesTiendaDao.update(conn, config, cliente);
		}
	}


	/**
	 * Realiza la sincronización de los medios de pago con la tienda
	 * 
	 * @throws SQLException
	 */
	protected void sincronizarMediosPago() throws SQLException {
		ParametrosBuscarMediosPagoBean param = new ParametrosBuscarMediosPagoBean();
		param.setTamañoPagina(1000);
		param.setNumPagina(1);
		
		PaginaResultados pagina = MediosPagoDao.consultar(connCentral, configCentral, param);
		for (int i = 0; i < pagina.getPagina().size(); i++) {
			MedioPagoBean medioPago = (MedioPagoBean) pagina.getPagina().get(i);
			MedioPagoTiendaBean medioPagoTienda = new MedioPagoTiendaBean(medioPago, tienda.getCodAlm());
			
			sincronizarMedioPago(medioPagoTienda);
		}
	}
	
	
	/**
	 * Realiza la sincronización de los datos del medio de pago entre la central y la tienda
	 * 
	 * @param medioPago
	 * @throws SQLException
	 */
	protected void sincronizarMedioPago(MedioPagoTiendaBean medioPago) throws SQLException {
		sincronizarMedioPagoCentral(medioPago);
		sincronizarMedioPagoTienda(medioPago);
	}
	
	
	/**
	 * Sincroniza los datos del medio de pago en la central
	 * 
	 * @param medioPago
	 * @throws SQLException
	 */
	protected void sincronizarMedioPagoCentral(MedioPagoTiendaBean medioPago) throws SQLException {
		insertarMedioPago(connCentral, configCentral, medioPago);
	}
	
	
	/**
	 * Sincroniza los datos del medio de pago en la tienda
	 * 
	 * @param medioPago
	 * @throws SQLException
	 */
	protected void sincronizarMedioPagoTienda(MedioPagoTiendaBean medioPago) throws SQLException {
		insertarMedioPago(connTienda, configTienda, medioPago);
	}
	
	
	/**
	 * Inserta el medio de pago si es válido para la venta, 
	 * y si ya existe lo actualiza
	 * 
	 * Si no es válido para la venta lo actualiza poniendolo
	 * inactivo por si en algún momento se había enviado, para que 
	 * así deje de usarse
	 * 
	 * @param conn
	 * @param config
	 * @param medioPago
	 * @throws SQLException
	 */
	protected void insertarMedioPago(Connection conn, ConfigEmpresaBean config, 
			MedioPagoTiendaBean medioPago) throws SQLException {
		// Si el medio de pago es válido para la venta lo enviamos
		if (medioPago.isVisibleVenta()) {
			try {
				MediosPagoTiendaDao.insert(conn, config, medioPago);
			}
			catch (KeyConstraintViolationException e) {
				MediosPagoTiendaDao.update(conn, config, medioPago);
			}
		}
		else {
			// Por si acaso en algún momento se había enviado a la tienda, 
			// lo inactivamos para que no se use más.
			medioPago.setActivo(false);
			MediosPagoTiendaDao.update(conn, config, medioPago);
		}
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#enviarArticulos()
	 */
	@Override
	public void enviarArticulos() throws TrabajoSincronizadorException {
		try {
			connTienda.iniciaTransaccion();
			connCentral.iniciaTransaccion();
			
			// Sincronizamos las categorizaciones de los artículos
			sincronizarCategorizaciones();
			
			// Sincronizamos los artículos
			sincronizarArticulos();
			
			// Sincronizamos las tarifas
			sincronizarTarifas();
			
			connTienda.commit();
			connCentral.commit();
			connTienda.finalizaTransaccion();
			connCentral.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("enviarArticulos() - Desahaciendo transacción en la tienda");
			connTienda.deshacerTransaccion();
			
			log.debug("enviarArticulos() - Desahaciendo transacción en la central");
			connCentral.deshacerTransaccion();
			
			log.error("enviarArticulos() - Error al enviar artículos a la tienda " + tienda.getCodAlm() + ": " + e.getMessage());
			throw new TrabajoSincronizadorException(e.getMessage(), e);
		}
	}
	
	
	/**
	 * Realiza la sincronización de las categorizaciones con la tienda
	 * 
	 * @throws SQLException
	 */
	protected void sincronizarCategorizaciones() throws SQLException {
		// Obtenemos la lista de categorizaciones a sincronizar
		List<CategorizacionBean> categorizaciones = 
			CategorizacionesDao.consultarCategorizacionesSincronizacion(connCentral, configCentral, tienda.getCodAlm());
		
		for (CategorizacionBean categorizacion : categorizaciones) {
			// Obtenemos la categorización para el almacén
			CategorizacionTiendaBean categorizacionTienda = new CategorizacionTiendaBean(categorizacion, tienda.getCodAlm());
			
			// Sincronizamos la categorización
			sincronizarCategorizacion(categorizacionTienda);
		}
	}
	
	
	/**
	 * Realiza la sincronización de los datos de la categorización entre la central y la tienda
	 * 
	 * @param categorizacion
	 * @throws SQLException
	 */
	protected void sincronizarCategorizacion(CategorizacionTiendaBean categorizacion) throws SQLException {
		sincronizarCategorizacionCentral(categorizacion);
		sincronizarCategorizacionTienda(categorizacion);
	}
	
	
	/**
	 * Sincroniza los datos de la categorización en la central
	 * 
	 * @param categorizacion
	 * @throws SQLException
	 */
	protected void sincronizarCategorizacionCentral(CategorizacionTiendaBean categorizacion) throws SQLException {
		actualizarCategorizacion(connCentral, configCentral, categorizacion);
	}
	
	
	/**
	 * Sincroniza los datos de la categorización en la tienda
	 * 
	 * @param categorizacion
	 * @throws SQLException
	 */
	protected void sincronizarCategorizacionTienda(CategorizacionTiendaBean categorizacion) throws SQLException {
		actualizarCategorizacion(connTienda, configTienda, categorizacion);
	}
	
	
	/**
	 * 
	 * 
	 * @param conn
	 * @param config
	 * @param categorizacion
	 * @throws SQLException
	 */
	protected void actualizarCategorizacion(Connection conn, ConfigEmpresaBean config, 
			CategorizacionTiendaBean categorizacion) throws SQLException {
		if (CategorizacionesTiendaDao.update(conn, config, categorizacion) == 0) {
			CategorizacionesTiendaDao.insert(conn, config, categorizacion);
		}
	}
	
	
	/**
	 * Realiza la sincronización de artículos con la tienda
	 * 
	 * @throws SQLException
	 */
	protected void sincronizarArticulos() throws SQLException {
		// Obtenemos la versión actual de artículos
		VersionArticuloBean versionArticulos = ArticulosDao.consultarVersionActual(connCentral, configCentral);
		
		if (versionArticulos != null) {
			// Comparamos la versión actual con la que tiene la tienda
			if (versionArticulos.getVersion() > tienda.getVersionArticulos()) {
				
				// Obtenemos la lista de artículos a sincronizar
				List<ArticuloBean> articulos = ArticulosDao.consultarArticulosSincronizacion(connCentral, 
						configCentral, tienda.getVersionArticulos(), versionArticulos.getVersion());
				
				for (ArticuloBean articulo : articulos) {
					// Obtenemos el artículo para el almacén
					ArticuloTiendaBean articuloTienda = new ArticuloTiendaBean(articulo, tienda.getCodAlm());
					
					// Sincronizamos el artículo
					sincronizarArticulo(articuloTienda);
					
					// Obtenemos la lista de códigos de barras del artículos
					List<CodigoBarrasArticuloBean> codigosBarras = 
						CodigosBarrasArticulosDao.consultar(connCentral, configCentral, articulo.getCodArticulo());
					
					// Sincronizamos los códigos de barras
					for (CodigoBarrasArticuloBean codigoBarras : codigosBarras) {
						CodigoBarrasArticuloTiendaBean codigoBarrasTienda = 
								new CodigoBarrasArticuloTiendaBean(codigoBarras, tienda.getCodAlm());

						// Sincronizamos el código de barras
						sincronizarCodigoBarras(codigoBarrasTienda);
					}
				}
				
				// Establecemos el número de artículos sincronizados
				numArticulosSincronizados = articulos.size();
				
				// Actualizamos la versión de artículos de la tienda
				tienda.setVersionArticulos(versionArticulos.getVersion());
				tienda.setFechaVersionArticulos(versionArticulos.getFechaVersion());
				TiendasDao.update(connCentral, configCentral, tienda);
			}
		}
	}
	
	
	/**
	 * Realiza la sincronización de los datos del artículo entre la central y la tienda
	 * 
	 * @param articulo
	 * @throws SQLException
	 */
	protected void sincronizarArticulo(ArticuloTiendaBean articulo) throws SQLException {
		sincronizarArticuloCentral(articulo);
		sincronizarArticuloTienda(articulo);
	}
	
	
	/**
	 * Sincroniza los datos del artículo en la central
	 * 
	 * @param articulo
	 * @throws SQLException
	 */
	protected void sincronizarArticuloCentral(ArticuloTiendaBean articulo) throws SQLException {
		// Si la versión actual de la tienda es cero o el artículo tiene
		// una fecha de alta posterior a la fecha de versión de los artículos de la tienda
		// insertamos el artículo
		if (tienda.getVersionArticulos() == 0 || 
				(articulo.getFechaAlta() != null && tienda.getFechaVersionArticulos() != null
						&& articulo.getFechaAlta().after(tienda.getFechaVersionArticulos()))) {
			// Insertamos el artículo en la tabla de la central
			insertadoArticulo = insertarArticulo(connCentral, configCentral, articulo);
		}
		else {
			// Si no lo actualizamos
			insertadoArticulo = actualizarArticulo(connCentral, configCentral, articulo);
		}
	}
	
	
	/**
	 * Sincroniza los datos del artículo en la tienda
	 * 
	 * @param articulo
	 * @throws SQLException
	 */
	protected void sincronizarArticuloTienda(ArticuloTiendaBean articulo) throws SQLException {
		// Si el artículo lo hemos insertado en la central, lo insertamos en la tienda
		// si no lo actualizamos
		if (insertadoArticulo) {
			insertarArticulo(connTienda, configTienda, articulo);
		}
		else {
			actualizarArticulo(connTienda, configTienda, articulo);
		}
	}
	
	
	/**
	 * Inserta el artículo y si ya existe lo actualiza
	 * 
	 * @param conn
	 * @param config
	 * @param articulo
	 * @return true si el artículo se ha insertado, false si se ha actualizado
	 * @throws SQLException
	 */
	protected boolean insertarArticulo(Connection conn, ConfigEmpresaBean config, ArticuloTiendaBean articulo) throws SQLException {
		boolean insertado = false;
		
		try {
			// Insertamos el artículo
			ArticulosTiendaDao.insert(conn, config, articulo);
			insertado = true;
		}
		catch (KeyConstraintViolationException e) {
			// Si ya existe lo actualizamos
			ArticulosTiendaDao.update(conn, config, articulo);
		}
		
		return insertado;
	}
	
	
	/**
	 * Actualiza el artículo, y si no existe lo inserta
	 * 
	 * @param conn
	 * @param config
	 * @param articulo
	 * @return true si el artículo se ha insertado, false si se ha actualizado
	 * @throws SQLException
	 */
	protected boolean actualizarArticulo(Connection conn, ConfigEmpresaBean config, ArticuloTiendaBean articulo) throws SQLException {
		boolean insertado = false;
		
		if (ArticulosTiendaDao.update(conn, config, articulo) == 0) {
			ArticulosTiendaDao.insert(conn, config, articulo);
			insertado = true;
		}
		
		return insertado;
	}
	
	
	/**
	 * Realiza la sincronización de los datos del código de barras entre la central y la tienda
	 * 
	 * @param codigoBarras
	 * @throws SQLException
	 */
	protected void sincronizarCodigoBarras(CodigoBarrasArticuloTiendaBean codigoBarras) throws SQLException {
		sincronizarCodigoBarrasCentral(codigoBarras);
		sincronizarCodigoBarrasTienda(codigoBarras);
	}
	
	
	/**
	 * Sincroniza los datos del código de barras en la tabla de la central
	 * 
	 * @param codigoBarras
	 * @throws SQLException
	 */
	protected void sincronizarCodigoBarrasCentral(CodigoBarrasArticuloTiendaBean codigoBarras) throws SQLException {
		// Si el artículo lo hemos insertado intentamos primero insertar 
		// el código de barras, si no actualizamos
		if (insertadoArticulo) {
			insertadoCodigoBarras = insertarCodigoBarras(connCentral, configCentral, codigoBarras);
		}
		else {
			insertadoCodigoBarras = actualizarCodigoBarras(connCentral, configCentral, codigoBarras);
		}
	}
	
	
	/**
	 * Sincroniza los datos del código de barras en la tabla de la tienda
	 * 
	 * @param codigoBarras
	 * @throws SQLException
	 */
	protected void sincronizarCodigoBarrasTienda(CodigoBarrasArticuloTiendaBean codigoBarras) throws SQLException {
		// Si el código de barras se ha insertado en la central lo insertamos en la tienda, si no lo actualizamos
		if (insertadoCodigoBarras) {
			insertarCodigoBarras(connTienda, configTienda, codigoBarras);
		}
		else {
			 actualizarCodigoBarras(connTienda, configTienda, codigoBarras);
		}
	}
	
	
	/**
	 * Inserta el código de barras y si ya existe lo actualiza
	 * 
	 * @param conn
	 * @param config
	 * @param codigoBarras
	 * @return true si el código de barras se ha insertado, false si se ha actualizado
	 * @throws SQLException
	 */
	protected boolean insertarCodigoBarras(Connection conn, ConfigEmpresaBean config, 
			CodigoBarrasArticuloTiendaBean codigoBarras) throws SQLException {
		boolean insertado = false;
		
		try {
			CodigosBarrasArticulosTiendaDao.insert(conn, config, codigoBarras);
			insertado = true;
		} 
		catch (KeyConstraintViolationException e) {
			CodigosBarrasArticulosTiendaDao.update(conn, config, codigoBarras);
		}
		
		return insertado;
	}
	
	
	/**
	 * Actualiza el código de barras, y si no existe lo inserta
	 * 
	 * @param conn
	 * @param config
	 * @param codigoBarras
	 * @return true si el código de barras se ha insertado, false si se ha actualizado
	 * @throws SQLException
	 */
	protected boolean actualizarCodigoBarras(Connection conn, ConfigEmpresaBean config, 
			CodigoBarrasArticuloTiendaBean codigoBarras) throws SQLException {
		boolean insertado = false;
		
		if (CodigosBarrasArticulosTiendaDao.update(conn, config, codigoBarras) == 0) {
			CodigosBarrasArticulosTiendaDao.insert(conn, config, codigoBarras);
			insertado = true;
		}
		
		return insertado;
	}
	
	
	/**
	 * Realiza la sincronización de tarifas y promociones con la tienda
	 * 
	 * @throws SQLException
	 */
	protected void sincronizarTarifas() throws SQLException {
		// Obtenemos las tarifas de la tienda
		List<TarifaTiendaBean> tarifasTienda = TarifasTiendasDao.consultar(connCentral, configCentral, tienda.getCodAlm());
		
		// Para cada tarifa de la tienda
		for (TarifaTiendaBean tarifaTienda : tarifasTienda) {
			// Obtenemos los datos de la tarifa
			TarifaBean tarifa = TarifasDao.consultar(connCentral, configCentral, tarifaTienda.getCodTarifa());

			// Comparamos la versión de la tarifa con la que tiene la tienda
			if (tarifa.getVersion() > tarifaTienda.getVersionTarifa()) {
				// Obtenemos los artículos borrados de la tarifa desde la última versión que tiene la tienda
				// Y los borramos de la tarifa
				List<String> borrados = ArticulosTarifaDao.consultarArticulosTarifaBorradosSincronizacion(connCentral, 
						configCentral, tarifa.getCodTar(), tarifaTienda.getVersionTarifa(), tarifa.getVersion());
				for (String codArticulo : borrados) {
					ArticuloTarifaBean articulo = new ArticuloTarifaBean();
					articulo.setCodTar(tarifa.getCodTar());
					articulo.setCodArt(codArticulo);
					ArticuloTarifaTiendaBean articuloTarifa = new ArticuloTarifaTiendaBean(articulo, tienda.getCodAlm());
					
					borrarArticuloTarifa(articuloTarifa);
				}
				
				// Obtenemos los artículos a sincronizar
				List<ArticuloTarifaBean> articulos = ArticulosTarifaDao.consultarArticulosTarifaSincronizacion(connCentral, 
						configCentral, tarifa.getCodTar(), tarifaTienda.getVersionTarifa(), tarifa.getVersion());
				
				for (ArticuloTarifaBean articulo : articulos) {
					// Obtenemos el artículo de tarifa para el almacén
					ArticuloTarifaTiendaBean articuloTienda = new ArticuloTarifaTiendaBean(articulo, tienda.getCodAlm());
					
					// Sincronizamos el artículo
					sincronizarArticuloTarifa(articuloTienda, tarifaTienda);
				}
				
				// Actualizamos los artículos de tarifas sincronizados con la tienda sumando
				// los artículos borrados y los actualizados de esta tarifa
				numArticulosTarifasSincronizados += borrados.size() + articulos.size();
				
				
				// Obtenemos las Promociones de la tarifa a sincronizar
				List<PromocionBean> promociones = PromocionesDao.consultarPromocionesSincronizacion(connCentral, 
						configCentral, tarifa.getCodTar(), tarifaTienda.getVersionTarifa(), tarifa.getVersion());
				for(PromocionBean promocion : promociones) {
					// Obtenemos los artículos de la promoción
					List<ArticuloPromocionBean> articulosPromocion = ArticulosPromocionesDao.consultarArticulosPromocionSincronizacion(
							connCentral, configCentral, promocion.getIdPromocion(), tarifaTienda.getVersionTarifa(), tarifa.getVersion());
					
					for (ArticuloPromocionBean articuloPromocion : articulosPromocion) {
						// Obtenemos el artículo de promocion para la tienda
						ArticuloPromocionTiendaBean articuloPromocionTienda = 
							new ArticuloPromocionTiendaBean(promocion, articuloPromocion, tienda.getCodAlm());
						
						// Sincronizamos el artículo en promocion
						sincronizarArticuloPromocion(articuloPromocionTienda);
					}
					
					// Actualizamos los artículos en promoción sincronizados con la tienda
					numArticulosPromocionesSincronizados += articulosPromocion.size();
				}
				
				
				// Actualizamos la versión de la tarifa de la tienda
				tarifaTienda.setVersionTarifa(tarifa.getVersion());
				tarifaTienda.setFechaVersionTarifa(tarifa.getFechaVersion());
				TarifasTiendasDao.update(connCentral, configCentral, tarifaTienda);
			}
		}
	}
	
	
	/**
	 * Elimina el artículo de tarifa para que no se sincronice
	 * 
	 * @param articulo
	 * @throws SQLException
	 */
	protected void borrarArticuloTarifa(ArticuloTarifaTiendaBean articulo) throws SQLException {
		borrarArticuloTarifaCentral(articulo);
		borrarArticuloTarifaTienda(articulo);
	}
	
	
	/**
	 * Elimina el artículo de tarifa de la central
	 * 
	 * @param articulo
	 * @throws SQLException
	 */
	protected void borrarArticuloTarifaCentral(ArticuloTarifaTiendaBean articulo) throws SQLException {
		ArticulosTarifaTiendaDao.delete(connCentral, configCentral, articulo);
	}
	
	
	/**
	 * Elimina el artículo de tarifa de la tienda
	 * 
	 * @param articulo
	 * @throws SQLException
	 */
	protected void borrarArticuloTarifaTienda(ArticuloTarifaTiendaBean articulo) throws SQLException {
		ArticulosTarifaTiendaDao.delete(connTienda, configTienda, articulo);
	}
	
	
	/**
	 * Realiza la sincronización de la tarifa del artículo entre la central y la tienda
	 * 
	 * @param articulo
	 * @throws SQLException
	 */
	protected void sincronizarArticuloTarifa(ArticuloTarifaTiendaBean articulo, TarifaTiendaBean tarifa) throws SQLException {
		sincronizarArticuloTarifaCentral(articulo, tarifa);
		sincronizarArticuloTarifaTienda(articulo, tarifa);
	}
	
	
	/**
	 * Sincroniza los datos la tarifa del artículo en la central
	 * 
	 * @param articulo
	 * @throws SQLException
	 */
	protected void sincronizarArticuloTarifaCentral(ArticuloTarifaTiendaBean articulo, TarifaTiendaBean tarifa) throws SQLException {
		// Si la tienda no tiene ninguna tarifa insertamos el artículo
		if (tarifa.getVersionTarifa() == 0) {
			insertadoArticulo = insertarArticuloTarifa(connCentral, configCentral, articulo);
		}
		else {
			// Si no lo actualizamos
			insertadoArticulo = actualizarArticuloTarifa(connCentral, configCentral, articulo);
		}
	}


	/**
	 * Sincroniza los datos la tarifa del artículo en la tienda
	 * 
	 * @param articulo
	 * @throws SQLException
	 */
	protected void sincronizarArticuloTarifaTienda(ArticuloTarifaTiendaBean articulo, 
			TarifaTiendaBean tarifa) throws SQLException {
		// Si el artículo lo hemos insertado en la central, lo insertamos en la tienda
		// si no lo actualizamos
		if (insertadoArticulo) {
			insertarArticuloTarifa(connTienda, configTienda, articulo);
		}
		else {
			actualizarArticuloTarifa(connTienda, configTienda, articulo);
		}
	}
	
	
	/**
	 * Inserta el artículo en la tarifa y si ya existe lo actualiza
	 * 
	 * @param conn
	 * @param config
	 * @param articulo
	 * @return
	 * @throws SQLException
	 */
	protected boolean insertarArticuloTarifa(Connection conn, ConfigEmpresaBean config, 
			ArticuloTarifaTiendaBean articulo) throws SQLException {
		boolean insertado = false;
		
		try {
			// Insertamos el artículo
			ArticulosTarifaTiendaDao.insert(conn, config, articulo);
			insertado = true;
		}
		catch (KeyConstraintViolationException e) {
			// Si ya existe lo actualizamos
			ArticulosTarifaTiendaDao.update(conn, config, articulo);
		}
		
		return insertado;
	}
	
	
	/**
	 * Actualiza el artículo en la tarifa, y si no existe lo inserta
	 * 
	 * @param conn
	 * @param config
	 * @param articulo
	 * @return
	 * @throws SQLException
	 */
	protected boolean actualizarArticuloTarifa(Connection conn, ConfigEmpresaBean config, 
			ArticuloTarifaTiendaBean articulo) throws SQLException {
		boolean insertado = false;
		
		if (ArticulosTarifaTiendaDao.update(conn, config, articulo) == 0) {
			ArticulosTarifaTiendaDao.insert(conn, config, articulo);
			insertado = true;
		}
		
		return insertado;
	}
	
	
	/**
	 * Realiza la sincronización del artículo en promoción entre la central y la tienda
	 * 
	 * @param articulo
	 * @throws SQLException
	 */
	protected void sincronizarArticuloPromocion(ArticuloPromocionTiendaBean articulo) throws SQLException {
		sincronizarArticuloPromocionCentral(articulo);
		sincronizarArticuloPromocionTienda(articulo);
	}
	
	
	/**
	 * Sincroniza el artículo en promoción en la central
	 * 
	 * @param articulo
	 * @throws SQLException
	 */
	protected void sincronizarArticuloPromocionCentral(ArticuloPromocionTiendaBean articulo) throws SQLException {
		insertadoArticulo = insertarArticuloPromocion(connCentral, configCentral, articulo);
	}


	/**
	 * Sincroniza el artículo en promoción en la tienda
	 * 
	 * @param articulo
	 * @throws SQLException
	 */
	protected void sincronizarArticuloPromocionTienda(ArticuloPromocionTiendaBean articulo) throws SQLException {
		// Si el artículo lo hemos insertado en la central, lo insertamos en la tienda
		// si no lo actualizamos
		if (insertadoArticulo) {
			insertarArticuloPromocion(connTienda, configTienda, articulo);
		}
		else {
			actualizarArticuloPromocion(connTienda, configTienda, articulo);
		}
	}
	
	
	/**
	 * Inserta el artículo en promoción y si ya existe lo actualiza
	 * 
	 * @param conn
	 * @param config
	 * @param articulo
	 * @return
	 * @throws SQLException
	 */
	protected boolean insertarArticuloPromocion(Connection conn, ConfigEmpresaBean config, 
			ArticuloPromocionTiendaBean articulo) throws SQLException {
		boolean insertado = false;
		
		try {
			// Insertamos el artículo
			ArticulosPromocionTiendaDao.insert(conn, config, articulo);
			insertado = true;
		}
		catch (KeyConstraintViolationException e) {
			// Si ya existe lo actualizamos
			ArticulosPromocionTiendaDao.update(conn, config, articulo);
		}
		
		return insertado;
	}
	
	
	/**
	 * Actualiza el artículo en promoción, y si no existe lo inserta
	 * 
	 * @param conn
	 * @param config
	 * @param articulo
	 * @return
	 * @throws SQLException
	 */
	protected boolean actualizarArticuloPromocion(Connection conn, ConfigEmpresaBean config, 
			ArticuloPromocionTiendaBean articulo) throws SQLException {
		boolean insertado = false;
		
		if (ArticulosPromocionTiendaDao.update(conn, config, articulo) == 0) {
			ArticulosPromocionTiendaDao.insert(conn, config, articulo);
			insertado = true;
		}
		
		return insertado;
	}
	
	
	public String getResumenEnvioArticulos() {
		String resumen = null;
		
		if (numArticulosSincronizados == 0 
				&& numArticulosTarifasSincronizados == 0 
				&& numArticulosPromocionesSincronizados == 0) {
			resumen = "No se ha enviado ningún cambio de artículos a la tienda";
		}
		else {
			resumen = "Envío de artículos realizado correctamente. ";
			if (numArticulosSincronizados > 0) {
				resumen += "\nSe han actualizado " + numArticulosSincronizados
						+ " artículos. ";
			}
			if (numArticulosTarifasSincronizados > 0) {
				resumen += "\nSe han actualizado "
						+ numArticulosTarifasSincronizados
						+ " precios de artículos en tarifas. ";
			}
			if (numArticulosPromocionesSincronizados > 0) {
				resumen += "\nSe han actualizado "
						+ numArticulosPromocionesSincronizados
						+ " artículos de promociones.";
			}
		}
		
		return resumen;
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#getNumArticulosSincronizados()
	 */
	@Override
	public int getNumArticulosEnviados() {
		return numArticulosSincronizados;
	}


	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#recibirTickets()
	 */
	@Override
	public void recibirTickets() throws TrabajoSincronizadorException {
		try {
			connTienda.iniciaTransaccion();
			connCentral.iniciaTransaccion();
			
			sincronizarTickets();
			
			connCentral.commit();
			connTienda.commit();
			connCentral.finalizaTransaccion();
			connTienda.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("recibirTickets() - Desahaciendo transacción en la tienda");
			connTienda.deshacerTransaccion();
			
			log.debug("recibirTickets() - Desahaciendo transacción en la central");
			connCentral.deshacerTransaccion();
			
			log.error("recibirTickets() - Error al recibir tickets de la tienda " + tienda.getCodAlm() + ": " + e.getMessage());
			throw new TrabajoSincronizadorException(e.getMessage(), e);
		}
	}
	
	
	protected void sincronizarTickets() throws SQLException {
		// Obtenemos la lista de tickets pendientes de la tienda
		List<TicketTiendaBean> tickets = TicketsTiendaDao.consultarPendientesTienda(connTienda, configTienda, tienda.getCodAlm());
		
		int contador = 0;
		for (TicketTiendaBean ticket : tickets) {
			// Insertamos el tickets en la tabla de tickets pendientes de procesar
			try {
				TicketsDao.insert(connCentral, configCentral, ticket);
				numTicketsRecibidos++;
				contador++;
			} 
			catch (KeyConstraintViolationException e) {
				// Si el ticket ya existe continuamos
			}
			
			// Marcamos el ticket de la tienda como enviado
			ticket.setEnviado(true);
			ticket.setFechaEnvio(new Date());
			TicketsTiendaDao.update(connTienda, configTienda, ticket);
			
			// Hacemos commit cada 50 tickets para no tener una transacción demasiado grande
			if (contador == 50) {
				connCentral.commit();
				connTienda.commit();
				contador = 0;
			}
		}
	}


	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#getNumTicketsRecibidos()
	 */
	@Override
	public int getNumTicketsRecibidos() {
		return numTicketsRecibidos;
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#finalizar()
	 */
	@Override
	public void finalizar() {
		// Cerramos las conexiones con la tienda y la central
		connTienda.cerrarConexion();
		connCentral.cerrarConexion();
	}
}
