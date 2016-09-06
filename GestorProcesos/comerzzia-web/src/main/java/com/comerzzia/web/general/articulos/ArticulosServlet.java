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

package com.comerzzia.web.general.articulos;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javazoom.upload.MultipartFormDataRequest;

import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.articulos.acciones.AltaAccion;
import com.comerzzia.web.general.articulos.acciones.AltaRapidaAccion;
import com.comerzzia.web.general.articulos.acciones.BuscarAccion;
import com.comerzzia.web.general.articulos.acciones.EditarAccion;
import com.comerzzia.web.general.articulos.acciones.EjecutarAccion;
import com.comerzzia.web.general.articulos.acciones.EliminarAccion;
import com.comerzzia.web.general.articulos.acciones.ImprimirAccion;
import com.comerzzia.web.general.articulos.acciones.LeerFormularioAccion;
import com.comerzzia.web.general.articulos.acciones.SalvarAccion;
import com.comerzzia.web.general.articulos.acciones.SalvarAltaRapidaAccion;
import com.comerzzia.web.general.articulos.acciones.UploadFotoAccion;
import com.comerzzia.web.general.articulos.acciones.VerAccion;
import com.comerzzia.web.general.articulos.acciones.VerFormularioAccion;

public class ArticulosServlet extends ControladorServlet {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -5779102974753402078L;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.comerzzia.web.base.ControladorServlet#loadAcciones()
	 */
	protected void loadAcciones() {
		this.añadirAccionDefault(new EjecutarAccion());
		this.añadirAccion(new BuscarAccion());
		this.añadirAccion(new AltaAccion());
		this.añadirAccion(new VerAccion());
		this.añadirAccion(new EditarAccion());
		this.añadirAccion(new EliminarAccion());
		this.añadirAccion(new SalvarAccion());
		this.añadirAccion(new LeerFormularioAccion());
		this.añadirAccion(new VerFormularioAccion());
		this.añadirAccion(new ImprimirAccion());
		this.añadirAccion(new UploadFotoAccion());		
		this.añadirAccion(new SalvarAltaRapidaAccion());
		this.añadirAccion(new AltaRapidaAccion());
	}

	/**
	 * Procesa peticiones GET y POST del servlet
	 * 
	 * @param request
	 *            Peticion
	 * @param response
	 *            Respuesta
	 * @throws javax.servlet.ServletException
	 * @throws java.io.IOException
	 */
	protected void performTask(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		if (MultipartFormDataRequest.isMultipartFormData(request)) {
			DatosSesionBean datosSesion = (DatosSesionBean) request
					.getSession().getAttribute(WebKeys.DATOS_SESION);
			
			// TODO Coger la acción del request usando MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

			String codAccion = "crearFoto";

			if (codAccion == null) {
				codAccion = "default";
			}
			Accion accion = this.getAccion(codAccion);
			Vista sigVista = accion.ejecutar(request);

			request.setAttribute(WebKeys.PERMISOS, datosSesion
					.getPermisosCache(accion.getAccionMenu()));
			dispatch(request, response, sigVista);

		} else {
			super.performTask(request, response);
		}
	}
}
