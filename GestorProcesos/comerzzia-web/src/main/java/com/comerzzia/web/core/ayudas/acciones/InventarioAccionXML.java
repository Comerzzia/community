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

import com.comerzzia.persistencia.almacenes.regularizaciones.RegularizacionBean;
import com.comerzzia.persistencia.general.almacenes.articulos.AlmacenArticuloBean;
import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.servicios.almacenes.stocks.ServicioStocksAlmacenes;
import com.comerzzia.servicios.almacenes.stocks.StockAlmacenException;
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

public class InventarioAccionXML extends AccionXML {

	@Override
	public String getNombre() {
		return "inventario";
	}
	
	@Override
	public Element ejecutar(HttpServletRequest request, Document document) throws AyudaXMLException {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// Obtener el almacen
			String codAlmacen = request.getParameter("codAlmacen");
			
			// Obtener el articulo
			String codArticulo = request.getParameter("codArticulo");
			
			//Obtener desgloses
			String desglose1 = request.getParameter("desglose1");
			String desglose2 = request.getParameter("desglose2");
			
			// Obtener los datos del articulo
			ArticuloBean articulo = ServicioArticulos.consultarPorCodigo(codArticulo, datosSesion);
			
			// Construir el XML
	        Element articuloXML = document.createElement("articulo");        
	        XMLDocumentUtils.appendChild(document, articuloXML, "codArticulo", articulo.getCodArticulo());
	        XMLDocumentUtils.appendChild(document, articuloXML, "desArticulo", articulo.getDesArticulo());   
	        
	        // Si el artículo tiene definida UNIDAD_MEDIDA_ALTERNATIVA, sólo estará esta disponible
	        if(articulo.getUnidadMedAlt() != null && !articulo.getUnidadMedAlt().isEmpty()) {
	        	XMLDocumentUtils.appendChild(document, articuloXML, "unidadMedidaAlternativa", articulo.getUnidadMedAlt());
	        }
	        
	        //Si el artículo tiene código de barras Dun14 ponemos cantidad por defecto
	        if(articuloTieneCodigoBarrasDun14(articulo)){
				//Añadidos la cantidad
				XMLDocumentUtils.appendChild(document, articuloXML, "cantidadDun14", articulo.getCodigoBarras(0).getFactorConversion());
	        }
	        
	        // Si es un código de barras, enviar los valores de los desgloses
	        if(desglose1 == null && desglose2 == null){
		        desglose1 = "";
		        desglose2 = "";
		        
		        if(esCodigoBarras(articulo)) {
		        	desglose1 = articulo.getCodigoBarras(0).getDesglose1();
			        desglose2 = articulo.getCodigoBarras(0).getDesglose2();
		        }
		        else {
		        	if (!articulo.isDesglose1()) {
		        		desglose1 = "*";
		        	}
		        	
		        	if (!articulo.isDesglose2()) {
		        		desglose2 = "*";
		        	}
		        }
		        
		        XMLDocumentUtils.appendChild(document, articuloXML, "desglose1", desglose1);     	
	        	XMLDocumentUtils.appendChild(document, articuloXML, "desglose2", desglose2);
	        }
        	
        	RegularizacionBean regularizacion = new RegularizacionBean();
        	regularizacion.setCodAlmacen(codAlmacen);
        	regularizacion.setCodArticulo(codArticulo);
        	regularizacion.setDesglose1(desglose1);
        	regularizacion.setDesglose2(desglose2);
        	AlmacenArticuloBean almacenArticulo = ServicioStocksAlmacenes
        			.obtenerDetalleAlmacen(codAlmacen, regularizacion, datosSesion);
        	
	        if(almacenArticulo != null){
	        	XMLDocumentUtils.appendChild(document, articuloXML, "stockUMAlt", almacenArticulo.getStockUMA());
	        	XMLDocumentUtils.appendChild(document, articuloXML, "stockActual", almacenArticulo.getStock());
	        }else{
	        	XMLDocumentUtils.appendChild(document, articuloXML, "stockUMAlt", 0);
	        	XMLDocumentUtils.appendChild(document, articuloXML, "stockActual", 0);
	        }
	        
	        PreciosArticuloTarifaBean preciosArticuloTarifa = ServicioArticulosTarifas.obtenerPreciosArticuloTarifa(codArticulo, datosSesion);
	        XMLDocumentUtils.appendChild(document, articuloXML, "precio", preciosArticuloTarifa.getPrecioCosto());
	        
	        return articuloXML;
		}
		catch (TarifaException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (ArticuloTarifaNotFoundException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (StockAlmacenException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (ArticuloNotFoundException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (ArticuloException e) {
			throw new AyudaXMLException(e.getMessage(), e);
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
