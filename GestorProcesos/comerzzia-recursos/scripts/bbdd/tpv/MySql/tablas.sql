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

SET FOREIGN_KEY_CHECKS = 0;

-- -------------------------------------
-- Tables

CREATE TABLE config_acciones_informes_tbl (
  id_accion BIGINT(10) NOT NULL,
  id_version BIGINT(10) NOT NULL,
  version VARCHAR(50) BINARY NOT NULL,
  descripcion VARCHAR(250) BINARY NULL,
  formato_salida VARCHAR(30) BINARY NULL,
  activo CHAR(1) BINARY NOT NULL,
  titulo VARCHAR(50) BINARY NULL,
  PRIMARY KEY (id_accion, id_version)
)
ENGINE = INNODB;

CREATE TABLE config_acciones_operacione_tbl (
  id_accion BIGINT(10) NOT NULL,
  id_operacion INT(2) NOT NULL,
  orden INT(2) NOT NULL,
  desoperacion VARCHAR(30) BINARY NOT NULL,
  PRIMARY KEY (id_accion, id_operacion)
)
ENGINE = INNODB;

CREATE TABLE config_acciones_permisos_tbl (
  id_accion BIGINT(10) NOT NULL,
  id_operacion INT(2) NOT NULL,
  id_usuario BIGINT(10) NOT NULL,
  id_perfil BIGINT(10) NOT NULL,
  acceso INT(1) NOT NULL,
  PRIMARY KEY (id_accion, id_operacion, id_usuario, id_perfil)
)
ENGINE = INNODB;

CREATE TABLE config_acciones_tbl (
  id_accion BIGINT(10) NOT NULL,
  accion VARCHAR(250) BINARY NULL,
  tipo_accion VARCHAR(10) BINARY NOT NULL,
  ejecucion VARCHAR(250) BINARY NOT NULL,
  parametros VARCHAR(250) BINARY NULL,
  descripcion VARCHAR(250) BINARY NULL,
  titulo VARCHAR(250) BINARY NULL,
  icono VARCHAR(250) BINARY NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (id_accion),
  UNIQUE INDEX config_acciones_uk (accion(250))
)
ENGINE = INNODB;

CREATE TABLE config_ayudas_tbl (
  nombre VARCHAR(50) BINARY NOT NULL,
  definicion LONGBLOB NOT NULL
)
ENGINE = INNODB;

CREATE TABLE config_contadores_def_tbl (
  id_contador VARCHAR(20) BINARY NOT NULL,
  usa_codemp CHAR(1) BINARY NOT NULL,
  usa_codserie CHAR(1) BINARY NOT NULL,
  usa_periodo CHAR(1) BINARY NOT NULL,
  descripcion VARCHAR(30) BINARY NULL,
  PRIMARY KEY (id_contador)
)
ENGINE = INNODB;

CREATE TABLE config_contadores_tbl (
  id_contador VARCHAR(20) BINARY NOT NULL,
  codemp VARCHAR(4) BINARY NOT NULL,
  codserie VARCHAR(5) BINARY NOT NULL,
  periodo INT(4) NOT NULL,
  valor BIGINT(10) NOT NULL,
  PRIMARY KEY (id_contador, codemp, codserie, periodo)
)
ENGINE = INNODB;

CREATE TABLE config_estados_tbl (
  proceso VARCHAR(30) BINARY NOT NULL,
  estado INT(3) NOT NULL,
  subestado INT(3) NOT NULL,
  desestado VARCHAR(50) BINARY NOT NULL,
  abreviatura VARCHAR(30) BINARY NULL,
  icono VARCHAR(250) BINARY NULL,
  ambito_aplicacion VARCHAR(250) BINARY NULL,
  PRIMARY KEY (proceso, estado, subestado)
)
ENGINE = INNODB;

CREATE TABLE config_imp_grupos_tbl (
  id_grupo_impuestos INT(5) NOT NULL,
  vigencia_desde DATETIME NOT NULL,
  PRIMARY KEY (id_grupo_impuestos)
)
ENGINE = INNODB;

CREATE TABLE config_imp_porcentajes_tbl (
  id_grupo_impuestos INT(5) NOT NULL,
  id_trat_impuestos BIGINT(10) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  porcentaje DECIMAL(13, 3) NOT NULL,
  porcentaje_recargo DECIMAL(13, 3) NOT NULL,
  PRIMARY KEY (id_grupo_impuestos, id_trat_impuestos, codimp)
)
ENGINE = INNODB;

CREATE TABLE config_imp_tipos_tbl (
  codimp CHAR(1) BINARY NOT NULL,
  desimp VARCHAR(45) BINARY NOT NULL,
  PRIMARY KEY (codimp)
)
ENGINE = INNODB;

CREATE TABLE config_imp_tratamiento_tbl (
  id_trat_impuestos BIGINT(10) NOT NULL,
  codtratimp VARCHAR(11) BINARY NOT NULL,
  destratimp VARCHAR(45) BINARY NOT NULL,
  aplica_recargo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (id_trat_impuestos),
  UNIQUE INDEX config_imp_tratamiento_uk (codtratimp(11))
)
ENGINE = INNODB;

CREATE TABLE config_menu_tbl (
  aplicacion VARCHAR(30) BINARY NOT NULL,
  orden INT(4) NOT NULL,
  opcion VARCHAR(250) BINARY NULL,
  id_accion BIGINT(10) NULL,
  tecla_rapida VARCHAR(10) BINARY NULL,
  PRIMARY KEY (aplicacion, orden)
)
ENGINE = INNODB;

CREATE TABLE config_perfiles_tbl (
  id_perfil BIGINT(10) NOT NULL,
  desperfil VARCHAR(30) BINARY NULL,
  PRIMARY KEY (id_perfil)
)
ENGINE = INNODB;

CREATE TABLE config_tiendas_tipos_tbl (
  id_tipo_tienda BIGINT(10) NOT NULL,
  destipo_tienda VARCHAR(45) BINARY NOT NULL,
  clase_configuracion VARCHAR(255) BINARY NOT NULL,
  clase_sincronizacion VARCHAR(255) BINARY NOT NULL,
  PRIMARY KEY (id_tipo_tienda)
)
ENGINE = INNODB;

CREATE TABLE config_tiendas_tipos_trab_tbl (
  id_tipo_tienda BIGINT(10) NOT NULL,
  trabajo VARCHAR(45) BINARY NOT NULL,
  clase VARCHAR(255) BINARY NOT NULL,
  intervalo VARCHAR(45) BINARY NULL,
  PRIMARY KEY (id_tipo_tienda, trabajo),
  CONSTRAINT config_tiendas_tipos_tra_tt_fk FOREIGN KEY config_tiendas_tipos_tra_tt_fk (id_tipo_tienda)
    REFERENCES config_tiendas_tipos_tbl (id_tipo_tienda)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE config_usuarios_perfiles_tbl (
  id_usuario BIGINT(10) NOT NULL,
  id_perfil BIGINT(10) NOT NULL,
  PRIMARY KEY (id_usuario, id_perfil),
  CONSTRAINT config_usuarios_perfiles_pe_fk FOREIGN KEY config_usuarios_perfiles_pe_fk (id_perfil)
    REFERENCES config_perfiles_tbl (id_perfil)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT config_usuarios_perfiles_us_fk FOREIGN KEY config_usuarios_perfiles_us_fk (id_usuario)
    REFERENCES config_usuarios_tbl (id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE config_usuarios_tbl (
  id_usuario BIGINT(10) NOT NULL,
  usuario VARCHAR(20) BINARY NOT NULL,
  desusuario VARCHAR(50) BINARY NULL,
  clave VARCHAR(250) BINARY NULL,
  activo CHAR(1) BINARY NOT NULL,
  aplicacion_por_defecto VARCHAR(30) BINARY NULL,
  puede_cambiar_aplicacion CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (id_usuario),
  UNIQUE INDEX config_usuarios_idu_unq (usuario(20))
)
ENGINE = INNODB;

CREATE TABLE config_variables_def_tbl (
  id_variable VARCHAR(50) BINARY NOT NULL,
  descripcion VARCHAR(255) BINARY NOT NULL,
  valor_defecto VARCHAR(250) BINARY NULL,
  nivel_usuario VARCHAR(1) BINARY NOT NULL,
  nivel_grupo VARCHAR(1) BINARY NOT NULL,
  nivel_empresa VARCHAR(1) BINARY NOT NULL,
  nivel_general VARCHAR(1) BINARY NOT NULL,
  PRIMARY KEY (id_variable)
)
ENGINE = INNODB;

CREATE TABLE config_variables_tbl (
  id_variable VARCHAR(50) BINARY NOT NULL,
  peso INT(3) NOT NULL,
  id_usuario BIGINT(10) NULL,
  id_grupo BIGINT(10) NULL,
  codemp VARCHAR(4) BINARY NULL,
  valor VARCHAR(250) BINARY NULL,
  PRIMARY KEY (id_variable, peso)
)
ENGINE = INNODB;

CREATE TABLE t_articulos_codbar_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  desglose1 VARCHAR(15) BINARY NOT NULL,
  desglose2 VARCHAR(15) BINARY NOT NULL,
  codigo_barras VARCHAR(20) BINARY NOT NULL,
  dun14 CHAR(1) BINARY NOT NULL,
  fecha_alta DATETIME NOT NULL,
  factor_conversion DECIMAL(13, 3) NULL,
  PRIMARY KEY (codalm, codart, codigo_barras),
  UNIQUE INDEX t_articulos_codbar_uk (codalm(4), codigo_barras(20))
)
ENGINE = INNODB;

CREATE TABLE t_articulos_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  desart VARCHAR(45) BINARY NOT NULL,
  formato VARCHAR(20) BINARY NULL,
  codimp CHAR(1) BINARY NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  activo CHAR(1) BINARY NULL,
  numeros_serie CHAR(1) BINARY NULL,
  desglose1 CHAR(1) BINARY NULL,
  desglose2 CHAR(1) BINARY NULL,
  generico CHAR(1) BINARY NOT NULL,
  version BIGINT(10) NULL,
  unidades_caja INT(5) NULL,
  codcat VARCHAR(20) BINARY NULL,
  escaparate CHAR(1) BINARY NULL,
  fecha_alta DATETIME NULL,
  PRIMARY KEY (codalm, codart)
)
ENGINE = INNODB;

CREATE TABLE t_caja_cab_tbl (
  uid_diario_caja VARCHAR(40) BINARY NOT NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  codcaja VARCHAR(2) BINARY NOT NULL,
  fecha_apertura DATETIME NOT NULL,
  fecha_cierre DATETIME NULL,
  id_usuario BIGINT(10) NULL,
  saldo_inicial DECIMAL(13, 3) NULL,
  PRIMARY KEY (uid_diario_caja)
)
ENGINE = INNODB;

CREATE TABLE t_caja_det_cierre_tbl (
  uid_diario_caja VARCHAR(40) BINARY NOT NULL,
  codmedpag VARCHAR(4) BINARY NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  declarado DECIMAL(13, 3) NOT NULL,
  PRIMARY KEY (uid_diario_caja, codmedpag)
)
ENGINE = INNODB;

CREATE TABLE t_caja_det_recuento_tbl (
  uid_diario_caja VARCHAR(40) BINARY NOT NULL,
  linea INT(5) NOT NULL,
  codmedpag VARCHAR(4) BINARY NOT NULL,
  cantidad INT(5) NOT NULL,
  valor DECIMAL(13, 3) NOT NULL,
  PRIMARY KEY (uid_diario_caja, linea)
)
ENGINE = INNODB;

CREATE TABLE t_caja_det_tbl (
  uid_diario_caja VARCHAR(40) BINARY NOT NULL,
  linea INT(5) NOT NULL,
  fecha DATETIME NOT NULL,
  entrada DECIMAL(13, 3) NULL,
  salida DECIMAL(13, 3) NULL,
  concepto VARCHAR(40) BINARY NOT NULL,
  documento VARCHAR(10) BINARY NULL,
  codmedpag VARCHAR(4) BINARY NULL,
  uid_ticket VARCHAR(40) BINARY NULL,
  PRIMARY KEY (uid_diario_caja, linea)
)
ENGINE = INNODB;

CREATE TABLE t_categorizacion_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  codcat VARCHAR(20) BINARY NOT NULL,
  descat VARCHAR(45) BINARY NOT NULL,
  activo CHAR(1) BINARY NULL,
  PRIMARY KEY (codalm, codcat)
)
ENGINE = INNODB;

CREATE TABLE t_clientes_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  cif VARCHAR(20) BINARY NOT NULL,
  descli VARCHAR(45) BINARY NOT NULL,
  nombre_comercial VARCHAR(45) BINARY NULL,
  domicilio VARCHAR(50) BINARY NULL,
  poblacion VARCHAR(50) BINARY NULL,
  provincia VARCHAR(50) BINARY NULL,
  cp VARCHAR(8) BINARY NULL,
  telefono1 VARCHAR(15) BINARY NULL,
  telefono2 VARCHAR(15) BINARY NULL,
  fax VARCHAR(15) BINARY NULL,
  persona_contacto VARCHAR(45) BINARY NULL,
  email VARCHAR(60) BINARY NULL,
  id_trat_impuestos BIGINT(10) NOT NULL,
  codmedpag VARCHAR(4) BINARY NULL,
  codtar VARCHAR(11) BINARY NULL,
  observaciones VARCHAR(255) BINARY NULL,
  activo CHAR(1) BINARY NOT NULL,
  fecha_alta DATETIME NULL,
  fecha_baja DATETIME NULL,
  venta_a_credito CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codalm, cif)
)
ENGINE = INNODB;

CREATE TABLE t_codigos_barra_esp_tbl (
  orden INT(5) NOT NULL,
  descripcion VARCHAR(45) BINARY NOT NULL,
  prefijo VARCHAR(13) BINARY NOT NULL,
  codart VARCHAR(20) BINARY NULL,
  precio VARCHAR(20) BINARY NULL,
  cantidad VARCHAR(20) BINARY NULL,
  fidelizacion CHAR(1) BINARY NULL,
  PRIMARY KEY (orden)
)
ENGINE = INNODB;

CREATE TABLE t_medios_pago_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  codmedpag VARCHAR(4) BINARY NOT NULL,
  desmedpag VARCHAR(45) BINARY NOT NULL,
  contado CHAR(1) BINARY NULL,
  efectivo CHAR(1) BINARY NULL,
  tarjeta_credito CHAR(1) BINARY NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codalm, codmedpag)
)
ENGINE = INNODB;

CREATE TABLE t_promociones_det_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  id_promocion BIGINT(10) NOT NULL,
  codtar VARCHAR(11) BINARY NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  precio_tarifa DECIMAL(14, 4) NOT NULL,
  precio_venta DECIMAL(14, 4) NULL,
  puntos INT(5) NOT NULL,
  texto_promocion VARCHAR(255) BINARY NULL,
  datos_promocion LONGBLOB NULL,
  fecha_inicio DATETIME NOT NULL,
  fecha_fin DATETIME NOT NULL,
  solo_fidelizacion CHAR(1) BINARY NOT NULL,
  version_tarifa BIGINT(10) NULL,
  id_tipo_promocion BIGINT(10) NULL,
  PRIMARY KEY (codalm, id_promocion, codart)
)
ENGINE = INNODB;

CREATE TABLE t_tarifas_det_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  codtar VARCHAR(11) BINARY NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  precio_costo DECIMAL(14, 4) NULL,
  factor_marcaje DECIMAL(8, 4) NULL,
  precio_venta DECIMAL(14, 4) NOT NULL,
  precio_total DECIMAL(14, 4) NOT NULL,
  version BIGINT(10) NULL,
  PRIMARY KEY (codalm, codtar, codart)
)
ENGINE = INNODB;

CREATE TABLE t_tickets_tbl (
  uid_ticket VARCHAR(40) BINARY NOT NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  id_ticket BIGINT(10) NOT NULL,
  fecha DATETIME NOT NULL,
  ticket LONGBLOB NOT NULL,
  enviado CHAR(1) BINARY NOT NULL,
  fecha_envio DATETIME NULL,
  PRIMARY KEY (uid_ticket),
  INDEX t_tickets_ind1 (codalm(4), enviado(1))
)
ENGINE = INNODB;

CREATE TABLE t_tiendas_cajas_tbl (
  codalm VARCHAR(4) BINARY NULL,
  codcaja VARCHAR(2) BINARY NULL,
  uid_tpv VARCHAR(40) BINARY NOT NULL,
  configuracion LONGBLOB NULL,
  PRIMARY KEY (uid_tpv),
  UNIQUE INDEX t_tiendas_cajas_uk (codalm(4), codcaja(2))
)
ENGINE = INNODB;

CREATE TABLE t_tiendas_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  desalm VARCHAR(45) BINARY NOT NULL,
  nombre_comercial VARCHAR(45) BINARY NULL,
  domicilio VARCHAR(50) BINARY NULL,
  poblacion VARCHAR(50) BINARY NULL,
  provincia VARCHAR(50) BINARY NULL,
  cp VARCHAR(8) BINARY NULL,
  telefono1 VARCHAR(15) BINARY NULL,
  telefono2 VARCHAR(15) BINARY NULL,
  fax VARCHAR(15) BINARY NULL,
  cif VARCHAR(20) BINARY NOT NULL,
  persona_contacto VARCHAR(45) BINARY NULL,
  activo CHAR(1) BINARY NOT NULL,
  cliente_por_defecto VARCHAR(20) BINARY NOT NULL,
  PRIMARY KEY (codalm)
)
ENGINE = INNODB;

CREATE TABLE tv_clientes_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  cif VARCHAR(20) BINARY NOT NULL,
  usuario VARCHAR(20) BINARY NOT NULL,
  clave VARCHAR(250) BINARY NOT NULL,
  PRIMARY KEY (codalm, cif),
  UNIQUE INDEX tv_clientes_uk (codalm(4), usuario(20))
)
ENGINE = INNODB;




SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------------------------------------------------
-- EOF
