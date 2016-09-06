inherited DMCaja: TDMCaja
  OldCreateOrder = True
  Height = 605
  Width = 854
  inherited CONSULTA: TUniQuery
    Left = 16
    Top = 64
  end
  object Q_CAJA_CAB: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   T_CAJA_CAB_TBL'
      'WHERE'
      '   UID_DIARIO_CAJA= :UID_DIARIO_CAJA')
    Left = 128
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end>
  end
  object Q_CAJA_DET: TUniQuery
    SQL.Strings = (
      'SELECT'
      '   DET.*,'
      '   PAGO.DESMEDPAG'
      'FROM'
      '   T_CAJA_DET_TBL DET INNER JOIN T_MEDIOS_PAGO_TBL PAGO ON'
      '      PAGO.CODALM = :CODALM AND DET.CODMEDPAG = PAGO.CODMEDPAG'
      'WHERE'
      '   UID_DIARIO_CAJA = :UID_DIARIO_CAJA'
      'ORDER BY '
      '   DET.LINEA')
    Left = 200
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end>
  end
  object INSERTAR_CAB_CAJA: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_CAJA_CAB_TBL('
      '   UID_DIARIO_CAJA,'
      '   CODALM,'
      '   CODCAJA,'
      '   FECHA_APERTURA,'
      '   FECHA_CIERRE,'
      '   ID_USUARIO,'
      '   SALDO_INICIAL'
      ')'
      'VALUES('
      '   :UID_DIARIO_CAJA,'
      '   :CODALM,'
      '   :CODCAJA,'
      '   :FECHA_APERTURA,'
      '   :FECHA_CIERRE,'
      '   :ID_USUARIO,'
      '   :SALDO_INICIAL'
      ')')
    Left = 128
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end
      item
        DataType = ftUnknown
        Name = 'CODCAJA'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_APERTURA'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CIERRE'
      end
      item
        DataType = ftUnknown
        Name = 'ID_USUARIO'
      end
      item
        DataType = ftUnknown
        Name = 'SALDO_INICIAL'
      end>
  end
  object Q_ESTADO_APERTURA: TUniQuery
    SQL.Strings = (
      'SELECT '
      '   *'
      'FROM '
      '   T_CAJA_CAB_TBL CAJA'
      'WHERE'
      '  CAJA.CODALM = :CODALM AND'
      '  CAJA.CODCAJA = :CODCAJA AND'
      '  CAJA.FECHA_CIERRE IS NULL')
    Left = 376
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end
      item
        DataType = ftUnknown
        Name = 'CODCAJA'
      end>
  end
  object INSERTAR_DET_CAJA: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_CAJA_DET_TBL('
      '   UID_DIARIO_CAJA,'
      '   LINEA,'
      '   FECHA,'
      '   ENTRADA,'
      '   SALIDA,'
      '   CONCEPTO,'
      '   DOCUMENTO,'
      '   CODMEDPAG,'
      '   UID_TICKET'
      ')'
      'VALUES('
      '   :UID_DIARIO_CAJA,'
      '   :LINEA,'
      '   :FECHA,'
      '   :ENTRADA,'
      '   :SALIDA,'
      '   :CONCEPTO,'
      '   :DOCUMENTO,'
      '   :CODMEDPAG,'
      '   :UID_TICKET'
      ')')
    Left = 240
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end
      item
        DataType = ftUnknown
        Name = 'LINEA'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
      end
      item
        DataType = ftUnknown
        Name = 'ENTRADA'
      end
      item
        DataType = ftUnknown
        Name = 'SALIDA'
      end
      item
        DataType = ftUnknown
        Name = 'CONCEPTO'
      end
      item
        DataType = ftUnknown
        Name = 'DOCUMENTO'
      end
      item
        DataType = ftUnknown
        Name = 'CODMEDPAG'
      end
      item
        DataType = ftUnknown
        Name = 'UID_TICKET'
      end>
  end
  object Q_ULTIMA_LINEA_DET: TUniQuery
    SQL.Strings = (
      'SELECT'
      '   MAX(LINEA) LINEA'
      'FROM'
      '   T_CAJA_DET_TBL DET'
      'WHERE'
      '   UID_DIARIO_CAJA = :UID_DIARIO_CAJA')
    Left = 368
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end>
  end
  object ELIMINA_DET_CAJA: TUniQuery
    SQL.Strings = (
      'DELETE FROM T_CAJA_DET_TBL'
      'WHERE'
      '   UID_DIARIO_CAJA = :UID_DIARIO_CAJA AND'
      '   LINEA = :LINEA')
    Left = 240
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end
      item
        DataType = ftUnknown
        Name = 'LINEA'
      end>
  end
  object LINEAS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 376
    object LINEASIDX: TIntegerField
      FieldName = 'IDX'
    end
    object LINEASUID_DIARIO_CAJA: TStringField
      FieldName = 'UID_DIARIO_CAJA'
      Size = 40
    end
    object LINEASLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object LINEASFECHA: TDateField
      FieldName = 'FECHA'
    end
    object LINEASENTRADA: TFloatField
      DisplayLabel = 'ENTRADAS'
      FieldName = 'ENTRADA'
      DisplayFormat = '###,###,##0.00'
    end
    object LINEASSALIDA: TFloatField
      DisplayLabel = 'SALIDAS'
      FieldName = 'SALIDA'
      DisplayFormat = '###,###,##0.00'
    end
    object LINEASCONCEPTO: TStringField
      FieldName = 'CONCEPTO'
      Size = 40
    end
    object LINEASDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 10
    end
    object LINEASCODMEDPAG: TStringField
      FieldName = 'CODMEDPAG'
      Size = 4
    end
    object LINEASDESMEDPAG: TStringField
      FieldName = 'DESMEDPAG'
    end
    object LINEASUID_TICKET: TStringField
      FieldName = 'UID_TICKET'
      Size = 40
    end
  end
  object IMPORTE_MOVIMIENTOS: TUniQuery
    SQL.Strings = (
      'SELECT SUM(ENTRADA) AS ENTRADA, SUM(SALIDA) AS SALIDA'
      'FROM T_CAJA_DET_TBL'
      'WHERE'
      '   UID_TICKET IS NULL AND'
      '   UID_DIARIO_CAJA = :UID_DIARIO_CAJA')
    Left = 72
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end>
  end
  object IMPORTE_TICKETS: TUniQuery
    SQL.Strings = (
      'SELECT SUM(ENTRADA) AS ENTRADA, SUM(SALIDA) AS SALIDA'
      'FROM T_CAJA_DET_TBL'
      'WHERE'
      '   UID_TICKET IS NOT NULL AND'
      '   UID_DIARIO_CAJA = :UID_DIARIO_CAJA')
    Left = 72
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end>
  end
  object NUMERO_DEVOLUCIONES: TUniQuery
    SQL.Strings = (
      'SELECT COUNT(DISTINCT UID_TICKET) AS CONTADOR'
      'FROM T_CAJA_DET_TBL'
      'WHERE'
      '   UID_TICKET IS NOT NULL AND'
      '   SALIDA > 0 AND'
      '   UID_DIARIO_CAJA = :UID_DIARIO_CAJA')
    Left = 72
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end>
  end
  object NUMERO_TICKETS: TUniQuery
    SQL.Strings = (
      'SELECT COUNT(DISTINCT UID_TICKET) AS CONTADOR'
      'FROM T_CAJA_DET_TBL'
      'WHERE'
      '   UID_TICKET IS NOT NULL AND'
      '   ENTRADA > 0 AND'
      '   UID_DIARIO_CAJA = :UID_DIARIO_CAJA')
    Left = 72
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end>
  end
  object Q_RESUMEN_VENTAS: TUniQuery
    SQL.Strings = (
      
        'SELECT UID_DIARIO_CAJA, CODMEDPAG, DESMEDPAG, SUM(ENTRADA) AS EN' +
        'TRADA, SUM(SALIDA) AS SALIDA, SUM(RECUENTO) AS RECUENTO'
      'FROM '
      '    ('
      
        '    SELECT REC.UID_DIARIO_CAJA, REC.CODMEDPAG, MED.DESMEDPAG, 0 ' +
        'AS ENTRADA, 0 AS SALIDA, SUM(REC.CANTIDAD * REC.VALOR) AS RECUEN' +
        'TO'
      '    FROM '
      '       T_CAJA_DET_RECUENTO_TBL REC'
      
        '          INNER JOIN T_MEDIOS_PAGO_TBL MED ON (MED.CODALM = :COD' +
        'ALM AND REC.CODMEDPAG = MED.CODMEDPAG)'
      '    GROUP BY'
      '       REC.UID_DIARIO_CAJA, REC.CODMEDPAG, MED.DESMEDPAG'
      '          '
      '    UNION ALL      '
      '          '
      
        '    SELECT DET.UID_DIARIO_CAJA, DET.CODMEDPAG, MED.DESMEDPAG, SU' +
        'M(ENTRADA) AS ENTRADA, SUM(SALIDA) AS SALIDA, 0 AS RECUENTO'
      '    FROM '
      '       T_CAJA_DET_TBL DET'
      
        '          INNER JOIN T_MEDIOS_PAGO_TBL MED ON (MED.CODALM = :COD' +
        'ALM AND DET.CODMEDPAG = MED.CODMEDPAG)      '
      '    GROUP BY'
      '       DET.UID_DIARIO_CAJA, DET.CODMEDPAG, MED.DESMEDPAG'
      '    ) RESUMEN'
      'WHERE'
      '   UID_DIARIO_CAJA = :UID_DIARIO_CAJA'
      'GROUP BY'
      '   UID_DIARIO_CAJA, CODMEDPAG, DESMEDPAG')
    Left = 200
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end>
  end
  object RESUMEN: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 376
    object IntegerField1: TIntegerField
      FieldName = 'IDX'
    end
    object StringField3: TStringField
      FieldName = 'CODMEDPAG'
      Size = 4
    end
    object StringField4: TStringField
      FieldName = 'DESMEDPAG'
    end
    object RESUMENSALIDA: TCurrencyField
      FieldName = 'SALIDA'
      currency = False
    end
    object RESUMENENTRADA: TCurrencyField
      FieldName = 'ENTRADA'
      currency = False
    end
    object RESUMENTOTAL: TCurrencyField
      FieldName = 'TOTAL'
      currency = False
    end
    object RESUMENRECUENTO: TCurrencyField
      FieldName = 'RECUENTO'
      currency = False
    end
    object RESUMENDIFERENCIA: TCurrencyField
      FieldName = 'DESCUADRE'
      currency = False
    end
  end
  object LINEAS_VENTAS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 432
    object IntegerField2: TIntegerField
      FieldName = 'IDX'
    end
    object LINEAS_VENTASUID_DIARIO_CAJA: TStringField
      FieldName = 'UID_DIARIO_CAJA'
      Size = 40
    end
    object IntegerField4: TIntegerField
      FieldName = 'LINEA'
    end
    object LINEAS_VENTASFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'ENTRADAS'
      FieldName = 'ENTRADA'
      DisplayFormat = '###,###,##0.00'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'SALIDAS'
      FieldName = 'SALIDA'
      DisplayFormat = '###,###,##0.00'
    end
    object StringField1: TStringField
      FieldName = 'CONCEPTO'
      Size = 40
    end
    object StringField2: TStringField
      FieldName = 'DOCUMENTO'
      Size = 10
    end
    object StringField5: TStringField
      FieldName = 'CODMEDPAG'
      Size = 4
    end
    object StringField6: TStringField
      FieldName = 'DESMEDPAG'
    end
    object LINEAS_VENTASUID_TICKET: TStringField
      FieldName = 'UID_TICKET'
      Size = 40
    end
  end
  object LINEAS_RECUENTO: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 432
    object IntegerField6: TIntegerField
      FieldName = 'IDX'
    end
    object StringField9: TStringField
      FieldName = 'CODMEDPAG'
      Size = 4
    end
    object StringField10: TStringField
      FieldName = 'DESMEDPAG'
    end
    object LINEAS_RECUENTOCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object LINEAS_RECUENTOVALOR: TCurrencyField
      FieldName = 'VALOR'
      currency = False
    end
    object LINEAS_RECUENTOIMPORTE: TCurrencyField
      FieldName = 'TOTAL'
      currency = False
    end
  end
  object Q_CAJA_DET_RECUENTO: TUniQuery
    SQL.Strings = (
      'SELECT'
      '   DET.*,'
      '   PAGO.DESMEDPAG'
      'FROM'
      
        '      T_CAJA_DET_RECUENTO_TBL DET INNER JOIN T_MEDIOS_PAGO_TBL P' +
        'AGO ON'
      '      PAGO.CODALM = :CODALM AND DET.CODMEDPAG = PAGO.CODMEDPAG'
      'WHERE'
      '   UID_DIARIO_CAJA = :UID_DIARIO_CAJA'
      'ORDER BY '
      '   DET.LINEA')
    Left = 640
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end>
  end
  object INSERTAR_CAJA_DET_RECUENTO: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_CAJA_DET_RECUENTO_TBL('
      '   UID_DIARIO_CAJA, '
      '   LINEA, '
      '   CODMEDPAG, '
      '   CANTIDAD, '
      '   VALOR)'
      'VALUES('
      '   :UID_DIARIO_CAJA, '
      '   :LINEA, '
      '   :CODMEDPAG, '
      '   :CANTIDAD, '
      '   :VALOR)')
    Left = 640
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end
      item
        DataType = ftUnknown
        Name = 'LINEA'
      end
      item
        DataType = ftUnknown
        Name = 'CODMEDPAG'
      end
      item
        DataType = ftUnknown
        Name = 'CANTIDAD'
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
      end>
  end
  object BORRAR_RECUENTO: TUniQuery
    SQL.Strings = (
      'DELETE FROM T_CAJA_DET_RECUENTO_TBL'
      'WHERE'
      '   UID_DIARIO_CAJA = :UID_DIARIO_CAJA')
    Left = 640
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end>
  end
  object IMPORTE_RECUENTO: TUniQuery
    SQL.Strings = (
      'SELECT SUM(CANTIDAD * VALOR) AS RECUENTO'
      'FROM T_CAJA_DET_RECUENTO_TBL'
      'WHERE'
      '   UID_DIARIO_CAJA = :UID_DIARIO_CAJA')
    Left = 72
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end>
  end
  object CIERRA_CAJA: TUniQuery
    SQL.Strings = (
      'UPDATE T_CAJA_CAB_TBL'
      'SET  FECHA_CIERRE = :FECHA_CIERRE'
      'WHERE UID_DIARIO_CAJA = :UID_DIARIO_CAJA')
    Left = 128
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHA_CIERRE'
      end
      item
        DataType = ftUnknown
        Name = 'UID_DIARIO_CAJA'
      end>
  end
  object Q_ULTIMA_CAJA: TUniQuery
    SQL.Strings = (
      'SELECT '
      '   UID_DIARIO_CAJA'
      'FROM '
      '   T_CAJA_CAB_TBL CAJA'
      'WHERE'
      '  CAJA.CODALM = :CODALM AND'
      '  CAJA.CODCAJA = :CODCAJA AND'
      '  CAJA.FECHA_CIERRE IS NOT NULL'
      'ORDER BY FECHA_CIERRE DESC')
    Left = 376
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end
      item
        DataType = ftUnknown
        Name = 'CODCAJA'
      end>
  end
end
