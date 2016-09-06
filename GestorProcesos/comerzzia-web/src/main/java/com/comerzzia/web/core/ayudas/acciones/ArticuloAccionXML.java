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
import com.comerzzia.servicios.core.ayudas.AyudaXMLException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.ArticuloException;
import com.comerzzia.servicios.general.articulos.ArticuloNotFoundException;
import com.comerzzia.servicios.general.articulos.ServicioArticulos;
import com.comerzzia.servicios.ventas.tarifas.TarifaException;
import com.comerzzia.servicios.ventas.tarifas.articulos.ArticuloTarifaNotFoundException;
import com.comerzzia.servicios.ventas.tarifas.articulos.PreciosArticuloTarifaBean;
import com.comerzzia.servicios.ventas.tarifas.articulos.ServicioArticulosTarifas;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.web.base.AccionXML;
import com.comerzzia.web.base.WebKeys;

public class ArticuloAccionXML extends AccionXML {

	@Override
	public String getNombre() {
		return "articulo";
	}

	@Override
	public Element ejecutar(HttpServletRequest request, Document document) throws AyudaXMLException {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Obtener el código
			String codArticulo = request.getParameter("codArticulo");
			String codTarifa = request.getParameter("codTarifa");
			String codCliente = request.getParameter("codCliente");

			// Obtener los datos del articulo
			ArticuloBean articulo = ServicioArticulos.consultarPorCodigo(codArticulo, datosSesion);
			
			// Obtener los precios del artículo
			PreciosArticuloTarifaBean preciosArticuloTarifa = ServicioArticulosTarifas.obtenerPreciosArticuloTarifa(articulo.getCodArticulo(), codTarifa, codCliente, datosSesion);
			
			// Construir el XML
	        Element articuloXML = document.createElement("articulo");        
	        XMLDocumentUtils.appendChild(document, articuloXML, "codArticulo", articulo.getCodArticulo());        
	        XMLDocumentUtils.appendChild(document, articuloXML, "desArticulo", articulo.getDesArticulo());
	        
	        // Si el artículo tiene configurado desgloses
	        XMLDocumentUtils.appendChild(document, articuloXML, "mostrarDesglose1", (articulo.isDesglose1()) ? "S" : "N");
	        XMLDocumentUtils.appendChild(document, articuloXML, "mostrarDesglose2", (articulo.isDesglose2()) ? "S" : "N");
	        	
	        // Si es un código de barras, enviar los valores de los desgloses
	        if(esCodigoBarras(articulo)) {
		        XMLDocumentUtils.appendChild(document, articuloXML, "desglose1", articulo.getCodigoBarras(0).getDesglose1());
		        XMLDocumentUtils.appendChild(document, articuloXML, "desglose2", articulo.getCodigoBarras(0).getDesglose2());
	        }
	        else {
	        	// Si el artículo tiene desglose1 lo mandamos vacío
	        	if (articulo.isDesglose1()) {
	        		XMLDocumentUtils.appendChild(document, articuloXML, "desglose1", "");
	        	}
	        	else {  // Si no mandamos *
	        		XMLDocumentUtils.appendChild(document, articuloXML, "desglose1", "*");
	        	}
	        	
	        	// Si el artículo tiene desglose2 lo mandamos vacío
	        	if (articulo.isDesglose2()) {
	        		XMLDocumentUtils.appendChild(document, articuloXML, "desglose2", "");
	        	}
	        	else {  // Si no mandamos *
	        		XMLDocumentUtils.appendChild(document, articuloXML, "desglose2", "*");
	        	}
	        }
	        
	        //Si el artículo tiene código de barras Dun14 ponemos cantidad por defecto
	        if(articuloTieneCodigoBarrasDun14(articulo)){
				//Añadidos la cantidad
				XMLDocumentUtils.appendChild(document, articuloXML, "cantidadDun14", articulo.getCodigoBarras(0).getFactorConversion());
	        }

	        // Si el artículo tiene definida UNIDAD_MEDIDA_ALTERNATIVA, sólo estará esta disponible
	        if(articulo.getUnidadMedAlt() != null && !articulo.getUnidadMedAlt().isEmpty()) {
	        	XMLDocumentUtils.appendChild(document, articuloXML, "unidadMedidaAlternativa", articulo.getUnidadMedAlt());
	        }
	        else if(articulo.getUnidadesMedidas() != null && articulo.getUnidadesMedidas().size() > 0) { // Si no tenía UNIDAD_MEDIDA_ALTERNATIVA, enviar todas las unidades de medida si es que tiene
	        	Element unidadesMedida = document.createElement("unidadesMedida");
	        	
	        	for (int i = 0; i < articulo.getUnidadesMedidas().size(); i++) {
	        		Element unidadMedida = document.createElement("unidadMedida");
	        		
	        		// Factor de conversión
	        		XMLDocumentUtils.appendChild(document, unidadMedida, "factorConversion", articulo.getUnidadMedida(i).getFactorConversion());
	        		
	        		// Descripción
	        		Element descripcion = document.createElement("descripcion");
	        		descripcion.setTextContent(articulo.getUnidadMedida(i).getUnidadMedida());
	        		unidadMedida.appendChild(descripcion);
	        		
	        		unidadesMedida.appendChild(unidadMedida);
				}
	        	
	        	articuloXML.appendChild(unidadesMedida);
	        }
	        // Descuento del proveedor
	        XMLDocumentUtils.appendChild(document, articuloXML, "dtoProveedor", articulo.getDtoProveedor());
	        
	        // Precios del artículo
	        XMLDocumentUtils.appendChild(document, articuloXML, "precioCosto", preciosArticuloTarifa.getPrecioCosto());
	        XMLDocumentUtils.appendChild(document, articuloXML, "precioVenta", preciosArticuloTarifa.getPrecioVenta());
	        XMLDocumentUtils.appendChild(document, articuloXML, "precioVentaConImpuestos", preciosArticuloTarifa.getPrecioVentaConImpuestos(datosSesion));
	        
			return articuloXML;
		}
		catch (ArticuloException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (ArticuloNotFoundException e) {
			throw new AyudaXMLException("El artículo introducido no existe");
		}
		catch (TarifaException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (ArticuloTarifaNotFoundException e) {
			throw new AyudaXMLException("El artículo introducido no existe para ninguna tarifa");
		}
	}
	
	private boolean esCodigoBarras(ArticuloBean articulo) {
		if(articulo.getCodigosBarras() != null && articulo.getCodigosBarras().size() > 0) {
			return true;
		}
		
		return false;
	}
	
	private boolean articuloTieneCodigoBarrasDun14(ArticuloBean articulo) {
		if(esCodigoBarras(articulo)) {
			if(articulo.getCodigoBarras(0).getDun14().equalsIgnoreCase("S")){
				return true;
			}
		}
		
		return false;
	}
}
