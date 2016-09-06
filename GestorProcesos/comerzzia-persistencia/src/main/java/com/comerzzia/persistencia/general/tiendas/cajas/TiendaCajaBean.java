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

package com.comerzzia.persistencia.general.tiendas.cajas;

import java.sql.Blob;

import org.w3c.dom.Document;

import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.xml.XMLDocument;


public class TiendaCajaBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2597891415038550755L;
	
	
	private String codAlm;
	private String codCaja;
	private String uidTpv;
	private XMLDocument configuracion = new XMLDocument();
	
	
	public TiendaCajaBean(String codAlmacen, String codCaja, String uidTpv, String configuracion) {
		this.codAlm = codAlmacen;
		this.codCaja = codCaja;
		this.uidTpv = uidTpv;
		setConfiguracion(configuracion);
	}
	

	protected void initNuevoBean() {	
	}

	
	public String getCodAlm() {
		return codAlm;
	}

	public void setCodAlm(String codAlm) {
		this.codAlm = codAlm;
	}

	public String getCodCaja() {
		return codCaja;
	}

	public void setCodCaja(String codCaja) {
		this.codCaja = codCaja;
	}

	public String getUidTpv() {
		return uidTpv;
	}

	public void setUidTpv(String uidTpv) {
		this.uidTpv = uidTpv;
	}
	
	
	public void setConfiguracion(Blob configuracion) {
		this.configuracion.setDocument(configuracion);
	}
	
	public void setConfiguracion(String configuracion) {
		this.configuracion.setDocument(configuracion);
	}
	
	public void setConfiguracion(Document configuracion) {
		this.configuracion.setDocument(configuracion);
	}

	public XMLDocument getConfiguracion() {
		return configuracion;
	}
	
	public Document getDocumentConfiguracion() {
		return configuracion.getDocument();
	}
	
	
	public void borrar() {
        this.setEstadoBean(Estado.BORRADO);
    }
}
