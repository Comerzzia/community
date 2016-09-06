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

package com.comerzzia.portlets.tiendavirtual.iu;

import java.util.List;

import com.comerzzia.persistencia.general.categorizaciones.CategorizacionBean;
import com.comerzzia.persistencia.tiendavirtual.articulos.ArticuloTiendaVirtualBean;
import com.comerzzia.persistencia.tiendavirtual.articulos.ParametrosBuscarArticulosTVBean;

public class FormularioTienda {

	private static final byte VISTA_ESCAPARATE 	= 0;
	private static final byte VISTA_LISTADO 	= 1;
	private static final byte VISTA_ARTICULO 	= 2;
	
	/** Listado de categorías primarias del menú */
	private List<CategorizacionBean> categoriasPrimarias;
	
	/** Listado de categorías secundarias del menú (las de la categoría primaria seleccionada) */
	private List<CategorizacionBean> categoriasSecundarias;
	
	/** Parámetros de búsqueda de artículos. */
	private ParametrosBuscarArticulosTVBean paramBuscar;
	
	/** Categoría primaria seleccionada */
	private String categoriaPrimaria;
	
	/** Categoría secundaria seleccionada */
	private String categoriaSecundaria;
	
	/** Listado de artículos del escaparate. */
	private List<ArticuloTiendaVirtualBean> escaparate;
	
	/** Cantidad de artículos que hay en la cesta. */
	private Integer cantidadArticulosCesta = 0;
	
	/** Importe total de todos los artículos de la cesta. */
	private Double importeTotalCesta = 0D;
	
	/** Título del desglose1 configurado. */
	private String tituloDesglose1;
	
	/** Título del desglose2 configurado. */
	private String tituloDesglose2;
	
	/** Descripción del nombre de usuario logado */
	private String desUsuario;
	
	/** Descripción del cliente logado */
	private String desCliente;
	
	/** Vista activa en el formulario */
	private byte vista; 

	public List<CategorizacionBean> getCategoriasPrimarias() {
		return categoriasPrimarias;
	}

	public List<CategorizacionBean> getCategoriasSecundarias() {
		return categoriasSecundarias;
	}

	public void setCategoriasPrimarias(
			List<CategorizacionBean> categoriasPrimarias) {
		this.categoriasPrimarias = categoriasPrimarias;
	}

	public ParametrosBuscarArticulosTVBean getParamBuscar() {
		return paramBuscar;
	}

	public void setParamBuscar(ParametrosBuscarArticulosTVBean paramBuscar) {
		this.paramBuscar = paramBuscar;
	}

	public String getCategoriaPrimaria() {
		return categoriaPrimaria;
	}

	public String getCategoriaSecundaria() {
		return categoriaSecundaria;
	}

	public void seleccionarCategoriaPrimaria(String categoriaPrimaria,
			List<CategorizacionBean> secundarias) {
		deseleccionarCategoriaPrimaria();
		this.categoriaPrimaria = categoriaPrimaria;
		this.categoriasSecundarias = secundarias;
		deseleccionarCategoriaSecundaria();
		desactivarFiltro();
	}

	public void seleccionarCategoriaSecundaria(String categoriaSecundaria) {
		deseleccionarCategoriaSecundaria();
		this.categoriaSecundaria = categoriaSecundaria;
		getParamBuscar().setCodCategoria(categoriaSecundaria);
		desactivarFiltro();
		getParamBuscar().setNumPagina(1);
		setEscaparate(null);
	}

	public void deseleccionarCategoriaPrimaria() {
		this.categoriaPrimaria = null;
		this.categoriasSecundarias = null;
		deseleccionarCategoriaSecundaria();
	}

	public void deseleccionarCategoriaSecundaria() {
		this.categoriaSecundaria = null;
		getParamBuscar().setCodCategoria("");
	}

	public void aplicarFiltro(String filtro) {
		getParamBuscar().setFiltro(filtro);
		getParamBuscar().setNumPagina(1);
		deseleccionarCategoriaSecundaria();
		setEscaparate(null);
	}

	public void desactivarFiltro() {
		getParamBuscar().setFiltro("");
	}

	public List<ArticuloTiendaVirtualBean> getEscaparate() {
		return escaparate;
	}

	public void setEscaparate(List<ArticuloTiendaVirtualBean> escaparate) {
		this.escaparate = escaparate;
		setVistaEscaparate();
	}

	public String getTituloDesglose1() {
		return tituloDesglose1;
	}

	public void setTituloDesglose1(String tituloDesglose1) {
		this.tituloDesglose1 = tituloDesglose1;
	}
	
	public boolean isTituloDesglose1Activo(){
		return this.tituloDesglose1 != null && !this.tituloDesglose1.isEmpty();
	}

	public String getTituloDesglose2() {
		return tituloDesglose2;
	}

	public void setTituloDesglose2(String tituloDesglose2) {
		this.tituloDesglose2 = tituloDesglose2;
	}

	public boolean isTituloDesglose2Activo(){
		return this.tituloDesglose2 != null && !this.tituloDesglose2.isEmpty();
	}
	
	public boolean isUsuarioLogado(){
		return desUsuario != null;
	}
	
	public String getDesUsuarioCliente(){
		if (isUsuarioLogado()){
			return this.desUsuario + " - " + this.desCliente;
		}
		return "";
	}

	public void setLogin(String desUsuario, String desCliente) {
		this.desUsuario = desUsuario;
		this.desCliente = desCliente;
	}

	public void setLogout() {
		this.desUsuario = null;
		this.desCliente = null;
	}

	public Integer getCantidadArticulosCesta() {
		return cantidadArticulosCesta;
	}

	public void setDatosCesta(Integer cantidadArticulosCesta, Double importeTotalCesta) {
		this.cantidadArticulosCesta = cantidadArticulosCesta;
		this.importeTotalCesta = importeTotalCesta;
	}

	public void borrarDatosCesta() {
		this.cantidadArticulosCesta = 0;
		this.importeTotalCesta = 0D;
	}

	public Double getImporteTotalCesta() {
		return importeTotalCesta;
	}
	
	public void setVistaEscaparate(){
		vista = VISTA_ESCAPARATE;
	}
	public void setVistaListado(){
		vista = VISTA_LISTADO;
	}
	public void setVistaArticulo(){
		vista = VISTA_ARTICULO;
	}
	public boolean isVistaEscaparate(){
		return vista == VISTA_ESCAPARATE;
	}
	public boolean isVistaListado(){
		return vista == VISTA_LISTADO;
	}
	public boolean isVistaArticulo(){
		return vista == VISTA_ARTICULO;
	}

}
