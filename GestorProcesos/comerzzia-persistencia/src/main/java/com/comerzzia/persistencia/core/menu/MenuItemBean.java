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

package com.comerzzia.persistencia.core.menu;

import java.io.IOException;
import java.io.Reader;
import java.io.StreamTokenizer;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.acciones.AccionBean;


public class MenuItemBean {

	/**
	 * Ruta completa del punto de menú separada por '/'
	 */
	private String opcion;
	
	/**
	 * Posición que ocupa el punto de menú
	 */
	private Integer orden;
	
	/**
	 * Información de la acción de menú asociada al punto de menú
	 */
	private AccionBean accion;
	
	/** Lista de submenús del que cuelga el item */
    private List<String> rutaMenu;
	
    
    public MenuItemBean() {
    	rutaMenu = new ArrayList<String>();
    }
    
	/**
	 * @return the opcion
	 */
	public String getOpcion() {
		return opcion;
	}
	
	/**
	 * @param opcion the opcion to set
	 */
	public void setOpcion(String opcion) {
		this.opcion = opcion;
		setRutaMenu();
	}
	
	/**
	 * @return the orden
	 */
	public Integer getOrden() {
		return orden;
	}
	
	/**
	 * @param orden the orden to set
	 */
	public void setOrden(Integer orden) {
		this.orden = orden;
	}
	
	/**
	 * @return the accion
	 */
	public AccionBean getAccion() {
		return accion;
	}
	
	/**
	 * @param accion the accion to set
	 */
	public void setAccion(AccionBean accion) {
		this.accion = accion;
	}
	
	/**
     * Establece la lista de submenús del que cuelga el item
     * @param ruta Cadena que contiene la lista de submenús separados por el
     *             caracter "/"
     */
	private void setRutaMenu(){
        Reader r = new StringReader(this.opcion);
		StreamTokenizer st = new StreamTokenizer(r);
        
        rutaMenu.clear();
        
        try {
			st.whitespaceChars('\\', '\\');
            st.wordChars(' ', ' ');
            st.wordChars('_', '_');
			st.ordinaryChars('0', '9');
			st.wordChars('0', '9');
            st.wordChars('(', ')');
            st.wordChars('\'', '\'');
			st.eolIsSignificant(false);
			while (st.nextToken() != StreamTokenizer.TT_EOF) {
				String cadena;
				switch (st.ttype) {
					case StreamTokenizer.TT_EOL:
						cadena = new String("EOL");
						break;
					case StreamTokenizer.TT_NUMBER:
						cadena = Double.toString(st.nval);
						break;
					case StreamTokenizer.TT_WORD:
						cadena = st.sval;
						break;
					default:   // Es un caracter
						cadena = String.valueOf((char)st.ttype);
				}
				
                rutaMenu.add(cadena);
			}
		}
		catch (IOException e) {
            e.printStackTrace();
		}
    }
	
	
	/**
     * Devuelve el numero de niveles de submenús del que cuela el item
     * @return Numero de niveles
     */
    public int getNumeroNiveles() {
        return rutaMenu.size() - 1;
    }
    
    
    /**
     * Devuelve el nombre del submenú de un nivel determinado
     * @param nivel Nivel del submenú
     * @return Nombre del submenú
     */
    public String getSubmenu(int nivel) {
        if (nivel >= rutaMenu.size() -1) {
            return null;
        }
        
        return rutaMenu.get(nivel);
    }
    
    
    /**
     * Obtiene el nombre de la opción de menú
     * @return
     */
    public String getOpcionMenu() {
        return rutaMenu.get(rutaMenu.size()-1);
    }
}
