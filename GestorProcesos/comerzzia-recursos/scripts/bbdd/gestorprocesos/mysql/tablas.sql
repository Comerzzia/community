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

CREATE TABLE d_almacenes_articulos_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  desglose1 VARCHAR(15) BINARY NOT NULL,
  desglose2 VARCHAR(15) BINARY NOT NULL,
  stock DECIMAL(13, 3) NOT NULL,
  stock_um_alternativa DECIMAL(13, 3) NOT NULL,
  stock_minimo DECIMAL(13, 3) NOT NULL,
  stock_maximo DECIMAL(13, 3) NOT NULL,
  stock_pendiente_recibir DECIMAL(13, 3) NOT NULL,
  stock_pendiente_servir DECIMAL(13, 3) NOT NULL,
  ubicacion1 VARCHAR(15) BINARY NULL,
  ubicacion2 VARCHAR(15) BINARY NULL,
  ubicacion3 VARCHAR(15) BINARY NULL,
  ubicacion4 VARCHAR(15) BINARY NULL,
  pmp DECIMAL(13, 3) NOT NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codalm, codart, desglose1, desglose2),
  CONSTRAINT d_almacenes_articulos_alm_fk FOREIGN KEY d_almacenes_articulos_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_almacenes_articulos_art_fk FOREIGN KEY d_almacenes_articulos_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_almacenes_conceptos_tbl (
  codaplicacion VARCHAR(4) BINARY NOT NULL,
  codconalm VARCHAR(4) BINARY NOT NULL,
  desconalm VARCHAR(30) BINARY NULL,
  signo CHAR(1) BINARY NULL,
  codalm_origen VARCHAR(4) BINARY NULL,
  codalm_destino VARCHAR(4) BINARY NULL,
  solicitud_aceptacion_auto CHAR(1) BINARY NOT NULL,
  solicitud_recepcion_auto CHAR(1) BINARY NOT NULL,
  solicitud_generar_faltas CHAR(1) BINARY NOT NULL,
  visible_tiendas CHAR(1) BINARY NOT NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codaplicacion, codconalm),
  CONSTRAINT d_almacenes_conceptos_ald_fk FOREIGN KEY d_almacenes_conceptos_ald_fk (codalm_destino)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_almacenes_conceptos_alm_fk FOREIGN KEY d_almacenes_conceptos_alm_fk (codalm_origen)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_almacenes_regulariza_tbl (
  id_regularizacion BIGINT(10) NOT NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  fecha DATETIME NOT NULL,
  codaplicacion VARCHAR(4) BINARY NOT NULL,
  codconalm VARCHAR(4) BINARY NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  desglose1 VARCHAR(15) BINARY NOT NULL,
  desglose2 VARCHAR(15) BINARY NOT NULL,
  cantidad_medida DECIMAL(13, 3) NULL,
  unidad_medida VARCHAR(4) BINARY NULL,
  cantidad DECIMAL(13, 3) NOT NULL,
  precio DECIMAL(14, 4) NULL,
  importe DECIMAL(13, 3) NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  id_usuario BIGINT(10) NULL,
  anterior_stock DECIMAL(13, 3) NULL,
  anterior_stock_um_alternativa DECIMAL(13, 3) NULL,
  PRIMARY KEY (id_regularizacion),
  CONSTRAINT d_almacenes_regulariza_alm_fk FOREIGN KEY d_almacenes_regulariza_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_almacenes_regulariza_art_fk FOREIGN KEY d_almacenes_regulariza_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_almacenes_regulariza_con_fk FOREIGN KEY d_almacenes_regulariza_con_fk (codaplicacion, codconalm)
    REFERENCES d_almacenes_conceptos_tbl (codaplicacion, codconalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_almacenes_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  desalm VARCHAR(45) BINARY NOT NULL,
  domicilio VARCHAR(50) BINARY NULL,
  poblacion VARCHAR(50) BINARY NULL,
  provincia VARCHAR(50) BINARY NULL,
  cp VARCHAR(8) BINARY NULL,
  telefono1 VARCHAR(15) BINARY NULL,
  telefono2 VARCHAR(15) BINARY NULL,
  fax VARCHAR(15) BINARY NULL,
  persona_contacto VARCHAR(45) BINARY NULL,
  codemp VARCHAR(4) BINARY NOT NULL,
  codcli VARCHAR(11) BINARY NOT NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codalm),
  UNIQUE INDEX d_almacenes_uk (codcli(11)),
  CONSTRAINT d_almacenes_cli_fk FOREIGN KEY d_almacenes_cli_fk (codcli)
    REFERENCES d_clientes_tbl (codcli)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_almacenes_emp_fk FOREIGN KEY d_almacenes_emp_fk (codemp)
    REFERENCES d_empresas_tbl (codemp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_almacenes_usuarios_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  id_usuario BIGINT(10) NOT NULL,
  PRIMARY KEY (codalm, id_usuario),
  CONSTRAINT d_almacenes_usuarios_alm_fk FOREIGN KEY d_almacenes_usuarios_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_articulos_codbar_tbl (
  codart VARCHAR(13) BINARY NOT NULL,
  desglose1 VARCHAR(15) BINARY NOT NULL,
  desglose2 VARCHAR(15) BINARY NOT NULL,
  codigo_barras VARCHAR(20) BINARY NOT NULL,
  dun14 CHAR(1) BINARY NOT NULL,
  fecha_alta DATETIME NOT NULL,
  factor_conversion DECIMAL(13, 3) NULL,
  PRIMARY KEY (codart, codigo_barras),
  UNIQUE INDEX d_articulos_codbar_uk (codigo_barras(20)),
  CONSTRAINT d_articulos_codbar_art_fk FOREIGN KEY d_articulos_codbar_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_articulos_foto_tbl (
  codart VARCHAR(13) BINARY NOT NULL,
  tipo_foto VARCHAR(1) BINARY NOT NULL,
  foto LONGBLOB NULL,
  PRIMARY KEY (codart, tipo_foto),
  CONSTRAINT d_articulos_foto_art_fk FOREIGN KEY d_articulos_foto_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_articulos_num_serie_mov_tbl (
  id_numserie BIGINT(10) NOT NULL,
  fecha DATETIME NOT NULL,
  tipo_movimiento VARCHAR(2) BINARY NOT NULL,
  id_documento BIGINT(10) NULL,
  linea INT(5) NULL,
  referencia VARCHAR(50) BINARY NULL,
  estado INT(4) NOT NULL,
  subestado INT(4) NOT NULL,
  PRIMARY KEY (id_numserie, fecha, tipo_movimiento),
  CONSTRAINT d_articulos_num_serie_mo_sr_fk FOREIGN KEY d_articulos_num_serie_mo_sr_fk (id_numserie)
    REFERENCES d_articulos_num_serie_tbl (id_numserie)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_articulos_num_serie_tbl (
  id_numserie BIGINT(10) NOT NULL,
  id_numserie_padre BIGINT(10) NULL,
  id_numserie_sustituido BIGINT(10) NULL,
  numero_serie VARCHAR(25) BINARY NOT NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  codcli VARCHAR(11) BINARY NULL,
  codpro VARCHAR(11) BINARY NULL,
  fecha DATETIME NULL,
  estado INT(3) NOT NULL,
  subestado INT(3) NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  PRIMARY KEY (id_numserie),
  UNIQUE INDEX d_articulos_num_serie_uk (numero_serie(25)),
  CONSTRAINT d_articulos_num_serie_alm_fk FOREIGN KEY d_articulos_num_serie_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_articulos_num_serie_art_fk FOREIGN KEY d_articulos_num_serie_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_articulos_num_serie_cli_fk FOREIGN KEY d_articulos_num_serie_cli_fk (codcli)
    REFERENCES d_clientes_tbl (codcli)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_articulos_num_serie_pro_fk FOREIGN KEY d_articulos_num_serie_pro_fk (codpro)
    REFERENCES d_proveedores_tbl (codpro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_articulos_tbl (
  codart VARCHAR(13) BINARY NOT NULL,
  desart VARCHAR(45) BINARY NOT NULL,
  formato VARCHAR(20) BINARY NULL,
  codfam VARCHAR(6) BINARY NULL,
  codseccion VARCHAR(4) BINARY NULL,
  codcat VARCHAR(20) BINARY NULL,
  codpro VARCHAR(11) BINARY NULL,
  referencia_proveedor VARCHAR(40) BINARY NULL,
  dto_proveedor DECIMAL(5, 2) NOT NULL,
  codfab VARCHAR(11) BINARY NULL,
  pmp DECIMAL(14, 4) NULL,
  act_automatica_costo CHAR(1) BINARY NULL,
  costo_actualizado DATETIME NULL,
  codimp CHAR(1) BINARY NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  activo CHAR(1) BINARY NOT NULL,
  numeros_serie CHAR(1) BINARY NULL,
  desglose1 CHAR(1) BINARY NOT NULL,
  desglose2 CHAR(1) BINARY NOT NULL,
  generico CHAR(1) BINARY NOT NULL,
  escaparate CHAR(1) BINARY NOT NULL,
  unidad_medida_alternativa VARCHAR(4) BINARY NULL,
  cod_um_etiqueta VARCHAR(4) BINARY NULL,
  cantidad_um_etiqueta DECIMAL(13, 3) NULL,
  fecha_alta DATETIME NULL,
  version BIGINT(10) NOT NULL,
  fecha_version DATETIME NULL,
  PRIMARY KEY (codart),
  CONSTRAINT d_articulos_cat_fk FOREIGN KEY d_articulos_cat_fk (codcat)
    REFERENCES d_categorizacion_tbl (codcat)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_articulos_ci_fk FOREIGN KEY d_articulos_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_articulos_fam_fk FOREIGN KEY d_articulos_fam_fk (codfam)
    REFERENCES d_familias_tbl (codfam)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_articulos_pro_fk FOREIGN KEY d_articulos_pro_fk (codpro)
    REFERENCES d_proveedores_tbl (codpro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_articulos_sec_fk FOREIGN KEY d_articulos_sec_fk (codseccion)
    REFERENCES d_secciones_tbl (codseccion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_articulos_ume_fk FOREIGN KEY d_articulos_ume_fk (cod_um_etiqueta)
    REFERENCES d_unidad_medida_etiquetas_tbl (cod_um_etiqueta)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_articulos_unid_medida_tbl (
  codart VARCHAR(13) BINARY NOT NULL,
  unidad_medida VARCHAR(4) BINARY NOT NULL,
  factor_conversion DECIMAL(13, 3) NOT NULL,
  alto BIGINT(13) NULL,
  ancho BIGINT(13) NULL,
  fondo BIGINT(13) NULL,
  peso DECIMAL(13, 3) NULL,
  PRIMARY KEY (codart, unidad_medida),
  CONSTRAINT d_articulos_unid_medida_art_fk FOREIGN KEY d_articulos_unid_medida_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_bancos_tbl (
  codban VARCHAR(11) BINARY NOT NULL,
  desban VARCHAR(45) BINARY NOT NULL,
  domicilio VARCHAR(50) BINARY NULL,
  poblacion VARCHAR(50) BINARY NULL,
  provincia VARCHAR(50) BINARY NULL,
  telefono1 VARCHAR(15) BINARY NULL,
  telefono2 VARCHAR(15) BINARY NULL,
  fax VARCHAR(15) BINARY NULL,
  ccc VARCHAR(20) BINARY NULL,
  cif VARCHAR(20) BINARY NULL,
  cp VARCHAR(8) BINARY NULL,
  codemp VARCHAR(4) BINARY NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codban),
  CONSTRAINT d_bancos_emp_fk FOREIGN KEY d_bancos_emp_fk (codemp)
    REFERENCES d_empresas_tbl (codemp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_caja_cab_tbl (
  uid_diario_caja VARCHAR(40) BINARY NOT NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  codcaja VARCHAR(2) BINARY NOT NULL,
  fecha_apertura DATETIME NOT NULL,
  fecha_cierre DATETIME NULL,
  id_usuario BIGINT(10) NULL,
  PRIMARY KEY (uid_diario_caja),
  CONSTRAINT d_caja_cab_alm_fk FOREIGN KEY d_caja_cab_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_caja_det_tbl (
  uid_diario_caja VARCHAR(40) BINARY NOT NULL,
  linea INT(5) NOT NULL,
  fecha DATETIME NOT NULL,
  cargo DECIMAL(13, 3) NULL,
  abono DECIMAL(13, 3) NULL,
  concepto VARCHAR(40) BINARY NOT NULL,
  documento VARCHAR(10) BINARY NULL,
  id_medpag_ven BIGINT(10) NULL,
  id_documento VARCHAR(40) BINARY NULL,
  PRIMARY KEY (uid_diario_caja, linea),
  CONSTRAINT d_caja_det_dc_fk FOREIGN KEY d_caja_det_dc_fk (uid_diario_caja)
    REFERENCES d_caja_cab_tbl (uid_diario_caja)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_caja_det_mpv_fk FOREIGN KEY d_caja_det_mpv_fk (id_medpag_ven)
    REFERENCES d_medios_pago_ven_tbl (id_medpag_ven)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_categorizacion_tbl (
  codcat VARCHAR(20) BINARY NOT NULL,
  descat VARCHAR(45) BINARY NOT NULL,
  activo CHAR(1) BINARY NULL,
  PRIMARY KEY (codcat)
)
ENGINE = INNODB;

CREATE TABLE d_clie_albaranes_cab_tbl (
  id_clie_albaran BIGINT(10) NOT NULL,
  codemp VARCHAR(4) BINARY NOT NULL,
  periodo INT(4) NOT NULL,
  codserie VARCHAR(5) BINARY NOT NULL,
  numalb BIGINT(10) NOT NULL,
  fecha DATETIME NOT NULL,
  hora VARCHAR(5) BINARY NULL,
  fecha_suministro DATETIME NOT NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  codcaja VARCHAR(2) BINARY NULL,
  uid_diario_caja VARCHAR(40) BINARY NULL,
  codaplicacion VARCHAR(4) BINARY NOT NULL,
  codconalm VARCHAR(4) BINARY NOT NULL,
  codcli VARCHAR(11) BINARY NOT NULL,
  codtar VARCHAR(11) BINARY NULL,
  id_tipo_porte BIGINT(10) NULL,
  persona_contacto VARCHAR(30) BINARY NULL,
  referencia_cliente VARCHAR(45) BINARY NULL,
  id_grupo_impuestos INT(5) NOT NULL,
  id_trat_impuestos BIGINT(10) NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  id_usuario BIGINT(10) NULL,
  id_factura_rep BIGINT(10) NULL,
  id_factura_sop BIGINT(10) NULL,
  tarjeta_fidelizacion VARCHAR(30) BINARY NULL,
  tracking_porte VARCHAR(50) BINARY NULL,
  uid_ticket VARCHAR(40) BINARY NULL,
  PRIMARY KEY (id_clie_albaran),
  UNIQUE INDEX d_clie_albaranes_cab_uk (codemp(4), periodo, codserie(5), numalb),
  CONSTRAINT d_clie_albaranes_cab_alm_fk FOREIGN KEY d_clie_albaranes_cab_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_cab_cli_fk FOREIGN KEY d_clie_albaranes_cab_cli_fk (codcli)
    REFERENCES d_clientes_tbl (codcli)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_cab_con_fk FOREIGN KEY d_clie_albaranes_cab_con_fk (codaplicacion, codconalm)
    REFERENCES d_almacenes_conceptos_tbl (codaplicacion, codconalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_cab_dc_fk FOREIGN KEY d_clie_albaranes_cab_dc_fk (uid_diario_caja)
    REFERENCES d_caja_cab_tbl (uid_diario_caja)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_cab_emp_fk FOREIGN KEY d_clie_albaranes_cab_emp_fk (codemp)
    REFERENCES d_empresas_tbl (codemp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_cab_fac_fk FOREIGN KEY d_clie_albaranes_cab_fac_fk (id_factura_rep)
    REFERENCES d_facturas_rep_cab_tbl (id_factura_rep)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_cab_facs_fk FOREIGN KEY d_clie_albaranes_cab_facs_fk (id_factura_sop)
    REFERENCES d_facturas_sop_cab_tbl (id_factura_sop)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_cab_gi_fk FOREIGN KEY d_clie_albaranes_cab_gi_fk (id_grupo_impuestos)
    REFERENCES config_imp_grupos_tbl (id_grupo_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_cab_por_fk FOREIGN KEY d_clie_albaranes_cab_por_fk (id_tipo_porte)
    REFERENCES d_tipos_portes_tbl (id_tipo_porte)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_cab_ser_fk FOREIGN KEY d_clie_albaranes_cab_ser_fk (codserie)
    REFERENCES d_series_tbl (codserie)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_cab_tar_fk FOREIGN KEY d_clie_albaranes_cab_tar_fk (codtar)
    REFERENCES d_tarifas_cab_tbl (codtar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_cab_ti_fk FOREIGN KEY d_clie_albaranes_cab_ti_fk (id_trat_impuestos)
    REFERENCES config_imp_tratamiento_tbl (id_trat_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_clie_albaranes_det_tbl (
  id_clie_albaran BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  fecha DATETIME NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  desglose1 VARCHAR(15) BINARY NOT NULL,
  desglose2 VARCHAR(15) BINARY NOT NULL,
  desart VARCHAR(45) BINARY NULL,
  descripcion_ampliada VARCHAR(255) BINARY NULL,
  unidad_medida VARCHAR(4) BINARY NULL,
  cantidad_medida DECIMAL(13, 3) NULL,
  cantidad DECIMAL(13, 3) NOT NULL,
  precio DECIMAL(14, 4) NOT NULL,
  precio_total DECIMAL(14, 4) NOT NULL,
  descuento DECIMAL(5, 2) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  importe_total DECIMAL(13, 3) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  precio_costo DECIMAL(14, 4) NOT NULL,
  id_clie_pedido BIGINT(10) NULL,
  pedido_linea INT(5) NULL,
  PRIMARY KEY (id_clie_albaran, linea),
  CONSTRAINT d_clie_albaranes_det_alb_fk FOREIGN KEY d_clie_albaranes_det_alb_fk (id_clie_albaran)
    REFERENCES d_clie_albaranes_cab_tbl (id_clie_albaran)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_det_art_fk FOREIGN KEY d_clie_albaranes_det_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_det_ci_fk FOREIGN KEY d_clie_albaranes_det_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_det_ped_fk FOREIGN KEY d_clie_albaranes_det_ped_fk (id_clie_pedido)
    REFERENCES d_clie_pedidos_cab_tbl (id_clie_pedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_clie_albaranes_imp_tbl (
  id_clie_albaran BIGINT(10) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  PRIMARY KEY (id_clie_albaran, codimp),
  CONSTRAINT d_clie_albaranes_imp_alb_fk FOREIGN KEY d_clie_albaranes_imp_alb_fk (id_clie_albaran)
    REFERENCES d_clie_albaranes_cab_tbl (id_clie_albaran)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_imp_ci_fk FOREIGN KEY d_clie_albaranes_imp_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_clie_albaranes_pag_tbl (
  id_clie_albaran BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  id_medpag_ven BIGINT(10) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  numero_operacion VARCHAR(30) BINARY NULL,
  PRIMARY KEY (id_clie_albaran, linea),
  CONSTRAINT d_clie_albaranes_pag_alb_fk FOREIGN KEY d_clie_albaranes_pag_alb_fk (id_clie_albaran)
    REFERENCES d_clie_albaranes_cab_tbl (id_clie_albaran)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_albaranes_pag_mpv_fk FOREIGN KEY d_clie_albaranes_pag_mpv_fk (id_medpag_ven)
    REFERENCES d_medios_pago_ven_tbl (id_medpag_ven)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_clientes_tbl (
  codcli VARCHAR(11) BINARY NOT NULL,
  descli VARCHAR(45) BINARY NOT NULL,
  nombre_comercial VARCHAR(45) BINARY NULL,
  domicilio VARCHAR(50) BINARY NULL,
  poblacion VARCHAR(50) BINARY NULL,
  provincia VARCHAR(50) BINARY NULL,
  cp VARCHAR(8) BINARY NULL,
  telefono1 VARCHAR(15) BINARY NULL,
  telefono2 VARCHAR(15) BINARY NULL,
  fax VARCHAR(15) BINARY NULL,
  codpais VARCHAR(4) BINARY NULL,
  persona_contacto VARCHAR(45) BINARY NULL,
  email VARCHAR(60) BINARY NULL,
  cif VARCHAR(20) BINARY NULL,
  id_trat_impuestos BIGINT(10) NOT NULL,
  id_medpag_ven BIGINT(10) NULL,
  codtar VARCHAR(11) BINARY NULL,
  codsec VARCHAR(4) BINARY NULL,
  banco VARCHAR(45) BINARY NULL,
  banco_domicilio VARCHAR(50) BINARY NULL,
  banco_poblacion VARCHAR(50) BINARY NULL,
  ccc VARCHAR(20) BINARY NULL,
  observaciones VARCHAR(255) BINARY NULL,
  activo CHAR(1) BINARY NOT NULL,
  fecha_alta DATETIME NULL,
  fecha_baja DATETIME NULL,
  riesgo_concedido INT(9) NULL,
  PRIMARY KEY (codcli),
  UNIQUE INDEX d_clientes_uk (cif(20)),
  CONSTRAINT d_clientes_mpv_fk FOREIGN KEY d_clientes_mpv_fk (id_medpag_ven)
    REFERENCES d_medios_pago_ven_tbl (id_medpag_ven)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clientes_pai_fk FOREIGN KEY d_clientes_pai_fk (codpais)
    REFERENCES d_paises_tbl (codpais)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clientes_sec_fk FOREIGN KEY d_clientes_sec_fk (codsec)
    REFERENCES d_sectores_tbl (codsec)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clientes_tar_fk FOREIGN KEY d_clientes_tar_fk (codtar)
    REFERENCES d_tarifas_cab_tbl (codtar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clientes_ti_fk FOREIGN KEY d_clientes_ti_fk (id_trat_impuestos)
    REFERENCES config_imp_tratamiento_tbl (id_trat_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_clie_pedidos_cab_tbl (
  id_clie_pedido BIGINT(10) NOT NULL,
  codemp VARCHAR(4) BINARY NOT NULL,
  periodo INT(4) NOT NULL,
  codserie VARCHAR(5) BINARY NOT NULL,
  numped BIGINT(10) NOT NULL,
  fecha DATETIME NOT NULL,
  fecha_suministro_prev DATETIME NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  codcaja VARCHAR(2) BINARY NULL,
  uid_diario_caja VARCHAR(40) BINARY NULL,
  codaplicacion VARCHAR(4) BINARY NOT NULL,
  codconalm VARCHAR(4) BINARY NOT NULL,
  codcli VARCHAR(11) BINARY NOT NULL,
  codtar VARCHAR(11) BINARY NULL,
  id_tipo_porte BIGINT(10) NULL,
  persona_contacto VARCHAR(30) BINARY NULL,
  referencia_cliente VARCHAR(45) BINARY NULL,
  id_grupo_impuestos INT(5) NOT NULL,
  id_trat_impuestos BIGINT(10) NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  id_usuario BIGINT(10) NULL,
  tarjeta_fidelizacion VARCHAR(30) BINARY NULL,
  estado INT(3) NOT NULL,
  subestado INT(3) NOT NULL,
  estado_receptor INT(3) NOT NULL,
  subestado_receptor INT(3) NOT NULL,
  id_clie_presupuesto BIGINT(10) NULL,
  PRIMARY KEY (id_clie_pedido),
  UNIQUE INDEX d_clie_pedidos_cab_uk (codemp(4), periodo, codserie(5), numped),
  CONSTRAINT d_clie_pedidos_cab_alm_fk FOREIGN KEY d_clie_pedidos_cab_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_cab_cli_fk FOREIGN KEY d_clie_pedidos_cab_cli_fk (codcli)
    REFERENCES d_clientes_tbl (codcli)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_cab_con_fk FOREIGN KEY d_clie_pedidos_cab_con_fk (codaplicacion, codconalm)
    REFERENCES d_almacenes_conceptos_tbl (codaplicacion, codconalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_cab_dc_fk FOREIGN KEY d_clie_pedidos_cab_dc_fk (uid_diario_caja)
    REFERENCES d_caja_cab_tbl (uid_diario_caja)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_cab_emp_fk FOREIGN KEY d_clie_pedidos_cab_emp_fk (codemp)
    REFERENCES d_empresas_tbl (codemp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_cab_gi_fk FOREIGN KEY d_clie_pedidos_cab_gi_fk (id_grupo_impuestos)
    REFERENCES config_imp_grupos_tbl (id_grupo_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_cab_por_fk FOREIGN KEY d_clie_pedidos_cab_por_fk (id_tipo_porte)
    REFERENCES d_tipos_portes_tbl (id_tipo_porte)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_cab_pre_fk FOREIGN KEY d_clie_pedidos_cab_pre_fk (id_clie_presupuesto)
    REFERENCES d_clie_presupuestos_cab_tbl (id_clie_presupuesto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_cab_ser_fk FOREIGN KEY d_clie_pedidos_cab_ser_fk (codserie)
    REFERENCES d_series_tbl (codserie)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_cab_tar_fk FOREIGN KEY d_clie_pedidos_cab_tar_fk (codtar)
    REFERENCES d_tarifas_cab_tbl (codtar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_cab_ti_fk FOREIGN KEY d_clie_pedidos_cab_ti_fk (id_trat_impuestos)
    REFERENCES config_imp_tratamiento_tbl (id_trat_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_clie_pedidos_det_tbl (
  id_clie_pedido BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  desglose1 VARCHAR(15) BINARY NOT NULL,
  desglose2 VARCHAR(15) BINARY NOT NULL,
  desart VARCHAR(45) BINARY NULL,
  descripcion_ampliada VARCHAR(255) BINARY NULL,
  unidad_medida VARCHAR(4) BINARY NULL,
  cantidad_medida_solicitada DECIMAL(13, 3) NULL,
  cantidad_solicitada DECIMAL(13, 3) NULL,
  cantidad_medida_aceptada DECIMAL(13, 3) NULL,
  cantidad_aceptada DECIMAL(13, 3) NULL,
  cantidad_medida_preparada DECIMAL(13, 3) NULL,
  cantidad_preparada DECIMAL(13, 3) NULL,
  precio DECIMAL(14, 4) NOT NULL,
  descuento DECIMAL(5, 2) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  id_promocion BIGINT(10) NULL,
  lestado INT(3) NOT NULL,
  lsubestado INT(3) NOT NULL,
  id_clie_pedido_origen BIGINT(10) NULL,
  linea_pedido_origen INT(5) NULL,
  PRIMARY KEY (id_clie_pedido, linea),
  CONSTRAINT d_clie_pedidos_det_art_fk FOREIGN KEY d_clie_pedidos_det_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_det_ci_fk FOREIGN KEY d_clie_pedidos_det_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_det_org_fk FOREIGN KEY d_clie_pedidos_det_org_fk (id_clie_pedido_origen)
    REFERENCES d_clie_pedidos_cab_tbl (id_clie_pedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_det_ped_fk FOREIGN KEY d_clie_pedidos_det_ped_fk (id_clie_pedido)
    REFERENCES d_clie_pedidos_cab_tbl (id_clie_pedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_clie_pedidos_imp_tbl (
  id_clie_pedido BIGINT(10) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  PRIMARY KEY (id_clie_pedido, codimp),
  CONSTRAINT d_clie_pedidos_imp_ci_fk FOREIGN KEY d_clie_pedidos_imp_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_imp_ped_fk FOREIGN KEY d_clie_pedidos_imp_ped_fk (id_clie_pedido)
    REFERENCES d_clie_pedidos_cab_tbl (id_clie_pedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_clie_pedidos_pag_tbl (
  id_clie_pedido BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  id_medpag_ven BIGINT(10) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  numero_operacion VARCHAR(30) BINARY NULL,
  PRIMARY KEY (id_clie_pedido, linea),
  CONSTRAINT d_clie_pedidos_pag_mpv_fk FOREIGN KEY d_clie_pedidos_pag_mpv_fk (id_medpag_ven)
    REFERENCES d_medios_pago_ven_tbl (id_medpag_ven)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_pedidos_pag_ped_fk FOREIGN KEY d_clie_pedidos_pag_ped_fk (id_clie_pedido)
    REFERENCES d_clie_pedidos_cab_tbl (id_clie_pedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_clie_presupuestos_cab_tbl (
  id_clie_presupuesto BIGINT(10) NOT NULL,
  codemp VARCHAR(4) BINARY NOT NULL,
  periodo INT(4) NOT NULL,
  codserie VARCHAR(5) BINARY NOT NULL,
  numpre BIGINT(10) NOT NULL,
  version INT(3) NOT NULL,
  fecha DATETIME NOT NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  codaplicacion VARCHAR(4) BINARY NOT NULL,
  codconalm VARCHAR(4) BINARY NOT NULL,
  codcli VARCHAR(11) BINARY NOT NULL,
  codtar VARCHAR(11) BINARY NULL,
  id_tipo_porte BIGINT(10) NULL,
  persona_contacto VARCHAR(30) BINARY NULL,
  referencia_cliente VARCHAR(45) BINARY NULL,
  id_grupo_impuestos INT(5) NOT NULL,
  id_trat_impuestos BIGINT(10) NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  id_usuario BIGINT(10) NULL,
  tarjeta_fidelizacion VARCHAR(30) BINARY NULL,
  estado INT(3) NOT NULL,
  subestado INT(3) NOT NULL,
  PRIMARY KEY (id_clie_presupuesto),
  UNIQUE INDEX d_clie_presupuestos_cab_uk (codemp(4), periodo, codserie(5), numpre, version),
  CONSTRAINT d_clie_presupuestos_cab_alm_fk FOREIGN KEY d_clie_presupuestos_cab_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_presupuestos_cab_cli_fk FOREIGN KEY d_clie_presupuestos_cab_cli_fk (codcli)
    REFERENCES d_clientes_tbl (codcli)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_presupuestos_cab_con_fk FOREIGN KEY d_clie_presupuestos_cab_con_fk (codaplicacion, codconalm)
    REFERENCES d_almacenes_conceptos_tbl (codaplicacion, codconalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_presupuestos_cab_emp_fk FOREIGN KEY d_clie_presupuestos_cab_emp_fk (codemp)
    REFERENCES d_empresas_tbl (codemp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_presupuestos_cab_gi_fk FOREIGN KEY d_clie_presupuestos_cab_gi_fk (id_grupo_impuestos)
    REFERENCES config_imp_grupos_tbl (id_grupo_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_presupuestos_cab_por_fk FOREIGN KEY d_clie_presupuestos_cab_por_fk (id_tipo_porte)
    REFERENCES d_tipos_portes_tbl (id_tipo_porte)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_presupuestos_cab_ser_fk FOREIGN KEY d_clie_presupuestos_cab_ser_fk (codserie)
    REFERENCES d_series_tbl (codserie)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_presupuestos_cab_tar_fk FOREIGN KEY d_clie_presupuestos_cab_tar_fk (codtar)
    REFERENCES d_tarifas_cab_tbl (codtar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_presupuestos_cab_ti_fk FOREIGN KEY d_clie_presupuestos_cab_ti_fk (id_trat_impuestos)
    REFERENCES config_imp_tratamiento_tbl (id_trat_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_clie_presupuestos_det_tbl (
  id_clie_presupuesto BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  fecha DATETIME NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  desglose1 VARCHAR(15) BINARY NOT NULL,
  desglose2 VARCHAR(15) BINARY NOT NULL,
  desart VARCHAR(45) BINARY NULL,
  descripcion_ampliada VARCHAR(255) BINARY NULL,
  unidad_medida VARCHAR(4) BINARY NULL,
  cantidad_medida DECIMAL(13, 3) NULL,
  cantidad DECIMAL(13, 3) NOT NULL,
  precio DECIMAL(14, 4) NOT NULL,
  precio_total DECIMAL(14, 4) NOT NULL,
  descuento DECIMAL(5, 2) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  importe_total DECIMAL(13, 3) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  precio_costo DECIMAL(14, 4) NOT NULL,
  PRIMARY KEY (id_clie_presupuesto, linea),
  CONSTRAINT d_clie_presupuestos_det_art_fk FOREIGN KEY d_clie_presupuestos_det_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_presupuestos_det_ci_fk FOREIGN KEY d_clie_presupuestos_det_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_presupuestos_det_pre_fk FOREIGN KEY d_clie_presupuestos_det_pre_fk (id_clie_presupuesto)
    REFERENCES d_clie_presupuestos_cab_tbl (id_clie_presupuesto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_clie_presupuestos_imp_tbl (
  id_clie_presupuesto BIGINT(10) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  PRIMARY KEY (id_clie_presupuesto, codimp),
  CONSTRAINT d_clie_presupuestos_imp_ci_fk FOREIGN KEY d_clie_presupuestos_imp_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_presupuestos_imp_pre_fk FOREIGN KEY d_clie_presupuestos_imp_pre_fk (id_clie_presupuesto)
    REFERENCES d_clie_presupuestos_cab_tbl (id_clie_presupuesto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_clie_presupuestos_pag_tbl (
  id_clie_presupuesto BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  id_medpag_ven BIGINT(10) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  numero_operacion VARCHAR(30) BINARY NULL,
  PRIMARY KEY (id_clie_presupuesto, linea),
  CONSTRAINT d_clie_presupuestos_pag_mpv_fk FOREIGN KEY d_clie_presupuestos_pag_mpv_fk (id_medpag_ven)
    REFERENCES d_medios_pago_ven_tbl (id_medpag_ven)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_clie_presupuestos_pag_pre_fk FOREIGN KEY d_clie_presupuestos_pag_pre_fk (id_clie_presupuesto)
    REFERENCES d_clie_presupuestos_cab_tbl (id_clie_presupuesto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_cobros_doc_tbl (
  id_cobro BIGINT(10) NOT NULL,
  codemp VARCHAR(4) BINARY NOT NULL,
  codcli VARCHAR(11) BINARY NOT NULL,
  fecha_alta DATETIME NOT NULL,
  fecha_vencimiento DATETIME NOT NULL,
  fecha_baja DATETIME NULL,
  fecha_cobro DATETIME NULL,
  borrado CHAR(1) BINARY NOT NULL,
  codtipoefec VARCHAR(2) BINARY NOT NULL,
  codserie VARCHAR(5) BINARY NULL,
  documento VARCHAR(20) BINARY NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  codban_cobro VARCHAR(11) BINARY NULL,
  codban_devolucion VARCHAR(11) BINARY NULL,
  gastos_devolucion DECIMAL(13, 3) NULL,
  remesable CHAR(1) BINARY NOT NULL,
  fecha_entrada_documento DATETIME NULL,
  id_remesa BIGINT(10) NULL,
  id_cobro_devolucion BIGINT(10) NULL,
  PRIMARY KEY (id_cobro),
  INDEX d_cobros_ind1 (codcli(11), fecha_vencimiento),
  CONSTRAINT d_cobros_doc_bandev_fk FOREIGN KEY d_cobros_doc_bandev_fk (codban_devolucion)
    REFERENCES d_bancos_tbl (codban)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_cobros_doc_ban_fk FOREIGN KEY d_cobros_doc_ban_fk (codban_cobro)
    REFERENCES d_bancos_tbl (codban)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_cobros_doc_cli_fk FOREIGN KEY d_cobros_doc_cli_fk (codcli)
    REFERENCES d_clientes_tbl (codcli)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_cobros_doc_emp_fk FOREIGN KEY d_cobros_doc_emp_fk (codemp)
    REFERENCES d_empresas_tbl (codemp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_cobros_doc_tef_fk FOREIGN KEY d_cobros_doc_tef_fk (codtipoefec)
    REFERENCES d_tipos_efectos_tbl (codtipoefec)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_cobros_remesas_cab_tbl (
  id_remesa BIGINT(10) NOT NULL,
  codban VARCHAR(11) BINARY NOT NULL,
  fecha_remesa DATETIME NULL,
  estado INT(3) NOT NULL,
  PRIMARY KEY (id_remesa),
  CONSTRAINT d_cobros_remesas_cab_ban_fk FOREIGN KEY d_cobros_remesas_cab_ban_fk (codban)
    REFERENCES d_bancos_tbl (codban)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_cobros_ven_tbl (
  id_vencimiento BIGINT(10) NOT NULL,
  id_cobro BIGINT(10) NOT NULL,
  id_vencimiento_enlace BIGINT(10) NULL,
  codserie VARCHAR(5) BINARY NULL,
  documento VARCHAR(20) BINARY NOT NULL,
  fecha_factura DATETIME NULL,
  fecha_vencimiento DATETIME NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  fecha_alta DATETIME NOT NULL,
  PRIMARY KEY (id_vencimiento)
)
ENGINE = INNODB;

CREATE TABLE d_empresas_tbl (
  codemp VARCHAR(4) BINARY NOT NULL,
  desemp VARCHAR(45) BINARY NULL,
  nombre_comercial VARCHAR(45) BINARY NULL,
  domicilio VARCHAR(50) BINARY NULL,
  poblacion VARCHAR(50) BINARY NULL,
  provincia VARCHAR(50) BINARY NULL,
  cp VARCHAR(8) BINARY NULL,
  cif VARCHAR(20) BINARY NULL,
  telefono1 VARCHAR(15) BINARY NULL,
  telefono2 VARCHAR(15) BINARY NULL,
  fax VARCHAR(15) BINARY NULL,
  activo CHAR(1) BINARY NOT NULL,
  logotipo LONGBLOB NULL,
  registro_mercantil VARCHAR(255) BINARY NULL,
  PRIMARY KEY (codemp)
)
ENGINE = INNODB;

CREATE TABLE d_facturas_rep_cab_tbl (
  id_factura_rep BIGINT(10) NOT NULL,
  codemp VARCHAR(4) BINARY NOT NULL,
  periodo INT(4) NOT NULL,
  codserie VARCHAR(5) BINARY NOT NULL,
  numfac BIGINT(10) NOT NULL,
  referencia VARCHAR(50) BINARY NULL,
  fecha DATETIME NOT NULL,
  codcli VARCHAR(11) BINARY NOT NULL,
  descli VARCHAR(45) BINARY NULL,
  domicilio VARCHAR(50) BINARY NULL,
  poblacion VARCHAR(50) BINARY NULL,
  provincia VARCHAR(50) BINARY NULL,
  cp VARCHAR(8) BINARY NULL,
  cif VARCHAR(20) BINARY NULL,
  id_grupo_impuestos INT(5) NOT NULL,
  id_trat_impuestos BIGINT(10) NOT NULL,
  id_vencimiento_enlace BIGINT(10) NULL,
  concepto VARCHAR(50) BINARY NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  PRIMARY KEY (id_factura_rep),
  UNIQUE INDEX d_facturas_rep_cab_uk (codemp(4), periodo, codserie(5), numfac),
  CONSTRAINT d_facturas_rep_cab_cli_fk FOREIGN KEY d_facturas_rep_cab_cli_fk (codcli)
    REFERENCES d_clientes_tbl (codcli)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_rep_cab_emp_fk FOREIGN KEY d_facturas_rep_cab_emp_fk (codemp)
    REFERENCES d_empresas_tbl (codemp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_rep_cab_gi_fk FOREIGN KEY d_facturas_rep_cab_gi_fk (id_grupo_impuestos)
    REFERENCES config_imp_grupos_tbl (id_grupo_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_rep_cab_ser_fk FOREIGN KEY d_facturas_rep_cab_ser_fk (codserie)
    REFERENCES d_series_tbl (codserie)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_rep_cab_ti_fk FOREIGN KEY d_facturas_rep_cab_ti_fk (id_trat_impuestos)
    REFERENCES config_imp_tratamiento_tbl (id_trat_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_facturas_rep_det_tbl (
  id_factura_rep BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  referencia VARCHAR(30) BINARY NULL,
  fecha_referencia DATETIME NULL,
  codart VARCHAR(13) BINARY NULL,
  desglose1 VARCHAR(15) BINARY NULL,
  desglose2 VARCHAR(15) BINARY NULL,
  concepto VARCHAR(50) BINARY NOT NULL,
  concepto_ampliado VARCHAR(255) BINARY NULL,
  unidad_medida VARCHAR(4) BINARY NULL,
  cantidad_medida DECIMAL(13, 3) NULL,
  cantidad DECIMAL(13, 3) NOT NULL,
  precio DECIMAL(14, 4) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (id_factura_rep, linea),
  CONSTRAINT d_facturas_rep_det_art_fk FOREIGN KEY d_facturas_rep_det_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_rep_det_ci_fk FOREIGN KEY d_facturas_rep_det_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_rep_det_fac_fk FOREIGN KEY d_facturas_rep_det_fac_fk (id_factura_rep)
    REFERENCES d_facturas_rep_cab_tbl (id_factura_rep)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_facturas_rep_imp_tbl (
  id_factura_rep BIGINT(10) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  PRIMARY KEY (id_factura_rep, codimp),
  CONSTRAINT d_facturas_rep_imp_ci_fk FOREIGN KEY d_facturas_rep_imp_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_rep_imp_fac_fk FOREIGN KEY d_facturas_rep_imp_fac_fk (id_factura_rep)
    REFERENCES d_facturas_rep_cab_tbl (id_factura_rep)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_facturas_rep_pag_tbl (
  id_factura_rep BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  id_medpag_ven BIGINT(10) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  numero_operacion VARCHAR(30) BINARY NULL,
  PRIMARY KEY (id_factura_rep, linea),
  CONSTRAINT d_facturas_rep_pag_fac_fk FOREIGN KEY d_facturas_rep_pag_fac_fk (id_factura_rep)
    REFERENCES d_facturas_rep_cab_tbl (id_factura_rep)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_rep_pag_mpv_fk FOREIGN KEY d_facturas_rep_pag_mpv_fk (id_medpag_ven)
    REFERENCES d_medios_pago_ven_tbl (id_medpag_ven)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_facturas_sop_cab_tbl (
  id_factura_sop BIGINT(10) NOT NULL,
  codemp VARCHAR(4) BINARY NOT NULL,
  periodo INT(4) NOT NULL,
  codserie VARCHAR(5) BINARY NOT NULL,
  numfac BIGINT(10) NOT NULL,
  referencia VARCHAR(50) BINARY NULL,
  fecha DATETIME NOT NULL,
  fecha_fact_proveedor DATETIME NULL,
  codpro VARCHAR(11) BINARY NOT NULL,
  despro VARCHAR(45) BINARY NULL,
  domicilio VARCHAR(50) BINARY NULL,
  poblacion VARCHAR(50) BINARY NULL,
  provincia VARCHAR(50) BINARY NULL,
  cp VARCHAR(8) BINARY NULL,
  cif VARCHAR(20) BINARY NULL,
  id_grupo_impuestos INT(5) NOT NULL,
  id_trat_impuestos BIGINT(10) NOT NULL,
  id_vencimiento_enlace BIGINT(10) NULL,
  concepto VARCHAR(50) BINARY NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  PRIMARY KEY (id_factura_sop),
  UNIQUE INDEX d_facturas_sop_cab_uk (codemp(4), periodo, codserie(5), numfac),
  CONSTRAINT d_facturas_sop_cab_emp_fk FOREIGN KEY d_facturas_sop_cab_emp_fk (codemp)
    REFERENCES d_empresas_tbl (codemp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_sop_cab_gi_fk FOREIGN KEY d_facturas_sop_cab_gi_fk (id_grupo_impuestos)
    REFERENCES config_imp_grupos_tbl (id_grupo_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_sop_cab_pro_fk FOREIGN KEY d_facturas_sop_cab_pro_fk (codpro)
    REFERENCES d_proveedores_tbl (codpro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_sop_cab_ser_fk FOREIGN KEY d_facturas_sop_cab_ser_fk (codserie)
    REFERENCES d_series_tbl (codserie)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_sop_cab_ti_fk FOREIGN KEY d_facturas_sop_cab_ti_fk (id_trat_impuestos)
    REFERENCES config_imp_tratamiento_tbl (id_trat_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_facturas_sop_det_tbl (
  id_factura_sop BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  referencia VARCHAR(30) BINARY NULL,
  fecha_referencia DATETIME NULL,
  codart VARCHAR(13) BINARY NULL,
  desglose1 VARCHAR(15) BINARY NULL,
  desglose2 VARCHAR(15) BINARY NULL,
  concepto VARCHAR(50) BINARY NOT NULL,
  concepto_ampliado VARCHAR(255) BINARY NULL,
  unidad_medida VARCHAR(4) BINARY NULL,
  cantidad_medida DECIMAL(13, 3) NULL,
  cantidad DECIMAL(13, 3) NOT NULL,
  precio DECIMAL(14, 4) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (id_factura_sop, linea),
  CONSTRAINT d_facturas_sop_det_art_fk FOREIGN KEY d_facturas_sop_det_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_sop_det_ci_fk FOREIGN KEY d_facturas_sop_det_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_sop_det_fac_fk FOREIGN KEY d_facturas_sop_det_fac_fk (id_factura_sop)
    REFERENCES d_facturas_sop_cab_tbl (id_factura_sop)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_facturas_sop_imp_tbl (
  id_factura_sop BIGINT(10) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  PRIMARY KEY (id_factura_sop, codimp),
  CONSTRAINT d_facturas_sop_imp_ci_fk FOREIGN KEY d_facturas_sop_imp_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_sop_imp_fac_fk FOREIGN KEY d_facturas_sop_imp_fac_fk (id_factura_sop)
    REFERENCES d_facturas_sop_cab_tbl (id_factura_sop)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_facturas_sop_pag_tbl (
  id_factura_sop BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  id_medpag_ven BIGINT(10) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  numero_operacion VARCHAR(30) BINARY NULL,
  PRIMARY KEY (id_factura_sop, linea),
  CONSTRAINT d_facturas_sop_pag_fac_fk FOREIGN KEY d_facturas_sop_pag_fac_fk (id_factura_sop)
    REFERENCES d_facturas_sop_cab_tbl (id_factura_sop)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_facturas_sop_pag_mpv_fk FOREIGN KEY d_facturas_sop_pag_mpv_fk (id_medpag_ven)
    REFERENCES d_medios_pago_ven_tbl (id_medpag_ven)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_familias_tbl (
  codfam VARCHAR(6) BINARY NOT NULL,
  desfam VARCHAR(30) BINARY NOT NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codfam)
)
ENGINE = INNODB;

CREATE TABLE d_medios_pago_tbl (
  codmedpag VARCHAR(4) BINARY NOT NULL,
  desmedpag VARCHAR(45) BINARY NOT NULL,
  contado CHAR(1) BINARY NULL,
  efectivo CHAR(1) BINARY NULL,
  tarjeta_credito CHAR(1) BINARY NULL,
  codtipoefec VARCHAR(2) BINARY NULL,
  visible_venta CHAR(1) BINARY NULL,
  visible_tienda_virtual CHAR(1) BINARY NULL,
  visible_compra CHAR(1) BINARY NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codmedpag),
  CONSTRAINT d_medios_pago_tef_fk FOREIGN KEY d_medios_pago_tef_fk (codtipoefec)
    REFERENCES d_tipos_efectos_tbl (codtipoefec)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_medios_pago_ven_tbl (
  id_medpag_ven BIGINT(10) NOT NULL,
  codmedpag VARCHAR(4) BINARY NOT NULL,
  desmedpag_ven VARCHAR(45) BINARY NOT NULL,
  numero_vencimientos INT(5) NOT NULL,
  dias_cadencia INT(5) NOT NULL,
  dias_entre_vencimientos INT(5) NOT NULL,
  dias_naturales CHAR(1) BINARY NOT NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (id_medpag_ven),
  INDEX d_medios_pago_ven_ind1 (codmedpag(4)),
  CONSTRAINT d_medios_pago_ven_mp_fk FOREIGN KEY d_medios_pago_ven_mp_fk (codmedpag)
    REFERENCES d_medios_pago_tbl (codmedpag)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_pagos_doc_tbl (
  id_pago BIGINT(10) NOT NULL,
  codemp VARCHAR(4) BINARY NOT NULL,
  codpro VARCHAR(11) BINARY NOT NULL,
  fecha_alta DATETIME NOT NULL,
  fecha_vencimiento DATETIME NOT NULL,
  fecha_baja DATETIME NULL,
  fecha_pago DATETIME NULL,
  borrado CHAR(1) BINARY NOT NULL,
  codtipoefec VARCHAR(2) BINARY NOT NULL,
  codserie VARCHAR(5) BINARY NULL,
  documento VARCHAR(20) BINARY NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  codban_pago VARCHAR(11) BINARY NULL,
  documento_pago VARCHAR(10) BINARY NULL,
  id_remesa BIGINT(10) NULL,
  fecha_emision DATETIME NULL,
  observaciones VARCHAR(255) BINARY NULL,
  PRIMARY KEY (id_pago),
  CONSTRAINT d_pagos_doc_ban_fk FOREIGN KEY d_pagos_doc_ban_fk (codban_pago)
    REFERENCES d_bancos_tbl (codban)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_pagos_doc_emp_fk FOREIGN KEY d_pagos_doc_emp_fk (codemp)
    REFERENCES d_empresas_tbl (codemp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_pagos_doc_pro_fk FOREIGN KEY d_pagos_doc_pro_fk (codpro)
    REFERENCES d_proveedores_tbl (codpro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_pagos_doc_re_fk FOREIGN KEY d_pagos_doc_re_fk (id_remesa)
    REFERENCES d_pagos_remesas_cab_tbl (id_remesa)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_pagos_doc_tef_fk FOREIGN KEY d_pagos_doc_tef_fk (codtipoefec)
    REFERENCES d_tipos_efectos_tbl (codtipoefec)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_pagos_remesas_cab_tbl (
  id_remesa BIGINT(10) NOT NULL,
  codban VARCHAR(11) BINARY NOT NULL,
  codtipoefec VARCHAR(2) BINARY NOT NULL,
  fecha_remesa DATETIME NOT NULL,
  fecha_generacion DATETIME NOT NULL,
  estado INT(3) NOT NULL,
  PRIMARY KEY (id_remesa),
  CONSTRAINT d_pagos_remesas_cab_ban_fk FOREIGN KEY d_pagos_remesas_cab_ban_fk (codban)
    REFERENCES d_bancos_tbl (codban)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_pagos_remesas_cab_tef_fk FOREIGN KEY d_pagos_remesas_cab_tef_fk (codtipoefec)
    REFERENCES d_tipos_efectos_tbl (codtipoefec)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_pagos_ven_tbl (
  id_vencimiento BIGINT(10) NOT NULL,
  id_pago BIGINT(10) NOT NULL,
  id_vencimiento_enlace BIGINT(10) NULL,
  codserie VARCHAR(5) BINARY NULL,
  documento VARCHAR(20) BINARY NOT NULL,
  fecha_factura DATETIME NULL,
  fecha_vencimiento DATETIME NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  fecha_alta DATETIME NOT NULL,
  fecha_aceptacion DATETIME NULL,
  PRIMARY KEY (id_vencimiento)
)
ENGINE = INNODB;

CREATE TABLE d_paises_tbl (
  codpais VARCHAR(4) BINARY NOT NULL,
  despais VARCHAR(20) BINARY NOT NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codpais)
)
ENGINE = INNODB;

CREATE TABLE d_promociones_cab_tbl (
  id_promocion BIGINT(10) NOT NULL,
  codtar VARCHAR(11) BINARY NOT NULL,
  descripcion VARCHAR(50) BINARY NOT NULL,
  fecha_inicio DATETIME NOT NULL,
  fecha_fin DATETIME NOT NULL,
  solo_fidelizacion CHAR(1) BINARY NOT NULL,
  id_tipo_promocion BIGINT(10) NOT NULL,
  version_tarifa BIGINT(10) NULL,
  PRIMARY KEY (id_promocion),
  CONSTRAINT d_promociones_cab_tar_fk FOREIGN KEY d_promociones_cab_tar_fk (codtar)
    REFERENCES d_tarifas_cab_tbl (codtar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_promociones_cab_tpr_fk FOREIGN KEY d_promociones_cab_tpr_fk (id_tipo_promocion)
    REFERENCES d_promociones_tipos_tbl (id_tipo_promocion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_promociones_det_tbl (
  id_promocion BIGINT(10) NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  precio_tarifa DECIMAL(14, 4) NOT NULL,
  precio_tarifa_total DECIMAL(14, 4) NOT NULL,
  precio_venta DECIMAL(14, 4) NULL,
  precio_total DECIMAL(14, 4) NULL,
  puntos INT(5) NOT NULL,
  texto_promocion VARCHAR(255) BINARY NULL,
  datos_promocion LONGBLOB NULL,
  fecha_inicio DATETIME NULL,
  fecha_fin DATETIME NULL,
  version_tarifa BIGINT(10) NULL,
  PRIMARY KEY (id_promocion, codart),
  CONSTRAINT d_promociones_det_art_fk FOREIGN KEY d_promociones_det_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_promociones_tipos_tbl (
  id_tipo_promocion BIGINT(10) NOT NULL,
  destipopromocion VARCHAR(45) BINARY NOT NULL,
  configuracion LONGBLOB NULL,
  PRIMARY KEY (id_tipo_promocion)
)
ENGINE = INNODB;

CREATE TABLE d_prov_albaranes_cab_tbl (
  id_prov_albaran BIGINT(10) NOT NULL,
  codemp VARCHAR(4) BINARY NOT NULL,
  periodo INT(4) NOT NULL,
  codserie VARCHAR(5) BINARY NOT NULL,
  numalb BIGINT(10) NOT NULL,
  fecha DATETIME NOT NULL,
  fecha_suministro DATETIME NOT NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  codcaja VARCHAR(2) BINARY NULL,
  uid_diario_caja VARCHAR(40) BINARY NULL,
  codaplicacion VARCHAR(4) BINARY NOT NULL,
  codconalm VARCHAR(4) BINARY NOT NULL,
  referencia_proveedor VARCHAR(45) BINARY NULL,
  codpro VARCHAR(11) BINARY NOT NULL,
  persona_contacto VARCHAR(45) BINARY NULL,
  id_grupo_impuestos INT(5) NOT NULL,
  id_trat_impuestos BIGINT(10) NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  id_usuario BIGINT(10) NULL,
  id_factura_sop BIGINT(10) NULL,
  PRIMARY KEY (id_prov_albaran),
  UNIQUE INDEX d_prov_albaranes_cab_uk (codemp(4), periodo, codserie(5), numalb),
  CONSTRAINT d_prov_albaranes_cab_alm_fk FOREIGN KEY d_prov_albaranes_cab_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_cab_con_fk FOREIGN KEY d_prov_albaranes_cab_con_fk (codaplicacion, codconalm)
    REFERENCES d_almacenes_conceptos_tbl (codaplicacion, codconalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_cab_dc_fk FOREIGN KEY d_prov_albaranes_cab_dc_fk (uid_diario_caja)
    REFERENCES d_caja_cab_tbl (uid_diario_caja)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_cab_emp_fk FOREIGN KEY d_prov_albaranes_cab_emp_fk (codemp)
    REFERENCES d_empresas_tbl (codemp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_cab_fac_fk FOREIGN KEY d_prov_albaranes_cab_fac_fk (id_factura_sop)
    REFERENCES d_facturas_sop_cab_tbl (id_factura_sop)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_cab_gi_fk FOREIGN KEY d_prov_albaranes_cab_gi_fk (id_grupo_impuestos)
    REFERENCES config_imp_grupos_tbl (id_grupo_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_cab_pro_fk FOREIGN KEY d_prov_albaranes_cab_pro_fk (codpro)
    REFERENCES d_proveedores_tbl (codpro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_cab_ser_fk FOREIGN KEY d_prov_albaranes_cab_ser_fk (codserie)
    REFERENCES d_series_tbl (codserie)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_cab_ti_fk FOREIGN KEY d_prov_albaranes_cab_ti_fk (id_trat_impuestos)
    REFERENCES config_imp_tratamiento_tbl (id_trat_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_prov_albaranes_det_tbl (
  id_prov_albaran BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  fecha DATETIME NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  desglose1 VARCHAR(15) BINARY NOT NULL,
  desglose2 VARCHAR(15) BINARY NOT NULL,
  desart VARCHAR(45) BINARY NULL,
  descripcion_ampliada VARCHAR(255) BINARY NULL,
  unidad_medida VARCHAR(4) BINARY NULL,
  cantidad_medida DECIMAL(13, 3) NULL,
  cantidad DECIMAL(13, 3) NOT NULL,
  precio DECIMAL(14, 4) NOT NULL,
  descuento DECIMAL(5, 2) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  id_prov_pedido BIGINT(10) NULL,
  pedido_linea INT(5) NULL,
  PRIMARY KEY (id_prov_albaran, linea),
  CONSTRAINT d_prov_albaranes_det_alb_fk FOREIGN KEY d_prov_albaranes_det_alb_fk (id_prov_albaran)
    REFERENCES d_prov_albaranes_cab_tbl (id_prov_albaran)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_det_art_fk FOREIGN KEY d_prov_albaranes_det_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_det_ci_fk FOREIGN KEY d_prov_albaranes_det_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_det_ped_fk FOREIGN KEY d_prov_albaranes_det_ped_fk (id_prov_pedido)
    REFERENCES d_prov_pedidos_cab_tbl (id_prov_pedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_prov_albaranes_imp_tbl (
  id_prov_albaran BIGINT(10) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  PRIMARY KEY (id_prov_albaran, codimp),
  CONSTRAINT d_prov_albaranes_imp_alb_fk FOREIGN KEY d_prov_albaranes_imp_alb_fk (id_prov_albaran)
    REFERENCES d_prov_albaranes_cab_tbl (id_prov_albaran)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_imp_ci_fk FOREIGN KEY d_prov_albaranes_imp_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_prov_albaranes_pag_tbl (
  id_prov_albaran BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  id_medpag_ven BIGINT(10) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  PRIMARY KEY (id_prov_albaran, linea),
  CONSTRAINT d_prov_albaranes_pag_alb_fk FOREIGN KEY d_prov_albaranes_pag_alb_fk (id_prov_albaran)
    REFERENCES d_prov_albaranes_cab_tbl (id_prov_albaran)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_albaranes_pag_mpv_fk FOREIGN KEY d_prov_albaranes_pag_mpv_fk (id_medpag_ven)
    REFERENCES d_medios_pago_ven_tbl (id_medpag_ven)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_proveedores_tbl (
  codpro VARCHAR(11) BINARY NOT NULL,
  despro VARCHAR(45) BINARY NOT NULL,
  tipo_proveedor VARCHAR(3) BINARY NULL,
  nombre_comercial VARCHAR(45) BINARY NULL,
  domicilio VARCHAR(50) BINARY NULL,
  poblacion VARCHAR(50) BINARY NULL,
  provincia VARCHAR(50) BINARY NULL,
  cp VARCHAR(8) BINARY NULL,
  codpais VARCHAR(4) BINARY NULL,
  telefono1 VARCHAR(15) BINARY NULL,
  telefono2 VARCHAR(15) BINARY NULL,
  fax VARCHAR(15) BINARY NULL,
  persona_contacto VARCHAR(45) BINARY NULL,
  email VARCHAR(60) BINARY NULL,
  cif VARCHAR(20) BINARY NULL,
  id_trat_impuestos BIGINT(10) NOT NULL,
  id_medpag_ven BIGINT(10) NULL,
  observaciones VARCHAR(255) BINARY NULL,
  activo CHAR(1) BINARY NOT NULL,
  fecha_alta DATETIME NULL,
  fecha_baja DATETIME NULL,
  banco VARCHAR(45) BINARY NULL,
  banco_domicilio VARCHAR(50) BINARY NULL,
  banco_poblacion VARCHAR(50) BINARY NULL,
  ccc VARCHAR(20) BINARY NULL,
  PRIMARY KEY (codpro),
  CONSTRAINT d_proveedores_mpv_fk FOREIGN KEY d_proveedores_mpv_fk (id_medpag_ven)
    REFERENCES d_medios_pago_ven_tbl (id_medpag_ven)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_proveedores_pai_fk FOREIGN KEY d_proveedores_pai_fk (codpais)
    REFERENCES d_paises_tbl (codpais)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_proveedores_ti_fk FOREIGN KEY d_proveedores_ti_fk (id_trat_impuestos)
    REFERENCES config_imp_tratamiento_tbl (id_trat_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_prov_pedidos_cab_tbl (
  id_prov_pedido BIGINT(10) NOT NULL,
  codemp VARCHAR(4) BINARY NOT NULL,
  periodo INT(4) NOT NULL,
  codserie VARCHAR(5) BINARY NOT NULL,
  numped BIGINT(10) NOT NULL,
  fecha DATETIME NOT NULL,
  fecha_suministro_prev DATETIME NULL,
  referencia_proveedor VARCHAR(45) BINARY NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  codcaja VARCHAR(2) BINARY NULL,
  uid_diario_caja VARCHAR(40) BINARY NULL,
  codaplicacion VARCHAR(4) BINARY NOT NULL,
  codconalm VARCHAR(4) BINARY NOT NULL,
  codpro VARCHAR(11) BINARY NOT NULL,
  persona_contacto VARCHAR(30) BINARY NULL,
  id_grupo_impuestos INT(5) NOT NULL,
  id_trat_impuestos BIGINT(10) NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  observaciones VARCHAR(255) BINARY NULL,
  id_usuario BIGINT(10) NULL,
  estado INT(3) NOT NULL,
  subestado INT(3) NOT NULL,
  PRIMARY KEY (id_prov_pedido),
  UNIQUE INDEX d_prov_pedidos_cab_uk (codemp(4), periodo, codserie(5), numped),
  CONSTRAINT d_prov_pedidos_cab_alm_fk FOREIGN KEY d_prov_pedidos_cab_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_pedidos_cab_con_fk FOREIGN KEY d_prov_pedidos_cab_con_fk (codaplicacion, codconalm)
    REFERENCES d_almacenes_conceptos_tbl (codaplicacion, codconalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_pedidos_cab_dc_fk FOREIGN KEY d_prov_pedidos_cab_dc_fk (uid_diario_caja)
    REFERENCES d_caja_cab_tbl (uid_diario_caja)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_pedidos_cab_emp_fk FOREIGN KEY d_prov_pedidos_cab_emp_fk (codemp)
    REFERENCES d_empresas_tbl (codemp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_pedidos_cab_gi_fk FOREIGN KEY d_prov_pedidos_cab_gi_fk (id_grupo_impuestos)
    REFERENCES config_imp_grupos_tbl (id_grupo_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_pedidos_cab_pro_fk FOREIGN KEY d_prov_pedidos_cab_pro_fk (codpro)
    REFERENCES d_proveedores_tbl (codpro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_pedidos_cab_ser_fk FOREIGN KEY d_prov_pedidos_cab_ser_fk (codserie)
    REFERENCES d_series_tbl (codserie)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_pedidos_cab_ti_fk FOREIGN KEY d_prov_pedidos_cab_ti_fk (id_trat_impuestos)
    REFERENCES config_imp_tratamiento_tbl (id_trat_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_prov_pedidos_det_tbl (
  id_prov_pedido BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  desglose1 VARCHAR(15) BINARY NOT NULL,
  desglose2 VARCHAR(15) BINARY NOT NULL,
  desart VARCHAR(45) BINARY NULL,
  descripcion_ampliada VARCHAR(255) BINARY NULL,
  unidad_medida VARCHAR(4) BINARY NULL,
  cantidad_medida_solicitada DECIMAL(13, 3) NULL,
  cantidad_solicitada DECIMAL(13, 3) NULL,
  cantidad_medida_aceptada DECIMAL(13, 3) NULL,
  cantidad_aceptada DECIMAL(13, 3) NULL,
  cantidad_medida_recepcionada DECIMAL(13, 3) NULL,
  cantidad_recepcionada DECIMAL(13, 3) NULL,
  precio DECIMAL(14, 4) NOT NULL,
  descuento DECIMAL(5, 2) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  lestado INT(3) NOT NULL,
  lsubestado INT(3) NOT NULL,
  id_prov_pedido_origen BIGINT(10) NULL,
  linea_pedido_origen INT(5) NULL,
  PRIMARY KEY (id_prov_pedido, linea),
  CONSTRAINT d_prov_pedidos_det_art_fk FOREIGN KEY d_prov_pedidos_det_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_pedidos_det_ci_fk FOREIGN KEY d_prov_pedidos_det_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_pedidos_det_ped_fk FOREIGN KEY d_prov_pedidos_det_ped_fk (id_prov_pedido)
    REFERENCES d_prov_pedidos_cab_tbl (id_prov_pedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_prov_pedidos_imp_tbl (
  id_prov_pedido BIGINT(10) NOT NULL,
  codimp CHAR(1) BINARY NOT NULL,
  base DECIMAL(13, 3) NOT NULL,
  impuestos DECIMAL(13, 3) NOT NULL,
  total DECIMAL(13, 3) NOT NULL,
  PRIMARY KEY (id_prov_pedido, codimp),
  CONSTRAINT d_prov_pedidos_imp_ci_fk FOREIGN KEY d_prov_pedidos_imp_ci_fk (codimp)
    REFERENCES config_imp_tipos_tbl (codimp)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_pedidos_imp_ped_fk FOREIGN KEY d_prov_pedidos_imp_ped_fk (id_prov_pedido)
    REFERENCES d_prov_pedidos_cab_tbl (id_prov_pedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_prov_pedidos_pag_tbl (
  id_prov_pedido BIGINT(10) NOT NULL,
  linea INT(5) NOT NULL,
  id_medpag_ven BIGINT(10) NOT NULL,
  importe DECIMAL(13, 3) NOT NULL,
  PRIMARY KEY (id_prov_pedido, linea),
  CONSTRAINT d_prov_pedidos_pag_mpv_fk FOREIGN KEY d_prov_pedidos_pag_mpv_fk (id_medpag_ven)
    REFERENCES d_medios_pago_ven_tbl (id_medpag_ven)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_prov_pedidos_pag_ped_fk FOREIGN KEY d_prov_pedidos_pag_ped_fk (id_prov_pedido)
    REFERENCES d_prov_pedidos_cab_tbl (id_prov_pedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_secciones_tbl (
  codseccion VARCHAR(4) BINARY NOT NULL,
  desseccion VARCHAR(20) BINARY NOT NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codseccion)
)
ENGINE = INNODB;

CREATE TABLE d_sectores_tbl (
  codsec VARCHAR(4) BINARY NOT NULL,
  dessec VARCHAR(20) BINARY NOT NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codsec)
)
ENGINE = INNODB;

CREATE TABLE d_series_tbl (
  codserie VARCHAR(5) BINARY NOT NULL,
  desserie VARCHAR(45) BINARY NOT NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codserie)
)
ENGINE = INNODB;

CREATE TABLE d_sincronizador_trabajos_tbl (
  id_trabajo BIGINT(10) NOT NULL,
  trabajo VARCHAR(45) BINARY NOT NULL,
  clase VARCHAR(255) BINARY NOT NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  estado INT(1) NOT NULL,
  fecha_inicio DATETIME NULL,
  intervalo VARCHAR(45) BINARY NULL,
  fecha_proxima_ejec DATETIME NULL,
  fecha_ultima_ejec DATETIME NULL,
  resultado INT(1) NULL,
  observaciones VARCHAR(255) BINARY NULL,
  CONSTRAINT d_sincronizador_trabajo_alm_fk FOREIGN KEY d_sincronizador_trabajo_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_tarifas_act_cab_tbl (
  id_actualizacion BIGINT(10) NOT NULL,
  codtar VARCHAR(11) BINARY NOT NULL,
  des_actualizacion VARCHAR(45) BINARY NOT NULL,
  fecha_prevista_aplicacion DATETIME NULL,
  PRIMARY KEY (id_actualizacion),
  CONSTRAINT d_tarifas_act_cab_fk FOREIGN KEY d_tarifas_act_cab_fk (codtar)
    REFERENCES d_tarifas_cab_tbl (codtar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_tarifas_act_det_tbl (
  id_actualizacion BIGINT(10) NOT NULL,
  codtar VARCHAR(11) BINARY NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  precio_costo DECIMAL(14, 4) NULL,
  factor_marcaje DECIMAL(8, 4) NULL,
  precio_venta DECIMAL(14, 4) NOT NULL,
  precio_total DECIMAL(14, 4) NOT NULL,
  PRIMARY KEY (id_actualizacion, codart),
  CONSTRAINT d_tarifas_act_det_art_fk FOREIGN KEY d_tarifas_act_det_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_tarifas_act_det_tar_fk FOREIGN KEY d_tarifas_act_det_tar_fk (codtar)
    REFERENCES d_tarifas_cab_tbl (codtar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_tarifas_cab_tbl (
  codtar VARCHAR(11) BINARY NOT NULL,
  destar VARCHAR(45) BINARY NOT NULL,
  version BIGINT(10) NOT NULL,
  id_grupo_impuestos INT(5) NOT NULL,
  id_trat_impuestos BIGINT(10) NOT NULL,
  fecha_version DATETIME NULL,
  PRIMARY KEY (codtar),
  CONSTRAINT d_tarifas_cab_gi_fk FOREIGN KEY d_tarifas_cab_gi_fk (id_grupo_impuestos)
    REFERENCES config_imp_grupos_tbl (id_grupo_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_tarifas_cab_ti_fk FOREIGN KEY d_tarifas_cab_ti_fk (id_trat_impuestos)
    REFERENCES config_imp_tratamiento_tbl (id_trat_impuestos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_tarifas_det_hist_tbl (
  codtar VARCHAR(11) BINARY NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  fecha DATETIME NOT NULL,
  precio_costo DECIMAL(14, 4) NULL,
  factor_marcaje DECIMAL(8, 4) NULL,
  precio_venta DECIMAL(14, 4) NULL,
  version BIGINT(10) NOT NULL,
  id_usuario BIGINT(10) NULL,
  borrado CHAR(1) BINARY NOT NULL,
  precio_total DECIMAL(14, 4) NULL,
  PRIMARY KEY (codtar, codart, fecha, version),
  CONSTRAINT d_tarifas_det_hist_art_fk FOREIGN KEY d_tarifas_det_hist_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_tarifas_det_tbl (
  codtar VARCHAR(11) BINARY NOT NULL,
  codart VARCHAR(13) BINARY NOT NULL,
  precio_costo DECIMAL(14, 4) NULL,
  factor_marcaje DECIMAL(8, 4) NULL,
  precio_venta DECIMAL(14, 4) NOT NULL,
  precio_total DECIMAL(14, 4) NOT NULL,
  version BIGINT(10) NULL,
  PRIMARY KEY (codtar, codart),
  CONSTRAINT d_tarifas_det_art_fk FOREIGN KEY d_tarifas_det_art_fk (codart)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_tarifas_det_tar_fk FOREIGN KEY d_tarifas_det_tar_fk (codtar)
    REFERENCES d_tarifas_cab_tbl (codtar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_tickets_err_tbl (
  uid_ticket VARCHAR(40) BINARY NOT NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  id_ticket BIGINT(10) NOT NULL,
  fecha DATETIME NOT NULL,
  ticket LONGBLOB NOT NULL,
  fecha_proceso DATETIME NOT NULL,
  mensaje_error VARCHAR(255) BINARY NOT NULL,
  PRIMARY KEY (uid_ticket),
  INDEX d_tickets_err_ind1 (codalm(4)),
  CONSTRAINT d_tickets_err_alm_fk FOREIGN KEY d_tickets_err_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_tickets_hist_tbl (
  uid_ticket VARCHAR(40) BINARY NOT NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  id_ticket BIGINT(10) NOT NULL,
  fecha DATETIME NOT NULL,
  ticket LONGBLOB NOT NULL,
  fecha_proceso DATETIME NOT NULL,
  PRIMARY KEY (uid_ticket),
  INDEX d_tickets_hist_ind1 (codalm(4), fecha, id_ticket),
  CONSTRAINT d_tickets_hist_alm_fk FOREIGN KEY d_tickets_hist_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_tickets_tbl (
  uid_ticket VARCHAR(40) BINARY NOT NULL,
  codalm VARCHAR(4) BINARY NOT NULL,
  id_ticket BIGINT(10) NOT NULL,
  fecha DATETIME NOT NULL,
  ticket LONGBLOB NOT NULL,
  PRIMARY KEY (uid_ticket),
  CONSTRAINT d_tickets_alm_fk FOREIGN KEY d_tickets_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_tiendas_tarifas_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  codtar VARCHAR(11) BINARY NOT NULL,
  version_tarifa BIGINT(10) NOT NULL,
  fecha_version_tarifa DATETIME NULL,
  version_tarifa_rev BIGINT(10) NOT NULL,
  fecha_version_tarifa_rev DATETIME NULL,
  PRIMARY KEY (codalm, codtar),
  CONSTRAINT d_tiendas_tarifas_tar_fk FOREIGN KEY d_tiendas_tarifas_tar_fk (codtar)
    REFERENCES d_tarifas_cab_tbl (codtar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_tiendas_tarifas_tie_fk FOREIGN KEY d_tiendas_tarifas_tie_fk (codalm)
    REFERENCES d_tiendas_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_tiendas_tbl (
  codalm VARCHAR(4) BINARY NOT NULL,
  id_tipo_tienda BIGINT(10) NOT NULL,
  version_articulos BIGINT(10) NOT NULL,
  version_articulos_rev BIGINT(10) NOT NULL,
  configuracion LONGBLOB NULL,
  activo CHAR(1) BINARY NOT NULL,
  fecha_version_articulos DATETIME NULL,
  fecha_version_articulos_rev DATETIME NULL,
  codmedpag_por_defecto VARCHAR(4) BINARY NOT NULL,
  codconalm_ventas VARCHAR(4) BINARY NOT NULL,
  PRIMARY KEY (codalm),
  CONSTRAINT d_tiendas_alm_fk FOREIGN KEY d_tiendas_alm_fk (codalm)
    REFERENCES d_almacenes_tbl (codalm)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_tiendas_medpag_fk FOREIGN KEY d_tiendas_medpag_fk (codmedpag_por_defecto)
    REFERENCES d_medios_pago_tbl (codmedpag)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT d_tiendas_tt_fk FOREIGN KEY d_tiendas_tt_fk (id_tipo_tienda)
    REFERENCES config_tiendas_tipos_tbl (id_tipo_tienda)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_tipos_efectos_tbl (
  codtipoefec VARCHAR(2) BINARY NOT NULL,
  destipoefec VARCHAR(30) BINARY NOT NULL,
  remesable CHAR(1) BINARY NOT NULL,
  entrada_documento_automatica CHAR(1) BINARY NOT NULL,
  activo CHAR(1) BINARY NOT NULL,
  PRIMARY KEY (codtipoefec)
)
ENGINE = INNODB;

CREATE TABLE d_tipos_portes_tbl (
  id_tipo_porte BIGINT(10) NOT NULL,
  destipoporte VARCHAR(45) BINARY NOT NULL,
  codart_porte VARCHAR(13) BINARY NULL,
  desde_volumen_venta INT(7) NULL,
  url_tracking VARCHAR(255) BINARY NULL,
  PRIMARY KEY (id_tipo_porte),
  CONSTRAINT d_tipos_portes_art_fk FOREIGN KEY d_tipos_portes_art_fk (codart_porte)
    REFERENCES d_articulos_tbl (codart)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;

CREATE TABLE d_unidad_medida_etiquetas_tbl (
  cod_um_etiqueta VARCHAR(4) BINARY NOT NULL,
  des_um_etiqueta VARCHAR(20) BINARY NOT NULL,
  desetiqueta VARCHAR(10) BINARY NOT NULL,
  factor BIGINT(10) NOT NULL,
  PRIMARY KEY (cod_um_etiqueta)
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

