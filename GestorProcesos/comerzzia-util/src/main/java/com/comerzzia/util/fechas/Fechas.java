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

package com.comerzzia.util.fechas;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Operaciones con fechas
 */
public class Fechas {

    /**
     * Devuelve un sql.Date a partir de un util.Date
     * @param fecha
     * @return 
     */
    public static java.sql.Date toSqlDate(java.util.Date fecha) {
    	if (fecha == null) {
    		return null;
    	}
    	
        return new java.sql.Date(fecha.getTime());
    }
    
    /**
     * Devuelve un sql.Timestamp a partir de un util.Date
     * @param fecha
     * @return 
     */
    public static java.sql.Timestamp toSqlTimestamp(java.util.Date fecha) {
    	if (fecha == null) {
    		return null;
    	}
    	
    	return new Timestamp(fecha.getTime());
    }
    
    /**
     * Suma la cantidad de dias a la fecha pasada
     * 
     * @param fecha a sumar
     * @param cantidad de dias a sumar
     * @return 
     */
    public static Date sumaDias(Date fecha, int cantidad) {
        Calendar c = Calendar.getInstance();
		c.setTime(fecha);
		c.add(Calendar.DAY_OF_MONTH, cantidad);
		fecha = c.getTime();

		return fecha;
    }
    
    /**
     * Devuelve un Date con la fecha pasada
     * @param fecha
     * @return 
     * @throws es.mpsistemas.m2m.util.FechaException
     */
    public static Date getFecha(String fecha) throws FechaException {
       return getFecha(fecha, "dd/MM/yyyy");
    }
    
    /**
     * Convierte una fecha en java.util.Date a partir de una cadena y un patrón dado
     * @param fecha
     * @param patron
     * @return 
     * @throws es.mpsistemas.m2m.util.FechaException
     */
    public static Date getFecha(String fecha, String patron) throws FechaException {
        Date date = null;
        
        try {
            DateFormat df = new SimpleDateFormat(patron);
            date = df.parse(fecha);
            
            return date;
        }
        catch (ParseException e) {
            throw new FechaException(e.getMessage());
        }
    }

    /**
     * Devuelve el dia de hoy
     * @return 
     */
    public static int dia() {
        Calendar c = Calendar.getInstance();
        
        return c.get(Calendar.DAY_OF_MONTH);
    }
    
    
    /**
     * Devuelve el mes de hoy
     * @return 
     */
    public static int mes() {
        Calendar c = Calendar.getInstance();
        
        return c.get(Calendar.MONTH) + 1;
    }
    
    
    /**
     * Devuelve el año de hoy
     * @return 
     */
    public static int año() {
        Calendar c = Calendar.getInstance();
        
        return c.get(Calendar.YEAR);
    }
    
    /** Devuelve true o false en función de si las fechas indicadas por
     * parámetro son iguales o no (sin tener en cuenta la hora)
     * @param fecha1
     * @param fecha2
     * @return boolean 
     */
    public static boolean equalsDate (Date fecha1, Date fecha2){
	    Calendar c1 = Calendar.getInstance();
	    Calendar c2= Calendar.getInstance();
	    c1.setTime(fecha1);
	    c2.setTime(fecha2);
	    if (c1.get(Calendar.DAY_OF_MONTH) != c2.get(Calendar.DAY_OF_MONTH)){
	    	return false;
	    }
	    if (c1.get(Calendar.MONTH) != c2.get(Calendar.MONTH)){
	    	return false;
	    }
	    if (c1.get(Calendar.YEAR) != c2.get(Calendar.YEAR)){
	    	return false;
	    }
	    return true;
	    
    }

    
}
