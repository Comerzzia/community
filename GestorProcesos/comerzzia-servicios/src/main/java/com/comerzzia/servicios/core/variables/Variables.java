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

package com.comerzzia.servicios.core.variables;

import java.util.ArrayList;
import java.util.List;

public class Variables {

	public static final String GENERAL_VERSION = "GENERAL.VERSION";
	public static final String APLICACION_TITULO = "APLICACION.TITULO"; 
	public static final String USUARIO_EMPRESA = "USUARIO.EMPRESA"; 
	public static final String ARTICULOS_DESGLOSE1_TITULO = "ARTICULOS.DESGLOSE1_TITULO"; 
	public static final String ARTICULOS_DESGLOSE2_TITULO = "ARTICULOS.DESGLOSE2_TITULO"; 
	public static final String TARIFAS_REDONDEO_NIVEL1 = "TARIFAS.REDONDEO_NIVEL1"; 
	public static final String TARIFAS_REDONDEO_NIVEL2 = "TARIFAS.REDONDEO_NIVEL2"; 
	public static final String TARIFAS_REDONDEO_NIVEL3 = "TARIFAS.REDONDEO_NIVEL3"; 
	public static final String TICKETS_PROCESAMIENTO_AUTOMATICO = "TICKETS.PROCESAMIENTO_AUTOMATICO"; 
	public static final String TICKETS_PROCESAMIENTO_AUTOMATICO_TIEMPO = "TICKETS.PROCESAMIENTO_AUTOMATICO_TIEMPO";
	public static final String TICKETS_USA_DESCUENTO_EN_LINEA = "TICKETS.USA_DESCUENTO_EN_LINEA";
	public static final String SINCRONIZADOR_ARRANQUE_AUTOMATICO = "SINCRONIZADOR.ARRANQUE_AUTOMATICO";
	public static final String SINCRONIZADOR_MAX_TRABAJOS_SIMULTANEOS = "SINCRONIZADOR.MAX_TRABAJOS_SIMULTANEOS";
	public static final String WEBSERVICES_WSCLIENTES = "WEBSERVICES.WSCLIENTES";
	public static final String TPV_VERSION = "TPV.VERSION";
	public static final String ARTICULOS_CODIGOS_BARRAS_FORMATO = "ARTICULOS.FORMATO_CODBAR_AUTOMATICO";
	public static final String EAN13 = "EAN13";
	public static final String EAN8 = "EAN8";
	
	public static final List<String> parametros = new ArrayList<String>();
	
	static {
		parametros.add(ARTICULOS_DESGLOSE1_TITULO);
		parametros.add(ARTICULOS_DESGLOSE2_TITULO);
		parametros.add(TARIFAS_REDONDEO_NIVEL1);
		parametros.add(TARIFAS_REDONDEO_NIVEL2);
		parametros.add(TARIFAS_REDONDEO_NIVEL3);
		parametros.add(SINCRONIZADOR_ARRANQUE_AUTOMATICO);
		parametros.add(SINCRONIZADOR_MAX_TRABAJOS_SIMULTANEOS);
		parametros.add(TICKETS_PROCESAMIENTO_AUTOMATICO);
		parametros.add(TICKETS_PROCESAMIENTO_AUTOMATICO_TIEMPO);
		parametros.add(TICKETS_USA_DESCUENTO_EN_LINEA);
		parametros.add(WEBSERVICES_WSCLIENTES);
		parametros.add(ARTICULOS_CODIGOS_BARRAS_FORMATO);
	}
}
