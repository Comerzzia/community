/**
 * 
 */
package com.comerzzia.portlets.tiendavirtual;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comerzzia.persistencia.general.articulos.fotos.FotoArticuloBean;
import com.comerzzia.portlets.base.WebKeys;
import com.comerzzia.servicios.core.login.ServicioLogin;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.fotos.ServicioFotosArticulos;

/**
 * Servlet que muestra una foto de un tipo y de un artículo determinado.
 */
public class FotosArticulosTiendaVirtualServlet extends HttpServlet implements Servlet {

	/**
	 * Serial Version UID.
	 */
	private static final long serialVersionUID = 1948333360116305533L;

	public FotosArticulosTiendaVirtualServlet() {
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

	protected void performTask(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			// Creamos una sesión con los datos de la empresa para poder consultar la foto del artículo
			DatosSesionBean datosSesion = (DatosSesionBean)request.getSession().getAttribute(WebKeys.DATOS_SESION);
			if (datosSesion == null){
				datosSesion = ServicioLogin.iniciarSesion();
				request.getSession().setAttribute(WebKeys.DATOS_SESION, datosSesion);
			}

			String codArticulo = request.getParameter("codArticulo");
			String tipoFoto = request.getParameter("tipoFoto");

			FotoArticuloBean fotoArticulo = ServicioFotosArticulos.consultar(codArticulo, tipoFoto, datosSesion);
			response.setContentType("image/gif");

			// Escribimos el resultado en la salida
			ServletOutputStream out = response.getOutputStream();
			out.write(fotoArticulo.getFoto());
			out.flush();
			out.close();

		} 
		catch (Exception ignore) {
		}
	}
}