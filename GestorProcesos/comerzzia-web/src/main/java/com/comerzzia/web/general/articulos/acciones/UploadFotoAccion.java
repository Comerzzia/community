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

package com.comerzzia.web.general.articulos.acciones;

import java.util.Collections;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadFile;

import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.persistencia.general.articulos.fotos.FotoArticuloBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.articulos.ui.FormularioArticuloBean;

public class UploadFotoAccion extends Accion {

	private long MAX_TAMAÑO = 500*1024;
	public String getNombre() {
		return "crearFoto";
	}

	@SuppressWarnings("unchecked")
	public Vista ejecutar(HttpServletRequest request) {

		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion
					.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion
					.getPermisosCache(this.getAccionMenu());
			if (!permisos.isPuedeEditar()) {
				return SIN_PERMISO;
			}

			FormularioArticuloBean formulario = (FormularioArticuloBean) sesion
					.getAttribute(WebKeys.FORMULARIO_ARTICULO);

			MultipartFormDataRequest mrequest = new MultipartFormDataRequest(
					request);

			String tipoFoto = mrequest.getParameter("tipoFoto");
			String codArticulo = mrequest.getParameter("idObjeto");

			UploadBean upload = new UploadBean();

			// Extensiones permitidas
			upload.setWhitelist("*.gif,*.jpg,*.png");

			// Tamaño máximo (100K)
			upload.setFilesizelimit(102400);

			Hashtable<?, ?> files = mrequest.getFiles();

			if ((files != null) && !files.isEmpty()) {
				UploadFile file = (UploadFile) files.get("foto");

				if(file.getFileSize() > this.MAX_TAMAÑO){
					setMensajeError(request, "El tamaño de la imagen no puede ser superior a 500KB");
					return getControlador().getAccion("verFormulario").ejecutar(request);
				}
				FotoArticuloBean foto = new FotoArticuloBean();
				formulario.getFormularioPestañaActiva().setModoInsercion(foto);

				foto.setCodArticulo(codArticulo);
				foto.setTipoFoto(tipoFoto);
				foto.setFoto(file.getData());

				List<FotoArticuloBean> fotos = formulario
						.getFormularioPestañaActiva().getRegistros();

				boolean insertado = false;

				for (int i = 0; i < fotos.size(); i++) {
					FotoArticuloBean aux = fotos.get(i);

					if (aux.getTipoFoto().equals(foto.getTipoFoto())) {
						insertado = true;
						fotos.set(i, foto);
					}
				}

				if (!insertado) {
					fotos.add(foto);
				}

				Collections.sort(fotos);

				formulario.getFormularioPestañaActiva()
						.seleccionaRegistroActivo(0);

				ArticuloBean articulo = (ArticuloBean) formulario
						.getRegistroActivo();
				articulo.setFotos(fotos);
			}

			return getControlador().getAccion("verFormulario")
					.ejecutar(request);
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}
}
