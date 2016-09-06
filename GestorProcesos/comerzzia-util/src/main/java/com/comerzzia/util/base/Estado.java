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


public class Estado {

	public static final int SIN_MODIFICAR = 0;
    public static final int MODIFICADO    = 1;
    public static final int BORRADO       = 2;
    public static final int NUEVO         = 3;


    public int getSIN_MODIFICAR() {
        return SIN_MODIFICAR;
    }


    public int getMODIFICADO() {
        return MODIFICADO;
    }


    public int getBORRADO() {
        return BORRADO;
    }


    public int getNUEVO() {
        return NUEVO;
    }
}
