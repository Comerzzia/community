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
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajesImpuestosBean;
import com.comerzzia.servicios.core.impuestos.porcentajes.ServicioPorcentajesImpuestos;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.ArticuloException;
import com.comerzzia.servicios.general.articulos.ArticuloNotFoundException;
import com.comerzzia.servicios.general.articulos.ServicioArticulos;
import com.comerzzia.servicios.ventas.tarifas.ServicioTarifas;
import com.comerzzia.servicios.ventas.tarifas.TarifaException;
import com.comerzzia.servicios.ventas.tarifas.TarifaNotFoundException;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.web.base.AccionXML;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.promociones.ui.FormularioPromocionBean;

public class ArticuloPromocionAccionXML extends AccionXML {

	@Override
	public String getNombre() {
		return "articulo.promocion";
	}

	@Override
	public Element ejecutar(HttpServletRequest request, Document document) throws AyudaXMLException {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			FormularioPromocionBean formulario = (FormularioPromocionBean) sesion.getAttribute(WebKeys.FORMULARIO_PROMOCION);
			PromocionBean promocion = (PromocionBean) formulario.getRegistroActivo();
			
			String codArticulo = request.getParameter("codArticulo");
			ArticuloBean articulo = ServicioArticulos.consultar(codArticulo, datosSesion);
			
			TarifaBean tarifa = ServicioTarifas.consultar(promocion.getCodTar(), datosSesion);
			
			// consultamos los porcentajes de impuestos para el grupo y el tratamiento de impuestos
			PorcentajesImpuestosBean porcentajes = ServicioPorcentajesImpuestos.consultar(tarifa.getIdGrupoImpuesto(), tarifa.getIdTratImpuestos());

			// obtenemos porcentaje para el código de impuesto del artículo
			if (porcentajes.getPorcentaje(articulo.getCodImpuesto()) == null){
				throw new AyudaXMLException("No existe un porcentaje de impuesto definido para el tipo de impuesto y la tarifa indicada.");
			}
			Double porcentaje = porcentajes.getPorcentaje(articulo.getCodImpuesto()).getPorcentaje();
			
			// Construir el XML
	        Element articuloXML = document.createElement("articulo");        
	        XMLDocumentUtils.appendChild(document, articuloXML, "porcentajeImpuestos", porcentaje);
			return articuloXML;
		}
		catch (ArticuloException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (ArticuloNotFoundException e) {
			throw new AyudaXMLException("El artículo introducido no existe");
		}
		catch (TarifaNotFoundException e) {
			throw new AyudaXMLException("La tarifa introducida no existe");
		}
		catch (PorcentajeImpuestoException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (TarifaException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
	}
}
