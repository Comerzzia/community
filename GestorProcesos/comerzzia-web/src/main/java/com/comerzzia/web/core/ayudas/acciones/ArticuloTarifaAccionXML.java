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
import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
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
import com.comerzzia.servicios.ventas.tarifas.articulos.ArticuloTarifaNotFoundException;
import com.comerzzia.servicios.ventas.tarifas.articulos.ServicioArticulosTarifas;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.web.base.AccionXML;
import com.comerzzia.web.base.WebKeys;

public class ArticuloTarifaAccionXML extends AccionXML {

	@Override
	public String getNombre() {
		return "articulo.tarifa";
	}

	@Override
	/** Consulta para un artículo su porcentaje de impuesto. Este porcentaje se obtiene indicando su idTratImpuestos y su
	 * idGrupoImpuesto, o un codTarifa para consultar los dos anteriores. También es necesario el codImpuesto del artículo. 
	 * Si este no se indica, consultaremos el artículo a partir de su código y obtendremos también su descripción. 
	 * Por último, consultaremos el precio de costo del artículo en la tarifa general. Si existe, lo devolvemos junto con el
	 * porcentaje y la descripción, si la hemos consultado.
	 * Parámetros de entrada:
	 * - codArticulo (o codImpuesto)
	 * - codTarifa (o idGrupoImpuesto y idTratImpuesto)
	 * Parámetros devueltos:
	 * - codImpuesto
	 * - idGrupoImpuesto
	 * - idTratImpuestos
	 * - porcentajeImpuestos
	 * - codArticulo (opcional)
	 * - precioCosto (opcional)
	 * - desArticulo (opcional)
	 */
	public Element ejecutar(HttpServletRequest request, Document document) throws AyudaXMLException {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Resultados
			String desArticulo = null;
			Double precioCosto = null;
			Double porcentaje = null;
			
			// Obtenemos parámetros
			String codArticulo, codTarifa, codImpuesto;
			Long idGrupoImpuesto = null;
			Long idTratImpuestos = null;
			
			codArticulo = request.getParameter("codArticulo");
			codTarifa = request.getParameter("codTarifa");
			codImpuesto = request.getParameter("codImpuesto");
			idGrupoImpuesto = Numero.desformateaLong(request.getParameter("idGrupoImpuesto"), null);
			idTratImpuestos = Numero.desformateaLong(request.getParameter("idTratImpuestos"), null);

			// comprobamos que los parámetros son suficientes
			if ((codArticulo == null && codImpuesto == null) || (codTarifa == null && (idTratImpuestos == null || idGrupoImpuesto == null))){
				throw new AyudaXMLException("Los parámetros indicados son insuficientes o incorrectos para poder realizar la consulta.");
			}
			
			// si no nos han indicado código de impuesto, lo consultamos
			if (codImpuesto == null){
				ArticuloBean articulo = ServicioArticulos.consultar(codArticulo, datosSesion);
				codImpuesto = articulo.getCodImpuesto();
				desArticulo = articulo.getDesArticulo(); // sólo devolvemos descripción si tenemos que consultar el artículo
			}
			
			// si no nos han indicado el grupo o el tratamiento de impuesto, lo consultamos de la tarifa
			if (idGrupoImpuesto == null || idTratImpuestos == null){
				TarifaBean tarifa = ServicioTarifas.consultar(codTarifa, datosSesion);
				idGrupoImpuesto = tarifa.getIdGrupoImpuesto();
				idTratImpuestos = tarifa.getIdTratImpuestos();
			}
			
			// consultamos los porcentajes de impuestos para el grupo y el tratamiento de impuestos
			PorcentajesImpuestosBean porcentajes = ServicioPorcentajesImpuestos.consultar(idGrupoImpuesto, idTratImpuestos);

			// obtenemos porcentaje para el código de impuesto del artículo
			if (porcentajes.getPorcentaje(codImpuesto) == null){
				throw new AyudaXMLException("No existe un porcentaje de impuesto definido para el tipo de impuesto y la tarifa indicada.");
			}
			porcentaje = porcentajes.getPorcentaje(codImpuesto).getPorcentaje();
			
			try{ // consultamos precio de costo del artículo en la tarifa general si nos han proporcionado el codArticulo
				if (codArticulo != null){
					ArticuloTarifaBean articuloTarifa = ServicioArticulosTarifas.consultarArticuloTarifa(TarifaBean.TARIFA_GENERAL, codArticulo, datosSesion);
					precioCosto = articuloTarifa.getPrecioCosto();
				}
			}
			catch(ArticuloTarifaNotFoundException e){
				// el artículo no está registrado en la tarifa general, no devolvemos precio costo
			}
			
			// Construir el XML
	        Element articuloXML = document.createElement("articulo");        
	        if (codArticulo != null){
	        	XMLDocumentUtils.appendChild(document, articuloXML, "codArticulo", codArticulo);
	        }
	        if (desArticulo != null){
	        	XMLDocumentUtils.appendChild(document, articuloXML, "desArticulo", desArticulo);
	        }
	        if (precioCosto!=null){
	        	XMLDocumentUtils.appendChild(document, articuloXML, "precioCosto", precioCosto);
	        }
	        XMLDocumentUtils.appendChild(document, articuloXML, "idGrupoImpuesto", idGrupoImpuesto);
	        XMLDocumentUtils.appendChild(document, articuloXML, "idTratImpuestos", idTratImpuestos);
	        XMLDocumentUtils.appendChild(document, articuloXML, "codImpuesto", codImpuesto);
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
