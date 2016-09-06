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

import java.util.ArrayList;
import java.util.List;


public class MenuBean {

	/**
	 * Aplicación a la que pertenece el menú
	 */
	private String aplicacion;
	
	/**
	 * Lista de elementos del menú
	 */
	private List<MenuItemBean> menu;
	
	
	public MenuBean() {
		menu = new ArrayList<MenuItemBean>();
	}
	
	/**
	 * @return the aplicacion
	 */
	public String getAplicacion() {
		return aplicacion;
	}

	/**
	 * @param aplicacion the aplicacion to set
	 */
	public void setAplicacion(String aplicacion) {
		this.aplicacion = aplicacion;
	}

	/**
	 * @return the menu
	 */
	public List<MenuItemBean> getMenu() {
		return menu;
	}

	/**
	 * @param menu the menu to set
	 */
	public void setMenu(List<MenuItemBean> menu) {
		this.menu = menu;
	}
	
	/**
	 * @param menuItem
	 */
	public void add(MenuItemBean menuItem) {
		menu.add(menuItem);
	}
}
