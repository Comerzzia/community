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

package com.comerzzia.web.core.asistente.acciones;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadFile;

import com.comerzzia.persistencia.core.empresas.AsistenteConfiguracionEmpresaBean;
import com.comerzzia.persistencia.core.empresas.EmpresaBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class CambiarLogoAccion extends Accion {

	private long MAX_TAMAÑO = 500*1024;
	
	public String getNombre() {
		return "cambiarLogo";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		
    		AsistenteConfiguracionEmpresaBean asistente = (AsistenteConfiguracionEmpresaBean) sesion.getAttribute(WebKeys.ASISTENTE_CONFIGURACION_BEAN);
    		
    		EmpresaBean empresa = asistente.getEmpresa();
    		
    		MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

            UploadBean uploadBean = new UploadBean();
            //extensiones permitidas
            uploadBean.setWhitelist("*.gif,*.jpg");
            //tamaño máximo (Mb)
            uploadBean.setFilesizelimit(1);
            
            Hashtable<?, ?> files = mrequest.getFiles();
            if ( (files != null) && !files.isEmpty()) {
                UploadFile file = (UploadFile) files.get("logotipo");
                
                if(file.getFileSize() > this.MAX_TAMAÑO){
					setMensajeError(request, "El tamaño de la imagen no puede ser superior a 500KB");
					 asistente.setPasoEmpresa();
					return getControlador().getAccion("verFormulario").ejecutar(request);
				}
                
                empresa.setLogotipo(file.getData());
            }
            
            // Fijamos el paso empresa para que recargue la pagina
            asistente.setPasoEmpresa();
    		
            return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}
}
