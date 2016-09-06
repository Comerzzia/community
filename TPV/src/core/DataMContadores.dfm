object DMContador: TDMContador
  OldCreateOrder = False
  Height = 423
  Width = 428
  object Q_CONTADOR: TUniQuery
    SQL.Strings = (
      'SELECT VALOR'
      'FROM'
      '   CONFIG_CONTADORES_TBL'
      'WHERE'
      '   ID_CONTADOR = :ID_CONTADOR AND'
      '   CODEMP = :CODEMP AND'
      '   CODSERIE = :CODSERIE AND'
      '   PERIODO = :PERIODO')
    Left = 56
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CONTADOR'
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
      end
      item
        DataType = ftUnknown
        Name = 'CODSERIE'
      end
      item
        DataType = ftUnknown
        Name = 'PERIODO'
      end>
  end
  object Q_DEFINICION_CONTADOR: TUniQuery
    SQL.Strings = (
      'SELECT'
      '   USA_CODEMP,'
      '   USA_CODSERIE,'
      '   USA_PERIODO,'
      '   DESCRIPCION'
      'FROM CONFIG_CONTADORES_DEF_TBL'
      'WHERE'
      '   ID_CONTADOR = :ID_CONTADOR')
    Left = 56
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CONTADOR'
      end>
  end
  object INSERTA_CONTADOR: TUniQuery
    SQL.Strings = (
      'INSERT INTO CONFIG_CONTADORES_TBL('
      '   ID_CONTADOR, CODEMP, CODSERIE, PERIODO, VALOR)'
      'VALUES('
      '   :ID_CONTADOR, :CODEMP, :CODSERIE, :PERIODO, :VALOR)')
    Left = 152
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CONTADOR'
      end
      item
        DataType = ftUnknown
        Name = 'CODEMP'
      end
      item
        DataType = ftUnknown
        Name = 'CODSERIE'
      end
      item
        DataType = ftUnknown
        Name = 'PERIODO'
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
      end>
  end
  object ACTUALIZA_CONTADOR: TUniQuery
    SQL.Strings = (
      'UPDATE'
      '   CONFIG_CONTADORES_TBL'
      'SET'
      '   VALOR = VALOR + 1'
      'WHERE'
      '   ID_CONTADOR = :ID_CONTADOR AND'
      '   CODEMP = :CODEMP AND'
      '   PERIODO = :PERIODO AND'
      '   CODSERIE = :CODSERIE')
    Left = 152
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CONTADOR'
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
      end>
  end
end
