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

package com.comerzzia.web.core.screen;

import java.io.IOException;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.comerzzia.util.log.Logger;
import com.comerzzia.util.xml.XMLDocumentUtils;


/**
 * Servlet implementation class ScreenServlet
 */
public class ScreenServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	
	/** Logger */
    protected static Logger log = Logger.getMLogger(ScreenServlet.class);
    
    /** Mapa de pantallas */
    protected HashMap<String, String> pantallas = new HashMap<String, String>();
    
    protected static final String XML_CONFIGURACION = "/WEB-INF/conf/screendefinitions.xml";
    
    // Definición de nombres de tags del xml
    protected static final String TAG_SCREEN = "screen";
    protected static final String TAG_NAME   = "name";
    protected static final String TAG_PAGE   = "page";
    
    
    /**
     * Inicializa el servlet
     * @param config
     * @throws javax.servlet.ServletException
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
        log = Logger.getMLogger(this.getClass());
        
        loadPantallas();
        
        log.info(this.getServletName() + ".init()");
    }
    
    /**
     * Procesa peticiones HTTP GET
     * @param request Informacion de la petición
     * @param response Informacion de la respuesta
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        performTask(request, response);
    }


    /**
     * Procesa peticiones HTTP POST
     * @param request Información de la petición
     * @param response Información de la respuesta
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        performTask(request, response);
    }
    
    /**
     * Procesa peticiones GET y POST del servlet
     * @param request Peticion
     * @param response Respuesta
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     */
    protected void performTask(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String uri = request.getRequestURI();
            String screen = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
            String page = pantallas.get(screen);
            
            if (page == null) {
                log.error("No se ha encontrado la definición de la pantalla : " + screen);
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
            else {
                RequestDispatcher dispatch = request.getRequestDispatcher(page);
                dispatch.forward(request, response);
            }
        }
        catch (Exception e) {
            log.error("ScreenServlet Error : " + e.getMessage(), e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
    
    /**
     * Carga la definición de las pantalls del xml de configuración
     * @throws javax.servlet.ServletException
     */
    private void loadPantallas() throws ServletException {
        try {
            String name = null;
            String page = null;
            
            URL url = this.getServletContext().getResource(XML_CONFIGURACION);
            Document document = XMLDocumentUtils.createDocumentFormURL(url);

            NodeList nodeList = document.getElementsByTagName(TAG_SCREEN);
            for (int i=0; i < nodeList.getLength(); i++) {
                name = XMLDocumentUtils.getAttribute((Element)nodeList.item(i), TAG_NAME, false);
                page = XMLDocumentUtils.getAttribute((Element)nodeList.item(i), TAG_PAGE, false);
                
                pantallas.put(name, page);
            }
        }
        catch (Exception e) {
            log.fatal("Error al cargar la definición de las pantallas: " + e.getMessage(), e);
            throw new ServletException(e);
        }
    }
}
