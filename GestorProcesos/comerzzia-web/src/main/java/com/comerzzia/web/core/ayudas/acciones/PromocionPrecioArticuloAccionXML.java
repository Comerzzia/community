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

import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.persistencia.ventas.promociones.PromocionBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.servicios.core.ayudas.AyudaXMLException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.ArticuloException;
import com.comerzzia.servicios.general.articulos.ArticuloNotFoundException;
import com.comerzzia.servicios.general.articulos.ServicioArticulos;
import com.comerzzia.servicios.ventas.tarifas.ServicioTarifas;
import com.comerzzia.servicios.ventas.tarifas.TarifaException;
import com.comerzzia.servicios.ventas.tarifas.TarifaNotFoundException;
import com.comerzzia.servicios.ventas.tarifas.articulos.ArticuloTarifaNotFoundException;
import com.comerzzia.servicios.ventas.tarifas.articulos.PreciosArticuloTarifaBean;
import com.comerzzia.servicios.ventas.tarifas.articulos.ServicioArticulosTarifas;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.web.base.AccionXML;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.promociones.ui.FormularioPromocionBean;

public class PromocionPrecioArticuloAccionXML extends AccionXML {

	@Override
	public String getNombre() {
		return "promocionPrecioArticulo";
	}

	@Override
	public Element ejecutar(HttpServletRequest request, Document document) throws AyudaXMLException {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			FormularioPromocionBean formulario = (FormularioPromocionBean) sesion.getAttribute(WebKeys.FORMULARIO_PROMOCION);
			PromocionBean promocion = (PromocionBean) formulario.getRegistroActivo();
			
			// Obtener el código
			String codArticulo = request.getParameter("codigo");
			ArticuloBean articulo = ServicioArticulos.consultar(codArticulo, datosSesion);
			
			// Obtener los datos de la tarifa
			TarifaBean tarifa = ServicioTarifas.consultar(promocion.getCodTar(), datosSesion);
			PreciosArticuloTarifaBean preciosArticuloTarifa = ServicioArticulosTarifas.obtenerPreciosArticuloTarifa(codArticulo, tarifa.getCodTar(), datosSesion);
			
			// Construir el XML
	        Element articuloXML = document.createElement("tarifa");        
	        XMLDocumentUtils.appendChild(document, articuloXML, "codArt", codArticulo);        
	        XMLDocumentUtils.appendChild(document, articuloXML, "desArt", articulo.getDesArticulo());
	        XMLDocumentUtils.appendChild(document, articuloXML, "precioTarifa", preciosArticuloTarifa.getPrecioVenta());
	        XMLDocumentUtils.appendChild(document, articuloXML, "precioTarifaConImpuestos", preciosArticuloTarifa.getPrecioVentaConImpuestos(datosSesion));
	        
			return articuloXML;
		}
		catch (ArticuloException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (ArticuloNotFoundException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (TarifaException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (TarifaNotFoundException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (ArticuloTarifaNotFoundException e) {
			throw new AyudaXMLException("El artículo seleccionado no existe para la tarifa de la promoción");
		}
	}
}
