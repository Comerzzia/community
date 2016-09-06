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

import com.comerzzia.persistencia.general.proveedores.ProveedorBean;
import com.comerzzia.servicios.core.ayudas.AyudaXMLException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.proveedores.ProveedorException;
import com.comerzzia.servicios.general.proveedores.ProveedorNotFoundException;
import com.comerzzia.servicios.general.proveedores.ServicioProveedores;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.web.base.AccionXML;
import com.comerzzia.web.base.WebKeys;

public class MedioPagoProveedorAccionXML extends AccionXML {

	@Override
	public String getNombre() {
		return "medioPagoProveedor";
	}
	
	@Override
	public Element ejecutar(HttpServletRequest request, Document document) throws AyudaXMLException {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// Obtener el código
			String codProveedor = request.getParameter("codigo");
			
			// Obtener los datos del proveedor
			ProveedorBean proveedor = ServicioProveedores.consultar(codProveedor, datosSesion);
			
			// Construir el XML
	        Element medioPagoProveedor = document.createElement("medioPagoProveedor");        
	        XMLDocumentUtils.appendChild(document, medioPagoProveedor, "codProveedor", proveedor.getCodPro());        
	        XMLDocumentUtils.appendChild(document, medioPagoProveedor, "desProveedor", proveedor.getDesPro());        
	        XMLDocumentUtils.appendChild(document, medioPagoProveedor, "idMedioPagoVencimiento", proveedor.getIdMedioPagoVencimiento());        
	        XMLDocumentUtils.appendChild(document, medioPagoProveedor, "desMedioPagoVencimiento", proveedor.getDesMedioPagoVencimiento());        
	        
	        return medioPagoProveedor;
		}
		catch (ProveedorException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		} 
		catch (ProveedorNotFoundException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
	}
}
