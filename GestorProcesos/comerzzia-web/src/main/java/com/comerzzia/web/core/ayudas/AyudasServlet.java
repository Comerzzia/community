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

package com.comerzzia.web.core.ayudas;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.comerzzia.persistencia.core.ayudas.AyudaBean;
import com.comerzzia.persistencia.core.ayudas.ElementoAyudaBean;
import com.comerzzia.persistencia.core.ayudas.ParametrosBuscarAyudasBean;
import com.comerzzia.servicios.core.ayudas.AyudaException;
import com.comerzzia.servicios.core.ayudas.AyudaXMLException;
import com.comerzzia.servicios.core.ayudas.Ayudas;
import com.comerzzia.servicios.core.ayudas.ServicioAyudas;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.util.xml.XMLDocumentException;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.web.base.AccionXML;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.core.ayudas.acciones.ArticuloAccionXML;
import com.comerzzia.web.core.ayudas.acciones.ArticuloCodigoBarrasAccionXML;
import com.comerzzia.web.core.ayudas.acciones.ArticuloPromocionAccionXML;
import com.comerzzia.web.core.ayudas.acciones.ArticuloTarifaAccionXML;
import com.comerzzia.web.core.ayudas.acciones.ArticuloUnidadesMedidaAccionXML;
import com.comerzzia.web.core.ayudas.acciones.ConceptoAlmacenAprovisionamientoBackofficeAccionXML;
import com.comerzzia.web.core.ayudas.acciones.ConceptoAlmacenCompraAccionXML;
import com.comerzzia.web.core.ayudas.acciones.ConceptoAlmacenRegularizacionAccionXML;
import com.comerzzia.web.core.ayudas.acciones.ConceptoAlmacenRegularizacionBackofficeAccionXML;
import com.comerzzia.web.core.ayudas.acciones.ConceptoAlmacenVentaAccionXML;
import com.comerzzia.web.core.ayudas.acciones.DatosClienteAlbaranVentaAccionXML;
import com.comerzzia.web.core.ayudas.acciones.InventarioAccionXML;
import com.comerzzia.web.core.ayudas.acciones.MedioPagoProveedorAccionXML;
import com.comerzzia.web.core.ayudas.acciones.PromocionPrecioArticuloAccionXML;
import com.comerzzia.web.core.ayudas.acciones.TiposEfectosAccionXML;

/**
 * Servlet implementation class AyudasServlet
 */
public class AyudasServlet extends HttpServlet {
    
    /** serialVersionUID */
	private static final long serialVersionUID = -6048820120577646471L;

	/** Log */
	private static Logger log = Logger.getMLogger(AyudasServlet.class);
	
	/** Página de ayuda */
    protected static final String NEXT_PAGE = "/ayuda/jsp/ayuda.jsp";
    /** Página de error */
	protected static final String ERROR_WIN = "/comun/jsp/ventana_error.jsp";

	/** Acciones que puede llevar a cabo el servlet */
    protected HashMap<String, AccionXML> acciones;

    /** PrintWriter */
    protected PrintWriter out;
    	
    protected static final String CONTENT_TYPE = "text/xml; charset=UTF-8";
    protected static final String RESPONSE_TAG = "CMZ";
    protected static final String ERROR_TAG    = "ERROR";

    private static String mensaje = "En estos momentos no podemos atender su petición. Disculpe las molestias";

    /** Mapings por donde van a venir las peticiones al servlet */
    private static String AYUDA = "ayuda";
    private static String AYUDA_CMZ = "ayuda.cmz";
    
	/**
     * @throws IOException 
	 * @see HttpServlet#HttpServlet()
     */
    public AyudasServlet(){
    	super();
    	acciones = new HashMap<String, AccionXML>();
    	loadAcciones();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		performTask(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		performTask(request, response);
	}

	protected void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Cogemos la uri de la que vamos a extraer el mapeo
        String uri = request.getRequestURI();
        String maping = uri.substring(uri.lastIndexOf("/") + 1, uri.length());

        try{
			//Obtenemos la sesion y los datos de sesión
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			out = response.getWriter();
		    
            //Búsqueda normal por código y descripción
            if(maping.equals(AYUDA)){
            	//Llamamos al método privado que realiza esta acción
            	ayudaBuscar(request, response, datosSesion);
        		
        		// devolvemos a la página de ayuda
                forward(request,response, NEXT_PAGE);
            }
            //Búsqueda de la descripción a partir de un código pasado por parámetro
            else if(maping.equals(AYUDA_CMZ)){
            	//Llamamos al método privado que realiza esta acción            	
            	ayudaBuscarXML(request, response, datosSesion);
            }
            //Búsqueda más específica, obteniene todos los datos en una acción indicada
            else{
            	//Cogemos el nombre de la acción
        		String nombreAccion = maping.substring(0,maping.lastIndexOf("."));
        		//Llamamos al método privado que realiza esta acción
        		ayudaAccionXML(request, response, datosSesion, nombreAccion);
            }
		} 
		catch (AyudaXMLException e) {
			sendErrorResponse(out, e.getMessage());		
		} 
		catch (AyudaException e) {
			if(maping.equals(AYUDA)){
				forward(request, response, ERROR_WIN);
			}
			else{
				sendErrorResponse(out, e.getMessage());
			}
		} 
		catch (XMLDocumentException e) {
			log.error(e.getMessage());
			throw new RuntimeException(mensaje);
		} 
		catch (Exception e) {
			e.printStackTrace();
			if(maping.equals(AYUDA)){
				forward(request, response, ERROR_WIN);
			}
			else{
				sendErrorResponse(out, e.getMessage());
			}
		}
	}
	
	/**
	 * Recibe un código y una descripción por las que consulta y obtiene una lista de resultados que
	 * es enviada a la jsp
	 * @param request
	 * @param response
	 * @param datosSesion
	 * @throws AyudaException
	 * @throws ServletException
	 * @throws IOException
	 */
	private void ayudaBuscar(HttpServletRequest request, HttpServletResponse response, DatosSesionBean datosSesion) throws AyudaException{
        //Construimos el response
		construyeResponse(response);
		
		HttpSession sesion = request.getSession();
		
		//Recojo el tipo de búsqueda
		String nombreAyuda = request.getParameter(WebKeys.NOMBRE_AYUDA);

		//Obtenemos los datos de la ayuda mediante el nombre de esta
		Ayudas ayudas = Ayudas.getInstance();
		AyudaBean ayuda = ayudas.getAyuda(nombreAyuda);

        //Instanciamos los parámetros de búsqueda
		ParametrosBuscarAyudasBean param = (ParametrosBuscarAyudasBean)sesion.getAttribute(WebKeys.PARAM_BUSCAR_AYUDAS);

		//Recogemos la operación
		String operacion = request.getParameter("operacion");
		if(operacion == null || operacion.isEmpty()){
			//Instacio los parámetros de búsqueda ya que al entrar en este if
			//quiere decir que es la 1º vez que se entra en la búsqueda
			param = new ParametrosBuscarAyudasBean();
			param.setTamañoPagina(15);
			param.setOrden(ayuda.getCampoDescripcion());
			//Compruebo si hay campo filtro
			param.setCampoFiltro(request.getParameter("campoFiltro"));
			sesion.setAttribute(WebKeys.PARAM_BUSCAR_AYUDAS, param);
		}
		
        if (operacion != null) {
            // Consultar
            if (operacion.equals("consultar")) {
                setParametrosBuscar(ayuda, param, request);
            }
            // Ver pagina
            else if (operacion.equals("paginar")) {
                setPaginaBuscar(param, request);
            }
            // Ordenar
            else if (operacion.equals("ordenar") && param.getNumPagina() > 0) {
                setOrdenBuscar(ayuda, param, request);
            }
        }

        //Si la consulta es auto y no tenemos operación tenemos que poner tamaño de página
        if((ayuda.isConsultaAuto())&&(operacion == null)){
        	param.setNumPagina(1);
        }
        
		//Si la consulta es automática ó tenemos operación
		if(param.getNumPagina() > 0){
			//Consultamos para obtener la lista de resultados
			PaginaResultados paginaResultados = ServicioAyudas.consultar(ayuda, param, datosSesion);

			//Enviamos por el request la lista de resultados obtenida en la consulta
			request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
		}

		//Enviamos los parámetros de vuelta en el request
		request.setAttribute(WebKeys.AYUDA_BEAN, ayuda);
	}
	
	/**
	 * Obtiene mediante el código la descripción que le corresponde
	 * @param request
	 * @param response
	 * @param datosSesion
	 * @throws IOException 
	 * @throws AyudaException
	 * @throws ServletException
	 * @throws IOException
	 * @throws AyudaException 
	 * @throws XMLDocumentException 
	 * @throws AyudaXMLException 
	 */
	private void ayudaBuscarXML(HttpServletRequest request, HttpServletResponse response, DatosSesionBean datosSesion) throws AyudaException, XMLDocumentException, AyudaXMLException{
        //Construimos el response
		construyeResponse(response);
		
        //Recojo el tipo de búsqueda
		String nombre = request.getParameter(WebKeys.NOMBRE_AYUDA);
		//Recogemos el código
		String codigo = request.getParameter("codigo");

		//Obtenemos los datos de la ayuda
		Ayudas ayudas = Ayudas.getInstance();
		AyudaBean ayuda = ayudas.getAyuda(nombre);

		//Consultamos para obterner el objeto
		ElementoAyudaBean elemento = ServicioAyudas.consultar(ayuda, codigo.toUpperCase(), datosSesion);

		if(elemento != null){
			//Creamos el xml con los datos del elemento, este contiene el código y la descripción
			Document xml = XMLDocumentUtils.createDocument();
            Element root = XMLDocumentUtils.createElement(xml, RESPONSE_TAG, "");
            XMLDocumentUtils.appendChild(xml, root, "codigo", elemento.getCodigo());
            XMLDocumentUtils.appendChild(xml, root, "descripcion", elemento.getDescripcion());
            xml.appendChild(root);
            
            //Enviamos el xml por la respuesta
            XMLDocumentUtils.serialize(xml, out);
		}
        else {
        	//Si no tenemos elemento significa que el código introducido no existe para esa ayuda
            log.debug("AyudasServlet : " + ayuda.getTituloVentana() + ": El código " + codigo + " no existe");
            throw new AyudaXMLException(ayuda.getTituloVentana() + ": El código " + codigo + " no existe");
        }
		
	}
	
	/**
	 * Obtenemos datos asociados a un código pasando por una acción
	 * @param request
	 * @param response
	 * @param datosSesion
	 * @param nombreAccion
	 * @throws AyudaXMLException 
	 * @throws XMLDocumentException 
	 */
	private void ayudaAccionXML(HttpServletRequest request, HttpServletResponse response, DatosSesionBean datosSesion, String nombreAccion) throws AyudaXMLException, XMLDocumentException{
        //Construimos el response
		construyeResponse(response);
		
		//Cogemos la acción indicada
		AccionXML accion = getAccion(nombreAccion);
		if (accion != null) {
            log.debug("AyudasServlet.performTask(): " + nombreAccion);
            
            Document document = XMLDocumentUtils.createDocument();
            Element root = XMLDocumentUtils.createElement(document, RESPONSE_TAG, "");
            Element respuesta = accion.ejecutar(request, document);
            root.appendChild(respuesta);
            document.appendChild(root);
        
            //Enviamos el xml por la respuesta
            XMLDocumentUtils.serialize(document, out);
        }
        else {
            log.error("AyudasServlet : Accion \"" + nombreAccion + "\" no implementada");
            throw new AyudaXMLException("Acción \"" + nombreAccion + "\" no implementada");
        }
		
	}
	
	/**
	 * Pone en el response el content type y varios campos más en la cabecera
	 * @param response
	 */
	private void construyeResponse(HttpServletResponse response){
        response.setContentType(CONTENT_TYPE);
        response.setHeader("Pragma", "no-cache" );
        response.addHeader("Cache-Control", "must-revalidate" );
        response.addHeader("Cache-Control", "no-cache" );
        response.addHeader("Cache-Control", "no-store" );
        response.setDateHeader("Expires", 0);
		
	}
	
	/**
	 * Método necesario para redirigir desde el servlet hacia un jsp
	 * @param request
	 * @param response
	 * @param page
	 * @throws ServletException
	 * @throws IOException
	 */
    protected void forward (HttpServletRequest request, HttpServletResponse response, String page)throws ServletException, IOException {
    	RequestDispatcher dispatch = request.getRequestDispatcher(page);
    	dispatch.forward(request, response);
    }

    /**
     * Método que busca en las acciones una acción concreta que se recibe por parámetro
     * @param nombre
     * @return AccionXML
     */
    protected AccionXML getAccion(String nombre){
        return (AccionXML)acciones.get(nombre);
    }

    /**
     * Carga las acciones XML definidas
     */
    protected void loadAcciones() {
    	añadirAccion(new ArticuloAccionXML());
    	añadirAccion(new ArticuloUnidadesMedidaAccionXML());
    	añadirAccion(new MedioPagoProveedorAccionXML());
    	añadirAccion(new DatosClienteAlbaranVentaAccionXML());
    	añadirAccion(new ArticuloTarifaAccionXML());
    	añadirAccion(new ConceptoAlmacenCompraAccionXML());
    	añadirAccion(new ConceptoAlmacenVentaAccionXML());
    	añadirAccion(new ConceptoAlmacenRegularizacionAccionXML());
    	añadirAccion(new ConceptoAlmacenRegularizacionBackofficeAccionXML());
    	añadirAccion(new TiposEfectosAccionXML());
    	añadirAccion(new PromocionPrecioArticuloAccionXML());
    	añadirAccion(new ArticuloPromocionAccionXML());
    	añadirAccion(new InventarioAccionXML());
    	añadirAccion(new ConceptoAlmacenAprovisionamientoBackofficeAccionXML());
    	añadirAccion(new ArticuloCodigoBarrasAccionXML());
    }
    
    protected void añadirAccion(AccionXML accion) {
    	acciones.put(accion.getNombre(), accion);
    }
    
    /**
     * Envía un mensaje de error como respuesta
     * @param mensaje
     * @param out
     */
    protected void sendErrorResponse(PrintWriter out, String mensaje) {
        out.println("<" + RESPONSE_TAG + ">");
        out.println(    "<" + ERROR_TAG + ">" + mensaje + "</" + ERROR_TAG + ">");
        out.println("</" + RESPONSE_TAG + ">");
    }

    private void setParametrosBuscar(AyudaBean ayuda, ParametrosBuscarAyudasBean param, HttpServletRequest request) {
		param.setCodigo(request.getParameter("codigo"));
		param.setDescripcion(request.getParameter("descripcion"));
		
        param.setNumPagina(1);
 
        // Actualizar el número de resultados por página
        try {
        	param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
        } catch(Exception ignore) {
        	// Si no se recibe el número de resultados, se mantiene el que se tenía
        }
    }
    
    private void setPaginaBuscar(ParametrosBuscarAyudasBean param, HttpServletRequest request) {
        try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
    
    private void setOrdenBuscar(AyudaBean ayuda, ParametrosBuscarAyudasBean param, HttpServletRequest request) {
    	try {
            // Establecemos primera pagina
            param.setNumPagina(1);
            
            // Obtenemos la columna por la que ordenar
            int columna = Integer.parseInt(request.getParameter("columna"));
            
            // Establecemos la columna de orden
            switch (columna) {
                case 1:  
                    if (param.getOrden().equals(ayuda.getCampoCodigo())) {
                        param.setOrden(ayuda.getCampoCodigo() + " DESC");
                    }
                    else {
                        param.setOrden(ayuda.getCampoCodigo());
                    }
                    break;
                case 2:  
                    if (param.getOrden().equals(ayuda.getCampoDescripcion())) {
                        param.setOrden(ayuda.getCampoDescripcion() + " DESC");
                    }
                    else {
                        param.setOrden(ayuda.getCampoDescripcion());
                    }
                    break;
                default:
                    param.setOrden(ayuda.getCampoDescripcion());
            }
        }
        catch (Exception e) {
        	// Si no tenemos orden, se dejar el que se tenía
        }
    }

}
