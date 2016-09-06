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

package com.comerzzia.web.general.clientes.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.clientes.ui.FormularioClienteBean;

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
			FormularioClienteBean formulario = (FormularioClienteBean) sesion
					.getAttribute(WebKeys.FORMULARIO_CLIENTE);
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
								"Debe aceptar o cancelar los cambios de la línea antes de salvar el cliente");
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
						// Obtenemos el cliente y lo actualizamos en el
						// formulario
						DatosSesionBean datosSesion = (DatosSesionBean) sesion
								.getAttribute(WebKeys.DATOS_SESION);
						ClienteBean cliente = (ClienteBean) formulario
								.getRegistroActivo();
						cliente = ServicioClientes.consultar(cliente
								.getCodCli(), datosSesion);
						formulario.inicializar(cliente);
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
	private void leerFormulario(FormularioClienteBean formulario,
			HttpServletRequest request) {
		ClienteBean cliente = (ClienteBean) formulario.getRegistroActivo();

		if (formulario.isEnInsercion()) {
			cliente.setCodCli(request.getParameter("codCli"));
		}

		if (formulario.isEditable()) {
			cliente.setDesCli(request.getParameter("desCli"));
			cliente.setActivo(request.getParameter("activo") != null);

			switch (formulario.getPestañaActiva()) {
			case 0: // Datos Generales
				cliente.setNombreComercial(request.getParameter("nombreComercial"));
				cliente.setDomicilio(request.getParameter("domicilio"));
				cliente.setPoblacion(request.getParameter("poblacion"));
				cliente.setProvincia(request.getParameter("provincia"));
				cliente.setCp(request.getParameter("cp"));
				cliente.setTelefono1(request.getParameter("telefono1"));
				cliente.setTelefono2(request.getParameter("telefono2"));
				cliente.setFax(request.getParameter("fax"));
				cliente.setCodPais(request.getParameter("codPais"));
				cliente.setDesPais(request.getParameter("desPais"));
				cliente.setPersonaContacto(request.getParameter("personaContacto"));
				cliente.setEmail(request.getParameter("email"));
				cliente.setCif(request.getParameter("cif"));
				if (request.getParameter("idTratImp") != null && !request.getParameter("idTratImp").equals("")) {
					cliente.setIdTratImp(Long.parseLong(request.getParameter("idTratImp")));
				}
				cliente.setDesTratImp(request.getParameter("desTratImp"));
				cliente.setIdMedioPagoVencimiento(Numero.desformateaLong(request.getParameter("idMedioPagoVencimiento"), null));
				cliente.setDesMedioPagoVencimiento(request.getParameter("desMedioPagoVencimiento"));
				cliente.setCodTar(request.getParameter("codTar"));
				cliente.setDesTar(request.getParameter("desTar"));
				cliente.setCodSec(request.getParameter("codSec"));
				cliente.setDesSec(request.getParameter("desSec"));
				cliente.setRiesgoConcedido(Numero.desformatea(request.getParameter("riesgoConcecido"), null));

				break;

			case 1: // Datos Bancarios
				cliente.setBanco(request.getParameter("banco"));
				cliente.setDomicilioBanco(request.getParameter("domicilioBanco"));
				cliente.setPoblacionBanco(request.getParameter("poblacionBanco"));
				cliente.setCcc(request.getParameter("ccc"));

				break;

			case 2: // Observaciones
				cliente.setObservaciones(request.getParameter("observaciones"));

				break;
			}
		}
	}
}
