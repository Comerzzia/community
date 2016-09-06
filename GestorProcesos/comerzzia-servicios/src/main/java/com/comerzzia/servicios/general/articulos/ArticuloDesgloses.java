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

package com.comerzzia.servicios.general.articulos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean;

public class ArticuloDesgloses {

	protected String codArticulo;
	protected String desArticulo;
	protected List<String> desgloses2;
	protected Map<String, Map<String, Boolean>> desgloses1;
	protected boolean desglose1Activo;
	protected boolean desglose2Activo;

	public ArticuloDesgloses(){
		desgloses2 = new ArrayList<String>();
		desgloses1 = new HashMap<String, Map<String,Boolean>>();
	}
	
	public String getCodArticulo() {
		return codArticulo;
	}
	
	public void setCodArticulo(String codArticulo) {
		this.codArticulo = codArticulo;
	}
	
	public String getDesArticulo() {
		return desArticulo;
	}
	
	public void setDesArticulo(String desArticulo) {
		this.desArticulo = desArticulo;
	}
	
	public List<String> getDesgloses2() {
		return desgloses2;
	}
	
	public List<String> getDesgloses1(){
		return new ArrayList<String>(desgloses1.keySet());
	}
	
	public void setDesgloses(List<CodigoBarrasArticuloBean> codigosBarras){
		desglose1Activo = false;
		desglose2Activo = false;
		if (!codigosBarras.isEmpty() && !codigosBarras.get(0).getDesglose1().equals("*")) {
			desglose1Activo = true;
		}
		if (!codigosBarras.isEmpty() && !codigosBarras.get(0).getDesglose2().equals("*")) {
			desglose2Activo = true;
		}
		for (CodigoBarrasArticuloBean codigo : codigosBarras) {
			String desglose1 = codigo.getDesglose1();
			String desglose2 = codigo.getDesglose2();
			Map<String, Boolean> submapa = desgloses1.get(desglose1);
			if (submapa == null){
				submapa = new HashMap<String, Boolean>();
				desgloses1.put(desglose1, submapa);
			}
			submapa.put(desglose2, true);
			if (!desgloses2.contains(desglose2)){
				desgloses2.add(desglose2);
			}
		}
	}
	
	public Map<String, Map<String,Boolean>> getDesgloses(){
		return desgloses1;
	}

	public boolean isDesglose1Activo() {
		return desglose1Activo;
	}

	public boolean isDesglose2Activo() {
		return desglose2Activo;
	}
	
}
