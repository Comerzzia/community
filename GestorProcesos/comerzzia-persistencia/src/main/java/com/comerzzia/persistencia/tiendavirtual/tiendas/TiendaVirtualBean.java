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

package com.comerzzia.persistencia.tiendavirtual.tiendas;

import java.io.ByteArrayInputStream;

import org.w3c.dom.Document;

import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.xml.XMLDocumentException;
import com.comerzzia.util.xml.XMLDocumentUtils;

public class TiendaVirtualBean extends MantenimientoBean {

	/**
	 * Serial Version UID.
	 */
	private static final long serialVersionUID = 9013047324419954358L;

	private static final String CONFIG_ALMACEN_CENTRAL = "almacenCentral";
	public static final String UID_TIENDA_VIRTUAL = "TIENDA_VIRTUAL";
		
	private String codAlmacen;
	private String uidTpv;
	private byte[] configuracion;
	private String clientePorDefecto;
	private String codAlmacenCentral;
	private Document xml;

	@Override
	protected void initNuevoBean() {
	}

	public String getCodAlmacen() {
		return codAlmacen;
	}

	public void setCodAlmacen(String codAlmacen) {
		this.codAlmacen = codAlmacen;
	}

	public String getUidTpv() {
		return uidTpv;
	}

	public void setUidTpv(String uidTpv) {
		this.uidTpv = uidTpv;
	}

	public byte[] getConfiguracion() {
		return configuracion;
	}

	public void setConfiguracion(byte[] configuracion) {
		this.configuracion = configuracion;
	}

	public String getClientePorDefecto() {
		return clientePorDefecto;
	}

	public void setClientePorDefecto(String clientePorDefecto) {
		this.clientePorDefecto = clientePorDefecto;
	}

	public String getCodAlmacenCentral() throws XMLDocumentException {
		if (codAlmacenCentral != null){
			return codAlmacenCentral;
		}
		try {
            if (xml == null){
            	xml = XMLDocumentUtils.createDocumentBuilder().parse(new ByteArrayInputStream(configuracion));
            }
			return XMLDocumentUtils.getTagValueAsString(xml.getDocumentElement(), CONFIG_ALMACEN_CENTRAL, false);
		} 
		catch (Exception e) {
			throw new XMLDocumentException("Error al obtener el XML del Ticket: " + e.getMessage(), e);
		} 
	}


}
