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

package com.comerzzia.web.general.proveedores.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.proveedores.ProveedorBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.proveedores.ServicioProveedores;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.proveedores.ui.FormularioProveedorBean;

public class LeerFormularioAccion extends Accion {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(LeerFormularioAccion.class);

	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "leerFormulario";
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

			// Obtenemos la operación solicitada
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			log.debug("ejecutar() - operacion=" + operacion + " indice="
					+ indice);

			// Actualizamos el formulario
			FormularioProveedorBean formulario = (FormularioProveedorBean) sesion
					.getAttribute(WebKeys.FORMULARIO_PROVEEDOR);
			leerFormulario(formulario, request);

			if (operacion != null) {
				// Cambiar pestaña activa
				if (operacion.equals("pestaña")) {
					formulario.setPestañaActiva(Integer.parseInt(indice));
				}
				// Aceptar cambios del formulario
				else if (operacion.equals("aceptar")) {
					// Si tenemos algún formulario en edición forzamos a que se
					// acepten o cancelen los cambios
					int pestaña = formulario.getIndicePrimeraPestañaEditable();
					if (pestaña != -1) {
						formulario.setPestañaActiva(pestaña);
						setMensajeError(request,
								"Debe aceptar o cancelar los cambios de la línea antes de salvar el proveedor");
					} else {
						return getControlador().getAccion("salvar").ejecutar(
								request);
					}
				}
				// Cancelar cambios en el formulario
				else if (operacion.equals("cancelar")) {
					formulario.cancelar();

					// Si no tenemos registro activo volvemos al buscador
					if (formulario.isRegistroActivoVacio()) {
						return getControlador().getAccion("buscar").ejecutar(
								request);
					} else {
						// Obtenemos el proveedor y lo actualizamos en el
						// formulario
						DatosSesionBean datosSesion = (DatosSesionBean) sesion
								.getAttribute(WebKeys.DATOS_SESION);
						ProveedorBean proveedor = (ProveedorBean) formulario
								.getRegistroActivo();
						proveedor = ServicioProveedores.consultar(proveedor
								.getCodPro(), datosSesion);
						formulario.inicializar(proveedor);
					}
				}
			}

			// Mostramos el formulario
			return getControlador().getAccion("verFormulario")
					.ejecutar(request);
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}

	/**
	 * Lee los campos del formulario principal y del formulario de la pestaña
	 * activa actualizando los atributos del registro activo
	 * 
	 * @param formulario
	 * @param request
	 */
	private void leerFormulario(FormularioProveedorBean formulario,
			HttpServletRequest request) {
		ProveedorBean proveedor = (ProveedorBean) formulario
				.getRegistroActivo();

		if (formulario.isEnInsercion()) {
			proveedor.setCodPro(request.getParameter("codPro"));
		}

		if (formulario.isEditable()) {
			proveedor.setDesPro(request.getParameter("desPro"));
			proveedor.setActivo(request.getParameter("activo") != null);

			switch (formulario.getPestañaActiva()) {
			case 0: // Datos Generales
				proveedor.setTipoProveedor(request
						.getParameter("tipoProveedor"));
				proveedor.setNombreComercial(request
						.getParameter("nombreComercial"));
				proveedor.setDomicilio(request.getParameter("domicilio"));
				proveedor.setPoblacion(request.getParameter("poblacion"));
				proveedor.setProvincia(request.getParameter("provincia"));
				proveedor.setCp(request.getParameter("cp"));
				proveedor.setCodPais(request.getParameter("codPais"));
				proveedor.setDesPais(request.getParameter("desPais"));
				proveedor.setTelefono1(request.getParameter("telefono1"));
				proveedor.setTelefono2(request.getParameter("telefono2"));
				proveedor.setFax(request.getParameter("fax"));
				proveedor.setPersonaContacto(request
						.getParameter("personaContacto"));
				proveedor.setEmail(request.getParameter("email"));
				proveedor.setCif(request.getParameter("cif"));
				if (request.getParameter("idTratImp") != null
						&& !request.getParameter("idTratImp").equals("")) {
					proveedor.setIdTratImp(Long.parseLong(request
							.getParameter("idTratImp")));
				}
				proveedor.setDesTratImp(request.getParameter("desTratImp"));
				proveedor.setIdMedioPagoVencimiento(Numero.desformateaLong(request.getParameter("idMedioPagoVencimiento"), null));
				proveedor.setDesMedioPagoVencimiento(request.getParameter("desMedioPagoVencimiento"));

				break;

			case 1: // Datos Bancarios
				proveedor.setBanco(request.getParameter("banco"));
				proveedor.setDomicilioBanco(request
						.getParameter("domicilioBanco"));
				proveedor.setPoblacionBanco(request
						.getParameter("poblacionBanco"));
				proveedor.setCcc(request.getParameter("ccc"));

				break;

			case 2: // Observaciones
				proveedor.setObservaciones(request
						.getParameter("observaciones"));

				break;
			}
		}
	}
}
