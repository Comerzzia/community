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

/* scripts de actualización para datos */

/* datos para tabla: CONFIG_VARIABLES_DEF_TBL*/
UPDATE config_variables_def_tbl
	SET valor_defecto = '1.2.0'
	WHERE id_variable = 'GENERAL.VERSION';
	
UPDATE config_variables_def_tbl
	SET valor_defecto = '1.2.0'
	WHERE id_variable = 'TPV.VERSION';
	
INSERT INTO config_variables_def_tbl(id_variable, descripcion, valor_defecto, nivel_usuario, nivel_grupo, nivel_empresa, nivel_general)
VALUES ('ARTICULOS.FORMATO_CODBAR_AUTOMATICO','Formato de los códigos de barras aleatorios','EAN8','N','N','N','S');
