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

import java.util.ArrayList;
import java.util.List;


public class ListaPaginada {

	private List<?> lista;
    private int tamañoPagina = 1;
    private int pagina = 1;
    
    public ListaPaginada() {
    }


    public void setLista(List<?> lista) {
        this.lista = lista;
    }


    public List<?> getLista() {
        return lista;
    }


    public void setTamañoPagina(int tamañoPagina) {
        this.tamañoPagina = tamañoPagina;
    }


    public int getTamañoPagina() {
        return tamañoPagina;
    }
    
    
    public boolean isEsUltimaPagina() {
        return (getPagina() >= getNumeroTotalPaginas());
    }
    
    
    public boolean isEsPrimeraPagina() {
        return (getPagina() == 1);
    }
    
    
    public int getNumeroTotalPaginas() {
        if (lista == null || tamañoPagina <= 0) {
           return 0;
        }
        
        return (int) Math.ceil((double)lista.size()/(double)tamañoPagina);
    }
    
    
    public void setPagina(int pagina) {
        this.pagina = pagina;
    }


    public int getPagina() {
        int pag = pagina;
        int numeroTotalPaginas = getNumeroTotalPaginas();
        
        if (pag > numeroTotalPaginas) {
            pag = numeroTotalPaginas;
        }
        
        if (pag < 1) {
            pag = 1;
        }
        
        return pag;
    }
    
    
    public List<Object> getElementosPagina() {
        if (lista == null || tamañoPagina <= 0) {
            return null;
        }
        
        List<Object> lstPagina = new ArrayList<Object>(tamañoPagina);
        
        int inicio = (getPagina()-1) * tamañoPagina;  // Primer elemento a devolver
        int añadidos = 0;  // Numero de elementos añadidos
        for (int i=inicio; i < lista.size() && añadidos < tamañoPagina; i++) {
            lstPagina.add(lista.get(i));
            añadidos++;
        }
        
        return lstPagina;
    }
    
    
    public int getSiguientePagina() {
        int pag = getPagina();
        
        if (pag >= getNumeroTotalPaginas()) {
            return getNumeroTotalPaginas();
        }
        else {
            return pag+1;
        }
    }
    
    
    public int getAnteriorPagina() {
        int pag = getPagina();
        
        if (pag <= 1) {
            return 1;
        }
        else {
            return pag-1;
        }
    }
}
