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

package com.comerzzia.servicios.tiendavirtual.cesta;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.tiendavirtual.articulos.ArticuloTiendaVirtualBean;
import com.comerzzia.persistencia.ventas.tiposportes.TipoPorteBean;
import com.comerzzia.servicios.tiendavirtual.articulos.ArticuloTarifaTiendaVirtualNotFoundException;
import com.comerzzia.servicios.tiendavirtual.articulos.ArticuloTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.articulos.ArticuloTiendaVirtualNotFoundException;
import com.comerzzia.servicios.tiendavirtual.articulos.ServicioArticulosTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.servicios.ventas.tiposportes.ServicioTiposPortes;
import com.comerzzia.servicios.ventas.tiposportes.TipoPorteException;
import com.comerzzia.servicios.ventas.tiposportes.TipoPorteNotFoundException;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;

public class CestaBean {

	protected static Logger log = Logger.getMLogger(CestaBean.class);	

	protected Map<String, ArticuloCestaBean> articulos;
	protected Long idTipoPortes;
	protected ArticuloTiendaVirtualBean articuloPorte;

	public CestaBean() {
		articulos = new HashMap<String, ArticuloCestaBean>();
	}
	
	public void vaciarCesta(){
		articulos = new HashMap<String, ArticuloCestaBean>();
	}

	public List<ArticuloCestaBean> getListaArticulos() {
		return new ArrayList<ArticuloCestaBean>(articulos.values());
	}

	public void añadirArticulo(ArticuloTiendaVirtualBean articulo, Integer cantidad) {
		ArticuloCestaBean articuloCesta = this.articulos.get(articulo.getCodArticulo());
		if (articuloCesta == null) {
			articuloCesta = new ArticuloCestaBean();
			articuloCesta.setArticulo(articulo);
			articuloCesta.setCantidad(cantidad);
			this.articulos.put(articulo.getCodArticulo(), articuloCesta);
		} 
		else {
			articuloCesta.sumaCantidad(cantidad);
		}
	}

	public void añadirArticulo(DatosSesionTiendaVirtualBean datosSesion, ClienteBean cliente, String codArticulo, Integer cantidad)
			throws CestaArticulosException {
		try{
			ArticuloTiendaVirtualBean articulo = ServicioArticulosTiendaVirtual.consultar(codArticulo, cliente, datosSesion);
			añadirArticulo(articulo, cantidad);
		}
		catch (ArticuloTiendaVirtualNotFoundException e) {
			String msg = "No se ha encontrado el artículo que se intenta añadir a la cesta: " + e.getMessage();
			log.error("añadirArticulo() - " + msg);
			throw new CestaArticulosException(msg, e);
		} 
		catch (ArticuloTiendaVirtualException e) {
			String msg = "Ha ocurrido un error consultando el artículo que se intenta añadir a la cesta: " + e.getMessage();
			log.error("añadirArticulo() - " + msg);
			throw new CestaArticulosException(msg, e);
		} 
		catch (ArticuloTarifaTiendaVirtualNotFoundException e) {
			String msg = "No se ha encontrado tarifa para el artículo que se intenta añadir a la cesta: " + e.getMessage();
			log.error("añadirArticulo() - " + msg);
			throw new CestaArticulosException(msg, e);
		} 
	}

	public void modificarArticulo(String codArticulo, Integer cantidad) {
		ArticuloCestaBean articuloCesta = this.articulos.get(codArticulo);
		if (articuloCesta != null) {
			articuloCesta.setCantidad(cantidad);
		} 
	}

	public void eliminarArticulo(String codArticulo) {
		this.articulos.remove(codArticulo);
	}

	private Double getImporte() {
		Double importe = 0D;
		Iterator<String> it = articulos.keySet().iterator();
		while (it.hasNext()) {
			ArticuloCestaBean articuloCesta = articulos.get(it.next());
			importe += articuloCesta.getImporte();
		}
		return importe;
	}

	public Double getImporteRedondeado() {
		Double importe = getImporte();
		return Numero.redondea(importe, 2);
	}

	public boolean isVacia() {
		return this.articulos.isEmpty();
	}
	
	public Integer getCantidadArticulos(){
		return articulos.size();
	}
	
	public void calcularPortes(DatosSesionTiendaVirtualBean datosSesion, ClienteBean cliente) throws CestaPortesException{
		try{
			TipoPorteBean tipoPortes = ServicioTiposPortes.consultar(getImporteRedondeado(), datosSesion.getDatosSesionEmpresa());
			idTipoPortes = tipoPortes.getIdTipoPorte();
			if (tipoPortes.getCodArtPorte() != null){
				articuloPorte = ServicioArticulosTiendaVirtual.consultar(tipoPortes.getCodArtPorte(), cliente, datosSesion);
			}
		}
		catch(TipoPorteNotFoundException ignore){
			// si no se encuentra tipo de porte para el volumen de venta, no habrá cargo por portes
		} 
		catch (ArticuloTiendaVirtualNotFoundException e) {
			String msg = "No se ha encontrado el artículo del tipo de porte: " + e.getMessage();
			log.error("calcularPortes() - " + msg);
			throw new CestaPortesException(msg, e);
		} 
		catch (ArticuloTiendaVirtualException e) {
			String msg = "Ha ocurrido un error consultando el artículo del tipo de porte: " + e.getMessage();
			log.error("calcularPortes() - " + msg);
			throw new CestaPortesException(msg, e);
		} 
		catch (ArticuloTarifaTiendaVirtualNotFoundException e) {
			String msg = "No se ha encontrado tarifa para el artículo del tipo de porte: " + e.getMessage();
			log.error("calcularPortes() - " + msg);
			throw new CestaPortesException(msg, e);
		} 
		catch (TipoPorteException e) {
			String msg = "Ha ocurrido un error consultando el tipo de porte: " + e.getMessage();
			log.error("calcularPortes() - " + msg);
			throw new CestaPortesException(msg, e);
		}
	}
	
	public String getDescripcionPorte(){
		if (articuloPorte != null){
			return articuloPorte.getDesArticulo();
		}
		return "PORTES GRATUITOS";
	}
	
	public Double getImportePorte(){
		if (articuloPorte != null){
			return articuloPorte.getPrecioVentaConImpuestos();
		}
		return 0D;
	}
	
	public Double getImporteTotalRedondeado(){
		Double importe = getImporte() + getImportePorte();
		return Numero.redondea(importe, 2);
	}
	
	public ArticuloTiendaVirtualBean getArticuloPortes(){
		return articuloPorte;
	}
	
	public boolean isPortesGratuitos(){
		return articuloPorte == null;
	}
	
	public Long getIdTipoPortes(){
		return this.idTipoPortes;
	}
	
}
