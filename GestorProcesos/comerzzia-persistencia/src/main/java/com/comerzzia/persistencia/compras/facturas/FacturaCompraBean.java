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

package com.comerzzia.persistencia.compras.facturas;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.compras.facturas.detalle.DetalleFacturaCompraBean;
import com.comerzzia.persistencia.compras.facturas.pagos.PagoFacturaCompraBean;
import com.comerzzia.persistencia.compras.facturas.vencimientos.VencimientoFacturaCompraBean;
import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.util.base.MantenimientoBean;

public class FacturaCompraBean extends MantenimientoBean  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3011521861348335335L;

	private Long idFacturaSop;
	private String codEmpresa;
	private Short periodo;
	private String codSerie;
	private String desSerie;
	private Long numFactura;
	private String referencia;
	private Date fechaRecFactura;
	private Date fechaFacturaProveedor;
	private String codProveedor;
	private String desProveedor;
	private String domicilio;
	private String poblacion;
	private String provincia;
	private String cp;
	private String cif;
	private Long idGrupoImpuestos;
	private Long idTratImpuestos;
	private String desTratImpuestos;
	private Long idVencimientoEnlace;
	private String concepto;
	private Double base;
	private Double impuestos;
	private Double total;
	private String observaciones;
	
	private List<DetalleFacturaCompraBean> detallesFactura;
	private boolean detallesFacturaCargados = false;
	
	private ImpuestosBean detalleImpuestos;
	private boolean detalleImpuestosCargados = false;
	
	private List<PagoFacturaCompraBean> mediosPago;
	private boolean mediosPagoCargados = false;;
	
	//Vencimientos
	private boolean vencimientosCargados = false;
	private List<VencimientoFacturaCompraBean> vencimientos;
	
	protected void initNuevoBean() {
		this.detallesFactura = new ArrayList<DetalleFacturaCompraBean>(); 
		this.detallesFacturaCargados = false;
		this.detalleImpuestos = new ImpuestosBean();
		this.detalleImpuestosCargados = false;
		this.mediosPagoCargados = false;
	}

	public Long getIdFacturaSop() {
		return idFacturaSop;
	}

	public void setIdFacturaSop(Long idFacturaSop) {
		this.idFacturaSop = idFacturaSop;
	}

	public String getCodEmpresa() {
		return codEmpresa;
	}

	public void setCodEmpresa(String codEmpresa) {
		this.codEmpresa = codEmpresa;
	}

	public Short getPeriodo() {
		return periodo;
	}

	public void setPeriodo(Short periodo) {
		this.periodo = periodo;
	}

	public String getCodSerie() {
		return codSerie;
	}

	public void setCodSerie(String codSerie) {
		this.codSerie = codSerie;
	}

	public String getDesSerie() {
		return desSerie;
	}

	public void setDesSerie(String desSerie) {
		this.desSerie = desSerie;
	}

	public Long getNumFactura() {
		return numFactura;
	}

	public void setNumFactura(Long numFactura) {
		this.numFactura = numFactura;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public Date getFechaRecFactura() {
		return fechaRecFactura;
	}

	public void setFechaRecFactura(Date fechaFactura) {
		this.fechaRecFactura = fechaFactura;
	}

	public Date getFechaFacturaProveedor() {
		return fechaFacturaProveedor;
	}

	public void setFechaFacturaProveedor(Date fechaFacturaProveedor) {
		this.fechaFacturaProveedor = fechaFacturaProveedor;
	}

	public String getCodProveedor() {
		return codProveedor;
	}

	public void setCodProveedor(String codProveedor) {
		this.codProveedor = codProveedor;
	}

	public String getDesProveedor() {
		return desProveedor;
	}

	public void setDesProveedor(String desProveedor) {
		this.desProveedor = desProveedor;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	public String getPoblacion() {
		return poblacion;
	}

	public void setPoblacion(String poblacion) {
		this.poblacion = poblacion;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getCp() {
		return cp;
	}

	public void setCp(String cp) {
		this.cp = cp;
	}

	public String getCif() {
		return cif;
	}

	public void setCif(String cif) {
		this.cif = cif;
	}

	public Long getIdGrupoImpuestos() {
		return idGrupoImpuestos;
	}

	public void setIdGrupoImpuestos(Long idGrupoImpuestos) {
		this.idGrupoImpuestos = idGrupoImpuestos;
	}

	public Long getIdTratImpuestos() {
		return idTratImpuestos;
	}

	public void setIdTratImpuestos(Long idTratImpuestos) {
		this.idTratImpuestos = idTratImpuestos;
	}

	public String getDesTratImpuestos() {
		return desTratImpuestos;
	}

	public void setDesTratImpuestos(String desTratImpuestos) {
		this.desTratImpuestos = desTratImpuestos;
	}

	public Long getIdVencimientoEnlace() {
		return idVencimientoEnlace;
	}

	public void setIdVencimientoEnlace(Long idVencimientoEnlace) {
		this.idVencimientoEnlace = idVencimientoEnlace;
	}

	public String getConcepto() {
		return concepto;
	}

	public void setConcepto(String concepto) {
		this.concepto = concepto;
	}

	public Double getBase() {
		return base;
	}

	public void setBase(Double base) {
		this.base = base;
	}

	public Double getImpuestos() {
		return impuestos;
	}

	public void setImpuestos(Double impuestos) {
		this.impuestos = impuestos;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public List<DetalleFacturaCompraBean> getDetallesFactura() {
		return detallesFactura;
	}

	public void setDetallesFactura(List<DetalleFacturaCompraBean> detallesFactura) {
		this.detallesFactura = detallesFactura;
	}
	
	public boolean isDetallesFacturaCargados() {
		return detallesFacturaCargados;
	}

	public void setDetallesFacturaCargados(boolean detallesFacturaCargados) {
		this.detallesFacturaCargados = detallesFacturaCargados;
	}

	public int getNumDetallesFactura() {
        return this.detallesFactura.size();
    }   
	
	public DetalleFacturaCompraBean getDetalleFactura(int indice) {
        return (DetalleFacturaCompraBean) detallesFactura.get(indice);
    }   
    
    public void addDetalleFactura(DetalleFacturaCompraBean detalleFactura) {
    	detallesFactura.add(detalleFactura);
    }    

	public ImpuestosBean getDetalleImpuestos() {
		return detalleImpuestos;
	}

	public void setDetalleImpuestos(ImpuestosBean detalleImpuestosAlbaranes) {
		this.detalleImpuestos = detalleImpuestosAlbaranes;
	}

	public boolean isDetalleImpuestosCargados() {
		return detalleImpuestosCargados;
	}

	public void setDetalleImpuestosCargados(boolean detalleImpuestosCargados) {
		this.detalleImpuestosCargados = detalleImpuestosCargados;
	}

	public List<PagoFacturaCompraBean> getMediosPago() {
		return mediosPago;
	}

	public void setMediosPago(List<PagoFacturaCompraBean> mediosPago) {
		this.mediosPago = mediosPago;
	}
	
	public boolean isMediosPagoCargados() {
		return mediosPagoCargados;
	}

	public void setMediosPagoCargados(boolean mediosPagoCargados) {
		this.mediosPagoCargados = mediosPagoCargados;
	}

	public int getNumMediosPago() {
        return this.mediosPago.size();
    }   
	
	public PagoFacturaCompraBean getMedioPago(int indice) {
        return (PagoFacturaCompraBean) mediosPago.get(indice);
    }   
    
    public void addMedioPago(PagoFacturaCompraBean medioPago) {
    	mediosPago.add(medioPago);
    }    

    // ******** VENCIMIENTOS ******** //
	public boolean isVencimientosCargados() {
		return vencimientosCargados;
	}

	public void setVencimientosCargados(boolean vencimientosCargados) {
		this.vencimientosCargados = vencimientosCargados;
	}

	public List<VencimientoFacturaCompraBean> getVencimientos() {
		return vencimientos;
	}

	public void setVencimientos(List<VencimientoFacturaCompraBean> vencimientos) {
		this.vencimientos = vencimientos;
	}
	
	public int getNumVencimientos() {
        return vencimientos.size();
    }   
    
    public VencimientoFacturaCompraBean getVencimiento(int indice) {
        return (VencimientoFacturaCompraBean) vencimientos.get(indice);
    }  

    public void addVencimiento(VencimientoFacturaCompraBean vencimiento) {
    	vencimientos.add(vencimiento);
    }    

}
