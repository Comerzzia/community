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

package com.comerzzia.persistencia.general.articulos.fotos;

import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;

public class FotoArticuloBean extends MantenimientoBean implements
		Comparable<FotoArticuloBean> {

	/**
	 * Serial Version UID.
	 */
	private static final long serialVersionUID = 917578302691771802L;

	private static final String PEQUENA = "P";
	private static final String MEDIANA = "M";
	private static final String GRANDE = "G";

	private String codArticulo;
	private String tipoFoto;
	private byte[] foto;

	protected void initNuevoBean() {
	}

	public String getCodArticulo() {
		return codArticulo;
	}

	public void setCodArticulo(String codArticulo) {
		this.codArticulo = codArticulo.toUpperCase();
	}

	public String getTipoFoto() {
		return tipoFoto;
	}

	public void setTipoFoto(String tipoFoto) {
		this.tipoFoto = tipoFoto;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public void setTipoFotoPequena() {
		this.tipoFoto = PEQUENA;
	}

	public void setTipoFotoMediana() {
		this.tipoFoto = MEDIANA;
	}

	public void setTipoFotoGrande() {
		this.tipoFoto = GRANDE;
	}

	public void borrar() {
		this.setEstadoBean(Estado.BORRADO);
	}

	@Override
	public int compareTo(FotoArticuloBean foto) {
		if (getTipoFoto().equals(PEQUENA)) {
			return -1;
		} else if (getTipoFoto().equals(GRANDE)) {
			return 1;
		} else {
			if (getTipoFoto().equals(MEDIANA)
					&& foto.getTipoFoto().equals(PEQUENA)) {
				return 1;
			} else {
				return -1;
			}
		}
	}
}
