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

package com.comerzzia.util.paginacion;

import java.util.List;

import com.comerzzia.util.base.ParametrosBuscarBean;


public class PaginaResultados {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -8316195638108844583L;

	private List<?> pagina = null;
	private int tamañoPagina = 1;
	private int numPagina = 0;
	private int totalResultados = 0;
    
    
    public PaginaResultados() {
    }
    
    
    public PaginaResultados(ParametrosBuscarBean param, List<?> pagina) {
    	this.setTamañoPagina(param.getTamañoPagina());
    	this.setNumPagina(param.getNumPagina());
    	this.setPagina(pagina);
    }


    public void setPagina(List<?> pagina) {
        this.pagina = pagina;
    }


    public List<?> getPagina() {
        return pagina;
    }


    public void setTamañoPagina(int tamañoPagina) {
        this.tamañoPagina = tamañoPagina;
    }


    public int getTamañoPagina() {
        return tamañoPagina;
    }


    public void setNumPagina(int numPagina) {
        this.numPagina = numPagina;
    }
    
    
    public void setNumPagina(String numPagina) {
        this.numPagina = Integer.parseInt(numPagina);
    }


    public int getNumPagina() {
        return numPagina;
    }


    public void setTotalResultados(int totalResultados) {
        this.totalResultados = totalResultados;
    }


    public int getTotalResultados() {
        return totalResultados;
    }
    
    
    public int getNumeroTotalPaginas() {
        if (totalResultados <=0 || tamañoPagina <= 0) {
           return 0;
        }
        
        return (int) Math.ceil((double)totalResultados/(double)tamañoPagina);
    }
    
    
    public boolean isEsUltimaPagina() {
        return (getNumPagina() >= getNumeroTotalPaginas());
    }
    
    
    public boolean isEsPrimeraPagina() {
        return (getNumPagina() == 1);
    }
    
    
    public int getSiguientePagina() {
        int pag = getNumPagina();
        
        if (pag >= getNumeroTotalPaginas()) {
            return getNumeroTotalPaginas();
        }
        else {
            return pag+1;
        }
    }
    
    
    public int getAnteriorPagina() {
        int pag = getNumPagina();
        
        if (pag <= 1) {
            return 1;
        }
        else {
            return pag-1;
        }
    }
    
    
    public int getInicio() {
        return ((getNumPagina()-1) * getTamañoPagina()) + 1;
    }
}
