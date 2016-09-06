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

package com.comerzzia.util.codigoBarras;

import es.mpsistemas.util.cadenas.Cadena;

public class Ean13 extends CodigoBarras{

	/**
	 * atributo que define la longitud de la cadena aleatoria para posteriormente 
	 * calcular el digito de control
	 */
	private static final int longitud = 12;
	
	public String generarAleatorio(){
		//generamos cadena numérica aleatoria
		String codigoBarras = Cadena.getRandomNumerico(longitud);
		
		//invertimos la cadena obtenida
		String aux = "";
		for(int i = codigoBarras.length() - 1; i >= 0; i--){
			aux += codigoBarras.charAt(i);
		}
		
		//obtenemos el digito de control
		//obtenemos la suma de las posiciones pares e impares
		int sumaPares = 0;
		int sumaImpares = 0;
		
		//inicializamos el indice a 1, en vez de 0 para obtener correctamente posiciones pares e impares.
		for(int i = 1; i < aux.length() + 1; i++){
			if(i%2 == 0){
				sumaPares += Integer.parseInt(aux.substring(i - 1, i));	
			}else{
				sumaImpares += Integer.parseInt(aux.substring(i - 1, i));
			}
		}
		
		//multiplicamos por 3 la suma de los impares
		Integer suma = sumaImpares * 3;
		
		//le sumamos la suma de los pares
		suma += sumaPares;
		
		//al múltiplo de 10 más próximo, le restamos la suma obtenida
		Double potencia = Math.pow(10, suma.toString().length());
		Integer resta = potencia.intValue() - suma;
		
		//obtenemos el último dígito
		String digitoVerificador = resta.toString().substring(resta.toString().length() - 1);
		
		//concatenamos el último dígito a la cadena aleaotria obtenida
		codigoBarras += digitoVerificador;
		
		//asignamos al atributo el código de barras generado
		super.codigoBarras = codigoBarras;
		
		return super.codigoBarras;
	}
}
