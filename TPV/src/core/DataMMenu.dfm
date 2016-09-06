object DMMenu: TDMMenu
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Q_MENU: TUniQuery
    SQL.Strings = (
      'SELECT A.OPCION, A.TECLA_RAPIDA, A.ID_ACCION,'
      '   B.TIPO_ACCION, B.EJECUCION, B.DESCRIPCION, B.TITULO, B.ICONO'
      'FROM'
      '   CONFIG_MENU_TBL A,'
      '   CONFIG_ACCIONES_TBL B'
      'WHERE'
      '   A.APLICACION = :APLICACION AND'
      '   B.ID_ACCION = A.ID_ACCION'
      'ORDER BY A.ORDEN')
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'APLICACION'
      end>
  end
  object XMLDoc: TXMLDocument
    Options = [doNodeAutoCreate, doAttrNull, doNamespaceDecl]
    Left = 96
    Top = 16
    DOMVendorDesc = 'MSXML'
  end
end
