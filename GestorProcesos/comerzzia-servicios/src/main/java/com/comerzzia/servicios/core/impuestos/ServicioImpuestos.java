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

package com.comerzzia.servicios.core.impuestos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.comerzzia.persistencia.core.impuestos.ILineaDocumento;
import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.ImpuestoException;
import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajeImpuestoBean;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajeImpuestoException;
import com.comerzzia.servicios.core.impuestos.porcentajes.PorcentajesImpuestosBean;
import com.comerzzia.servicios.core.impuestos.porcentajes.ServicioPorcentajesImpuestos;
import com.comerzzia.util.log.Logger;


public class ServicioImpuestos {
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioImpuestos.class);
			

	public static ImpuestosBean calcularImpuestos(Long idGrupoImpuesto, Long idTratamientoImpuestos, 
			List<ILineaDocumento> lineas) throws ImpuestoException {
		
		try {
			// Obtenemos los porcentajes por código de impuesto del grupo y tratamiento de impuesto
			PorcentajesImpuestosBean porcentajes = ServicioPorcentajesImpuestos.consultar(idGrupoImpuesto, idTratamientoImpuestos);
			
			// calculamos los impuestos para la línea
			return calcularImpuestos(porcentajes, lineas);
		} 
		catch (PorcentajeImpuestoException e) {
			log.error("calcularImpuestos() - " + e.getMessage());
			String mensaje = "Error al calcular impuestos: " +  e.getMessage();
			throw new ImpuestoException(mensaje, e);
		}
	}
	
	
	public static ImpuestosBean calcularImpuestos(PorcentajesImpuestosBean porcentajesImpuestos, 
			List<ILineaDocumento> lineas) throws ImpuestoException {

		// Colección de impuestos por código de impuesto
		Map<String, ImpuestoBean> impuestos = new HashMap<String, ImpuestoBean>();
		
		// Sumamos las bases por código de impuesto
		for (ILineaDocumento linea : lineas) {
			String codImpuesto = linea.getCodImpuesto();
			ImpuestoBean impuesto = impuestos.get(codImpuesto);
			
			if (impuesto == null) {
				impuesto = new ImpuestoBean(codImpuesto);
				impuestos.put(codImpuesto, impuesto);
			}
			
			impuesto.addBase(linea.getImporte());
		}
		
		// Calculamos el importe del impuesto de cada código de impuesto
		for (ImpuestoBean impuesto : impuestos.values()) {
			PorcentajeImpuestoBean porcentaje = porcentajesImpuestos.getPorcentaje(impuesto.getCodImpuesto());
			
			if (porcentaje == null) {
				String msg = "No se han definido porcentaje para el código de impuesto " + impuesto.getCodImpuesto() 
						+ " en el grupo de impuestos " + porcentajesImpuestos.getIdGrupoImpuestos()
						+ " para el tratamiento " + porcentajesImpuestos.getIdTratatamientoImpuestos();
				log.error(msg);
					
				throw new ImpuestoException(msg);
			}
			
			double importeImpuesto = (impuesto.getBase() * porcentaje.getPorcentaje() / 100) 
					+ impuesto.getBase() * porcentaje.getPorcentajeRecargo() / 100;
			
			// Establecemos el importe del impuesto
			impuesto.setImpuestos(importeImpuesto);
		}
		
		return new ImpuestosBean(new ArrayList<ImpuestoBean>(impuestos.values()));
	}

	
	public static ImpuestosBean calcularImpuesto(PorcentajesImpuestosBean porcentajesImpuestos, ILineaDocumento linea) throws ImpuestoException {
		// Colección de impuestos por código de impuesto
		Map<String, ImpuestoBean> impuestos = new HashMap<String, ImpuestoBean>();
		
		String codImpuesto = linea.getCodImpuesto();
		ImpuestoBean impuesto = impuestos.get(codImpuesto);
		
		if (impuesto == null) {
			impuesto = new ImpuestoBean(codImpuesto);
			impuestos.put(codImpuesto, impuesto);
		}
		
		impuesto.addBase(linea.getImporte());
		
		// Calculamos el importe del impuesto
		PorcentajeImpuestoBean porcentaje = porcentajesImpuestos.getPorcentaje(impuesto.getCodImpuesto());
			
		if (porcentaje == null) {
			String msg = "No se han definido porcentaje para el código de impuesto " + impuesto.getCodImpuesto() 
					+ " en el grupo de impuestos " + porcentajesImpuestos.getIdGrupoImpuestos()
					+ " para el tratamiento " + porcentajesImpuestos.getIdTratatamientoImpuestos();
			log.error(msg);
				
			throw new ImpuestoException(msg);
		}
			
		double importeImpuesto = (impuesto.getBase() * porcentaje.getPorcentaje() / 100) 
				+ impuesto.getBase() * porcentaje.getPorcentajeRecargo() / 100;
			
		// Establecemos el importe del impuesto
		impuesto.setImpuestos(importeImpuesto);
		
		return new ImpuestosBean(new ArrayList<ImpuestoBean>(impuestos.values()));
	}

}
