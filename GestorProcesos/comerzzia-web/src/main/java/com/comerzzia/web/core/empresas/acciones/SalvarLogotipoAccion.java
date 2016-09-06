/**
 * 
 */
package com.comerzzia.web.core.empresas.acciones;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadFile;

import com.comerzzia.persistencia.core.empresas.EmpresaBean;
import com.comerzzia.servicios.core.empresas.EmpresaConstraintViolationException;
import com.comerzzia.servicios.core.empresas.EmpresaException;
import com.comerzzia.servicios.core.empresas.ServicioEmpresas;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

/**
 *
 */
public class SalvarLogotipoAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("core/empresas/mantenimiento/jsp/empresa.jsp", Vista.INTERNA);
	
	private long MAX_TAMAÑO = 500*1024;
	
	public String getNombre() {
		return "salvarLogotipo";
	}
	
	@SuppressWarnings("unchecked")
	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEditar()) {
    			return SIN_PERMISO;
    		}

    		EmpresaBean empresa = (EmpresaBean) sesion.getAttribute(WebKeys.EMPRESA_BEAN);
    		
    		MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

            UploadBean uploadBean = new UploadBean();
            //extensiones permitidas
            uploadBean.setWhitelist("*.gif,*.jpg");
            //tamaño máximo (Mb)
            uploadBean.setFilesizelimit(1);
            
            Hashtable files = mrequest.getFiles();
            if ( (files != null) && !files.isEmpty()) {
                UploadFile file = (UploadFile) files.get("logotipo");
                
                if(file.getFileSize() > this.MAX_TAMAÑO){
					setMensajeError(request, "El tamaño de la imagen no puede ser superior a 500KB");
					return getControlador().getAccion("ver").ejecutar(request);
				}
                
                empresa.setLogotipo(file.getData());
            }
    		
            ServicioEmpresas.salvarLogotipo(empresa, datosSesion);
    		
       		// Volvemos a consultar el registro
    		try {
    			empresa = ServicioEmpresas.consultar(datosSesion);
    			
    			sesion.setAttribute(WebKeys.EMPRESA_BEAN, empresa);
    			setMensaje(request, "El logotipo se ha cambiado correctamente");
    			return NEXT_PAGE;
    		}
    		catch (Exception e) {
    			setMensajeError(request, "La empresa se ha salvado correctamente pero no se ha podido acceder al registro", e);
    			return getControlador().getAccion("ver").ejecutar(request);
    		}
    	}
    	catch (EmpresaConstraintViolationException e) {
    		setMensajeError(request, e.getMessage());
    		return NEXT_PAGE;
    	}
    	catch (EmpresaException e) {
    		setError(request, e);
            
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}

}
