inherited DMConfiguracionDispositivos: TDMConfiguracionDispositivos
  OldCreateOrder = True
  object Q_TIENDAS_CAJAS_XML: TUniQuery
    SQL.Strings = (
      'SELECT CONFIGURACION'
      'FROM  T_TIENDAS_CAJAS_TBL'
      'WHERE'
      '   UID_TPV = :UID_TPV')
    Left = 232
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_TPV'
      end>
  end
  object Q_ACTUALIZA_CONFIGURACION_XML: TUniQuery
    SQL.Strings = (
      'UPDATE T_TIENDAS_CAJAS_TBL'
      'SET'
      '   CONFIGURACION = :CONFIGURACION'
      'WHERE'
      '   UID_TPV = :UID_TPV')
    Left = 232
    Top = 96
    ParamData = <
      item
        DataType = ftBlob
        Name = 'CONFIGURACION'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'UID_TPV'
        ParamType = ptInput
      end>
  end
  object Q_INSERTA_CONFIGURACION_XML: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_TIENDAS_CAJAS_TBL'
      '  (UID_TPV,'
      '   CONFIGURACION)'
      'VALUES'
      '  (:UID_TPV,'
      '   :CONFIGURACION)')
    Left = 232
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'UID_TPV'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'CONFIGURACION'
        ParamType = ptInput
        Value = ''
      end>
  end
end
