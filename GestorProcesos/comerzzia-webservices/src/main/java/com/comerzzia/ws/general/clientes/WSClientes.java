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

package com.comerzzia.ws.general.clientes;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.util.config.AppInfo;
import com.comerzzia.util.log.Logger;


public class WSClientes {

	/** Logger */
    protected static Logger log = Logger.getMLogger(WSClientes.class);
    
    
    public WSClienteBean obtenerCliente(String cif, String usuario, String clave) throws Exception {
    	
    	// TODO: validación usuario / clave
    	
    	// TODO: obtener esquema empresa
    	
    	// TODO: ver qué objeto cliente devolver
    	
    	DatosSesionBean datosSesion = new DatosSesionBean();
		
		// Creamos el objeto de configuración de la empresa
		ConfigEmpresaBean configEmpresa = new ConfigEmpresaBean();
		configEmpresa.setEsquemaEmpresa(AppInfo.getDbInfo().getEsquemaEmpresa());
		
		// Actualizamos los datos de la sesión
		datosSesion.setConfigEmpresa(configEmpresa);
		
		WSClienteBean cliente = new WSClienteBean(ServicioClientes.consultarCif(cif, datosSesion));
		
		return cliente;
    }
}
