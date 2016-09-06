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

package com.comerzzia.servicios.general.tiendas;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.comerzzia.persistencia.core.tipostiendas.TipoTiendaBean;
import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.tiendas.TiendaBean;
import com.comerzzia.persistencia.general.tiendas.cajas.CajaBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.tipostiendas.ServicioTiposTiendas;
import com.comerzzia.servicios.sincronizacion.SincronizadorTiendasException;
import com.comerzzia.servicios.sincronizacion.sincronizadores.ConfigSincronizacionFactory;
import com.comerzzia.servicios.sincronizacion.sincronizadores.IConfigSincronizacion;
import com.comerzzia.servicios.ventas.tarifas.ServicioTarifas;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.xml.XMLDocument;
import com.comerzzia.util.xml.XMLDocumentException;
import com.comerzzia.util.xml.XMLDocumentUtils;

public class Tienda extends MantenimientoBean {

	/**
	 * Serial Version UID.
	 */
	private static final long serialVersionUID = 6764534876034876345L;
	
	public static final Long TIPO_TIENDA_TIENDA_VIRTUAL = 4L;
	public static final String UID_TPV_TIENDA_VIRTUAL = "TIENDA_VIRTUAL";
	public static final String CODIGO_CAJA_TIENDA_VIRTUAL = "TV";
	
	private TiendaBean tienda;
	private ClienteBean cliente;
	private boolean clienteCargado = false;
	
	private boolean tarifaGeneralCargada = false;
	
	private Map<String, TarifaTiendaBean> tarifasSeleccionadas = new HashMap<String, TarifaTiendaBean>();
	private Map<String, AlmacenUsuarioBean> usuariosSeleccionados = new HashMap<String, AlmacenUsuarioBean>();
	
	private List<UsuarioBean> usuariosNuevos = new ArrayList<UsuarioBean>(); 
	
	private IConfigSincronizacion configurador;
	private boolean configuracionCargada;
	
	public Tienda() {
		this.tienda = new TiendaBean();
	}

	public Tienda(TiendaBean tienda) {
		this.tienda = tienda;
	}

	protected void initNuevoBean() {
	}

	public TiendaBean getBean() {
		return tienda;
	}
	
	public void cargarConfiguracion() throws TiendaException {
		try {
			configurador = ConfigSincronizacionFactory.crear(tienda.getClaseConfiguracion());		
			if(tienda.getDocumentConfiguracion() != null)
					configurador.setXmlConfiguracion(tienda.getDocumentConfiguracion());
			
		} 
		catch (SincronizadorTiendasException e) {
			throw new TiendaException("Error instanciando la clase de configuracion de la tienda.", e);
		}
		catch (XMLDocumentException ignore) {;}
	}
	
	public Map<String, String> getParametros() {
		Map<String, String> parametros = new HashMap<String, String>();
		for (String key : getListaParametros()) {
			parametros.put(key, configurador.getValor(key));
		}
		return parametros;
	}
	
	public void setParametros(HttpServletRequest request) throws TiendaException {
		try {
			for (String parametro : configurador.getListaParametros()){
				configurador.setValor(parametro, request.getParameter(parametro));
			}
			tienda.setConfiguracion(configurador.getXmlConfiguracion());
		} 
		catch (XMLDocumentException e) {
			throw new TiendaException("Error añadiendo parametros de configuracion", e);
		}
	}
	
	public List<String> getListaParametros() {		
		return configurador.getListaParametros();
	}
	
	public void setXmlConfiguracion(String xmlConfiguracion) throws TiendaException {
		try {
			tienda.setConfiguracion(xmlConfiguracion);
			configurador.setXmlConfiguracion(tienda.getDocumentConfiguracion());
		} 
		catch (XMLDocumentException e) {
			throw new TiendaException("Error de formato del xml de configuración.", e);
		}
	}
	
	public String getXmlConfiguracion() throws TiendaException {
		try {
			if(tienda.getDocumentConfiguracion() != null)
				return XMLDocumentUtils.DocumentToString(tienda.getDocumentConfiguracion());
			else
				return XMLDocumentUtils.DocumentToString(configurador.getXmlConfiguracion());
		} 
		catch (XMLDocumentException e) {
			throw new TiendaException(e.getMessage());
		}
	}
	
	public void inicializarCliente(DatosSesionBean datosSesion) throws TiendaException{
		cliente = new ClienteBean();
		cliente.setEstadoBean(Estado.NUEVO);
		cliente.setCodCli(tienda.getCodAlm());
		cliente.setDesCli(tienda.getDesAlm());
		cliente.setNombreComercial(tienda.getDesAlm());
		cliente.setCif(tienda.getCodAlm());
		cliente.setDomicilio(tienda.getDomicilio());
		cliente.setPoblacion(tienda.getPoblacion());
		cliente.setProvincia(tienda.getProvincia());
		cliente.setCp(tienda.getCp());
		cliente.setTelefono1(tienda.getTelefono1());
		cliente.setTelefono2(tienda.getTelefono2());
		cliente.setFax(tienda.getFax());
		
		try {
			TarifaBean tarifa = ServicioTarifas.consultarTarifaGeneral(datosSesion);
			cliente.setIdTratImp(tarifa.getIdTratImpuestos());
			cliente.setDesTratImp(tarifa.getDesTratImpuestos());
		} 
		catch (Exception e) {
			throw new TiendaException("Error al inicializar cliente ", e);
		}
		
		clienteCargado = true;
		setCodCliente(null);
		setDesCliente(null);
	}
	public void asignarCliente(String codCliente, String desCliente) {
		setCodCliente(codCliente);
		setDesCliente(desCliente);
		cliente = null;
	}
	
	public void inicializarTarifaGeneral(){
		TarifaTiendaBean tarifa = new TarifaTiendaBean();
		tarifa.setEstadoBean(Estado.NUEVO);
		tarifa.setCodTarifa(TarifaTiendaBean.GENERAL);
		tarifa.setDesTarifa(TarifaTiendaBean.GENERAL);
		tarifa.setVersionTarifa(new Long(0));
		tarifa.setVersionTarifaRevisada(new Long(0));

		if (tienda.getTarifas() == null) {
			tienda.setTarifas(new ArrayList<TarifaTiendaBean>());
		}
		tienda.addTarifa(tarifa);
		
		tarifaGeneralCargada = true;
		
		tarifasSeleccionadas.put(tarifa.getCodTarifa(), tarifa);
	}

	public String getActivo() {
		return tienda.getActivo();
	}

	public int getEstadoBean() {
		return tienda.getEstadoBean();
	}

	public boolean isActivo() {
		return tienda.isActivo();
	}

	public boolean isEnEdicion() {
		return tienda.isEnEdicion();
	}

	public boolean isEstadoBorrado() {
		return tienda.isEstadoBorrado();
	}

	public boolean isEstadoNuevo() {
		return tienda.isEstadoNuevo();
	}

	public void setActivo(boolean activo) {
		tienda.setActivo(activo);
	}

	public void setActivo(String activo) {
		tienda.setActivo(activo);
	}

	public void setEnEdicion(boolean enEdicion) {
		tienda.setEnEdicion(enEdicion);
	}

	public void setEstadoBean(int estadoBean) {
		tienda.setEstadoBean(estadoBean);
	}

	public String getCodAlm() {
		return tienda.getCodAlm();
	}

	public void setCodAlm(String codAlm) {
		tienda.setCodAlm(codAlm);
	}

	public Long getIdTipoTienda() {
		return tienda.getIdTipoTienda();
	}
	
	public void setIdTipoTienda(Long idTipoTienda, DatosSesionBean datosSesion)
			throws TiendaException, TiendaNotFoundException {
		
		if(tienda.getIdTipoTienda() != idTipoTienda){
			TipoTiendaBean tiendaTipo = ServicioTiposTiendas.consultar(idTipoTienda, datosSesion);
			tienda.setIdTipoTienda(idTipoTienda);
			tienda.setDesTipoTienda(tiendaTipo.getDesTipoTienda());
			tienda.setClaseConfiguracion(tiendaTipo.getClaseConfiguracion());
			tienda.setClaseSincronizacion(tiendaTipo.getClaseSincronizacion());
			 
			configuracionCargada = false;
		}
	}

	public String getDesTipoTienda() {
		return tienda.getDesTipoTienda();
	}

	public Long getVersionArticulos() {
		return tienda.getVersionArticulos();
	}

	public void setVersionArticulos(Long versionArticulos) {
		tienda.setVersionArticulos(versionArticulos);
	}

	public Long getVersionArticulosRevisada() {
		return tienda.getVersionArticulosRevisada();
	}

	public void setVersionArticulosRevisada(Long versionArticulosRevisada) {
		tienda.setVersionArticulosRevisada(versionArticulosRevisada);
	}

	public String getDesAlm() {
		return tienda.getDesAlm();
	}

	public void setDesAlm(String desAlm) {
		tienda.setDesAlm(desAlm);
	}

	public String getDomicilio() {
		return tienda.getDomicilio();
	}

	public void setDomicilio(String domicilio) {
		tienda.setDomicilio(domicilio);
	}

	public String getPoblacion() {
		return tienda.getPoblacion();
	}

	public void setPoblacion(String poblacion) {
		tienda.setPoblacion(poblacion);
	}

	public String getProvincia() {
		return tienda.getProvincia();
	}

	public void setProvincia(String provincia) {
		tienda.setProvincia(provincia);
	}

	public String getCp() {
		return tienda.getCp();
	}

	public void setCp(String cp) {
		tienda.setCp(cp);
	}

	public String getTelefono1() {
		return tienda.getTelefono1();
	}

	public void setTelefono1(String telefono1) {
		tienda.setTelefono1(telefono1);
	}

	public String getTelefono2() {
		return tienda.getTelefono2();
	}

	public void setTelefono2(String telefono2) {
		tienda.setTelefono2(telefono2);
	}

	public String getFax() {
		return tienda.getFax();
	}

	public void setFax(String fax) {
		tienda.setFax(fax);
	}

	public String getPersonaContacto() {
		return tienda.getPersonaContacto();
	}

	public void setPersonaContacto(String personaContacto) {
		tienda.setPersonaContacto(personaContacto);
	}

	public String getCodEmp() {
		return tienda.getCodEmp();
	}

	public void setCodEmp(String codEmp) {
		tienda.setCodEmp(codEmp);
	}

	public String getCodCliente() {
		return tienda.getCodCliente();
	}

	public void setCodCliente(String codCliente) {
		tienda.setCodCliente(codCliente);
	}

	public String getDesCliente() {
		return tienda.getDesCliente();
	}

	public void setDesCliente(String desCliente) {
		tienda.setDesCliente(desCliente);
	}

	public Date getFechaVersionArticulos() {
		return tienda.getFechaVersionArticulos();
	}

	public void setFechaVersionArticulos(Date fechaVersionArticulos) {
		tienda.setFechaVersionArticulos(fechaVersionArticulos);
	}

	public Date getFechaVersionArticulosRevisada() {
		return tienda.getFechaVersionArticulosRevisada();
	}

	public void setFechaVersionArticulosRevisada(
			Date fechaVersionArticulosRevisada) {
		tienda.setFechaVersionArticulosRevisada(fechaVersionArticulosRevisada);
	}

	public String getNombre() {
		return tienda.getNombre();
	}

	public void setConfiguracion(Blob configuracion)
			throws SincronizadorTiendasException {
		tienda.setConfiguracion(configuracion);
	}

	public XMLDocument getConfiguracion() {
		return tienda.getConfiguracion();
	}

	public String getClaseConfiguracion() {
		return tienda.getClaseConfiguracion();
	}

	public String getClaseSincronizacion() {
		return tienda.getClaseSincronizacion();
	}

	// ******** CAJAS ******** //
	public boolean isCajasCargadas() {
		return tienda.isCajasCargadas();
	}

	public void setCajasCargadas(boolean cajasCargadas) {
		tienda.setCajasCargadas(cajasCargadas);
	}

	public List<CajaBean> getCajas() {
		return tienda.getCajas();
	}

	public void setCajas(List<CajaBean> cajas) {
		tienda.setCajas(cajas);
	}

	public int getNumCajas() {
		return tienda.getNumCajas();
	}

	public CajaBean getCaja(int indice) {
		return tienda.getCaja(indice);
	}

	public void addCaja(CajaBean caja) {
		tienda.addCaja(caja);
	}

	public void deleteCaja(int indice) {
		tienda.deleteCaja(indice);
	}

	// ******** TARIFAS ******** //
	public boolean isTarifasCargadas() {
		return tienda.isTarifasCargadas();
	}

	public boolean isExistenTarifas() {
		if(isTarifasCargadas()) {
			if (getTarifas().isEmpty()) {
				return false;
			}
			
			int tarifasBorradas = 0;
			for (TarifaTiendaBean tarifa : getTarifas()) {
				if(tarifa.isEstadoBorrado()) {
					tarifasBorradas++;
				}
			}
			
			if (tarifasBorradas == getTarifas().size()) {
				return false;
			}
		}
		
		return true;
	}
	
	public void setTarifasCargadas(boolean tarifasCargadas) {
		tienda.setTarifasCargadas(tarifasCargadas);
	}

	public List<TarifaTiendaBean> getTarifas() {
		return tienda.getTarifas();
	}

	public void setTarifas(List<TarifaTiendaBean> tarifas) {
		tienda.setTarifas(tarifas);
	}

	public int getNumTarifas() {
		return tienda.getNumTarifas();
	}

	public TarifaTiendaBean getTarifa(int indice) {
		return tienda.getTarifa(indice);
	}

	public void addTarifa(TarifaTiendaBean tarifa) {
		tienda.addTarifa(tarifa);
	}

	public void deleteTarifa(int indice) {
		tienda.deleteTarifa(indice);
	}

	public boolean isConfiguracionCargada() {
		return configuracionCargada;
	}
	
	
	
	public void addUsuario(AlmacenUsuarioBean usuario) {
		tienda.addUsuario(usuario);
	}

	public void setConfiguracionCargada(boolean configuracionCargada) {
		this.configuracionCargada = configuracionCargada;
	}

	public List<AlmacenUsuarioBean> getUsuarios() {
		return tienda.getUsuarios();
	}

	public boolean isUsuariosCargados() {
		return tienda.isUsuariosCargados();
	}
	
	public boolean isExistenUsuarios() {
		if (isUsuariosCargados()) {
			if (getUsuarios().isEmpty()) {
				return false;
			}
			
			int usuariosBorrados = 0;
			for (AlmacenUsuarioBean usuario : getUsuarios()) {
				if(usuario.isEstadoBorrado()) {
					usuariosBorrados++;
				}
			}
			
			if (usuariosBorrados == getUsuarios().size()) {
				return false;
			}
		}
		
		return true;
	}

	public void setUsuarios(List<AlmacenUsuarioBean> usuarios) {
		tienda.setUsuarios(usuarios);
	}

	public void setUsuariosCargados(boolean usuariosCargados) {
		tienda.setUsuariosCargados(usuariosCargados);
	}
	
	public boolean isTipoTiendaCargado() {
		return tienda.getIdTipoTienda() != null;
	}
	
	public ClienteBean getCliente() {
		return cliente;
	}

	public boolean isTarifaGeneralCargada() {
		return tarifaGeneralCargada;
	}
	
	public boolean isClienteCargado() {
		return clienteCargado;
	}
	
	public Map<String, TarifaTiendaBean> getTarifasSeleccionadas() {
		return tarifasSeleccionadas;
	}

	public void setTarifasSeleccionadas(
			Map<String, TarifaTiendaBean> tarifasSeleccionadas) {
		this.tarifasSeleccionadas = tarifasSeleccionadas;
	}
	
	public void addTarifaSeleccionada(TarifaTiendaBean tarifaSelecionada) {
		this.tarifasSeleccionadas.put(tarifaSelecionada.getCodTarifa(), tarifaSelecionada);
	}

	public Map<String, AlmacenUsuarioBean> getUsuariosSeleccionados() {
		return usuariosSeleccionados;
	}

	public void setUsuariosSeleccionados(
			Map<String, AlmacenUsuarioBean> usuariosSeleccionados) {
		this.usuariosSeleccionados = usuariosSeleccionados;
	}
	
	public void addUsuarioSeleccionado(AlmacenUsuarioBean usuarioSeleccionado) {
		this.usuariosSeleccionados.put(usuarioSeleccionado.getUsuario(), usuarioSeleccionado);
	}

	public List<UsuarioBean> getUsuariosNuevos() {
		return usuariosNuevos;
	}

	public void setUsuariosNuevos(List<UsuarioBean> usuariosNuevos) {
		this.usuariosNuevos = usuariosNuevos;
	}
	
	public void addUsuarioNuevo(UsuarioBean usuario){
		this.usuariosNuevos.add(usuario);
	}
	
	public void deleteUsuarioNuevo(int indice){
		this.usuariosNuevos.remove(indice);
	}

	public String getCodMedioPago() {
		return tienda.getCodMedioPago();
	}

	public String getDesMedioPago() {
		return tienda.getDesMedioPago();
	}

	public void setCodMedioPago(String codMedioPago) {
		tienda.setCodMedioPago(codMedioPago);
	}

	public void setDesMedioPago(String desMedioPago) {
		tienda.setDesMedioPago(desMedioPago);
	}

	public String getCodConceptoAlmacen() {
		return tienda.getCodConceptoAlmacen();
	}

	public String getDesConceptoAlmacen() {
		return tienda.getDesConceptoAlmacen();
	}

	public void setCodConceptoAlmacen(String codConceptoAlmacen) {
		tienda.setCodConceptoAlmacen(codConceptoAlmacen);
	}

	public void setDesConceptoAlmacen(String desConceptoAlmacen) {
		tienda.setDesConceptoAlmacen(desConceptoAlmacen);
	}
}
