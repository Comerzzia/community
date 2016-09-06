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

package com.comerzzia.web.core.ui;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.base.ParametrosBuscarBean;

@SuppressWarnings("unchecked")
public class FormularioBean {

	private static final byte VISUALIZACION_MODO_TABLA = 0;
	private static final byte VISUALIZACION_MODO_FICHA = 1;
	
	private String titulo;
	private ParametrosBuscarBean param;
	protected Byte modoVisualización = VISUALIZACION_MODO_TABLA;
	protected boolean enEdicion = false;
	protected boolean enInsercion = false;
	private List<FormularioBean> pestañas = new ArrayList<FormularioBean>();
	private int pestañaActiva = 0;
	
	private List registros = new ArrayList();     // TODO: Establecer tipo de objeto de la lista
	private int indiceRegistroActivo = -1;
	private MantenimientoBean registroActivo = null;
	
	
	/**
	 * Constructor
	 */
	public FormularioBean() {
	}
	
	/**
	 * Constructor
	 * @param titulo Título del formulario
	 */
	public FormularioBean(String titulo) {
		this.titulo = titulo;
	}
	
	/**
	 * Inicializa el formulario
	 */
	public void inicializar() {
		checkModoEdicion();
		
		setRegistros(new ArrayList());
	}
	
	/**
	 * Inicializa el formulario con el objeto pasado
	 * @param objeto
	 */
	public void inicializar(MantenimientoBean objeto) {
		checkModoEdicion();
		
		List lista = new ArrayList();
		lista.add(objeto);
		setRegistros(lista);
	}
	
	/**
	 * Obtiene la lista de registros asociada al formulario
	 * @return the registros
	 */
	public List getRegistros() {
		return registros;
	}

	/**
	 * Establece la lista de registros asociados al formulario y establece
	 * el primero de ellos como registro activo
	 * @param registros the registros to set
	 */
	public void setRegistros(List registros) {
		this.registros = registros;
		primerRegistro();
	}
	
	/**
	 * Obtiene el número de registros
	 * @return
	 */
	protected int getNumRegistros() {
		if (this.registros == null) {
			return 0;
		}
		else {
			return this.registros.size();
		}
	}
	
	/**
	 * Establece el primer registro como registro activo
	 */
	private void primerRegistro() {
		seleccionaRegistroActivo(0);
	}
	
	/**
	 * Establece el último registro como registro activo
	 */
	private void ultimoRegistro() {
		if (this.registros != null && this.registros.size() > 0) {
			seleccionaRegistroActivo(this.registros.size() - 1);
		}
	}
	
	/**
	 * Selecciona un registro como registro activo
	 * @param indice Indice del registro
	 */
	public void seleccionaRegistroActivo(int indice) {
		indiceRegistroActivo = -1;
		registroActivo = null;
		
		if (this.registros != null && this.registros.size() > 0) {
			if (indice >= 0 && indice < this.registros.size()) {
				indiceRegistroActivo = indice;
				actualizaRegistroActivo();
			}
		}
	}
	
	/**
	 * Establece el registro activo del formulario según el indíce indicado
	 * en el atributo indiceRegistroActivo
	 */
	private void actualizaRegistroActivo() {
		checkModoEdicion();
		
		registroActivo = (MantenimientoBean) registros.get(indiceRegistroActivo);
		inicializaRegistroActivo();
	}
	
	/**
	 * Inicializa el registro activo
	 */
	protected void inicializaRegistroActivo() {
	}
	
	/**
	 * Obtiene el registro activo
	 * @return el registro activo
	 */
	public MantenimientoBean getRegistroActivo() {
		return registroActivo;
	}
	
	/**
	 * Comprueba si el formulario está en modo edición o inserción y lo cancela
	 */
	private void checkModoEdicion() {
		if (enEdicion || enInsercion) {
			cancelar();
		}
	}
	
	/**
	 * Establece el formulario en modo inserción
	 * @param newObject Nuevo objeto a insertar
	 */
	public void setModoInsercion(MantenimientoBean newObject) {
		checkModoEdicion();
		
		enInsercion = true;
		newObject.setEstadoBean(Estado.NUEVO);
		registroActivo = newObject;
		inicializaRegistroActivo();
	}
	
	/**
	 * Establece el formulario en modo edición del registro activo
	 */
	public void setModoEdicion() {
		checkModoEdicion();
		
		if (indiceRegistroActivo != -1) {
			enEdicion = true;
			if (registroActivo.getEstadoBean() == Estado.SIN_MODIFICAR) {
				registroActivo.setEstadoBean(Estado.MODIFICADO);
			}
		}
	}
	
	/**
	 * Establece el formulario en modo edición seleccionado previamente el
	 * registro activo según el índice indicado
	 * @param indice Indice del registro a editar
	 */
	public void setModoEdicion(int indice) {
		seleccionaRegistroActivo(indice);
		setModoEdicion();
	}
	
	/**
	 * Cancela el modo inserción o edición en el que estubiera el formulario
	 * y todos los formularios de sus pestañas
	 * Se mantiene como registro activo el último registro activo. 
	 * Si este ha sido modificado deberá restaurarse manualmente
	 */
	public void cancelar() {
		if (enInsercion) {
			enInsercion = false;
		}
		if (enEdicion) {
			enEdicion = false;
		}
		
		seleccionaRegistroActivo(indiceRegistroActivo);
		
		if (pestañas != null) {
			for (FormularioBean formulario : pestañas) {
				formulario.cancelar();
			}
		}
	}
	
	/**
	 * Acepta los cambios del fórmulario, dejando el mismo en modo consulta
	 * y con el registro añadido o modificado como registro activo
	 */
	public void aceptar() {
		if (enInsercion) {
			enInsercion = false;
			if (registros != null) {
				registros.add(registroActivo);
				ultimoRegistro();
			}
		}
		else if (enEdicion) {
			enEdicion = false;
			seleccionaRegistroActivo(indiceRegistroActivo);
		}
		
		if (pestañas != null) {
			for (FormularioBean formulario : pestañas) {
				formulario.aceptar();
			}
		}
	}
	
	/**
	 * Elimina el registro activo de la lista de registros del formulario
	 * Si el estado del bean es NUEVO, lo elimina de la lista
	 * si no lo pone en estado BORRADO
	 * Establece como nuevo registro activo el anterior,
	 * y si no es posible el siguiente
	 */
	public void eliminar() {
		if (indiceRegistroActivo != -1 && registros != null) {
			if (registroActivo != null) {
				if (registroActivo.getEstadoBean() == Estado.NUEVO) {
					registros.remove(indiceRegistroActivo);
					int anterior = getAnterior();
					if (anterior == -1) {
						anterior = indiceRegistroActivo;
					}
					
					seleccionaRegistroActivo(anterior);
				}
				else {
					registroActivo.setEstadoBean(Estado.BORRADO);
					
					// Establecemos el nuevo registro activo al anterior al borrado
					int anterior = getAnterior();
					if (anterior == -1) { // si no existe anterior lo establacemos al siguiente
						anterior = getSiguiente();
					}
					
					seleccionaRegistroActivo(anterior);
				}
			}
		}
	}
	
	/**
	 * Elimina un registro de la lista de registros del formulario
	 * Si el estado del bean es NUEVO, lo elimina de la lista
	 * si no lo pone en estado BORRADO
	 * Establece como nuevo registro activo el anterior,
	 * y si no es posible el siguiente
	 * @param indice Indice del registro a eliminar
	 */
	public void eliminar(int indice) {
		seleccionaRegistroActivo(indice);
		eliminar();
	}
	
	/**
	 * Obtiene el índice del registro activo
	 * @return Indice del registro activo
	 */
	public int getIndiceRegistroActivo() {
		return this.indiceRegistroActivo;
	}	
	
	/**
	 * Indica si no hay registro activo seleccionado
	 * @return true si no hay registro activo seleccionado, false en caso contrario
	 */
	public boolean isRegistroActivoVacio() {
		return (this.indiceRegistroActivo == -1);
	}
		
	
	/**
	 * Obtiene el título del forumulario
	 * @return el título
	 */
	public String getTitulo() {
		return titulo;
	}

	/**
	 * Establece el título del formulario
	 * @param titulo El título del formulario
	 */
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	/**
	 * Obtiene los parámetros de búsqueda asociados a un formulario
	 * @return los parámetros de búsqueda del formulario
	 */
	public ParametrosBuscarBean getParam() {
		return param;
	}
	
	/**
	 * Establece los parámetros de búsqueda asociados al formulario
	 * @param param Los parámetros de búsqueda del formulario
	 */
	public void setParam(ParametrosBuscarBean param) {
		this.param = param;
	}
	
	/**
	 * Establece el modo de visualización ficha del formulario
	 */
	public void setModoVisualizacionFicha() {
		this.modoVisualización = VISUALIZACION_MODO_FICHA;
	}
	
	/**
	 * Establece el modo de visualización tabla del formulario
	 */
	public void setModoVisualizacionTabla() {
		this.modoVisualización = VISUALIZACION_MODO_TABLA;
	}
	
	/**
	 * Indica si el formulario está en modo de visualización tabla
	 * @return true si el formulario está en modo visualización tabla, false en caso contrario
	 */
	public boolean isModoVisualizacionTabla() {
		return this.modoVisualización == VISUALIZACION_MODO_TABLA;
	}
	
	/**
	 * Indica si el formulario está en modo de visualización ficha
	 * @return true si el formulario está en modo visualización ficha, false en caso contrario
	 */
	public boolean isModoVisualizacionFicha() {
		return ((this.modoVisualización == VISUALIZACION_MODO_FICHA || isEnEdicion()) && indiceRegistroActivo >= 0) || isEnInsercion();
	}
	
	/**
	 * Indica si el formulario está en modo edición de un registro
	 * @return true si el formulario está en modo edición, false en caso contrario
	 */
	public boolean isEnEdicion() {
		return enEdicion;
	}
	
	/**
	 * Indica si el formulario está en modo inserción de un nuevo registro
	 * @return true si el formulario entá en modo inserción, false en caso contrario
	 */
	public boolean isEnInsercion() {
		return enInsercion;
	}

	/**
	 * Indica si el formulario es editable, esto es si está en modo inserción o modo edición
	 * @return true si el formulario está en modo inserción o modo edición, false en caso contrario
	 */
	public boolean isEditable() {
		return this.enInsercion || this.enEdicion;
	}
	
	
	/**
	 * Obtiene los forularios de las pestañas asociadas al formulario
	 * @return Lista de formularios de las pestañas
	 */
	public List<FormularioBean> getPestañas() {
		return pestañas;
	}
	
	/**
	 * Establece la lista de formularios de pestañas
	 * @param pestañas La lista de pestañas
	 */
	public void setPestañas(List<FormularioBean> pestañas) {
		this.pestañas = pestañas;
	}
	
	/**
	 * Añade un nuevo formulario como pestaña
	 * @param pestaña El formulario de la pestaña
	 */
	public void addPestaña(FormularioBean pestaña) {
		pestañas.add(pestaña);
	}
	
	/**
	 * Obtiene la pestaña por su índice
	 * @param indice ïndice de la pestaña a obtener
	 * @return
	 */
	public FormularioBean getPestaña(int indice) {
		return pestañas.get(indice);
	}
	
	/**
	 * Obtiene el índice de la pestaña marcada como pestaña activa
	 * @return the pestañaActiva
	 */
	public int getPestañaActiva() {
		return pestañaActiva;
	}
	
	/**
	 * Establece la pestaña activa del formulario
	 * @param pestañaActiva indice de la pestaña
	 */
	public void setPestañaActiva(int pestañaActiva) {
		this.pestañaActiva = pestañaActiva;
	}
	
	/**
	 * Obtiene el formulario de la pestaña activa
	 * @return El formulario de la pestaña activa
	 */
	public FormularioBean getFormularioPestañaActiva() {
		return pestañas.get(pestañaActiva);
	}
	
	/**
	 * Obtiene el índice de la primera pestaña del formulario que
	 * está en modo inserción o edición
	 * @return índice de la pestaña
	 */
	public int getIndicePrimeraPestañaEditable() {
		if (pestañas != null) {
			for (int i=0; i < pestañas.size(); i++) {
				FormularioBean pestaña = pestañas.get(i);
				if(pestaña.isEditable()) {
					return i;
				}
			}
		}
		
		return -1;
	}
	
	
	// Funciones para navegación por registros activos
	
	/**
	 * Devuelve el número total de registros no borrados
	 * @return Número total de registros no borrados
	 */
	public int getTotal() {
		if (this.registros == null) {
			return 0;
		}
		else {
			int contador = 0;
			for (Iterator it = registros.iterator(); it.hasNext(); ) {
				MantenimientoBean registro = (MantenimientoBean) it.next();
				if (registro.getEstadoBean() != Estado.BORRADO) {
					contador++;
				}
			}
			
			return contador;
		}
	}
	
	/**
	 * Devuelve la posición de registro activo actual dentro de la lista de
	 * registros no borrados
	 * @return posición del registro
	 */
	public int getActual() {
		int contador = 0;
		
		if (indiceRegistroActivo != -1 && this.registros != null) {
			for (int i=0; i <= indiceRegistroActivo; i++) {
				MantenimientoBean registro = (MantenimientoBean) registros.get(i);
				if (registro.getEstadoBean() != Estado.BORRADO) {
					contador++;
				}
			}
		}
		
		return contador;
	}
	
	/**
	 * Obtiene el índice del primer registro no borrado
	 * devolviendo -1 si no hay primer registro
	 * @return índice del primer registro no borrado de la lista de registros
	 */
	public int getPrimero() {
		int indice = -1;
		
		if (this.registros != null) {
			for (int i=0; i < registros.size(); i++) {
				MantenimientoBean registro = (MantenimientoBean) registros.get(i);
				if (registro.getEstadoBean() != Estado.BORRADO) {
					// Si no es el registro activo lo devolvemos como índice del primer registro
					if (i != indiceRegistroActivo) {
						indice = i;
					}
					break;
				}
			}
		}
		
		return indice;
	}
	
	/**
	 * Obtiene el índice del anterior registro no borrado
	 * respecto al registro activo actual, devolviendo -1 si no hay registro activo anterior
	 * @return índice del registro anterior no borrado de la lista de registros
	 */
	public int getAnterior() {
		int indice = -1;
		
		if (indiceRegistroActivo != -1 && this.registros != null) {
			for (int i = indiceRegistroActivo-1; i >= 0; i--) {
				MantenimientoBean registro = (MantenimientoBean) registros.get(i);
				if (registro.getEstadoBean() != Estado.BORRADO) {
					indice = i;
					break;
				}
			}
		}
		
		return indice;
	}
	
	/**
	 * Obtiene el índice del siguiente registro no borrado
	 * respecto al registro activo actual, devolviendo -1 si no hay registro activo siguiente
	 * @return índice del siguiente registro no borrado de la lista de registros
	 */
	public int getSiguiente() {
		int indice = -1;
		
		if (indiceRegistroActivo != -1 && this.registros != null) {
			for(int i = indiceRegistroActivo+1; i < registros.size(); i++) {
				MantenimientoBean registro = (MantenimientoBean) registros.get(i);
				if (registro.getEstadoBean() != Estado.BORRADO) {
					indice = i;
					break;
				}
			}
		}
		
		return indice;
	}
	
	/**
	 * Obtiene el índice del último registro no borrado
	 * devolviendo -1 si no hay último registro
	 * @return índice del último registro activo de la lista de registros
	 */
	public int getUltimo() {
		int indice = -1;
		
		if (this.registros != null) {
			for (int i=registros.size()-1; i >= 0; i--) {
				MantenimientoBean registro = (MantenimientoBean) registros.get(i);
				if (registro.getEstadoBean() != Estado.BORRADO) {
					// Si no es el registro activo lo devolvemos como índice del último registro
					if (i != indiceRegistroActivo) {
						indice = i;
					}
					break;
				}
			}
		}
		
		return indice;
	}
}
