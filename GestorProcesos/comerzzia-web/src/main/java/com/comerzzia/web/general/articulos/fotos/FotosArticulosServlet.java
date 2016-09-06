/**
 * 
 */
package com.comerzzia.web.general.articulos.fotos;

import java.io.IOException;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.articulos.fotos.FotoArticuloBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.articulos.ui.FormularioArticuloBean;

/**
 * Servlet que muestra una foto de un tipo y de una artículo determinado. La
 * consulta de dicha foto se hace a FORMULARIO_ARTICULO de la sesión.
 */
public class FotosArticulosServlet extends HttpServlet implements Servlet {

	/**
	 * Serial Version UID.
	 */
	private static final long serialVersionUID = 1948333360116305533L;

	public FotosArticulosServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		performTask(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		performTask(request, response);
	}

	@SuppressWarnings("unchecked")
	protected void performTask(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession sesion = request.getSession();

		DatosSesionBean datosSesion = (DatosSesionBean) sesion
				.getAttribute(WebKeys.DATOS_SESION);

		FormularioArticuloBean formulario = (FormularioArticuloBean) sesion
				.getAttribute(WebKeys.FORMULARIO_ARTICULO);

		if (datosSesion != null && formulario != null) {
			try {

				// String codArticulo = request.getParameter("codArticulo");
				String tipoFoto = request.getParameter("tipoFoto");

				List<FotoArticuloBean> fotos = formulario
						.getFormularioPestañaActiva().getRegistros();

				byte[] foto = null;

				for (int i = 0; i < fotos.size(); i++) {
					FotoArticuloBean aux = fotos.get(i);

					if (aux.getTipoFoto().equals(tipoFoto)) {
						foto = aux.getFoto();
					}
				}

				response.setContentType("image/gif");

				// Escribimos el resultado en la salida
				ServletOutputStream out = response.getOutputStream();
				out.write(foto);
				out.flush();
				out.close();

			} catch (Exception ignore) {
			}
		} else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}

	}
}