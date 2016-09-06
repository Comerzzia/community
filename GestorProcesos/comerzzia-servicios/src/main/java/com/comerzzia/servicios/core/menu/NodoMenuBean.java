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

package com.comerzzia.servicios.core.menu;

import org.w3c.dom.Element;
import org.w3c.dom.Node;


public class NodoMenuBean {
	/** Elemento que representa al nodo en el arbol */
    private Element element;
    
    /** Titulo del elemento de menu */
    private String titulo;
    

    /**
     * Constructor
     * @param element Nodo del menu
     */
    public NodoMenuBean(Element element) {
        this.element = element;
        this.titulo = element.getAttribute("titulo");
    }
    
    
    /**
     * Obtiene el titulo del nodo
     * @return Titulo del nodo
     */
    public String getTitulo() {
        return titulo;
    }
    
    
    /**
     * Devuelve el nodo del menu
     * @return El Nodo del menu
     */
    public Element getNodo() {
        return element;
    }
    
    
    /**
     * Añade un nuevo nodo
     * @param newChild Nuevo nodo de menu
     */
    public void addChild(Element newChild) {
        element.appendChild((Node)newChild);
    }
}
