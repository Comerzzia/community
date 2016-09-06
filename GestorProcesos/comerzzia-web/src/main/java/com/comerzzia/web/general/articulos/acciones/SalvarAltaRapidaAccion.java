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

import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean;
import com.comerzzia.persistencia.general.articulos.unidadesmedidas.UnidadMedidaArticuloBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.ArticuloConstraintViolationException;
import com.comerzzia.servicios.general.articulos.ArticuloException;
import com.comerzzia.servicios.general.articulos.ArticuloNotFoundException;
import com.comerzzia.servicios.general.articulos.ServicioArticulos;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SalvarAltaRapidaAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("general/articulos/mantenimiento/jsp/altaRapidaArticulo.jsp",Vista.INTERNA);

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(SalvarAltaRapidaAccion.class);

	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "salvarAltaRapida";
	}

	/**
	 * Ejecuta la acción
	 * 
	 * @param request
	 *            Datos de la petición
	 * @return Vista con la siguiente pagina a mostrar
	 */
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
			if (!permisos.isPuedeAñadir() && !permisos.isPuedeEditar()) {
				return SIN_PERMISO;
			}

			ArticuloBean articulo = new ArticuloBean();
			articulo.setEstadoBean(Estado.NUEVO);
			articulo.getArticuloTarifa().setEstadoBean(Estado.NUEVO);

			// Rellenamos el objeto artículo
			setParameters(request, articulo);

			//Antes de salvar comprobamos la longitud de la descripción del artículo
			if(articulo.getDesArticulo().length() <= 45){
				// Salvamos
				ServicioArticulos.salvar(articulo, datosSesion);
			}
			else{
				setMensajeError(request, "La descripción del artículo no debe contener más de 45 carácteres.");
				return NEXT_PAGE;
			}

			request.setAttribute("codArticuloAlta", generarCodArticulo(articulo.getCodArticulo(), datosSesion));
			
			setMensaje(request, "El artículo se ha grabado correctamente");
							
			return NEXT_PAGE;
		
		} 
		catch (ArticuloConstraintViolationException e) {
			setMensajeError(request, e.getMessage());

			return NEXT_PAGE;
		} 
		catch (ArticuloException e) {
			setError(request, e);

			return ERROR_PAGE;
		} 
		catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}

	/**
	 * Lee del request los valores del formulario y rellena ArticuloBean.
	 * 
	 * @param request
	 * @param articulo
	 */
	private void setParameters(HttpServletRequest request, ArticuloBean articulo) {
		articulo.setCodArticulo(request.getParameter("codArticuloAlta"));
		articulo.setDesArticulo(request.getParameter("desArticuloAlta"));
		
		if(articulo.getDesArticulo().contains("#") && !request.getParameter("variable").isEmpty()){
			articulo.setDesArticulo(articulo.getDesArticulo().replaceAll("#", request.getParameter("variable")));
		}
		
		// Organización
		articulo.setFormato(request.getParameter("formato"));
		articulo.setCodFamilia(request.getParameter("codFamiliaAlta"));
		articulo.setDesFamilia(request.getParameter("desFamiliaAlta"));
		articulo.setCodSeccion(request.getParameter("codSeccion"));
		articulo.setDesSeccion(request.getParameter("desSeccion"));
		articulo.setCodCategorizacion(request.getParameter("codCategorizacion"));
		articulo.setDesCategorizacion(request.getParameter("desCategorizacion"));
		articulo.setCodImpuesto(request.getParameter("codImpuesto"));
		articulo.setDesImpuesto(request.getParameter("desImpuesto"));

		// Códigos de barra
		if(!request.getParameter("codigoBarras").isEmpty()){
			CodigoBarrasArticuloBean codigoBarras = new CodigoBarrasArticuloBean();
			codigoBarras.setEstadoBean(Estado.NUEVO);
			codigoBarras.setCodigoBarras(request.getParameter("codigoBarras"));
			codigoBarras.setDesglose1("*");
			codigoBarras.setDesglose2("*");
			articulo.getCodigosBarras().add(codigoBarras);
		}

		// Unidades de medida
		UnidadMedidaArticuloBean unidadMedida = new UnidadMedidaArticuloBean();
		unidadMedida.setEstadoBean(Estado.NUEVO);
		unidadMedida.setUnidadMedida("UNID");
		unidadMedida.setFactorConversion(Numero.desformatea("1", 0.0));
		unidadMedida.setPeso(null);
		articulo.getUnidadesMedidas().add(unidadMedida);

		// Unidad de medida CAJA
		if(!request.getParameter("unidadesCaja").isEmpty()){
			unidadMedida = new UnidadMedidaArticuloBean();
			unidadMedida.setEstadoBean(Estado.NUEVO);
			unidadMedida.setUnidadMedida("CAJA");
			double unidadesCaja = Numero.desformatea(request.getParameter("unidadesCaja"), null);
			unidadMedida.setFactorConversion(unidadesCaja);
			unidadMedida.setPeso(null);
			articulo.getUnidadesMedidas().add(unidadMedida);

			// Unidad de medida PALE
			if(!request.getParameter("cajasPale").isEmpty()){
				unidadMedida = new UnidadMedidaArticuloBean();
				unidadMedida.setEstadoBean(Estado.NUEVO);
				unidadMedida.setUnidadMedida("PALE");
				unidadMedida.setFactorConversion(Numero.desformatea(request.getParameter("cajasPale"), null)* unidadesCaja);
				unidadMedida.setPeso(null);
				articulo.getUnidadesMedidas().add(unidadMedida);
			}
		}

		// Etiquetas
		articulo.setCodUnidadMedidaEtiq(request.getParameter("codUnidadMedidaEtiq"));
		articulo.setDesUnidadMedidaEtiq(request.getParameter("desUnidadMedidaEtiq"));
		articulo.setCantidadUnidadMedidaEtiq(Numero.desformatea(request.getParameter("cantidadUnidadMedidaEtiq"), null));

		// Compras
		articulo.setCodProveedor(request.getParameter("codProveedorAlta"));
		articulo.setDesProveedor(request.getParameter("desProveedorAlta"));
		articulo.setDtoProveedor(Numero.desformatea(request.getParameter("dtoProveedor"), 0D));
		articulo.setReferencia(request.getParameter("referencia"));

		// Ventas
		articulo.getArticuloTarifa().setPrecioCosto(Numero.desformatea(request.getParameter("precioCosto"), null));
		articulo.setActAutomaticaCosto(request.getParameter("actualizacionAutomaticaCompra") != null);
		articulo.getArticuloTarifa().setFactorMarcaje(Numero.desformatea(request.getParameter("factorMarcaje"), null));
		articulo.getArticuloTarifa().setPrecioVenta(Numero.desformatea(request.getParameter("precioVenta"), null));
		articulo.getArticuloTarifa().setPrecioTotal(Numero.desformatea(request.getParameter("precioTotal"), null));

	}

	private String generarCodArticulo(String codArticuloAntiguo, DatosSesionBean datosSesion){
		try{
			String prefijo = "";
			String numero = "";
			
			//Obtenemos los valores de las variables numero y prefijo
			for (int i = 0; i < codArticuloAntiguo.length(); i++) {
				if(codArticuloAntiguo.substring(i, i+1).equals("0")){
					prefijo += codArticuloAntiguo.charAt(i);
				}
				else{
					numero = codArticuloAntiguo.substring(i, codArticuloAntiguo.length());
					break;
				}
			}
			
			//Obtenemos la longitud de cada variable
			Integer tamPrefijo = prefijo.length();
			Integer tamNumero = numero.length();
			
			//Obtenemos el siguiente código de artículo
			Long codArticulo = Long.parseLong(numero);
			
			while(true){
				codArticulo++;
				Integer diferencia = String.valueOf(codArticulo).length() - tamNumero;
				
				String codArticuloNuevo = "";
				if(diferencia >= tamPrefijo){
					codArticuloNuevo = String.valueOf(codArticulo);
				}
				else{
					codArticuloNuevo = prefijo.substring(diferencia, tamPrefijo) + codArticulo; 
				}
				
				if(codArticuloNuevo.length() > 13){
					return "";
				}
				else{
					try{
						//Consultamos el artículo para ver si existe
						ServicioArticulos.consultar(codArticuloNuevo, datosSesion);	
					}
					catch (ArticuloNotFoundException e) {
						//Enviamos el código del artículo
						return codArticuloNuevo;
					}
				}
			}
		}
		catch (Exception ignore) {
			return "";
		}
		
	}
}
