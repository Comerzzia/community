/**
 * 
 */
package com.comerzzia.web.core.asistente.logotipo;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.empresas.AsistenteConfiguracionEmpresaBean;
import com.comerzzia.persistencia.core.empresas.EmpresaBean;
import com.comerzzia.web.base.WebKeys;

/**
 *
 */
public class LogoAsistenteServlet extends HttpServlet implements Servlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6088333680288056760L;

	public LogoAsistenteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		performTask(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		performTask(request, response);
	}

	protected void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession sesion = request.getSession();
			
			AsistenteConfiguracionEmpresaBean asistente = (AsistenteConfiguracionEmpresaBean) sesion.getAttribute(WebKeys.ASISTENTE_CONFIGURACION_BEAN);
			EmpresaBean empresa = asistente.getEmpresa();
			response.setContentType("image/gif");
			
			// Escribimos el resultado en la salida
			ServletOutputStream out = response.getOutputStream();
			out.write(empresa.getLogotipo());
			out.flush();
			out.close();
			
		} catch (Exception ignore) {}
	}

}
