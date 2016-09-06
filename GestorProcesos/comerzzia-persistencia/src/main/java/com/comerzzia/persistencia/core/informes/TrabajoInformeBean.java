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

package com.comerzzia.persistencia.core.informes;

import java.util.HashMap;
import java.util.Map;

public class TrabajoInformeBean {
    protected Long idInforme;
    protected String informe;
    protected String titulo;
    protected Map<String, Object> parametros;
    protected VersionInformeBean version;
    
    public TrabajoInformeBean() {
    }

    public String getRutaInforme(){
    	String ruta = informe.replaceAll("\\.", "/");
    	ruta += "_" + getVersion().getVersion() + ".jasper";
    	return ruta;
    }

    public String getRutaBase(){
    	String ruta = informe.replaceAll("\\.", "/");
    	return ruta.substring(0, ruta.lastIndexOf("/"));
    }

	public void setIdInforme(Long idInforme) {
		this.idInforme = idInforme;
	}

    public long getIdInforme() {
        return idInforme;
    }

    public Map<String, Object> getParametros(){
        return this.parametros;
    }
    
    public void addParametro(String nombre, Object valor){
        if (this.parametros == null){
            this.parametros = new HashMap<String, Object>();
        }
        this.parametros.put(nombre, valor);
    }
    
    public void limpiarParametros(){
    	if (this.parametros != null){
    		this.parametros.clear();
    	}
    }

	public String getInforme() {
		return informe;
	}

	public void setInforme(String informe) {
		this.informe = informe;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public VersionInformeBean getVersion() {
		return version;
	}

	public void setVersion(VersionInformeBean version) {
		this.version = version;
	}


}
