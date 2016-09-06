inherited DMCodigoBarras: TDMCodigoBarras
  OldCreateOrder = True
  Width = 719
  inherited CONSULTA: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM D_ARTICULOS_TBL'
      'WHERE CODALM = :CODTIENDA'
      '      %CONDICION')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end>
  end
  object Q_EXISTE_CODBAR: TUniQuery
    SQL.Strings = (
      'SELECT COUNT(1) AS CONTADOR'
      'FROM'
      '   T_ARTICULOS_CODBAR_TBL'
      'WHERE'
      '   CODALM = :CODTIENDA AND CODIGO_BARRAS = :CODIGO_BARRAS')
    Left = 272
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODIGO_BARRAS'
      end>
  end
  object Q_CODIGO_BARRAS: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   T_ARTICULOS_CODBAR_TBL'
      'WHERE'
      '   CODALM = :CODTIENDA AND CODIGO_BARRAS = :CODIGO_BARRAS')
    Left = 272
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODIGO_BARRAS'
      end>
  end
  object Q_LISTA_CODBAR: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   T_ARTICULOS_CODBAR_TBL'
      'WHERE'
      '   CODALM = :CODTIENDA AND CODART = :CODART')
    Left = 272
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODART'
      end>
  end
  object BORRAR_CODBAR_ARTICULO: TUniQuery
    SQL.Strings = (
      'DELETE'
      'FROM'
      '   T_ARTICULOS_CODBAR_TBL'
      'WHERE'
      '   CODALM = :CODTIENDA AND CODART = :CODART')
    Left = 64
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODART'
      end>
  end
  object INSERTA_CODIGO_BARRAS: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_ARTICULOS_CODBAR_TBL('
      '   CODALM,'
      '   CODART, '
      '   DESGLOSE1,'
      '   DESGLOSE2,'
      '   CODIGO_BARRAS,'
      '   DUN14,'
      '   FECHA_ALTA,'
      '   FACTOR_CONVERSION)'
      'VALUES('
      '   :CODTIENDA,'
      '   :CODART, '
      '   :DESGLOSE1,'
      '   :DESGLOSE2,'
      '   :CODIGO_BARRAS,'
      '   :DUN14,'
      '   :FECHA_ALTA,'
      '   :FACTOR_CONVERSION)')
    Left = 272
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODART'
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
        Name = 'CODIGO_BARRAS'
      end
      item
        DataType = ftUnknown
        Name = 'DUN14'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_ALTA'
      end
      item
        DataType = ftUnknown
        Name = 'FACTOR_CONVERSION'
      end>
  end
  object CODIGOS_BARRAS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 264
    object CODIGOS_BARRASIDX: TIntegerField
      FieldName = 'IDX'
    end
    object CODIGOS_BARRASCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
    end
    object CODIGOS_BARRASDESGLOSE1: TStringField
      FieldName = 'DESGLOSE1'
      Size = 15
    end
    object CODIGOS_BARRASDESGLOSE2: TStringField
      FieldName = 'DESGLOSE2'
      Size = 15
    end
    object CODIGOS_BARRASDUN14: TStringField
      FieldName = 'DUN14'
      Size = 1
    end
    object CODIGOS_BARRASFECHA_ALTA: TDateTimeField
      FieldName = 'FECHA_ALTA'
    end
    object CODIGOS_BARRASFACTOR_CONVERSION: TFloatField
      FieldName = 'FACTOR_CONVERSION'
    end
  end
  object Q_CODIGOS_BARRA_ESP: TUniQuery
    SQL.Strings = (
      'SELECT '
      '   ORDEN,'
      '   DESCRIPCION,'
      '   PREFIJO,'
      '   CODART,'
      '   PRECIO,'
      '   CANTIDAD,'
      '   FIDELIZACION'
      'FROM '
      '   T_CODIGOS_BARRA_ESP_TBL'
      'WHERE'
      '   substr(:CODIGO_BARRAS, 1, LENGTH(PREFIJO)) = PREFIJO'
      'ORDER BY ORDEN')
    Left = 480
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO_BARRAS'
      end>
  end
  object INSERTA_CODIGOS_BARRA_ESP: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_CODIGOS_BARRA_ESP_TBL('
      '   ORDEN,'
      '   DESCRIPCION,'
      '   PREFIJO,'
      '   CODART,'
      '   PRECIO,'
      '   CANTIDAD,'
      '   FIDELIZACION)'
      'VALUES('
      '   :ORDEN,'
      '   :DESCRIPCION,'
      '   :PREFIJO,'
      '   :CODART,'
      '   :PRECIO,'
      '   :CANTIDAD,'
      '   :FIDELIZACION)')
    Left = 480
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ORDEN'
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPCION'
      end
      item
        DataType = ftUnknown
        Name = 'PREFIJO'
      end
      item
        DataType = ftUnknown
        Name = 'CODART'
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO'
      end
      item
        DataType = ftUnknown
        Name = 'CANTIDAD'
      end
      item
        DataType = ftUnknown
        Name = 'FIDELIZACION'
      end>
  end
  object TMP_CODIGOS_BARRA_ESP: TVirtualTable
    Active = True
    IndexFieldNames = 'ORDEN'
    OnNewRecord = TMP_CODIGOS_BARRA_ESPNewRecord
    FieldDefs = <
      item
        Name = 'ORDEN'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'PREFIJO'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'CODART'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PRECIO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANTIDAD'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FIDELIZACION'
        DataType = ftString
        Size = 1
      end>
    Left = 480
    Top = 264
    Data = {
      0300070005004F5244454E03000000000000000B004445534352495043494F4E
      01002D0000000000070050524546494A4F01000D00000000000600434F444152
      540100140000000000060050524543494F0100140000000000080043414E5449
      44414401001400000000000C00464944454C495A4143494F4E01000100000000
      00000000000000}
    object TMP_CODIGOS_BARRA_ESPORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
    object TMP_CODIGOS_BARRA_ESPDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Required = True
      Size = 45
    end
    object TMP_CODIGOS_BARRA_ESPPREFIJO: TStringField
      FieldName = 'PREFIJO'
      Required = True
      Size = 13
    end
    object TMP_CODIGOS_BARRA_ESPCODART: TStringField
      FieldName = 'CODART'
      Required = True
      EditMask = '00|00;1;_'
    end
    object TMP_CODIGOS_BARRA_ESPPRECIO: TStringField
      FieldName = 'PRECIO'
      Required = True
      EditMask = '00|00|00;1;_'
    end
    object TMP_CODIGOS_BARRA_ESPCANTIDAD: TStringField
      FieldName = 'CANTIDAD'
      EditMask = '00|00|00;1;_'
    end
    object TMP_CODIGOS_BARRA_ESPFIDELIZACION: TStringField
      FieldName = 'FIDELIZACION'
      Size = 1
    end
  end
  object BORRAR_CODIGOS_BARRA_ESP: TUniQuery
    SQL.Strings = (
      'DELETE FROM T_CODIGOS_BARRA_ESP_TBL')
    Left = 480
    Top = 208
  end
  object Q_CONSULTA_CODIGOS_BARRA_ESP: TUniQuery
    SQL.Strings = (
      'SELECT '
      '   ORDEN,'
      '   DESCRIPCION,'
      '   PREFIJO,'
      '   CODART,'
      '   PRECIO,'
      '   CANTIDAD,'
      '   FIDELIZACION'
      'FROM '
      '   T_CODIGOS_BARRA_ESP_TBL')
    Left = 480
    Top = 16
  end
end
