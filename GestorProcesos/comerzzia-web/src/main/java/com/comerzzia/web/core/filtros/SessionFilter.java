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

package com.comerzzia.web.core.filtros;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.WebKeys;

/**
 * Servlet Filter implementation class FiltroLogin
 */
public class SessionFilter implements Filter {

	private FilterConfig filterConfig = null;
    
    
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }
    
    
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
            FilterChain filterChain) throws IOException, ServletException {
        
        HttpServletRequest request = (HttpServletRequest)servletRequest;

        HttpSession sesion = request.getSession();
        DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

        if (datosSesion == null) {
            ((HttpServletResponse)servletResponse).sendRedirect(
            		filterConfig.getInitParameter("paginaTimeout"));
            return;
        }

        filterChain.doFilter(servletRequest, servletResponse);
        
        return;
    }
    
    
    public void destroy() {
        filterConfig = null;
    }

}
