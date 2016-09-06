inherited DMUsuarios: TDMUsuarios
  OldCreateOrder = True
  Height = 276
  Width = 332
  object Q_IDU: TUniQuery
    SQL.Strings = (
      'SELECT ID_USUARIO'
      'FROM CONFIG_USUARIOS_TBL'
      'WHERE USUARIO = :USUARIO')
    Left = 160
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'USUARIO'
      end>
  end
  object Q_USUARIO: TUniQuery
    SQL.Strings = (
      'SELECT USUARIO, CLAVE'
      'FROM !CONFIG_USUARIOS_TBL'
      
        'WHERE UPPER(USUARIO) = UPPER(:USUARIO) AND UPPER(CLAVE) = UPPER(' +
        ':CLAVE)')
    Left = 176
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'USUARIO'
      end
      item
        DataType = ftUnknown
        Name = 'CLAVE'
      end>
  end
  object Q_LISTA_USUARIOS: TUniQuery
    SQL.Strings = (
      'SELECT USUARIO, DESUSUARIO, CLAVE'
      'FROM CONFIG_USUARIOS_TBL'
      'WHERE ACTIVO = '#39'S'#39
      'ORDER BY USUARIO')
    Left = 248
    Top = 24
  end
end
