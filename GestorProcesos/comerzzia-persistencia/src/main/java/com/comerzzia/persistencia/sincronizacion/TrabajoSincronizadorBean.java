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

package com.comerzzia.persistencia.sincronizacion;

import java.util.Date;

import com.comerzzia.util.base.MantenimientoBean;

public class TrabajoSincronizadorBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7498747769579968980L;
	
	private static final byte PARADO = 0;
	private static final byte ARRANCADO = 1;
	private static final byte PAUSADO = 2;
	
	public static final byte ESTADO_OK = 0;
	public static final byte ESTADO_AVISO = 1;
	public static final byte ESTADO_ERROR = 2;
	
	private Long idTrabajo;
	private String trabajo;
	private String clase;
	private String codAlmacen;
	private String desAlmacen;
	private Byte estado;
	private Date fechaInicio;
	private String intervalo;
	private Date fechaProximaEjecucion;
	private Date fechaUltimaEjecucion;
	private Byte resultado;
	private String observaciones;
	
	protected void initNuevoBean() {
	}
	
	/**
	 * @return the idTrabajo
	 */
	public Long getIdTrabajo() {
		return idTrabajo;
	}
	
	/**
	 * @param idTrabajo the idTrabajo to set
	 */
	public void setIdTrabajo(Long idTrabajo) {
		this.idTrabajo = idTrabajo;
	}
	
	/**
	 * @return the trabajo
	 */
	public String getTrabajo() {
		return trabajo;
	}
	
	/**
	 * @param trabajo the trabajo to set
	 */
	public void setTrabajo(String trabajo) {
		this.trabajo = trabajo;
	}
	
	/**
	 * @return the clase
	 */
	public String getClase() {
		return clase;
	}
	
	/**
	 * @param clase the clase to set
	 */
	public void setClase(String clase) {
		this.clase = clase;
	}
	
	/**
	 * @return the codAlmacen
	 */
	public String getCodAlmacen() {
		return codAlmacen;
	}
	
	/**
	 * @param codAlmacen the codAlmacen to set
	 */
	public void setCodAlmacen(String codAlmacen) {
		this.codAlmacen = codAlmacen;
	}
	
	/**
	 * @return the desAlmacen
	 */
	public String getDesAlmacen() {
		return desAlmacen;
	}
	
	/**
	 * @param desAlmacen the desAlmacen to set
	 */
	public void setDesAlmacen(String desAlmacen) {
		this.desAlmacen = desAlmacen;
	}
	
	/**
	 * @return the estado
	 */
	public Byte getEstado() {
		return estado;
	}
	
	/**
	 * @param estado the estado to set
	 */
	protected void setEstado(Byte estado) {
		this.estado = estado;
	}
	
	
	public boolean isParado() {
		return (this.estado == PARADO);
	}
	
	
	public boolean isArrancado() {
		return (this.estado == ARRANCADO);
	}
	
	
	public boolean isPausado() {
		return (this.estado == PAUSADO);
	}
	
	
	public void parar() {
		// Borramos las fechas de inicio y próxima ejecución y establecemos el estado de parado
		this.fechaInicio = null;
		this.fechaProximaEjecucion = null;
		this.estado = PARADO;
	}
	
	
	public void arrancar() {
		// Esteblecemos el estado de arrancado
		this.estado = ARRANCADO;
	}

	
	public void pausar() {
		// Borramos la fecha de inicio y establecemos el estado de pausado
		this.fechaInicio = null;
		this.estado = PAUSADO;
	}

	/**
	 * @return the fechaInicio
	 */
	public Date getFechaInicio() {
		return fechaInicio;
	}

	/**
	 * @param fechaInicio the fechaInicio to set
	 */
	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	/**
	 * @return the intervalo
	 */
	public String getIntervalo() {
		return intervalo;
	}

	/**
	 * @param periodo the intervalo to set
	 */
	public void setIntervalo(String intervalo) {
		this.intervalo = intervalo;
	}
	
	public void setIntervalo(String cantidad, String medida, String dias) {
		this.intervalo = cantidad + " " + medida + " " + dias;
	}
	
	
	public boolean isPlanificado() {
		return (this.intervalo != null && !this.intervalo.isEmpty());
	}
	
	public String getPlanificacion() {
		String planificacion = null;
		
		if (isPlanificado()) {
			planificacion = "cada " + getCantidadIntervalo();
			
			String medida = getMedidaIntervalo();
			if (medida.equals("m")) {
				planificacion += " min.";
			}
			else if (medida.equals("h")) {
				planificacion += " hora(s)";
			}
			else if (medida.equals("d")) {
				planificacion += " dia(s)";
			}
			else {
				planificacion += medida;
			}
			
			String dias = getDiasIntervalo();
			if (dias != null) {
				planificacion += " [" + dias + "]";
			}
		}
		
		return planificacion;
	}
	
	public String getCantidadIntervalo() {
		String cantidad = null;
		
		if (isPlanificado()) {
			cantidad = intervalo.split(" ")[0];
		}
		
		return cantidad;
	}
	
	public String getMedidaIntervalo() {
		String medida = null;
		
		if (isPlanificado()) {
			medida = intervalo.split(" ")[1];
		}
		
		return medida;
	}
	
	public String getDiasIntervalo() {
		String dias = null;
		
		if (isPlanificado()) {
			String[] parse = intervalo.split(" ");
			if (parse.length > 2) {
				dias = parse[2];
			}
		}
		
		return dias;
	}

	/**
	 * @return the fechaProximaEjecucion
	 */
	public Date getFechaProximaEjecucion() {
		return fechaProximaEjecucion;
	}

	/**
	 * @param fechaProximaEjecución the fechaProximaEjecucion to set
	 */
	public void setFechaProximaEjecucion(Date fechaProximaEjecucion) {
		this.fechaProximaEjecucion = fechaProximaEjecucion;
	}

	/**
	 * @return the fechaUltimaEjecucion
	 */
	public Date getFechaUltimaEjecucion() {
		return fechaUltimaEjecucion;
	}
	

	/**
	 * @param fechaUltimaEjecucion the fechaUltimaEjecucion to set
	 */
	public void setFechaUltimaEjecucion(Date fechaUltimaEjecucion) {
		this.fechaUltimaEjecucion = fechaUltimaEjecucion;
	}

	/**
	 * @return the resultado
	 */
	public Byte getResultado() {
		return resultado;
	}

	/**
	 * @param resultado the resultado to set
	 */
	public void setResultado(Byte resultado) {
		this.resultado = resultado;
	}

	/**
	 * @return the observaciones
	 */
	public String getObservaciones() {
		return observaciones;
	}

	/**
	 * @param observaciones the observaciones to set
	 */
	public void setObservaciones(String observaciones) {
		if (observaciones != null && observaciones.length() > 254) {
			this.observaciones = observaciones.substring(0, 254);
		}
		else {
			this.observaciones = observaciones;
		}
	}
	
	
	public String getNombre() {
		return (this.trabajo + "_" + this.codAlmacen);
	}
	
	public boolean isMedidaMinutos(){
		if(getMedidaIntervalo() != null && getMedidaIntervalo().equals("m"))
			return true;
		else
			return false;
	}
	
	public boolean isMedidaHoras(){
		if(getMedidaIntervalo() != null && getMedidaIntervalo().equals("h"))
			return true;
		else
			return false;
	}

	public boolean isMedidaDias(){
		if(getMedidaIntervalo() != null && getMedidaIntervalo().equals("d"))
			return true;
		else
			return false;
	}
	
	public String getCantidadMinutos(){
		if(isMedidaMinutos())
			return getCantidadIntervalo();
		else
			return null;
	}
	
	public String getCantidadHoras(){
		if(isMedidaHoras())
			return getCantidadIntervalo();
		else
			return null;
	}
	
	public String getCantidadDias(){
		if(isMedidaDias())
			return getCantidadIntervalo();
		else
			return null;
	}
	
	public boolean isDiaLunes(){
		if(getDiasIntervalo() != null && getDiasIntervalo().contains("L"))
			return true;
		else
			return false;
	}
	
	public boolean isDiaMartes(){
		if(getDiasIntervalo() != null && getDiasIntervalo().contains("M"))
			return true;
		else
			return false;
	}
	
	public boolean isDiaMiercoles(){
		if(getDiasIntervalo() != null && getDiasIntervalo().contains("X"))
			return true;
		else
			return false;
	}
	
	public boolean isDiaJueves(){
		if(getDiasIntervalo() != null && getDiasIntervalo().contains("J"))
			return true;
		else
			return false;
	}
	
	public boolean isDiaViernes(){
		if(getDiasIntervalo() != null && getDiasIntervalo().contains("V"))
			return true;
		else
			return false;
	}
	
	public boolean isDiaSabado(){
		if(getDiasIntervalo() != null && getDiasIntervalo().contains("S"))
			return true;
		else
			return false;
	}
	
	public boolean isDiaDomingo(){
		if(getDiasIntervalo() != null && getDiasIntervalo().contains("D"))
			return true;
		else
			return false;
	}
}
