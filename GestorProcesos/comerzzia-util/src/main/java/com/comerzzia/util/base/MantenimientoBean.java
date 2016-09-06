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

package com.comerzzia.util.base;

import java.io.Serializable;


/**
 * Mantenimiento básico de los datos de un registro
 *
 */
public abstract class MantenimientoBean implements Serializable {
	
	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 5341599003382464139L;

	/**
	 * Definición de constante booleana verdadera como cadena
	 */
	protected static final String TRUE = "S";
	
	/**
	 * Definición de constante booleana falsa como cadena
	 */
	protected static final String FALSE = "N";

	/**
	 * Indica si el registro está activo o no
	 */
	private boolean activo = true;
	
    /**
     * Estado del registro
     */
    private int estadoBean = Estado.SIN_MODIFICAR;
    
    /**
     * Indica si el registro está en edición o no
     */
    private boolean enEdicion = false;
    

    public void setActivo(boolean activo) {
		this.activo = activo;
	}


	public boolean isActivo() {
		return activo;
	}
	
	
	public void setActivo(String activo) {
		this.activo = activo.equals(TRUE);
	}
	
	
	public String getActivo() {
		return (activo) ? TRUE : FALSE;
	}
	

    public void setEstadoBean(int estadoBean) {
        this.estadoBean = estadoBean;
        
        if (estadoBean == Estado.NUEVO) {
            initNuevoBean();
        }
    }


    public int getEstadoBean() {
        return estadoBean;
    }
    
    
    public boolean isEstadoBorrado() {
        return estadoBean == Estado.BORRADO;
    }
    
    
    public boolean isEstadoNuevo() {
        return estadoBean == Estado.NUEVO;
    }
    
    
    public void setEnEdicion(boolean enEdicion) {
        this.enEdicion = enEdicion;
    }


    public boolean isEnEdicion() {
        return enEdicion;
    }
    
    
    protected abstract void initNuevoBean();
}
