inherited DMArticulo: TDMArticulo
  OldCreateOrder = True
  Height = 494
  Width = 683
  inherited CONSULTA: TUniQuery
    SQL.Strings = (
      'SELECT CODART, DESART, FORMATO, ACTIVO, GENERICO'
      'FROM '
      '   T_ARTICULOS_TBL   '
      'WHERE CODALM = :CODTIENDA'
      '      &CONDICION')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end>
    MacroData = <
      item
        Name = 'CONDICION'
      end>
  end
  object Q_ARTICULO: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   T_ARTICULOS_TBL'
      'WHERE CODALM = :CODTIENDA AND'
      '   CODART = :CODART')
    Left = 312
    Top = 32
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
  object CONSULTA_TPV: TUniQuery
    SQL.Strings = (
      'SELECT ART.CODART,'
      '       ART.DESART,'
      '       BAR.DESGLOSE1, '
      '       BAR.DESGLOSE2,'
      '       BAR.CODIGO_BARRAS'
      
        '  FROM T_ARTICULOS_TBL ART LEFT OUTER JOIN T_ARTICULOS_CODBAR_TB' +
        'L BAR ON (BAR.CODALM = ART.CODALM AND BAR.CODART = ART.CODART)'
      '  WHERE ART.CODALM = :CODTIENDA AND '
      '        %CONDICION%')
    Left = 56
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end>
  end
  object MODIFICA_ARTICULO: TUniQuery
    SQL.Strings = (
      'UPDATE  T_ARTICULOS_TBL'
      'SET'
      '   DESART = :DESART,'
      '   FORMATO = :FORMATO,'
      '   CODIMP = :CODIMP,'
      '   ACTIVO = :ACTIVO,'
      '   NUMEROS_SERIE = :NUMEROS_SERIE,'
      '   DESGLOSE1 = :DESGLOSE1,'
      '   DESGLOSE2 = :DESGLOSE2,'
      '   GENERICO = :GENERICO,'
      '   OBSERVACIONES = :OBSERVACIONES'
      'WHERE'
      '   CODALM = :CODTIENDA AND CODART = :CODART')
    Left = 312
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DESART'
      end
      item
        DataType = ftUnknown
        Name = 'FORMATO'
      end
      item
        DataType = ftUnknown
        Name = 'CODIMP'
      end
      item
        DataType = ftUnknown
        Name = 'ACTIVO'
      end
      item
        DataType = ftUnknown
        Name = 'NUMEROS_SERIE'
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
        Name = 'GENERICO'
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACIONES'
      end
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODART'
      end>
  end
  object INSERTA_ARTICULO: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_ARTICULOS_TBL('
      '   CODALM,'
      '   CODART,'
      '   DESART,'
      '   FORMATO,'
      '   CODIMP,'
      '   ACTIVO,'
      '   NUMEROS_SERIE,'
      '   DESGLOSE1,'
      '   DESGLOSE2,'
      '   GENERICO,'
      '   OBSERVACIONES)'
      'VALUES('
      '   :CODTIENDA,'
      '   :CODART,'
      '   :DESART,'
      '   :FORMATO,'
      '   :CODIMP,'
      '   :ACTIVO,'
      '   :NUMEROS_SERIE,'
      '   :DESGLOSE1,'
      '   :DESGLOSE2,'
      '   :GENERICO,'
      '   :OBSERVACIONES)')
    Left = 312
    Top = 152
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
        Name = 'DESART'
      end
      item
        DataType = ftUnknown
        Name = 'FORMATO'
      end
      item
        DataType = ftUnknown
        Name = 'CODIMP'
      end
      item
        DataType = ftUnknown
        Name = 'ACTIVO'
      end
      item
        DataType = ftUnknown
        Name = 'NUMEROS_SERIE'
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
        Name = 'GENERICO'
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACIONES'
      end>
  end
  object ELIMINA_ARTICULO: TUniQuery
    SQL.Strings = (
      'DELETE FROM T_ARTICULOS_TBL'
      'WHERE'
      '   CODALM = :CODTIENDA AND CODART = :CODART')
    Left = 312
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
  object Q_ARTICULOS_DEMO: TUniQuery
    SQL.Strings = (
      'SELECT CODART'
      'FROM'
      '   T_ARTICULOS_TBL'
      'WHERE CODALM = :CODTIENDA')
    Left = 56
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end>
  end
  object Q_CATEGORIAS: TUniQuery
    SQL.Strings = (
      'SELECT * '
      'FROM '
      '   T_CATEGORIZACION_TBL'
      'WHERE '
      '   CODALM = :CODTIENDA AND'
      '   CODCAT LIKE :CODCAT AND'
      '   LENGTH(CODCAT) = :NIVEL'
      'ORDER BY CODCAT')
    Left = 440
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODCAT'
      end
      item
        DataType = ftUnknown
        Name = 'NIVEL'
      end>
  end
  object Q_ARTICULOS_CATEGORIA: TUniQuery
    SQL.Strings = (
      'SELECT CODART, DESART '
      'FROM '
      '   T_ARTICULOS_TBL'
      'WHERE '
      '   CODALM = :CODTIENDA AND CODCAT = :CODCAT'
      'ORDER BY DESART')
    Left = 440
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODCAT'
      end>
  end
end
