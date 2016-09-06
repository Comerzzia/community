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

package com.comerzzia.web.ventas.tarifas.actualizaciones.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.tarifas.ParametrosAsistenteTarifaBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ActualizacionTarifaException;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ServicioActualizacionesTarifas;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.articulos.ArticuloActualizacionConstraintViolationException;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.articulos.ArticuloActualizacionException;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class AsistenteActualizacionAccion extends Accion {

	private static final Vista NEXT_PAGE_PASO1 = new Vista("ventas/tarifas/actualizaciones/actualizacionMasiva/jsp/asistActPaso1.jsp", Vista.INTERNA);
	private static final Vista NEXT_PAGE_PASO2 = new Vista("ventas/tarifas/actualizaciones/actualizacionMasiva/jsp/asistActPaso2.jsp", Vista.INTERNA);
	private static final Vista NEXT_PAGE_PASO3 = new Vista("ventas/tarifas/actualizaciones/actualizacionMasiva/jsp/asistActPaso3.jsp", Vista.INTERNA);
	private static final Vista NEXT_PAGE_PASO4 = new Vista("ventas/tarifas/actualizaciones/actualizacionMasiva/jsp/asistActPaso4.jsp", Vista.INTERNA);
	private static final Vista NEXT_PAGE_PASO5 = new Vista("ventas/tarifas/actualizaciones/actualizacionMasiva/jsp/asistActPaso5.jsp", Vista.INTERNA);
	private static final int PASO1 = 1;
	private static final int PASO2 = 2;
	private static final int PASO3 = 3;
	private static final int PASO4 = 4;
	private static final int PASO5 = 5;
	
	public String getNombre() {
		return "asistenteActualizacion";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
			if (!permisos.isPuedeEditar()) {
				return SIN_PERMISO;
			}

			ParametrosAsistenteTarifaBean asistente = (ParametrosAsistenteTarifaBean) sesion.getAttribute(WebKeys.ACTUALIZACION_ASISTENTE_BEAN);
			String operacion = request.getParameter("operacion");
			
			if (asistente == null || operacion == null || operacion.isEmpty()) {
				asistente = new ParametrosAsistenteTarifaBean();
				asistente.setIdActualizacion(Long.parseLong(request.getParameter(WebKeys.ID_OBJETO)));
				asistente.setCodTarActual(request.getParameter("codTar"));
				//no se versionan los artículos añadidos, por lo que no vamos a mostrar la informacion referente a los artículos versionados.
				asistente.setControlVersiones(false);
				sesion.setAttribute(WebKeys.ACTUALIZACION_ASISTENTE_BEAN, asistente);
				asistente.setCriterio(ParametrosAsistenteTarifaBean.OPERACION_ACT_PRECIOS_VENTA);
				if (asistente.isTarifaActualGeneral()){
					asistente.setPaso(PASO2);
					return NEXT_PAGE_PASO2;
				}
				asistente.setPaso(PASO1);
				return NEXT_PAGE_PASO1;
			} 
			else if (operacion.equals("siguiente")){
				return pasoSiguiente(request,asistente);
			}
			else if (operacion.equals("anterior")) {
				return pasoAnterior(request,asistente);
			} 
			else{
				return ERROR_PAGE;
			}
		}  
		catch (Exception e) {
			e.printStackTrace();
			setError(request, e);
			return ERROR_PAGE;
		}
	}
	private Vista pasoAnterior(HttpServletRequest request, ParametrosAsistenteTarifaBean param){
		switch (param.getPaso()) {
			case PASO1:
				return NEXT_PAGE_PASO1;
			case PASO2:
				param.setPaso(PASO1);
				return NEXT_PAGE_PASO1;
			case PASO3:
				param.setPaso(PASO2);
				return NEXT_PAGE_PASO2;
			case PASO4:
				if (param.isOperacionActualizarEliminando()){
					param.setPaso(PASO2);
					return NEXT_PAGE_PASO2;
				}
				param.setPaso(PASO3);
				return NEXT_PAGE_PASO3;
			case PASO5:
				param.setPaso(PASO4);
				return NEXT_PAGE_PASO4;
			default:
				param.setPaso(PASO1);
				return NEXT_PAGE_PASO1;
		}
	}

	private Vista pasoSiguiente(HttpServletRequest request, ParametrosAsistenteTarifaBean param) {
		HttpSession sesion = request.getSession();
		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
		
		try{
			switch (param.getPaso()) {
				case PASO1:
					param.setCriterio(request.getParameter("criterio"));
					param.setPaso(PASO2);
					return NEXT_PAGE_PASO2;
				case PASO2:
					param.setCodArtDesde(request.getParameter("codArtDesde"));
					param.setCodArtHasta(request.getParameter("codArtHasta"));
					param.setCodFamDesde(request.getParameter("codFamDesde"));
					param.setCodFamHasta(request.getParameter("codFamHasta"));
					param.setCodProDesde(request.getParameter("codProDesde"));
					param.setCodProHasta(request.getParameter("codProHasta"));
					param.setDesArtDesde(request.getParameter("desArtDesde"));
					param.setDesArtHasta(request.getParameter("desArtHasta"));
					param.setDesFamDesde(request.getParameter("desFamDesde"));
					param.setDesFamHasta(request.getParameter("desFamHasta"));
					param.setDesProDesde(request.getParameter("desProDesde"));
					param.setDesProHasta(request.getParameter("desProHasta"));
					if (param.isOperacionActualizarEliminando()){
						param.setPaso(PASO4);
						return NEXT_PAGE_PASO4;
					}
					param.setPaso(PASO3);
					return NEXT_PAGE_PASO3;
				case PASO3:
					param.setCriterio(request.getParameter("criterio"));
					param.setPorcentajeIncDec(Numero.desformatea(request.getParameter("porcentajeIncDec"), null));
					param.setImporteIncDec(Numero.desformatea(request.getParameter("importeIncDec"), null));
					param.setFactorMargen(Numero.desformatea(request.getParameter("factorMargen"), null));
					param.setRedondear(request.getParameter("redondear") != null);
					param.setPaso(PASO4);
					return NEXT_PAGE_PASO4;
				case PASO4:
					ServicioActualizacionesTarifas.actualizacionArticulosMasiva(param, datosSesion);
					param.setPaso(PASO5);
					return NEXT_PAGE_PASO5;
				case PASO5:
					sesion.removeAttribute(WebKeys.ACTUALIZACION_ASISTENTE_BEAN);
					return getControlador().getAccion("ver").ejecutar(request);
				default:
					param.setPaso(PASO1);
					return NEXT_PAGE_PASO1;
			}
		}
		catch (ArticuloActualizacionConstraintViolationException e) {
			setMensajeError(request, e.getMessage());
			setError(request, e);
			param.setPaso(PASO5);
			return NEXT_PAGE_PASO5;
		}
		catch (ArticuloActualizacionException e) {
			setMensajeError(request, e.getMessage());
			setError(request, e);
			param.setPaso(PASO5);
			return NEXT_PAGE_PASO5;
		}
		catch (ActualizacionTarifaException e) {
			setError(request, e);
			return ERROR_PAGE;
		} 
	}
}
