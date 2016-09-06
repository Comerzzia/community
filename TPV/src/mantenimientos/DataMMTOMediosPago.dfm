inherited DMMediosPago: TDMMediosPago
  OldCreateOrder = True
  inherited CONSULTA: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM D_MEDIOS_PAGO_TBL'
      'WHERE CODALM = :CODTIENDA'
      '   %CONDICION%'
      'ORDER BY CODMEDPAG')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end>
  end
  object Q_MEDIO_PAGO: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   T_MEDIOS_PAGO_TBL'
      'WHERE'
      '   CODALM = :CODTIENDA AND CODMEDPAG = :CODMEDPAG')
    Left = 320
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODMEDPAG'
      end>
  end
  object Q_LISTA_MEDIOS_PAGO_TPV: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   T_MEDIOS_PAGO_TBL'
      'WHERE'
      '   CODALM = :CODTIENDA AND ACTIVO = '#39'S'#39
      'ORDER BY CODMEDPAG')
    Left = 320
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end>
  end
  object Q_BUSQUEDA_M_PAGOS: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM T_MEDIOS_PAGO_TBL'
      'WHERE CODALM = :CODTIENDA AND CODMEDPAG = :CODMEDPAG')
    Left = 184
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CODMEDPAG'
      end>
  end
  object Q_CONSULTA_M_PAGOS: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM T_MEDIOS_PAGO_TBL'
      'WHERE CODALM = :CODTIENDA')
    Left = 184
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end>
  end
end
