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

package com.comerzzia.util.xsd;

import java.io.ByteArrayInputStream;
import java.net.URL;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xml.sax.helpers.DefaultHandler;

import com.comerzzia.util.log.Logger;

public class ValidarXmlContraXsd {

	protected static Logger log = Logger.getMLogger(ValidarXmlContraXsd.class);
	
	/**
	 * Recibe una cadena que contiene el xml del ticket y una URL con la ruta del xsd, utiliza el 
	 * xsd para parsear el xml y ver si este es correcto.
	 * @param xml
	 * @param rutaXSD
	 * @return boolean
	 * @throws Exception 
	 */
	public static void validarXmlconXsd(String xml, URL url) throws Exception{
        boolean NAME_SPACE_AWARE   = true;
        boolean VALIDATING         = true;
        String SCHEMA_LANGUAGE     = "http://java.sun.com/xml/jaxp/properties/schemaLanguage";
        String SCHEMA_LANGUAGE_VAL = "http://www.w3.org/2001/XMLSchema";
        String SCHEMA_SOURCE       = "http://java.sun.com/xml/jaxp/properties/schemaSource";
       
        try{
            SAXParserFactory factory = SAXParserFactory.newInstance();
            
            // Configure SAXParserFactory to provide parsers that are namespace aware.
            factory.setNamespaceAware(NAME_SPACE_AWARE);

            // Configure SAXParserFactory to provide parsers that are validating. This property
            // must have the value true for any of the property strings defined below to take
            // effect.
            factory.setValidating(VALIDATING);
            SAXParser parser = factory.newSAXParser();
           
            // Setting the schema language for xml schema validation
            parser.setProperty(SCHEMA_LANGUAGE, SCHEMA_LANGUAGE_VAL);
            // Setting the schema source for xml schema validation
            parser.setProperty(SCHEMA_SOURCE, new InputSource(url.openStream()));
            
            DefaultHandler handler = new XmlDefaultHandler();
            parser.parse(new InputSource(new ByteArrayInputStream(xml.getBytes("UTF-8"))), handler);
        }
		catch (Exception e) {
			log.error("Error al validar un xml contra el xsd: " + e.getMessage(), e);
			throw e;
		}
    } 
 
    public static class XmlDefaultHandler extends DefaultHandler{
        /** @see org.xml.sax.ErrorHandler#error(SAXParseException)*/
        public void error(SAXParseException spe) throws SAXException{
            throw spe;
        }
        /** @see org.xml.sax.ErrorHandler#fatalError(SAXParseException)*/
        public void fatalError(SAXParseException spe) throws SAXException{
            throw spe;
        }
    }		

}
