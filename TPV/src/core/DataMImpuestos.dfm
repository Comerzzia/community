object DMImpuestos: TDMImpuestos
  OldCreateOrder = False
  Height = 346
  Width = 477
  object Q_IMPUESTOS: TUniQuery
    SQL.Strings = (
      'SELECT'
      '   IMP_PORC.ID_GRUPO_IMPUESTOS,'
      '   IMP_TRAT.ID_TRAT_IMPUESTOS,'
      '   IMP_TRAT.CODTRATIMP,'
      '   IMP_PORC.CODIMP,'
      '   IMP_PORC.PORCENTAJE,'
      '   IMP_PORC.PORCENTAJE_RECARGO,'
      '   IMP_GRUPO.VIGENCIA_DESDE,'
      '   IMP_TRAT.APLICA_RECARGO'
      'FROM'
      '   CONFIG_IMP_PORCENTAJES_TBL IMP_PORC,'
      '   CONFIG_IMP_GRUPOS_TBL IMP_GRUPO,'
      '   CONFIG_IMP_TRATAMIENTO_TBL IMP_TRAT'
      'WHERE'
      
        '   IMP_GRUPO.ID_GRUPO_IMPUESTOS = IMP_PORC.ID_GRUPO_IMPUESTOS AN' +
        'D'
      '   IMP_TRAT.ID_TRAT_IMPUESTOS = IMP_PORC.ID_TRAT_IMPUESTOS'
      'ORDER BY IMP_PORC.ID_GRUPO_IMPUESTOS,'
      '   IMP_TRAT.ID_TRAT_IMPUESTOS,'
      '   IMP_TRAT.CODTRATIMP,'
      '   IMP_PORC.CODIMP')
    Left = 112
    Top = 16
  end
  object IMPUESTOS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 24
    object IMPUESTOSGRUPO_IMPUESTOS: TIntegerField
      FieldName = 'ID_GRUPO_IMPUESTOS'
    end
    object IMPUESTOSID_TRAT_IMPUESTOS: TIntegerField
      FieldName = 'ID_TRAT_IMPUESTOS'
    end
    object IMPUESTOSCODIMP: TIntegerField
      FieldName = 'CODIMP'
    end
    object IMPUESTOSCODTRATIMP: TStringField
      FieldName = 'CODTRATIMP'
      Size = 11
    end
    object IMPUESTOSPORCENTAJE: TFloatField
      FieldName = 'PORCENTAJE'
    end
    object IMPUESTOSPORCENTAJE_RECARGO: TFloatField
      FieldName = 'PORCENTAJE_RECARGO'
    end
    object IMPUESTOSAPLICA_RECARGO: TStringField
      FieldName = 'APLICA_RECARGO'
      Size = 1
    end
    object IMPUESTOSVIGENCIA_DESDE: TDateTimeField
      FieldName = 'VIGENCIA_DESDE'
    end
  end
  object Q_CONFIG_IMP_TIPOS: TUniQuery
    SQL.Strings = (
      'SELECT CODIMP, DESIMP'
      '  FROM CONFIG_IMP_TIPOS_TBL')
    Left = 208
    Top = 176
  end
  object Q_CONFIG_IMP_TRATAMIENTO: TUniQuery
    SQL.Strings = (
      'SELECT ID_TRAT_IMPUESTOS, DESTRATIMP'
      '  FROM CONFIG_IMP_TRATAMIENTO_TBL')
    Left = 208
    Top = 232
  end
end
