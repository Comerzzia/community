object DMVariables: TDMVariables
  OldCreateOrder = False
  Height = 331
  Width = 420
  object XMLAplicacion: TXMLDocument
    Left = 40
    Top = 32
    DOMVendorDesc = 'MSXML'
  end
  object Q_VALOR_VARIABLE: TUniQuery
    SQL.Strings = (
      'SELECT VALOR'
      'FROM CONFIG_VARIABLES_TBL'
      'WHERE'
      '   ID_VARIABLE = :ID_VARIABLE'
      'ORDER BY PESO DESC')
    Left = 216
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_VARIABLE'
      end>
  end
  object Q_DEFINICION_VARIABLE: TUniQuery
    SQL.Strings = (
      'SELECT VALOR_DEFECTO'
      'FROM CONFIG_VARIABLES_DEF_TBL'
      'WHERE'
      '   ID_VARIABLE = :ID_VARIABLE')
    Left = 216
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_VARIABLE'
      end>
  end
end
