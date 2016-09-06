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

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.persistencia.general.articulos.unidadesmedidas.UnidadMedidaArticuloBean;
import com.comerzzia.servicios.core.ayudas.AyudaXMLException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.ArticuloException;
import com.comerzzia.servicios.general.articulos.ArticuloNotFoundException;
import com.comerzzia.servicios.general.articulos.ServicioArticulos;
import com.comerzzia.servicios.general.articulos.unidadesmedidas.ServicioUnidadesMedidasArticulos;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.web.base.AccionXML;
import com.comerzzia.web.base.WebKeys;

public class ArticuloUnidadesMedidaAccionXML extends AccionXML {

	@Override
	public String getNombre() {
		return "articuloUM";
	}
	
	@Override
	public Element ejecutar(HttpServletRequest request, Document document) throws AyudaXMLException {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// TODO: Comtrolar sesión
			
			// Obtener el código
			String codArticulo = request.getParameter("codArticulo");
			
			// Obtener los datos del articulo
			ArticuloBean articulo = ServicioArticulos.consultar(codArticulo, datosSesion);
			
			// Construir el XML
	        Element articuloXML = document.createElement("articulo");        
	        XMLDocumentUtils.appendChild(document, articuloXML, "codArticulo", articulo.getCodArticulo());        
	        if(articulo.getUnidadMedAlt() != null && !articulo.getUnidadMedAlt().isEmpty()) {
	        	XMLDocumentUtils.appendChild(document, articuloXML, "unidadMedidaAlternativa", articulo.getUnidadMedAlt());
	        }
	        else {
	        	Element unidadesMedida = document.createElement("unidadesMedida");
	        	
	        	// Obtenemos las unidades de medida del artículo
				List<UnidadMedidaArticuloBean> listaUM = ServicioUnidadesMedidasArticulos
						.consultarUnidadesMedidas(codArticulo, datosSesion);
				
				for (UnidadMedidaArticuloBean um : listaUM) {
					Element unidadMedida = document.createElement("unidadMedida");
					XMLDocumentUtils.appendChild(document, unidadMedida, "factorConversion", um.getFactorConversion());
					XMLDocumentUtils.appendChild(document, unidadMedida, "descripcion", um.getUnidadMedida());
					
					unidadesMedida.appendChild(unidadMedida);
				}
				
				articuloXML.appendChild(unidadesMedida);
	        }
	        
	        return articuloXML;
		}
		catch (ArticuloNotFoundException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
		catch (ArticuloException e) {
			throw new AyudaXMLException(e.getMessage(), e);
		}
	}
}
