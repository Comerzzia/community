inherited DMCliente: TDMCliente
  OldCreateOrder = True
  Height = 429
  Width = 479
  inherited CONSULTA: TUniQuery
    SQL.Strings = (
      'SELECT '
      '   CIF, '
      '   DESCLI, '
      '   NOMBRE_COMERCIAL, '
      '   PROVINCIA, '
      '   CP, '
      '   TELEFONO1, '
      '   PERSONA_CONTACTO'
      'FROM '
      '   T_CLIENTES_TBL'
      'WHERE CODALM = :CODTIENDA'
      '   &CONDICION')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end>
    MacroData = <
      item
        Name = 'CONDICION'
      end>
    object CONSULTACIF: TStringField
      FieldName = 'CIF'
      Required = True
    end
    object CONSULTADESCLI: TStringField
      DisplayLabel = 'NOMBRE'
      FieldName = 'DESCLI'
      Required = True
      Size = 45
    end
    object CONSULTANOMBRE_COMERCIAL: TStringField
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 45
    end
    object CONSULTAPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 50
    end
    object CONSULTACP: TStringField
      FieldName = 'CP'
      Size = 8
    end
    object CONSULTATELEFONO1: TStringField
      FieldName = 'TELEFONO1'
      Size = 15
    end
    object CONSULTAPERSONA_CONTACTO: TStringField
      DisplayLabel = 'CONTACTO'
      FieldName = 'PERSONA_CONTACTO'
      Size = 45
    end
  end
  object Q_CLIENTE: TUniQuery
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   T_CLIENTES_TBL'
      'WHERE'
      '   CODALM = :CODTIENDA AND CIF= :CIF')
    Left = 352
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CIF'
      end>
  end
  object CONSULTA_TPV: TUniQuery
    SQL.Strings = (
      'SELECT '
      '   CLI.CIF,'
      '   CLI.DESCLI,'
      '   CLI.POBLACION,'
      '   CLI.PROVINCIA'
      'FROM '
      '  T_CLIENTES_TBL CLI'
      'WHERE CODALM = :CODTIENDA AND'
      ' %CONDICION%')
    Left = 56
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end>
  end
  object Q_INSERTA_CLIENTE: TUniQuery
    SQL.Strings = (
      'INSERT INTO T_CLIENTES_TBL('
      '   CODALM,'
      '   CIF,   '
      '   DESCLI,'
      '   NOMBRE_COMERCIAL,'
      '   DOMICILIO,'
      '   POBLACION,'
      '   PROVINCIA,'
      '   CP,'
      '   TELEFONO1,'
      '   TELEFONO2,'
      '   FAX,'
      '   PERSONA_CONTACTO,'
      '   EMAIL,'
      '   ID_TRAT_IMPUESTOS,'
      '   CODMEDPAG,'
      '   CODTAR,'
      '   OBSERVACIONES,'
      '   ACTIVO,'
      '   FECHA_ALTA,'
      '   FECHA_BAJA,'
      '   VENTA_A_CREDITO)'
      'VALUES('
      '   :CODTIENDA,'
      '   :CIF,   '
      '   :DESCLI,'
      '   :NOMBRE_COMERCIAL,'
      '   :DOMICILIO,'
      '   :POBLACION,'
      '   :PROVINCIA,'
      '   :CP,'
      '   :TELEFONO1,'
      '   :TELEFONO2,'
      '   :FAX,'
      '   :PERSONA_CONTACTO,'
      '   :EMAIL,'
      '   :ID_TRAT_IMPUESTOS,'
      '   :CODMEDPAG,'
      '   :CODTAR,'
      '   :OBSERVACIONES,'
      '   :ACTIVO,'
      '   :FECHA_ALTA,'
      '   :FECHA_BAJA,'
      '   :VENTA_A_CREDITO)')
    Left = 352
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CIF'
      end
      item
        DataType = ftUnknown
        Name = 'DESCLI'
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
        Name = 'PERSONA_CONTACTO'
      end
      item
        DataType = ftUnknown
        Name = 'EMAIL'
      end
      item
        DataType = ftUnknown
        Name = 'ID_TRAT_IMPUESTOS'
      end
      item
        DataType = ftUnknown
        Name = 'CODMEDPAG'
      end
      item
        DataType = ftUnknown
        Name = 'CODTAR'
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACIONES'
      end
      item
        DataType = ftUnknown
        Name = 'ACTIVO'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_ALTA'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_BAJA'
      end
      item
        DataType = ftUnknown
        Name = 'VENTA_A_CREDITO'
      end>
  end
  object Q_ELIMINA_CLIENTE: TUniQuery
    SQL.Strings = (
      'DELETE FROM T_CLIENTES_TBL'
      'WHERE'
      '   CODALM = :CODTIENDA AND CIF= :CIF')
    Left = 352
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CIF'
      end>
  end
  object Q_MODIFICA_CLIENTE: TUniQuery
    SQL.Strings = (
      'UPDATE T_CLIENTES_TBL'
      'SET'
      'DESCLI = :DESCLI,'
      'NOMBRE_COMERCIAL = :NOMBRE_COMERCIAL,'
      'DOMICILIO = :DOMICILIO,'
      'POBLACION = :POBLACION,'
      'PROVINCIA = :PROVINCIA,'
      'CP = :CP,'
      'TELEFONO1 = :TELEFONO1,'
      'TELEFONO2 = :TELEFONO2,'
      'FAX = :FAX,'
      'PERSONA_CONTACTO = :PERSONA_CONTACTO,'
      'EMAIL = :EMAIL,'
      'ID_TRAT_IMPUESTOS = :ID_TRAT_IMPUESTOS,'
      'CODMEDPAG = :CODMEDPAG,'
      'CODTAR = :CODTAR,'
      'OBSERVACIONES = :OBSERVACIONES,'
      'ACTIVO = :ACTIVO,'
      'FECHA_BAJA = :FECHA_BAJA,'
      'VENTA_A_CREDITO = :VENTA_A_CREDITO'
      'WHERE'
      '   CODALM = :CODTIENDA AND CIF= :CIF')
    Left = 352
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DESCLI'
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
        Name = 'PERSONA_CONTACTO'
      end
      item
        DataType = ftUnknown
        Name = 'EMAIL'
      end
      item
        DataType = ftUnknown
        Name = 'ID_TRAT_IMPUESTOS'
      end
      item
        DataType = ftUnknown
        Name = 'CODMEDPAG'
      end
      item
        DataType = ftUnknown
        Name = 'CODTAR'
      end
      item
        DataType = ftUnknown
        Name = 'OBSERVACIONES'
      end
      item
        DataType = ftUnknown
        Name = 'ACTIVO'
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_BAJA'
      end
      item
        DataType = ftUnknown
        Name = 'VENTA_A_CREDITO'
      end
      item
        DataType = ftUnknown
        Name = 'CODTIENDA'
      end
      item
        DataType = ftUnknown
        Name = 'CIF'
      end>
  end
end
