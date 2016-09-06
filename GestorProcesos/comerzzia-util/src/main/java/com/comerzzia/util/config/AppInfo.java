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

package com.comerzzia.util.config;

import com.comerzzia.util.log.Logger;
import com.comerzzia.util.xml.XMLDocumentUtils;

import java.lang.reflect.Method;

import java.net.URL;

import org.w3c.dom.Document;
import org.w3c.dom.Element;


public class AppInfo {
	
	/** Informacion de la base de datos */
    private static DBInfo dbInfo;
    
    /** Información de los informes que lanza la aplicación. */
    private static InformesInfo informesInfo;
    
    /**
     * Nombre de la aplicación
     */
    private static String aplicacion;
    
	/** Logger */
    private static Logger log = Logger.getMLogger(AppInfo.class);
    
    // Tags del fichero de configuracion 
    private static final String XML_BASEDATOS  = "BaseDatos";
    private static final String XML_INFORMES   = "Informes";
    private static final String TAG_DATASOURCE = "Datasource";
    private static final String TAG_RUTA_BASE  = "RutaBase";
    private static final String TAG_ESQUEMA_CONFIGURACION = "EsquemaConfiguracion";
    private static final String TAG_ESQUEMA_EMPRESA = "EsquemaEmpresa";
    private static final String TAG_APLICACION = "Aplicacion";
    private static final String TAG_RUTA_BASE_SCRIPTS   = "RutaBaseScripts";
    
    
    /* Carga estática de la clase*/
    static {
        load();
    }
    
    
    /**
     * Constructor
     */
    public AppInfo() {
    }
    
    
    /**
     * Carga los parametros de configuración de la aplicacion a partir del
     * fichero de configuración comerzzia/comerzzia.xml
     */
    private static void load() {
    	URL url = null;
        Method method = null;
        Document document = null;
        
        try {
            // Cargar fichero de configuración m2m.cfg.xml
            method = (java.lang.Thread.class).getMethod("getContextClassLoader", (Class<?>[])null);
            ClassLoader classLoader = (ClassLoader)method.invoke(Thread.currentThread(), (Object[])null);
            url = classLoader.getResource("comerzzia/comerzzia.xml");
            
            if (url == null) {
            	throw new RuntimeException("No se ha encontrado el fichero de configuración");
            }
                        
            log.info("Usando URL [" + url.toString() + "] para configuración de la aplicación");
            
            document = XMLDocumentUtils.createDocumentFormURL(url);
            Element root = document.getDocumentElement();
            
            // Configuración de Base de Datos
            Element basedatos = XMLDocumentUtils.getElement(root, XML_BASEDATOS, false);
            dbInfo = new DBInfo();
            dbInfo.setDatasource(XMLDocumentUtils.getTagValueAsString(basedatos, TAG_DATASOURCE, false));
            dbInfo.setEsquemaConfiguracion(XMLDocumentUtils.getTagValueAsString(basedatos, TAG_ESQUEMA_CONFIGURACION, false));
            dbInfo.setEsquemaEmpresa(XMLDocumentUtils.getTagValueAsString(basedatos, TAG_ESQUEMA_EMPRESA, false));
            dbInfo.setRutaBaseScripts(XMLDocumentUtils.getTagValueAsString(basedatos, TAG_RUTA_BASE_SCRIPTS, true));

            // Configuración de Informes
            Element informes = XMLDocumentUtils.getElement(root, XML_INFORMES, false);
            informesInfo = new InformesInfo();
            informesInfo.setRutaBase(XMLDocumentUtils.getTagValueAsString(informes, TAG_RUTA_BASE, false));
            
            // Aplicación por defecto
            aplicacion = XMLDocumentUtils.getTagValueAsString(root, TAG_APLICACION, false);
        }
        catch (Exception e) {
            log.fatal("Error al cargar configuración de la aplicacion : " + e.getMessage());
        }
    }
    
    
    /**
     * Obtiene la información de configuración de la BBDD
     * @return
     */
    public static DBInfo getDbInfo() {
		return dbInfo;
	}
    public static void setDbInfo(DBInfo dbInfo) {
    	AppInfo.dbInfo = dbInfo;
    }

    
    /**
     * Obtiene la información de configuración de los informes
     * @return
     */
    public static InformesInfo getInformesInfo() {
		return informesInfo;
	}
    
    
    /**
     * Obtiene el nombre de la aplicación por defecto
     * @return
     */
    public static String getAplicacion() {
    	return aplicacion;
    }
}
