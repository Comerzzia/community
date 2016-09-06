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

package com.comerzzia.util.xml;

import java.io.ByteArrayInputStream;
import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.sun.org.apache.xml.internal.serialize.OutputFormat;
import com.sun.org.apache.xml.internal.serialize.XMLSerializer;


/**
 * Funciones para trabajar con documentos XML
 */
public final  class XMLDocumentUtils extends Exception  {

    /**
	 * 
	 */
	private static final long serialVersionUID = -6038925587015641537L;


	private XMLDocumentUtils() {
    }
    
    
    /**
     * Crea un nuevo documento xml vacio
     * @return 
     * @throws es.mpsistemas.m2m.util.xml.XMLDocumentException
     */
    public static Document createDocument() throws XMLDocumentException {
        return createDocumentBuilder().newDocument();
    }
    
    
    /**
     * Obtiene un DocumentBuilder
     * @return 
     * @throws es.mpsistemas.m2m.util.xml.XMLDocumentException
     */
    public static DocumentBuilder createDocumentBuilder() throws XMLDocumentException {
        try {
            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            builderFactory.setNamespaceAware(true);
            DocumentBuilder builder = builderFactory.newDocumentBuilder();
      
            return builder;
        } 
        catch (Exception e) {
            throw new XMLDocumentException("Error al crear documento XML: " + e.getMessage());
        }
    }
    
    
    /**
     * Crea un nuevo documento xml a partir del contenido de una url
     * @param url
     * @return 
     */
    public static Document createDocumentFormURL(URL url) throws XMLDocumentException {
        Document document = null;
        
        try {
            InputSource is = new InputSource(url.openStream());
            document = createDocumentBuilder().parse(is);
        }
        catch (IOException e) {
            throw new XMLDocumentException("Error al crear documento XML: " + e.getMessage());
        }
        catch (SAXException e) {
            throw new XMLDocumentException("Error al crear documento XML: " + e.getMessage());
        }
        
        return document;
    }
    
    /**
     * Crea un nuevo documento xml a partir de un string
     * @param string
     * @return 
     */
    public static Document createDocumentFormString(String string) throws XMLDocumentException {
        Document document = null;
        
        try {
        	InputStream is = new ByteArrayInputStream(string.getBytes("UTF-8"));
            document = createDocumentBuilder().parse(is);
        }
        catch (IOException e) {
            throw new XMLDocumentException("Error al crear documento XML: " + e.getMessage());
        }
        catch (SAXException e) {
            throw new XMLDocumentException("Error al crear documento XML: " + e.getMessage());
        }
        
        return document;
    }
    

    /**
     * Obtiene una cadena a partir de un Document; además esta cadena ya está identada.
     * @param Document xml
     * @return String
     * @throws XMLDocumentException
     */
    public static String DocumentToString(Document document) throws XMLDocumentException {
		CharArrayWriter salidaXML = null;
        try {
			// Vamos a convertir el arbol DOM en un String  
			// Definimos el formato de salida  
			// Pasamos document como argumento para tener un formato de partida  
		    OutputFormat format = new OutputFormat(document);  
		    format.setIndenting(true);  
		    format.setLineWidth(0);               
		    format.setPreserveSpace(false);  
 		    // Definimos donde vamos a escribir  
		    salidaXML = new CharArrayWriter();  
 		    // Serializamos el arbol DOM  
		    XMLSerializer serializer = new XMLSerializer((Writer)salidaXML,format);  
		    serializer.asDOMSerializer();  
		    serializer.serialize(document);  

		    return salidaXML.toString();
        }
        catch (Exception e) {
            throw new XMLDocumentException("Error al serializar documento xml: " + e.getMessage());
        }
    }
    
    
    /**
     * Devuelve un nuevo elemento
     * @param document
     * @param name Nombre del elemento
     * @param value Valor del elemento
     * @return 
     */
    public static Element createElement(Document document, String name, String value) {
        Element element = (Element) document.createElement(name);
        element.appendChild(document.createTextNode(value != null ? value : ""));
        return element;
    }
    
    public static Element createElement(Document document, String name, long value) {
        return createElement(document, name, Long.toString(value));
    }
    
    public static Element createElement(Document document, String name, float value) {
        return createElement(document, name, Float.toString(value));
    }
    
    public static Element createElement(Document document, String name, Element child) {
        Element element = (Element) document.createElement(name);
        element.appendChild(child);
        return element;
    }
    
    
    
    /**
     * Añade un nuevo nodo al nodo root
     * @param document
     * @param root Nodo al que se añade el nuevo elemento
     * @param name Nombre del nuevo elemento
     * @param value Valor del nuevo elemento
     */
    public static void appendChild(Document document, Node root, String name, String value) {
        Node node = document.createElement(name);
        node.appendChild(document.createTextNode(value != null ? value : ""));
        root.appendChild(node);
        return;
    }

    public static void appendChild(Document document, Node root, String name, float value) {
        appendChild(document, root, name, Float.toString(value));
        return;
    }
    
    public static void appendChild(Document document, Node root, String name, long value) {
        appendChild(document, root, name, Long.toString(value));
        return;
    }
    
    
    public static void appendChild(Node root, String name, String value) {
        appendChild(root.getOwnerDocument(), root, name, value);
        return;
    }
    
    
    public static void appendChild(Document document, Node root, String name, double value) {
        appendChild(document, root, name, Double.toString(value));
        return;
    }
    
    
    
    
    /**
     * Obtiene en valor de un tag del xml
     * @param element Elemento xml
     * @param tagName Nombre del tag
     * @param optional Indica si el tag os opcional o no en el elemento
     * @return String con el valor del primer tag con nombre tagName en root
     *  o cadena vacia si no se encuentra y no era opcional
     * @throws es.mpsistemas.m2m.util.xml.XMLDocumentException
     */
    public static String getTagValue(Element element, String tagName, boolean optional) 
            throws XMLDocumentException {
        String returnString = "";
        
        NodeList nodos = element.getElementsByTagName(tagName);
        for (int i = 0; i < nodos.getLength(); i++) {
            Node node = nodos.item(i);
            if (node != null) {
                Node child = node.getFirstChild();
                if ((child != null) && child.getNodeValue() != null) {
                    return child.getNodeValue();
                }
            }
        }
        
        if (!optional) {
            throw new XMLDocumentException("El elemento " + element.getTagName() + 
                " no contiene el tag " + tagName);
        }
        
        return returnString;
    }
    
    public static String getTagValueAsString(Element element, String tagName, boolean optional) 
            throws XMLDocumentException {
        return getTagValue(element, tagName, optional);
    }
    
    public static int getTagValueAsInt(Element element, String tagName, boolean optional)
            throws XMLDocumentException {
        
        String entero = getTagValue(element, tagName, optional);
        if (entero.length() == 0) {
            return 0;
        }
        
        return Integer.parseInt(getTagValue(element, tagName, optional));
    }
    
    public static Long getTagValueAsLong(Element element, String tagName, boolean optional)
		    throws XMLDocumentException {
		
		String entero = getTagValue(element, tagName, optional);
		if (entero.length() == 0) {
		    return 0L;
		}
		
		return Long.parseLong(getTagValue(element, tagName, optional));
    }

    public static Double getTagValueAsDouble(Element element, String tagName, boolean optional)
		    throws XMLDocumentException {
		
		String entero = getTagValue(element, tagName, optional);
		if (entero.length() == 0) {
		    return 0.0;
		}
		
		return Double.parseDouble(getTagValue(element, tagName, optional));
	}

    public static boolean getTagValueAsBoolean(Element element, String tagName, boolean optional)
            throws XMLDocumentException {
        
        return Boolean.valueOf(getTagValue(element, tagName, optional)).booleanValue();
    }
    
    
    
    /**
     * Devuelve un nodo del elemento
     * @param element Elemento
     * @param name Nombre del nodo
     * @param optional 
     * @return Node o null si no se encuentra y era opcional
     * @throws es.mpsistemas.m2m.util.xml.XMLDocumentException
     */
    public static Node getNode(Element element, String name, boolean optional)
            throws XMLDocumentException {
        Node node = null;
        
        for (node = element.getFirstChild(); node != null; node = node.getNextSibling()) {
            if (node.getNodeType() == Node.ELEMENT_NODE) {
                if (((Element) node).getTagName().equals(name)) {
                    return node;
                }
            }
        }
        
        if (!optional) {
            throw new XMLDocumentException("El elemento " + element.getTagName() + 
                                           " no contiene el nodo " + name);
        }
        return node;
    }
    
    
    /**
     * Devuelve una lista que contiene todos los nodos de un elemento
     * @param element Elemento
     * @return lista de nodos
     * @throws es.mpsistemas.m2m.util.xml.XMLDocumentException
     */
    public static List<Element> getChildElements(Element element)throws XMLDocumentException {
        List<Element> lstNodos = new ArrayList<Element>();
    	Node node = null;
        for (node = element.getFirstChild(); node != null; node = node.getNextSibling()) {
            if (node.getNodeType() == Node.ELEMENT_NODE) {
            	lstNodos.add((Element)node);
            }
        }
        
        return lstNodos;
    }

    
    public static Element getElement(Element element, String name, boolean optional)
            throws XMLDocumentException {
        return (Element) getNode(element, name, optional);
    }
    
    
    /**
     * Obtiene el atributo de un elemento
     * @param element
     * @param name
     * @param optional
     * @return 
     * @throws es.mpsistemas.m2m.util.xml.XMLDocumentException
     */
    public static String getAttribute(Element element, String name, boolean optional)
            throws XMLDocumentException {
        String value = element.getAttribute(name);
        
        if (value == null || value.length() == 0) {
            if (!optional) {
                throw new XMLDocumentException("El elemento " + element.getTagName() + 
                                               " no contiene el atributo " + name);
            }
            else {
                value = "";
            }
        }
        
        return value;
    }
    
    
    
    /**
     * Serializa un documento xml
     * @param document
     * @param out
     * @throws es.mpsistemas.m2m.util.xml.XMLDocumentException
     */
    public static void serialize(Document document, PrintWriter out) throws XMLDocumentException {
        try {
            DOMSource source = new DOMSource(document);
            StreamResult sr = new StreamResult(out);
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer transformer = tFactory.newTransformer();
            transformer.transform(source, sr);
        }
        catch (Exception e) {
            throw new XMLDocumentException("Error al serializar documento xml: " + e.getMessage());
        }
    }
    
    
    /**
     * Serializa un documento xml con encoding ISO-8859-1
     * @param document
     * @param out
     * @throws es.mpsistemas.m2m.util.xml.XMLDocumentException
     */
    public static void serializeISO(Document document, PrintWriter out) throws XMLDocumentException {
        try {
            DOMSource source = new DOMSource(document);
            StreamResult sr = new StreamResult(out);
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer transformer = tFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
            transformer.transform(source, sr);
        }
        catch (Exception e) {
            throw new XMLDocumentException("Error al serializar documento xml: " + e.getMessage());
        }
    }
}
