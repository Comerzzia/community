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

package com.comerzzia.persistencia.compras.pedidos;

public class EstadosPedidosCompra {
	// Constantes para los estados del emisor del pedido
	public static final String ESTADO_EMISOR_PROCESO = "PEDPRO";
	public static final int ESTADO_EMISOR_SOLICITUD = 0;
	public static final int ESTADO_EMISOR_PDTE_ACEPT = 10;
	public static final int ESTADO_EMISOR_PDTE_RECEP = 20;
	public static final int ESTADO_EMISOR_RECHAZADO = 90;
	public static final int ESTADO_EMISOR_RECEPCIONADO = 100;
	
	// Constantes para los estados de cada una de las líneas del pedido
	public static final String ESTADO_LINEA_PROCESO = "PEDPRO_LINEA";
	public static final int ESTADO_LINEA_SOLICITADA = 0;
	public static final int ESTADO_LINEA_PDTE_ACEPT = 10;
	public static final int ESTADO_LINEA_PDTE_RECEP = 20;
	public static final int ESTADO_LINEA_RECHAZADA = 90;
	public static final int ESTADO_LINEA_RECEPCIONADA = 100;
	
	// Constantes para los subestados que pueden tener tanto la cabecera del pedido como sus líneas
	public static final int SUBESTADO_COMPLETO = 0;
	public static final int SUBESTADO_PARCIAL = 10;
	public static final int SUBESTADO_NADA = 80;
}
