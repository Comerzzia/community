/**
 * 
 */
package com.comerzzia.web.core.empresas.logotipo;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.empresas.EmpresaBean;
import com.comerzzia.servicios.core.empresas.ServicioEmpresas;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.WebKeys;

/**
 *
 */
public class LogoEmpresaServlet extends HttpServlet implements Servlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7115908545834688392L;

	public LogoEmpresaServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		performTask(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		performTask(request, response);
	}

	protected void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		byte[] i = null; 
		
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			EmpresaBean empresa = (EmpresaBean) sesion .getAttribute(WebKeys.EMPRESA_BEAN);
			i = ServicioEmpresas.obtenerLogo(datosSesion, empresa.getCodEmp());;
			response.setContentType("image/gif");
			ServletOutputStream out = response.getOutputStream();

			// Escribimos el resultado en la salida
			out.write(i);
			out.flush();
			out.close();
			
		} catch (Exception ignore) {
		}
	}

}
