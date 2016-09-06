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

package com.comerzzia.web.general.articulos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.almacenes.articulos.AlmacenArticuloBean;
import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean;
import com.comerzzia.persistencia.general.articulos.unidadesmedidas.UnidadMedidaArticuloBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.ServicioArticulos;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.articulos.ui.FormularioArticuloBean;


public class LeerFormularioAccion extends Accion {
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(LeerFormularioAccion.class);
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
	public String getNombre() {
		return "leerFormulario";
	}
	
	/**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			
			// Obtenemos la operación solicitada
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			log.debug("ejecutar() - operacion=" + operacion + " indice=" + indice);
			
			// Actualizamos el formulario
			FormularioArticuloBean formulario = (FormularioArticuloBean) sesion.getAttribute(WebKeys.FORMULARIO_ARTICULO);
			if (operacion == null || !operacion.equals("cancelar")) {
				leerFormulario(formulario, request);
			}
			
            if (operacion != null) {
            	// Cambiar pestaña activa
                if (operacion.equals("pestaña")) {
                	formulario.setPestañaActiva(Integer.parseInt(indice));
                }
                // Cambiar modo visualización de la pestaña activa 
                else if (operacion.equals("vistaTablaPestaña")) {
                	formulario.getFormularioPestañaActiva().setModoVisualizacionTabla();
                }
                // Ver un registro de la pestaña activa
                else if (operacion.equals("verRegistroPestaña")) {
                	
                	formulario.getFormularioPestañaActiva().seleccionaRegistroActivo(Integer.parseInt(indice));
                	formulario.getFormularioPestañaActiva().setModoVisualizacionFicha();
                }
                // Añadir un nuevo registro a la pestaña activa
                else if (operacion.equals("nuevoRegistroPestaña")) {
                	switch (formulario.getPestañaActiva()) {
	    				case 2:  // Codigos de Barras
	    					CodigoBarrasArticuloBean codigo = new CodigoBarrasArticuloBean();
	    					formulario.getFormularioPestañaActiva().setModoInsercion(codigo);
	    					break;
	    				case 3:  // Unidades de Medida
	    					UnidadMedidaArticuloBean unidadMedida = new UnidadMedidaArticuloBean();
	    					formulario.getFormularioPestañaActiva().setModoInsercion(unidadMedida);
	    			}
                }
                // Editar un registro de la pestaña activa
                else if (operacion.equals("editarRegistroPestaña")) {
                	//
                	if (formulario.getPestañaActiva() == 5){
                		formulario.getFormularioPestañaActiva().seleccionaRegistroActivo(Integer.parseInt(indice));
                		ArticuloTarifaBean articuloTarifa = (ArticuloTarifaBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
                		if (articuloTarifa.isTarifaGeneral()){
                			setMensajeAviso(request, "Para editar los detalles de la tarifa general del artículos, utilice la pestaña de datos generales.");
                		}
                		else{
                			formulario.getFormularioPestañaActiva().setModoEdicion(Integer.parseInt(indice));
                		}
                	}
                	else{
                		formulario.getFormularioPestañaActiva().setModoEdicion(Integer.parseInt(indice));
                	}
                }
                // Eliminar un registro de la pesaña activa
                else if (operacion.equals("eliminarRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().eliminar(Integer.parseInt(indice));
                }
                // Aceptar cambios del formulario de la pestaña activa
                if (operacion.equals("aceptarRegistroPestaña")) {
                	leerFormularioRegistro(formulario, request);
                	formulario.getFormularioPestañaActiva().aceptar();
                }
                // Cancelar cambios del formulario de la pestaña activa
                else if (operacion.equals("cancelarRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().cancelar();
                }
                // Aceptar cambios del formulario
                else if (operacion.equals("aceptar")) {
                	// Si tenemos algún formulario en edición forzamos a que se acepten o cancelen los cambios
                	int pestaña = formulario.getIndicePrimeraPestañaEditable();
                	if (pestaña != -1) {
                		formulario.setPestañaActiva(pestaña);
                		setMensajeError(request, "Debe aceptar o cancelar los cambios de la línea antes de salvar el artículo");
                	}
                	else {
                		return getControlador().getAccion("salvar").ejecutar(request);
                	}
                }
                // Cancelar cambios en el formulario
                else if (operacion.equals("cancelar")) {
                	formulario.cancelar();
                	
                	// Si no tenemos registro activo volvemos al buscador
                	if (formulario.isRegistroActivoVacio()) {
                		return getControlador().getAccion("buscar").ejecutar(request);
                	}
                	else {
                		// Obtenemos el artículo y lo actualizamos en el formulario
                		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
                		ArticuloBean articulo = (ArticuloBean) formulario.getRegistroActivo();
                		articulo = ServicioArticulos.consultar(articulo.getCodArticulo(), datosSesion);
                		formulario.inicializar(articulo);
                	}
                }
            }

            if(formulario.getPestañaActiva() == 3){
        		request.setAttribute("lstUnidadesMedidas", formulario.obtenerListaUnidadesMedidas());               		
        	}
            
            // Mostramos el formulario
            return getControlador().getAccion("verFormulario").ejecutar(request);
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	/**
	 * Lee los campos del formulario principal y del formulario de la pestaña activa
	 * actualizando los atributos del registro activo
	 * @param formulario
	 * @param request
	 */
	private void leerFormulario(FormularioArticuloBean formulario, HttpServletRequest request) {
		ArticuloBean articulo = (ArticuloBean) formulario.getRegistroActivo();
		
		if (formulario.isEnInsercion()) {
			articulo.setCodArticulo(request.getParameter("codArticulo"));
		}
		
		if (formulario.isEditable()) {
			articulo.setDesArticulo(request.getParameter("desArticulo"));
			articulo.setActivo(request.getParameter("activo")!= null);
			
			switch (formulario.getPestañaActiva()) {
				case 0:  // Datos Generales
					//Organización
					articulo.setFormato(request.getParameter("formato"));
					articulo.setCodFamilia(request.getParameter("codFamilia"));
					articulo.setDesFamilia(request.getParameter("desFamilia"));
					articulo.setCodSeccion(request.getParameter("codSeccion"));
					articulo.setDesSeccion(request.getParameter("desSeccion"));
					articulo.setCodCategorizacion(request.getParameter("codCategorizacion"));
					articulo.setDesCategorizacion(request.getParameter("desCategorizacion"));
					articulo.setEscaparate(request.getParameter("escaparate") != null);
					//articulo.setNumSeries(request.getParameter("numSeries") != null);
					articulo.setGenerico(request.getParameter("generico") != null);
					articulo.setDesglose1(request.getParameter("_desglose1") != null);
					articulo.setDesglose2(request.getParameter("desglose2") != null);
					articulo.setCodImpuesto(request.getParameter("codImpuesto"));
					articulo.setDesImpuesto(request.getParameter("desImpuesto"));
					//Compras
					articulo.setCodProveedor(request.getParameter("codProveedor"));
					articulo.setDesProveedor(request.getParameter("desProveedor"));
					articulo.setDtoProveedor(Numero.desformatea(request.getParameter("dtoProveedor"), 0D));
					articulo.setReferencia(request.getParameter("referencia"));
					articulo.setCodFabricante(request.getParameter("codFabricante"));
					articulo.setDesFabricante(request.getParameter("desFabricante"));
					//Precios
					articulo.setActAutomaticaCosto(request.getParameter("actualizacionAutomaticaCompra") != null);
					articulo.getArticuloTarifa().setPrecioCosto(Numero.desformatea(request.getParameter("precioCosto"), null));
					articulo.getArticuloTarifa().setFactorMarcaje(Numero.desformatea(request.getParameter("factorMarcaje"), null));
					articulo.getArticuloTarifa().setPrecioVenta(Numero.desformatea(request.getParameter("precioVenta"), null));
					articulo.getArticuloTarifa().setPrecioTotal(Numero.desformatea(request.getParameter("precioTotal"), null));
					
					break;
					
				case 1:  // Observaciones
					articulo.setObservaciones(request.getParameter("observaciones"));
					break;
					
				case 3: // Unidades de medida
					if(!formulario.getFormularioPestañaActiva().isEditable() && !formulario.getFormularioPestañaActiva().isModoVisualizacionFicha()){
						articulo.setCodUnidadMedidaEtiq(request.getParameter("codUnidadMedidaEtiq"));
						articulo.setDesUnidadMedidaEtiq(request.getParameter("desUnidadMedidaEtiq"));
						articulo.setCantidadUnidadMedidaEtiq(Numero.desformatea(request.getParameter("cantidadUnidadMedidaEtiq"), 0D));
						articulo.setUnidadMedAlt(request.getParameter("unidadMedidaAlternativa"));
					}
					break;
			}
		}
	}
	
	
	private void leerFormularioRegistro(FormularioArticuloBean formulario, HttpServletRequest request) {
		switch (formulario.getPestañaActiva()) {
			case 2:  // Codigos de barras
				if (formulario.getFormularioPestañaActiva().isEditable()) {
					CodigoBarrasArticuloBean codigo = (CodigoBarrasArticuloBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					codigo.setCodigoBarras(request.getParameter("codigoBarras"));
					codigo.setDesglose1(request.getParameter("desglose1"));
					codigo.setDesglose2(request.getParameter("desglose2"));
					codigo.setDun14(request.getParameter("dun14") != null);
					if (codigo.isDun14()) {
						codigo.setFactorConversion(Numero.desformatea(request.getParameter("factorConversion"), null));
					}
				}
				break;

			case 3:  // Unidades de medida
				if (formulario.getFormularioPestañaActiva().isEditable()) {
					UnidadMedidaArticuloBean unidadMedida = (UnidadMedidaArticuloBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					unidadMedida.setUnidadMedida(request.getParameter("unidadMedida"));
					unidadMedida.setFactorConversion(Numero.desformatea(request.getParameter("factorConversion"), 0.0));
					unidadMedida.setAlto(Numero.desformateaLong(request.getParameter("alto"),0L));
					unidadMedida.setAncho(Numero.desformateaLong(request.getParameter("ancho"),0L));
					unidadMedida.setFondo(Numero.desformateaLong(request.getParameter("fondo"),0L));
					unidadMedida.setPeso(Numero.desformatea(request.getParameter("peso"), 0D));
				}
				break;
				
			case 4:  // Almacenes
				if (formulario.getFormularioPestañaActiva().isEditable()) {
					AlmacenArticuloBean almacen = (AlmacenArticuloBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					almacen.setStockMinimo(Numero.desformatea(request.getParameter("stockMinimo"), 0D));
					almacen.setStockMaximo(Numero.desformatea(request.getParameter("stockMaximo"), 0D));
				}
				break;
				
			case 5:  // Tarifas
				if (formulario.getFormularioPestañaActiva().isEditable()) {
					ArticuloTarifaBean tarifa = (ArticuloTarifaBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					tarifa.setPrecioCosto(Numero.desformatea(request.getParameter("precioCosto"), null));
					tarifa.setFactorMarcaje(Numero.desformatea(request.getParameter("factorMarcaje"), null));
					tarifa.setPrecioVenta(Numero.desformatea(request.getParameter("precioVenta"), null));
					tarifa.setPrecioTotal(Numero.desformatea(request.getParameter("precioTotal"), null));
				}
				break;
		
		}
	}
}
