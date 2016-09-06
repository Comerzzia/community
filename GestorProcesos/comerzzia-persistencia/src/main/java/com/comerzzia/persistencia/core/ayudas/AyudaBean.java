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

package com.comerzzia.persistencia.core.ayudas;

import java.io.IOException;
import java.io.InputStream;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.comerzzia.util.xml.XMLDocumentException;
import com.comerzzia.util.xml.XMLDocumentUtils;

public class AyudaBean {
	
	private String nombre;
	private String xml;
	
	private String origen;
	private String tipoOrigen;
	private String campoCodigo;
	private String campoDescripcion;
	private String filtro;
	private String campoFiltro;
	private boolean consultaAuto = false;
	private String tituloVentana;
	private String etiquetaCodigo;
	private String etiquetaDescripcion;
	private boolean campoCodigoVisible = true;
	
	
	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}
	
	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	/**
	 * @return the xml
	 */
	public String getXml() {
		return xml;
	}

	/**
	 * @param xml the xml to set
	 */
	public void setXml(InputStream xml) throws XMLDocumentException {
//		this.xml = xml;
		
		// Parseamos el XML
		try {
			Document document = XMLDocumentUtils.createDocumentBuilder().parse(xml);
			Element root = document.getDocumentElement();
			
			this.tituloVentana = XMLDocumentUtils.getTagValue(root, "titulo", true);
			Element origen = XMLDocumentUtils.getElement(root, "origen", false);
			this.origen = XMLDocumentUtils.getTagValue(root, "origen", false);
			this.tipoOrigen = XMLDocumentUtils.getAttribute(origen, "tipo", true);
			this.consultaAuto = ((XMLDocumentUtils.getTagValue(root, "consultaAuto", true)).equals("S")? true : false);
			this.campoFiltro = XMLDocumentUtils.getTagValue(root, "campoFiltro", true);
			this.filtro = XMLDocumentUtils.getTagValue(root, "filtro", true);
			
			Element campos = XMLDocumentUtils.getElement(root, "campos", false);
			NodeList listaCampos = campos.getChildNodes();
			for (int i=0; i<listaCampos.getLength(); i++){
				Node nodo = listaCampos.item(i);
				if (nodo instanceof Element) {					
					String id = XMLDocumentUtils.getAttribute((Element)nodo, "id", false);
					
					String tipo = XMLDocumentUtils.getAttribute((Element)nodo, "tipo", false);
					
					if (tipo.equals("codigo")) {
						this.etiquetaCodigo = XMLDocumentUtils.getTagValue((Element)nodo, "etiqueta", true);
						this.campoCodigo = id;
						setCampoCodigoVisible(XMLDocumentUtils.getTagValue((Element)nodo, "visible", true));
					}
					else if (tipo.equals("descripcion")) {
						this.etiquetaDescripcion = XMLDocumentUtils.getTagValue((Element)nodo, "etiqueta", true);
						this.campoDescripcion = id;
					}
				}
			}
		} 
		catch (SAXException e) {
			throw new XMLDocumentException("Error en operación de parseo del XML de ayuda.", e);
		} 
		catch (IOException e) {
			throw new XMLDocumentException("Error en operación de E/S del XML de ayuda.", e);
		} 
		catch (XMLDocumentException e) {
			throw new XMLDocumentException("Error en operación de parseo del XML de ayuda.", e);
		}
	}

	/**
	 * @return the origen
	 */
	public String getOrigen() {
		return origen;
	}
	
	/**
	 * @param tabla the origen to set
	 */
	public void setOrigen(String origen) {
		this.origen = origen;
	}
	
	/**
	 * @return the tipoOrigen
	 */
	public String getTipoOrigen() {
		return tipoOrigen;
	}
	
	/**
	 * @param tipoTabla the tipoOrigen to set
	 */
	public void setTipoOrigen(String tipoOrigen) {
		this.tipoOrigen = tipoOrigen;
	}
	
	/**
	 * @return the campoCodigo
	 */
	public String getCampoCodigo() {
		return campoCodigo;
	}
	
	/**
	 * @param campoCodigo the campoCodigo to set
	 */
	public void setCampoCodigo(String campoCodigo) {
		this.campoCodigo = campoCodigo;
	}
	
	/**
	 * @return the campoDescripcion
	 */
	public String getCampoDescripcion() {
		return campoDescripcion;
	}
	
	/**
	 * @param campoDescripcion the campoDescripcion to set
	 */
	public void setCampoDescripcion(String campoDescripcion) {
		this.campoDescripcion = campoDescripcion;
	}
	
	/**
	 * @return the filtro
	 */
	public String getFiltro() {
		return filtro;
	}
	
	/**
	 * @param filtro the filtro to set
	 */
	public void setFiltro(String filtro) {
		this.filtro = filtro;
	}
	
	/**
	 * @return the consultaAuto
	 */
	public boolean isConsultaAuto() {
		return consultaAuto;
	}
	
	/**
	 * @param consultaAuto the consultaAuto to set
	 */
	public void setConsultaAuto(boolean consultaAuto) {
		this.consultaAuto = consultaAuto;
	}
	
	
	public void setConsultaAuto(String consultaAuto) {
		this.consultaAuto = consultaAuto.equals("S");
	}
	
	/**
	 * @return the tituloVentana
	 */
	public String getTituloVentana() {
		return tituloVentana;
	}
	
	/**
	 * @param tituloVentana the tituloVentana to set
	 */
	public void setTituloVentana(String tituloVentana) {
		this.tituloVentana = tituloVentana;
	}
	
	/**
	 * @return the etiquetaCodigo
	 */
	public String getEtiquetaCodigo() {
		return etiquetaCodigo;
	}
	
	/**
	 * @param etiquetaCodigo the etiquetaCodigo to set
	 */
	public void setEtiquetaCodigo(String etiquetaCodigo) {
		this.etiquetaCodigo = etiquetaCodigo;
	}
	
	/**
	 * @return the etiquetaDescripcion
	 */
	public String getEtiquetaDescripcion() {
		return etiquetaDescripcion;
	}
	
	/**
	 * @param etiquetaDescripcion the etiquetaDescripcion to set
	 */
	public void setEtiquetaDescripcion(String etiquetaDescripcion) {
		this.etiquetaDescripcion = etiquetaDescripcion;
	}
	
	/**
	 * @return the campoCodigoVisible
	 */
	public boolean isCampoCodigoVisible() {
		return campoCodigoVisible;
	}
	
	/**
	 * @param campoCodigoVisible the campoCodigoVisible to set
	 */
	public void setCampoCodigoVisible(boolean campoCodigoVisible) {
		this.campoCodigoVisible = campoCodigoVisible;
	}
	
	
	public void setCampoCodigoVisible(String campoCodigoVisible) {
		this.campoCodigoVisible = campoCodigoVisible.equals("S");
	}

	public String getCampoFiltro() {
		return campoFiltro;
	}

	public void setCampoFiltro(String campoFiltro) {
		this.campoFiltro = campoFiltro;
	}
	
	
	
}
