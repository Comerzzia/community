/**
 * 
 */
package com.comerzzia.web.core.permisos;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.core.permisos.acciones.AdministrarAccion;
import com.comerzzia.web.core.permisos.acciones.AltaPerfilAccion;
import com.comerzzia.web.core.permisos.acciones.AltaUsuarioAccion;
import com.comerzzia.web.core.permisos.acciones.LeerAccion;
import com.comerzzia.web.core.permisos.acciones.SalvarAccion;
import com.comerzzia.web.core.permisos.acciones.VerPermisosUsuarioAccion;
import com.comerzzia.web.core.permisos.acciones.VolverAccion;

/**
 *
 */
public class PermisosServlet extends ControladorServlet{

	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6678370961773959994L;

	protected void loadAcciones() {
		this.añadirAccionDefault(new VerPermisosUsuarioAccion());
		this.añadirAccion(new AdministrarAccion());
		this.añadirAccion(new SalvarAccion());
		this.añadirAccion(new LeerAccion());
		this.añadirAccion(new AltaUsuarioAccion());
		this.añadirAccion(new AltaPerfilAccion());
		this.añadirAccion(new VolverAccion());
	}

}
