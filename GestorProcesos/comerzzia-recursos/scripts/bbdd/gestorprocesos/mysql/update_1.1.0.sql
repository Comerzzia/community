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

/* scripts de actualización para tablas */

/* tabla D_PAGOS_REMESAS_CAB_TBL*/
ALTER TABLE d_pagos_remesas_cab_tbl
	ADD estado INT(3) NOT NULL;

	/* tabla D_PROV_PEDIDOS_DET_TBL*/
ALTER TABLE d_prov_pedidos_det_tbl
	CHANGE cantidad_medida_preparada cantidad_medida_recepcionada DECIMAL(13, 3) NULL,
	CHANGE cantidad_preparada cantidad_recepcionada DECIMAL(13, 3) NULL,
	ADD id_prov_pedido_origen BIGINT(10) NULL,
	ADD linea_pedido_origen INT(5) NULL;

/* tabla D_TARIFAS_ACT_CAB_TBL*/
ALTER TABLE d_tarifas_act_cab_tbl
	CHANGE destar_act des_actualizacion VARCHAR(45) BINARY NOT NULL,
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (id_actualizacion),
	DROP FOREIGN KEY d_tarifas_act_cab_tar_fk,
	ADD CONSTRAINT d_tarifas_act_cab_fk FOREIGN KEY d_tarifas_act_cab_fk (codtar)
		REFERENCES d_tarifas_cab_tbl (codtar)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		
/* tabla D_TARIFAS_ACT_DET_TBL*/
DROP TABLE d_tarifas_act_det_tbl;
CREATE TABLE d_tarifas_act_det_tbl (
  codtar VARCHAR(11) BINARY NOT NULL,
  id_actualizacion BIGINT(10) NOT NULL,
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
	
/* scripts de actualización para vistas */
CREATE OR REPLACE VIEW D_ALMACENES_CONCEPTOS (
   CODAPLICACION,
   CODCONALM,
   DESCONALM,
   SIGNO,
   CODALM_ORIGEN,
   DESALM_ORIGEN,
   CODALM_DESTINO,
   DESALM_DESTINO,
   SOLICITUD_ACEPTACION_AUTO,
   SOLICITUD_RECEPCION_AUTO,
   SOLICITUD_GENERAR_FALTAS,
   VISIBLE_TIENDAS,
   ACTIVO )
AS




SELECT CONCEPTO_ALM.CODAPLICACION,
       CONCEPTO_ALM.CODCONALM,
       CONCEPTO_ALM.DESCONALM,
       CONCEPTO_ALM.SIGNO,
	      CONCEPTO_ALM.CODALM_ORIGEN,
	      ALMACENES_ORIGEN.DESALM AS DESALM_ORIGEN,
       CONCEPTO_ALM.CODALM_DESTINO,
	      ALMACENES_DESTINO.DESALM AS DESALM_DESTINO,
       CONCEPTO_ALM.SOLICITUD_ACEPTACION_AUTO,
							CONCEPTO_ALM.SOLICITUD_RECEPCION_AUTO,
       CONCEPTO_ALM.SOLICITUD_GENERAR_FALTAS,
			    CONCEPTO_ALM.VISIBLE_TIENDAS,
       CONCEPTO_ALM.ACTIVO
	 FROM D_ALMACENES_CONCEPTOS_TBL CONCEPTO_ALM
	      LEFT JOIN D_ALMACENES_TBL ALMACENES_ORIGEN ON CONCEPTO_ALM.CODALM_ORIGEN = ALMACENES_ORIGEN.CODALM
	      LEFT JOIN D_ALMACENES_TBL ALMACENES_DESTINO ON CONCEPTO_ALM.CODALM_DESTINO = ALMACENES_DESTINO.CODALM
;

CREATE OR REPLACE VIEW D_CLIE_ALBARANES_CAB (
   ID_CLIE_ALBARAN,
   CODEMP,
   PERIODO,
   CODSERIE,
   DESSERIE,
   NUMALB,
   FECHA,
   FECHA_SUMINISTRO,
   CODALM,
   DESALM,
   CODCAJA,
   UID_DIARIO_CAJA,
   CODAPLICACION,
   CODCONALM,
   DESCONALM,
   CODCLI,
   DESCLI,
   REFERENCIA_CLIENTE,
   CODTAR,
   DESTAR,
   PERSONA_CONTACTO,
   ID_GRUPO_IMPUESTOS,
   ID_TRAT_IMPUESTOS,
   DESTRATIMP,
   BASE,
   IMPUESTOS,
   TOTAL,
   OBSERVACIONES,
   ID_USUARIO,
   ID_FACTURA_SOP,
   ID_FACTURA_REP,
   TARJETA_FIDELIZACION,
   UID_TICKET,
   CODSERIE_FACTURA,
   NUMFAC,
   FECHA_FACTURA,
   TRACKING_PORTE )
AS
SELECT ALBARANES_CAB.ID_CLIE_ALBARAN,
       ALBARANES_CAB.CODEMP,
       ALBARANES_CAB.PERIODO,
       ALBARANES_CAB.CODSERIE,
       SERIES.DESSERIE,
       ALBARANES_CAB.NUMALB,
       ALBARANES_CAB.FECHA,
       ALBARANES_CAB.FECHA_SUMINISTRO,
							ALBARANES_CAB.CODALM,
       ALMACENES.DESALM,
							ALBARANES_CAB.CODCAJA,
       ALBARANES_CAB.UID_DIARIO_CAJA,
       ALBARANES_CAB.CODAPLICACION,
       ALBARANES_CAB.CODCONALM,
       CONCEPTOS.DESCONALM,
       ALBARANES_CAB.CODCLI,
       CLIENTES.DESCLI,
       ALBARANES_CAB.REFERENCIA_CLIENTE,
       ALBARANES_CAB.CODTAR,
       TARIFAS.DESTAR,
							ALBARANES_CAB.PERSONA_CONTACTO,
       ALBARANES_CAB.ID_GRUPO_IMPUESTOS,
       ALBARANES_CAB.ID_TRAT_IMPUESTOS,
       TRAT_IMP.DESTRATIMP,
       ALBARANES_CAB.BASE,
       ALBARANES_CAB.IMPUESTOS,
       ALBARANES_CAB.TOTAL,
       ALBARANES_CAB.OBSERVACIONES,
       ALBARANES_CAB.ID_USUARIO,
	      ALBARANES_CAB.ID_FACTURA_SOP,
       ALBARANES_CAB.ID_FACTURA_REP,
							ALBARANES_CAB.TARJETA_FIDELIZACION,
							ALBARANES_CAB.UID_TICKET,
							FACTURAS.CODSERIE CODSERIE_FACTURA,
							FACTURAS.NUMFAC,
							FACTURAS.FECHA FECHA_FACTURA,
							ALBARANES_CAB.TRACKING_PORTE
  FROM D_CLIE_ALBARANES_CAB_TBL ALBARANES_CAB
     INNER JOIN D_SERIES_TBL SERIES ON (SERIES.CODSERIE = ALBARANES_CAB.CODSERIE)
     INNER JOIN D_ALMACENES_TBL ALMACENES ON (ALMACENES.CODALM = ALBARANES_CAB.CODALM)
     INNER JOIN D_ALMACENES_CONCEPTOS_TBL CONCEPTOS ON (CONCEPTOS.CODAPLICACION = ALBARANES_CAB.CODAPLICACION
   																																																	AND CONCEPTOS.CODCONALM = ALBARANES_CAB.CODCONALM)
     INNER JOIN D_CLIENTES_TBL CLIENTES ON (CLIENTES.CODCLI = ALBARANES_CAB.CODCLI)
     LEFT JOIN D_TARIFAS_CAB_TBL TARIFAS ON (TARIFAS.CODTAR = ALBARANES_CAB.CODTAR)
     LEFT JOIN D_FACTURAS_REP_CAB_TBL FACTURAS ON (FACTURAS.ID_FACTURA_REP = ALBARANES_CAB.ID_FACTURA_REP)
					LEFT JOIN CONFIG_IMP_TRATAMIENTO_TBL TRAT_IMP ON (TRAT_IMP.ID_TRAT_IMPUESTOS = ALBARANES_CAB.ID_TRAT_IMPUESTOS)
;

CREATE OR REPLACE VIEW D_CLIE_PEDIDOS_CAB (
   ID_CLIE_PEDIDO,
   CODEMP,
   PERIODO,
   CODSERIE,
   DESSERIE,
   NUMPED,
   FECHA,
   FECHA_SUMINISTRO_PREV,
   CODALM,
   DESALM,
   CODCAJA,
   UID_DIARIO_CAJA,
   CODAPLICACION,
   CODCONALM,
   DESCONALM,
   CODCLI,
   DESCLI,
   CODTAR,
   DESTAR,
   ID_TIPO_PORTE,
   PERSONA_CONTACTO,
   REFERENCIA_CLIENTE,
   ID_GRUPO_IMPUESTOS,
   ID_TRAT_IMPUESTOS,
   DESTRATIMP,
   BASE,
   IMPUESTOS,
   TOTAL,
   OBSERVACIONES,
   ID_USUARIO,
   TARJETA_FIDELIZACION,
   ESTADO,
   SUBESTADO,
   DESESTADO,
   ESTADO_RECEPTOR,
   SUBESTADO_RECEPTOR,
   DESESTADO_RECEPTOR,
   ID_CLIE_PRESUPUESTO,
   URL_TRACKING )
AS
SELECT PEDIDOS_CAB.ID_CLIE_PEDIDO,
       PEDIDOS_CAB.CODEMP,
       PEDIDOS_CAB.PERIODO,
       PEDIDOS_CAB.CODSERIE,
       SERIES.DESSERIE,
       PEDIDOS_CAB.NUMPED,
       PEDIDOS_CAB.FECHA,
       PEDIDOS_CAB.FECHA_SUMINISTRO_PREV,
       PEDIDOS_CAB.CODALM,
       ALMACENES.DESALM,
       PEDIDOS_CAB.CODCAJA,
       PEDIDOS_CAB.UID_DIARIO_CAJA,
       PEDIDOS_CAB.CODAPLICACION,
       PEDIDOS_CAB.CODCONALM,
       ALMACENES_CONCEPTOS.DESCONALM,
       PEDIDOS_CAB.CODCLI,
       CLIENTES.DESCLI,
       PEDIDOS_CAB.CODTAR,
       TARIFAS.DESTAR,
       PEDIDOS_CAB.ID_TIPO_PORTE,
       PEDIDOS_CAB.PERSONA_CONTACTO,
       PEDIDOS_CAB.REFERENCIA_CLIENTE,
       PEDIDOS_CAB.ID_GRUPO_IMPUESTOS,
       PEDIDOS_CAB.ID_TRAT_IMPUESTOS,
       TRAT_IMP.DESTRATIMP,
       PEDIDOS_CAB.BASE,
       PEDIDOS_CAB.IMPUESTOS,
       PEDIDOS_CAB.TOTAL,
       PEDIDOS_CAB.OBSERVACIONES,
       PEDIDOS_CAB.ID_USUARIO,
       PEDIDOS_CAB.TARJETA_FIDELIZACION,
       PEDIDOS_CAB.ESTADO,
       PEDIDOS_CAB.SUBESTADO,
       ESTADOS_EMISOR.DESESTADO,
       PEDIDOS_CAB.ESTADO_RECEPTOR,
       PEDIDOS_CAB.SUBESTADO_RECEPTOR,
       ESTADOS_RECEPTOR.DESESTADO AS DESESTADO_RECEPTOR,
       PEDIDOS_CAB.ID_CLIE_PRESUPUESTO,
       TIPOS_PORTES.URL_TRACKING
  FROM D_CLIE_PEDIDOS_CAB_TBL PEDIDOS_CAB
       INNER JOIN D_SERIES_TBL SERIES ON PEDIDOS_CAB.CODSERIE = SERIES.CODSERIE
       INNER JOIN D_ALMACENES_TBL ALMACENES ON PEDIDOS_CAB.CODALM = ALMACENES.CODALM
       INNER JOIN D_ALMACENES_CONCEPTOS_TBL ALMACENES_CONCEPTOS ON (ALMACENES_CONCEPTOS.CODAPLICACION = PEDIDOS_CAB.CODAPLICACION
                                                                AND PEDIDOS_CAB.CODCONALM = ALMACENES_CONCEPTOS.CODCONALM)
       INNER JOIN D_CLIENTES_TBL CLIENTES ON PEDIDOS_CAB.CODCLI = CLIENTES.CODCLI
       LEFT JOIN D_TARIFAS_CAB_TBL TARIFAS ON PEDIDOS_CAB.CODTAR = TARIFAS.CODTAR
       INNER JOIN CONFIG_ESTADOS_TBL ESTADOS_EMISOR ON (ESTADOS_EMISOR.PROCESO = 'PEDCLI'
                                                    AND ESTADOS_EMISOR.ESTADO = PEDIDOS_CAB.ESTADO)
       INNER JOIN CONFIG_ESTADOS_TBL ESTADOS_RECEPTOR ON (ESTADOS_RECEPTOR.PROCESO = 'PEDCLI_RECEPTOR'
                                                      AND ESTADOS_RECEPTOR.ESTADO = PEDIDOS_CAB.ESTADO_RECEPTOR)
							LEFT JOIN CONFIG_IMP_TRATAMIENTO_TBL TRAT_IMP ON (PEDIDOS_CAB.ID_TRAT_IMPUESTOS = TRAT_IMP.ID_TRAT_IMPUESTOS)
       LEFT JOIN D_TIPOS_PORTES_TBL TIPOS_PORTES ON PEDIDOS_CAB.ID_TIPO_PORTE = TIPOS_PORTES.ID_TIPO_PORTE
;

CREATE OR REPLACE VIEW D_PAGOS_REMESAS_CAB (
   ID_REMESA,
   FECHA_REMESA,
   CODBAN,
   DESBAN,
   CODTIPOEFEC,
   DESTIPOEFEC,
   ESTADO,
   DESESTADO,
   EFECTOS,
   PROVEEDORES,
   IMPORTE )
AS
SELECT CAB.ID_REMESA,
       CAB.FECHA_REMESA,
       CAB.CODBAN,
       BAN.DESBAN,
       CAB.CODTIPOEFEC,
       TIPO_EFEC.DESTIPOEFEC,
							CAB.ESTADO,
       EST.DESESTADO,
       (SELECT COUNT(*) FROM D_PAGOS_DOC_TBL WHERE ID_REMESA = CAB.ID_REMESA) EFECTOS,
       (SELECT COUNT( DISTINCT CODPRO) FROM D_PAGOS_DOC_TBL WHERE ID_REMESA = CAB.ID_REMESA) PROVEEDORES,
       (SELECT SUM(IMPORTE) FROM D_PAGOS_DOC_TBL WHERE ID_REMESA = CAB.ID_REMESA) IMPORTE
FROM D_PAGOS_REMESAS_CAB_TBL CAB
     INNER JOIN D_BANCOS_TBL BAN ON (BAN.CODBAN = CAB.CODBAN)
					INNER JOIN D_TIPOS_EFECTOS_TBL TIPO_EFEC ON (TIPO_EFEC.CODTIPOEFEC = CAB.CODTIPOEFEC)
					INNER JOIN CONFIG_ESTADOS_TBL EST ON (EST.ESTADO = CAB.ESTADO
																																											AND EST.PROCESO = 'REMESA_PAGO')
;

CREATE OR REPLACE VIEW D_PROV_PEDIDOS_CAB (
   ID_PROV_PEDIDO,
   CODEMP,
   PERIODO,
   CODSERIE,
   DESSERIE,
   NUMPED,
   FECHA,
   FECHA_SUMINISTRO_PREV,
   CODALM,
   DESALM,
   CODCAJA,
   UID_DIARIO_CAJA,
   CODAPLICACION,
   CODCONALM,
   DESCONALM,
   CODPRO,
   DESPRO,
   PERSONA_CONTACTO,
   REFERENCIA_PROVEEDOR,
   ID_GRUPO_IMPUESTOS,
   ID_TRAT_IMPUESTOS,
   DESTRATIMP,
   BASE,
   IMPUESTOS,
   TOTAL,
   OBSERVACIONES,
   ID_USUARIO,
   ESTADO,
   SUBESTADO,
   DESESTADO )
AS
SELECT PEDIDOS_CAB.ID_PROV_PEDIDO,
       PEDIDOS_CAB.CODEMP,
       PEDIDOS_CAB.PERIODO,
       PEDIDOS_CAB.CODSERIE,
       SERIES.DESSERIE,
       PEDIDOS_CAB.NUMPED,
       PEDIDOS_CAB.FECHA,
       PEDIDOS_CAB.FECHA_SUMINISTRO_PREV,
       PEDIDOS_CAB.CODALM,
       ALMACENES.DESALM,
       PEDIDOS_CAB.CODCAJA,
       PEDIDOS_CAB.UID_DIARIO_CAJA,
       PEDIDOS_CAB.CODAPLICACION,
       PEDIDOS_CAB.CODCONALM,
       ALMACENES_CONCEPTOS.DESCONALM,
       PEDIDOS_CAB.CODPRO,
       PROVEEDORES.DESPRO,
       PEDIDOS_CAB.PERSONA_CONTACTO,
       PEDIDOS_CAB.REFERENCIA_PROVEEDOR,
       PEDIDOS_CAB.ID_GRUPO_IMPUESTOS,
       PEDIDOS_CAB.ID_TRAT_IMPUESTOS,
       TRAT_IMP.DESTRATIMP,
       PEDIDOS_CAB.BASE,
       PEDIDOS_CAB.IMPUESTOS,
       PEDIDOS_CAB.TOTAL,
       PEDIDOS_CAB.OBSERVACIONES,
       PEDIDOS_CAB.ID_USUARIO,
       PEDIDOS_CAB.ESTADO,
       PEDIDOS_CAB.SUBESTADO,
       ESTADOS_EMISOR.DESESTADO
  FROM D_PROV_PEDIDOS_CAB_TBL PEDIDOS_CAB
       INNER JOIN D_SERIES_TBL SERIES ON PEDIDOS_CAB.CODSERIE = SERIES.CODSERIE
       INNER JOIN D_ALMACENES_TBL ALMACENES ON PEDIDOS_CAB.CODALM = ALMACENES.CODALM
       INNER JOIN D_ALMACENES_CONCEPTOS_TBL ALMACENES_CONCEPTOS ON (ALMACENES_CONCEPTOS.CODAPLICACION = PEDIDOS_CAB.CODAPLICACION
                                                                AND PEDIDOS_CAB.CODCONALM = ALMACENES_CONCEPTOS.CODCONALM)
       INNER JOIN D_PROVEEDORES_TBL PROVEEDORES ON PEDIDOS_CAB.CODPRO = PROVEEDORES.CODPRO
       INNER JOIN CONFIG_ESTADOS_TBL ESTADOS_EMISOR ON (ESTADOS_EMISOR.PROCESO = 'PEDPRO'
                                                    AND ESTADOS_EMISOR.ESTADO = PEDIDOS_CAB.ESTADO)
							LEFT JOIN CONFIG_IMP_TRATAMIENTO_TBL TRAT_IMP ON (PEDIDOS_CAB.ID_TRAT_IMPUESTOS = TRAT_IMP.ID_TRAT_IMPUESTOS)
;
CREATE OR REPLACE VIEW D_PROV_PEDIDOS_DET (
   ID_PROV_PEDIDO,
   LINEA,
   CODART,
   DESART,
   UNIDAD_MEDIDA_ALTERNATIVA,
   DESGLOSE1,
   DESGLOSE2,
   DESCRIPCION_AMPLIADA,
   UNIDAD_MEDIDA,
   CANTIDAD_MEDIDA_SOLICITADA,
   CANTIDAD_SOLICITADA,
   CANTIDAD_MEDIDA_ACEPTADA,
   CANTIDAD_ACEPTADA,
   CANTIDAD_MEDIDA_RECEPCIONADA,
   CANTIDAD_RECEPCIONADA,
   PRECIO,
   DESCUENTO,
   IMPORTE,
   CODIMP,
   LESTADO,
   LSUBESTADO,
   LDESESTADO )
AS
SELECT PEDIDOS_DET.ID_PROV_PEDIDO,
       PEDIDOS_DET.LINEA,
       PEDIDOS_DET.CODART,
       PEDIDOS_DET.DESART,
       ARTICULOS.UNIDAD_MEDIDA_ALTERNATIVA,
       PEDIDOS_DET.DESGLOSE1,
       PEDIDOS_DET.DESGLOSE2,
       PEDIDOS_DET.DESCRIPCION_AMPLIADA,
       PEDIDOS_DET.UNIDAD_MEDIDA,
       PEDIDOS_DET.CANTIDAD_MEDIDA_SOLICITADA,
       PEDIDOS_DET.CANTIDAD_SOLICITADA,
       PEDIDOS_DET.CANTIDAD_MEDIDA_ACEPTADA,
       PEDIDOS_DET.CANTIDAD_ACEPTADA,
       PEDIDOS_DET.CANTIDAD_MEDIDA_RECEPCIONADA,
       PEDIDOS_DET.CANTIDAD_RECEPCIONADA,
       PEDIDOS_DET.PRECIO,
       PEDIDOS_DET.DESCUENTO,
       PEDIDOS_DET.IMPORTE,
       PEDIDOS_DET.CODIMP,
       PEDIDOS_DET.LESTADO,
       PEDIDOS_DET.LSUBESTADO,
       ESTADOS.DESESTADO AS LDESESTADO
  FROM D_PROV_PEDIDOS_DET_TBL PEDIDOS_DET
       INNER JOIN D_ARTICULOS_TBL ARTICULOS ON (ARTICULOS.CODART = PEDIDOS_DET.CODART)
       LEFT JOIN CONFIG_ESTADOS_TBL ESTADOS ON (ESTADOS.PROCESO = 'PEDPRO_LINEA'
                                             AND ESTADOS.ESTADO = PEDIDOS_DET.LESTADO
                                             AND ESTADOS.SUBESTADO = PEDIDOS_DET.LSUBESTADO)
;
CREATE OR REPLACE VIEW D_PROV_PEDIDOS_PAG (
   ID_PROV_PEDIDO,
   LINEA,
   ID_MEDPAG_VEN,
   DESMEDPAG_VEN,
   IMPORTE )
AS
SELECT PAGOS.ID_PROV_PEDIDO,
       PAGOS.LINEA,
       PAGOS.ID_MEDPAG_VEN,
       VENCIMIENTOS.DESMEDPAG_VEN,
       PAGOS.IMPORTE
  FROM D_PROV_PEDIDOS_PAG_TBL PAGOS
       INNER JOIN D_MEDIOS_PAGO_VEN_TBL VENCIMIENTOS ON VENCIMIENTOS.ID_MEDPAG_VEN = PAGOS.ID_MEDPAG_VEN
;

CREATE OR REPLACE VIEW D_TARIFAS_ACT_CAB (
   CODTAR,
   DESTAR,
   VERSION,
   ID_GRUPO_IMPUESTOS,
   ID_TRAT_IMPUESTOS,
   ID_ACTUALIZACION,
   DES_ACTUALIZACION,
   FECHA_PREVISTA_APLICACION )
AS
SELECT ACTUALIZACIONES.CODTAR, TARIFAS.DESTAR, TARIFAS.VERSION, TARIFAS.ID_GRUPO_IMPUESTOS,
    TARIFAS.ID_TRAT_IMPUESTOS, ACTUALIZACIONES.ID_ACTUALIZACION,
    ACTUALIZACIONES.DES_ACTUALIZACION, ACTUALIZACIONES.FECHA_PREVISTA_APLICACION
    FROM D_TARIFAS_ACT_CAB_TBL ACTUALIZACIONES
    INNER JOIN D_TARIFAS_CAB_TBL TARIFAS ON (TARIFAS.CODTAR = ACTUALIZACIONES.CODTAR)
;
CREATE OR REPLACE VIEW D_TARIFAS_ACT_DET (
   CODTAR,
   ID_ACTUALIZACION,
   CODART,
   DESART,
   CODIMP,
   PRECIO_COSTO,
   FACTOR_MARCAJE,
   PRECIO_VENTA,
   PRECIO_TOTAL )
AS
SELECT TARIFAS.CODTAR, TARIFAS.ID_ACTUALIZACION, TARIFAS.CODART, ARTICULOS.DESART,
    ARTICULOS.CODIMP, TARIFAS.PRECIO_COSTO, TARIFAS.FACTOR_MARCAJE, TARIFAS.PRECIO_VENTA, TARIFAS.PRECIO_TOTAL
    FROM D_TARIFAS_ACT_DET_TBL TARIFAS
        INNER JOIN D_ARTICULOS_TBL ARTICULOS ON (ARTICULOS.CODART = TARIFAS.CODART)
;
CREATE OR REPLACE VIEW D_TICKETS (
   UID_TICKET,
   CODALM,
   DESALM,
   ID_TICKET,
   FECHA,
   TICKET,
   CODEMP )
AS
SELECT UID_TICKET, TICKET.CODALM, ALMACEN.DESALM, TICKET.ID_TICKET, TICKET.FECHA, TICKET.TICKET, ALMACEN.CODEMP
	 FROM D_TICKETS_TBL TICKET,
	      D_ALMACENES_TBL ALMACEN
	 WHERE (TICKET.CODALM = ALMACEN.CODALM)
;

/* scripts de actualización para datos */

/* datos para tabla: config_acciones_informes_tbl*/
INSERT INTO config_acciones_informes_tbl(id_accion, id_version, version, descripcion, formato_salida, activo, titulo)
VALUES (542, 0, 'Original', 'Agrupado por pedidos, muestra toda la información del pedido y el estado del suministro', 'WEB', 'S', 'Pedidos Detallado'),
  (542, 1, 'pdte_suministro', 'Agrupado por pedidos, muestra un listado simplificado de los pedidos pendientes de suministro', 'WEB', 'S', 'Pendiente de Suministro'),
  (542, 2, 'pdte_suministro_detallado', 'Agrupado por pedidos, muestra toda la información del pedido pendiente de suministro', 'WEB', 'S', 'Pendiente de Suministro Detallado'),
  (543, 0, 'Original', 'Documento', 'WEB', 'S', 'Pedido de Compra'),
  (541, 0, 'Original', 'Efectos asignados a una remesa de pago', 'WEB', 'S', 'Remesa de Pagos');
  
UPDATE config_acciones_informes_tbl
	SET descripcion = 'Agrupado por clientes, muestra el total de operaciones, volumen de ventas y margen de la operación'
	WHERE id_accion = 526  AND id_version = 0;

UPDATE config_acciones_informes_tbl
	SET descripcion = 'Agrupado por familias, muestra el total de operaciones, volumen de ventas y margen de la operación'
	WHERE id_accion = 526  AND id_version = 1;
UPDATE config_acciones_informes_tbl
	SET descripcion = 'Agrupado por artículos, muestra el total de operaciones, volumen de ventas y margen de la operación',
		titulo = 'Ventas por Artículos'
	WHERE id_accion = 526  AND id_version = 2;

/* datos para tabla: CONFIG_ACCIONES_OPERACIONE_TBL*/
INSERT INTO config_acciones_operacione_tbl(id_accion, id_operacion, orden, desoperacion)
VALUES (56, 3, 3, 'ELIMINAR'),
  (56, 0, 0, 'EJECUTAR'),
  (56, 1, 1, 'AÑADIR'),
  (56, 2, 2, 'EDITAR'),
  (57, 1, 1, 'AÑADIR'),
  (57, 2, 2, 'EDITAR'),
  (57, 3, 3, 'ELIMINAR'),
  (542, 0, 0, 'EJECUTAR'),
  (543, 0, 0, 'EJECUTAR'),
  (54, 1, 1, 'AÑADIR'),
  (54, 0, 0, 'EJECUTAR'),
  (54, 2, 2, 'EDITAR'),
  (54, 3, 3, 'ELIMINAR'),
  (541, 0, 0, 'EJECUTAR'),
  (54, 4, 4, 'IMPRIMIR'),
  (55, 0, 0, 'EJECUTAR'),
  (55, 1, 1, 'AÑADIR'),
  (55, 2, 2, 'EDITAR'),
  (55, 3, 3, 'ELIMINAR');
  
 
/* datos para tabla: CONFIG_ACCIONES_PERMISOS_TBL*/
INSERT INTO config_acciones_permisos_tbl(id_accion, id_operacion, id_usuario, id_perfil, acceso)
VALUES (56, 0, -1, 0, 2),
  (56, 0, -1, 1, 1),
  (56, 1, -1, 0, 2),
  (56, 1, -1, 1, 1),
  (56, 3, -1, 1, 1),
  (56, 2, -1, 0, 2),
  (56, 2, -1, 1, 1),
  (56, 3, -1, 0, 2),
  (57, 0, -1, 1, 1),
  (57, 0, -1, 0, 2),
  (57, 1, -1, 1, 1),
  (57, 1, -1, 0, 2),
  (57, 2, -1, 1, 1),
  (57, 2, -1, 0, 2),
  (57, 3, -1, 1, 1),
  (57, 3, -1, 0, 2),
  (542, 0, -1, 0, 2),
  (542, 0, -1, 1, 1),
  (543, 0, -1, 0, 2),
  (543, 0, -1, 1, 1),
  (54, 0, -1, 0, 2),
  (54, 0, -1, 1, 1),
  (54, 1, -1, 1, 1),
  (54, 1, -1, 0, 2),
  (54, 2, -1, 0, 2),
  (54, 2, -1, 1, 1),
  (54, 3, -1, 0, 2),
  (54, 3, -1, 1, 1),
  (541, 0, -1, 0, 2),
  (541, 0, -1, 1, 1),
  (54, 4, -1, 0, 2),
  (54, 4, -1, 1, 1),
  (44, 0, -1, 1, 1),
  (44, 1, -1, 1, 1),
  (55, 0, -1, 0, 2),
  (55, 0, -1, 1, 1),
  (55, 1, -1, 0, 2),
  (55, 2, -1, 0, 2),
  (55, 2, -1, 1, 1),
  (55, 3, -1, 0, 2);
 
/* datos para tabla: CONFIG_ACCIONES_TBL*/
INSERT INTO config_acciones_tbl(id_accion, accion, tipo_accion, ejecucion, parametros, descripcion, titulo, icono, activo)
VALUES (55, 'com.comerzzia.web.compras.pedidos.PedidosComprasServlet', 'URL', 'pedidosCompras', NULL, 'Introducción de Pedidos de Compras', 'Introducción de Pedidos de Compras', 'comun/images/menu/pedidosCompras.gif', 'S'),
  (56, 'com.comerzzia.web.ventas.tarifas.actualizaciones.ActualizacionesTarifasServlet', 'URL', 'actualizacionesTarifas', NULL, 'Actualizaciones de Tarifas', 'Actualizaciones de Tarifas', 'comun/images/menu/actualizacionTarifa.gif', 'S'),
  (57, 'com.comerzzia.web.estadisticas.EstadisticasServlet', 'URL', 'estadisticas', NULL, 'Estadísticas', 'Estadísticas', 'comun/images/menu/estadisticas.gif', 'S'),
  (542, 'compras.pedidos.lstPedidosCompras', 'INFORME', 'pedidosCompras', NULL, 'Listado de Pedidos de Compras', 'Listado de Pedidos de Compras', 'comun/images/menu/pagina.png', 'S'),
  (543, 'compras.pedidos.InfPedidoCompras', 'INFORME', 'pedidosCompras', NULL, 'Informe de Pedido de Compras', 'Informe de Pedido de Compras', 'comun/images/menu/pagina.png', 'S'),
  (54, 'com.comerzzia.web.tesoreria.remesas.pagos.RemesasPagosServlet', 'URL', 'remesasPagos', NULL, 'Remesas de Pagos', 'Remesas de Pagos', 'comun/images/menu/remesasPagos.gif', 'S'),
  (541, 'tesoreria.pagos.infremesapagos', 'INFORME', 'remesasPagos', NULL, 'Informe de la remesa de pago', 'Informe de la remesa de pago', 'comun/imiages/menu/pagina.png', 'S');
  
UPDATE config_acciones_tbl
	SET descripcion = 'Regularizaciones',
		titulo = 'Regularizaciones'
	WHERE id_accion = 27;
/* datos para tabla: CONFIG_CONTADORES_DEF_TBL*/
INSERT INTO config_contadores_def_tbl(id_contador, usa_codemp, usa_codserie, usa_periodo, descripcion)
VALUES ('ID_ACTUALIZACION', 'N', 'N', 'N', 'ID de Actualizacion de Tarifa');

/* datos para tabla: CONFIG_ESTADOS_TBL*/
INSERT INTO config_estados_tbl(proceso, estado, subestado, desestado, abreviatura, icono, ambito_aplicacion)
VALUES ('REMESA_PAGO', 0, 0, 'PREREMESA', 'PREREMESA', 'tesoreria/remesas/pagos/buscar/images/estados/preremesa.gif', 'Remesa en proceso de selección de efectos'),
  ('REMESA_PAGO', 100, 0, 'REMESA', 'REMESA', 'tesoreria/remesas/pagos/buscar/images/estados/remesa.gif', 'Remesa finalizada'),
  ('PEDPRO', 0, 0, 'SOLICITUD DE PEDIDO', 'SOL. PEDIDO', 'compras/pedidos/buscar/images/estados/emisor/solicitud.gif', 'Solicitud de pedido'),
  ('PEDPRO', 10, 0, 'SOL. PDTE. ACEPTACIÓN', 'PDTE. ACEPT.', 'compras/pedidos/buscar/images/estados/emisor/solicitudPendienteAceptacion.gif', 'Pedido de mercancía solicitado. Queda pendiente de la aceptación/confirmación para el almacén que lo solicita'),
  ('PEDPRO', 20, 0, 'PDTE. RECEPCIÓN', 'PDTE. RECEP.', 'compras/pedidos/buscar/images/estados/emisor/aceptadoPendienteRecepcion.gif', 'En proceso de recepción'),
  ('PEDPRO', 90, 0, 'RECHAZADO', 'RECHAZADO', 'compras/pedidos/buscar/images/estados/emisor/rechazado.gif', 'Se ha rechazado por completo los artículos y cantidades solicitadas'),
  ('PEDPRO', 100, 0, 'RECEPCIONADO', 'RECEPCIONADO', 'compras/pedidos/buscar/images/estados/emisor/recepcionado.gif', 'Mercancía servida'),
  ('PEDPRO_LINEA', 0, 0, 'SOLICITADA', 'SOLICITADA', 'compras/pedidos/buscar/images/estados/linea/solicitada.gif', 'Solicitud de mercancía'),
  ('PEDPRO_LINEA', 10, 0, 'SOL. PDTE. ACEPTACIÓN', 'PDTE. ACEPT.', 'compras/pedidos/buscar/images/estados/linea/pendienteAceptacion.gif', 'Mercancía solicitada'),
  ('PEDPRO_LINEA', 20, 0, 'PDTE. RECEPCIÓN', 'PDTE. RECEPCIÓN', 'compras/pedidos/buscar/images/estados/linea/aceptadaPendienteRecepcion.gif', 'Mercancía aceptada, pendiente de recepción'),
  ('PEDPRO_LINEA', 20, 10, 'PDTE. RECEPCIÓN, ACEPT. PARCIAL', 'PDTE. REC. ACEPT. PARC.', 'compras/pedidos/buscar/images/estados/linea/aceptadaPendienteRecepcionParcial.gif', 'Mercancía aceptada parcialmente, pendiente de recepción'),
  ('PEDPRO_LINEA', 90, 0, 'RECHAZADA', 'RECHAZADA', 'compras/pedidos/buscar/images/estados/linea/rechazada.gif', 'Rechazada'),
  ('PEDPRO_LINEA', 100, 0, 'RECEPCIONADA', 'RECEPCIONADA', 'compras/pedidos/buscar/images/estados/linea/recepcionada.gif', 'Mercancía recepcionada'),
  ('PEDPRO_LINEA', 100, 10, 'RECEPCIONADA PARCIAL', 'RECEP. PARC.', 'compras/pedidos/buscar/images/estados/linea/recepcionadaParcial.gif', 'Mercancía recepcionada parcialmente'),
  ('PEDPRO_LINEA', 100, 80, 'NO RECEPCIONADA', 'NO RECEPCIONADA', 'compras/pedidos/buscar/images/estados/linea/recepcionadaNo.gif', 'Mercancía no recepcionada');
  
/* datos para tabla: CONFIG_MENU_TBL*/
UPDATE config_menu_tbl
	SET opcion = 'Compras\\Introducción de Pedidos de Compras',
		id_accion = 55,
		tecla_rapida = NULL
	WHERE aplicacion = 'GESTION'
	AND orden = 11;
	
UPDATE config_menu_tbl
	SET orden = 28
	WHERE aplicacion = 'GESTION'
	AND orden = 27;
	
UPDATE config_menu_tbl
	SET orden = 27
	WHERE aplicacion = 'GESTION'
	AND orden = 26;
	
UPDATE config_menu_tbl
	SET orden = 26
	WHERE aplicacion = 'GESTION'
	AND orden = 25;
	
UPDATE config_menu_tbl
	SET orden = 25
	WHERE aplicacion = 'GESTION'
	AND orden = 24;
	
UPDATE config_menu_tbl
	SET orden = 24
	WHERE aplicacion = 'GESTION'
	AND orden = 23;
	
UPDATE config_menu_tbl
	SET orden = 23
	WHERE aplicacion = 'GESTION'
	AND orden = 22;
	
UPDATE config_menu_tbl
	SET orden = 22
	WHERE aplicacion = 'GESTION'
	AND orden = 21;
	
UPDATE config_menu_tbl
	SET orden = 21
	WHERE aplicacion = 'GESTION'
	AND orden = 20;
	
UPDATE config_menu_tbl
	SET orden = 20
	WHERE aplicacion = 'GESTION'
	AND orden = 19;
	
UPDATE config_menu_tbl
	SET orden = 19
	WHERE aplicacion = 'GESTION'
	AND orden = 18;
	
UPDATE config_menu_tbl
	SET orden = 18
	WHERE aplicacion = 'GESTION'
	AND orden = 17;
	
UPDATE config_menu_tbl
	SET orden = 17
	WHERE aplicacion = 'GESTION'
	AND orden = 16;
	
UPDATE config_menu_tbl
	SET orden = 16
	WHERE aplicacion = 'GESTION'
	AND orden = 15;
	
UPDATE config_menu_tbl
	SET orden = 15
	WHERE aplicacion = 'GESTION'
	AND orden = 14;
	
UPDATE config_menu_tbl
	SET orden = 14
	WHERE aplicacion = 'GESTION'
	AND orden = 13;
	
UPDATE config_menu_tbl
	SET orden = 13
	WHERE aplicacion = 'GESTION'
	AND orden = 12;
	
UPDATE config_menu_tbl
	SET orden = 52
	WHERE aplicacion = 'CENTRAL'
	AND orden = 51;
	
UPDATE config_menu_tbl
	SET orden = 51
	WHERE aplicacion = 'CENTRAL'
	AND orden = 50;
	
UPDATE config_menu_tbl
	SET orden = 50
	WHERE aplicacion = 'CENTRAL'
	AND orden = 49;
	
UPDATE config_menu_tbl
	SET orden = 49
	WHERE aplicacion = 'CENTRAL'
	AND orden = 48;
	
UPDATE config_menu_tbl
	SET orden = 48
	WHERE aplicacion = 'CENTRAL'
	AND orden = 47;
	
UPDATE config_menu_tbl
	SET orden = 47
	WHERE aplicacion = 'CENTRAL'
	AND orden = 46;
	
UPDATE config_menu_tbl
	SET orden = 46
	WHERE aplicacion = 'CENTRAL'
	AND orden = 45;
	
UPDATE config_menu_tbl
	SET orden = 45
	WHERE aplicacion = 'CENTRAL'
	AND orden = 44;
	
UPDATE config_menu_tbl
	SET orden = 44
	WHERE aplicacion = 'CENTRAL'
	AND orden = 43;
	
UPDATE config_menu_tbl
	SET orden = 43
	WHERE aplicacion = 'CENTRAL'
	AND orden = 42;
	
UPDATE config_menu_tbl
	SET orden = 42
	WHERE aplicacion = 'CENTRAL'
	AND orden = 41;
	
UPDATE config_menu_tbl
	SET orden = 41
	WHERE aplicacion = 'CENTRAL'
	AND orden = 40;
	
UPDATE config_menu_tbl
	SET orden = 40
	WHERE aplicacion = 'CENTRAL'
	AND orden = 39;
	
UPDATE config_menu_tbl
	SET orden = 39
	WHERE aplicacion = 'CENTRAL'
	AND orden = 38;
	
UPDATE config_menu_tbl
	SET orden = 38
	WHERE aplicacion = 'CENTRAL'
	AND orden = 37;
	
UPDATE config_menu_tbl
	SET orden = 37
	WHERE aplicacion = 'CENTRAL'
	AND orden = 36;
	
UPDATE config_menu_tbl
	SET orden = 36
	WHERE aplicacion = 'CENTRAL'
	AND orden = 35;
	
UPDATE config_menu_tbl
	SET orden = 35
	WHERE aplicacion = 'CENTRAL'
	AND orden = 34;
	
UPDATE config_menu_tbl
	SET orden = 34
	WHERE aplicacion = 'CENTRAL'
	AND orden = 33;
	
UPDATE config_menu_tbl
	SET orden = 33
	WHERE aplicacion = 'CENTRAL'
	AND orden = 32;
	
UPDATE config_menu_tbl
	SET orden = 32
	WHERE aplicacion = 'CENTRAL'
	AND orden = 31;
	
UPDATE config_menu_tbl
	SET orden = 31
	WHERE aplicacion = 'CENTRAL'
	AND orden = 30;
	
UPDATE config_menu_tbl
	SET orden = 30
	WHERE aplicacion = 'CENTRAL'
	AND orden = 29;
	
UPDATE config_menu_tbl
	SET orden = 29
	WHERE aplicacion = 'CENTRAL'
	AND orden = 28;
	
UPDATE config_menu_tbl
	SET orden = 28
	WHERE aplicacion = 'CENTRAL'
	AND orden = 27;
	
INSERT INTO config_menu_tbl(aplicacion, orden, opcion, id_accion, tecla_rapida)
VALUES ('GESTION', 12, 'Compras\\Introducción de Albaranes de Compras', 22, NULL),
  ('GESTION', 29, 'Tesorería\\Remesas de Pagos', 54, NULL),
  ('CENTRAL', 27, 'Compras\\Introducción de Pedidos de Compras', 55, NULL),
  ('CENTRAL', 53, 'Tesorería\\Remesas de Pagos', 54, NULL),
  ('ADMINISTRACION', 42, 'Sistema\\Estadísticas de uso', 57, NULL);
	
/* datos para tabla: CONFIG_VARIABLES_DEF_TBL*/
UPDATE config_variables_def_tbl
	SET valor_defecto = '1.1.0'
	WHERE id_variable = 'GENERAL.VERSION';
	
UPDATE config_variables_def_tbl
	SET valor_defecto = '1.1.0'
	WHERE id_variable = 'TPV.VERSION';