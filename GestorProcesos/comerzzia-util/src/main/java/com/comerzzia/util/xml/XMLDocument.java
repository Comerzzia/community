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

import java.sql.Blob;

import org.w3c.dom.Document;


public class XMLDocument {

	Document document = null;
	Exception exception = null;
	
	
	public XMLDocument() {
	}
	
	
	public void setDocument(Blob blob) {
		try {
			document = XMLDocumentUtils.createDocumentBuilder().parse(blob.getBinaryStream());
		} 
		catch (Exception e) {
			exception = e;
		} 
	}
	
	public void setDocument(String string) {
		try {
			document = XMLDocumentUtils.createDocumentFormString(string);
		} 
		catch (Exception e) {
			exception = e;
		} 
	}
	
	
	public void setDocument(Document document) {
		this.document = document;
	}
	
	public byte[] getBytes() {
		try {
			return XMLDocumentUtils.DocumentToString(document).getBytes();
		} 
		catch (Exception e) {
			exception = e;
			return null;
		}
	}	
	
	public Document getDocument() {
		return document;
	}
	
	
	public boolean isErroneo() {
		return (exception != null);
	}
	
	
	public String getError() {
		return (exception != null) ? exception.getMessage() : null;
	}
	
	
	public Exception getException() {
		return exception;
	}
	
	
	public boolean isEmpty() {
		return document == null;
	}
}
