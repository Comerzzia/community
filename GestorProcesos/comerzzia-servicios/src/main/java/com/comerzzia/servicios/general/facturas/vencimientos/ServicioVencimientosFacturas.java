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

package com.comerzzia.servicios.general.facturas.vencimientos;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.general.facturas.vencimientos.VencimientoFacturaBean;
import com.comerzzia.persistencia.general.facturas.vencimientos.VencimientoFacturaException;
import com.comerzzia.persistencia.general.mediospago.vencimientos.VencimientoBean;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;

public class ServicioVencimientosFacturas {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioVencimientosFacturas.class);

	/**
	 * Genera los vencimientos para un vencimiento y un importe dado.
	 * @param vencimiento
	 * @param importe
	 * @return List<VencimientoFacturaBean>
	 * @throws VencimientoFacturaException
	 */
	public static List<VencimientoFacturaBean> generarVencimientos(VencimientoBean vencimiento, Double importe, Date fechaFacturacion) throws VencimientoFacturaException{
		VencimientoFacturaBean vencimientoFactura;
		List<VencimientoFacturaBean> lstVencimientosFactura = new ArrayList<VencimientoFacturaBean>();
		
		try{
			//Instanciamos la fecha de facturación con los días de cadencia
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(fechaFacturacion);
			
			// sumar al calendario los dias de cadencia sobre la fecha de factura (naturales=suma de dias, no naturales=meses completos)
			if(vencimiento.isNaturales()){
				calendar.add(Calendar.DAY_OF_YEAR, vencimiento.getDiasCadencia().intValue());
			}
			else{
				calendar.add(Calendar.MONTH, + (vencimiento.getDiasCadencia().intValue()/30));
			}
			
			// importe individual de cada vencimiento
			Double importeVencimiento = Numero.redondea(importe/vencimiento.getNumeroVencimientos(), 2);
			
			// primer vencimiento con la cadencia agregada
			vencimientoFactura = new VencimientoFacturaBean();
			vencimientoFactura.setImporte(importeVencimiento);
			vencimientoFactura.setFechaVencimiento(calendar.getTime());
			lstVencimientosFactura.add(vencimientoFactura);

			// siguientes vencimientos
			for (int i = 2; i <= vencimiento.getNumeroVencimientos(); i++) {
				vencimientoFactura = new VencimientoFacturaBean();
				
				// sumar al calendario los dias entre vencimientos (naturales=suma de dias, no naturales=meses completos)
				if(vencimiento.isNaturales()){
					calendar.add(Calendar.DAY_OF_YEAR, vencimiento.getDiasEntreVencimientos().intValue());
				}
				else {
					calendar.add(Calendar.MONTH, + (vencimiento.getDiasEntreVencimientos().intValue()/30));
				}
												
				// en el ultimo vencimiento se cuadra el importe con el total por si la division daba decimales
				if(i == vencimiento.getNumeroVencimientos()){
					importeVencimiento += (importe - (Numero.redondea(importeVencimiento * vencimiento.getNumeroVencimientos(), 2)));
				}				
				
				// asignar fecha e importe del vencimiento
				vencimientoFactura.setFechaVencimiento(calendar.getTime());				
				vencimientoFactura.setImporte(importeVencimiento);
				
				lstVencimientosFactura.add(vencimientoFactura);
			}
			
			return lstVencimientosFactura;			
		}
		catch (Exception e) {
			String mensaje = "Error generando vencimientos: " +  e.getMessage();
			
			throw new VencimientoFacturaException(mensaje, e);
		}
	}

}
