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

import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.persistencia.general.conceptoalmacenes.ConceptoAlmacenBean;
import com.comerzzia.servicios.core.ayudas.AyudaXMLException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.AlmacenException;
import com.comerzzia.servicios.general.almacenes.AlmacenNotFoundException;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.servicios.general.conceptoalmacenes.ConceptoAlmacenException;
import com.comerzzia.servicios.general.conceptoalmacenes.ConceptoAlmacenNotFoundException;
import com.comerzzia.servicios.general.conceptoalmacenes.ServicioConceptoAlmacenes;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVenta;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.web.base.AccionXML;
import com.comerzzia.web.base.WebKeys;

public class ConceptoAlmacenVentaAccionXML extends AccionXML {

	@Override
	public String getNombre() {
		return "conceptoAlmacenVenta";
	}
	
	@Override
	public Element ejecutar(HttpServletRequest request, Document document) throws AyudaXMLException {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// Obtener el código
			String codConceptoAlmacen = request.getParameter("codigo");
			
			// Obtener los datos del concepto del almacén
			ConceptoAlmacenBean conceptoAlmacen = ServicioConceptoAlmacenes.consultar(new AlbaranVenta().getCodAplicacion(), codConceptoAlmacen, datosSesion);

			// Construir el XML
	        Element concepto = document.createElement("conceptoAlmancen");        
	        XMLDocumentUtils.appendChild(document, concepto, "codConceptoAlmacen", conceptoAlmacen.getCodConAlm());        
	        XMLDocumentUtils.appendChild(document, concepto, "desConceptoAlmacen", conceptoAlmacen.getDesConAlm());        

	        //Si tiene códigoAlmacenOrigen obtenemos la descripción de ese almacén
			if(conceptoAlmacen.getCodAlm_origen() != null){
				AlmacenBean almacen = ServicioAlmacenes.consultar(conceptoAlmacen.getCodAlm_origen(), datosSesion);
		        XMLDocumentUtils.appendChild(document, concepto, "codAlmacen", almacen.getCodAlm());        
		        XMLDocumentUtils.appendChild(document, concepto, "desAlmacen", almacen.getDesAlm());        
			}
	        
	        return concepto;
		}
		catch (ConceptoAlmacenNotFoundException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		} 
		catch (AlmacenNotFoundException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (ConceptoAlmacenException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		} 
		catch (AlmacenException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		} 
	}
}
