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

package com.comerzzia.util.formateo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Formateo {

	/**
	 * Convierte una fecha de tipo java.util.Date a String según el patrón recibido
	 * @param fecha
	 * @param patron
	 * @return String
	 */
    public static String formateaFecha(Date fecha, String patron){
    	DateFormat df = new SimpleDateFormat(patron);
        return df.format(fecha);
    }

}
