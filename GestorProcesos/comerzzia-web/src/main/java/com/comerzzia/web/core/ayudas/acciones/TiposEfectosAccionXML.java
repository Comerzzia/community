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

import com.comerzzia.persistencia.tesoreria.tiposefectos.TipoEfectoBean;
import com.comerzzia.servicios.core.ayudas.AyudaXMLException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.tiposefectos.ServicioTiposEfectos;
import com.comerzzia.servicios.tesoreria.tiposefectos.TipoEfectoException;
import com.comerzzia.servicios.tesoreria.tiposefectos.TipoEfectoNotFoundException;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.web.base.AccionXML;
import com.comerzzia.web.base.WebKeys;

public class TiposEfectosAccionXML extends AccionXML {

	public String getNombre() {
		return "tiposEfectos";
	}
	
	
	public Element ejecutar(HttpServletRequest request, Document document)
			throws AyudaXMLException {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Obtener el código
			String codTipoEfecto = request.getParameter("codTipoEfecto");

			// Obtener los datos del tipo de efecto
			TipoEfectoBean tipoEfecto = ServicioTiposEfectos.consultar(codTipoEfecto, datosSesion);
			
			// Construir el XML
	        Element tipoEfectoXML = document.createElement("tipoEfecto");        
	        XMLDocumentUtils.appendChild(document, tipoEfectoXML, "codTipoEfecto", tipoEfecto.getCodTipoEfecto());        
	        XMLDocumentUtils.appendChild(document, tipoEfectoXML, "desTipoEfecto", tipoEfecto.getDesTipoEfecto());
	        XMLDocumentUtils.appendChild(document, tipoEfectoXML, "remesable", (tipoEfecto.isRemesable()) ? "S" : "N");
	        XMLDocumentUtils.appendChild(document, tipoEfectoXML, "entradaDocumentoAutomatica", (tipoEfecto.isEntradaDocumentoAutomatica()) ? "S" : "N");
	        	
	        
			return tipoEfectoXML;
		} catch (TipoEfectoException e) {
			throw new AyudaXMLException(e.getMessage(), e);
			
		} catch (TipoEfectoNotFoundException e) {
			throw new AyudaXMLException("El tipo de efecto introducido no existe");
		}
	}

}
