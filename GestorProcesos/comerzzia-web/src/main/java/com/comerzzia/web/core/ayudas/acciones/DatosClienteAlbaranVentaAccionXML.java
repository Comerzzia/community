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

package com.comerzzia.web.core.ayudas.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.servicios.core.ayudas.AyudaXMLException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.clientes.ClienteException;
import com.comerzzia.servicios.general.clientes.ClienteNotFoundException;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.web.base.AccionXML;
import com.comerzzia.web.base.WebKeys;

public class DatosClienteAlbaranVentaAccionXML extends AccionXML {

	@Override
	public String getNombre() {
		return "datosCliente";
	}
	
	@Override
	public Element ejecutar(HttpServletRequest request, Document document) throws AyudaXMLException {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// Obtener el código
			String codCliente = request.getParameter("codigo");
			
			// Obtener los datos del cliente
			ClienteBean cliente = ServicioClientes.consultar(codCliente, datosSesion);
			
			// Construir el XML
	        Element datosCliente = document.createElement("medioPagoCliente");        
	        XMLDocumentUtils.appendChild(document, datosCliente, "codCliente", cliente.getCodCli());        
	        XMLDocumentUtils.appendChild(document, datosCliente, "desCliente", cliente.getDesCli());        
	        XMLDocumentUtils.appendChild(document, datosCliente, "codTarifa", cliente.getCodTar());        
	        XMLDocumentUtils.appendChild(document, datosCliente, "desTarifa", cliente.getDesTar());        
	        XMLDocumentUtils.appendChild(document, datosCliente, "codMedioPago", cliente.getCodMedioPago());        
	        
	        // TODO: cambiar por ID_MEDPAG_VEN
	        
	        return datosCliente;
		}
		catch (ClienteException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		} 
		catch (ClienteNotFoundException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
	}
}
