-- ------------------------------------------------------------
-- Copyright 2009-2014 RED.ES - Desarrollado por TIER1
-- 
-- Licencia con arreglo a la EUPL, versión 1.1 o -en cuanto 
-- sean aprobadas por la comisión Europea- versiones 
-- posteriores de la EUPL (la "Licencia").
-- Solo podrá usarse esta obra si se respeta la Licencia.
-- 
-- http://ec.europa.eu/idabc/eupl.html
-- 
-- Salvo cuando lo exija la legislación aplicable o se acuerde
-- por escrito, el programa distribuido con arreglo a la
-- Licencia se distribuye "TAL CUAL",
-- SIN GARANTÍAS NI CONDICIONES DE NINGÚN TIPO, 
-- ni expresas ni implícitas.
-- Véase la Licencia en el idioma concreto que rige
-- los permisos y limitaciones que establece la Licencia.
-- ------------------------------------------------------------

INSERT INTO config_acciones_tbl(id_accion, accion, tipo_accion, ejecucion, parametros, descripcion, titulo, icono, activo)
VALUES (103, 'TFrmMantArticulos', 'BPL', 'comerzzia_mantenimientos100.TFrmMantArticulos', NULL, 'Mantenimiento de Artículos', 'Mantenimiento de Artículos', 'TPV-Mantenimiento.bmp', 'S');

INSERT INTO config_acciones_tbl(id_accion, accion, tipo_accion, ejecucion, parametros, descripcion, titulo, icono, activo)
VALUES (104, 'TFrmMantClientes', 'BPL', 'comerzzia_mantenimientos100.TFrmMantClientes', NULL, 'Mantenimiento de Clientes', 'Mantenimiento de Clientes', 'TPV-Mantenimiento.bmp', 'S');

INSERT INTO config_acciones_tbl(id_accion, accion, tipo_accion, ejecucion, parametros, descripcion, titulo, icono, activo)
VALUES (106, 'TFrmConfCodigoBarras', 'BPL', 'comerzzia_mantenimientos100.TFrmConfCodigoBarras', NULL, 'Configuración Código de Barras', 'Configuración Códigos de Barras', 'TPV-Mantenimiento.bmp', 'S');

INSERT INTO config_acciones_tbl(id_accion, accion, tipo_accion, ejecucion, parametros, descripcion, titulo, icono, activo)
VALUES (100, 'TFrmTicket', 'BPL', 'comerzzia_tpvventas100.TFrmTicket', NULL, 'Tickets', 'Tickets', 'TPV-Ticket.bmp', 'S');

INSERT INTO config_acciones_tbl(id_accion, accion, tipo_accion, ejecucion, parametros, descripcion, titulo, icono, activo)
VALUES (101, 'TFrmCaja', 'BPL', 'comerzzia_tpvcaja100.TFrmCaja', NULL, 'Gestión de Caja', 'Gestión de Caja', 'TPV-Caja.bmp', 'S');

INSERT INTO config_acciones_tbl(id_accion, accion, tipo_accion, ejecucion, parametros, descripcion, titulo, icono, activo)
VALUES (102, 'TFrmConfiguracion', 'BPL', 'comerzzia_core100.TFrmConfiguracion', NULL, 'Configuración TPV', 'Configuración TPV', 'TPV-Config.bmp', 'S');


INSERT INTO config_contadores_def_tbl(id_contador, usa_codemp, usa_codserie, usa_periodo, descripcion)
VALUES ('ID_TICKET', 'N', 'S', 'N', 'Numeros de tickets');


INSERT INTO config_menu_tbl(aplicacion, orden, opcion, id_accion, tecla_rapida)
VALUES ('TPV', 1, 'Ventas\Tickets', 100, NULL);

INSERT INTO config_menu_tbl(aplicacion, orden, opcion, id_accion, tecla_rapida)
VALUES ('TPV', 2, 'Ventas\Gestión de Caja', 101, NULL);

INSERT INTO config_menu_tbl(aplicacion, orden, opcion, id_accion, tecla_rapida)
VALUES ('TPV', 3, 'Configuración\Configuración TPV', 102, NULL);

INSERT INTO config_menu_tbl(aplicacion, orden, opcion, id_accion, tecla_rapida)
VALUES ('TPV', 4, 'Mantenimientos\Artículos', 103, NULL);

INSERT INTO config_menu_tbl(aplicacion, orden, opcion, id_accion, tecla_rapida)
VALUES ('TPV', 6, 'Configuración\Datos Generales', 105, NULL);

INSERT INTO config_menu_tbl(aplicacion, orden, opcion, id_accion, tecla_rapida)
VALUES ('TPV', 5, 'Mantenimientos\Clientes', 104, NULL);



INSERT INTO config_variables_def_tbl(id_variable, descripcion, valor_defecto, nivel_usuario, nivel_grupo, nivel_empresa, nivel_general)
VALUES ('TPV.VERSION', 'Versión del TPV', '1.3.0', 'N', 'N', 'N', 'S');

INSERT INTO config_variables_def_tbl(id_variable, descripcion, valor_defecto, nivel_usuario, nivel_grupo, nivel_empresa, nivel_general)
VALUES ('TPV.AUTONOMO', 'Indica si el TPV tendra disponibles las opciones de edicion de las tablas locales de mantenimiento', 'N', 'N', 'N', 'N', 'S');

INSERT INTO config_variables_def_tbl(id_variable, descripcion, valor_defecto, nivel_usuario, nivel_grupo, nivel_empresa, nivel_general)
VALUES ('ARTICULOS.DESGLOSE1_TITULO', 'Titulo para el primer desglose en almacen', NULL, 'N', 'N', 'N', 'S');

INSERT INTO config_variables_def_tbl(id_variable, descripcion, valor_defecto, nivel_usuario, nivel_grupo, nivel_empresa, nivel_general)
VALUES ('ARTICULOS.DESGLOSE2_TITULO', 'Titulo para el segundo desglose en almacen', NULL, 'N', 'N', 'N', 'S');

INSERT INTO config_variables_def_tbl(id_variable, descripcion, valor_defecto, nivel_usuario, nivel_grupo, nivel_empresa, nivel_general)
VALUES ('WEBSERVICES.WSCLIENTES', 'Indica la ruta del webservice de clientes', NULL, 'N', 'N', 'N', 'S');

INSERT INTO config_variables_def_tbl(id_variable, descripcion, valor_defecto, nivel_usuario, nivel_grupo, nivel_empresa, nivel_general)
VALUES ('TICKETS.USA_DESCUENTO_EN_LINEA', 'Indica si esta activo el uso de descuentos en líneas para los tickets realizados por el TPV', 'N', 'N', 'N', 'N', 'S');

