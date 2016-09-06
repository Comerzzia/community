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

package com.comerzzia.servicios.almacenes.regularizaciones;

import java.util.Date;

import com.comerzzia.persistencia.almacenes.regularizaciones.RegularizacionBean;
import com.comerzzia.persistencia.general.conceptoalmacenes.ConceptoAlmacenBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.conceptoalmacenes.ServicioConceptoAlmacenes;
import com.comerzzia.util.base.MantenimientoBean;

public class Regularizacion extends MantenimientoBean {

	/**
	 * Serial Version UID.
	 */
	private static final long serialVersionUID = -2560639644835161702L;

	protected RegularizacionBean regularizacion;

	ConceptoAlmacenBean conceptoAlmacen = null;

	public Regularizacion() {
		RegularizacionBean regularizacion = new RegularizacionBean();
		this.regularizacion = regularizacion;
	}

	public Regularizacion(RegularizacionBean regularizacion) {
		this.regularizacion = regularizacion;
	}

	@Override
	protected void initNuevoBean() {

	}

	protected RegularizacionBean getBean() {
		return regularizacion;
	}

	public String getActivo() {
		return regularizacion.getActivo();
	}

	@Override
	public int getEstadoBean() {
		return regularizacion.getEstadoBean();
	}

	@Override
	public boolean isActivo() {
		return regularizacion.isActivo();
	}

	@Override
	public boolean isEnEdicion() {
		return regularizacion.isEnEdicion();
	}

	@Override
	public boolean isEstadoBorrado() {
		return regularizacion.isEstadoBorrado();
	}

	@Override
	public boolean isEstadoNuevo() {
		return regularizacion.isEstadoNuevo();
	}

	@Override
	public void setActivo(boolean activo) {
		regularizacion.setActivo(activo);
	}

	@Override
	public void setActivo(String activo) {
		regularizacion.setActivo(activo);
	}

	@Override
	public void setEnEdicion(boolean enEdicion) {
		regularizacion.setEnEdicion(enEdicion);
	}

	@Override
	public void setEstadoBean(int estadoBean) {
		regularizacion.setEstadoBean(estadoBean);
	}

	public Long getIdRegularizacion() {
		return regularizacion.getIdRegularizacion();
	}

	public void setIdRegularizacion(Long idRegularizacion) {
		regularizacion.setIdRegularizacion(idRegularizacion);
	}

	public String getCodAlmacen() {
		return regularizacion.getCodAlmacen();
	}

	public void setCodAlmacen(String codAlm) {
		regularizacion.setCodAlmacen(codAlm);
	}

	public Date getFecha() {
		return regularizacion.getFecha();
	}

	public void setFecha(Date fecha) {
		regularizacion.setFecha(fecha);
	}

	public String getCodAplicacion() {
		return regularizacion.getCodAplicacion();
	}

	public void setCodAplicacion(String codAplicacion) {
		regularizacion.setCodAplicacion(codAplicacion);
	}

	public String getCodConceptoAlmacen() {
		return regularizacion.getCodConceptoAlmacen();
	}

	public void setCodConceptoAlmacen(String codConAlm) {
		regularizacion.setCodConceptoAlmacen(codConAlm);
	}

	public String getCodArticulo() {
		return regularizacion.getCodArticulo();
	}

	public void setCodArticulo(String codArt) {
		regularizacion.setCodArticulo(codArt);
	}

	public String getDesglose1() {
		return regularizacion.getDesglose1();
	}

	public void setDesglose1(String desglose1) {
		regularizacion.setDesglose1(desglose1);
	}

	public String getDesglose2() {
		return regularizacion.getDesglose2();
	}

	public void setDesglose2(String desglose2) {
		regularizacion.setDesglose2(desglose2);
	}

	public String getUnidadMedida() {
		return regularizacion.getUnidadMedida();
	}

	public void setUnidadMedida(String unidadMedida) {
		regularizacion.setUnidadMedida(unidadMedida);
	}

	public String getObservaciones() {
		return regularizacion.getObservaciones();
	}

	public void setObservaciones(String observaciones) {
		regularizacion.setObservaciones(observaciones);
	}

	public Double getCantidadMedida() {
		return regularizacion.getCantidadMedida();
	}

	public void setCantidadMedida(Double cantidadMedida) {
		regularizacion.setCantidadMedida(cantidadMedida);
	}

	public Double getCantidad() {
		return regularizacion.getCantidad();
	}

	public void setCantidad(Double cantidad) {
		regularizacion.setCantidad(cantidad);
	}

	public Double getPrecio() {
		return regularizacion.getPrecio();
	}

	public void setPrecio(Double precio) {
		regularizacion.setPrecio(precio);
	}

	public Double getImporte() {
		return regularizacion.getImporte();
	}

	public void setImporte(Double importe) {
		regularizacion.setImporte(importe);
	}

	public Long getIdUsuario() {
		return regularizacion.getIdUsuario();
	}

	public void setIdUsuario(Long idUsuario) {
		regularizacion.setIdUsuario(idUsuario);
	}

	public String getDesArticulo() {
		return regularizacion.getDesArticulo();
	}

	public void setDesArticulo(String desArt) {
		regularizacion.setDesArticulo(desArt);
	}

	public String getDesAlmacen() {
		return regularizacion.getDesAlmacen();
	}

	public void setDesAlmacen(String desAlm) {
		regularizacion.setDesAlmacen(desAlm);
	}

	public String getDesConceptoAlmacen() {
		return regularizacion.getDesConceptoAlmacen();
	}

	public void setDesConceptoAlmacen(String desConAlm) {
		regularizacion.setDesConceptoAlmacen(desConAlm);
	}

	public ConceptoAlmacenBean getConceptoAlmacen(DatosSesionBean datosSesion)
			throws RegularizacionException {
		if (conceptoAlmacen == null) {
			try {
				return ServicioConceptoAlmacenes.consultar(regularizacion
						.getCodAplicacion(), regularizacion
						.getCodConceptoAlmacen(), datosSesion);
			} catch (Exception e) {
				throw new RegularizacionException(e.getMessage(), e);
			}
		} else {
			return conceptoAlmacen;
		}
	}

	public ConceptoAlmacenBean getConceptoAlmacenParaTienda(
			DatosSesionBean datosSesion) throws RegularizacionException {
		if (conceptoAlmacen == null) {
			try {
				return ServicioConceptoAlmacenes.consultarParaTienda(
						regularizacion.getCodAplicacion(), regularizacion
								.getCodConceptoAlmacen(), true, datosSesion);
			} catch (Exception e) {
				throw new RegularizacionException(e.getMessage(), e);
			}
		} else {
			return conceptoAlmacen;
		}
	}
}
