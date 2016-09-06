inherited DMTarifas: TDMTarifas
  OldCreateOrder = True
  Height = 293
  object Q_PRECIO_TARIFA: TUniQuery
    SQL.Strings = (
      'SELECT'
      '   PRECIO_VENTA'
      'FROM'
      '   T_TARIFAS_DET_TBL'
      'WHERE'
      '   CODALM = :CODTIENDA AND'
      '   CODTAR = :CODTAR AND'
      '   CODART = :CODART')
    Left = 304
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODTAR'
      end
      item
        DataType = ftUnknown
        Name = 'CODART'
      end>
  end
  object Q_PRECIO_PROMOCION: TUniQuery
    SQL.Strings = (
      'SELECT'
      '  DET.PRECIO_TARIFA,'
      '  DET.PRECIO_VENTA,'
      '  DET.PUNTOS,'
      '  DET.TEXTO_PROMOCION,'
      '  DET.ID_PROMOCION'
      'FROM'
      '   T_PROMOCIONES_DET_TBL DET'
      'WHERE'
      '   DET.CODALM = :CODTIENDA AND'
      '   DET.CODART = :CODART AND'
      '   DET.CODTAR = :CODTAR AND'
      
        '   ((:USA_FIDELIZACION = '#39'S'#39') OR ((:USA_FIDELIZACION1 = '#39'N'#39') AND' +
        ' (DET.SOLO_FIDELIZACION = '#39'N'#39'))) AND'
      '   :FECHA BETWEEN DET.FECHA_INICIO AND DET.FECHA_FIN')
    Left = 304
    Top = 88
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
        Name = 'CODTAR'
      end
      item
        DataType = ftUnknown
        Name = 'USA_FIDELIZACION'
      end
      item
        DataType = ftUnknown
        Name = 'USA_FIDELIZACION1'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
      end>
  end
  object Q_CONSULTA_TARIFAS: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM T_TARIFAS_CAB_TBL')
    Left = 304
    Top = 160
  end
  object Q_BUSQUEDA_TARIFAS: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM T_TARIFAS_CAB_TBL'
      'WHERE CODTAR = :CODTAR')
    Left = 304
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTAR'
      end>
  end
  object MODIFICA_PRECIO_TARIFA: TUniQuery
    SQL.Strings = (
      'UPDATE T_TARIFAS_DET_TBL'
      'SET '
      '   PRECIO_VENTA = :PRECIO_VENTA,'
      '   PRECIO_TOTAL = :PRECIO_TOTAL'
      'WHERE'
      '   CODALM = :CODTIENDA AND'
      '   CODTAR = :CODTAR AND'
      '   CODART = :CODART')
    Left = 56
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PRECIO_VENTA'
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO_TOTAL'
      end
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODTAR'
      end
      item
        DataType = ftUnknown
        Name = 'CODART'
      end>
  end
  object INSERTA_PRECIO_TARIFA: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_TARIFAS_DET_TBL('
      '    CODALM,'
      '    CODTAR,'
      '    CODART,  '
      '    PRECIO_VENTA,'
      '    PRECIO_TOTAL'
      '    )'
      'VALUES('
      '   :CODTIENDA,'
      '   :CODTAR,'
      '   :CODART,'
      '   :PRECIO_VENTA,'
      '   :PRECIO_TOTAL)')
    Left = 56
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODTAR'
      end
      item
        DataType = ftUnknown
        Name = 'CODART'
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO_VENTA'
      end
      item
        DataType = ftUnknown
        Name = 'PRECIO_TOTAL'
      end>
  end
  object Q_CACHE: TUniQuery
    SQL.Strings = (
      'SELECT COUNT(DISTINCT CODTAR) TARIFAS, '
      '       MAX(CODTAR) CODTAR,'
      
        '       MAX((SELECT COUNT(*) FROM T_PROMOCIONES_DET_TBL WHERE COD' +
        'ALM = :CODTIENDA)) PROMOCIONES'
      'FROM T_TARIFAS_DET_TBL'
      'WHERE CODALM = :CODTIENDA')
    Left = 176
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end>
  end
end
