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

package com.comerzzia.servicios.sincronizacion.sincronizadores;

import com.comerzzia.persistencia.general.tiendas.TiendaBean;
import com.comerzzia.servicios.sincronizacion.TrabajoSincronizadorException;


public interface ISincronizador {

	
	/**
	 * Inicializa la sincronización con la tienda
	 * 
	 * @param tienda
	 * @throws TrabajoSincronizadorException
	 */
	public void inicializar(TiendaBean tienda) throws TrabajoSincronizadorException;

	
	/**
	 * Envía los datos de configuración del almacén indicado
	 * 
	 * @param codAlmacen Código de almacén de la tienda a sincronizar
	 * @param configuracion  XML de configuración de sincronización de la tienda
	 * @throws TrabajoSincronizadorException
	 */
	public void enviarConfiguracion() throws TrabajoSincronizadorException;

	
	/**
	 * Envía los artículos, tarifas y promociones al almacén indicado
	 * 
	 * @param codAlmacen Código de almacén de la tienda a sincronizar
	 * @param configuracion XML de configuración de sincronización de la tienda
	 * @throws TrabajoSincronizadorException
	 */
	public void enviarArticulos() throws TrabajoSincronizadorException;
	
	
	/**
	 * Recibe los tickets pendientes de la almacén indicado
	 * 
	 * @param codAlmacen Código de almacén de la tienda a sincronizar
	 * @param configuracion XML de configuración de sincronización de la tienda
	 * @throws TrabajoSincronizadorException
	 */
	public void recibirTickets() throws TrabajoSincronizadorException;
	
	
	/**
	 * Obtiene el número de tickets recibidos de la tienda
	 * @return
	 */
	public int getNumTicketsRecibidos();
	
	
	/**
	 * Obtiene el número de artículos que se han insertado o actualizado en la tienda
	 * @return
	 */
	public int getNumArticulosEnviados();
	
	
	/**
	 * Obtiene un resumen del número de artículos, tarifas y promiciones actualizados
	 * en la tienda
	 * @return
	 */
	public String getResumenEnvioArticulos();
	
	
	/**
	 * Obtiene un resumen de la información de configuración enviada
	 * @return
	 */
	public String getResumenEnvioConfiguracion();
	
	
	/**
	 * Finaliza la sincronización con la tienda
	 * 
	 * @throws TrabajoSincronizadorException
	 */
	public void finalizar();
}
