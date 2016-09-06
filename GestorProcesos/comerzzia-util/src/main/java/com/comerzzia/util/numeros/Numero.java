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

package com.comerzzia.util.numeros;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.ParseException;


public class Numero {

    private Numero() {
    }
    
    /** Compara dos objetos Double para ver si tienen el mismo valor, teniendo en cuenta
     * que pueden ser null cualquiera de ellos. En el caso de que ambos sean null, devuelve
     * true
     * @param d1
     * @param d2
     * @return boolean
     */
    public static boolean equals(Double d1, Double d2){
    	if (d1==null && d2==null){
    		return true;
    	}
    	if ((d1==null && d2!=null) || (d2==null && d1!=null)){
    		return false;
    	}
    	return d1.equals(d2);
    }

    public static Double redondea(double d, int decimales) {
        if (d==0){
        	return 0.0;
        }
    	return new BigDecimal(d).setScale(decimales, BigDecimal.ROUND_HALF_UP).doubleValue();
    }
    
    public static Integer getParteDecimal(Double d, int decimales){
    	return getParteEntera((d - getParteEntera(d)) * Math.pow(10, decimales));
    }

    public static Integer getParteEntera(Double d){
    	return d.intValue();
    }

    @Deprecated
    public static Double desformatea(String numero) {
        return desformatea(numero, 0.0);
    }

    /** Devuelve un Double a partir de una cadena. Si se produce algún error en el parseo, 
     * devolverá el valor por defecto indicado como parámetro.
     * @param numero
     * @param defaultValue
     * @return Double correspondiente a la cadena número
     */
    public static Double desformatea(String numero, Double defaultValue) {
        if (numero == null){
        	return defaultValue;
        }
    	NumberFormat nf = NumberFormat.getInstance();
        try { 
        	defaultValue = nf.parse(numero).doubleValue();
        } 
        catch (ParseException e1) { 
        } 

        return defaultValue;
    }

    
    /** Devuelve un Long a partir de una cadena. Si se produce algún error en el parseo, 
     * devolverá el valor por defecto indicado como parámetro.
     * @param numero
     * @param defaultValue
     * @return Long correspondiente a la cadena número
     */
    public static Long desformateaLong(String numero, Long defaultValue) {
        if (numero == null){
        	return defaultValue;
        }
    	NumberFormat nf = NumberFormat.getInstance();
        try { 
        	defaultValue = nf.parse(numero).longValue();
        } 
        catch (ParseException e1) { 
        } 

        return defaultValue;
    }

    /** Devuelve un String con un formato determinado a partir de un número.
     * 
     * @param valor
     * @param numDecimales
     * @return String correspondiente al número formateado
     */
    public static String formatea(Object valor, int numDecimales){
		
		DecimalFormat formateador = crearFormateador();
		
		//establecemos las cifras decimales
		formateador.setMinimumFractionDigits(numDecimales);
		formateador.setMaximumFractionDigits(numDecimales);
		
		return formateador.format(valor);
    }
    
    public static String formatea(Object valor){
		
		DecimalFormat formateador = crearFormateador();
		formateador.setMaximumFractionDigits(4);
		
		return formateador.format(valor);
    }

	private static DecimalFormat crearFormateador() {
		//creamos el formateador para nuestra localización
    	DecimalFormat formateador = (DecimalFormat)NumberFormat.getInstance();

		//establecemos los símbolos para separar grupos de dígitos y cifras decimales  
    	DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
    	simbolos.setGroupingSeparator('.');
		simbolos.setDecimalSeparator(',');

		formateador.setDecimalFormatSymbols(simbolos);
		
		return formateador;
	}


}
