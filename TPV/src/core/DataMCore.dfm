object DMCore: TDMCore
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 421
  Width = 504
  object MetaDatos: TUniMetaData
    Left = 40
    Top = 16
  end
  object Q_EXISTE_VARIABLE: TUniQuery
    SQL.Strings = (
      'SELECT ID_VARIABLE'
      'FROM CONFIG_VARIABLES_DEF_TBL'
      'WHERE ID_VARIABLE = '#39'TPV.VERSION'#39)
    Left = 40
    Top = 80
  end
end
