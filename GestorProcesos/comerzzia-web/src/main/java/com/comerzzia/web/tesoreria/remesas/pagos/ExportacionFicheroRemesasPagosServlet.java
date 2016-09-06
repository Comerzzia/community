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

package com.comerzzia.web.tesoreria.remesas.pagos;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.acciones.AccionBean;
import com.comerzzia.servicios.core.acciones.AccionException;
import com.comerzzia.servicios.core.acciones.ServicioAcciones;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.remesas.pagos.ExportarRemesaPagoException;
import com.comerzzia.servicios.tesoreria.remesas.pagos.RemesaPago;
import com.comerzzia.servicios.tesoreria.remesas.pagos.RemesaPagoException;
import com.comerzzia.servicios.tesoreria.remesas.pagos.ServicioRemesasPagos;
import com.comerzzia.util.log.Logger;
import com.comerzzia.web.base.WebKeys;

public class ExportacionFicheroRemesasPagosServlet extends HttpServlet{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4508742608144035930L;

	/**
	 * Acción de menú asociada al servlet
	 */
	protected AccionBean accionMenu;

	protected static final String CONTENT_TYPE_TEXT = "text/plain; charset=ISO-8859-1";
    protected static final String CONTENT_TYPE_APPLICATION = "application/octet-stream";
    protected static final String CONTENT_DISPOSITION_HEAD = "Content-Disposition";
    protected static final String CONTENT_DISPOSITION = "attachment; filename=";
    
    protected static final String DEFAULT_FILE_NAME = "remesa";
    protected static final String DEFAULT_FILE_EXT = ".txt";
    protected static final String ERROR_FILE_NAME = "error" + DEFAULT_FILE_EXT;

    /** Página de error en aplicación */
    protected static final String ERROR_PAGE = "comun/jsp/pagina_error.jsp";
    /** Página de error por no tener permiso para ejecutar una acción*/
    protected static final String SIN_PERMISO = "comun/jsp/sin_permiso.jsp";

    protected static Logger log = Logger.getMLogger(ExportacionFicheroRemesasPagosServlet.class);

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
        // Obtenemos la información de la acción de menú asociada al servlet para controlar los permisos
        try {
			accionMenu = ServicioAcciones.obtenerAccion(RemesasPagosServlet.class.getCanonicalName());
		} 
        catch (AccionException e) {
			log.error("Error al obtener la acción asociada a " + this.getClass().getCanonicalName());
		}
        
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        perfomTask(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        perfomTask(request,response);
    }

    private void perfomTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RemesaPago remesaPago = null;
        FileWriter writer = null;
        PrintWriter pw = null;
        
        try {
        	HttpSession sesion = request.getSession();
        	DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
        	
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.accionMenu);
    		if (!permisos.isPuedeEjecutar()) {
                RequestDispatcher dispatch = request.getRequestDispatcher(SIN_PERMISO);
                dispatch.forward(request, response);
    		}

    		//Obtenemos la remesa mediante su idRemesa
    		remesaPago = ServicioRemesasPagos.consultar(Long.parseLong(request.getParameter(WebKeys.ID_OBJETO)), datosSesion);
            
            //Construimos el fichero
            File file = File.createTempFile(DEFAULT_FILE_NAME + remesaPago.getIdRemesa() + "_" + System.currentTimeMillis(), DEFAULT_FILE_EXT);
            
            writer = new FileWriter(file.getPath());
            pw = new PrintWriter(writer);
            
            //Generamos el fichero de la remesa
            remesaPago.generarFichero(remesaPago, pw, datosSesion);
            
            // Cerrar fichero para que luego pueda ser leido y enviado por la salida del response
            pw.close();
            writer.close();
            
            enviarFichero(file, response);
        }
        catch(ExportarRemesaPagoException e){ 
			String msg = "Error exportando remesa de pago: " + e.getMessage();
    		log.error("perfomTask() - " + msg);

    		response.setHeader("Pragma", "no-cache");
            response.addHeader("Cache-Control", "must-revalidate");
            response.addHeader("Cache-Control", "no-cache");
            response.addHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0L);
            
            request.setAttribute(WebKeys.MENSAJE_ERROR, e.getMessage());

            RequestDispatcher dispatch = request.getRequestDispatcher("remesasPagos?accion=buscar");
            dispatch.forward(request, response);

        }
        catch(RemesaPagoException e){ 
			String msg = "Error exportando remesa de pago: " + e.getMessage();
    		log.error("perfomTask() - " + msg);

            response.setHeader("Pragma", "no-cache");
            response.addHeader("Cache-Control", "must-revalidate");
            response.addHeader("Cache-Control", "no-cache");
            response.addHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0L);
            
            request.setAttribute(WebKeys.EXCEPTION, e);

            RequestDispatcher dispatch = request.getRequestDispatcher(ERROR_PAGE);
            dispatch.forward(request, response);
        }
        catch(Exception e){
            e.printStackTrace();
            request.setAttribute(WebKeys.EXCEPTION, e);
  
            RequestDispatcher dispatch = request.getRequestDispatcher(ERROR_PAGE);
            dispatch.forward(request, response);
        }
        finally {
            try {
                pw.close();
            }
            catch(Exception e) {;}
            try {
                writer.close();
            }
            catch(Exception e) {;}
        }
    }
    
    private void enviarFichero (File file, HttpServletResponse response)throws RemesaPagoException{
        try{
            // indicamos content_type dependiendo del modo texto
            response.setContentType(CONTENT_TYPE_APPLICATION);
            response.addHeader(CONTENT_DISPOSITION_HEAD,CONTENT_DISPOSITION + file.getName());
  
            // indicamos no cache en la cabecera del response
            response.setHeader("Pragma", "no-cache" );
            response.addHeader("Cache-Control", "must-revalidate");
            response.setDateHeader("Expires", 0);
        
            FileInputStream in = new FileInputStream(file.getPath());
            OutputStream out = response.getOutputStream();
         
            byte[] buf = new byte[1024];
            int count = 0;
            while ((count = in.read(buf)) >= 0) {
                out.write(buf, 0, count);
            }
            in.close();
            out.close();  
            
        }
        catch(FileNotFoundException e) {
            throw new RemesaPagoException("Imposible abrir el fichero", e);
        }
        catch(IOException e) {
            throw new RemesaPagoException(e.getMessage(), e);
        }
        catch(Exception e) {
            throw new RemesaPagoException(e.getMessage(), e);
        }
        finally{
        	//Por último borramos el fichero creado
        	file.delete();
        }
    }
}
