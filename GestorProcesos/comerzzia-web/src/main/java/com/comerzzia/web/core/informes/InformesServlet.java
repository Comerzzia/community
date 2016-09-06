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

package com.comerzzia.web.core.informes;

import java.io.File;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JRRuntimeException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

import com.comerzzia.persistencia.core.informes.TrabajoInformeBean;
import com.comerzzia.util.config.AppInfo;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.web.base.WebKeys;

public class InformesServlet extends HttpServlet{

	private static final long serialVersionUID = -3209696798558237172L;

	/** Logger */
    protected static Logger log = Logger.getMLogger(InformesServlet.class);

	public void service(HttpServletRequest request,	HttpServletResponse response) 
            throws IOException, ServletException{
		Connection conn = null;
	    JasperPrint jasperPrint = null;
        try{
        	HttpSession session = request.getSession(false);
        	TrabajoInformeBean trabajoInforme = (TrabajoInformeBean) session.getAttribute(WebKeys.TRABAJO_INFORME);
        	
            // obtenemos la ruta completa donde se encuentra el informe
            String rutaCompleta = AppInfo.getInformesInfo().getRutaBase() + trabajoInforme.getRutaInforme();
            
            // añadimos parámetro SUBREPORT_DIR con la ruta de ejecución completa al informe
            trabajoInforme.addParametro("SUBREPORT_DIR", AppInfo.getInformesInfo().getRutaBase() + trabajoInforme.getRutaBase()+"/");
            
            // obtenemos fichero del informe
            log.debug("Abriendo informe: " + rutaCompleta);
            File reportFile = new File(rutaCompleta);
            if (!reportFile.exists()){
                log.error("No se ha encontrado el fichero del informe en la ruta indicada: " + rutaCompleta);
            	throw new JRRuntimeException("No se ha encontrado el fichero del informe.");
            }
            
            // obtenemos una conexión para ejecutar el informe
            log.debug("Abriendo conexión para ejecutar informe con: " + AppInfo.getDbInfo().getDatasource());
            conn = Database.getConnection(AppInfo.getDbInfo().getDatasource());
            
            // Obtenemos el objeto jasperReport a partir del fichero cargado
            JasperReport jasperReport = (JasperReport)JRLoader.loadObject(reportFile.getPath());
            //JasperReport jasperReport = JasperCompileManager.compileReport(reportFile.getPath()); // PARA COMPILAR EL INFORME .jrxml --> .jasper
            
            // Ejecutamos (rellenamos) el informe
            jasperPrint = JasperFillManager.fillReport(jasperReport, trabajoInforme.getParametros(), conn);
            
            // limpiamos los parámetros del informe
            trabajoInforme.limpiarParametros();
		}
		catch (Exception e){
			log.error("Se ha producido un error al intentar ejecutar informe." + e.getMessage());
			e.printStackTrace();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Visor de informes</title>");
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"../stylesheet.css\" title=\"Style\">");
			out.println("</head>");
			
			out.println("<body bgcolor=\"white\">");

			out.println("<span class=\"bnew\">Se produjo un error al intentar ejecutar el informe: </span>");
			out.println("<pre>");
			e.printStackTrace(out);
			out.println("</pre>");

			out.println("</body>");
			out.println("</html>");

			return;
		}
        finally{
            try{
                conn.close();
            }
            catch(Exception ignore){;}
        }

		if (jasperPrint != null){
			response.setContentType("application/octet-stream");
			ServletOutputStream ouputStream = response.getOutputStream();
			
			ObjectOutputStream oos = new ObjectOutputStream(ouputStream);
			oos.writeObject(jasperPrint);
			oos.flush();
			oos.close();

			ouputStream.flush();
			ouputStream.close();
		}
		else{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Visor de informes</title>");
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"../stylesheet.css\" title=\"Style\">");
			out.println("</head>");
			
			out.println("<body bgcolor=\"white\">");
	
			out.println("<span class=\"bold\">Informe vacío.</span>");
	
			out.println("</body>");
			out.println("</html>");
		}
	}
}
