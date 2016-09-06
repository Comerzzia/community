inherited DMTienda: TDMTienda
  OldCreateOrder = True
  Height = 615
  Width = 749
  object Q_DATOS_TIENDA: TUniQuery
    SQL.Strings = (
      'SELECT CODALM, DESALM, NOMBRE_COMERCIAL, DOMICILIO, POBLACION,'
      '       PROVINCIA, CP, TELEFONO1, TELEFONO2, FAX, CIF,'
      '       PERSONA_CONTACTO, ACTIVO, CLIENTE_POR_DEFECTO'
      'FROM T_TIENDAS_TBL '
      'WHERE'
      '   CODALM = :CODTIENDA')
    Left = 312
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end>
  end
  object Q_INSERTA_TIENDA: TUniQuery
    SQL.Strings = (
      
        'INSERT INTO T_TIENDAS_TBL(CODALM, DESALM, NOMBRE_COMERCIAL, DOMI' +
        'CILIO, POBLACION,'
      '       PROVINCIA, CP, TELEFONO1, TELEFONO2, FAX, CIF,'
      '       PERSONA_CONTACTO, ACTIVO)'
      
        'VALUES(:CODALM, :DESALM, :NOMBRE_COMERCIAL, :DOMICILIO, :POBLACI' +
        'ON,'
      '       :PROVINCIA, :CP, :TELEFONO1, :TELEFONO2, :FAX, :CIF,'
      '       :PERSONA_CONTACTO, :ACTIVO)')
    Left = 624
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end
      item
        DataType = ftUnknown
        Name = 'DESALM'
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE_COMERCIAL'
      end
      item
        DataType = ftUnknown
        Name = 'DOMICILIO'
      end
      item
        DataType = ftUnknown
        Name = 'POBLACION'
      end
      item
        DataType = ftUnknown
        Name = 'PROVINCIA'
      end
      item
        DataType = ftUnknown
        Name = 'CP'
      end
      item
        DataType = ftUnknown
        Name = 'TELEFONO1'
      end
      item
        DataType = ftUnknown
        Name = 'TELEFONO2'
      end
      item
        DataType = ftUnknown
        Name = 'FAX'
      end
      item
        DataType = ftUnknown
        Name = 'CIF'
      end
      item
        DataType = ftUnknown
        Name = 'PERSONA_CONTACTO'
      end
      item
        DataType = ftUnknown
        Name = 'ACTIVO'
      end>
  end
  object Q_MODIFICA_TIENDA: TUniQuery
    SQL.Strings = (
      'UPDATE T_TIENDAS_TBL'
      'SET'
      '  DESALM = :DESALM,'
      '  NOMBRE_COMERCIAL = :NOMBRE_COMERCIAL,'
      '  DOMICILIO = :DOMICILIO,'
      '  POBLACION = :POBLACION,'
      '  PROVINCIA = :PROVINCIA,'
      '  CP = :CP,'
      '  TELEFONO1 = :TELEFONO1,'
      '  TELEFONO2 = :TELEFONO2,'
      '  FAX = :FAX,'
      '  CIF = :CIF,'
      '  PERSONA_CONTACTO = :PERSONA_CONTACTO,'
      '  ACTIVO = :ACTIVO'
      'WHERE'
      '   CODALM = :CODALM')
    Left = 624
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DESALM'
      end
      item
        DataType = ftUnknown
        Name = 'NOMBRE_COMERCIAL'
      end
      item
        DataType = ftUnknown
        Name = 'DOMICILIO'
      end
      item
        DataType = ftUnknown
        Name = 'POBLACION'
      end
      item
        DataType = ftUnknown
        Name = 'PROVINCIA'
      end
      item
        DataType = ftUnknown
        Name = 'CP'
      end
      item
        DataType = ftUnknown
        Name = 'TELEFONO1'
      end
      item
        DataType = ftUnknown
        Name = 'TELEFONO2'
      end
      item
        DataType = ftUnknown
        Name = 'FAX'
      end
      item
        DataType = ftUnknown
        Name = 'CIF'
      end
      item
        DataType = ftUnknown
        Name = 'PERSONA_CONTACTO'
      end
      item
        DataType = ftUnknown
        Name = 'ACTIVO'
      end
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end>
  end
  object Q_EXISTE_TIENDA: TUniQuery
    SQL.Strings = (
      'SELECT COUNT(1) AS CONTADOR FROM T_TIENDAS_TBL'
      'WHERE'
      '   CODALM = :CODALM')
    Left = 624
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end>
  end
  object Q_TIENDAS_CAJA: TUniQuery
    SQL.Strings = (
      'SELECT  *'
      'FROM T_TIENDAS_CAJAS_TBL '
      'WHERE'
      '   UID_TPV = :UID_TPV')
    Left = 312
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UID_TPV'
      end>
  end
  object CAMBIAR_TIENDA_CAJA_ACTIVA: TUniQuery
    SQL.Strings = (
      'UPDATE T_TIENDAS_CAJAS_TBL'
      'SET'
      '  CODALM = :CODALM,'
      '  CODCAJA = :CODCAJA'
      'WHERE'
      '   UID_TPV= :UID_TPV')
    Left = 88
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end
      item
        DataType = ftUnknown
        Name = 'CODCAJA'
      end
      item
        DataType = ftUnknown
        Name = 'UID_TPV'
      end>
  end
  object Q_UID_TPV: TUniQuery
    SQL.Strings = (
      'SELECT UID_TPV'
      'FROM T_TIENDAS_CAJAS_TBL '
      'WHERE'
      '   CODALM = :CODALM AND'
      '   CODCAJA = :CODCAJA')
    Left = 56
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end
      item
        DataType = ftUnknown
        Name = 'CODCAJA'
      end>
  end
  object Q_LISTA_TIENDAS: TUniQuery
    SQL.Strings = (
      'SELECT * '
      'FROM '
      '   T_TIENDAS_TBL'
      'WHERE ACTIVO = '#39'S'#39)
    Left = 304
    Top = 224
  end
  object QUITAR_TIENDA_CAJA: TUniQuery
    SQL.Strings = (
      'UPDATE T_TIENDAS_CAJAS_TBL'
      'SET'
      '  CODALM = NULL,'
      '  CODCAJA = NULL'
      'WHERE'
      '  CODALM = :CODALM AND'
      '  CODCAJA = :CODCAJA')
    Left = 88
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALM'
      end
      item
        DataType = ftUnknown
        Name = 'CODCAJA'
      end>
  end
end
