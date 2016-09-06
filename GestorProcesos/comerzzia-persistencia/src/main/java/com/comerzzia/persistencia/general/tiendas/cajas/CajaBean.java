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

import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;

public class CajaBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 2781178493362569615L;
	
	private String codAlm;
	private String codCaja;
	private String identificadorCaja;
	private Blob configuracion;
	 

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

	public String getIdentificadorCaja() {
		return identificadorCaja;
	}

	public void setIdentificadorCaja(String identificadorCaja) {
		this.identificadorCaja = identificadorCaja;
	}

	public Blob getConfiguracion() {
		return configuracion;
	}


	public void setConfiguracion(Blob configuracion) {
		this.configuracion = configuracion;
	}


	public void borrar() {
        this.setEstadoBean(Estado.BORRADO);
    }
}
