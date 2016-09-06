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

package com.comerzzia.persistencia.general.mediospago;

import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.general.mediospago.vencimientos.VencimientoBean;
import com.comerzzia.util.base.MantenimientoBean;

public class MedioPagoBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1645910587482065530L;

	private String codMedioPago;
	private String desMedioPago;
	private boolean contado;
	private boolean efectivo;
	private boolean tarjetaCredito;
	private String codTipoEfecto;
	private String desTipoEfecto;
	private boolean visibleVenta;
	private boolean visibleTiendaVirtual;
	private boolean visibleCompra;
	
	private boolean vencimientosCargados;
	private List<VencimientoBean> vencimientos;
	
	protected void initNuevoBean() {
		this.vencimientosCargados = false;
		this.vencimientos = new ArrayList<VencimientoBean>();
	}

	public String getCodMedioPago() {
		return codMedioPago;
	}

	public void setCodMedioPago(String codMedioPago) {
		this.codMedioPago = codMedioPago;
	}

	public String getDesMedioPago() {
		return desMedioPago;
	}

	public void setDesMedioPago(String desMedioPago) {
		this.desMedioPago = desMedioPago;
	}

	public String getContado() {
		return (contado) ? TRUE : FALSE;
	}
	
	public boolean isContado() {
		return contado;
	}

	public void setContado(boolean contado) {
		this.contado = contado;
	}
	
	public void setContado(String contado) {
		this.contado = contado.equals(TRUE);
	}		

	public String getEfectivo() {
		return (efectivo) ? TRUE : FALSE;
	}
	
	public boolean isEfectivo() {
		return efectivo;
	}

	public void setEfectivo(boolean efectivo) {
		this.efectivo = efectivo;
	}
	
	public void setEfectivo(String efectivo) {
		this.efectivo = efectivo.equals(TRUE);
	}	

	public String getTarjetaCredito() {
		return (tarjetaCredito) ? TRUE : FALSE;
	}
	
	public boolean isTarjetaCredito() {
		return tarjetaCredito;
	}

	public void setTarjetaCredito(boolean tarjetaCredito) {
		this.tarjetaCredito = tarjetaCredito;
	}
	
	public void setTarjetaCredito(String tarjetaCredito) {
		this.tarjetaCredito = tarjetaCredito.equals(TRUE);
	}	

	public String getCodTipoEfecto() {
		return codTipoEfecto;
	}

	public void setCodTipoEfecto(String codTipoEfecto) {
		this.codTipoEfecto = codTipoEfecto;
	}

	public String getDesTipoEfecto() {
		return desTipoEfecto;
	}

	public void setDesTipoEfecto(String desTipoEfecto) {
		this.desTipoEfecto = desTipoEfecto;
	}

	public boolean isVisibleVenta() {
		return visibleVenta;
	}

	public void setVisibleVenta(boolean visibleVenta) {
		this.visibleVenta = visibleVenta;
	}
	
	public String getVisibleVenta() {
		return (visibleVenta) ? TRUE : FALSE;
	}
	
	public void setVisibleVenta(String visibleVenta) {
		this.visibleVenta = visibleVenta.equals(TRUE);
	}		

	public boolean isVisibleTiendaVirtual() {
		return visibleTiendaVirtual;
	}

	public void setVisibleTiendaVirtual(boolean visibleTiendaVirtual) {
		this.visibleTiendaVirtual = visibleTiendaVirtual;
	}
	
	public String getVisibleTiendaVirtual() {
		return (visibleTiendaVirtual) ? TRUE : FALSE;
	}
	
	public void setVisibleTiendaVirtual(String visibleTiendaVirtual) {
		this.visibleTiendaVirtual = visibleTiendaVirtual.equals(TRUE);
	}	

	public boolean isVisibleCompra() {
		return visibleCompra;
	}

	public void setVisibleCompra(boolean visibleCompra) {
		this.visibleCompra = visibleCompra;
	}
	
	public String getVisibleCompra() {
		return (visibleCompra) ? TRUE : FALSE;
	}
	
	public void setVisibleCompra(String visibleCompra) {
		this.visibleCompra = visibleCompra.equals(TRUE);
	}

	// ******** VENCIMIENTOS ******** //
	public boolean isVencimientosCargados() {
		return vencimientosCargados;
	}

	public void setVencimientosCargados(boolean vencimientosCargados) {
		this.vencimientosCargados = vencimientosCargados;
	}

	public List<VencimientoBean> getVencimientos() {
		return vencimientos;
	}

	public void setVencimientos(List<VencimientoBean> vencimientos) {
		this.vencimientos = vencimientos;
	}	
	
	public int getNumVencimientos() {
        return vencimientos.size();
    }   
    
    public VencimientoBean getVencimiento(int indice) {
        return (VencimientoBean) vencimientos.get(indice);
    }   
    
    public void addVencimiento(VencimientoBean vencimiento) {
    	
    	if (vencimientos == null){
    		vencimientos = new ArrayList<VencimientoBean>();
    	}
    	
        vencimientos.add(vencimiento);
    }    
    
    public void deleteVencimiento(int indice) {
    	if(getVencimiento(indice).isEstadoNuevo()) {
			vencimientos.remove(indice);
		}
		else {
			this.getVencimiento(indice).borrar();
		}
    }	
    
    public String getContadoTexto(){
    	return this.isContado() ? "Sí" : "No";
    }
    
    public String getEfectivoTexto(){
    	return this.isEfectivo() ? "Sí" : "No";
    }
    
    public String getTarjetaCreditoTexto(){
    	return this.isTarjetaCredito() ? "Sí" : "No";
    }
}
