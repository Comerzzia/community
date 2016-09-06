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

package com.comerzzia.servicios.tiendavirtual.cesta;

import com.comerzzia.persistencia.tiendavirtual.articulos.ArticuloTiendaVirtualBean;
import com.comerzzia.util.numeros.Numero;

public class ArticuloCestaBean {

	protected Integer cantidad;
	protected ArticuloTiendaVirtualBean articulo;
	
	
	public Integer getCantidad() {
		return cantidad;
	}
	
	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	
	public ArticuloTiendaVirtualBean getArticulo() {
		return articulo;
	}
	
	public void setArticulo(ArticuloTiendaVirtualBean articulo) {
		this.articulo = articulo;
	}
	
	public void sumaCantidad(Integer incremento){
		this.cantidad += incremento;
	}
	
	public Double getImporte(){
		return articulo.getPrecioVentaConImpuestos() * cantidad;
	}

	public Double getImporteRedondeado(){
		Double importe = getImporte();
		return Numero.redondea(importe, 2);
	}
	
}
