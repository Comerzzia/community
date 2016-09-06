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

package com.comerzzia.persistencia.ventas.facturas;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.persistencia.ventas.facturas.detalle.DetalleFacturaVentaBean;
import com.comerzzia.persistencia.ventas.facturas.pagos.PagoFacturaVentaBean;
import com.comerzzia.persistencia.ventas.facturas.vencimientos.VencimientoFacturaVentaBean;
import com.comerzzia.util.base.MantenimientoBean;

public class FacturaVentaBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -5823879496827014993L;
	
	private Long idFacturaRep;
	private String codEmpresa;
	private Short periodo;
	private String codSerie;
	private String desSerie;
	private Long numFactura;
	private String referencia;
	private Date fecha;
	private String codCliente;
	private String desCliente;
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
	
	//Detalles
	private boolean detallesFacturaCargados = false;
	private List<DetalleFacturaVentaBean> detallesFactura;
	
	private ImpuestosBean detalleImpuestos;
	private boolean detalleImpuestosCargados = false;
	
	private List<PagoFacturaVentaBean> mediosPago;
	private boolean mediosPagoCargados = false;;
	
	//Vencimientos
	private boolean vencimientosCargados = false;
	private List<VencimientoFacturaVentaBean> vencimientos;

	protected void initNuevoBean() {
		detallesFactura = new ArrayList<DetalleFacturaVentaBean>();
		this.detallesFacturaCargados = true;
	}

	public Long getIdFacturaRep() {
		return idFacturaRep;
	}

	public void setIdFacturaRep(Long idFacturaRep) {
		this.idFacturaRep = idFacturaRep;
	}

	public String getCodEmpresa() {
		return codEmpresa;
	}

	public void setCodEmpresa(String codEmp) {
		this.codEmpresa = codEmp;
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

	public void setNumFactura(Long numFac) {
		this.numFactura = numFac;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCli) {
		this.codCliente = codCli;
	}

	public String getDesCliente() {
		return desCliente;
	}

	public void setDesCliente(String desCli) {
		this.desCliente = desCli;
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

	// ******** DETALLES ******** //
	
	public boolean isDetallesFacturaCargados() {
		return detallesFacturaCargados;
	}

	public void setDetallesFacturaCargados(boolean detallesFacturaCargados) {
		this.detallesFacturaCargados = detallesFacturaCargados;
	}

	public List<DetalleFacturaVentaBean> getDetallesFactura() {
		return detallesFactura;
	}

	public void setDetallesFactura(List<DetalleFacturaVentaBean> detallesFactura) {
		this.detallesFactura = detallesFactura;
	}

	public int getNumDetalles() {
        return detallesFactura.size();
    }   
    
    public DetalleFacturaVentaBean getDetalle(int indice) {
        return (DetalleFacturaVentaBean) detallesFactura.get(indice);
    }   

	public void addDetalle(DetalleFacturaVentaBean detalle) {
    	detallesFactura.add(detalle);
    }    
    
    // ******** IMPUESTOS ******** //
    
    public ImpuestosBean getDetalleImpuestos() {
		return detalleImpuestos;
	}

	public void setDetalleImpuestos(ImpuestosBean detalleImpuestos) {
		this.detalleImpuestos = detalleImpuestos;
	}

	public boolean isDetalleImpuestosCargados() {
		return detalleImpuestosCargados;
	}

	public void setDetalleImpuestosCargados(boolean detalleImpuestosCargados) {
		this.detalleImpuestosCargados = detalleImpuestosCargados;
	}

	 // ******** MEDIOS DE PAGO ******** //
	
	public List<PagoFacturaVentaBean> getMediosPago() {
		return mediosPago;
	}

	public void setMediosPago(List<PagoFacturaVentaBean> mediosPago) {
		this.mediosPago = mediosPago;
	}

	public boolean isMediosPagoCargados() {
		return mediosPagoCargados;
	}

	public void setMediosPagoCargados(boolean mediosPagoCargados) {
		this.mediosPagoCargados = mediosPagoCargados;
	}
	
    public void addMedioPago(PagoFacturaVentaBean medioPago) {
    	mediosPago.add(medioPago);
    }    

    // ******** VENCIMIENTOS ******** //
	public boolean isVencimientosCargados() {
		return vencimientosCargados;
	}

	public void setVencimientosCargados(boolean vencimientosCargados) {
		this.vencimientosCargados = vencimientosCargados;
	}

	public List<VencimientoFacturaVentaBean> getVencimientos() {
		return vencimientos;
	}

	public void setVencimientos(List<VencimientoFacturaVentaBean> vencimientos) {
		this.vencimientos = vencimientos;
	}
	
	public int getNumVencimientos() {
        return vencimientos.size();
    }   
    
    public VencimientoFacturaVentaBean getVencimiento(int indice) {
        return (VencimientoFacturaVentaBean) vencimientos.get(indice);
    }  

    public void addVencimiento(VencimientoFacturaVentaBean vencimiento) {
    	vencimientos.add(vencimiento);
    }    

    public void addDetalleFactura(DetalleFacturaVentaBean detalleFactura) {
    	detallesFactura.add(detalleFactura);
    }    

}
