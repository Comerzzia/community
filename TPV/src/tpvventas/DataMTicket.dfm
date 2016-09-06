inherited DMTicket: TDMTicket
  OldCreateOrder = True
  Height = 514
  Width = 676
  inherited CONSULTA: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM D_ARTICULOS_TBL'
      'WHERE %CONDICION')
  end
  object LINEAS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 160
    object LINEASIDX: TIntegerField
      FieldName = 'IDX'
    end
    object LINEASLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object LINEASCODART: TStringField
      FieldName = 'CODART'
      Size = 13
    end
    object LINEASDESART: TStringField
      FieldName = 'DESART'
      Size = 45
    end
    object LINEASDESGLOSE1: TStringField
      FieldName = 'DESGLOSE1'
      Size = 15
    end
    object LINEASDESGLOSE2: TStringField
      FieldName = 'DESGLOSE2'
      Size = 15
    end
    object LINEASCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      DisplayFormat = '###,###,##0.00'
    end
    object LINEASPRECIO_TOTAL_SIN_DTO: TFloatField
      FieldName = 'PRECIO_TOTAL_SIN_DTO'
    end
    object LINEASDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
    end
    object LINEASPRECIO: TFloatField
      FieldName = 'PRECIO_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object LINEASIMPORTE: TFloatField
      FieldName = 'IMPORTE_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object LINEASGENERICO: TBooleanField
      FieldName = 'GENERICO'
    end
  end
  object PAGOS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 160
    object IntegerField1: TIntegerField
      FieldName = 'IDX'
    end
    object PAGOSDESMEDPAG: TStringField
      FieldName = 'DESMEDPAG'
      Size = 45
    end
    object PAGOSIMPORTE: TCurrencyField
      FieldName = 'IMPORTE'
    end
  end
  object IMPUESTOS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 216
    object IntegerField3: TIntegerField
      FieldName = 'IDX'
    end
    object IMPUESTOSCODIVA: TStringField
      DisplayLabel = 'CODIMP'
      FieldName = 'CODIVA'
      Size = 1
    end
    object IMPUESTOSBASE: TFloatField
      FieldName = 'BASE'
    end
    object IMPUESTOSIMPUESTOS: TFloatField
      FieldName = 'IMPUESTOS'
    end
    object IMPUESTOSTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object INSERTA_CAB_TICKET: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_CLIE_ALBARANES_CAB_TBL('
      '   ID_CLIE_ALBARAN,'
      '   CODEMP,'
      '   PERIODO,'
      '   CODSERIE,'
      '   NUMALB,'
      '   FECHA,'
      '   FECHA_SUMINISTRO,'
      '   CODCLI,'
      '   CODALM,'
      '   ID_GRUPO_IMPUESTOS,'
      '   ID_FACTURA,'
      '   ID_TRAT_IMPUESTOS,'
      '   CODCAJA,'
      '   ID_DIARIO_CAJA,'
      '   BASE,'
      '   IMPUESTOS,'
      '   TOTAL,'
      '   ID_USUARIO,'
      '   ENTREGADO)'
      'VALUES('
      '   :ID_CLIE_ALBARAN,'
      '   :CODEMP,'
      '   :PERIODO,'
      '   :CODSERIE,'
      '   :NUMALB,'
      '   :FECHA,'
      '   :FECHA_SUMINISTRO,'
      '   :CODCLI,'
      '   :CODALM,'
      '   :ID_GRUPO_IMPUESTOS,'
      '   :ID_FACTURA,'
      '   :ID_TRAT_IMPUESTOS,'
      '   :CODCAJA,'
      '   :ID_DIARIO_CAJA,'
      '   :BASE,'
      '   :IMPUESTOS,'
      '   :TOTAL,'
      '   :ID_USUARIO,'
      '   :ENTREGADO)'
      '')
    Left = 64
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CLIE_ALBARAN'
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
      end
      item
        DataType = ftUnknown
        Name = 'PERIODO'
      end
      item
        DataType = ftUnknown
        Name = 'CODSERIE'
      end
      item
        DataType = ftUnknown
        Name = 'NUMALB'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_SUMINISTRO'
      end
      item
        DataType = ftUnknown
        Name = 'CODCLI'
      end
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end
      item
        DataType = ftUnknown
        Name = 'ID_GRUPO_IMPUESTOS'
      end
      item
        DataType = ftUnknown
        Name = 'ID_FACTURA'
      end
      item
        DataType = ftUnknown
        Name = 'ID_TRAT_IMPUESTOS'
      end
      item
        DataType = ftUnknown
        Name = 'CODCAJA'
      end
      item
        DataType = ftUnknown
        Name = 'ID_DIARIO_CAJA'
      end
      item
        DataType = ftUnknown
        Name = 'BASE'
      end
      item
        DataType = ftUnknown
        Name = 'IMPUESTOS'
      end
      item
        DataType = ftUnknown
        Name = 'TOTAL'
      end
      item
        DataType = ftUnknown
        Name = 'ID_USUARIO'
      end
      item
        DataType = ftUnknown
        Name = 'ENTREGADO'
      end>
  end
  object INSERTA_DET_TICKET: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_CLIE_ALBARANES_DET_TBL('
      '   ID_CLIE_ALBARAN,'
      '   LINEA,'
      '   CODART,'
      '   FECHA,'
      '   DESGLOSE1,'
      '   DESGLOSE2,'
      '   DESART,'
      '   CANTIDAD,'
      '   PRECIO,'
      '   PRECIO_TOTAL,'
      '   DESCUENTO,'
      '   IMPORTE,'
      '   IMPORTE_TOTAL,'
      '   CODIMP)'
      'VALUES('
      '   :ID_CLIE_ALBARAN,'
      '   :LINEA,'
      '   :CODART,'
      '   :FECHA,'
      '   :DESGLOSE1,'
      '   :DESGLOSE2,'
      '   :DESART,'
      '   :CANTIDAD,'
      '   :PRECIO,'
      '   :PRECIO_TOTAL,'
      '   :DESCUENTO,'
      '   :IMPORTE,'
      '   :IMPORTE_TOTAL,'
      '   :CODIMP)'
      '')
    Left = 184
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CLIE_ALBARAN'
      end
      item
        DataType = ftUnknown
        Name = 'LINEA'
      end
      item
        DataType = ftUnknown
        Name = 'CODART'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
      end
      item
        DataType = ftUnknown
        Name = 'DESGLOSE1'
      end
      item
        DataType = ftUnknown
        Name = 'DESGLOSE2'
      end
      item
        DataType = ftUnknown
        Name = 'DESART'
      end
      item
        DataType = ftUnknown
        Name = 'CANTIDAD'
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO'
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO_TOTAL'
      end
      item
        DataType = ftUnknown
        Name = 'DESCUENTO'
      end
      item
        DataType = ftUnknown
        Name = 'IMPORTE'
      end
      item
        DataType = ftUnknown
        Name = 'IMPORTE_TOTAL'
      end
      item
        DataType = ftUnknown
        Name = 'CODIMP'
      end>
  end
  object INSERTA_IMP_TICKET: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_CLIE_ALBARANES_IMP_TBL('
      '   ID_CLIE_ALBARAN,'
      '   CODIMP,'
      '   BASE,'
      '   IMPUESTOS,'
      '   TOTAL)'
      'VALUES('
      '   :ID_CLIE_ALBARAN,'
      '   :CODIMP,'
      '   :BASE,'
      '   :IMPUESTOS,'
      '   :TOTAL)'
      '')
    Left = 64
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CLIE_ALBARAN'
      end
      item
        DataType = ftUnknown
        Name = 'CODIMP'
      end
      item
        DataType = ftUnknown
        Name = 'BASE'
      end
      item
        DataType = ftUnknown
        Name = 'IMPUESTOS'
      end
      item
        DataType = ftUnknown
        Name = 'TOTAL'
      end>
  end
  object INSERTA_PAG_TICKET: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_CLIE_ALBARANES_PAG_TBL('
      '   ID_CLIE_ALBARAN,'
      '   LINEA,'
      '   IMPORTE,'
      '   NUMERO_OPERACION,'
      '   CODMEDPAG)'
      'VALUES('
      '   :ID_CLIE_ALBARAN,'
      '   :LINEA,'
      '   :IMPORTE,'
      '   :NUMERO_OPERACION,'
      '   :CODMEDPAG)'
      '')
    Left = 184
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CLIE_ALBARAN'
      end
      item
        DataType = ftUnknown
        Name = 'LINEA'
      end
      item
        DataType = ftUnknown
        Name = 'IMPORTE'
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO_OPERACION'
      end
      item
        DataType = ftUnknown
        Name = 'CODMEDPAG'
      end>
  end
  object Q_INSERTA_TICKET_XML: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_TICKETS_TBL('
      '   UID_TICKET,'
      '   CODALM,'
      '   ID_TICKET,'
      '   ENVIADO,'
      '   FECHA,'
      '   TICKET)'
      'VALUES('
      '   :UID_TICKET,'
      '   :CODALM,'
      '   :ID_TICKET,'
      '   '#39'N'#39','
      '   :FECHA,'
      '   :TICKET)')
    Left = 64
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_TICKET'
      end
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end
      item
        DataType = ftUnknown
        Name = 'ID_TICKET'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
      end
      item
        DataType = ftBlob
        Name = 'TICKET'
        ParamType = ptInput
        Value = ''
        National = True
      end>
  end
  object Q_TICKET_XML: TUniQuery
    SQL.Strings = (
      'SELECT CODALM, ID_TICKET, TICKET'
      'FROM  T_TICKETS_TBL'
      'WHERE'
      '   UID_TICKET = :UID_TICKET')
    Left = 192
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_TICKET'
      end>
  end
  object Q_TICKET_HIST_XML: TUniQuery
    SQL.Strings = (
      'SELECT CODALM, ID_TICKET, TICKET'
      'FROM  T_TICKETS_HIST_TBL'
      'WHERE'
      '   UID_TICKET = :UID_TICKET')
    Left = 296
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_TICKET'
      end>
  end
end
