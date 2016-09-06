object DMBaseDatos: TDMBaseDatos
  OldCreateOrder = True
  OnDestroy = DMBaseDatosDestroy
  Height = 415
  Width = 750
  object database: TUniConnection
    SpecificOptions.Strings = (
      'Oracle.Direct=True')
    Left = 72
    Top = 48
  end
  object SQLMonitor: TUniSQLMonitor
    Active = False
    Left = 88
    Top = 184
  end
end
