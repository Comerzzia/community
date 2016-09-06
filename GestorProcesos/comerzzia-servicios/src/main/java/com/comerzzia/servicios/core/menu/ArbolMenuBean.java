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

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.comerzzia.persistencia.core.menu.MenuBean;
import com.comerzzia.persistencia.core.menu.MenuItemBean;
import com.comerzzia.util.log.Logger;


// TODO: cambiar la implementación para usar un Tree en vez 
//       de un Document para representar el arbol del menú 

public class ArbolMenuBean {
	
	/** Logger */
    private static Logger log = Logger.getMLogger(ArbolMenuBean.class);
	
	// Nombres de las etiquetas y atributos del XML
    private final static String aplicacionAttributeName = "aplicacion";
    private final static String accionAttributeName     = "accion";
    private final static String tituloAttributeName     = "titulo";
    private final static String rootElementName         = "menuApp";
    private final static String menuElementName         = "menu";
    private final static String itemElementName         = "menuItem";
    private final static String tipoAccionElementName   = "tipoAccion";
    private final static String ejecucionElementName    = "ejecucion";
    private final static String parametrosElementName   = "parametros";
    private final static String tituloElementName       = "titulo";
    private final static String descripcionElementName  = "descripcion";
    private final static String iconoElementName        = "icono";

    
    /** XML que contiene el arbol del menú */
    private Document document = null;
    
    /** Elemento raiz del arbol */
    private Element root = null;
    
    /** Lista de submenú que contiene un nodo */
    private List<NodoMenuBean> lstSubmenus = new ArrayList<NodoMenuBean>();
    
    
    /**
     * Devuelve el documento XML que contiene la estructura del menú
     * @return XML del menú
     */
    public Document getDocument() {
    	return document;
    }
    
    
    public void setMenu(MenuBean menu) throws MenuException {
    	try {
            // Creamos el document
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
            document = builder.newDocument();

            // Crea el elemento root
            root = document.createElement(rootElementName);
            root.setAttribute(aplicacionAttributeName, menu.getAplicacion());
        }
        catch (ParserConfigurationException e) {
            log.error("setMenu() - " + e.getMessage());
            throw new MenuException("Error al crear document del menu: " + e.getMessage());
        }
        
        List<MenuItemBean> items = menu.getMenu();
        for (Iterator<MenuItemBean> it = items.iterator(); it.hasNext(); ) {
        	addMenuItem(it.next());
        }
        
        if (root != null) {
            // Recorremos submenus pendientes
            int niveles = lstSubmenus.size();
            for (int i=0; i < niveles; i++) {
                terminarSubmenu();
            }
            document.appendChild(root);
        }
    }
    
    
    private void addMenuItem(MenuItemBean menuItem) {
    	// Si tenemos menos niveles que los actuales, retrocedemos nodos del vector
        int resto = lstSubmenus.size() - menuItem.getNumeroNiveles();
        for (int i=0; i<resto; i++) {
            terminarSubmenu();
        }
        
        // recorremos los niveles del menuItem
        for (int i=0; i<menuItem.getNumeroNiveles(); i++) {
            // si No existe elemento en el vector en este indice lo creamos
            if (lstSubmenus.size() <= i) {
                crearSubmenu(menuItem.getSubmenu(i));
            }
            else {  // Si existe elemento en este indice y coincide, continuamos con el siguiente nivel,
                // pero si no coinciden es que los anteriores ya se han terminado
                
                if (! menuItem.getSubmenu(i).equalsIgnoreCase((String)(lstSubmenus.get(i)).getTitulo())) {
                    int niveles = lstSubmenus.size();
                    for (int j=i; j<niveles; j++) {
                        terminarSubmenu();
                    }
                    
                    crearSubmenu(menuItem.getSubmenu(i));
                }
            }
        }
        // Ya podemos insertar la opcion en el ultimo submenu del vector
        insertarOpcion(menuItem);
    }
    
    
    /**
     * Termina un submenú, al que ya se le han añadido todas las opciones
     * Este siempre será el ultimo del vector, y al terminarlo lo que hacemos es
     * añadir su nodo a su antecesor
     */
    private void terminarSubmenu() {
        // si solo tenemos un elemento en el vector, lo pasamos al root
        if (lstSubmenus.size() == 1) {
            root.appendChild((Element)(lstSubmenus.get(0)).getNodo());
            lstSubmenus.clear();
        }
        else {  // en cq cualquier otro caso, lo pasamos al elemento anterior
            int ultimo = lstSubmenus.size() - 1;
            (lstSubmenus.get(ultimo-1)).addChild(
                (Element)(lstSubmenus.get(ultimo)).getNodo());
            lstSubmenus.remove(ultimo);
        }
    }
    
    
    /**
     * Crea un nuevo elemento de submenú, añadiendolo al final del vector
     * de submenús
     * @param titulo Titulo del submenú
     */
    private void crearSubmenu(String titulo) {
        Element submenu;
        
        if (lstSubmenus.size() == 0) {
            submenu = document.createElement(menuElementName);
            submenu.setAttribute(tituloAttributeName, titulo);
        }
        else {
            submenu = document.createElement(itemElementName);
            submenu.setAttribute(tituloAttributeName, titulo);
            submenu.setAttribute(accionAttributeName, "");
        }
        
        NodoMenuBean menuNodo = new NodoMenuBean(submenu);
        lstSubmenus.add(menuNodo);    // siempre se añaden al final
    }
    
    
    /**
     * Añade una nueva opcion de menú al ultimo submenú del vector
     * @param m Item de menu a añadir
     */
    private void insertarOpcion(MenuItemBean menuItem) {
        // Creamos el element
        Element item;
        String titulo = menuItem.getOpcionMenu();
        if (lstSubmenus.isEmpty()){
            item = document.createElement(menuElementName);
        }
        else{
            item = document.createElement(itemElementName);
        }
        
        
        if (titulo.equals("-")) {    // es un separador
            item.setAttribute(tituloAttributeName, titulo);
            item.setAttribute(accionAttributeName, "");
        }
        else {
            item.setAttribute(tituloAttributeName, titulo);
            item.setAttribute(accionAttributeName, menuItem.getAccion().getIdAccion().toString());
            
            addNodo(item, tipoAccionElementName, menuItem.getAccion().getTipoAccion());
            addNodo(item, ejecucionElementName, menuItem.getAccion().getEjecucion());
            addNodo(item, parametrosElementName, menuItem.getAccion().getParametros());
            addNodo(item, descripcionElementName, menuItem.getAccion().getDescripcion());
            addNodo(item, tituloElementName, menuItem.getAccion().getTitulo());
            addNodo(item, iconoElementName, menuItem.getAccion().getIcono());
        }
        
        // insertamos el nodo en el menú
        if(lstSubmenus.isEmpty()){
            // si la lista de submenús está vacía, se trata de un nodo padre sin hijos, lo añadimos al root
             root.appendChild(item);
        }
        else{
            // si no, lo añadimos en el ultimo elemento de la lista de submenus
            lstSubmenus.get(lstSubmenus.size()-1).addChild(item);
        }
    }
    
    
    /**
     * Añade un nuevo nodo simple al elemento pasado
     * @param element Elemento al que se añade el nodo
     * @param nombre Nombre del nuevo nodo
     * @param valor Valor del nuevo nodo
     */
    private void addNodo(Element element, String nombre, String valor) {
        Node nodo = document.createElement(nombre);
        if (valor != null) {
            if (valor.length() > 0) {
                nodo.appendChild(document.createTextNode(valor));
            }
        }
        element.appendChild(nodo);
    }
}
