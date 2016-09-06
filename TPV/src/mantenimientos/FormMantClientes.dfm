inherited FrmMantClientes: TFrmMantClientes
  Caption = 'Clientes'
  ClientHeight = 753
  ClientWidth = 843
  WindowState = wsMaximized
  ExplicitWidth = 859
  ExplicitHeight = 791
  PixelsPerInch = 96
  TextHeight = 13
  inherited Paginas: TRzPageControl
    Width = 782
    Height = 538
    OnChange = PaginasChange
    ExplicitWidth = 782
    ExplicitHeight = 538
    FixedDimension = 19
    inherited TabBusqueda: TRzTabSheet
      ExplicitWidth = 778
      ExplicitHeight = 515
      inherited LabelTitulo: TLabel
        Width = 778
      end
      inherited RzPanel15: TRzPanel
        Width = 778
        ExplicitWidth = 778
      end
      inherited RzGroupBox1: TRzGroupBox
        Width = 758
        ExplicitWidth = 758
        inherited Label1: TLabel
          Width = 50
          Caption = 'C.I.F.'
          ExplicitWidth = 50
        end
        inherited EditBuscarCodigo: TRzEdit
          MaxLength = 20
        end
        inherited RzPanel3: TRzPanel
          Left = 609
          ExplicitLeft = 609
        end
      end
      inherited RzGroupBox2: TRzGroupBox
        Width = 758
        Height = 391
        ExplicitWidth = 758
        ExplicitHeight = 391
        inherited GridBusqueda: TDBGridEh
          Width = 746
          Height = 371
          Columns = <
            item
              EditButtons = <>
              FieldName = 'CIF'
              Footers = <>
              Width = 93
            end
            item
              EditButtons = <>
              FieldName = 'DESCLI'
              Footers = <>
              Title.Caption = 'CLIENTE'
              Width = 179
            end
            item
              EditButtons = <>
              FieldName = 'NOMBRE_COMERCIAL'
              Footers = <>
              Title.Caption = 'N. COMERCIAL'
              Width = 222
            end
            item
              EditButtons = <>
              FieldName = 'TELEFONO1'
              Footers = <>
              Title.Caption = 'TELEFONO'
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'PROVINCIA'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'CP'
              Footers = <>
              Title.Caption = 'C.POSTAL'
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'PERSONA_CONTACTO'
              Footers = <>
              Title.Caption = 'CONTACTO'
            end>
        end
      end
    end
    inherited TabEdicion: TRzTabSheet
      ExplicitWidth = 778
      ExplicitHeight = 515
      inherited Label4: TLabel
        Width = 778
      end
      inherited RzPanel1: TRzPanel
        Width = 778
        ExplicitWidth = 778
      end
      inherited RzGroupBox3: TRzGroupBox
        Width = 758
        Height = 477
        ExplicitWidth = 758
        ExplicitHeight = 477
        inherited PanelCabeceraEdicion: TRzPanel
          Width = 756
          ExplicitWidth = 756
          inherited Label5: TLabel
            Left = 36
            Width = 45
            Height = 22
            Caption = 'C.I.F.'
            Font.Height = -19
            ExplicitLeft = 36
            ExplicitWidth = 45
            ExplicitHeight = 22
          end
          inherited Label6: TLabel
            Left = 36
            Top = 48
            Width = 101
            Height = 22
            Font.Height = -19
            ExplicitLeft = 36
            ExplicitTop = 48
            ExplicitWidth = 101
            ExplicitHeight = 22
          end
          object RzToolButton5: TRzToolButton [2]
            Left = 308
            Top = 7
            Width = 43
            Height = 39
            DisabledIndex = 17
            SelectionFrameColor = 7617536
            Images = Imagenes
            Action = AcCheckCliente
            Color = clNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          inherited EditDescripcion: TRzEdit
            TabOrder = 2
          end
          object EditActivo: TRzCheckBox
            Left = 370
            Top = 15
            Width = 71
            Height = 24
            AlignmentVertical = avCenter
            Caption = 'Activo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12670976
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            State = cbUnchecked
            TabOrder = 1
            Transparent = True
          end
        end
        object PaginasEdicion: TRzPageControl
          Left = 1
          Top = 105
          Width = 756
          Height = 371
          ActivePage = TabOtros
          Align = alClient
          UseColoredTabs = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Images = Imagenes
          ParentFont = False
          TabIndex = 1
          TabOrder = 1
          TabStyle = tsCutCorner
          Transparent = True
          FixedDimension = 43
          object TabGeneral: TRzTabSheet
            Color = clWhite
            ImageIndex = 25
            Caption = 'General'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Label7: TLabel
              Left = 33
              Top = 23
              Width = 155
              Height = 22
              Alignment = taRightJustify
              Caption = 'Nombre comercial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label9: TLabel
              Left = 110
              Top = 55
              Width = 78
              Height = 22
              Alignment = taRightJustify
              Caption = 'Domicilio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label11: TLabel
              Left = 104
              Top = 87
              Width = 84
              Height = 22
              Alignment = taRightJustify
              Caption = 'Poblaci'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label12: TLabel
              Left = 111
              Top = 119
              Width = 77
              Height = 22
              Alignment = taRightJustify
              Caption = 'Provincia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label13: TLabel
              Left = 68
              Top = 151
              Width = 120
              Height = 22
              Alignment = taRightJustify
              Caption = 'C'#243'digo Postal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label14: TLabel
              Left = 434
              Top = 147
              Width = 37
              Height = 22
              Caption = 'FAX'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label15: TLabel
              Left = 101
              Top = 183
              Width = 90
              Height = 22
              Alignment = taRightJustify
              Caption = 'Telefono 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label16: TLabel
              Left = 382
              Top = 183
              Width = 90
              Height = 22
              Alignment = taRightJustify
              Caption = 'Telefono 2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label2: TLabel
              Left = 16
              Top = 215
              Width = 175
              Height = 22
              Alignment = taRightJustify
              Caption = 'Persona de contacto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label8: TLabel
              Left = 141
              Top = 247
              Width = 50
              Height = 22
              Alignment = taRightJustify
              Caption = 'e-Mail'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object EditNombreComercial: TRzEdit
              Left = 197
              Top = 19
              Width = 493
              Height = 26
              CharCase = ecUpperCase
              DisabledColor = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              FocusColor = 8454143
              FrameColor = 10382147
              FrameVisible = True
              MaxLength = 45
              ParentFont = False
              TabOrder = 0
            end
            object EditDomicilio: TRzEdit
              Left = 197
              Top = 51
              Width = 493
              Height = 26
              CharCase = ecUpperCase
              DisabledColor = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              FocusColor = 8454143
              FrameColor = 10382147
              FrameVisible = True
              MaxLength = 50
              ParentFont = False
              TabOrder = 1
            end
            object EditPoblacion: TRzEdit
              Left = 197
              Top = 83
              Width = 493
              Height = 26
              CharCase = ecUpperCase
              DisabledColor = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              FocusColor = 8454143
              FrameColor = 10382147
              FrameVisible = True
              MaxLength = 50
              ParentFont = False
              TabOrder = 2
            end
            object EditProvincia: TRzEdit
              Left = 197
              Top = 115
              Width = 493
              Height = 26
              CharCase = ecUpperCase
              DisabledColor = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              FocusColor = 8454143
              FrameColor = 10382147
              FrameVisible = True
              MaxLength = 50
              ParentFont = False
              TabOrder = 3
            end
            object EditCodigoPostal: TRzEdit
              Left = 197
              Top = 147
              Width = 99
              Height = 26
              CharCase = ecUpperCase
              DisabledColor = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              FocusColor = 8454143
              FrameColor = 10382147
              FrameVisible = True
              MaxLength = 8
              ParentFont = False
              TabOrder = 4
            end
            object EditFax: TRzEdit
              Left = 478
              Top = 147
              Width = 156
              Height = 26
              CharCase = ecUpperCase
              DisabledColor = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              FocusColor = 8454143
              FrameColor = 10382147
              FrameVisible = True
              MaxLength = 15
              ParentFont = False
              TabOrder = 5
            end
            object EditTelefono1: TRzEdit
              Left = 197
              Top = 179
              Width = 156
              Height = 26
              CharCase = ecUpperCase
              DisabledColor = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              FocusColor = 8454143
              FrameColor = 10382147
              FrameVisible = True
              MaxLength = 15
              ParentFont = False
              TabOrder = 6
            end
            object EditTelefono2: TRzEdit
              Left = 478
              Top = 179
              Width = 156
              Height = 26
              CharCase = ecUpperCase
              DisabledColor = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              FocusColor = 8454143
              FrameColor = 10382147
              FrameVisible = True
              MaxLength = 15
              ParentFont = False
              TabOrder = 7
            end
            object EditPersonaContacto: TRzEdit
              Left = 197
              Top = 211
              Width = 493
              Height = 26
              CharCase = ecUpperCase
              DisabledColor = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              FocusColor = 8454143
              FrameColor = 10382147
              FrameVisible = True
              MaxLength = 45
              ParentFont = False
              TabOrder = 8
            end
            object EditEMail: TRzEdit
              Left = 197
              Top = 243
              Width = 493
              Height = 26
              CharCase = ecUpperCase
              DisabledColor = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = []
              FocusColor = 8454143
              FrameColor = 10382147
              FrameVisible = True
              MaxLength = 60
              ParentFont = False
              TabOrder = 9
            end
          end
          object TabOtros: TRzTabSheet
            Color = clWhite
            ImageIndex = 24
            Caption = 'Otros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12670976
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            object Label18: TLabel
              Left = 0
              Top = 137
              Width = 752
              Height = 22
              Align = alTop
              Caption = ' Observaciones'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
              ExplicitWidth = 133
            end
            object EditObservaciones: TRzMemo
              Left = 0
              Top = 159
              Width = 752
              Height = 165
              Align = alClient
              MaxLength = 255
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object RzPanel2: TRzPanel
              Left = 0
              Top = 0
              Width = 752
              Height = 137
              Align = alTop
              BorderOuter = fsNone
              TabOrder = 1
              Transparent = True
              object Label10: TLabel
                Left = 19
                Top = 35
                Width = 226
                Height = 22
                Alignment = taRightJustify
                Caption = 'Tratamiento de  Impuestos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label17: TLabel
                Left = 118
                Top = 67
                Width = 127
                Height = 22
                Alignment = taRightJustify
                Caption = 'Medio de pago'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object EditTratImpuesto: TRzComboBox
                Left = 251
                Top = 31
                Width = 403
                Height = 26
                AllowEdit = False
                CharCase = ecUpperCase
                Ctl3D = False
                DisabledColor = clWindow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = []
                FocusColor = 8454143
                FrameColor = 10382147
                FrameVisible = True
                MaxLength = 20
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
              end
              object EditMedioPago: TRzComboBox
                Left = 251
                Top = 63
                Width = 403
                Height = 26
                AllowEdit = False
                CharCase = ecUpperCase
                Ctl3D = False
                DisabledColor = clWindow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = []
                FocusColor = 8454143
                FrameColor = 10382147
                FrameVisible = True
                MaxLength = 20
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 1
              end
              object EditVentaACredito: TRzCheckBox
                Left = 120
                Top = 100
                Width = 145
                Height = 24
                Alignment = taLeftJustify
                AlignmentVertical = avCenter
                Caption = 'Venta a credito'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                State = cbUnchecked
                TabOrder = 2
                Transparent = True
              end
            end
          end
        end
      end
    end
  end
  inherited PanelTeclado: TRzPanel
    Top = 538
    Width = 843
    ExplicitTop = 538
    ExplicitWidth = 843
    object AdvTouchKeyboard1: TAdvTouchKeyboard
      AlignWithMargins = True
      Left = 15
      Top = 10
      Width = 825
      Height = 200
      Margins.Left = 15
      Margins.Bottom = 5
      Align = alBottom
      Color = clWhite
      KeyboardType = ktQWERTY
      Keys = <
        item
          X = 0
          Y = 0
          Caption = #186
          ShiftCaption = #170
          AltGrCaption = '\'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 40
          Y = 0
          Caption = '1'
          ShiftCaption = '!'
          AltGrCaption = '|'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 80
          Y = 0
          Caption = '2'
          ShiftCaption = '"'
          AltGrCaption = '@'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 120
          Y = 0
          Caption = '3'
          ShiftCaption = #183
          AltGrCaption = '#'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 160
          Y = 0
          Caption = '4'
          ShiftCaption = '$'
          AltGrCaption = '~'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 200
          Y = 0
          Caption = '5'
          ShiftCaption = '%'
          AltGrCaption = #8364
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 240
          Y = 0
          Caption = '6'
          ShiftCaption = '&'
          AltGrCaption = #172
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 280
          Y = 0
          Caption = '7'
          ShiftCaption = '/'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 320
          Y = 0
          Caption = '8'
          ShiftCaption = '('
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 360
          Y = 0
          Caption = '9'
          ShiftCaption = ')'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 400
          Y = 0
          Caption = '0'
          ShiftCaption = '='
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 440
          Y = 0
          Caption = #39
          ShiftCaption = '?'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 480
          Y = 0
          Caption = #161
          ShiftCaption = #191
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 520
          Y = 0
          Caption = 'Borrar'
          KeyValue = 8
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 80
          SpecialKey = skBackSpace
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 0
          Y = 40
          Caption = '->'
          ShiftCaption = '<-'
          KeyValue = 9
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 60
          SpecialKey = skTab
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 60
          Y = 40
          Caption = 'Q'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 100
          Y = 40
          Caption = 'W'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 140
          Y = 40
          Caption = 'E'
          AltGrCaption = #8364
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 180
          Y = 40
          Caption = 'R'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 220
          Y = 40
          Caption = 'T'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 260
          Y = 40
          Caption = 'Y'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 300
          Y = 40
          Caption = 'U'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 340
          Y = 40
          Caption = 'I'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 380
          Y = 40
          Caption = 'O'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 420
          Y = 40
          Caption = 'P'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 460
          Y = 40
          Caption = '`'
          ShiftCaption = '^'
          AltGrCaption = '['
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 500
          Y = 40
          Caption = '+'
          ShiftCaption = '*'
          AltGrCaption = ']'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 550
          Y = 40
          Caption = 'Entrar'
          KeyValue = 13
          ShiftKeyValue = 0
          AltGrKeyValue = 0
          Height = 80
          Width = 50
          SpecialKey = skReturn
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 0
          Y = 80
          Caption = 'Bloq. May'
          KeyValue = 20
          ShiftKeyValue = 0
          AltGrKeyValue = 0
          Height = 40
          Width = 70
          SpecialKey = skCaps
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 70
          Y = 80
          Caption = 'A'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 110
          Y = 80
          Caption = 'S'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 150
          Y = 80
          Caption = 'D'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 190
          Y = 80
          Caption = 'F'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 230
          Y = 80
          Caption = 'G'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 270
          Y = 80
          Caption = 'H'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 310
          Y = 80
          Caption = 'J'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 350
          Y = 80
          Caption = 'K'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 390
          Y = 80
          Caption = 'L'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 430
          Y = 80
          Caption = #209
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 470
          Y = 80
          Caption = #180
          ShiftCaption = #168
          AltGrCaption = '{'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 510
          Y = 80
          Caption = #199
          AltGrCaption = '}'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 0
          Y = 120
          Caption = 'Shift'
          KeyValue = 160
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 50
          SpecialKey = skShift
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 50
          Y = 120
          Caption = '<'
          ShiftCaption = '>'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 90
          Y = 120
          Caption = 'Z'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 130
          Y = 120
          Caption = 'X'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 170
          Y = 120
          Caption = 'C'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 210
          Y = 120
          Caption = 'V'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 250
          Y = 120
          Caption = 'B'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 290
          Y = 120
          Caption = 'N'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 330
          Y = 120
          Caption = 'M'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 370
          Y = 120
          Caption = ','
          ShiftCaption = ';'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 410
          Y = 120
          Caption = '.'
          ShiftCaption = ':'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 450
          Y = 120
          Caption = '-'
          ShiftCaption = '_'
          KeyValue = -1
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 40
          SpecialKey = skNone
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 490
          Y = 120
          Caption = 'Shift'
          KeyValue = 161
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 110
          SpecialKey = skShift
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 0
          Y = 160
          Caption = 'Ctrl'
          KeyValue = 162
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 60
          SpecialKey = skCtrl
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 60
          Y = 160
          Caption = 'Alt'
          KeyValue = 18
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 60
          SpecialKey = skAlt
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 120
          Y = 160
          KeyValue = 32
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 360
          SpecialKey = skSpaceBar
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 480
          Y = 160
          Caption = 'Alt Gr'
          KeyValue = 0
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 60
          SpecialKey = skAltGr
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end
        item
          X = 540
          Y = 160
          Caption = 'Ctrl'
          KeyValue = 163
          ShiftKeyValue = -1
          AltGrKeyValue = -1
          Height = 40
          Width = 60
          SpecialKey = skCtrl
          BorderColor = 13546913
          BorderColorDown = 13546913
          Color = 16249582
          ColorDown = 16249582
          TextColor = 12670976
          TextColorDown = 12670976
          ImageIndex = -1
        end>
      SmallFont.Charset = DEFAULT_CHARSET
      SmallFont.Color = clWindowText
      SmallFont.Height = -9
      SmallFont.Name = 'Tahoma'
      SmallFont.Style = []
      Version = '1.2.7.0'
    end
  end
  inherited RzGroupBox4: TRzGroupBox
    Left = 785
    Height = 530
    ExplicitLeft = 785
    ExplicitHeight = 530
    inherited TBAcciones: TRzToolbar
      Left = 9
      Width = 40
      Height = 509
      BorderColor = clWhite
      ExplicitLeft = 20
      ExplicitWidth = 40
      ExplicitHeight = 509
      ToolbarControls = (
        TB1
        TB2
        TB3
        TB4
        btnVer
        RzSpacer1
        TB6
        TB7
        TB8
        RzSpacer2
        TB9
        TB10)
      inherited TB1: TRzToolButton
        Left = 0
      end
      inherited TB2: TRzToolButton
        Left = 0
        ExplicitLeft = 0
      end
      inherited TB3: TRzToolButton
        Left = 0
        ExplicitLeft = 0
      end
      inherited TB4: TRzToolButton
        Left = 0
        ExplicitLeft = 0
      end
      inherited btnVer: TRzToolButton
        Left = 0
        ExplicitLeft = 0
      end
      inherited TB6: TRzToolButton
        Left = 0
        ExplicitLeft = 0
      end
      inherited RzSpacer1: TRzSpacer
        Left = 16
        ExplicitLeft = 16
      end
      inherited TB7: TRzToolButton
        Left = 0
        ExplicitLeft = 0
      end
      inherited TB8: TRzToolButton
        Left = 0
        ExplicitLeft = 0
      end
      inherited TB9: TRzToolButton
        Left = 0
        ExplicitLeft = 0
      end
      inherited TB10: TRzToolButton
        Left = 0
        ExplicitLeft = 0
      end
      inherited RzSpacer2: TRzSpacer
        Left = 16
        ExplicitLeft = 16
      end
    end
  end
  inherited Acciones: TActionList
    Left = 728
    Top = 456
    inherited AcSalvar: TAction
      OnExecute = AcSalvarExecute
    end
    inherited AcBorrar: TAction
      OnExecute = AcBorrarExecute
    end
    object AcCheckCliente: TAction
      Caption = 'AcCheckCliente'
      Hint = 'Obtener la informaci'#243'n del cliente de la central'
      ImageIndex = 27
      OnExecute = AcCheckClienteExecute
    end
  end
  inherited Imagenes: TImageList
    Bitmap = {
      494C01011D002200080024002400FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000900000002001000001002000000000000088
      02000000000000000000000000000000000000000000FEFEFE00FEFEFE000000
      0000FCFCFC00FEFEFE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00FEFEFE00FDFDFD00FDFDFD00FEFEFE00FEFEFE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000FEFEFE00FDFD
      FD0000000000FEFEFE00E8E8E800C3C3C300B6B6B600ACACAC00A4A4A400A3A3
      A300A4A4A400ABABAB00B1B1B100B9B9B900D3D3D300E6E6E600F9F9F900FEFE
      FE0000000000000000000000000000000000FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD0000000000EEEE
      EE0070707000737373007C7C7C00868686008A8A8A008D8D8D00949494009797
      97009A9A9A00A0A0A000A3A3A300A5A5A500A9A9A900AAAAAA00A8A8A800A1A1
      A100ACACAC00ACACAC00ACACAC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F7F7F7009292
      9200878787007F7F7F007E7E7E00878787008A8A8A008E8E8E00959595009999
      99009C9C9C00A2A2A200A4A4A400A7A7A700ABABAB00ACACAC00BEBEBE00C3C3
      C300ACACAC00ACACAC00ACACAC00D3D3D3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00F9F9F900E5E5E5007B7B
      7B008F8F8F007F7F7F0080808000898989008D8D8D0091919100989898009B9B
      9B009E9E9E00A5A5A500A7A7A700ACACAC00ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00ACACAC00ACACAC00F4F4F40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00E8E8E800D0D0D0007B7B
      7B009191910085858500838383008D8D8D0091919100949494009C9C9C00A0A0
      A000ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00ACACAC00ACACAC00C4C4C40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00E4E4E400CDCDCD007E7E
      7E009393930087878700848484008E8E8E0092929200969696009E9E9E00A2A2
      A200A5A5A500ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00E3E3E300D1D1D1008484
      8400959595008A8A8A00858585008F8F8F009393930099999900A3A3A300A3A3
      A300ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00CECECE0000000000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EEEEEE00EAEAEA00A7A7
      A7009696960090909000878787009191910097979700A1A1A100AEAEAE00ABAB
      AB00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00D4D4D40000000000FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00F8F8F800F7F7F700C8C8
      C8009595950093939300898989009191910098989800A3A3A300B1B1B100ADAD
      AD00AAAAAA00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00DDDDDD00FEFEFE00FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FDFDFD00FEFEFE00EFEF
      EF0091919100969696008A8A8A009292920098989800A2A2A200B0B0B000ACAC
      AC00AAAAAA00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00E8E8E800FEFEFE00FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000FCFCFC00FEFE
      FE00818181009C9C9C009292920093939300979797009C9C9C00A6A6A600A7A7
      A700AAAAAA00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00ACACAC00ACACAC00C1C1C100FCFCFC00FEFEFE00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FEFEFE00FDFD
      FD0097979700919191009B9B9B0091919100969696009B9B9B00A3A3A300A5A5
      A500AEAEAE00ACACAC00ACACAC00B6B6B600D8D8D800DCDCDC00DADADA00ACAC
      AC00ACACAC00ACACAC00ACACAC00C9C9C900BDBDBD00FEFEFE00FDFDFD00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00DBDBDB00838383009C9C9C009191910095959500909090009D9D9D00A6A6
      A600A9A9A900ACACAC00C0C0C000DBDBDB00939393008A8A8A00A0A0A000CACA
      CA00ACACAC00ACACAC00C2C2C200C3C3C300BEBEBE00FEFEFE00FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD0000000000D5D5D50098989800A2A2A20091919100A3A3A300ADAD
      AD00B1B1B100BFBFBF006D6D6D005F5F5F006D6D6D007171710079797900A7A7
      A70092929200ACACAC00BABABA00DBDBDB00FEFEFE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFEFE00FCFCFC0000000000A3A3A3009393930092929200A2A2A200ABAB
      AB00B0B0B0006C6C6C00616161006A6A6A006C6C6C0070707000777777007E7E
      7E00A5A5A500B9B9B900E7E7E700FEFEFE00FDFDFD0000000000FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFD00FDFDFD00C1C1C10094949400ACACAC00ACAC
      AC00959595005C5C5C0068686800686868006C6C6C0070707000787878008D8D
      8D00BCBCBC00E0E0E000FEFEFE00FDFDFD00FEFEFE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FEFEFE00FDFDFD0000000000BABABA009292
      920081818100646464006767670069696900717171007B7B7B007A7A7A007A7A
      7A00767676007070700000000000FCFCFC00FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000FDFDFD0000000000F9F9
      F9009C9C9C0065656500676767006767670082828200818181007F7F7F008484
      84008787870085858500E0E0E00000000000FCFCFC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000FBFBFB000000
      0000E1E1E1006464640065656500717171008787870084848400898989008E8E
      8E008F8F8F0091919100A8A8A800FEFEFE00FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FDFD
      FD00FDFDFD0062626200868686009393930092929200979797009B9B9B00A2A2
      A200A3A3A300A4A4A40099999900D0D0D000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FB00000000007373730093939300939393009B9B9B00A0A0A000A5A5A500ACAC
      AC00ADADAD00AEAEAE00A5A5A500BDBDBD0000000000FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FCFCFC000000
      0000D2D2D200878787009898980095959500A2A2A200A8A8A800AEAEAE00B4B4
      B400B6B6B600B6B6B600B2B2B200B6B6B600F9F9F900FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F2F2F2005050
      50006D6D6D00939393009C9C9C009F9F9F00B0B0B000B6B6B600B9B9B900BCBC
      BC00BDBDBD00BEBEBE00BDBDBD00B6B6B600E7E7E700FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FCFCFC008D8D8D003E3E
      3E0087878700959595009E9E9E00A4A4A400B5B5B500B9B9B900BCBCBC00C1C1
      C100C2C2C200C2C2C200C0C0C000B8B8B800E1E1E100FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00FEFEFE003F3F3F005A5A
      5A008E8E8E009B9B9B00A0A0A000A8A8A800B7B7B700BBBBBB00BEBEBE00C4C4
      C400C5C5C500C5C5C500C5C5C500BCBCBC00DEDEDE00FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFB00FEFEFE00383838004242
      4200484848004F4F4F0097979700B0B0B000BABABA00BDBDBD00C0C0C000CECE
      CE00D2D2D200D3D3D300D0D0D000C6C6C600E0E0E000FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00000000003B3B3B004545
      450046464600555555009A9A9A00AFAFAF00BABABA00BDBDBD00C5C5C500D2D2
      D200D3D3D300D3D3D300D0D0D000C6C6C600E4E4E400FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFB00000000003E3E3E004545
      4500484848005454540097979700AEAEAE00B8B8B800C1C1C100CACACA00CFCF
      CF00D1D1D100D2D2D200CFCFCF00C6C6C600EAEAEA00FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00000000003C3C3C004545
      4500484848006060600093939300AAAAAA00C0C0C000C4C4C400C6C6C600C7C7
      C700CACACA00CCCCCC00C5C5C500C9C9C900FCFCFC00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFB0000000000383838004545
      45004242420079797900848484008C8C8C00B4B4B400B9B9B900BDBDBD00C5C5
      C500B0B0B00093939300B4B4B400D9D9D900FEFEFE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFB00FEFEFE00333333004C4C
      4C00474747006D6D6D00A0A0A0007C7C7C00A7A7A700B1B1B100B0B0B0007272
      720051515100474747005A5A5A00E8E8E800FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE005F5F5F005C5C
      5C006B6B6B006C6C6C00646464006060600071717100888888009A9A9A00A2A2
      A2009B9B9B0096969600848484008C8C8C00FAFAFA00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00C9C9C9005E5E
      5E006E6E6E006868680060606000636363007171710073737300787878007E7E
      7E007F7F7F007B7B7B009F9F9F00EBEBEB00FEFEFE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE0000000000CFCF
      CF00808080004E4E4E0056565600626262007171710075757500797979007878
      78007F7F7F009C9C9C000000000000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE0000000000FCFC
      FC000000000000000000EAEAEA00BEBEBE00B7B7B700CFCFCF00EEEEEE000000
      00000000000000000000FEFEFE0000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FEFEFE0000000000FEFCFA00FFFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFDFC00FEFEFE00FDFDFD00FDFDFD00FEFE
      FE00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F8F8F800C4C4
      C400B6B6B600FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE0000000000FEFFFF00FEFDFD0000000000FDFFFF00F8E9D900F2C5
      9200F1B87900F0AF6700EFA75800EFA65600F0A65600F1AE6400F3B36E00F4BB
      7D00F8D5AE00FBE7D200FDF9F500FEFFFF000000000000000000000000000000
      0000FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F800C7C7C700969696009999
      990095959500D2D2D20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFFFF00F4F5F600E6E6E500DCDAD800D4D1
      CE00D1CECB00D2CFCD00D7D6D500E0E0E000EAECED00F6F8FA00FDFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00F5F5F500E5E5E500DADADA00D1D1D100CECECE00CFCFCF00D6D6D600E0E0
      E000EBEBEB00F8F8F800FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFDFD0000000000F7EFE500E26F0000E4770000E6800F00E98A
      2100EA8D2700EB902D00ED963900EE9A3E00EF9D4300F1A24D00F2A55200F2A7
      5700F3AB5E00F4AC6000F3AA5C00EAA35700F4AE6400F4AE6400F4AE64000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F7F7F700C7C7C7009393930095959500BFBFBF00E7E7
      E700BDBDBD0096969600F2F2F200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFFFF00EAE4DD00D2BEAB00C2A58900BA997700B7936F00B691
      6D00B6916C00B5916C00B4906D00B4927100B6977800B9A18800CCBFB700DCD8
      D400F1F3F5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00E3E3E300BEBE
      BE00A5A5A5009898980093939300919191009191910090909000909090009292
      920097979700A0A0A000C0C0C000D8D8D800F3F3F30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FEFEFE00F6F8F900E4953F00E78B2300E6831500E7821200E98A
      2200EA8E2800EC912F00EE983B00EF9B4100F09F4600F1A45100F2A75500F3A9
      5A00F4AD6100F4AE6400FAC08000FBC38B00F4AE6400F4AE6400F4AE6400E1CE
      CA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700C4C4C4009191910094949400C1C1C100E6E6E600F0F0F000F4F4
      F400E2E2E2009E9E9E00B3B3B300FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1D5C900CAA78300C49D7600C19A7300C19A7400C29B7500C29C
      7600C29C7600C19B7500C19A7300BF987100BE976E00BB926700DBB7A600C29C
      7D00B79C8200CBC6C200F3F5F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5D5D500A6A6A6009D9D
      9D009A9A9A009A9A9A009B9B9B009C9C9C009C9C9C009B9B9B009A9A9A009898
      98009696960091919100BDBDBD009E9E9E009C9C9C00C6C6C600F5F5F5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00F8FAFB00E8E5E300E17F1200E9923200E7831500E7841600EA8C
      2500EB902C00EC943300EE9A4000EF9E4600F0A14B00F2A75600F3A95A00F4AE
      6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE
      6400FFF8E5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6F6F600C3C3
      C3009191910095959500C0C0C000E6E6E600F1F1F100F2F2F200F7F7F700FAFA
      FA00F5F5F500CDCDCD0091919100D9D9D9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F9FA00D1B89E00C7A17A00C19B7500C49F7A00C6A27D00C8A47F00C8A5
      8000C8A48000C7A37E00C5A07C00C49E7900C29C7600C19B7500E6C6BC00CCA8
      8A00BD946900BA946E00B1A59900E3E6E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F800B7B7B700A0A0A0009B9B
      9B009F9F9F00A1A1A100A3A3A300A4A4A400A4A4A400A2A2A200A0A0A0009E9E
      9E009C9C9C009B9B9B00CDCDCD00AAAAAA009393930094949400A5A5A500E5E5
      E500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00E7E8E900D2D1CF00DF7F1500E9953700E8881F00E8861B00EB90
      2C00EC943300ED973A00F09E4700F1A24D00F4AE6400F4AE6400F4AE6400F4AE
      6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE
      6400FCC58D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F500C2C2C200909090009494
      9400C2C2C200E6E6E600F1F1F100F3F3F300F7F7F700F9F9F900F7F7F700F5F5
      F500F7F7F700EDEDED00B2B2B20099999900F7F7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F7F800D5BAA000C9A37D00C7A27E00CBA78300CEAB8800D1AE8C00D2B0
      8E00D2B08E00D0AD8B00CDA98600CAA58100C6A07A00CBA68500EACEC800CCAD
      9200C19B7300C49D7600C29B7400AFA49900F0F2F40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700BABABA00A3A3A300A2A2
      A200A7A7A700ABABAB00AEAEAE00B0B0B000B0B0B000ADADAD00A9A9A900A5A5
      A500A0A0A000A7A7A700D5D5D500AEAEAE009A9A9A009D9D9D009B9B9B00A4A4
      A400F2F2F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00E3E4E500CECDCE00DD811C00EA963A00E88B2400E8881D00EC91
      2E00ED953600EE993C00F0A14A00F2A45000F2A75600F4AE6400F4AE6400F4AE
      6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE
      6400F4AE64000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F5F5F500C1C1C1008E8E8E0094949400C3C3C300E8E8
      E800F1F1F100F3F3F300F8F8F800F9F9F900F7F7F700F5F5F500F6F6F600F6F6
      F600F6F6F600F8F8F800DDDDDD0098989800B7B7B70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEC5AC00CDA88200CDAA8600D3B08E00D7B69600DBBC9C00DDBE
      9F00DCBD9E00DABA9900D5B49200D0AE8B00CAA68000D8B79E00EAD1CD00C9AF
      9900C6A07900C6A07A00CAA37D00C6A48300D0C9C800F3EEF200EAE6E800E8E5
      E600E9E5E700ECE7E900F1ECEE00F8F3F600FFFBFD0000000000000000000000
      00000000000000000000000000000000000000000000C5C5C500A7A7A700A9A9
      A900B0B0B000B6B6B600BBBBBB00BEBEBE00BDBDBD00B9B9B900B3B3B300ADAD
      AD00A5A5A500B9B9B900D8D8D800B0B0B0009F9F9F00A0A0A000A3A3A300A4A4
      A400CBCBCB00F1F1F100E8E8E800E6E6E600E7E7E700E9E9E900EEEEEE00F5F5
      F500FDFDFD000000000000000000000000000000000000000000000000000000
      0000FCFCFC00E3E3E300CED1D500DB882B00EB983D00E98D2800E9891F00EB92
      3100ED963800EF9D4000F1A85100F2A65300F4AE6400F4AE6400F4AE6400F4AE
      6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE
      6400F4AE6400FDD09D0000000000FEFEFE00FEFEFE00FEFEFE00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F4F4F400BEBEBE008F8F8F0095959500C5C5C500E9E9E900F1F1F100F3F3
      F300F8F8F800F9F9F900F6F6F600F5F5F500F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F7F7F700F4F4F400C7C7C7008F8F8F00DEDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5D0BC00D3AF8A00D4B18F00DABA9900E1C2A400E6C9AC00E8CC
      B100E8CBAF00E4C6A900DEBE9F00D7B69400D2AE8B00E6CABC00E5CECA00C7B2
      9F00CBA57E00CAA57F00CAA47E00D8B18E00869882005D8E7800618D76005F8A
      74005B8B73005D8C7400618E770069927D00799C8A0098B2A500B8CAC100E0E5
      E300FFFEFE0000000000000000000000000000000000D0D0D000AEAEAE00B1B1
      B100B9B9B900C2C2C200C9C9C900CCCCCC00CBCBCB00C6C6C600BEBEBE00B5B5
      B500AEAEAE00CECECE00D4D4D400B2B2B200A4A4A400A4A4A400A4A4A400B2B2
      B2008A8A8A007676760076767600747474007373730074747400777777007D7D
      7D008A8A8A00A5A5A500C1C1C100E2E2E200FEFEFE0000000000000000000000
      000000000000F0EFED00E2EAF300DDA96F00EA9A4000EA933300E98B2300ED94
      3400ED9B3D00EFA74F00F3B26700F2AF6000F4AE6400F4AE6400F4AE6400F4AE
      6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE
      6400F4AE6400FAD5AF0000000000FEFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F3F3F300BDBD
      BD008D8D8D0096969600C6C6C600EAEAEA00F1F1F100F4F4F400F8F8F800F9F9
      F900F6F6F600F4F4F400F5F5F500F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F7F7F700F7F7F700F9F9F900EBEBEB00ABABAB009B9B9B00FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFE3D700D8B59200DAB89700E1C2A300E9CCB000EFD4BA00F2D8
      BF00F1D7BE00ECD1B600E5C7AA00DDBC9B00DDBDA100ECD5CC00E0CBC500C6B3
      A300D0AA8400CEA98400CFA98400DAB695005A926E00348861004B8B6A005E90
      74003A8B63003E8B64003D8A64003D8A63003C896300478F6B0059997900629D
      7F008DB3A000F5F4F500000000000000000000000000E3E3E300B5B5B500B8B8
      B800C2C2C200CCCCCC00D4D4D400D8D8D800D7D7D700D1D1D100C7C7C700BCBC
      BC00BEBEBE00D9D9D900D0D0D000B4B4B400AAAAAA00A9A9A900A9A9A900B7B7
      B700737373005F5F5F006A6A6A00767676006262620064646400636363006363
      6300626262006B6B6B00797979007F7F7F00A0A0A000F4F4F400000000000000
      0000FEFEFE00FAF9F700F1F8FE00E8C9A700EB983E00EB963800EA8C2500EC94
      3500ED9D3E00F0A85300F5B46C00F3B16400F3AC5F00F4AE6400F4AE6400F4AE
      6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE
      6400F4AE6400FCDEBF00FEFFFF00FEFDFD000000000000000000000000000000
      000000000000000000000000000000000000FBFBFB00BEBEBE008C8C8C009797
      9700C8C8C800EBEBEB00F2F2F200F5F5F500F9F9F900F9F9F900F6F6F600F4F4
      F400F5F5F500F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F7F7F700F7F7
      F700F6F6F600F7F7F700F7F7F700F8F8F800D9D9D90092929200BEBEBE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FAF7F500DDBE9F00DEBD9C00E5C7AA00EDD1B700F3DAC200F7DE
      C700F6DDC600F1D7BD00E9CDB100E1C1A100E7CEBD00EDD7CF00DAC9C300C2B0
      9F00D5AF8900D2AC8700DAB28E00C7B49300478F6B00428E69006093780090A7
      9400418E6800478F6B0047906C0048906C0049916D0049926E004E96720061A2
      8200599B7A00B0C6BB00000000000000000000000000F7F7F700BEBEBE00BDBD
      BD00C7C7C700D1D1D100DADADA00DEDEDE00DDDDDD00D7D7D700CDCDCD00C1C1
      C100D0D0D000DBDBDB00CCCCCC00B0B0B000AFAFAF00ACACAC00B3B3B300AFAF
      AF006B6B6B00686868007979790099999900676767006B6B6B006B6B6B006C6C
      6C006D6D6D006D6D6D0072727200818181007A7A7A00BBBBBB00000000000000
      0000FEFEFE00FEFEFD00FEFFFF00F8F0E600EA943500EC993F00EA8D2800ED95
      3600EE9C3E00F0A75100F4B36900F3B06200F4AD5F00F4AE6400F4AE6400F4AE
      6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE
      6400F4AE6400FDE8D300FEFEFE00FEFEFC000000000000000000000000000000
      000000000000000000000000000000000000F1F1F10098989800C9C9C900EBEB
      EB00F2F2F200F3F3F300F9F9F900EEEEEE00F2F2F200F7F7F700F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F8F8F800F4F4F400C1C1C1008E8E8E00E4E4
      E400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EAD8C700DFBC9A00E7C9AC00EED3B800F4DBC200F7DF
      C800F6DEC600F2D8BE00EBCEB100EACDB100F2DACB00F3DBCE00D6C6C000BFAB
      9900DAB48E00D5B08C00E6BA98008EA4820040906B0045926C006E9A8200B3BA
      AB004B936F0048926E004A936F004C9571004F987400529B7700529C7800559D
      7A0068A88800A0C5B30000000000000000000000000000000000D8D8D800BCBC
      BC00C9C9C900D3D3D300DBDBDB00DFDFDF00DEDEDE00D8D8D800CECECE00CDCD
      CD00DDDDDD00DEDEDE00C9C9C900ABABAB00B4B4B400B0B0B000BDBDBD009191
      9100696969006B6B6B0083838300B2B2B2006F6F6F006D6D6D006E6E6E007070
      70007373730076767600777777007979790088888800B2B2B200000000000000
      0000FEFEFE0000000000FDFDFC00FEFEFE00E7851900ED9E4900EB953600ED96
      3700EE993E00EFA04600F1AA5700F3A95900F3AB6000F4AE6400F4AE6400F4AE
      6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE6400F4AE
      6400FCC18600FEFDFB00FEFEFE00FEFEFE000000000000000000000000000000
      00000000000000000000000000000000000000000000E6E6E600F0F0F000F2F2
      F200F5F5F500F9F9F900FBFBFB00CCCCCC00ADADAD00F0F0F000FAFAFA00F6F6
      F600F6F6F600F6F6F600F6F6F600F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F8F8F800F8F8F800FAFAFA00E8E8E800A3A3A300A0A0
      A000FCFCFC000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFAF900E4C8AC00E6C6A700EDD1B600F2D7BE00F4DA
      C200F3DAC100F1D5BB00EDCDAE00DBC8BA00C3C1C300C2C0C300BCB2AE00C1AA
      9300DDB89200E0B89300CEB59300509672004A94700048946F00729B8400CAC8
      BA00649F7E0048926E004E977300529B770058A17D005EA7840062AC880063AC
      890072B19300A4CAB70000000000000000000000000000000000FAFAFA00C8C8
      C800C6C6C600D1D1D100D7D7D700DADADA00DADADA00D5D5D500CDCDCD00C9C9
      C900C2C2C200C1C1C100B4B4B400AAAAAA00B7B7B700B9B9B900B2B2B2007272
      72006F6F6F006E6E6E0085858500C4C4C400808080006D6D6D00727272007676
      76007C7C7C0083838300878787008888880092929200B7B7B700000000000000
      000000000000FEFEFE00FEFEFE00FEFEFD00EB9A4000EB943500ED9E4800EC94
      3400EE993D00F09D4400F2A55200F1A75800FAB06100F4AE6400F4AE6400FAB8
      7100FFDFAB00FFE2B300FFE1AF00F4AE6400F4AE6400F4AE6400F4AE6400FCC9
      9600FBBE8000FEFFFF00FEFEFD00FEFEFE000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F8F8F800F9F9
      F900F2F2F200F3F3F300F9F9F900E7E7E700B1B1B100B9B9B900F1F1F100F8F8
      F800F6F6F600F6F6F600F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F8F8F800F8F8F800F8F8F800F8F8F800F9F9F900F8F8F800D4D4D4009090
      9000C4C4C4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F8F2EC00E5C7A900EACAAC00EED2B600F0D5
      BA00F0D4B900EECDAE00C6BBB10083A5C600749DC4006D97C000768FA900D0B1
      9300E5BC9700E3BB980074A07E00479672004F97730048946F00769B8500D3D0
      C2008CB0960045906C005198750058A07D0061AA87006CB5930072BC9A0075BE
      9C007DBE9F00C1DCCF000000000000000000000000000000000000000000F2F2
      F200C7C7C700CACACA00D2D2D200D5D5D500D4D4D400CDCDCD00BBBBBB00A4A4
      A4009C9C9C00969696008F8F8F00B1B1B100BDBDBD00BCBCBC00868686006F6F
      6F00737373006E6E6E0087878700CCCCCC009B9B9B006B6B6B00747474007C7C
      7C008686860091919100989898009A9A9A009E9E9E00CECECE00000000000000
      0000000000000000000000000000FDFDFC00F8DCBE00E8871C00ED9F4800EC94
      3400ED983B00EC933200EEA34800F0AA5800F1AE5E00F4AE6400FFC77C00FCE2
      B4007896AC00698CAA0085A4B900FFCE9300F4AE6400F4AE6400FAC58900FBC4
      8B00FABF8200FFFEFE00FEFEFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBFBFB00F7F7
      F700F7F7F700F2F2F200F7F7F700F2F2F200CFCFCF00BDBDBD00BEBEBE00FAFA
      FA00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800FAFAFA00F3F3F300BABA
      BA008D8D8D00E9E9E90000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F2EB00E8CBAF00E9C8A800EACC
      AF00DFC1A400C2AF9B0080A4C60077A0C600759ABE006891B8007792AC00E8BF
      9700E1BE980083A68300499975005299750050967300468F6C00769B8300DBDB
      C600BDCCB4004D8F6C004F9472005BA07E0068AF8E0077C09E007FCAA90084CD
      AC0090CDB100E9F3EE0000000000000000000000000000000000000000000000
      0000F1F1F100CBCBCB00C8C8C800CCCCCC00C1C1C100AEAEAE00A3A3A3009F9F
      9F00999999009090900091919100BFBFBF00BDBDBD008E8E8E00727272007575
      7500737373006B6B6B0086868600D4D4D400BFBFBF006D6D6D00717171007D7D
      7D008C8C8C009C9C9C00A6A6A600A9A9A900AFAFAF00EEEEEE00000000000000
      000000000000000000000000000000000000FEFDFC0000000000F7D7B300EE9B
      4100F0A45300EC943500F0A85300F3B06400F5B46C00CDC7AB00486D9300335E
      8E00456D970049709A0054799F00BFAA8E00B9897600F4AE6400FABB7B00FCDC
      BB00FEFFFF00FEFEFE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAFA
      FA00F9F9F900F5F5F500F3F3F300FAFAFA00DADADA00A3A3A30024242400BCBC
      BC0000000000F7F7F700F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F9F9F900F9F9F900FBFBFB00E5E5
      E5009E9E9E00A6A6A600FDFDFD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCF9F600E7D2BD00C8AA
      8D00BE9F820091A3B40076A0C900759ABE006C91B600698EB3007596B600A5AC
      B900A9C1BB004C9D7500559D7900539875004F9170004586650069907D00A5B6
      B500A6B7B60067927D00478767005898790068AC8C0079C0A00082CDAC0090D4
      B600AFDBC7000000000000000000000000000000000000000000000000000000
      000000000000F9F9F900D2D2D200AAAAAA009F9F9F00A2A2A2009F9F9F009999
      9900919191008E8E8E0095959500AEAEAE00B7B7B70074747400797979007575
      750070707000656565007C7C7C00B0B0B000B1B1B1007C7C7C00676767007878
      78008A8A8A009D9D9D00A9A9A900B3B3B300C5C5C50000000000000000000000
      0000000000000000000000000000FEFEFE00FEFEFE00FEFDFB0000000000EFA5
      5500ED963800ED953600F0A75100F2AF6200F4B369004A6C900035608F00436A
      9300426C970047709A0051779F00857B7C00CE938E00F6B77E00FCE8D300FEFF
      FF00FEFEFD0000000000FEFEFE00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00F9F9F900F9F9F900F2F2F200F9F9F900F6F6F6005B5B5B00171717003232
      3200F6F6F600FAFAFA00F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F9F9F900F9F9F900F9F9F900F9F9F900FAFAFA00F8F8
      F800D0D0D0008E8E8E00CBCBCB00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EBE1
      D800B9ADA200789DC100749ABF006B91B6007296B90080A3C50081A6C9007FA7
      CE0081A7CB005C9D8800549C7600519372004B886900457D5D0042726E003D68
      98003F6A9700466F900045796200508A6D0060A0820070B5960084C9AB009BD5
      BB00E8F4EE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E1E1E100ADADAD009C9C9C00999999009090
      900095959500A2A2A200A5A5A500A6A6A600A6A6A60080808000777777007272
      7200696969005F5F5F0060606000696969006A6A6A006C6C6C00606060006D6D
      6D008080800093939300A8A8A800B9B9B900EEEEEE0000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFDFC00FEFD
      FC00F4C38E00EB973C00F4AE6400F4AE6400C99A5E002D5B8C00416792003F67
      9200436B9700486F990052779F0090829600F4B48C00FFE5BD00FEFFFF00FEFE
      FD00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFBFB00F9F9F900F8F8F800F3F3F30000000000D1D1D100393939000B0B
      0B007777770000000000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900FCFC
      FC00F1F1F100B5B5B50091919100EEEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E5ECF3007399BD006A91B6007296BA007CA1C4007AA1C6007AA0C4007FA5
      C8008AAFD7007BA7BB005297720046886700467D61003F7154003D6A6C004069
      9300406990003F679500406B6F00477C5E00559073006AAA8C0085C2A600D6EB
      E100000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ECECEC0098989800909090009696
      9600A0A0A000A0A0A0009F9F9F00A4A4A400B0B0B0009F9F9F00737373006767
      670061616100565656005B5B5B006969690068686800696969005E5E5E006060
      6000727272008A8A8A00A4A4A400E0E0E0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FFFE
      FE00FEFDFC0000000000D1B9A600C6965C007E8382003C648D003E6792004068
      93004371A0004C7BAA004B7AAA00497AAB004376AA003D70A30000000000FCFD
      FD00FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FAFAFA00FAFAFA00F4F4F400F5F5F50000000000929292001D1D
      1D004D4D4D00EDEDED00FEFEFE00F8F8F800F8F8F800F8F8F800F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900FAFAFA00FAFA
      FA00FBFBFB00E1E1E1009A9A9A00ABABAB00FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFD007C9DBD00678EB300799EC200799FC4006D8EAD006A89A6006D8D
      AA007596B4008EB2D600C0D4D20075A1890042775C0032654700376369003C62
      8D003B6289003B628C003C657D0043735900457E620065A18400D1E6DC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC009C9C9C008D8D8D009D9D
      9D009E9E9E008D8D8D00888888008C8C8C0095959500B2B2B200CCCCCC008A8A
      8A005C5C5C004A4A4A00565656006363630062626200636363005F5F5F005A5A
      5A006161610083838300DBDBDB00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000FEFEFD0000000000FCFAF6008B9DAE003D648F003F6691003E67
      91005682B0005481AF00507FAE005784B3005A87B4005885B400D5E0EC000000
      0000FCFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00FAFAFA00FAFAFA00F3F3F300FBFBFB00EFEFEF00ABAB
      AB008B8B8B005A5A5A00FAFAFA00FDFDFD00F8F8F800F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900FAFAFA00F9F9F900F9F9F900FAFAFA00FAFAFA00FAFA
      FA00FCFCFC00F7F7F700CBCBCB008D8D8D00D2D2D20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084A2C0006F97BD00799FC4007CA2C6007EA2C50086ADD0008BB1
      D40088ADCD0088B0D400D0DEEC0000000000BAC3BE008CA39200507482003157
      8000355B800034587E00375977003C6B550070A08700E1EEE800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A2A2A200969696009E9E
      9E00A1A1A100A1A1A100ABABAB00B0B0B000ABABAB00AEAEAE00DEDEDE000000
      0000BEBEBE00959595006C6C6C00585858005A5A5A0058585800575757005454
      540087878700E7E7E70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE0000000000FBFBFB0000000000D8E1EA003B638E003D648F004571
      9F005C87B4005684B3005D89B700628EBB00638FBC006691BD0087A8CB00FEFE
      FE00FDFDFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC00FAFAFA00F8F8F800F4F4F40000000000DCDC
      DC0036363600070707008D8D8D00F9F9F900FBFBFB00F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FCFCFC00EDEDED00B0B0B00095959500F2F2F200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ACBDCB006A90B400799FC3007DA3C70081A7CB0087ADD0008BB1D30090B6
      D70095BBDD0092BBDE00BDD4E900DFDCDA003D3A3A00A7A6AA006E8DAD00476B
      8F004D7094004161820030343900323834009497950000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCBCBC008F8F8F009E9E9E00A2A2
      A200A6A6A600ACACAC00AFAFAF00B4B4B400B9B9B900B9B9B900D3D3D300DCDC
      DC003B3B3B00A7A7A7008D8D8D006B6B6B007070700061616100343434003434
      3400959595000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FDFDFD00FDFDFD00346291005986B4006A93
      BC006792BF006D97C300719BC70079A1CC007AA2CD007BA3CE006D99C600BDD0
      E500FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFB00FBFBFB00F5F5F500F7F7F7000000
      0000828282002525250017171700B4B4B400FAFAFA00FBFBFB00F9F9F900F9F9
      F900F9F9F900FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FCFCFC00FCFCFC00DDDDDD0097979700B1B1B100FEFEFE000000
      000000000000000000000000000000000000000000000000000000000000CED6
      DB004D7291006382A1007DA2C60081A7CB0086ACCF008CB2D40092B8D9009ABF
      DE009EC4E2009DC5E500B2CEE5005957560026232000384B5E00406387003B5A
      7A0039597800456A8F003D4D5E003E3A38004342420094949400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D5D5D5007070700082828200A1A1A100A6A6
      A600ABABAB00B0B0B000B6B6B600BDBDBD00C1C1C100C2C2C200CCCCCC005757
      5700232323004B4B4B00636363005A5A5A00585858006A6A6A004D4D4D003A3A
      3A00424242009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFC00000000004273A6006B93BD006993
      BE00719AC600779FCA007CA4CF0085ABD40086ADD60087ADD6007CA5D000A0BD
      DC0000000000FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFD00FBFBFB00FAFAFA00F4F4F400FEFE
      FE00EDEDED004E4E4E00161616004C4C4C00D8D8D80000000000FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBFB
      FB00FBFBFB00FBFBFB00FDFDFD00F6F6F600C6C6C6008F8F8F00D7D7D7000000
      0000000000000000000000000000000000000000000000000000000000007F96
      A200527899007595B60082A8CC0086ACCE008BB1D40093B8D9009EC4E100AACF
      E700AED3EB00B2D7F100A3C0D6003A38360037393B004D7093004A6E9400486E
      930042678B00395C7F003D5E7F003B3C3D005B5A59004A4A4A00D5D5D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000929292007676760095959500A7A7A700AAAA
      AA00B0B0B000B6B6B600C1C1C100CACACA00CECECE00D3D3D300BDBDBD003838
      380039393900707070006E6E6E006D6D6D00666666005C5C5C005E5E5E003C3C
      3C005A5A5A004A4A4A00D5D5D500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FCFDFD0000000000D1D2D3005987B7007198C0006A94
      C10079A2CC0081A8D10087ADD6008EB4DC0090B5DD0090B5DD008BB1DA0093B6
      DB00F7F9FC00FEFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00FCFCFC00F8F8F800F6F6
      F60000000000B8B8B800303030000D0D0D007E7E7E00F2F2F200FEFEFE00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FDFDFD00EBEBEB00ACACAC0099999900F7F7
      F700000000000000000000000000000000000000000000000000000000006280
      9000365F79004F7692006E95B6008DB3D60092B8DA008FB2CD00A7CBE100AECF
      DF00C1E1EE00C4E6F700BDDAEE005A5856003C4753005B83AC00577DA3005378
      9E004E759A004A709700426990003A3F44004E4C4A00515151008D8D8D000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B005A5A5A007272720093939300B2B2
      B200B6B6B600AFAFAF00C6C6C600C9C9C900DADADA00E0E0E000D7D7D7005858
      580047474700838383007D7D7D00787878007474740070707000696969003F3F
      3F004C4C4C00515151008D8D8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00F3F2F1004E505300426D98006A93BE00749CC600759F
      CA008AB0D80090B5DE0092B8E10095BCE50096BDE60097BDE70096BCE5008DB5
      E000DAE7F400FCFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FCFCFC00FCFCFC00F5F5
      F500F9F9F9000000000077777700232323001C1C1C00B8B8B800FDFDFD00FBFB
      FB00FAFAFA00FAFAFA00FAFAFA00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FCFCFC00FDFDFD00D5D5D500AEAEAE00F4F4
      F400000000000000000000000000000000000000000000000000000000006284
      95002A556B002B546700648BAA0094B9DC0095BBDC00A2C7E400B5DAEE00CDED
      F600D6F3F900CCEBF700CBE5F700B4B0AD00485B6F00668FB7006388AE006085
      AA00597FA40052789E004B7299003F5973003D3E3E0051515000727272000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007E7E7E004E4E4E004C4C4C0088888800B8B8
      B800B9B9B900C4C4C400D4D4D400E5E5E500EBEBEB00E4E4E400E2E2E200B0B0
      B0005B5B5B008E8E8E0088888800858585007E7E7E0078787800727272005959
      59003D3D3D005050500072727200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FCFCFC00908D8A00303E4D005787B9006C95C000759EC8007BA3
      CE0090B4DC0092B8E10095BBE40099C0EA009AC1EB009AC1EC0099BFE9008EB7
      E300D0E1F200FDFDFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00FCFCFC00FAFA
      FA00F5F5F50000000000E6E6E60045454500141414004B4B4B00DBDBDB00FEFE
      FE00FAFAFA00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FAFAFA00FBFBFB00FEFEFE000000000000000000F6F6F600FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000006A8C
      9E002F5D7400325C70005A839F009BC0E3009ABFE000A4C9E600B5D9EF00D0EC
      F700D5F1F900C9E8F600CADFED00F5F3F3007190B0007197BD007599BF007195
      BA006A8FB5005F84A900557BA10042678C0039434D004D4B4A00737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008686860055555500545454007E7E7E00BFBF
      BF00BDBDBD00C6C6C600D4D4D400E6E6E600EAEAEA00E2E2E200DCDCDC00F3F3
      F300909090009797970099999900959595008F8F8F00848484007B7B7B006767
      6700434343004B4B4B0073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00FEFEFE00433F3C00475A6E005D8EC0006E9BC90077A0CB0080A7
      D10091B7DF0094BAE30097BDE7009BC3EE009CC4F0009CC5F0009EC4ED0092BB
      E700CADEF200FDFDFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00FDFD
      FD00F9F9F900F6F6F60000000000AAAAAA002B2B2B0009090900A8A8A8000000
      0000FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FEFEFE00FDFDFD00E6E6E600FDFDFD00FBFBFB0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000082A1
      B10031637B00386479004171880080A8C9009EC3E400A4C9E900B3D5EF00C9E4
      F600CFEAF900C3E1F500E5EDF500F7F8F80083A5C70082A6CA007A9BBC0082A5
      C8007193B5006E93B8005F85AB004B7094003F4B56004D4C4A00898989000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C005A5A5A005C5C5C0068686800A5A5
      A500C1C1C100C7C7C700D2D2D200E1E1E100E6E6E600DDDDDD00EDEDED00F7F7
      F700A5A5A500A6A6A6009B9B9B00A5A5A5009393930093939300858585006F6F
      6F004A4A4A004B4B4B0089898900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFBFB00FEFEFE00383838004342410046484A00514F4E007497BB0087AF
      DA0093B9E20096BDE60098C0EA00A8CEF500AFD2F700B0D3F800AECFF400A1C6
      ED00CDE0F400FDFDFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00FDFDFD00F6F6F600FCFCFC00FDFDFD006C6C6C0060606000CBCBCB00FEFE
      FE00FCFCFC00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FDFDFD00FCFC
      FC00E9E9E90000000000EDEDED00E9E9E900F6F6F60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A7BC
      C60030637C0044778E00457B9200477D9500598CA7005E90AB005F91AA006294
      AD006B9BB5006A9EBA00D3E2E900FBFAFB008FAECE0098BADD0097B9DC0093B6
      D90085A8CA007DA3CA006B94BE005473920051504F0057575600B3B3B3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8B8B8005A5A5A006D6D6D00707070007373
      73008484840088888800888888008B8B8B009393930096969600DFDFDF00FAFA
      FA00AEAEAE00BABABA00B9B9B900B6B6B600A7A7A700A3A3A300949494007373
      73005050500056565600B3B3B300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00000000003C3C3B00454545004747460054555800769AC00087AE
      D80093B9E20095BCE6009FC4EC00AFD2F600AFD3F800AFD2F800AED0F400A0C6
      EE00D3E4F500FDFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FDFDFD00FBFBFB00F5F5F500FEFEFE00F0F0F000E1E1E100C5C5C500EEEE
      EE00FDFDFD00FBFBFB00FBFBFB00FBFBFB00FEFEFE00FBFBFB00E5E5E500FEFE
      FE00EAEAEA00EAEAEA00F6F6F600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7EC
      EE004B7E96003D7994004B849D004D88A1004D8AA2004E8DA5005090A9004E91
      AB00468FAA005C9DB600D0E2E900FEFCFC009BBBDB00A5CAEF00A9CDF200A6CB
      F10093B7DC00718CA7005B6F8400505C69005D5C5B005E5E5E00E4E4E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EBEBEB00757575006E6E6E00797979007C7C
      7C007D7D7D008080800083838300838383007F7F7F008F8F8F00DEDEDE00FCFC
      FC00BBBBBB00CACACA00CDCDCD00CBCBCB00B7B7B7008C8C8C006F6F6F005C5C
      5C005C5C5C005E5E5E00E4E4E400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFBFB00000000003E3E3E004545450048484800535456007497BB0086AE
      D80091B7E1009CC1E700A9CAED00ACCFF400AED1F600AFD2F700ADCEF200A0C5
      ED00DEEAF700FCFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00FDFDFD00F8F8F800F8F8F800FEFEFE00F9F9F900D3D3D300EBEB
      EB00FDFDFD00FBFBFB00FEFEFE00FAFAFA00E8E8E80000000000EEEEEE00E9E9
      E900F9F9F900FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEE9ED0079A6B9004C8BA600498CA8004C90AC004E94B0004F96B2005EA0
      BA009FC7D600F4F8FA0000000000DDDDDD0069737D007D91A50088A0B9007C90
      A4005D636A0052504F00555350005B5958006061610084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E6E6E6009D9D9D007F7F7F007F7F
      7F0082828200868686008787870092929200BEBEBE00F7F7F70000000000DDDD
      DD007373730091919100A0A0A000909090006363630050505000525252005959
      5900606060008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00000000003C3C3C00454545004848480063615E007893AE007DA9
      D800A0C0E200A3C3E600A5C6E900A4C7EB00A3CAF200A3CCF7009FC4EC00A9C9
      EA00FBFCFD00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FEFEFE00F6F6F600FBFBFB00FCFCFC00FBFBFB00FCFC
      FC00FEFEFE00F8F8F800E9E9E90000000000EAEAEA00EAEAEA00F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEEBEF00AECDD90096BCCC0098BECD00B9D3DD00EDF4
      F6000000000000000000F3F3F30068686800504E4C0054525000555452005856
      54005F5E5D0066666600676767006868680063636300D7D7D700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E800C6C6
      C600B4B4B400B6B6B600CDCDCD00F2F2F2000000000000000000F3F3F3006868
      68004E4E4E005252520053535300565656005E5E5E0066666600676767006868
      680063636300D7D7D70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFBFB00000000003838380045454500424242007B7A78007D848B00678C
      B3008DB4DD0095B9DF0098BCE4009BC4F1008EAFD3007D93AA008BB3DE00C0D8
      F300FFFFFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FEFEFE00FBFBFB00F6F6F600FBFBFB0000000000F7F7
      F700E9E9E90000000000EAEAEA00EAEAEA00FAFAFA00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009B9B9B00555555006C6C6C0071717100727272007676
      760077777700777777007575750069696900AEAEAE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009B9B9B005555
      55006C6C6C007171710072727200767676007777770077777700757575006969
      6900AEAEAE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFBFB00FEFEFE00333333004C4C4C00474747006D6D6D00A2A19F007A7C
      7E008CA6C30087B0DC0089AFD90065727F00515151004A474400515A6400E0E8
      F100FFFFFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FEFEFE00FAFAFA00F2F2F200EAEAEA000000
      0000EBEBEB00E9E9E900FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E9E9E900ADADAD0082828200787878007A7A7A007D7D
      7D007C7C7C00787878007B7B7B00BBBBBB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9E9E900ADAD
      AD0082828200787878007A7A7A007D7D7D007C7C7C00787878007B7B7B00BBBB
      BB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FEFEFE005F5F5F005C5C5C006B6B6B006C6C6C00646464006060
      6000717171008B8986009C9B9900A2A2A3009B9B9B0096969600848585008C8C
      8C00FAFAFA00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FEFEFE00FDFDFD00F9F9F900ECECEC00EAEA
      EA00FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300CBCBCB00ABABAB00A3A3
      A300A5A5A500BCBCBC00ECECEC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F3F300CBCBCB00ABABAB00A3A3A300A5A5A500BCBCBC00ECECEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00C9C9C9005E5E5E006E6E6E0068686800606060006363
      63007171710073737400787878007E7E7E007F7F7F007B7B7B009F9F9F00EBEB
      EB00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000FEFEFE0000000000FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE0000000000CFCFCF00808080004E4E4E00565656006262
      6200717171007575750079797900787878007F7F7F009C9C9C00000000000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE0000000000FCFCFC000000000000000000EAEAEA00BEBE
      BE00B7B7B700CFCFCF00EEEEEE00000000000000000000000000FEFEFE000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9F9F900F0F0F000E7E7E700DEDEDE00DADADA00DADADA00DDDD
      DD00E5E5E500EFEFEF00F7F7F700FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900F0F0F000E7E7
      E700DEDEDE00DADADA00DADADA00DDDDDD00E5E5E500EFEFEF00F7F7F700FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00EAEAEA00D3D3D300C4C4C400C2C2C200CCCCCC00E0E0E000F7F7
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00EAEAEA00D3D3D300C4C4
      C400C2C2C200CCCCCC00E0E0E000F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00EDEDED00D5D5
      D500AFAFAF008A8A8A006D6D6D005E5E5E005959590058585800595959005B5B
      5B005D5D5D006666660080808000A2A2A200C7C7C700E4E4E400F6F6F600FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB00EDEDED00D5D5D500AFAFAF008A8A8A006D6D6D005E5E
      5E005959590058585800595959005B5B5B005D5D5D006666660080808000A2A2
      A200C7C7C700E4E4E400F6F6F600FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEEE
      EE00BEBEBE0096969600868686007A7A7A00717171007070700082828200B1B1
      B100E8E8E8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEEEEE00BEBEBE0096969600868686007A7A
      7A00717171007070700082828200B1B1B100E8E8E80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300D5D5D5009E9E9E006565
      65005151510060606000808080009C9C9C00ACACAC00B8B8B800BCBCBC00BBBB
      BB00B6B6B600A2A2A200666666004B4B4B00565656007B7B7B00B7B7B700E3E3
      E300F9F9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F3F300D5D5D5009E9E9E00656565005151510060606000808080009C9C
      9C00ACACAC00B8B8B800BCBCBC00BBBBBB00B6B6B600A2A2A200666666004B4B
      4B00565656007B7B7B00B7B7B700E3E3E300F9F9F90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1F1F100ACAC
      AC0083838300787777005B5D5E004E53560050555A0051555A00494E51004C4E
      4F0096969600F2F2F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F1F1F100ACACAC0083838300777777005C5C5C005252
      520055555500555555004D4D4D004D4D4D0096969600F2F2F200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFDFDF008A8A8A00666666007D7D
      7D00939393009A9A9A009F9F9F00A7A7A700B1B1B100B8B8B800BBBBBB00BABA
      BA00BABABA00B8B8B8008A8A8A0074747400858585007E7E7E0072727200A6A6
      A600EDEDED000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DFDFDF008A8A8A00666666007D7D7D00939393009A9A9A009F9F9F00A7A7
      A700B1B1B100B8B8B800BBBBBB00BABABA00BABABA00B8B8B8008A8A8A007474
      7400858585007E7E7E0072727200A6A6A600EDEDED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAFAFA00F5F5F500F5F5F500FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000D1D1D1008B8B
      8B0072727100393E4000433D3F0076574700956A4B00976C4D0080604F005A51
      5100373C4000A8A9A90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAFAFA00F5F5
      F500F5F5F500FAFAFA0000000000000000000000000000000000000000000000
      00000000000000000000D1D1D1008B8B8B00717171003D3D3D003F3F3F005C5C
      5C006E6E6E007070700065656500545454003B3B3B00A8A8A800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6E6E60084848400696969007C7C7C008383
      83009C9C9C00C0C0C000DEDEDE00EAEAEA00EDEDED00EBEBEB00E7E7E700E2E2
      E200DDDDDD00D9D9D900BFBFBF00959595008585850096969600ADADAD00A4A4
      A400B7B7B700F8F8F80000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E6E6
      E60084848400696969007C7C7C00838383009C9C9C00C0C0C000DEDEDE00EAEA
      EA00EDEDED00EBEBEB00E7E7E700E2E2E200DDDDDD00D9D9D900BFBFBF009595
      95008585850096969600ADADAD00A4A4A400B7B7B700F8F8F800000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00E8E8E800CDCDCD00B9B9B900ADADAD00ACACAC00B7B7B700D2D2D200F2F2
      F200000000000000000000000000000000000000000000000000D5D5D5008585
      85002D3133003F2A2200B67A3F00E4B75E00EACA6900E8C76500DDB05500BC7D
      3B006C4A390043474900E7E7E700000000000000000000000000000000000000
      0000000000000000000000000000FCFCFC00E8E8E800CDCDCD00B9B9B900ADAD
      AD00ACACAC00B7B7B700D2D2D200F2F2F2000000000000000000000000000000
      00000000000000000000D5D5D50085858500303030002E2E2E007A7A7A00A8A8
      A800B4B4B400B1B1B100A0A0A0007C7C7C004F4F4F0046464600E7E7E7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D3D3D3007F7F7F005757570066666600A6A6A600E2E2
      E200FBFBFB00FCFCFC00FCF9FB00F9F3F800F3ECF100EDE5EA00E7DFE500E1D9
      DE00DBD4D900D5D0D300D0CFD000D0D0D000CFCFCF00BABABA00A2A2A200B5B5
      B500C9C9C900BDBDBD00F1F1F100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3D3D3007F7F
      7F005757570066666600A6A6A600E2E2E200FBFBFB00FCFCFC00FAFAFA00F6F6
      F600F0F0F000E9E9E900E3E3E300DDDDDD00D8D8D800D2D2D200CFCFCF00D0D0
      D000CFCFCF00BABABA00A2A2A200B5B5B500C9C9C900BDBDBD00F1F1F1000000
      0000000000000000000000000000000000000000000000000000FBFBFB00D3D3
      D300A5A5A50094949400909090008E8E8E008F8F8F009090900095959500B6B6
      B600ECECEC000000000000000000000000000000000000000000F0F0F0005E61
      630023171400C2854600EFD66F00E8D97000E4D36C00E2CF6800E0CD6400E0C4
      5800CB883600422A21009FA3A500000000000000000000000000000000000000
      00000000000000000000FBFBFB00D3D3D300A5A5A50094949400909090008E8E
      8E008F8F8F009090900095959500B6B6B600ECECEC0000000000000000000000
      00000000000000000000F0F0F000606060001A1A1A0084848400BCBCBC00BBBB
      BB00B6B6B600B3B3B300B0B0B000A9A9A900838383002F2F2F00A2A2A2000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF00858585006868680081818100E2E2E200000000000000
      0000FFFCFF00F3EDF100CCD5CD009FBDA6007EAE8A006DA77C006AA57A006FA4
      7E0082A78B009DAFA000B9B9B800C8BFC500C1BBBF00B8B8B800C4C4C400BDBD
      BD00B7B7B700D0D0D000BFBFBF00F1F1F1000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00858585006868
      680081818100E2E2E2000000000000000000FEFEFE00F0F0F000CFCFCF00ABAB
      AB009292920085858500838383008585850091919100A4A4A400B8B8B800C4C4
      C400BEBEBE00B8B8B800C4C4C400BDBDBD00B7B7B700D0D0D000BFBFBF00F1F1
      F100000000000000000000000000000000000000000000000000E4E4E400A8A8
      A8008F8F8F007D7D7D006D6D6D00656565006667670075757500909090009797
      9700BFBFBF00F8F8F80000000000E4E4E400B4B4B400979797008F8F8F002C30
      330074482A00F0CF8000E6D78500E0CB7000DBC36000D7BD5900D6BB5900D9C3
      6A00EDCD900067402C00565A5D00000000000000000000000000000000000000
      00000000000000000000E4E4E400A8A8A8008F8F8F007D7D7D006D6D6D006565
      650066666600757575009090900097979700BFBFBF00F8F8F80000000000E4E4
      E400B4B4B400979797008F8F8F002F2F2F004C4C4C00BFBFBF00C0C0C000B3B3
      B300AAAAAA00A4A4A400A3A3A300ACACAC00C3C3C30046464600595959000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDC008181810078787800B8B8B800FDFDFD0000000000FFFEFF00E5E6
      E40089B5930037974F00149638000DA039000FAB400010B0450010B0460011AF
      460012AA460016A14400259549004D9261008C9E9000B4ADB100B4B0B300BEBE
      BE00CFCFCF00BFBFBF00CCCCCC00C2C2C200F9F9F90000000000000000000000
      000000000000000000000000000000000000DCDCDC008181810078787800B8B8
      B800FDFDFD0000000000FEFEFE00E5E5E5009B9B9B005F5F5F004B4B4B004C4C
      4C00535353005757570057575700575757005656560053535300565656006A6A
      6A0093939300B0B0B000B2B2B200BEBEBE00CFCFCF00BFBFBF00CCCCCC00C2C2
      C200F9F9F9000000000000000000000000000000000000000000D9D9D9007E7E
      7E004E4E4E00494D5000565A5E00616368005F60650050555900505456008B8B
      8B00A9A9A900DCDCDC00CCCCCC004B4B4B00343434006A6A6A008A8B8B003D3C
      3E009D684000EFDB9800E5D59800E5D59C00E4D49C00E4D49E00E6D6A600F1E6
      BF00E1C29D003C2C2300272A2B00D9D9D9000000000000000000000000000000
      00000000000000000000D9D9D9007E7E7E004E4E4E004C4C4C005A5A5A006464
      64006161610054545400535353008B8B8B00A9A9A900DCDCDC00CCCCCC004B4B
      4B00343434006A6A6A008A8A8A003D3D3D006C6C6C00CBCBCB00C6C6C600C7C7
      C700C6C6C600C7C7C700CBCBCB00DCDCDC00C0C0C0002E2E2E0029292900D9D9
      D90000000000000000000000000000000000000000000000000000000000F5F5
      F5008A8A8A0072727200CECECE000000000000000000FAF6F9008CB796001A92
      390004A232000FB6440018C1510016BE520016B04F001FA45200289F5600289F
      57001EA5540019B5570018BF5B0016B95500149F46003B8C56009CA69E00CBC3
      C800CCCCCC00DADADA00C3C3C300C3C3C300CECECE0000000000000000000000
      0000000000000000000000000000F5F5F5008A8A8A0072727200CECECE000000
      000000000000F8F8F8009D9D9D004C4C4C004848480058585800636363006262
      62005C5C5C005C5C5C005F5F5F005F5F5F005D5D5D0061616100666666006161
      6100535353005F5F5F00A0A0A000C7C7C700CCCCCC00DADADA00C3C3C300C3C3
      C300CECECE000000000000000000000000000000000000000000A3A3A300282A
      2B00393C4100634F47008F664900A9754800AA73440095674700705D57004B4F
      52009E9E9E00AEAEAE004444440072727200F5F5F500F5F5F500DFDFDF005B5F
      61006B402800F0CA9600EFE3B400ECDFB500ECE0BA00F1E5C300FAEECE00E4D0
      B200645345001D202100111010004A4A4A00ECECEC0000000000000000000000
      00000000000000000000A3A3A300292929003C3C3C00535353006A6A6A007777
      7700757575006B6B6B00616161004E4E4E009E9E9E00AEAEAE00444444007272
      7200F5F5F500F5F5F500DFDFDF005E5E5E0046464600C5C5C500D7D7D700D5D5
      D500D7D7D700DDDDDD00E7E7E700CCCCCC00545454001F1F1F00101010004A4A
      4A00ECECEC00000000000000000000000000000000000000000000000000B4B4
      B40065656500C9C9C9000000000000000000E2E6E200409A5700009F2B000EBD
      480018C4540011C2540015AC510045976700819C8D00AAAFAC00BCBABC00BFBD
      BF00A9B1AD00739884003899650018B360001DCB6C0015BF5E00139846007DA3
      8900DED4DA00DBDBDB00E3E3E300C2C2C200BBBBBB00EAEAEA00000000000000
      0000000000000000000000000000B4B4B40065656500C9C9C900000000000000
      0000E3E3E30065656500434343005B5B5B0065656500626262005B5B5B006B6B
      6B008E8E8E00ACACAC00BBBBBB00BEBEBE00ADADAD0085858500676767006363
      63007171710066666600505050008D8D8D00D9D9D900DBDBDB00E3E3E300C2C2
      C200BBBBBB00EAEAEA00000000000000000000000000F1F1F1003E404100201E
      200089543100D9A25200EAC86800EBD26D00EAD06B00E3BF5D00CE8E3F007657
      46006E7376009191910024242400C0C0C0008F8F8F0042424200252525002223
      2400201D1D0078503800C6A48100E1CBAB00E4D3B700D4C5AD00A0928100544D
      47003A3C3E002A2B2A0020201F001B1B1B006D6D6D00F4F4F400000000000000
      000000000000F1F1F1003F3F3F001F1F1F005A5A5A0099999900B3B3B300B8B8
      B800B7B7B700AAAAAA00898989005B5B5B00727272009191910024242400C0C0
      C0008F8F8F004242420025252500232323001E1E1E0055555500A3A3A300C7C7
      C700CFCFCF00C2C2C200919191004D4D4D003C3C3C002A2A2A001F1F1F001B1B
      1B006D6D6D00F4F4F40000000000000000000000000000000000F0F0F0006E6E
      6E00ABABAB000000000000000000D9E1DA002095400000B4390011C7510012C8
      560007C0520034A46300ACB1AE00EFD7E300F7E7EF00F5E9EE00F8EBF000FAED
      F200F4EFF100EAE3E600C8C0C50080A0910022A5650014CB710019CF710007A7
      4D006DA48000EDE4E900ECECEC00E7E8E700B9B9B900C7C7C700000000000000
      00000000000000000000F0F0F0006E6E6E00ABABAB000000000000000000DCDC
      DC00515151004F4F4F0063636300656565005D5D5D0069696900AEAEAE00E3E3
      E300EFEFEF00EEEEEE00F1F1F100F3F3F300F1F1F100E6E6E600C4C4C4009090
      90006464640070707000737373005353530085858500E8E8E800ECECEC00E7E7
      E700B9B9B900C7C7C700000000000000000000000000C0C1C10014161A008351
      2E00EBC16300E8D86E00E3D26900E0CC6400DDC85F00DBC55B00E0C45E00B37F
      3F0040404300A9AAAA004747470036363600535353009D9D9D00D8D8D800EBEB
      EB003B3C3C000E1114002A262400413933004A454000494645004F5051005E60
      61004F4F4F00313130001C1C1B003B3B3B000D0D0D0057575700E9E9E9000000
      000000000000C0C0C0001616160056565600AFAFAF00BABABA00B4B4B400B0B0
      B000ACACAC00A9A9A900ABABAB007B7B7B0041414100A9A9A900474747003636
      3600535353009D9D9D00D8D8D800EBEBEB003B3B3B0011111100262626003939
      39004545450046464600505050005F5F5F004F4F4F00303030001B1B1B003B3B
      3B000D0D0D0057575700E9E9E900000000000000000000000000B7B7B7007878
      7800FAFAFA0000000000E6E9E6002295420000BB3D000EC953000EC9570005C1
      55005BA87D00D3CACF00CAEDDD0086E3B90057D69F004CD39A005ED4A4009CDB
      C200E4E5E500F8EEF200ECECEC00E2D9DD00ADB1B0002FA270000ECB760015D7
      7A0000AB4D0085B49600FFF5FB00FAFAFA00DCDCDC00ACACAC00F2F2F2000000
      00000000000000000000B7B7B70078787800FAFAFA0000000000E7E7E7005353
      53005252520063636300646464005E5E5E0080808000CECECE00DCDCDC00B6B6
      B60099999900939393009C9C9C00BDBDBD00E4E4E400F2F2F200ECECEC00DDDD
      DD00AFAFAF006B6B6B006F6F6F0077777700525252009A9A9A00FAFAFA00FAFA
      FA00DCDCDC00ACACAC00F2F2F20000000000000000009DA0A2002A181300DAA7
      6500E8DA8700E1CE7800DCC56800D9C06000D8BF6300DDC87C00EAD89A00B28B
      41001E1C1D008F8F9000C2C2C200C8C8C800FDFDFD0000000000000000000000
      0000939392000A0A0900232424002F3131004243440056575700646464006565
      650055555500383838001C1C1B005151510058585800575757008C8C8C000000
      0000000000009F9F9F001C1C1C00A2A2A200C3C3C300B7B7B700ADADAD00A8A8
      A800A8A8A800B5B5B500C9C9C9007F7F7F001D1D1D008F8F8F00C2C2C200C8C8
      C800FDFDFD000000000000000000000000009292920009090900232323003030
      30004343430056565600646464006565650055555500383838001B1B1B005151
      510058585800575757008C8C8C0000000000000000000000000083838300C8C8
      C80000000000FFF9FD004CA1630000B335000AC850000AC7540007C657004BAF
      780084BFA10037D187000ACD750005CD780009D080000BD185000AD2850008D1
      850032D19500B7DDCF00F7ECF000EBEBEB00E5E0E200B9B8B90029A26F0009B5
      6A001CAD690008974900BDD3C40000000000FBFBFB00B3B3B300D9D9D9000000
      0000000000000000000083838300C8C8C80000000000FCFCFC00707070004D4D
      4D006060600061616100616161007B7B7B00A1A1A100858585006E6E6E006E6E
      6E007373730075757500757575007474740088888800CBCBCB00F1F1F100EBEB
      EB00E2E2E200B8B8B8006868680062626200666666004D4D4D00C6C6C6000000
      0000FBFBFB00B3B3B300D9D9D90000000000000000009B9FA200422A1E00E9C5
      8700E4D59300E4D39900E4D49D00E4D4A100E6D7A900ECE1BE00EBD396007B5E
      2D0017161B0053545400CACACA00CACACA00E5E5E500F3F3F300F6F6F6000000
      0000D5D5D500191918001F1F1E002E2E2D003F3F3E00515151005F5F5F006565
      65005B5B5B0040403F00202020002C2C2B00A8A8A800939393007B7B7B000000
      0000000000009E9E9E002E2E2E00BCBCBC00C4C4C400C5C5C500C7C7C700C8C8
      C800CCCCCC00D9D9D900C6C6C600575757001818180053535300CACACA00CACA
      CA00E5E5E500F3F3F300F6F6F60000000000D5D5D500181818001E1E1E002D2D
      2D003E3E3E00515151005F5F5F00656565005B5B5B003F3F3F00202020002B2B
      2B00A8A8A800939393007B7B7B000000000000000000E8E8E80089898900FBFB
      FB0000000000A5C5AC0000A02A0006C84A0008C54E0007C7540010C45E0026C2
      6F0003CB670005CD6F000FCF7B0011D1820011D2870012D28A0012D38C0012D3
      8D0007D389000CCD8700A7D8C600F5ECF000EBEBEB00E9E4E600B0B5B300949F
      9B009BB0A70001B95D0032A05F00FCF6F90000000000D6D6D600C4C4C4000000
      000000000000E8E8E80089898900FBFBFB0000000000B2B2B200434343005D5D
      5D005E5E5E00606060006666660072727200676767006B6B6B00737373007676
      7600787878007A7A7A007B7B7B007B7B7B007676760075757500C1C1C100F0F0
      F000EBEBEB00E6E6E600B2B2B2009A9A9A00A6A6A6005D5D5D0065656500F9F9
      F90000000000D6D6D600C4C4C4000000000000000000CED1D20030221E00D7AB
      8000EDE1B100E8DBAF00E8DBB300EBDFBC00F0E7CA00F3E0B400A47F3C004035
      30002728290024252500B6B6B600CCCCCC00CDCDCD00CFCFCF00CDCDCD00D0D0
      D000C9C9C900434342001515140029292800393939004C4C4C005C5C5C006565
      65005F5F5F00474747002222210046464600BFBFBF004C4C4C00C4C4C4000000
      000000000000D0D0D00025252500ABABAB00D5D5D500D0D0D000D2D2D200D7D7
      D700E0E0E000D7D7D70075757500373737002828280024242400B6B6B600CCCC
      CC00CDCDCD00CFCFCF00CDCDCD00D0D0D000C9C9C90042424200141414002828
      2800393939004C4C4C005C5C5C00656565005F5F5F0047474700212121004646
      4600BFBFBF004C4C4C00C4C4C4000000000000000000D2D2D200B6B6B6000000
      0000F9F3F7002D98490000BB3A0006C2480007C24D0008C4530009C65A0006C8
      61000CC96A000DCB72000ECC7A000FCE800010CF850011CF870011D0890011D0
      8A0012D08A0005D287000CBA7900BDCCC700F0EBED00EBECEC00E6E4E500E9D9
      E00083C7A80000C8660000A74800A6C6B00000000000EFEFEF00C3C3C3000000
      000000000000D2D2D200B6B6B60000000000F6F6F6005A5A5A00515151005A5A
      5A005C5C5C005F5F5F0063636300656565006A6A6A006E6E6E00717171007474
      74007676760077777700787878007979790079797900747474006A6A6A00C5C5
      C500EDEDED00EBEBEB00E5E5E500E0E0E000A6A6A600646464004F4F4F00B4B4
      B40000000000EFEFEF00C3C3C300000000000000000000000000686A6D005F37
      2000DDB18000F0DAB100F3E2BE00F1DEB800DDBD8800916C3200493F36004848
      4A0033333300141414007E7E7E00DADADA00C1C1C10090909000757575007A7A
      7A00959595007171710015151400242423003434330046464600585857006363
      6300636363004E4E4E002D2D2C002F2F2F005858580086868600000000000000
      000000000000000000006A6A6A003C3C3C00AFAFAF00D3D3D300DBDBDB00D7D7
      D700B6B6B600656565003F3F3F004848480033333300141414007E7E7E00DADA
      DA00C1C1C10090909000757575007A7A7A009595950071717100141414002323
      230033333300464646005757570063636300636363004E4E4E002C2C2C002F2F
      2F005858580086868600000000000000000000000000CDCDCD00DCDCDC000000
      0000BACDBD000099280004C0420006BD450006BE4A0007C0510008C2580009C3
      5E000AC466000CC66E000DC775000EC97B000ECA80000FCA83000FCB84000FCB
      85000DCB840024B17C006F9D8C00C2C3C300E9E8E900E7E7E700ECECEC00EEE6
      EA003EB97F0000C5630000BA530046A06600FFFBFF00F9F9F900CFCFCF00FBFB
      FB0000000000CDCDCD00DCDCDC0000000000C1C1C10040404000575757005858
      58005A5A5A005D5D5D006060600063636300666666006A6A6A006D6D6D007070
      700072727200747474007474740075757500747474007070700088888800C2C2
      C200E8E8E800E7E7E700ECECEC00EAEAEA007C7C7C0062626200595959006E6E
      6E00FDFDFD00F9F9F900CFCFCF00FBFBFB000000000000000000E9E9E9002024
      26003825180077512D00896234007A562A0055412A004D4D4F00606164005051
      51003A3A3A001C1C1C003D3D3D00D5D5D500818181004A4A4A00A1A1A100BBBB
      BB00C5C5C500B8B8B800272727001C1C1B002E2E2E0040404000535353006161
      600064646400555554003636350022222100A1A1A100FDFDFD00000000000000
      00000000000000000000E9E9E9002323230027272700515151005F5F5F005353
      5300404040004D4D4D0061616100505050003A3A3A001C1C1C003D3D3D00D5D5
      D500818181004A4A4A00A1A1A100BBBBBB00C5C5C500B8B8B800272727001B1B
      1B002E2E2E004040400053535300606060006464640054545400353535002121
      2100A1A1A100FDFDFD00000000000000000000000000D7D7D700ECECEC00FFFE
      FF0078B0860000A5290004B93F0005B7420006B9470002B6460000B2480007BF
      590009BF61000AC068000BC26E000BC374000CC479000DC57C000DC57D000CC7
      7E0008C47B005FB69400E2DEDF00FDF1F600E8E6E700E4E5E500EEE9EC00D7E1
      DC0012B5670005C0610003BE580012974400E5E8E400FFFEFF00E0E0E000F8F8
      F80000000000D7D7D700ECECEC00FEFEFE008F8F8F0044444400545454005454
      54005757570054545400535353005F5F5F006363630066666600696969006B6B
      6B006D6D6D006F6F6F006F6F6F00707070006D6D6D008D8D8D00DFDFDF00F6F6
      F600E7E7E700E4E4E400EBEBEB00DCDCDC0064646400626262005D5D5D004F4F
      4F00E5E5E500FEFEFE00E0E0E000F8F8F800000000000000000000000000ABAB
      AB00010406001A1E22002B2E32003C3F440054575A0068686900646464005656
      5600414141002929290017171700AEAEAE005F5F5F00B3B3B300D8D8D8007A7A
      7A004F4F4F005E5E5E003A3A3A0019191800292929003B3B3A004E4E4D005E5E
      5D00646464005A5A5A003D3D3D0021212100C2C2C10000000000000000000000
      0000000000000000000000000000ABABAB00030303001E1E1E002E2E2E003F3F
      3F0057575700686868006464640056565600414141002929290017171700AEAE
      AE005F5F5F00B3B3B300D8D8D8007A7A7A004F4F4F005E5E5E003A3A3A001818
      1800292929003A3A3A004D4D4D005D5D5D00646464005A5A5A003D3D3D002121
      2100C1C1C10000000000000000000000000000000000E0E0E000F1F1F100FCF6
      FA0069AE7B000BB03D0000B0370005B23E0000B23C003AA36000589C7400009E
      410003B8550009BB60000ABB66000ABD6C000BBE70000BBE73000CBF75000CBF
      76000CBF760003C073001FC3800086D5B400E8E9E900F6EAF000F4EAEF00A0CD
      B80000B1550008BA5B0007BB550000963700C1D3C50000000000E7E7E700F6F6
      F60000000000E0E0E000F1F1F100F9F9F90086868600525252004D4D4D005151
      51004F4F4F0069696900787878004A4A4A005A5A5A0061616100636363006666
      660068686800696969006A6A6A006B6B6B006B6B6B006767670076767600AFAF
      AF00E8E8E800F0F0F000EFEFEF00B7B7B700575757005F5F5F005D5D5D004444
      4400C8C8C80000000000E7E7E700F6F6F6000000000000000000000000000000
      00005D5D5D000B0B0B002E2E2E00414141005151510063636300656565005B5B
      5B004747470031313100101011006F6F6F009191910075757500767676004B4B
      4B00B5B5B500A0A0A00049494800141414002525240035353400484848005A5A
      5900636363005D5D5D00484847001C1C1B005858580000000000000000000000
      0000000000000000000000000000000000005D5D5D000B0B0B002E2E2E004141
      41005151510063636300656565005B5B5B004747470031313100101010006F6F
      6F009191910075757500767676004B4B4B00B5B5B500A0A0A000484848001414
      140024242400343434004848480059595900636363005D5D5D00474747001B1B
      1B005858580000000000000000000000000000000000E2E2E200F2F2F200F2EF
      F10063AD76003DBD63000DAE3E0000AB340000A134009EB2A500FCEAF5008EB1
      9C000C92450000AB4B0008B65D0009B5610009B665000AB7690009B76A000AB7
      6C000AB86C000AB86C0004B6680000B3620020B9740097D3B700F9EAF2005CB9
      890000AE4D0007B1510006B34D0000943100A8C6AF0000000000EAEAEA00F6F6
      F60000000000E2E2E200F2F2F200F0F0F0008282820074747400535353004A4A
      4A0047474700A7A7A700F3F3F3009E9E9E004B4B4B00525252005E5E5E005F5F
      5F00616161006363630063636300646464006464640064646400606060005C5C
      5C006F6F6F00B5B5B500F1F1F1008A8A8A005353530058585800575757004141
      4100B4B4B40000000000EAEAEA00F6F6F6000000000000000000000000000000
      0000E7E7E700232323001F1E1E00393939004A4A4A005E5E5E00656565005F5F
      5F004E4E4E00383838001D1D1D002D2D2D00A7A7A7002F2F2F0047474700F8F8
      F800929292000C0C0C000A0A0A001717170020201F002F2F2E00424242005555
      54006262620062626200464646002121210029292900ECECEC00000000000000
      000000000000000000000000000000000000E7E7E700232323001E1E1E003939
      39004A4A4A005E5E5E00656565005F5F5F004E4E4E00383838001D1D1D002D2D
      2D00A7A7A7002F2F2F0047474700F8F8F800929292000C0C0C000A0A0A001717
      17001F1F1F002E2E2E0042424200545454006262620062626200464646002121
      210029292900ECECEC00000000000000000000000000E6E6E600F0EFF000EEEC
      ED0068AF7A0051C0700048BD6A0004A735002A934A00D3CBD100F3F3F300FFF5
      FB00C0C8C3002E905800009A400005AD540007AD5A0008AE5C0008AE5E0008AF
      600008AF600008AF600008AF600008AF5F0002AD590000AA520036B5730014AB
      590003AA4B0005A9480005AA4400008F2A009FC0A70000000000E7E7E700F6F6
      F60000000000E6E6E600EFEFEF00EDEDED0085858500808080007A7A7A004A4A
      4A0057575700CFCFCF00F3F3F300FAFAFA00C3C3C3005C5C5C00484848005757
      57005A5A5A005B5B5B005C5C5C005D5D5D005D5D5D005D5D5D005D5D5D005C5C
      5C005858580054545400747474005D5D5D005252520052525200515151003D3D
      3D00ACACAC0000000000E7E7E700F6F6F6000000000000000000000000000000
      000000000000A7A7A7000E0E0E002F2F2F004343430056565600646464006262
      6200535353003E3E3E002929290016161600131313000F0F0F002F2F2F00ACAC
      AC0037373700151515001E1E1E002020200021212100292928003A3A39004D4D
      4D005757570049494900303030002E2E2E0037373700E3E3E300000000000000
      00000000000000000000000000000000000000000000A7A7A7000E0E0E002F2F
      2F0043434300565656006464640062626200535353003E3E3E00292929001616
      1600131313000F0F0F002F2F2F00ACACAC0037373700151515001E1E1E002020
      20002121210028282800393939004D4D4D005757570049494900303030002E2E
      2E0037373700E3E3E300000000000000000000000000ECECEC00EBEAEB00F0ED
      EF0078B3860059BE75005FC17B0049B568008EAC9700E8E2E600E5E6E500EAEB
      EB00FEF9FC00EBE2E7006EA083000B94470004A44C0006A5500006A5520007A5
      530007A6540007A6540007A6530006A5530006A5510005A44E0000A1440004A2
      450005A1430004A03F0004A23C0000852300ACC6B100FFFCFF00E1E1E100F9F9
      F90000000000ECECEC00EAEAEA00EEEEEE009090900084848400898989007777
      77009B9B9B00E5E5E500E5E5E500EAEAEA00FBFBFB00E6E6E600858585004C4C
      4C00515151005353530054545400555555005555550055555500555555005454
      540054545400525252004C4C4C004E4E4E004D4D4D004B4B4B004B4B4B003838
      3800B6B6B600FEFEFE00E1E1E100F9F9F9000000000000000000000000000000
      000000000000000000005D5D5D00181818003B3B3B004E4E4E00606060006363
      630059595900454545002F2F2F001E1E1E001D1D1D001F1F1F00363636003131
      3100303030002F2F2F002A2A2A002B2B2B002D2D2D002F2F2F00333333003737
      370037373700353535003D3D3D004A4A4A001B1B1B00D0D0D000000000000000
      00000000000000000000000000000000000000000000000000005D5D5D001818
      18003B3B3B004E4E4E00606060006363630059595900454545002F2F2F001E1E
      1E001D1D1D001F1F1F003636360031313100303030002F2F2F002A2A2A002B2B
      2B002D2D2D002F2F2F00333333003737370037373700353535003D3D3D004A4A
      4A001B1B1B00D0D0D000000000000000000000000000F0F0F000E4E4E400F4F0
      F30090BA990066BD7C0064C07C0077B98900E2DFE100EFEFEF00E5E5E500E4E4
      E400E8E8E800ECF2EE00C0D7C800349C5C0000993C00059C4400059D4600059D
      4700059D4800059D4800059D4700059D4600059C4500059C4200049B3F00049A
      3D000499390003993600029A3300007C2100C4D1C600F4F0F400E1E1E1000000
      000000000000F0F0F000E4E4E400F2F2F200A1A1A1008A8A8A008A8A8A009393
      9300E0E0E000EFEFEF00E5E5E500E4E4E400E8E8E800EEEEEE00CACACA006464
      6400474747004C4C4C004D4D4D004D4D4D004E4E4E004E4E4E004D4D4D004D4D
      4D004C4C4C004B4B4B004A4A4A00494949004747470046464600454545003434
      3400C9C9C900F2F2F200E1E1E100000000000000000000000000000000000000
      00000000000000000000E0E0E0002D2D2D002D2D2D00454545005A5A5A006262
      62005C5C5C004C4C4C0033333300282828002B2B2B002C2C2C003A3A3A003C3C
      3C003B3B3B003535350037373700464646004A4A4A0047474700464646004A4A
      4A005151510057575700545454002525250000000000C5C5C500000000000000
      0000000000000000000000000000000000000000000000000000E0E0E0002D2D
      2D002D2D2D00454545005A5A5A00626262005C5C5C004C4C4C00333333002828
      28002B2B2B002C2C2C003A3A3A003C3C3C003B3B3B0035353500373737004646
      46004A4A4A0047474700464646004A4A4A005151510057575700545454002525
      250000000000C5C5C500000000000000000000000000F6F6F600DBDBDB00F4F1
      F300B3C9B70072BB830071BF8400B0C4B500F7EFF500FAF7F900EFEFEF00EDEB
      EC00D6D7D6001F823F00008D290001923300049338000493390004933B000494
      3C0003943C0003943C0003943C0004933B000493390004933800039236000391
      33000290310002902E00008D2700187A2F00E3E3E200E3E2E300E6E6E6000000
      000000000000F6F6F600DBDBDB00F2F2F200BBBBBB009090900091919100B8B8
      B800F3F3F300F8F8F800EFEFEF00ECECEC00D6D6D6004A4A4A003C3C3C004242
      4200454545004545450046464600464646004646460046464600464646004646
      46004545450045454500434343004242420041414100404040003C3C3C004040
      4000E2E2E200E2E2E200E6E6E600000000000000000000000000000000000000
      00000000000000000000000000006F6F6F001C1C1C003B3B3B00525252006161
      61005E5E5E00474747003434340036363600373737003D3D3D003D3D3D004242
      42004B4B4B005151510050505000464646005151510060606000626262005555
      5500444444002F2F2F000F0F0F000000000000000000D1D1D100000000000000
      0000000000000000000000000000000000000000000000000000000000006F6F
      6F001C1C1C003B3B3B0052525200616161005E5E5E0047474700343434003636
      3600373737003D3D3D003D3D3D00424242004B4B4B0051515100505050004646
      460051515100606060006262620055555500444444002F2F2F000F0F0F000000
      000000000000D1D1D10000000000000000000000000000000000D5D5D500EBEA
      EB00D8DDD90082B98E0085C39400B0CDB700A6CFB000C3DBC900FBF7FA00F4F4
      F400F6F0F4007B9F8600007318000088250000892C00028B2F00028B3100028C
      3100028C3200028C3200028C3100028B3100028B3000028B2E00028A2D000289
      2B0002892900028A2800007B1600528C5C00F1EBF000D5D5D500F2F2F2000000
      00000000000000000000D5D5D500EAEAEA00DADADA00989898009E9E9E00BCBC
      BC00B7B7B700CDCDCD00F9F9F900F4F4F400F3F3F3008A8A8A002E2E2E003939
      39003C3C3C003E3E3E003F3F3F003F3F3F0040404000404040003F3F3F003F3F
      3F003F3F3F003E3E3E003D3D3D003C3C3C003C3C3C003C3C3C00303030006868
      6800EEEEEE00D5D5D500F2F2F200000000000000000000000000000000000000
      00000000000000000000000000007D7D7D002323230036363600424242004949
      4900434343003E3E3E0041414100454545005252520051515100575757005D5D
      5D003E3E3E003636360025252500292929003E3E3E00434343004A4A4A003737
      370023232300161616000C0C0C00000000004747470000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007D7D
      7D0023232300363636004242420049494900434343003E3E3E00414141004545
      45005252520051515100575757005D5D5D003E3E3E0036363600252525002929
      29003E3E3E00434343004A4A4A003737370023232300161616000C0C0C000000
      0000474747000000000000000000000000000000000000000000E1E1E100D6D6
      D600F0EDEF00A4C3AB008AC4970086C594007FC18E0082BE9000DCE2DE00FAF7
      F900F7F7F600F8F2F6008EB09700268D420008882C0000812200008021000082
      2400008327000185290001862900008425000081230001832700018325000183
      2400018223000083210000681000AFBEB100E3E0E300D3D3D300FEFEFE000000
      00000000000000000000E1E1E100D6D6D600EEEEEE00B0B0B000A1A1A1009F9F
      9F009A9A9A009A9A9A00DEDEDE00F8F8F800F6F6F600F5F5F5009C9C9C005151
      51003E3E3E00363636003535350037373700383838003A3A3A003A3A3A003838
      380036363600393939003838380038383800373737003636360028282800B4B4
      B400E2E2E200D3D3D300FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000F0F0F0005C5C5C00474747004C4C4C004C4C
      4C0050505000575757005E5E5E006767670057575700262626001E1E1E003B3B
      3B0042424200313131001E1E1E0017171700595959008D8D8D007D7D7D005D5D
      5D002D2D2D00232323001D1D1D00101010004545450000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0F0
      F0005C5C5C00474747004C4C4C004C4C4C0050505000575757005E5E5E006767
      670057575700262626001E1E1E003B3B3B0042424200313131001E1E1E001717
      1700595959008D8D8D007D7D7D005D5D5D002D2D2D00232323001D1D1D001010
      1000454545000000000000000000000000000000000000000000F8F8F800C3C4
      C300ECEAEC00D6DCD70097C29F0096C9A10094C89F008CC4980099C6A300E8EA
      E900F9F6F800F8F8F800F8F2F600B7C7BA0076AD830053A4680031964B001588
      3400037F240000771A00006F1500107129002377390000771A00007919000079
      1900007A1900006C0B0044804E00EAE4E900CDCDCD00E7E7E700000000000000
      00000000000000000000F8F8F800C3C3C300EBEBEB00D8D8D800A8A8A800AAAA
      AA00A9A9A900A2A2A200ABABAB00E9E9E900F7F7F700F8F8F800F5F5F500BDBD
      BD008C8C8C00757575005B5B5B004545450037373700303030002C2C2C003838
      38004646460030303000303030003030300031313100272727005B5B5B00E7E7
      E700CDCDCD00E7E7E70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C2C2C200343434005D5D5D006969
      69006A6A6A006969690069696900575757004444440030303000121212003333
      33003C3C3C00343434001C1C1C002E2E2E00E4E4E4000000000000000000F9F9
      F9005E5E5E002E2E2E002A2A2A000A0A0A006D6D6D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C2C2C200343434005D5D5D00696969006A6A6A0069696900696969005757
      5700444444003030300012121200333333003C3C3C00343434001C1C1C002E2E
      2E00E4E4E4000000000000000000F9F9F9005E5E5E002E2E2E002A2A2A000A0A
      0A006D6D6D00000000000000000000000000000000000000000000000000DADA
      DA00CACACA00F2F0F200BFD0C2009DC7A5009FCCA8009CCAA60094C79F00A4CB
      AC00E5E9E600FAF7F900F9F9F900F6F3F500D8DAD900B2C4B6009CBAA30091B5
      990089B092008AAE9300A4B7A800B1BCB300569B65002D9043002F9044003091
      450031914500448A5100D2D7D300E3E0E200D1D1D100FEFEFE00000000000000
      0000000000000000000000000000DADADA00CACACA00F1F1F100C5C5C500ADAD
      AD00B1B1B100AEAEAE00A8A8A800B3B3B300E6E6E600F8F8F800F9F9F900F4F4
      F400D9D9D900B9B9B900A8A8A8009F9F9F009999990099999900ABABAB00B5B5
      B50072727200555555005656560057575700575757005F5F5F00D4D4D400E1E1
      E100D1D1D100FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000072727200000000001F1F
      1F0029292900333333004A4A4A005454540049494900393939002E2E2E002323
      23005454540051515100B4B4B400EFEFEF000000000000000000000000000000
      0000D3D3D300606060005555550081818100F2F2F20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000072727200000000001F1F1F0029292900333333004A4A4A005454
      540049494900393939002E2E2E00232323005454540051515100B4B4B400EFEF
      EF0000000000000000000000000000000000D3D3D30060606000555555008181
      8100F2F2F2000000000000000000000000000000000000000000000000000000
      0000BDBDBD00D8D7D800ECEBEC00B8CEBC00A6CCAC00A7CFAF00A4CEAC009CCA
      A500A3CBAA00D2E1D500F5F4F500FEFBFD00FEFAFD00F9F4F800F1ECF000F0EA
      EE00F9F0F700FDF7FB00CFE1D20082BC8F0077B784007BB7870077B5840070B1
      7D0069A27400C9D3CB00F0ECEF00CBCBCB00F2F2F20000000000000000000000
      000000000000000000000000000000000000BDBDBD00D7D7D700EBEBEB00C0C0
      C000B4B4B400B7B7B700B4B4B400AEAEAE00B2B2B200D8D8D800F4F4F400FCFC
      FC00FCFCFC00F7F7F700EFEFEF00EDEDED00F5F5F500FAFAFA00D6D6D6009999
      99009090900093939300909090008A8A8A007F7F7F00CDCDCD00EEEEEE00CBCB
      CB00F2F2F2000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00626262000606
      06001A1A1A002D2D2D00464646005555550048484800C0C0C000F8F8F800D2D2
      D200F5F5F500FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB0062626200060606001A1A1A002D2D2D00464646005555
      550048484800C0C0C000F8F8F800D2D2D200F5F5F500FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F3F300ACACAC00DDDDDD00ECECEC00BFD2C200ACCFB300AED3B500ACD2
      B300A7CFAE00A2CCAA00B0D2B700CEE1D200E2ECE400E8EFEA00E7EEE800DDE9
      DF00C1DBC6009BC7A40084BC8F0085BD900085BC900081BB8C0079B4840078AA
      8200C5D2C800F2EFF100CECECE00E5E5E5000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300ACACAC00DDDDDD00ECEC
      EC00C6C6C600BABABA00BCBCBC00BBBBBB00B6B6B600B2B2B200BDBDBD00D5D5
      D500E6E6E600EBEBEB00E9E9E900E1E1E100CBCBCB00ACACAC009A9A9A009B9B
      9B009B9B9B0098989800909090008C8C8C00CACACA00F0F0F000CECECE00E5E5
      E500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009D9D
      9D00131313002E2E2E003F3F3F004F4F4F0030303000E3E3E300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009D9D9D00131313002E2E2E003F3F3F004F4F
      4F0030303000E3E3E30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9E9E900ABABAB00E2E1E200F4F3F400CFDCD100B4D1B900B2D4
      B800B2D5B900B0D4B700AAD1B100A5CEAD00A5CDAC00A4CDAC00A1CBAA009BC8
      A40096C69F0096C69F0097C6A00094C59D008EC1980086B88F0096BA9D00DAE0
      DB00F5F2F500CFCFCF00E0E0E000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900ABABAB00E1E1
      E100F3F3F300D4D4D400BFBFBF00BFBFBF00C0C0C000BEBEBE00B9B9B900B5B5
      B500B4B4B400B4B4B400B2B2B200ADADAD00A9A9A900A9A9A900A9A9A900A7A7
      A700A2A2A20099999900A4A4A400DCDCDC00F4F4F400CFCFCF00E0E0E0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000636363001C1C1C002F2F2F00373737006E6E6E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000636363001C1C1C002F2F2F003737
      37006E6E6E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EEEEEE00B6B6B600DEDDDE00FDFCFD00E8ECE900C7DA
      CB00B8D4BD00B5D5BB00B5D6BB00B4D6BA00B2D5B800AED3B500ACD2B300AAD1
      B100A8D0AF00A4CDAC009FC9A7009AC4A100A0C3A700C2D4C600F5F4F500F0EE
      F000CCCCCC00E3E3E30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEEEEE00B6B6
      B600DDDDDD00FCFCFC00E9E9E900CECECE00C3C3C300C1C1C100C2C2C200C1C1
      C100BFBFBF00BCBCBC00BBBBBB00B9B9B900B7B7B700B4B4B400AFAFAF00AAAA
      AA00AEAEAE00C9C9C900F4F4F400EFEFEF00CCCCCC00E3E3E300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F4F4F400A8A8A80097979700C1C1C100F8F8F80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4F4F400A8A8A80097979700C1C1
      C100F8F8F8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F9F9F900C8C8C800D0D0D000F8F7F800FFFE
      FF00EDF2EE00D5E3D700C4D9C800BBD5C000B7D3BC00B4D2BA00B2D1B700AFD0
      B500AECEB400B1CEB700BDD3C100D8E3DA00F6F7F600FCFAFC00DDDDDD00CCCC
      CC00EFEFEF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F900C8C8C800D0D0D000F7F7F700FEFEFE00EFEFEF00DADADA00CCCCCC00C5C5
      C500C2C2C200C0C0C000BEBEBE00BCBCBC00BABABA00BCBCBC00C5C5C500DCDC
      DC00F6F6F600FBFBFB00DDDDDD00CCCCCC00EFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900D5D5D500E5E5
      E500FAF9FA0000000000FEFEFE00F6F9F700EEF3EF00E9EFEA00E7EEE800E9EF
      EA00F0F4F100FAFBFB0000000000F9F7F900E2E1E100CCCCCC00DDDDDD00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9E9E900D5D5D500E5E5E500F9F9F90000000000FEFEFE00F7F7
      F700F0F0F000EBEBEB00E9E9E900EBEBEB00F1F1F100FAFAFA0000000000F8F8
      F800E1E1E100CCCCCC00DDDDDD00FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F2F2
      F200E6E6E600E5E5E500ECECEC00F3F2F300F7F6F700FAF8F900FBF9FA00F9F8
      F900F6F5F600EEEEEE00DCDCDC00D2D2D200E3E3E300FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F2F2F200E6E6E600E5E5E500ECECEC00F2F2
      F200F6F6F600F9F9F900FAFAFA00F8F8F800F5F5F500EEEEEE00DCDCDC00D2D2
      D200E3E3E300FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00F7F7F700F2F2F200EFEFEF00EDEDED00EDEDED00EFEF
      EF00F2F2F200F5F5F500FAFAFA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F7F7F700F2F2
      F200EFEFEF00EDEDED00EDEDED00EFEFEF00F2F2F200F5F5F500FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00F5F5F500F5F5F500F0F0F000E9E9E900E3E3E300E4E4E400ECECEC00F7F7
      F700FCFCFC00FBFBFB00FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFCFC00F5F5F500F5F5F500F0F0F000E9E9
      E900E3E3E300E4E4E400ECECEC00F7F7F700FCFCFC00FBFBFB00FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00D2D2D200939494007374
      7400828283009D9C9C0097979600888787007877770067666600636263007372
      72009A9A9A00CDCECE00E4E4E400E7E7E700F4F4F400FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00D2D2D2009393930073737300828282009C9C9C00969696008787
      8700777777006666660062626200727272009A9A9A00CDCDCD00E4E4E400E7E7
      E700F4F4F400FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00E7E7E7009192920043424200413B39005B4F
      49007561580081695D00856A5D0082665900786054006E594F00594A42003D36
      3300232121002E2D2D0091919100C9C9C900CECECE00E4E4E400F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00E7E7
      E70091919100424242003C3C3C0051515100646464006D6D6D006E6E6E006B6B
      6B00646464005C5C5C004C4C4C0037373700212121002D2D2D0091919100C9C9
      C900CECECE00E4E4E400F9F9F900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00F8F8F800F6F5
      F500E4E3E300D8D8D800D9D9D900DEDEDE00E3E3E300E8E8E800ECECEC00F0F0
      F000F3F3F300F6F6F600F8F8F800F9F9F900FBFBFB00FCFCFC00FDFDFD00FDFD
      FD00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB00F8F8F800F5F5F500E3E3E300D8D8D800D9D9D900DEDE
      DE00E3E3E300E8E8E800ECECEC00F0F0F000F3F3F300F6F6F600F8F8F800F9F9
      F900FBFBFB00FCFCFC00FDFDFD00FDFDFD00FEFEFE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2E3E30094959500635A5600826C6100B3938400C8A0
      8F00CBA59400CFAA9A00CBA89800B6948000B3958200B9978300CA9D8900B889
      7600896A5C003A2D270017161600A5A6A600BFBFBF00C3C3C300E1E1E100FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2E2E2009494
      94005B5B5B006F6F6F0098989800A7A7A700ACACAC00B1B1B100AEAEAE009898
      9800989898009B9B9B00A5A5A500929292006F6F6F002F2F2F0016161600A5A5
      A500BFBFBF00C3C3C300E1E1E100FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A6A6006164
      670094939200A8A6A500AAA7A500AAA9A800ADADAD00B4B4B400BBBBBB00C2C2
      C200C8C8C800CECECE00D4D4D400D9D9D900DEDEDE00E2E2E200E6E6E600E9E9
      E900ECECEC00EFEFEF00F1F1F100F3F3F300F5F5F500F7F7F700F8F8F800FAFA
      FA00FCFCFC00FDFDFD00FEFEFE00000000000000000000000000000000000000
      00000000000000000000A5A5A5006464640093939300A6A6A600A7A7A700A9A9
      A900ADADAD00B4B4B400BBBBBB00C2C2C200C8C8C800CECECE00D4D4D400D9D9
      D900DEDEDE00E2E2E200E6E6E600E9E9E900ECECEC00EFEFEF00F1F1F100F3F3
      F300F5F5F500F7F7F700F8F8F800FAFAFA00FCFCFC00FDFDFD00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FAFAFA00B7B7B70093868000A68A7B00BBA79900BFAFA4009F8B
      7C00B4A79A00D6CBC300CDC1B600DED3CC00D8CBC400CABBB200C9B6AC00C6A2
      9100E5C0B100CDA69500503A300075727100C4C4C400B8B8B800CDCDCD00F4F4
      F400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00B7B7B7008888
      88008E8E8E00A9A9A900B0B0B0008C8C8C00A7A7A700CCCCCC00C1C1C100D4D4
      D400CDCDCD00BDBDBD00B9B9B900A8A8A800C7C7C700ADADAD003E3E3E007272
      7200C4C4C400B8B8B800CDCDCD00F4F4F4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3E2E2003E42
      46003A596E00688B9D008B9CA300AFB3B500C6C3C100C5C1BE00BABABA00BBBB
      BB00BCBCBC00BFBFBF00C2C2C200C5C5C500C9C9C900CDCDCD00D0D0D000D4D4
      D400D8D8D800DBDBDB00DEDEDE00E1E1E100E4E4E400E7E7E700EAEAEA00EDED
      ED00F0F0F000F4F4F400F9F9F900FDFDFD00FEFEFE0000000000000000000000
      00000000000000000000E2E2E20042424200555555008585850098989800B2B2
      B200C3C3C300C1C1C100BABABA00BBBBBB00BCBCBC00BFBFBF00C2C2C200C5C5
      C500C9C9C900CDCDCD00D0D0D000D4D4D400D8D8D800DBDBDB00DEDEDE00E1E1
      E100E4E4E400E7E7E700EAEAEA00EDEDED00F0F0F000F4F4F400F9F9F900FDFD
      FD00FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000FCFDFD009C918D0096817500C2B4AB00B5AB9F00B8B0A800B9B2
      A900C1B9B000C2BBB000DCD6CF00E7DDD800D5CAC100CFC2BB00C7BCB600BDB0
      A600D9C6BC00F5E2DA00CAB0A50085756F00BDBFC000BABABA00D1D1D100F5F5
      F500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00939393008484
      8400B5B5B500AAAAAA00B0B0B000B1B1B100B8B8B800B9B9B900D5D5D500DEDE
      DE00CACACA00C4C4C400BDBDBD00B1B1B100C9C9C900E5E5E500B5B5B5007878
      7800BEBEBE00BABABA00D1D1D100F5F5F5000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E8EA
      EA00AED2E6005C94BB00568AA8005C879B007A9AAB00B7C8D800F7F4F000EAE8
      E700E3E3E300E0E0E000DDDDDD00DBDBDB00DADADA00D9D9D900D9D9D900D9D9
      D900D9D9D900DBDBDB00DCDCDC00DEDEDE00DFDFDF00E1E1E100E3E3E300E6E6
      E600E9E9E900EEEEEE00F4F4F400F9F9F900FDFDFD0000000000000000000000
      0000000000000000000000000000E9E9E900CCCCCC008E8E8E00828282007F7F
      7F0095959500C7C7C700F3F3F300E8E8E800E3E3E300E0E0E000DDDDDD00DBDB
      DB00DADADA00D9D9D900D9D9D900D9D9D900D9D9D900DBDBDB00DCDCDC00DEDE
      DE00DFDFDF00E1E1E100E3E3E300E6E6E600E9E9E900EEEEEE00F4F4F400F9F9
      F900FDFDFD000000000000000000000000000000000000000000000000000000
      000000000000FEFFFF00A9918700A7948800DFD9D500D2CBC600C6BEB700CBC3
      BD00E1DDDC00D5D0CB00D5D2CC00DFDCD800D0C6C000C2B8B000C1B7AF00D1C5
      C000D7CCC600E5D8D300DACAC400997D7200C1C4C400CECECE00EAEAEA00FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00959595009696
      9600D9D9D900CBCBCB00BEBEBE00C3C3C300DEDEDE00D0D0D000D1D1D100DBDB
      DB00C7C7C700B8B8B800B7B7B700C7C7C700CDCDCD00DADADA00CDCDCD008282
      8200C3C3C300CECECE00EAEAEA00FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EDFAFE00A1CDE4006DA3CB00699BBF002577B200076AB4008EB5D7000000
      000000000000FEFEFE00FCFCFC00FAFAFA00F9F9F900F6F6F600F5F5F500F3F3
      F300F1F1F100EFEFEF00EDEDED00ECECEC00EBEBEB00EBEBEB00EBEBEB00ECEC
      EC00EDEDED00F1F1F100F6F6F600FAFAFA00FDFDFD0000000000000000000000
      000000000000000000000000000000000000F7F7F700C6C6C6009E9E9E009696
      96006F6F6F0061616100B3B3B3000000000000000000FEFEFE00FCFCFC00FAFA
      FA00F9F9F900F6F6F600F5F5F500F3F3F300F1F1F100EFEFEF00EDEDED00ECEC
      EC00EBEBEB00EBEBEB00EBEBEB00ECECEC00EDEDED00F1F1F100F6F6F600FAFA
      FA00FDFDFD000000000000000000000000000000000000000000000000000000
      000000000000F8F7F600B8998C00C1B1A500C6BFB900E2DEDF00D7D1CF00AFA7
      9C00D3BEA900DBD0C400D6D5D100E8E6E300D9D4CF00DBD7D400C8C2BC00BFB6
      AF00D5CEC900D7CECA00E9DAD400AB8B7F00E3E4E500F3F3F300FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F7009F9F9F00B2B2
      B200BFBFBF00DFDFDF00D2D2D200A6A6A600BEBEBE00CFCFCF00D4D4D400E5E5
      E500D4D4D400D7D7D700C2C2C200B6B6B600CECECE00CFCFCF00DDDDDD009191
      9100E4E4E400F3F3F300FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFFFF00CDE9F400A4CCDF003A92DD00127DE3000E71C600036BB3006FA1
      CB00FCFDFE000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FCFCFC00FBFBFB00FBFBFB00FAFAFA00F9F9
      F900F9F9F900FBFBFB00FCFCFC00FEFEFE00FEFEFE0000000000000000000000
      000000000000000000000000000000000000FEFEFE00E3E3E300C5C5C5008D8D
      8D007B7B7B006C6C6C00606060009E9E9E00FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FCFC
      FC00FBFBFB00FBFBFB00FAFAFA00F9F9F900F9F9F900FBFBFB00FCFCFC00FEFE
      FE00FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F3EFED00AF918300D0C4BE00D7C9B800C7AA7F00BC976500CABB
      AA00AD753300BC803E00CEB19200D3D1CD00E9E7E500E1DFDC00D1CDC800B9B3
      AA00D7D3CE00E3E0DC00F5ECE900B8978B00F9F8F80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF0096969600C6C6
      C600C8C8C800A5A5A50092929200BABABA00717171007E7E7E00B0B0B000D0D0
      D000E7E7E700DEDEDE00CCCCCC00B2B2B200D2D2D200DFDFDF00EEEEEE009E9E
      9E00F8F8F8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F3F9FC0087DAF40023ABF5001388EC001981E5001172CA00006A
      B5005490C200F0F4F90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F8F8F800C7C7C7009696
      9600828282007F7F7F006F6F6F005F5F5F008C8C8C00F4F4F400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EAE4E200B3958800CDC4C000C7AE8400B7853300BD904D00CDB5
      9800AE712400BF7C3200C2813E00E2DAD000FAFAFB00E2DEDB00DCD8D400DCD5
      D100E8E3E100E7E3E000F5F3F100C1A59B00F3F0EE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5E5E5009A9A9A00C5C5
      C500A8A8A8007A7A7A0088888800B3B3B3006B6B6B007979790080808000D9D9
      D900FAFAFA00DEDEDE00D8D8D800D6D6D600E4E4E400E3E3E300F3F3F300ABAB
      AB00F0F0F0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000088E7FF002ED4FF0027B2F700168BEC001986E8001474
      CE00006DB8003B83BC00E1EAF200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CFCFCF00ABAB
      AB009A9A9A00848484008282820072727200616161007E7E7E00E9E9E9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFD6D200B99F9400C6B69F00C8A56100C1A37200BF9E6F00D8CE
      C400BD976800C7A67F00C1854600D5BB9F00F0F2F300F2F0F000D8D3CE00C5BE
      B600EFEBEA00E9E6E300F4F2F000D2BEB700ECE7E50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7D7D700A4A4A400B3B3
      B3009A9A9A009C9C9C0099999900CECECE0094949400A4A4A40084848400BABA
      BA00F1F1F100F0F0F000D3D3D300BDBDBD00ECECEC00E6E6E600F2F2F200C2C2
      C200E8E8E8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFFCFF0081E5FF0037D6FF002ABAF9001991ED001A8B
      EB001776D300026EBB002678B600CBDBEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F8F8F800CCCC
      CC00AEAEAE009F9F9F008787870085858500757575006363630071717100DADA
      DA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D5C9C400C9B0A700E4CD9F00CFBB9800D6D1D100C8C1BA00BEB5
      AB00C8C3BC00C4AB8E00BB7B3600D0A67A00EDEEED00D3D0CA00D3CEC800C8C2
      BB00CEC9C200E3E0DC00F9F7F600C8AFA600E4DCD90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBCBCB00B5B5B500C5C5
      C500B6B6B600D2D2D200C1C1C100B4B4B400C2C2C200A9A9A90079797900A5A5
      A500EDEDED00CFCFCF00CDCDCD00C1C1C100C8C8C800DFDFDF00F7F7F700B4B4
      B400DDDDDD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7FEFF008FE8FF003AD7FF002DC1FB001C97
      EF001B8FED00197AD800056FBE001772B500B2CBE10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00D2D2D200B0B0B000A3A3A3008B8B8B008787870079797900666666006A6A
      6A00CACACA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEC0BA00C6AD9C00E1CA9700CDB89200D0C5BB00D4CDC800C2BA
      B300C5B7A600BE864300B9742A00D0A17000D5D5D000BFBBB100D2CEC800B6B0
      A500C6C1B900E7E4E200FBFBFB00D1BBB400DCD1CD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200AFAFAF00C0C0
      C000B2B2B200C5C5C500CDCDCD00BABABA00B6B6B6008282820072727200A0A0
      A000D3D3D300B9B9B900CDCDCD00AEAEAE00C0C0C000E4E4E400FBFBFB00C0C0
      C000D3D3D3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFFFF009FECFF003ED7FF002FC8
      FD001F9DF0001C93EF001B80DE000870C200096CB30098B8D700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00D8D8D800B1B1B100A6A6A6008E8E8E008A8A8A007D7D7D006868
      680062626200B7B7B70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6B6B100C8AE9400E1C78800D5BA8600CDC5BF00D2C9C300E0DD
      DE00D5C3AD00B2762B00BC7A3100C5B29800DCDCD900C5C0B700D1CDC800CECA
      C500D8D4D000E2DFDC00F8F9F800D7C5BF00D3C6C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9B9B900AEAEAE00BABA
      BA00B1B1B100C5C5C500CACACA00DEDEDE00C1C1C1007171710077777700AFAF
      AF00DBDBDB00BEBEBE00CCCCCC00C9C9C900D4D4D400DFDFDF00F8F8F800C9C9
      C900C8C8C8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AEEFFF0046D9
      FF0030CCFE0023A5F2001E97EF001E86E2000D71C600036CB50078A6CD00FEFD
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEDEDE00B4B4B400A8A8A800939393008C8C8C008282
      82006C6C6C0061616100A3A3A300FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C4B1AB00C1A88D00E1CB9300DFD1BD00D8CEC400BBB3A900D9CE
      C200C4AF9300C3A68200D3A97A00D8D6CF00F2F2F100E5E3E000D6D3CE00DFDC
      DA00EBE9E800ECEAE900F4F4F200E1D5D000CCBBB60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500A7A7A700BFBF
      BF00CFCFCF00CECECE00B2B2B200CDCDCD00ACACAC00A3A3A300A7A7A700D4D4
      D400F1F1F100E2E2E200D2D2D200DCDCDC00E9E9E900EAEAEA00F3F3F300D7D7
      D700BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BEF2
      FF004DDAFF0031CFFE0026ACF4001F9BF000208DE7001172C900006BB7005C95
      C400F4F6F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5E5E500B7B7B700AAAAAA00979797008E8E
      8E00868686006E6E6E006060600091919100F6F6F60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CBB3AB00C9B6A700D2CAC200D1BE9900D1B47D00C6C0BB00C09B
      6600AF732000C9AC8700DFDFDD00DBD8D100DDDAD500EDECEA00E4E2E000BEB8
      B000E5E3E000EFEDEC00F1F0EF00EEE6E300CEBFB90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B8B8B800B7B7B700CACA
      CA00B8B8B800ABABAB00C0C0C000959595006B6B6B00A9A9A900DEDEDE00D6D6
      D600D9D9D900EBEBEB00E2E2E200B7B7B700E2E2E200EDEDED00F0F0F000E7E7
      E700C2C2C2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCF5FF0057DCFF0032D2FF002AB3F600229FF1002295EC001475CE00006C
      B9004287BE00E7ECF30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00BBBBBB00ABABAB009B9B
      9B00909090008B8B8B00727272006161610082828200ECECEC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFFFF00CEB2A900EDDDDB00EADDCB00D5B87A00CDAB6A00BBA27A00B387
      4200B8823700B9966700C9C5BC00DDDBD500F2F2F100E4E2DF00D3CFCA00D6D3
      CF00CAC6BF00DFDCD800F5F5F500EAE2DF00C1AEA70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00B8B8B800E1E1E100DBDB
      DB00ADADAD00A0A0A0009D9D9D007E7E7E007B7B7B0092929200C3C3C300D9D9
      D900F1F1F100E1E1E100CECECE00D2D2D200C5C5C500DBDBDB00F5F5F500E3E3
      E300B2B2B2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8F8FF0060DEFF0032D3FF002DBAF80024A2F100259CEF001879
      D300016EBC002A7BB800D3DEEB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF00BFBFBF00ACAC
      AC009F9F9F009292920090909000767676006363630074747400DEDEDE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00CDAFA500F1E4E000EBDFD100DEC38800D1B27300C49F5E00B282
      3500C7A57700C2BBAF00C1BAAC00E1DFDA00E7E6E200E2E0DD00E1DFDC00D8D5
      D200D3CFC900E7E6E300F8F8F800F2EBE900BCA79F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00B5B5B500E7E7E700DEDE
      DE00B8B8B800A7A7A7009595950078787800A1A1A100B9B9B900B7B7B700DEDE
      DE00E5E5E500DFDFDF00DEDEDE00D5D5D500CECECE00E5E5E500F8F8F800ECEC
      EC00ABABAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E4FAFF006EE1FF0034D4FF002FC1FA0026A7F20027A2
      F2001C7FD900026EBF001974B700BBCEE2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F4F4F400C4C4
      C400ADADAD00A3A3A30095959500939393007C7C7C00656565006C6C6C00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F7F600CEAFA400F4EAE600E2DEDB00D9CEBA00D8C8AD00DAC9B100D0C1
      AF00C7BEB400C1BAAF00DFDBD400D9D6CF00E6E5E100E7E5E300DDDAD600D8D5
      D100EFEDEC00F4F3F300F8F8F800F5F0EF00BCA59D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700B5B5B500ECECEC00DEDE
      DE00CBCBCB00C4C4C400C6C6C600C0C0C000BDBDBD00B8B8B800DADADA00D4D4
      D400E4E4E400E5E5E500D9D9D900D4D4D400EDEDED00F3F3F300F8F8F800F1F1
      F100AAAAAA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ECFCFF007CE4FF0035D4FF0031C6FC0029AC
      F30029A8F4002087DF000770C2000C70B6009FBCD90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F700CACACA00ADADAD00A6A6A600989898009797970082828200686868006666
      6600BCBCBC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F4F1EF00D0B2A600F5F1EF00E2DEDA00E7E3E200E6E2E100D7D2CF00D8D2
      CE00C9C0B600C4BBAF00F1EEEA00FAF9F800E1DEDA00F1EFEE00DAD7D300C0BB
      B200D3CFC900E8E7E400F6F5F400F8F5F400BFA8A000FBFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1F1F100B8B8B800F1F1F100DEDE
      DE00E4E4E400E3E3E300D2D2D200D2D2D200BFBFBF00BABABA00EDEDED00F9F9
      F900DDDDDD00EFEFEF00D6D6D600B9B9B900CECECE00E6E6E600F5F5F500F5F5
      F500ADADAD00FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4FEFF008AE7FF0038D5FF0031CA
      FD002BB0F4002BADF500248FE4000B70C500016DB60082AACF00FFFFFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFBFB00D0D0D000AEAEAE00A8A8A8009A9A9A0099999900878787006A6A
      6A0061616100A9A9A900FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0E9E700D3B5A90000000000F8F6F500F2EFED00DED9D300D0C9C100CDC6
      BE00DBD3CC00BEB4A700E0DBD300F5F4F100DCD9D400E9E7E500E3E0DE00CDC8
      C300D2CEC800DDDBD700EFEDEC00FCFBFA00CBB7AF00F5F3F300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00BBBBBB0000000000F6F6
      F600EFEFEF00D8D8D800C8C8C800C5C5C500D3D3D300B3B3B300DADADA00F3F3
      F300D8D8D800E7E7E700E0E0E000C8C8C800CDCDCD00DADADA00EDEDED00FBFB
      FB00BBBBBB00F3F3F30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFFFF009AEBFF003DD5
      FF0032CDFE002EB5F6002DB0F5002899EA001073C900006DB8006399C700F7F7
      FA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00D6D6D600B0B0B000A9A9A9009D9D9D009B9B9B008E8E
      8E006E6E6E006161610096969600F8F8F8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EBE1DE00D4B9AE00FEFFFF00FCFBFB00F3F1EE00F2EFED00D6D0CA00D8D2
      CC00EAE3DF00C1B8AB00CEC8BD00E9E7E300E8E6E200E6E4E100E0DDDB00E6E4
      E400E2DFDD00E6E4E100F3F2F200FEFEFD00C0AAA000F0EDEC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3E3E300BEBEBE00FEFEFE00FBFB
      FB00F0F0F000EFEFEF00D0D0D000D2D2D200E4E4E400B6B6B600C6C6C600E6E6
      E600E5E5E500E3E3E300DDDDDD00E4E4E400DFDFDF00E3E3E300F2F2F200FDFD
      FD00AEAEAE00EDEDED0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A9EE
      FF0043D6FF0032CFFF002FBAF8002EB4F6002BA3EE001576CE00006DBA00458A
      C000E7EEF6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DCDCDC00B2B2B200AAAAAA00A0A0A0009D9D
      9D0094949400737373006262620085858500EEEEEE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E6DAD500D9C1B70000000000FCFBFB00FAF9F800FBF9F700FEFAF900FBF7
      F500F3EEEA00DAD3CA00C5BEB200E6E3DE00F1EFEC00F3F2F100F1EFEE00EBE8
      E700EFEDEC00EBE9E700F6F6F60000000000C3A9A000E9E3E100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCDCDC00C5C5C50000000000FBFB
      FB00F9F9F900F9F9F900FBFBFB00F7F7F700EEEEEE00D2D2D200BCBCBC00E2E2
      E200EEEEEE00F2F2F200EFEFEF00E8E8E800EDEDED00E9E9E900F6F6F6000000
      0000AEAEAE00E4E4E40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8F1FF0049D8FF0033D1FF0031BFF90030B6F6002FACF300157BD5000170
      C00048739600E0DEDB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2E2E200B5B5B500ABABAB00A3A3
      A3009E9E9E009A9A9A00777777006565650070707000DDDDDD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E1D1CB00E0C9C000FEFFFF000000000000000000EBE9E900BFBEBB009694
      90007A7875007D7B79008E8C8A009F9E9C00AAA9A800AAA9A900A9A8A700B2B0
      AE00D3D1CF00ECEAE900FEFDFC0000000000C9AEA400E2DAD700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D4D4D400CDCDCD00FEFEFE000000
      000000000000E9E9E900BDBDBD0093939300777777007B7B7B008C8C8C009D9D
      9D00A9A9A900A9A9A900A8A8A800B0B0B000D1D1D100EAEAEA00FDFDFD000000
      0000B3B3B300DBDBDB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6F5FF0052DAFF0031D1FF0033C3FA002AB7F80037AFEF0098AB
      BE00B3AEA2006A6A73009D9DB000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E8E800B9B9B900ABAB
      AB00A5A5A5009D9D9D009C9C9C00ABABAB00ABABAB006D6D6D00A3A3A3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E3D3CC00EDDED80000000000D5D5D4008B8B8B005E5C5C00575554006561
      5F00777472008F8B8A009D9A990095919000827F7E006F6D6C005C5A59004C4A
      4A00494848005D5C5C00A5A4A400FCFDFD00D6B9AD00DCD1CD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6D6D600E1E1E10000000000D4D4
      D4008B8B8B005C5C5C005555550061616100747474008C8C8C009A9A9A009292
      92007F7F7F006D6D6D005A5A5A004A4A4A00484848005C5C5C00A4A4A400FCFC
      FC00BEBEBE00D3D3D30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D3F7FF005DDCFF002FD1FF003AC8FC00A8BCC400CBC3
      B700656598001616580039394E00A3A3A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EDEDED00BDBD
      BD00AAAAAA00AAAAAA00B8B8B800C1C1C100767676002C2C2C0040404000A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000E1CDC600ECE0DC00B5B6B6006F6C6A007E777500A19A9600C9C4C100E6E3
      E200E8E4E000F0EEEB00D5D3D200C3C2C100C3C2C000C3C2C100BBBAB9009795
      9400686665003E3C3C00201F1F0046474700A98D8100DED0CA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1D1D100E2E2E200B5B5B5006C6C
      6C00787878009B9B9B00C4C4C400E3E3E300E4E4E400EDEDED00D3D3D300C2C2
      C200C1C1C100C2C2C200BABABA0095959500666666003C3C3C001F1F1F004646
      460092929200D2D2D20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEF9FF0061DFFF0093D3E500DCD1C300736B
      B8002A238600B2B3B2008887C2004040BA009898E000FDFDFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F2F2
      F200BFBFBF00C3C3C300D0D0D0008787870046464600B2B2B2009B9B9B006868
      6800B0B0B000FDFDFD0000000000000000000000000000000000000000000000
      0000EADCD800B0A9A70080787300A89F9900C5C1BC00D7D6D500E2E1E000F4F3
      F300FFFEFD00A5A29E00605B56006F6A64007E7872008D898400AAA8A600CCCB
      CA00DEDDDD00ABA8A700706D6B002F2D2D00140D0B00C1B6B200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFDFDF00AAAAAA0079797900A0A0
      A000C0C0C000D6D6D600E1E1E100F3F3F300FEFEFE00A1A1A1005B5B5B006969
      69007878780088888800A8A8A800CBCBCB00DDDDDD00A8A8A8006D6D6D002D2D
      2D000E0E0E00B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7FDFF00D4DCD800BCB7D0004F3D
      C900C6C5C3008484CE004F4ED9005B5ADA005555D400908FE200F9F9FD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F6F600D8D8D800C1C1C10071717100C4C4C4009C9C9C007C7C7C008585
      85007F7F7F00ABABAB00FAFAFA00000000000000000000000000000000000000
      0000CFCDCC00887A7300B5ADA500C1C1BC00D0CECC00D4D4D300CCCAC700BFBD
      BB00CCCAC8006B6662005E59530068635D00736D6600716C6500A2A09D007673
      7100858381009D9B99009D989600AFABA800302F2F008B878600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CDCDCD007C7C7C00ADADAD00BFBF
      BF00CECECE00D3D3D300C9C9C900BDBDBD00CACACA0066666600585858006262
      62006C6C6C006B6B6B009F9F9F0073737300838383009B9B9B0099999900ABAB
      AB002F2F2F008888880000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9EF009D98E500A49F
      D400BDBDDD006666E0007272DD007575DE006F6FDD006161D900A2A1E8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F5F5F500B3B3B300B2B2B200C7C7C7008E8E8E00959595009898
      98009393930089898900B9B9B900000000000000000000000000000000000000
      00007D767200CBBEB700D0C4BA00BCB0A700CBC4BF00D6D2D000D3CDC800C2BA
      B500B3ADA8008B868200716D68006A655F006E6862007A767100E3E2E100D9D7
      D70088858200A7A3A000BAB6B300D0CCCA00978B830086838100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000077777700C0C0C000C4C4C400B1B1
      B100C4C4C400D2D2D200CDCDCD00BBBBBB00ADADAD00868686006C6C6C006464
      64006868680075757500E2E2E200D7D7D70085858500A3A3A300B6B6B600CCCC
      CC008C8C8C008383830000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4D4F500DADA
      E6009C9AEA008180E3008B8BE5008A8AE5008B8BE5008282E3008383E200F7F7
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DFDFDF00DEDEDE00B5B5B500A1A1A100A9A9A900A8A8
      A800A9A9A900A2A2A200A2A2A200F9F9F9000000000000000000000000000000
      00005A5653009D948E00E1D3CA00D3C1B600CABCB200CDC0B900D9CEC700EAE1
      DB00FDF5F000F3EDE900C5C2C100B1B0AE00908E8900AAA7A400E7E5E400E3E0
      DD00D0CCC900B2AEAB00CECBC900E5DCD7008472680095959500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005656560095959500D4D4D400C3C3
      C300BDBDBD00C2C2C200CFCFCF00E2E2E200F6F6F600EDEDED00C2C2C200AFAF
      AF008D8D8D00A7A7A700E5E5E500E0E0E000CCCCCC00AEAEAE00CBCBCB00DDDD
      DD00747474009595950000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FD00AEAEF200A1A0ED00A7A6EE00A6A6EE00A8A7EE009E9EEC00A09FEA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFB00C4C4C400BABABA00BEBEBE00BEBE
      BE00BFBFBF00B8B8B800B8B8B800000000000000000000000000000000000000
      0000BFBDBB00403A3600AA9F9800DBCCC300D7C5BA00D5C2B700DBC9BD00E5D3
      C800F0E0D600EDE1D900D0C8C400C8C0BC00BAB3B000DBD9D800D6D3D200DCD9
      D700CCCAC700C6BEBA00CEC3BC00877D770041403F00ECECED00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD003A3A3A00A0A0A000CECE
      CE00C7C7C700C4C4C400CBCBCB00D5D5D500E2E2E200E2E2E200C9C9C900C1C1
      C100B4B4B400D9D9D900D3D3D300D9D9D900C9C9C900BFBFBF00C4C4C4007E7E
      7E0040404000ECECEC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7FE00CBCBF800C5C3F900C7C6F900C6C5F900B3B2F300DFDEF8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900DADADA00D5D5D500D7D7
      D700D6D6D600C8C8C800E7E7E700000000000000000000000000000000000000
      000000000000C6C4C20067625F0082797400B5A7A000D0C1B800E2D2C900F1E0
      D600FFEFE500FDEEE400EDDDD400E5D5CA00CABEB500CFC9C500DCD4CF00C9C3
      BF00C1BFBD00A39A9400544E4B0058585800E4E4E50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C4C4C400626262007A7A
      7A00A9A9A900C3C3C300D4D4D400E2E2E200F1F1F100EFEFEF00DFDFDF00D6D6
      D600BFBFBF00C9C9C900D5D5D500C3C3C300BFBFBF009B9B9B004F4F4F005858
      5800E4E4E4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFCFF00E6E5FE00DCDCFE00D9D9FC00ECEBFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00EDEDED00E7E7
      E700E4E4E400F1F1F10000000000000000000000000000000000000000000000
      00000000000000000000F7F6F600BFBDBC0095918E008A848100968E8900B3A9
      A300CFC5BF00DAD0CA00D3C9C300CDC4BF00CCC3BE00BBB4AF00ADA7A300736F
      6D005553530068686800BABBBB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6F6F600BDBD
      BD0091919100858585008F8F8F00AAAAAA00C6C6C600D1D1D100CACACA00C5C5
      C500C4C4C400B4B4B400A7A7A7006F6F6F005353530068686800BABABA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F3F3F300DEDDDC00CBCA
      C900C2C0BF00B9B7B600AEACAC00A3A2A2009B9A9A0098989700A2A3A300C6C6
      C600EDEDED000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F3F3F300DDDDDD00CACACA00C0C0C000B7B7B700ACACAC00A2A2
      A2009A9A9A0097979700A2A2A200C6C6C600EDEDED0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FCFCFB00F9FBF900F7FAF700F8FA
      F800FCFDFC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FBFBFB00F9F9F900F8F8F800F8F8F800FCFCFC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FBFBFB0000000000FCFEFF00F4F7FC00EDF0F500ECEEF300F2F5F900FAFC
      FF0000000000FDFDFD00FBFBFB00FBFBFB00FBFBFB00FDFDFD00000000000000
      00000000000000000000FDFDFD00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBFBFB0000000000FDFDFD00F7F7
      F700F0F0F000EFEFEF00F5F5F500FCFCFC0000000000FDFDFD00FBFBFB00FBFB
      FB00FBFBFB00FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFEFD00F7F9F700E6EFE700C8DCCB00C2D5C200DBE9
      DD00EEF4EF00FAFBFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00F7F7
      F700E9E9E900CFCFCF00C8C8C800E0E0E000F0F0F000FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EBEBEB00C0C0C000B4B4
      B400B5B5B500B5B5B500B6B6B600B6B6B600B6B6B600B7B7B700B7B7B700B7B7
      B700B8B8B800B8B8B800B8B8B800B9B9B900B9B9B900B9B9B900B9B9B900BDBE
      BE00B7B9BD009D9C9C00877C6D007A674800755C3300755B3000786340008375
      610094918C00AEB0B400BABBBC00B6B6B600B4B4B400C4C4C400F0F0F0000000
      000000000000EBEBEB00C0C0C000B4B4B400B5B5B500B5B5B500B6B6B600B6B6
      B600B6B6B600B7B7B700B7B7B700B7B7B700B8B8B800B8B8B800B8B8B800B9B9
      B900B9B9B900B9B9B900B9B9B900BDBDBD00B9B9B9009C9C9C007A7A7A006363
      630056565600555555005E5E5E007373730090909000B0B0B000BBBBBB00B6B6
      B600B4B4B400C4C4C400F0F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFDFC00F3F7F300D8E7DA00A9C7AC004B9F5E0041AA620099BA
      9B00C8DDCB00E8F0E900F7FAF700FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00F4F4F400DDDD
      DD00B4B4B4006D6D6D006F6F6F00A4A4A400D0D0D000EBEBEB00F8F8F800FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C7C7C700A8A8A800AFAF
      AF00B0B0B000B3B3B300B5B5B500B7B7B700BABABA00BDBDBD00C0C0C000C2C2
      C200C5C5C500C7C7C700CACACA00CBCBCB00CDCDCD00CFCFCF00D4D6D800B4B5
      B60079674D00603C0400653B00006B4200006E4500006F4600006D440000683F
      0000613B0000674F29008C898500B3B5B900B1B1B100A8A8A800D1D1D1000000
      000000000000C7C7C700A8A8A800AFAFAF00B0B0B000B3B3B300B5B5B500B7B7
      B700BABABA00BDBDBD00C0C0C000C2C2C200C5C5C500C7C7C700CACACA00CBCB
      CB00CDCDCD00CFCFCF00D6D6D600B5B5B5006464640035353500353535003939
      39003B3B3B003C3C3C003B3B3B0037373700343434004A4A4A0088888800B5B5
      B500B1B1B100A8A8A800D1D1D100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFBFA00EEF4EF00D2E3D400A0C2A40053985D00028E290002BC500045A8
      640090B49200C2DAC600E4EEE500F5F8F500FDFEFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFAFA00F0F0F000D8D8D800ACAC
      AC006D6D6D003D3D3D005A5A5A00707070009C9C9C00CBCBCB00E7E7E700F6F6
      F600FDFDFD000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000B4B4B400F6F6
      F600F8F8F800F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F9F9F900F9F9F900F9F9F900F9F9F900FAFAFA0000000000C3C0BC006A4B
      1B00653900006E4500006F4800006D460000694000006A4200006F470100744D
      0200734B00006C410000633D0200A1978600EDEFF300B0B0B000CACACA000000
      000000000000C0C0C000B4B4B400F6F6F600F8F8F800F7F7F700F7F7F700F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F9F9F900F9F9F900F9F9F900F9F9
      F900FAFAFA0000000000BFBFBF0045454500343434003B3B3B003D3D3D003B3B
      3B0038383800393939003D3D3D00414141003F3F3F0039393900363636009494
      9400EFEFEF00B0B0B000CACACA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F9FB
      F800EAF1EA00CFE1D100ADCBB10077AA7D000C92340010BA460026D166000ACB
      610067B07A00A1BFA200C1D9C500DFEBE000F2F7F300FCFDFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F9F9F900ECECEC00D5D5D500B8B8B8008A8A
      8A00464646005A5A5A00747474006767670085858500ABABAB00CACACA00E3E3
      E300F4F4F400FCFCFC0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C1C1C100B4B4B400FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CECCC70068441100663B
      00006A420000663E0000653C00006B43080085643000896834007B571A006F47
      0100724B0400734D040070480000673D0000A0958200B0B2B700CCCCCC000000
      000000000000C1C1C100B4B4B400FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CBCBCB003F3F3F00353535003939390036363600353535003C3C
      3C005D5D5D00616161004E4E4E003D3D3D0040404000414141003D3D3D003636
      360092929200B3B3B300CCCCCC00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F6F9F600E5EE
      E600C9DDCC00A8C9AD0089B28D0021933F0009B5460007B02B0012B6360024DC
      750016D36E007EB187009FC1A200BDD7C100DBE9DD00F0F5F000FBFCFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00F7F7F700E8E8E800D0D0D000B4B4B400989898005151
      5100565656004B4B4B00545454007C7C7C007272720092929200ABABAB00C7C7
      C700E0E0E000F1F1F100FBFBFB00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C1C1C100B4B4B400FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E8EAEB007153270062370000663E
      000061390000633A010063390000805D25000000000000000000BCA985006E44
      0000764E0500754D0500754E050072490100663E010089847C00CFD0D3000000
      000000000000C1C1C100B4B4B400FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E9E9E9004E4E4E0033333300363636003333330034343400343434005656
      56000000000000000000A3A3A3003B3B3B004343430042424200424242003E3E
      3E003737370083838300D0D0D000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFDFC00F3F7F300E0EBE100C3DA
      C700A3C6A8008DB6920036994D0004AD40000CB7370005B2300003B72F001EC3
      49001EE87E0026D4760088AF8B009DC1A200BBD5BF00D7E6D900EDF3ED00F9FA
      F900FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00F4F4F400E4E4E400CCCCCC00B0B0B0009C9C9C005E5E5E005050
      5000535353004D4D4D004D4D4D0063636300818181007A7A7A0096969600AAAA
      AA00C5C5C500DCDCDC00EFEFEF00F9F9F900FEFEFE0000000000000000000000
      00000000000000000000000000000000000000000000C1C1C100B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A09079005B2F0000633B00005F37
      0000623A01006A4102006D4400008A6726000000000000000000C4B085007E54
      0000835B07007E5706007A520600774F0500714600006B4F2000C2C3C7000000
      000000000000C1C1C100B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008D8D8D002E2E2E00343434003232320034343400393939003B3B3B005D5D
      5D000000000000000000A8A8A800464646004C4C4C0049494900464646004343
      43003D3D3D0048484800C4C4C400000000000000000000000000000000000000
      00000000000000000000FEFEFE00FAFCFA00EFF5EF00DAE8DC00BED7C2009FC4
      A50091B6940050A6630002BD48000DBA3E0005B7330007BF3B0009C53F0004BE
      33002AD05E0015F4850040CE7E0091B190009DC2A300B8D3BC00D4E4D600E9F1
      EA00F7FAF700FDFEFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FAFA
      FA00F1F1F100DFDFDF00C7C7C700ADADAD009E9E9E0073737300575757005757
      57004F4F4F005555550059595900515151007272720084848400848484009B9B
      9B00ABABAB00C2C2C200DADADA00ECECEC00F8F8F800FDFDFD00000000000000
      00000000000000000000000000000000000000000000C1C1C100B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E9E9E8006D4A1A005F3400005F3600006239
      01006A420200744C04007B520000977528000000000000000000CCB887008F66
      0000926B09008C640800845C07007C550600774F040069400000A9A296000000
      000000000000C1C1C100B5B5B500FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E8E8
      E800454545003131310031313100343434003A3A3A0041414100444444006666
      66000000000000000000AEAEAE005151510057575700525252004D4D4D004747
      47004343430038383800A0A0A000000000000000000000000000000000000000
      000000000000FEFEFE00FAFBFA00EFF5EF00DAE8DC00C0D8C300A4C7A90098BD
      9C006BA8750007A53D000CC54A0006B9350007C6410008CA42000ACF450009D1
      470007C53A0033DC710010F685005CC383009CB99B00A2C6A800BBD5BF00D4E5
      D700EAF2EB00F7F9F700FDFEFD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FAFAFA00F1F1
      F100DFDFDF00C9C9C900B1B1B100A5A5A500828282004D4D4D005E5E5E005151
      51005A5A5A005C5C5C005F5F5F00606060005757570080808000838383008B8B
      8B00A5A5A500B0B0B000C5C5C500DADADA00EDEDED00F7F7F700FDFDFD000000
      00000000000000000000000000000000000000000000C1C1C100B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3BBAE005C3300005F36000061380000663C
      000072490000815900008B630000A78526000000000000000000D4C288009F78
      00009F790700976F01008C630000855C06007C5506006F44000093805A000000
      000000000000C1C1C100B5B5B500FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B9B9
      B9002F2F2F003131310033333300363636003E3E3E00484848004F4F4F007070
      70000000000000000000B4B4B4005D5D5D005F5F5F00575757004F4F4F004D4D
      4D00474747003B3B3B0079797900000000000000000000000000000000000000
      000000000000FDFDFD00F7FAF700E9F1EA00D4E4D700BFD7C200B3CEB6009AC1
      9E0014B34A0007BE470006BB380007CB440008D1490009D74E000AD951000ADA
      520008D950000CC83F0036EB84000EE3760089C29800B5CCB600BBD6BF00D0E2
      D200E4EEE500F4F7F400FCFDFC00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F8F8F800ECEC
      EC00DADADA00C8C8C800BDBDBD00A8A8A8005B5B5B0059595900535353005C5C
      5C0060606000646464006666660067676700656565005B5B5B008C8C8C007777
      7700A1A1A100BDBDBD00C5C5C500D6D6D600E7E7E700F5F5F500FCFCFC000000
      00000000000000000000000000000000000000000000C1C1C100B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A6967C00592E0000613800006B4200009374
      3300A78B4500B2974800BBA04800CCB769000000000000000000E6DBAF00C6AD
      5000C4AB5400BEA34D00B699480096711500825A05007349000085683200F6F8
      FC0000000000C1C1C100B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009292
      92002D2D2D003333330039393900686868007D7D7D00858585008B8B8B00A4A4
      A4000000000000000000D0D0D00096969600969696008F8F8F00878787005E5E
      5E004B4B4B003E3E3E005F5F5F00F8F8F8000000000000000000000000000000
      000000000000FDFDFD00F8FAF800EEF4EE00E1EDE300DAE8DC00D5E1D40036B4
      5C0000C64B0008BE3D0007CF4A0009D7520008DA570009E05F000AE262000AE2
      62000AE3630005DE580016CE4C002FE982001ECB6A00C8DFCD00DCE6DB00DFEB
      E000EAF2EB00F5F9F500FCFDFC00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F8F8F800F0F0
      F000E5E5E500DFDFDF00D8D8D8006C6C6C005B5B5B0056565600606060006666
      6600686868006D6D6D006F6F6F006F6F6F007070700069696900656565008888
      880071717100D1D1D100DFDFDF00E3E3E300EDEDED00F6F6F600FCFCFC000000
      00000000000000000000000000000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000978261005D310000704800007D550000E7E0
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B1933D008C6501007B5200007F5F2200EEF0
      F10000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007E7E
      7E002F2F2F003D3D3D0046464600DBDBDB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000505050004444440055555500EFEFEF000000000000000000000000000000
      000000000000FEFEFE00FCFDFC00F9FBF900F7FAF700000000006EB9800000B3
      3E0006B2370006C5430008D7560009DC5D0008DF5E0009E467000AE76D000AE8
      6E000AE76C000AE76C0004DE5A0022D2580022D9740046DE8C00FDF9FA00F8F8
      F700F7FAF700FBFCFB00FEFEFE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FCFCFC00F9F9
      F900F8F8F800000000008D8D8D00505050004F4F4F005A5A5A00676767006B6B
      6B006C6C6C007171710074747400757575007474740074747400696969006E6E
      6E007A7A7A0090909000FAFAFA00F7F7F700F8F8F800FBFBFB00FEFEFE000000
      00000000000000000000000000000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009B8761006D430000825B0000906B0000EBE4
      CD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B99D4200967005008760010087682400EEF0
      F10000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008181
      81003A3A3A004949490053535300DEDEDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008888
      8800595959004D4D4D005B5B5B00EFEFEF000000000000000000000000000000
      00000000000000000000000000000000000000000000A2C7A80000972C0005AF
      380004B0340006C1400007D2500008D95A0007DD5C0008E2640009E76E000BEA
      72000AE96E0009E66A0009E5690002D44D002DD3630011E1730077F5B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B0B0B000414141004E4E4E004D4D4D0057575700636363006969
      69006A6A6A006F6F6F0074747400777777007575750073737300727272006161
      61007676760077777700B6B6B600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B4A57D007E550000916C0100A2800900C3AC
      4A00D3C06800DAC97300E1D28100EADFA4000000000000000000F7F3D500ECE2
      9E00E8DC9700DFD18500D4C27100B6972C00A07C10008D660100977D3700F7F9
      FD0000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C0046464600545454006363630093939300A9A9A900B2B2B200BCBCBC00CFCF
      CF000000000000000000EAEAEA00CECECE00C9C9C900BCBCBC00ADADAD007D7D
      7D0064646400515151006E6E6E00F9F9F9000000000000000000000000000000
      000000000000000000000000000000000000CBDACB00097F260001AF380004AC
      340004AE360004B3370006C5430007D04D0007D6540007DC5A0008E465000AE8
      6E000AE86D0008E3640007DC5C0007D7550003C23D0035D670000CF17E00A0F0
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0D0D0003A3A3A004D4D4D004C4C4C004D4D4D004F4F4F005A5A5A006161
      610065656500696969007070700075757500757575006F6F6F006A6A6A006666
      6600565656007E7E7E007E7E7E00C7C7C7000000000000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0C9B1008C6700009D7A0000AE8F0D00B89B
      1900C4AA2C00D0B94200D8C55800E4D688000000000000000000F5EFC800E6D9
      8200E2D37900D7C45F00C7AE3E00B89A2700A6841700916A0000A9976000FEFF
      FF0000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C3C3
      C300515151005D5D5D006E6E6E00797979008888880099999900A7A7A700C0C0
      C0000000000000000000E4E4E400C0C0C000BABABA00A8A8A800919191007D7D
      7D006B6B6B00535353008A8A8A00FEFEFE000000000000000000000000000000
      0000000000000000000000000000EEF1ED00227A3200009D2B0003A42F0004AD
      370004A8330003A6300005B5390006C3420007CE490006D44E0007DC570009E3
      620009E3640008DE5C0006D24B0007CB440004C4430007AE320036E480000FDF
      7100CDEFDB000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEEE
      EE004444440042424200474747004D4D4D004A4A4A0048484800515151005959
      59005F5F5F0062626200686868006F6F6F00707070006B6B6B00616161005C5C
      5C00595959004D4D4D008888880075757500DDDDDD0000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEEEEC00A2841900A5820000B5970E00C0A6
      2500CBB53E00D5C25600DECE6A00E9DD96000000000000000000F6F1CF00E9DD
      9200E5D88A00DDCC7200CFB85000BC9F2D00A886170094710300B9B39D000000
      000000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EDED
      ED006A6A6A0062626200737373008383830094949400A4A4A400B2B2B200C9C9
      C9000000000000000000E7E7E700C8C8C800C2C2C200B3B3B3009D9D9D008282
      82006C6C6C0058585800ADADAD00000000000000000000000000000000000000
      000000000000000000000000000093BC9900008D200006A2300006A3330007AA
      380006A7340003A02E0003A6300005B7380007C6410006CC410006D3470007D8
      4E0009DC550008D84F0006C83D0008C03D0009BE430005B43C0015AE3E0027DF
      790079E1A7000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A2A2
      A2003939390048484800494949004D4D4D004B4B4B0045454500484848005151
      51005A5A5A005B5B5B0060606000646464006868680065656500595959005757
      57005858580051515100555555007F7F7F00ABABAB0000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5B97D00A9870000B89B0B00C3AA
      2500CDB74000D7C55B00E0D16E00EAE097000000000000000000F6F1D100E9DE
      9400E5D98C00DDCD7200CFB94E00BB9F2D00A8850F0098812C00C5C7CB000000
      000000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A9A9A90065656500747474008686860096969600A7A7A700B5B5B500CBCB
      CB000000000000000000E8E8E800C9C9C900C3C3C300B4B4B4009C9C9C008282
      8200696969006C6C6C00C7C7C700000000000000000000000000000000000000
      000000000000000000000000000053B66B00008B0F0000911E0000952000009C
      2400019C2600039D2B00039C2A0004AA300005BC3A0006C43B0006CA3B0006CC
      3B0008D1430008D0440005BF370000AB290000A7280000AC2E00009D1F0004A0
      2B008FEDB8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007C7C
      7C00333333003A3A3A003C3C3C00404040004141410043434300434343004A4A
      4A00535353005757570059595900595959005E5E5E005E5E5E00535353004646
      460045454500484848003E3E3E0045454500BCBCBC0000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0F1F000B8A12600B89A0000C4AB
      1D00CEB83C00D7C65900E0D16E00EAE093000000000000000000F6F1CE00E8DC
      8E00E4D78400DBC96800CBB44700B6982300A68611009F9A8700CDCFD4000000
      000000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0F0F0007F7F7F00707070008484840096969600A7A7A700B5B5B500C9C9
      C9000000000000000000E7E7E700C6C6C600BFBFBF00AEAEAE00979797007B7B
      7B006969690095959500D0D0D000000000000000000000000000000000000000
      0000000000000000000000000000A2D4AD0088C694008DCA9A008DCB9A0091CE
      9E0062BA7600009321000296260003A12B0004B0310006BB360006C0360005C0
      330007C3380005C2390004B62E0072C5840091CE9E008ED39E008ED39E0084C6
      9000C4E7CD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B6B6
      B600A0A0A000A5A5A500A6A6A600A9A9A900868686003C3C3C003F3F3F004545
      45004C4C4C0052525200545454005252520056565600555555004D4D4D009393
      9300A9A9A900AAAAAA00AAAAAA009E9E9E00D2D2D20000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4E1CC00BCA30D00C3A7
      0500CDB73100D6C44F00DECF6900E5D97F00EDE39D00EFE6A300ECE19700E6DA
      8300E0D17400D4C15A00C1A73400B0921600C4BB9100AFB1B900CDCDCC000000
      000000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DBDBDB00797979007A7A7A0091919100A3A3A300B2B2B200BFBF
      BF00CFCFCF00D2D2D200CCCCCC00C1C1C100B7B7B700A5A5A500898989007272
      7200B0B0B000B3B3B300CCCCCC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFDFC500008B1800018F2100039A260004A52B0005B02F0006B6300005B4
      2E0006B7310002B12C0007B42D00DBF4E1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCB00363636003B3B3B004141
      4100464646004C4C4C004E4E4E004D4D4D004F4F4F004A4A4A004D4D4D00E5E5
      E500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4E2CA00C4B0
      1E00C8AF0B00D3BE3600DACA5900E0D26D00E4D77600E5D87B00E4D77B00E0D1
      7300D6C45D00C5AD3400B79C2700D4CBA300F5F6FB00B0AFAF00CCCCCC000000
      000000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DADADA00868686008080800097979700A9A9A900B5B5
      B500BBBBBB00BDBDBD00BCBCBC00B6B6B600A7A7A7008C8C8C007E7E7E00C0C0
      C000F7F7F700AFAFAF00CCCCCC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C5E2CA000086160000891D0003932200039C250005A6290006AA2A0005A9
      280005AA290001A4240009B02D00DDF5E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0D0D00034343400373737003D3D
      3D004141410046464600484848004747470048484800434343004C4C4C00E7E7
      E700000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200B4B4B400FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0F0
      EA00D3C87200CCB92C00D2BD2C00D7C54400DBCA5400DCCB5900D7C65400D0BB
      4600C5AF3D00C7B76700E4E1D30000000000F7F7F600ADADAD00CCCCCC000000
      000000000000C2C2C200B4B4B400FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEEEEE00AFAFAF009090900093939300A0A0
      A000A8A8A800AAAAAA00A5A5A5009B9B9B0090909000A1A1A100DDDDDD000000
      0000F6F6F600ADADAD00CCCCCC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCE5D0000081140000831A00038D1E0003932000049D2400059D2300059E
      2300059F240001991E000CAD2D00E3F8E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5D5D50031313100343434003A3A
      3A003C3C3C00414141004141410042424200424242003D3D3D004C4C4C00ECEC
      EC00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00C6C6C600C5C5C500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFEFF00EEEDE600DDD7A600D8CE8100D5C87200D3C67300D4C98100D7CF
      9F00E7E4D600FAFBFE000000000000000000F8F8F800BEBEBE00CECECE000000
      0000FEFEFE00C6C6C600C5C5C500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00EBEBEB00C8C8C800B7B7
      B700AFAFAF00AEAEAE00B4B4B400C1C1C100E0E0E000FBFBFB00000000000000
      0000F8F8F800BEBEBE00CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0E6D400017E1600007F160002861B00038D1D000495200004941F000494
      1F0004951F0000911A000EA92E00E7FAED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8D8D80031313100313131003636
      3600393939003D3D3D003D3D3D003D3D3D003D3D3D00393939004C4C4C00EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00CACACA00D5D5D500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFFFF00FBFCFF00FAFBFF00FDFEFF000000
      000000000000000000000000000000000000F9F9F900D0D0D000CFCFCF000000
      0000FDFDFD00CACACA00D5D5D500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FCFCFC00FCFCFC00FEFEFE00000000000000000000000000000000000000
      0000F9F9F900D0D0D000CFCFCF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D4E7D7000F7F21000D8522000081170003891A00038F1D00048D1C00048F
      1D00048D1C00008B170012A73000EBFDF1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DBDBDB003A3A3A003C3C3C003232
      3200373737003A3A3A00393939003A3A3A0039393900363636004D4D4D00F3F3
      F300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00C9C9C900D2D2D200FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900CCCCCC00CFCFCF000000
      0000FDFDFD00C9C9C900D2D2D200FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900CCCCCC00CFCFCF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DAEBDD00187F2800268E3800138B280000871800028B1A00048B1B00048D
      1C00048B1B000088150016A63300F0FEF5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0E0E0003F3F3F004E4E4E004242
      42003535350037373700383838003939390038383800343434004F4F4F00F6F6
      F600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00C8C8C800D0D0D000FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900CBCBCB00CFCFCF000000
      0000FDFDFD00C8C8C800D0D0D000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900CBCBCB00CFCFCF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0EEE2002384320033924300339A4500209B3800048E1E00008E19000391
      1D0004921E00008C160019A73600F3FFF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E5E50048484800585858005B5B
      5B00515151003A3A3A00373737003B3B3B003C3C3C003636360052525200F8F8
      F800000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00C8C8C800CFCFCF00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900C9C9C900CFCFCF000000
      0000FEFEFE00C8C8C800CFCFCF00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900C9C9C900CFCFCF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E2EFE4002B8B3C00409A51003EA151003EAE560036AB4D0017A031000199
      1E00009C1E00009519001DAC3B00F7FFFB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7E7E70050505000636363006565
      65006B6B6B00646464004D4D4D003D3D3D003E3E3E003A3A3A0056565600FBFB
      FB00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00C8C8C800CDCDCD00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900C7C7C700CECECE000000
      0000FEFEFE00C8C8C800CDCDCD00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900C7C7C700CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E4F1E7003695480050A461004DAA5F004AB763004ABD630049C0610037B9
      500019B3390000A31F0020B24100F9FFFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E9E9E9005B5B5B00717171007272
      72007676760078787800787878006A6A6A0057575700404040005B5B5B00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00C7C7C700CBCBCB00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900C5C5C500CECECE000000
      0000FEFEFE00C7C7C700CBCBCB00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900C5C5C500CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7F3EA0042A1550061B071005DB36F005AC0720058CA720055CE700053CD
      6C0051CF6C003EC35B0038C05B00F9FFFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ECECEC0068686800808080007F7F
      7F0084848400868686008686860084848400848484007474740071717100FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00C7C7C700C9C9C900FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F800C3C3C300CECECE000000
      0000FEFEFE00C7C7C700C9C9C900FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800C3C3C300CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ECF5EE004DA9610070BC82006CBD7E006AC57E0068D1810065D67F0061D5
      79005ED4770058CC710049C86B00F9FFFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00727272008F8F8F008D8D
      8D008F8F8F0093939300939393008F8F8F008D8D8D00878787007E7E7E00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00C6C6C600C8C8C800FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F800C1C1C100CECECE000000
      0000FEFEFE00C6C6C600C8C8C800FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800C1C1C100CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFF6F10059AE6C0080C691007CC68D0079C98B0077D18C0074D68C0071D5
      87006DD3830065CA7A004FC87100FBFFFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F2F2F2007B7B7B009D9D9D009A9A
      9A00999999009C9C9C009C9C9C0099999900969696008D8D8D0082828200FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00C6C6C600C5C5C500FBFB
      FB00FDFDFD00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FEFEFE00F5F5F500BFBFBF00CDCDCD000000
      0000FEFEFE00C6C6C600C5C5C500FBFBFB00FDFDFD00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FEFE
      FE00F5F5F500BFBFBF00CDCDCD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0F6F10060AF720091CFA0008CCD9B0089CD980086D0970084D3960080D2
      94007DCF8F0074C5840057C57600FDFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F2F2F20080808000AAAAAA00A6A6
      A600A4A4A400A4A4A400A4A4A400A2A2A2009E9E9E009494940086868600FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00C6C6C600C1C1C100C9C9
      C900CACACA00CBCBCB00CDCDCD00CFCFCF00D1D1D100D3D3D300D4D4D400D6D6
      D600D8D8D800DADADA00DCDCDC00DDDDDD00DFDFDF00E0E0E000E0E0E000DEDE
      DE00DDDDDD00DCDCDC00DADADA00D8D8D800D6D6D600D4D4D400D2D2D200D1D1
      D100CECECE00CDCDCD00CBCBCB00CACACA00C8C8C800BEBEBE00CDCDCD000000
      0000FEFEFE00C6C6C600C1C1C100C9C9C900CACACA00CBCBCB00CDCDCD00CFCF
      CF00D1D1D100D3D3D300D4D4D400D6D6D600D8D8D800DADADA00DCDCDC00DDDD
      DD00DFDFDF00E0E0E000E0E0E000DEDEDE00DDDDDD00DCDCDC00DADADA00D8D8
      D800D6D6D600D4D4D400D2D2D200D1D1D100CECECE00CDCDCD00CBCBCB00CACA
      CA00C8C8C800BEBEBE00CDCDCD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1F7F30069B07800A0D4AC009AD2A70098D0A40095D0A30092D1A10090D1
      A0008CCE9B0082C48F0069C78300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3F3F30085858500B5B5B500B1B1
      B100AEAEAE00ADADAD00ACACAC00ABABAB00A7A7A7009C9C9C00919191000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00C6C6C600BFBFBF00C4C4
      C400C5C5C500C7C7C700C9C9C900CBCBCB00CDCDCD00D0D0D000D2D2D200D4D4
      D400D7D7D700D9D9D900DBDBDB00DDDDDD00DEDEDE00E0E0E000E0E0E000DEDE
      DE00DDDDDD00DBDBDB00D9D9D900D7D7D700D4D4D400D2D2D200CFCFCF00CDCD
      CD00CBCBCB00CBCBCB00C9C9C900C7C7C700C6C6C600BDBDBD00CDCDCD000000
      0000FEFEFE00C6C6C600BFBFBF00C4C4C400C5C5C500C7C7C700C9C9C900CBCB
      CB00CDCDCD00D0D0D000D2D2D200D4D4D400D7D7D700D9D9D900DBDBDB00DDDD
      DD00DEDEDE00E0E0E000E0E0E000DEDEDE00DDDDDD00DBDBDB00D9D9D900D7D7
      D700D4D4D400D2D2D200CFCFCF00CDCDCD00CBCBCB00CBCBCB00C9C9C900C7C7
      C700C6C6C600BDBDBD00CDCDCD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F4F8F50073B48100AEDAB800A9D8B400A6D6B100A3D6AF00A0D4AD009ED5
      AB009BD3A8008EC89A007ECA9100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F5008D8D8D00C0C0C000BCBC
      BC00B9B9B900B8B8B800B5B5B500B4B4B400B2B2B200A5A5A5009D9D9D000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00C5C5C500BDBDBD00C3C3
      C300C4C4C400C6C6C600C8C8C800CACACA00CDCDCD00CFCFCF00D2D2D200D4D4
      D400D6D6D600D9D9D900DBDBDB00DCDCDC00DEDEDE00DFDFDF00DFDFDF00DEDE
      DE00DCDCDC00DBDBDB00D8D8D800D6D6D600D4D4D400D1D1D100CFCFCF00CDCD
      CD00C6C6C600B4B4B400B7B7B700B6B6B600B1B1B100BABABA00CDCDCD000000
      0000FEFEFE00C5C5C500BDBDBD00C3C3C300C4C4C400C6C6C600C8C8C800CACA
      CA00CDCDCD00CFCFCF00D2D2D200D4D4D400D6D6D600D9D9D900DBDBDB00DCDC
      DC00DEDEDE00DFDFDF00DFDFDF00DEDEDE00DCDCDC00DBDBDB00D8D8D800D6D6
      D600D4D4D400D1D1D100CFCFCF00CDCDCD00C6C6C600B4B4B400B7B7B700B6B6
      B600B1B1B100BABABA00CDCDCD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6FAF7007DB98900BFE3C700BBE0C300B8DFC200B6DEBF00B4DDBD00B1DE
      BC00AFDCBA009FD2AB008BCF9B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F70095959500CDCDCD00CACA
      CA00C8C8C800C6C6C600C4C4C400C3C3C300C1C1C100B4B4B400A7A7A7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D1D1D100BABABA00C1C1
      C100C2C2C200C4C4C400C6C6C600C8C8C800CACACA00CDCDCD00CFCFCF00D1D1
      D100D3D3D300D6D6D600D8D8D800D9D9D900DBDBDB00DCDCDC00DCDCDC00DBDB
      DB00D9D9D900D7D7D700D5D5D500D3D3D300D1D1D100CFCFCF00CCCCCC00CBCB
      CB00C2C2C200ABABAB00AEAEAE00AEAEAE00A6A6A600B9B9B900D9D9D9000000
      000000000000D1D1D100BABABA00C1C1C100C2C2C200C4C4C400C6C6C600C8C8
      C800CACACA00CDCDCD00CFCFCF00D1D1D100D3D3D300D6D6D600D8D8D800D9D9
      D900DBDBDB00DCDCDC00DCDCDC00DBDBDB00D9D9D900D7D7D700D5D5D500D3D3
      D300D1D1D100CFCFCF00CCCCCC00CBCBCB00C2C2C200ABABAB00AEAEAE00AEAE
      AE00A6A6A600B9B9B900D9D9D900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFDFC0086BE9400A3D0AD00A0CDA9009FCDA8009CCBA70097C9A20095C9
      A00094C8A00082BD8E0096CBA300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC009D9D9D00B5B5B500B2B2
      B200B1B1B100AFAFAF00ABABAB00AAAAAA00A9A9A90099999900ACACAC000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5F5F500DDDDDD00D8D8
      D800D9D9D900D9D9D900DADADA00DADADA00DADADA00DBDBDB00DBDBDB00DBDB
      DB00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DDDDDD00DDDDDD00DDDDDD00DDDD
      DD00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DBDBDB00DBDBDB00DBDBDB00DADA
      DA00DBDBDB00DDDDDD00DCDCDC00DCDCDC00DBDBDB00DFDFDF00F8F8F8000000
      000000000000F5F5F500DDDDDD00D8D8D800D9D9D900D9D9D900DADADA00DADA
      DA00DADADA00DBDBDB00DBDBDB00DBDBDB00DCDCDC00DCDCDC00DCDCDC00DCDC
      DC00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DCDCDC00DCDCDC00DCDCDC00DCDC
      DC00DBDBDB00DBDBDB00DBDBDB00DADADA00DBDBDB00DDDDDD00DCDCDC00DCDC
      DC00DBDBDB00DFDFDF00F8F8F800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F3F9F600E6F1E900E6F1E800E6F1E800E6F1E800E5F1E800E6F1
      E800E6F1E800E4F0E600F5F9F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F6F600EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00E8E8E800F6F6F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FEFEFD00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FDFDFD00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FEFE
      FD00FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FDFDFD00FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00F8FAF800ECF3ED00DEEBE000D7E6D900DFEBE000EFF5EF00FCFDFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00F8F8F800EEEEEE00E3E3E300DCDC
      DC00E3E3E300F1F1F100FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFF00F6F9F600E6EFE700D9E7
      DB00D9E8DB00E6EFE700F3F7F400FCFDFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00F7F7F700E9E9E900DEDEDE00DEDEDE00E9E9E900F4F4F400FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFE00FAFCFA00F1F6F200E2ED
      E300CDE0D000B7D2BB00A4C7AA00A3C6A800BBD5BF00DEEAE000F7FAF700FEFE
      FE00FFFEFE00FFFEFE00FFFEFE00FFFEFF00000000000000000000000000FFFE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FAFAFA00F3F3F300E6E6E600D4D4D400C1C1C100B1B1B100B0B0
      B000C5C5C500E2E2E200F8F8F800FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00000000000000000000000000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFF000000000000000000FFFE
      FF00FFFEFE00FFFEFE00FFFEFE00FEFEFE00FCFDFC00ECF3EC00CBDFCE00ABCB
      B000A1C5A600ADCCB200C3DAC600D9E7DB00EBF2EC00F7F9F700FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FCFCFC00EEEEEE00D2D2D200B7B7B700AEAEAE00B9B9B900CBCBCB00DEDE
      DE00EDEDED00F7F7F700FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFE00FCFCFC00F5F8F500E9F1EA00D9E7DB00C7DCCA00B6D2
      BA00A8C9AD00A0C4A5009CC2A200A3C6A800B6D2BA00CDE0CF00DDE9DE00E1EC
      E300E2ECE300E2EDE300E2EDE400E3EDE400E4EEE500E4EEE500E4EEE500E5EE
      E600E5EFE600E6EFE700E6F0E800E9F1EA00F0F5F000F8FAF800FEFEFD000000
      00000000000000000000000000000000000000000000FEFEFE00FCFCFC00F6F6
      F600ECECEC00DEDEDE00CFCFCF00C0C0C000B4B4B400ADADAD00AAAAAA00B0B0
      B000C0C0C000D4D4D400E1E1E100E5E5E500E5E5E500E6E6E600E6E6E600E6E6
      E600E7E7E700E7E7E700E7E7E700E8E8E800E8E8E800E9E9E900EAEAEA00ECEC
      EC00F1F1F100F8F8F800FDFDFD000000000000000000FBFCFB00F3F8F400ECF3
      EC00E7F0E800E6EFE700E5EFE700E5EEE600E4EEE600E4EEE500E4EEE500E3EE
      E400E3EDE400E2EDE400E2ECE300E1ECE300E0EBE100D5E5D800C0D8C400AACB
      AF009EC3A3009EC3A300A4C7A900AFCEB400BFD7C200D1E2D300E3EDE400F0F5
      F100F9FBF900FEFEFE0000000000000000000000000000000000000000000000
      000000000000FBFBFB00F5F5F500EEEEEE00EAEAEA00E9E9E900E9E9E900E8E8
      E800E8E8E800E7E7E700E7E7E700E7E7E700E6E6E600E6E6E600E5E5E500E5E5
      E500E4E4E400DBDBDB00C9C9C900B6B6B600ACACAC00ACACAC00B1B1B100BBBB
      BB00C8C8C800D7D7D700E6E6E600F2F2F200F9F9F900FEFEFE00000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00F8FAF800F0F5F000E4EEE500D6E5D800C8DDCB00BDD6C100B6D2BA00B2D0
      B700B2CFB600B2CFB600B6D0B900BCD3BE00B7D3BB00BAD5BE00BDD6C100BED7
      C200BED7C200BED7C200BFD7C200BFD7C300C0D8C300C0D8C300C0D8C300C0D8
      C400C0D8C400C1D8C400C1D9C400C8DDCB00D8E7DA00ECF3ED00FBFCFB000000
      0000000000000000000000000000FDFDFD00F8F8F800F1F1F100E7E7E700DBDB
      DB00D0D0D000C6C6C600C0C0C000BDBDBD00BDBDBD00BDBDBD00BFBFBF00C4C4
      C400C1C1C100C4C4C400C6C6C600C7C7C700C7C7C700C7C7C700C8C8C800C8C8
      C800C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900CACACA00D0D0
      D000DDDDDD00EEEEEE00FBFBFB0000000000FEFEFE00F4F8F400E2EDE300CEE1
      D100C3DAC600C1D8C400C0D8C400C0D8C400C0D8C400C0D8C300C0D8C300BFD8
      C300BFD7C200BFD7C200BED7C200BED7C200BED7C100BCD6C000B9D4BD00B5D1
      B900B3D0B700B2CFB600B2CFB600B2CFB600B4D1B800B9D4BD00C3D9C600CFE1
      D200DDEADF00EBF2EB00F5F8F500FBFCFB00FEFEFE0000000000000000000000
      0000FEFEFE00F5F5F500E6E6E600D5D5D500CBCBCB00C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C8C8C800C8C8C800C8C8C800C7C7C700C7C7
      C700C7C7C700C6C6C600C3C3C300BFBFBF00BEBEBE00BDBDBD00BDBDBD00BDBD
      BD00BFBFBF00C3C3C300CBCBCB00D6D6D600E2E2E200EDEDED00F6F6F600FBFB
      FB00FEFEFE000000000000000000000000000000000000000000FEFEFE00F7FA
      F700EBF2EC00DDEADF00D1E3D300CADECD00C7DCCA00C6DCC900C6DCC900C7DC
      CA00C7DCCA00D3DED200BEDDC8009ED1AC00C3DAC600C7DCCA00C6DBC900C6DB
      C900C5DBC900C5DBC900C5DBC900C5DBC900C5DBC900C5DBC900C5DBC900C5DB
      C900C5DBC800C5DBC800C5DBC900CCDFCE00DCE9DD00EFF5EF00FCFCFC000000
      00000000000000000000FEFEFE00F8F8F800EDEDED00E2E2E200D7D7D700D1D1
      D100CFCFCF00CECECE00CECECE00CFCFCF00CFCFCF00D6D6D600CBCBCB00B3B3
      B300CBCBCB00CFCFCF00CECECE00CECECE00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00D3D3
      D300E0E0E000F1F1F100FCFCFC0000000000FEFEFE00F6F9F600E4EEE600D2E3
      D400C7DCCA00C5DBC800C5DBC800C5DBC800C5DBC900C5DBC900C5DBC900C5DB
      C900C5DBC900C5DBC900C5DBC900C5DBC900C6DBC900C6DBC900C5DCC800CFDF
      D000D6DFD400D3DFD300CCDECE00C6DCCA00C6DCCA00C6DCC900C6DCC900C8DD
      CB00CDE0D000D7E6D900E5EEE600F3F7F300FBFCFB0000000000000000000000
      0000FEFEFE00F7F7F700E8E8E800D8D8D800CFCFCF00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CECECE00CECECE00CDCDCD00D4D4D400D8D8D800D7D7D700D2D2D200CECE
      CE00CECECE00CECECE00CECECE00D0D0D000D4D4D400DCDCDC00E8E8E800F4F4
      F400FBFBFB000000000000000000000000000000000000000000FEFEFE00FBFC
      FB00F4F8F400ECF3ED00E4EEE500DFEBE000DCE9DD00DAE8DC00DAE8DC00DCE8
      DD00EBEBE70097DCB4000EB74B001DA23900D6E5D700DDE9DF00DAE8DC00DAE8
      DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00DBE8
      DC00DBE8DD00DBE8DD00DBE8DD00E0EBE100EAF2EB00F6F9F600FDFEFD000000
      00000000000000000000FEFEFE00FBFBFB00F5F5F500EEEEEE00E7E7E700E3E3
      E300E0E0E000DFDFDF00DFDFDF00E0E0E000E9E9E900B7B7B7005A5A5A005252
      5200DBDBDB00E1E1E100DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00E0E0E000E0E0E000E0E0E000E4E4
      E400EDEDED00F7F7F700FDFDFD000000000000000000FAFBFA00F0F5F000E4EE
      E500DCE9DE00DBE8DD00DBE8DD00DBE8DD00DAE8DC00DAE8DC00DAE8DC00DAE8
      DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00E0E9E000ACD9
      BA005ED4910073D19600CFE0D000E6ECE500D9E8DB00DAE8DC00DBE9DD00DDEA
      DF00E1ECE200E8F0E900F0F6F100F8FAF800FDFDFD0000000000000000000000
      000000000000FAFAFA00F1F1F100E7E7E700E1E1E100E0E0E000E0E0E000E0E0
      E000DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00E3E3E300BFBFBF00969696009E9E9E00D5D5D500E7E7
      E700DEDEDE00DFDFDF00E0E0E000E2E2E200E5E5E500EBEBEB00F2F2F200F8F8
      F800FDFDFD000000000000000000000000000000000000000000000000000000
      000000000000FDFEFD00FAFCFA00F6F9F600F2F7F300EEF4EF00F2F3F000FAF4
      F5007DDBA70000B33D0000A41F0026AE4300EAF1EB00F2F6F200F0F5F000F0F5
      F000F0F5F000F0F5F100F0F5F100F0F5F100F0F5F100F0F5F100F0F5F100F1F6
      F100F1F6F100F1F6F100F1F6F100F3F7F300F7FAF700FCFCFC00000000000000
      00000000000000000000000000000000000000000000FDFDFD00FAFAFA00F7F7
      F700F4F4F400F0F0F000F1F1F100F6F6F600AAAAAA0050505000414141005D5D
      5D00ECECEC00F3F3F300F1F1F100F1F1F100F1F1F100F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F4F4
      F400F8F8F800FCFCFC00000000000000000000000000FEFEFE00FAFBFA00F5F8
      F500F2F6F200F1F6F100F1F6F100F1F6F100F1F6F100F0F5F100F0F5F100F0F5
      F100F0F5F100F0F5F100F0F5F000F0F5F000F0F5F000F0F5F000FFF9FA005DBE
      7C0000C9510025C35A0027AE4A00CBE6D300FDF9FA00EDF4EE00F0F6F100F5F8
      F500F9FBF900FCFDFC00FEFEFE00000000000000000000000000000000000000
      000000000000FEFEFE00FAFAFA00F6F6F600F3F3F300F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F1F1F100F1F1
      F100F1F1F100F1F1F100FBFBFB00878787005E5E5E006B6B6B005F5F5F00D6D6
      D600FAFAFA00EFEFEF00F2F2F200F6F6F600F9F9F900FCFCFC00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000F7FFFC005EE9
      A10000B1340004B12D0002C137002AB94D00F7F8F70000000000FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FFFEFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE0000000000FBFBFB00A2A2A2004C4C4C004B4B4B00535353006565
      6500F7F7F70000000000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE0000000000000000000000000000000000000000000000000000000000FFFE
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000066BC
      820000CE5C0030C9680000AD2C0010B03E00B5E1C10000000000FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00000000008C8C8C006363630075757500484848005454
      5400C7C7C70000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5F8EE003AE58A0000C6
      400006BE370008D2490003D54E002BC15300FBFAFA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EEEEEE008D8D8D00575757005353530061616100626262006A6A
      6A00FAFAFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000065B4
      7D0000D15E002EC7650000A82C0000B2330002AE2F0090D7A300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000878787006565650073737300464646004C4C
      4C004A4A4A00AEAEAE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6FEE4001DD16B0000BD370007CB
      450009DF5E0009E3640002E263002AC65700FCF9F90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E2E2E20073737300515151005D5D5D006C6C6C00707070006D6D6D006D6D
      6D00FAFAFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00DDEBE000D7EF
      E000D4E9DC00DCECE200E1EFE600E4EFE900E9F1ED00EFF4F100F1F5F300F4F6
      F500F8F8F900FCFAFC00FEFBFE00FFFDFF0000000000000000000000000064A8
      750000C858002DC4630000951E0001A0280000A6290000A41D0064C57B00FAFC
      FB00000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00E2E2E200E2E2E200DDDDDD00E3E3E300E7E7E700E9E9
      E900EDEDED00F1F1F100F3F3F300F5F5F500F8F8F800FBFBFB00FDFDFD00FEFE
      FE000000000000000000000000008080800060606000717171003B3B3B004343
      430045454500404040008C8C8C00FBFBFB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A0F9CF000DE5700002C53F0008D5510009E5
      6A000AE86E0008E5680005E665000FD14E0047BF6B004EBD6F0051BC700056BC
      72005CBE760063BF7B0069C17F0070C5850077C98C007ECE920082D5980083D9
      9C0082DA9D007DD8980077D6950071D3910064CD85008ACA9C00000000000000
      000000000000000000000000000000000000000000000000000000000000CDCD
      CD00767676005757570064646400727272007575750071717100707070006464
      64007B7B7B007E7E7E007F7F7F008181810085858500898989008D8D8D009393
      9300999999009F9F9F00A5A5A500A8A8A800A8A8A800A4A4A400A0A0A0009C9C
      9C0092929200A5A5A500000000000000000000000000DBEBDF0013AC4B0023AC
      4A000B8C290015953600189638001B973B0022994100279944002B9B470033A0
      4F003BA3560042A75C0046A85F0048A760004CA5620052A666005DAA6F002C8C
      41000E9D390023AF4A0000921C0001951F0001991F00019F2200009E15003EB5
      5500E7F4EA000000000000000000000000000000000000000000000000000000
      000000000000E1E1E100585858005D5D5D00404040004A4A4A004C4C4C004F4F
      4F0054545400565656005959590060606000666666006C6C6C006F6F6F006F6F
      6F0071717100747474007C7C7C00535353004C4C4C005E5E5E003A3A3A003C3C
      3C003D3D3D00404040003B3B3B006D6D6D00ECECEC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFEFD0073E8AB0000D65A0005C13C0007D24D0009E264000AE5
      680008E4640007E2600007E15F0006E15B0000D6460000D13E0000D03C0000D0
      3D0000CE390000CD370000CF390000CF380000CD340000CE370000D13B0000D2
      3C0000D23C0000D23A0000D1390000D23A0000CB32002BA33D00FFFCFF000000
      00000000000000000000000000000000000000000000FDFDFD00ACACAC006565
      650056565600626262006F6F6F0072727200707070006D6D6D006D6D6D006B6B
      6B005E5E5E005A5A5A0059595900595959005757570056565600585858005757
      57005555550057575700595959005A5A5A005A5A5A0059595900585858005959
      59005454540059595900FEFEFE000000000000000000DDEEE20013CC650017A9
      3E0000831200008A1A00008E1B0000921C0000911C00008F1A00008B17000089
      15000088140000881400008C1500008F1600009015000091140000931300029A
      1D00049A1F00019A1C0001991D0001961C0001951B0001951A0001981B000099
      11001CA63300CAE8D00000000000000000000000000000000000000000000000
      000000000000E4E4E4006C6C6C00545454003131310036363600383838003A3A
      3A00393939003838380036363600343434003434340034343400353535003737
      37003737370037373700373737003D3D3D003F3F3F003D3D3D003D3D3D003B3B
      3B003B3B3B003A3A3A003C3C3C003838380051515100D6D6D600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ECF6EF0046CD800008C64F0013BB400002C33F0007D04B0008D64F0008DA
      530007D84F0007D84E0008DB540008DC570007DA520006DA500006D84E0005D6
      4A0005D5490005D5490004D3460004D3440004D3450004D3470004D4480005D3
      460003D0400003CD3C0003CE3C0003D03E0000C9380030A84800FFFCFF000000
      000000000000000000000000000000000000F0F0F000868686005F5F5F005A5A
      5A00565656006060600064646400676767006464640064646400676767006969
      69006666660065656500646464006161610061616100616161005F5F5F005E5E
      5E005E5E5E005F5F5F00606060005F5F5F005B5B5B0059595900595959005B5B
      5B005555550060606000FEFEFE000000000000000000E3F2E8001AD9740019AA
      4300007C1200018019000182190001861B00018C1D0001911F0001921F00018F
      1D00018D1C00018B1B00018A1A00018B1A00018D1A00018D1900018E19000190
      1A0001931A0001981B00019D1D0001A01D0001A11E0001A31F0001A3200001A6
      210000A71D0009AA2800A2DCAF00000000000000000000000000000000000000
      000000000000E9E9E90077777700575757002F2F2F0033333300343434003636
      3600383838003B3B3B003B3B3B00393939003838380037373700373737003737
      3700383838003737370038383800393939003A3A3A003C3C3C003E3E3E003F3F
      3F00404040004141410041414100424242004141410049494900B9B9B9000000
      000000000000000000000000000000000000000000000000000000000000CFE7
      D60022B1580010BD4A0035BF580036C4600015BD470001BC380006C53E0007C6
      3C0006CA3C0008D0440008D2450007CE400007CB3C0005C7380005C6360005C6
      360005C4340004C2320005C3330004C2320004C2310005C4340005C3320003BC
      2A0002B9260002BA280002BB280002BA280000B6220031A44700FFFDFF000000
      0000000000000000000000000000D9D9D900636363005D5D5D006E6E6E007373
      73005D5D5D00515151005858580058585800595959005E5E5E005F5F5F005C5C
      5C005A5A5A005656560055555500555555005454540052525200535353005252
      52005252520054545400535353004D4D4D004B4B4B004C4C4C004C4C4C004C4C
      4C00484848005E5E5E00FEFEFE000000000000000000E4F3E9001BD6710019A7
      420000760F00017A1500017A1500017A1400017C1500017E1500018216000084
      17000083160000831500008415000084150000861600018A1700018B1800018D
      180001911A0001941C00019B1E0001A4220002AB260002B12A0003B52D0003B8
      300003B9320000B92F0000B1280076D08E00FFFEFF0000000000000000000000
      000000000000EAEAEA0076767600565656002C2C2C0030303000303030002F2F
      2F00303030003131310033333300333333003333330032323200333333003333
      330034343400363636003636360037373700393939003B3B3B003E3E3E004242
      420046464600494949004C4C4C004E4E4E004F4F4F004D4D4D00484848009C9C
      9C00FEFEFE000000000000000000000000000000000000000000AFD9BB000DA0
      3E0024BF510049C3660047C3680044C0650042C0630021B9490002AF2F0002B5
      310007C03A0007C33B0008C33A0006BC340005B62F0006B7300006B6300005B0
      2C0005B02C0005B02D0005AB2A0004AB290005AF2C0004A9290003A22200029F
      2000029F2000029F200003A2220003A22200009B180030984300FFFEFF000000
      00000000000000000000C1C1C1004E4E4E00666666007B7B7B007B7B7B007878
      780077777700616161004A4A4A004D4D4D005555550057575700575757005252
      52004E4E4E004F4F4F004E4E4E004B4B4B004B4B4B004B4B4B00484848004848
      48004A4A4A004747470042424200404040004040400040404000424242004242
      42003B3B3B0059595900FEFEFE000000000000000000E5F3E9001CD3700018A6
      400000740C00007712000075120000741100007511000076120000771200007B
      1200007E130000811400008416000087170001891800018D1A0001921C000296
      1E00029A2000029F220002A5260002AD2A0003B8310003C2370004C93C0004CD
      3F0004CE400004CA3F0003C73E0000BA2D004CC76F00F1F9F400000000000000
      000000000000EBEBEB0075757500545454002A2A2A002D2D2D002D2D2D002C2C
      2C002C2C2C002D2D2D002D2D2D002F2F2F003030300031313100333333003434
      340036363600383838003A3A3A003C3C3C003E3E3E0041414100444444004848
      48004E4E4E0054545400585858005A5A5A005B5B5B0059595900585858004D4D
      4D0080808000F4F4F400000000000000000000000000B5D7BD00007F170037C3
      5C0063CB770058C6730054C36F0052C26C0050C16B0050C06A003ABC590011B1
      390000B22C0002B52F0005AD2B0005A9290005AC2B0005A92A0004A3270004A3
      2800039D260003982300039923000399230003922000028D1D0002881B000285
      190002881B00028E1E00028D1D0002861A000082120030904100000000000000
      000000000000C3C3C30032323200727272008C8C8C0085858500828282008080
      80007E7E7E007E7E7E006F6F6F00535353004A4A4A004C4C4C00494949004747
      470049494900484848004444440045454500424242003F3F3F003F3F3F003F3F
      3F003C3C3C00393939003737370035353500373737003A3A3A00393939003636
      36003131310055555500000000000000000000000000E5F3E9001CD06E0017A4
      3E0000740B00007C1300007C1300007A12000079120001791300017B1300017F
      140001861700028E1A0002951C00029C200002A2220002A8250002AE290003B4
      2D0003B82F0003BA310002BD320001C0320001C4340004CB3A0008D2420007D7
      470006D94A0005D84A0004D4470004D0470000C5370027BA4C00F0F8F2000000
      000000000000EBEBEB0073737300535353002A2A2A002F2F2F002F2F2F002E2E
      2E002E2E2E002F2F2F002F2F2F003131310034343400383838003B3B3B003F3F
      3F004242420045454500484848004C4C4C004E4E4E004F4F4F00505050005151
      510053535300585858005E5E5E006161610063636300626262005F5F5F005E5E
      5E005454540064646400F3F3F3000000000000000000F5F8F500519F61000192
      280056C6700070CC810065C97A0061C677005EC674005BC472005CC3720057C5
      6F003BBC570016A63400029B2100009E2000009E2100029F2300039A22000392
      2000038D1E00038C1E0002871B0002851A00028119000179160001751500027D
      180002831A00027E1800017716000076140000710C002F893E00000000000000
      000000000000F6F6F600707070003E3E3E0084848400949494008D8D8D008A8A
      8A00888888008585850085858500838383006F6F6F00505050003F3F3F003F3F
      3F003F3F3F00414141003F3F3F003C3C3C003A3A3A0039393900363636003535
      350034343400303030002E2E2E003232320035353500323232002F2F2F002E2E
      2E002929290052525200000000000000000000000000E5F3E9001CCD6C0015A0
      3900006B030000750F00007D130000861700028E1A0002971D00029F1F0002A4
      210002AA240002B0270002B72B0003BC2F0003C1310002C4330001C6340000C9
      340000CC370000CF3A0003D23F000BD6470014D94F0018DC540016DE580013E1
      5C0011E461000FE563000EE6670007E1610005CA450095DDA700000000000000
      000000000000EBEBEB00717171004F4F4F00242424002C2C2C00303030003434
      3400383838003C3C3C00404040004242420045454500484848004C4C4C004F4F
      4F005151510053535300535353005454540056565600585858005C5C5C006262
      6200696969006D6D6D006E6E6E00707070007272720072727200737373006D6D
      6D005C5C5C00B3B3B300000000000000000000000000000000000000000072D0
      970000AD3C0050C56C007DD08A0072CD84006ECA80006BC87D0068C87B0066C5
      790066C0780061BB71004EB5610030AD490018A7340008982300008B19000087
      160000821400007C1300007E1400007B140000711100006F100000781300007D
      14000077130000721100006D1000016B1200006E1200388C4600000000000000
      00000000000000000000000000009D9D9D004D4D4D00808080009D9D9D009696
      960092929200909090008E8E8E008C8C8C008A8A8A0084848400767676006262
      620051515100414141003636360034343400323232002F2F2F00303030002F2F
      2F002B2B2B002A2A2A002E2E2E00303030002E2E2E002B2B2B00292929002A2A
      2A002A2A2A0058585800000000000000000000000000E5F3E90018C865002FB0
      5400278B35000D85230001871A000092190000A21D0000B1220000BA250000BE
      280000C1290000C32A0000C62C0000CA2F0000CD330001D13A0006D642000EDA
      4D0019DE590026E368002FE7730031E978002EEA7A0029EA780026EA770022EB
      76001FEC77001FEF7E0014EC76001FD45D00C0EBCA0000000000000000000000
      000000000000EBEBEB006C6C6C00666666004D4D4D003C3C3C00363636003939
      39003F3F3F00464646004A4A4A004C4C4C004E4E4E004F4F4F00505050005353
      530055555500595959005F5F5F0067676700707070007B7B7B00838383008686
      86008686860083838300828282008181810080808000848484007C7C7C007070
      7000D1D1D1000000000000000000000000000000000000000000000000000000
      000092E5B70000B9460045C468008AD3940081D090007BCE8A0077CB880075C8
      840071C180006FBF7E006FC680006FC9800068C179005CB66C004DAD5E003A9F
      4C002C953E00229236001C8C300017812900158128001585280015892900188A
      2B001C862F00228031002A82370031883F00308B3F004C975800FFFEFF000000
      000000000000000000000000000000000000BABABA00555555007B7B7B00A5A5
      A500A0A0A0009B9B9B009898980095959500909090008E8E8E00919191009292
      92008B8B8B007F7F7F007272720061616100555555004E4E4E00484848004040
      40003F3F3F0040404000424242004444440045454500464646004B4B4B005252
      52005353530069696900FEFEFE000000000000000000E5F3E90012C15C0050C3
      75009FCCA5008AC7950077C3860065C3780053C96C0045D164003ED762003AD9
      620039DB640039DD67003BDF6B003FE1710046E47A004BE7810050E9870052EB
      8B0052ED8D004EEE8D0048EF8D0044F08D0040F18F003DF18F0039F28E0035F2
      8C0034F5920022EC7E003CD76E00DCF2E0000000000000000000000000000000
      000000000000EBEBEB006565650082828200B0B0B000A2A2A200959595008A8A
      8A00828282007E7E7E007D7D7D007C7C7C007D7D7D007F7F7F00818181008585
      85008C8C8C009191910095959500989898009999990098989800969696009595
      950095959500949494009393930091919100939393008484840080808000E4E4
      E400000000000000000000000000000000000000000000000000000000000000
      000000000000B4F2D20008C8580035C462008FD49B008ED49D0086D2970084CB
      930081CA90007ECF90007BCF8E007ACC8B0076C7870074C1830072BD810070BD
      80006CBB7C0068B6770064B273005FAF6F005BAD6A0058AD680054AE660051A5
      60004D9A5A00499756004597530040944E003691470049995600FDFEFD000000
      00000000000000000000000000000000000000000000D2D2D200626262007373
      7300AAAAAA00AAAAAA00A5A5A500A0A0A0009E9E9E009F9F9F009D9D9D009B9B
      9B009696960092929200909090008F8F8F008B8B8B0087878700838383007F7F
      7F007B7B7B007979790078787800727272006B6B6B0067676700656565006060
      60005A5A5A0068686800FDFDFD000000000000000000E4F3E90010BE59004EC4
      7400AED7B500A5D7B000A4DAB000A2DFAF009FE6AD009BEBAF0098EFB00093F0
      B0008FF0AF008BF1AE0087F2AE0082F2AC007DF2AA0078F2A80072F2A6006DF3
      A4006BF5A50065F4A2005CF29B0058F29A0054F39B0050F39A004DF39A004EF6
      A00034E981005EDA8300F0F8F000000000000000000000000000000000000000
      000000000000EAEAEA006262620082828200BEBEBE00B9B9B900BABABA00BABA
      BA00BBBBBB00BCBCBC00BDBDBD00BBBBBB00BABABA00B8B8B800B7B7B700B5B5
      B500B3B3B300B0B0B000AEAEAE00ACACAC00ACACAC00A9A9A900A3A3A300A1A1
      A100A0A0A0009F9F9F009E9E9E00A1A1A1008A8A8A0093939300F2F2F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D2FBE60018D66A0025C45C0093D8A2009DD8AB0092D6
      A30090D7A2008DD8A0008DD7A0007BCB8E0067BA790067BB790063BB76005FB6
      73005EB372005AB36F0055AE6A0051A967004EAA65004CAD660049A66200479E
      5E00489F600047A0600046A0600045A060003D9D5B005EAC7500000000000000
      0000000000000000000000000000000000000000000000000000E6E6E6007272
      72006C6C6C00AFAFAF00B5B5B500AEAEAE00ADADAD00ACACAC00ACACAC009C9C
      9C0088888800898989008686860082828200818181007E7E7E00797979007575
      75007474740075757500707070006B6B6B006D6D6D006D6D6D006C6C6C006C6C
      6C00676767007F7F7F00000000000000000000000000E3F2E70009B64B004AC2
      6E00C2E1C600B5E0BE00AFE0BA00A9E2B500A4E5B2009EE7B00097E7AC0090E5
      A7008AE4A30083E29E007CE0990077DF960072DD92006DDB8C0069D9880064D9
      840059D27A005BDD830072EDA1006EEC9F006AEC9C0066ED9B0067F1A10045DD
      7A007BD99300FCFCFB0000000000000000000000000000000000000000000000
      000000000000E9E9E900585858007E7E7E00CDCDCD00C6C6C600C3C3C300C0C0
      C000BEBEBE00BCBCBC00B8B8B800B4B4B400B0B0B000ABABAB00A7A7A700A4A4
      A400A0A0A0009C9C9C0098989800959595008C8C8C0093939300AAAAAA00A8A8
      A800A6A6A600A4A4A400A8A8A80089898900A2A2A200FBFBFB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EBFFF60032E07F0014BE510090D9A300AAE1
      B8009EE0B1009BDFAF009ADBAC008CCD9C00ECF5EF00FAFDFB00F8FCF900F8FC
      FA00FBFDFC00FCFDFD00FCFDFD00FCFEFE00FDFEFE00FDFEFF00FEFFFF00FEFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F5F5
      F5008585850061616100AEAEAE00C1C1C100BABABA00B8B8B800B5B5B500A7A7
      A700F0F0F000FBFBFB00F9F9F900FAFAFA00FCFCFC00FCFCFC00FCFCFC00FDFD
      FD00FDFDFD00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFCFA0083DDA80066C6
      81009ACAA30097CDA30098CFA30097CFA3009AD1A5009FD3A900A1D3AB00A5D4
      AE00AFD9B700B9DEBF00BDE0C300C3E3C900CBE8D100D1EAD500E4EFE30066D7
      900000B5400040C3670086E5A20084E7A40081E8A10080EAA50053D1760098DB
      A600000000000000000000000000000000000000000000000000000000000000
      000000000000FAFAFA00ADADAD008F8F8F00ADADAD00ADADAD00AEAEAE00ADAD
      AD00B0B0B000B3B3B300B5B5B500B7B7B700BFBFBF00C7C7C700CACACA00CFCF
      CF00D6D6D600DADADA00E7E7E700999999005151510078787800AFAFAF00AFAF
      AF00AEAEAE00AFAFAF0088888800B3B3B3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9FFFF0052DD8F0005AA3E0086DA
      9F00B7E8C500A9E1B900A7DFB70097D5A700F5FAF60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00949494004F4F4F00AAAAAA00CCCCCC00C1C1C100BFBFBF00B1B1
      B100F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007ADE
      A50000D863004DC875009AE0AB009FE7B30097E6AE005BCB7700B5E1BE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A9A9A9006969690083838300B7B7B700BDBD
      BD00B9B9B90089898900C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000075D59C0000AB
      3C0074D49300BDE5C800B6E5C5009ED9AD00F5FAF60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A2A2A2004D4D4D009E9E9E00CECECE00CACACA00B6B6
      B600F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000079CF
      980000E06A004BCB7600B4E2BE00A7E2B60069C97F00CEEDD500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A0A0A0006E6E6E0084848400C6C6C600BFBF
      BF0090909000DADADA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009BE4
      B90003BC480060D08500C4EBCF00A7DEB600F4FAF50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD005757570091919100D4D4D400BEBE
      BE00F6F6F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000075C0
      8B0000D35E004ED17D00A5D7AD0078C78800E2F2E50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000959595006565650089898900B8B8B8009797
      9700E8E8E8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDF5D6000DC3530042C56F0092D5A200F6FAF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8D8D800616161007C7C7C00ADAD
      AD00F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000075B9
      850000BA44002FC35F0080C18800F4FAF5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000091919100545454007070700098989800F6F6
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DBF8E80086D5A100A9E2BB00FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900A9A9A900C2C2
      C200FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E9F2
      EA00A1E5BD00A4E7BD00FBFAF900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ECECEC00C1C1C100C2C2C200FAFAFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AEB1B40092949700BEBEBE00B5B5B500B7B7B700B9B9B900BCBCBC00BFBF
      BF00C2C2C200C6C6C600C9C9C900CDCDCD00D1D1D100D5D5D500DADADA00DDDD
      DD00E2E2E200E6E6E600EAEAEA00EDEDED00F1F1F100F4F4F400F7F7F700FAFA
      FA00FCFCFC00FEFEFE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B1B10094949400BEBEBE00B5B5
      B500B7B7B700B9B9B900BCBCBC00BFBFBF00C2C2C200C6C6C600C9C9C900CDCD
      CD00D1D1D100D5D5D500DADADA00DDDDDD00E2E2E200E6E6E600EAEAEA00EDED
      ED00F1F1F100F4F4F400F7F7F700FAFAFA00FCFCFC00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFEFF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFD
      FE00FDFDFD00FDFDFD00FDFDFD00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AAAD
      B000555556004A4B4D00B7BABD0000000000F2F2F200F2F2F200F3F3F300F3F3
      F300F4F4F400F5F5F500F5F5F500F6F6F600F7F7F700F7F7F700F8F8F800F9F9
      F900FAFAFA00FAFAFA00FBFBFB00FCFCFC00FCFCFC00FDFDFD00FEFEFE00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ADADAD00555555004B4B4B00BABABA000000
      0000F2F2F200F2F2F200F3F3F300F3F3F300F4F4F400F5F5F500F5F5F500F6F6
      F600F7F7F700F7F7F700F8F8F800F9F9F900FAFAFA00FAFAFA00FBFBFB00FCFC
      FC00FCFCFC00FDFDFD00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAFBFA00ECEF
      EC00D6DDD800C4CEC600BCC7BF00BCC7BE00BCC7BF00BCC8BF00BCC7BF00BBC7
      BE00BBC6BD00BAC6BD00BFCAC100CED6D000E5E9E600F7F8F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAFAFA00EDEDED00D9D9D900C8C8C800C0C0C000C0C0
      C000C0C0C000C1C1C100C0C0C000C0C0C000BFBFBF00BFBFBF00C3C3C300D1D1
      D100E6E6E600F7F7F70000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009A9DA0003B3C
      3C005E5E5D0060605F0051525300C6C9CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009D9D9D003B3B3B005D5D5D005F5F5F0052525200C9C9
      C900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F3F5F300D0D8
      D200A6B4A9007F9485006F8775006E8574006F8474006F8373006F8474006E84
      73006D8473006C837200768A7B0098A59B00C3CDC600EBEEEC00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3F3F300D3D3D300ABABAB0088888800797979007777
      77007777770077777700777777007777770076767600757575007E7E7E009D9D
      9D00C7C7C700ECECEC00FEFEFE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000919497000A0A0B003333
      3300494A4A005E5F5F0060605F004E4F5000C4C7CA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000949494000A0A0A0033333300494949005E5E5E005F5F5F004F4F
      4F00C7C7C7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F2F4F200D2D8
      D40051835900155E20001763240017732B00188734001894390018863300188E
      3700167F2E00167D2D00167F2E0026843B00B3C1B500EDEFEE00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F2F2F200D4D4D4006464640031313100343434003C3C
      3C00464646004C4C4C0045454500494949004141410040404000414141004C4C
      4C00B8B8B800EEEEEE00FEFEFE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A3A6A900000000001717
      1700343434004A4A4A005E5E5E005D5D5D004E4F5100C4C7CA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A6A6A6000000000017171700343434004A4A4A005E5E5E005D5D
      5D004F4F4F00C7C7C70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F5F6F500D1D8
      D300349249001B8B3400218F3B00219D420022AF4B0022BE530022B34E0022B9
      510022AE4C0022A9490020A948001EA34400ACC5B300F4F2F300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F5F5F500D4D4D4005A5A5A00484848004E4E4E005555
      55005E5E5E006666660061616100646464005E5E5E005C5C5C005B5B5B005757
      5700B6B6B600F3F3F30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A2A4A8000000
      01001818170034343400474747005E5E5E00605F5F004F505200C5C7CA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A4A4A400000000001717170034343400474747005E5E
      5E005F5F5F0050505000C7C7C700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F8F900D4D9
      D5001A9433000296220007972700079524000797250007992500079E2800079B
      2700079B26000797240003972100169A3300BBD4C500F8F5F600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F8F8F800D6D6D6004B4B4B003E3E3E00414141004040
      40004141410041414100444444004343430042424200404040003E3E3E004B4B
      4B00C6C6C600F6F6F60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A2A5
      A800000102001514140032323200484848005E5E5E00605F5F004D4F5000C5C7
      CA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5000101010014141400323232004848
      48005E5E5E005F5F5F004E4E4E00C7C7C7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAFAFA00DDDF
      DD001A90340000911C000094210000921F000097210000992100009E2600009B
      2200009921000097200000991E000F952F00C0D4C700FCF9FB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAFAFA00DDDDDD004A4A4A00393939003C3C3C003B3B
      3B003D3D3D003E3E3E00414141003F3F3F003E3E3E003D3D3D003D3D3D004646
      4600C9C9C900FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A3A6A900000102001515140032323200484848005E5E5E00606060004D4E
      5000C4C7CA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A6A6A60001010100141414003232
      3200484848005E5E5E00606060004E4E4E00C7C7C70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFCFC00E5E5
      E50022953C0000921C00019622000197220001A0250001A6270002AC2B0001A7
      250001A6240001A5240000A6230019A03900CCDAD100FFFCFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC00E5E5E500515151003A3A3A003D3D3D003E3E
      3E00424242004444440048484800444444004343430043434300434343005050
      5000D2D2D200FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A3A6A900000102001414140032323200484848005E5E5E005D5C
      5C005C5E6000F5F6F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A6A6A600010101001414
      140032323200484848005E5E5E005C5C5C005E5E5E00F6F6F600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00EEEB
      ED002D99450000911A0001972200019C230001A8280002B22C0002B72C0001B3
      260001B2250001B2270000B327001CA23B00D6DFD900FFFEFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFD00ECECEC0059595900393939003E3E3E004040
      4000454545004A4A4A004C4C4C00484848004848480048484800484848005353
      5300DADADA00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A3A5A900000000001515150032323200494949005C5B
      5B0064656700EFF0F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5000000
      00001515150032323200494949005B5B5B0065656500F0F0F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F6F1
      F500359B4B00008D180001932000019D230002AD2A0002B82D0001BB290001BA
      260001B8250002BA2B0000B7270021A44000DDE3E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F4F4F4005E5E5E00373737003C3C3C004040
      4000484848004D4D4D004C4C4C004B4B4B004A4A4A004D4D4D004A4A4A005757
      5700E0E0E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A4A6AA0000010200111110002E2E2D003B3B
      3B0075777A00EBEBEC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A6A6
      A60001010100101010002D2D2D003B3B3B0077777700EBEBEB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FCF6
      FA003C9A500000871400018E1E00029C250002AB290002B42A0001B6250001B6
      240001B4240002B92B0000B021002AA14500E7EAE90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F9F9F9006262620033333300393939004141
      4100474747004A4A4A004949490049494900484848004C4C4C00454545005A5A
      5A00E8E8E8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A2A4A80011131500202123004D50
      530094959600C2C1C100FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A4A4A40013131300212121005050500095959500C1C1C100FBFBFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFB
      FF00499E590000801000018A1D00029A240002A3260002A9260001A7200001A8
      200001A8220002AF270000A01A002E9C4500EFEFF00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFD006A6A6A0030303000383838004040
      40004343430045454500424242004343430043434300484848003E3E3E005A5A
      5A00EFEFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECEDEF00E6E8EA00EFF0
      F100C2C2C100B6B6B600CACACA00000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FDFDFD00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EDEDED00E8E8E800F0F0F000C1C1C100B6B6B600CACACA000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FDFDFD00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000057A36400007B0C0001881C0002962200029A2100029C200001971B000299
      1D00029B1E00029F210000901300359D4B00F7F6F80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000747474002D2D2D00373737003E3E
      3E003F3F3F003F3F3F003B3B3B003D3D3D003E3E3E0040404000363636005F5F
      5F00F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00F1F1F100C3C3C300C8C8C8000000000000000000000000000000
      0000F9F9F900F3F3F300F0F0F000ECECEC00EBEBEC00ECECED00F0F1F100F4F4
      F400FAFAFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00F1F1F100C3C3C300C8C8
      C80000000000000000000000000000000000F9F9F900F3F3F300F0F0F000ECEC
      EC00EBEBEB00ECECEC00F0F0F000F4F4F400FAFAFA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFEFD00FBFBFB00F9F9F900F7F8F700FFFC
      FF005DA56A0000790A0001851A0001921F0002911D0002901B00018A1800028E
      1900028E1A0002921B0000840F003E9C5100F5F3F500FAFAFA00FBFBFB00FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00FBFBFB00F9F9F900F7F7F700FEFEFE00797979002B2B2B00353535003B3B
      3B003A3A3A00393939003636360038383800383838003A3A3A00313131006363
      6300F4F4F400FAFAFA00FBFBFB00FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00EFEFEF00C4C4C400CACACA00FBFBFB00ECECEC00E7E7
      E700E0E0E000D1D1D200C1C1C100BBB9B700B8B6B400BBB9B700C2C1C000D2D2
      D300E0E1E200E8E9E900FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00EFEFEF00C4C4
      C400CACACA00FBFBFB00ECECEC00E7E7E700E0E0E000D1D1D100C1C1C100B9B9
      B900B6B6B600B9B9B900C1C1C100D2D2D200E1E1E100E8E8E800FBFBFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F9F9F900EEEFEE00E2E5E300DBDFDC00E7E3
      E60060A46C00007A0B0000841800018E1B000189190001891800018416000286
      1600018616000189170000800E003F9B5100D7D6D700DDE0DD00E9EBE900F6F7
      F600FDFEFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F9F9
      F900EEEEEE00E3E3E300DCDCDC00E5E5E5007A7A7A002C2C2C00343434003838
      38003636360036363600333333003434340034343400353535002F2F2F006363
      6300D6D6D600DEDEDE00E9E9E900F6F6F600FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F0F0F000C3C3C30096969600BCBCBD00D6D7
      D700CBC9C700D9D4CE00EBE4DB00F5ECE000F8EDE000F5EADB00ECE0D000D9CF
      C300CBC7C100D2D3D400DADADB00F3F3F3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F0F0
      F000C3C3C30096969600BCBCBC00D6D6D600C9C9C900D3D3D300E3E3E300EBEB
      EB00ECECEC00E8E8E800DEDEDE00CECECE00C6C6C600D3D3D300DADADA00F3F3
      F300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F9F9F900EDEFEE00DFE2DF00D3D8D400DEDA
      DD006CA87500007C0A0000841600008A17000086160001881700018215000183
      1500018415000186160000840F00439D5700CDCBCC00D4D8D400E6E8E600F6F7
      F600FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F9F9
      F900EEEEEE00E0E0E000D5D5D500DCDCDC00838383002C2C2C00333333003535
      3500343434003535350032323200333333003333330034343400313131006767
      6700CCCCCC00D5D5D500E6E6E600F6F6F600FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F9F9F900DADADA00C9C9CA00DADBDB00DEDA
      D500FAF3E900FFF9EE00FFF6EA00FEF3E600FCF1E200FCF0DF00FEEFDD00FFEF
      DB00F9E7D100DED2C300D4D4D300D0D1D200F1F1F10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F900DADADA00C9C9C900DADADA00D9D9D900F2F2F200F7F7F700F5F5F500F2F2
      F200EFEFEF00EEEEEE00EEEEEE00EDEDED00E5E5E500D1D1D100D3D3D300D1D1
      D100F1F1F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFEFD00F9F9F900EFF1EF00E3E6E400E8E4
      E70077B07F00007E0900008215000088170001861600018B1800018616000188
      170002891800028F1A000090130051A46400E1DDE000E8EAE800F5F6F500FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00F9F9F900EFEFEF00E4E4E400E6E6E6008C8C8C002D2D2D00323232003535
      3500343434003636360034343400353535003636360039393900363636007373
      7300DFDFDF00E8E8E800F5F5F500FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEEEEE00C6C6C600DDDEDE00E9E5DF00FFF8
      EF00FDF6EB00FCF2E700FCF1E400FBF0E100FBEEDE00FBEDDB00FAEBD800FAE9
      D400FBE9D200FCE8CE00E9D9C400D9D8D700CACBCC00F9F9F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEEE
      EE00C6C6C600DDDDDD00E4E4E400F7F7F700F4F4F400F1F1F100F0F0F000EEEE
      EE00EDEDED00EBEBEB00E9E9E900E7E7E700E7E7E700E6E6E600D7D7D700D8D8
      D800CBCBCB00F8F8F80000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFE00FCFCFC00F4F5F400F7F1
      F60089BE92000081100000821400018C1900018D190001941C0002931C000295
      1C00029A1E0002A12100009F19005BAA6D00F9F2F800F9F9F900FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FCFCFC00F4F4F400F4F4F4009D9D9D0030303000323232003737
      3700373737003B3B3B003B3B3B003B3B3B003E3E3E00414141003D3D3D007B7B
      7B00F6F6F600F9F9F900FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D5D5D500D3D4D400EBE7E300FFF7ED00FDF5
      EA00FCF3E700FCF1E400FBF0E100FBEEDE00FBEDDB00FAEBD800FAE9D500FAE8
      D200F9E6CE00F9E5CA00FAE3C500E9DAC600D3D4D500D3D3D300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D5D5
      D500D3D3D300E7E7E700F6F6F600F4F4F400F2F2F200F0F0F000EEEEEE00EDED
      ED00EBEBEB00E9E9E900E8E8E800E6E6E600E4E4E400E2E2E200E0E0E000D8D8
      D800D4D4D400D3D3D30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A8D2AF00108F2700058D1F0000911C000298200002A1240002A6240002AA
      250002B1290002B62B0000AE210067B079000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8B8B800424242003B3B3B003939
      39003E3E3E00424242004444440045454500494949004B4B4B00454545008585
      8500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F5F5F500C4C4C500E8E6E400FAF2E900FDF5EB00FCF3
      E700FCF1E400FBF0E100FBEEDE00FBEDDB00FAEBD700FAEAD500FAE9D400FAE9
      D300F9E9D300F9E7D000F9E3C700F5DCBB00E7DFD500C5C6C800F2F2F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F5F5F500C4C4
      C400E6E6E600F1F1F100F4F4F400F2F2F200F0F0F000EEEEEE00EDEDED00EBEB
      EB00E9E9E900E8E8E800E7E7E700E7E7E700E7E7E700E5E5E500E1E1E100D9D9
      D900DEDEDE00C6C6C600F2F2F200000000000000000000000000000000000000
      0000000000000000000000000000EAF2EB00DFEFE200DEF1E200DBEEDF00E6F1
      E80099CEA300229C3A0027A44200099D2A0000A4260002AF2B0003B82E0002BD
      2E0003C2310002C5330000B727006CB47D0000000000EEFDF500EDFCF400ECFA
      F200F8FDFB000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EDED
      ED00E5E5E500E5E5E500E2E2E200EAEAEA00AEAEAE0052525200595959004545
      450043434300494949004D4D4D004F4F4F0052525200535353004A4A4A008989
      890000000000F5F5F500F4F4F400F2F2F200FAFAFA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEDEDE00CECFCF00F2EDE700FEF6EA00FCF2E700FCF1
      E400FBF0E100FBEEDE00FBEDDB00FAEBD800FAEAD500FAE9D400FAE9D300FAEA
      D400FAEAD500FAEBD800FAECD900F9E2C300EFDABF00D3D4D500D7D7D7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE00CECE
      CE00ECECEC00F4F4F400F1F1F100F0F0F000EEEEEE00EDEDED00EBEBEB00E9E9
      E900E8E8E800E7E7E700E7E7E700E8E8E800E8E8E800E9E9E900EAEAEA00DFDF
      DF00D8D8D800D4D4D400D7D7D700000000000000000000000000000000000000
      0000000000000000000000000000378746000081190002A02E0000962700008C
      22000C8C280039AB51003AB1560034B3520013B43D0000B62D0000C3320003C8
      330003CC370003D13A0005C23500139B3C0017D56E0015EB7E0013DF730004CC
      5D008EE3B2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005656
      560033333300454545003F3F3F003A3A3A0040404000676767006B6B6B006868
      6800565656004B4B4B005151510054545400575757005A5A5A00545454004E4E
      4E00737373007F7F7F007777770064646400B6B6B60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CECECE00DDDCDC00F8F0E700FDF4E800FCF1E400FBF0
      E100FBEEDE00FBEDDB00FAEBD800FAEAD500FAE9D400FAE9D300FAE9D400FAEA
      D500FAEBD700FAECD900FBEFDE00FCEFDE00F3D9B800E0DCD700C8C8C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE00DCDC
      DC00EFEFEF00F3F3F300F0F0F000EEEEEE00EDEDED00EBEBEB00E9E9E900E8E8
      E800E7E7E700E7E7E700E7E7E700E8E8E800E9E9E900EAEAEA00EDEDED00EDED
      ED00D6D6D600DBDBDB00C8C8C800000000000000000000000000000000000000
      00000000000000000000FFFEFF002C94470000A53D000AD968000CD365000BCF
      62000CA13D0042AE580046BB640043BE620042C867002CCA57000CCE410000D1
      390000D6400002DC470008CB3F0010872F0008AD4A000CD769000DCC610000C2
      52006DCF93000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE005757
      57004B4B4B006E6E6E006C6C6C00696969004E4E4E006D6D6D00777777007676
      76007B7B7B006F6F6F005E5E5E00585858005C5C5C00616161005B5B5B004242
      4200555555006E6E6E00686868005C5C5C009A9A9A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C4C4C500E4E2E000FAF1E500FDF2E500FBF0E100FBEE
      DE00FBEDDB00FAEBD800FAE9D500FAE9D400FAE9D300FAE9D400FAEAD500FAEB
      D700FAECD900FBEEDC00FBEFE000FDF4E900F7E2C800E7DDD200C4C5C700FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C4C4C400E2E2
      E200F0F0F000F1F1F100EEEEEE00EDEDED00EBEBEB00E9E9E900E8E8E800E7E7
      E700E7E7E700E7E7E700E8E8E800E9E9E900EAEAEA00ECECEC00EEEEEE00F3F3
      F300E0E0E000DCDCDC00C5C5C500FCFCFC000000000000000000000000000000
      00000000000000000000000000006FC4840024B04A003AC366003AC466003EC4
      690034B358004DB9680054C4720050C770004ED275004ED9760049E0770032E2
      6C0017E2600007E45C0002DA4C001DB9460021AF450021B94B0024BB4F0018AE
      4000A4D9B2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009292
      92005F5F5F007676760076767600797979006A6A6A007A7A7A00838383008282
      820087878700898989008A8A8A0080808000737373006D6D6D00626262005E5E
      5E005C5C5C00616161006464640057575700BABABA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C3C3C400E6E3E000FBF0E200FCF1E100FBEFDE00FBED
      DB00FAEBD800FAEAD500FAE9D400FAE9D300FAE9D400FAEAD500FAEBD700FAEC
      D900FBEEDD00FBF0E000FCF2E500FDF6ED00FAEBD900E9DECF00C4C6C800F9F9
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3C3C300E3E3
      E300EFEFEF00EFEFEF00EDEDED00EBEBEB00E9E9E900E8E8E800E7E7E700E7E7
      E700E7E7E700E8E8E800E9E9E900EAEAEA00ECECEC00EEEEEE00F1F1F100F5F5
      F500EAEAEA00DCDCDC00C6C6C600F9F9F9000000000000000000000000000000
      0000000000000000000000000000F1F7F10058B96D0064C47B006ECB850068C8
      810068CB820065C9800062CC7F005FD381005CDC830059E1850057E78B0057ED
      910055F094004BF092003BEC840028E369001DD556001CD1570008BF40005EC5
      7700000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F3F3
      F3007F7F7F008B8B8B009494940090909000919191008F8F8F008F8F8F009191
      91009393930095959500989898009C9C9C009D9D9D00999999008E8E8E007C7C
      7C006D6D6D006C6C6C0057575700888888000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C5C6C700E3E0DD00FAEEDF00FCEFDE00FBEDDB00FAEB
      D800FAEAD500FAE9D400FAE9D300FAE9D400FAEAD500FAEBD700FAECD900FBEE
      DD00FBF0E100FCF2E500FCF4E900FEF8F100FAEFE100E8DED200C3C5C700FAFA
      FA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600E0E0
      E000EDEDED00EDEDED00EBEBEB00E9E9E900E8E8E800E7E7E700E7E7E700E7E7
      E700E8E8E800E9E9E900EAEAEA00ECECEC00EEEEEE00F1F1F100F3F3F300F7F7
      F700EEEEEE00DDDDDD00C5C5C500FAFAFA000000000000000000000000000000
      000000000000000000000000000000000000E4F4E80057C0710079D695007BD6
      960076D4910073D28D0071D88F006EDF91006BE5950068E9970065ED9B0063F2
      9F0061F3A2005FF4A2005DF29D005AEE97005AEA93004AE0820060CF7E00FAFB
      FA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EAEAEA0082828200A1A1A100A2A2A2009E9E9E009B9B9B009D9D9D009F9F
      9F00A1A1A100A2A2A200A4A4A400A6A6A600A7A7A700A7A7A700A4A4A4009F9F
      9F009D9D9D008E8E8E008F8F8F00FAFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D0D0D100DAD8D700F8ECDC00FCEEDC00FAEBD800FAEA
      D500FAE9D400FAE9D300FAE9D400FAEAD500FAEBD700FAECD900FBEEDC00FBEF
      E000FCF2E500FCF4E900FDF6EE00FFFBF700F8EFE200E3DDD500C5C6C8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0D0D000D8D8
      D800EAEAEA00ECECEC00E9E9E900E8E8E800E7E7E700E7E7E700E7E7E700E8E8
      E800E9E9E900EAEAEA00ECECEC00EEEEEE00F1F1F100F3F3F300F5F5F500FBFB
      FB00EDEDED00DCDCDC00C6C6C600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5EEDB005AC878008ADE
      A40086DB9F0082DB9C0080E49F007DE9A3007AECA70077EFA70074F2A90072F6
      AE0070F6AE006DF6AB0069F4A50067F1A3005FEC9A0056D57C00ECF6ED000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFDFDF0088888800AEAEAE00AAAAAA00A8A8A800ABABAB00ADAD
      AD00AFAFAF00AFAFAF00AFAFAF00B2B2B200B1B1B100AFAFAF00ABABAB00A9A9
      A900A1A1A1008D8D8D00EFEFEF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E3E3E300CACBCC00F2E7D900FCECD800FAE9D500FAE8
      D200FAE9D300FAE9D400FAEAD500FAEBD700FAECD900FBEEDD00FBF0E000FCF2
      E500FCF4EA00FDF6EE00FEF9F300FFFEFC00F3E8DA00D8D6D400D0D0D1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3E3E300CBCB
      CB00E6E6E600EAEAEA00E8E8E800E6E6E600E7E7E700E7E7E700E8E8E800E9E9
      E900EAEAEA00ECECEC00EEEEEE00F1F1F100F3F3F300F5F5F500F8F8F800FDFD
      FD00E7E7E700D6D6D600D0D0D000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C7EBD00064C9
      7F009AE3B00092E3AA008FEAAE008CEEB30089F1B40086F2B30083F4B40081F6
      B7007EF6B5007BF5B10079F3AC0076F2AB005AD98100DBF3E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6D6D6008E8E8E00B9B9B900B5B5B500B7B7B700B9B9
      B900BABABA00B9B9B900B9B9B900BABABA00B8B8B800B5B5B500B2B2B200B1B1
      B10091919100E4E4E40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9F9F900C4C5C600E5E0D800F9E8D100FBE8D200F9E7
      CE00FAE9D300FAEAD500FAEBD700FAECD900FBEEDD00FBF0E000FCF2E500FCF4
      E900FDF6EE00FEF9F300FFFCF900FDFAF600EBE1D400C7C8C900EAEAEA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F9F900C5C5
      C500DFDFDF00E6E6E600E7E7E700E4E4E400E7E7E700E8E8E800E9E9E900EAEA
      EA00ECECEC00EEEEEE00F1F1F100F3F3F300F5F5F500F8F8F800FCFCFC00F9F9
      F900E0E0E000C8C8C800EAEAEA00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5E1
      C0006FCE8900A8EBBE009EEDB9009BF0BB0098F1BB0095F3BB0093F4BD0090F5
      BD008DF4BA008AF3B6008AF3B50063DC8800C7ECCF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C7C7C70097979700C5C5C500C1C1C100C2C2
      C200C1C1C100C1C1C100C1C1C100C0C0C000BEBEBE00BBBBBB00BBBBBB009797
      9700D6D6D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DBDBDB00CECFCF00EDDFCE00FCE7CE00F9E5
      CA00F9E8D100FAEBD800FAECD900FBEEDC00FBF0E100FCF2E500FCF4E900FDF6
      EE00FEF9F300FEFCF80000000000F0E7DB00DAD8D500CBCBCC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DBDB
      DB00CECECE00DEDEDE00E5E5E500E2E2E200E6E6E600E9E9E900EAEAEA00ECEC
      EC00EEEEEE00F1F1F100F3F3F300F5F5F500F8F8F800FBFBFB0000000000E6E6
      E600D7D7D700CBCBCB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A8DEB60081D89A00B5F1CA00A8EEC000A6EFBF00A4F2C000A1F3C2009FF4
      C1009CF3BD009EF4BF0077E09600B6E7C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEBEBE00A6A6A600D0D0D000C7C7
      C700C6C6C600C7C7C700C7C7C700C6C6C600C4C4C400C5C5C500A4A4A400CACA
      CA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFCFC00CCCDCE00D7D5D300ECDBC400FBE5
      C700F9E3C800FAECDA00FBEFDE00FBF0E000FCF2E500FCF4E900FDF6EE00FEF9
      F300FEFCF90000000000F2EADF00DDD7D000C8C9CB00EFEFEF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00CDCDCD00D5D5D500D9D9D900E2E2E200E1E1E100EAEAEA00EDEDED00EEEE
      EE00F1F1F100F3F3F300F5F5F500F8F8F800FBFBFB0000000000E9E9E900D6D6
      D600C9C9C900EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009CDEAD0092E0A900BEF1CF00B2EDC400B1F0C500AEF2C500ABF3
      C400AEF4C6008DE5A700A7E1B400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7B7B700B3B3B300D4D4
      D400CBCBCB00CCCCCC00CCCCCC00CBCBCB00CDCDCD00B3B3B300BEBEBE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F500D0D1D200D5D3D100E4D2
      BC00F8DFBD00FCE6C800FCF0E000FDF4E900FDF6EC00FEF8F100FFFCF700FFFF
      FE00FFFEFA00EAE1D500D6D0C900D0D1D300E5E5E50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5F5F500D1D1D100D3D3D300D0D0D000DCDCDC00E3E3E300EEEEEE00F3F3
      F300F5F5F500F7F7F700FBFBFB00FEFEFE00FDFDFD00E0E0E000CFCFCF00D1D1
      D100E5E5E5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000090D9A200A8E5B900C8F1D400BDEFCC00BBF0CB00BEF3
      CE00A7EBBA009BDFAB00FFFEFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AEAEAE00C2C2
      C200D9D9D900D2D2D200D2D2D200D5D5D500C4C4C400B7B7B700FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F6F500D9DADB00D3D3
      D300D1C7BA00E1CBAD00F1D7B600FAE7CE00FEF1E100FEF4E700F8EEE200E7DC
      CE00D0C6B900D0CDCA00D6D7D800E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F5F5F500DADADA00D3D3D300C6C6C600C8C8C800D4D4D400E5E5
      E500F0F0F000F3F3F300EDEDED00DBDBDB00C5C5C500CDCDCD00D7D7D700E8E8
      E800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAFDFB008AD79C00BAEAC700D1F3DB00CAF1D500BEEE
      CB009ADEA900F9FCFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBFBFB00A9A9
      A900CECECE00DFDFDF00DADADA00D2D2D200B5B5B500FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBFBFB00E8E9
      E900DFE1E200D2D2D200C6C1BA00C2B7A900C1B4A400C0B6A800C1BAB100CAC8
      C500DBDCDD00E3E4E400F4F4F400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBFBFB00E8E8E800E0E0E000D2D2D200C0C0C000B6B6
      B600B3B3B300B4B4B400B9B9B900C7C7C700DCDCDC00E3E3E300F4F4F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F1FAF30089D69A00CDF0D600D6F4DE009FDE
      AC00EEF9F0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400A8A8A800DBDBDB00E2E2E200B8B8B800F2F2F20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFAFA00F2F2F300EEEFF100EBEDEF00E8E9EC00E9EBED00EEEFF000F0F0
      F100F6F6F600FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFAFA00F2F2F200EFEFEF00EDED
      ED00E9E9E900EBEBEB00EFEFEF00F0F0F000F6F6F600FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7F6EB008FD79E00A6E0B100E4F5
      E800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EDEDED00ACACAC00BDBDBD00EBEBEB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FDFDFD00FDFDFD00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FDFDFD00FDFDFD00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCF1E000D5EFDA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4E4E400DFDFDF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000090C19600C4D9C50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A2A2
      A200CBCBCB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBFAFA00807F
      B0008988B700F6F6F10000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B8B8D600E9E9F0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAFAFA008F8F8F0098989800F4F4F400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C2C2C200EBEBEB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000047A65200007E030000860000EDFAEB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006A6A6A002B2B
      2B002C2C2C00F0F0F00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005051A3000106
      8F0006098E002628A900FFFFF600000000000000000000000000000000000000
      0000000000000000000000000000000000009192D10048479E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006C6C6C00323232003434340052525200FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A6A6A6006464640000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005CAC63000F8A2700248B3B001A83310044AC5200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000079797900404040004E4E
      4E00444444006B6B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003E4093001F22
      8D0023288C001B1D9600FCFDFE00000000000000000000000000000000000000
      00000000000000000000000000005153B1003F3E960000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005B5B5B00444444004747470044444400FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000007171
      71005B5B5B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003CAD460000911500119325001195250010942400008B0F00B4E6B9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006565650037373700434343004343
      43004242420033333300C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B4B4DA000000
      89001115960000008B009292D800000000000000000000000000000000000000
      000000000000000000000206A000252693000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C0002D2D2D003E3E3E002E2E2E00A9A9A9000000
      0000000000000000000000000000000000000000000000000000383838004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002AA9
      36000AA51E001CA82E0019AB2B00049C15001AAA2D0016A628001BAA2A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005858580044444400505050004F4F4F003C3C
      3C00505050004C4C4C004F4F4F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002B2F
      A600171BAA001B1DA80006099F00000000000000000000000000000000000000
      0000DFDEF20000009A002022A100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000055555500494949004A4A4A003A3A3A000000
      000000000000000000000000000000000000E5E5E500333333004B4B4B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002BA8350034B9
      400040B949003CBD470026A12E00FFF8FF0024A32F003EBD48002DB238008ECD
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000058585800646464006B6B6B006A6A6A0051515100FCFC
      FC00525252006B6B6B005D5D5D00A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001418A4004044BC003035B6008989CC000000000000000000000000009798
      D4000001AB003437A80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000454545006A6A6A005E5E5E009F9F
      9F00000000000000000000000000ABABAB00393939005B5B5B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCEADD0003BB0E002DCB
      38002CCE36000BB11500EEF1EF0000000000BDDFC00011C21D002ACB350023C3
      2E00F8FAF9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1E1E10044444400656565006565650045454500EFEFEF000000
      0000C9C9C90050505000636363005C5C5C00F9F9F90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000898AD000171FC7002B32C9000D12BE00F0EFF600000000006969D0000000
      C500090BAF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1A1A10054545400626262004949
      4900F1F1F100000000008B8B8B00414141004141410000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007AC07E002AC8
      320021B92700DCE9DB0000000000000000000000000057B95C0044D44A003ECD
      44007ACD80000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000929292006161610055555500E0E0E000000000000000
      00000000000079797900767676006F6F6F009797970000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004346B900454BD500454ACE00696DD4005D5EB8001B23D4001317
      B600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6B00777777007474
      74008E8E8E007B7B7B005B5B5B004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFDE
      C000E8F0E900000000000000000000000000000000000000000019C31C003BE3
      3D0026DB2B00CEEED00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C9C9C900EBEBEB0000000000000000000000
      00000000000000000000525252007373730064646400D9D9D900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000272BC3003439E3000006D000282BBA000000A100FCFC
      F800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005C5C5C007070
      7000474747005959590035353500FAFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BBDFBE001EE0
      220032E5360033D7340000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C8C8C800606060006F6F6F006A6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B4E4000000C5000911E2000002D7009394D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C4C4C4004141
      41005454540048484800A9A9A900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000062BF
      640057E65B004CE0510080D38200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000081818100888888007F7F7F009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007577C9002F37DC003137D7001E22BF006C72F000565DE1009798
      D400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000919191006B6B6B006A6A
      6A00555555009A9A9A0086868600ABABAB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000021C2280051E9590023D72B00E3F4E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000595959008686860061616100E8E8
      E800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000474ACD002F35EF003941EB001017DC00D1D0EA005C61C900585EF3004D54
      EB009B9BDF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007474740071717100777777005656
      5600D9D9D900828282008D8D8D0084848400B1B1B10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C1DBC40036C241005AD463003CB946000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CACACA0068686800858585006969
      6900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F3F1EE004446
      C4005C62E3005B5FDD00323AD100BBBBDE0000000000000000009193CA005F62
      D3007077E5008182C30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0F0F0006F6F6F008B8B8B008787870069696900C6C6
      C6000000000000000000A4A4A400868686009999990097979700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007EBE840021B9360027BF3C006DBE750000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000959595005A5A5A006060
      60008A8A8A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E2E1EC003136CC007075
      E8005F66DE003D44D600A2A2DB0000000000000000000000000000000000EEED
      F0007071CA008084EF00696CD200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5E5E50066666600999999008B8B8B0072727200B5B5B5000000
      0000000000000000000000000000EEEEEE008E8E8E00A6A6A6008D8D8D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000074B77D0031B14C00159D2D00C4DBC700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008D8D8D006464
      64004A4A4A00CCCCCC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006062BF009BA0F2008187
      DD006B70DD008F91CE0000000000000000000000000000000000000000000000
      000000000000C3C4DF008B8FD9006568D300BABBDF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000B9B9B900A1A1A10092929200A4A4A400000000000000
      00000000000000000000000000000000000000000000CCCCCC00A6A6A6008A8A
      8A00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C4DAC70077B885004EA86300D2E2D4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CCCC
      CC009191910073737300D8D8D800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFAF6006E71BB008F93
      DC008E8EC2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D7D6E6009999C9002C2B9200D3D3E7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9F9F90088888800AAAAAA009F9F9F0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DBDB
      DB00A9A9A9004D4D4D00D9D9D900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5CCB800F6FBF5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BEBE
      D300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCCCDD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C5C5C5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D1D1D100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000090000000200100000100010000000000801600000000000000000000
      000000000000000000000000FFFFFF0093FFE03FF00000000000000000000000
      0000000048000F7FF0000000000000000000000000000000A00001FFF0000000
      000000000000000000000000000000FFF0000000000000000000000000000000
      0000007FF00000000000000000000000000000000000007FF000000000000000
      00000000000000000000007FF000000000000000000000000000000000000021
      F00000000000000000000000000000008000002FF00000000000000000000000
      000000000000000FF00000000000000000000000000000000000000FF0000000
      0000000000000000000000004000000FF0000000000000000000000000000000
      8000000FF0000000000000000000000000000000E000001FF000000000000000
      0000000000000000F400003FF0000000000000000000000000000000E200005F
      F0000000000000000000000000000000FC00003FF00000000000000000000000
      00000000FC40027FF0000000000000000000000000000000FEA0017FF0000000
      000000000000000000000000FF50007FF0000000000000000000000000000000
      FFC0007FF0000000000000000000000000000000FFE800BFF000000000000000
      0000000000000000FF90003FF0000000000000000000000000000000FF80003F
      F0000000000000000000000000000000FF00003FF00000000000000000000000
      00000000FF00003FF0000000000000000000000000000000FF00003FF0000000
      000000000000000000000000FF40003FF0000000000000000000000000000000
      FF40003FF0000000000000000000000000000000FF40003FF000000000000000
      0000000000000000FF40003FF0000000000000000000000000000000FF00007F
      F0000000000000000000000000000000FF00003FF00000000000000000000000
      00000000FF80003FF0000000000000000000000000000000FFA0037FF0000000
      000000000000000000000000FFAC1D7FF0000000000000000000000000000000
      FFFFF7FFFFFFFFFFFFFFFFFFFFF93FFE03FF0000FFFFC3FFFFFFFFFFFFFFFFFF
      FFF48000F7FF0000FFFF03FFFE001FFFFFE001FFFFFA00001FFF0000FFFC01FF
      F80007FFFF80007FFFF000000FFF0000FFF000FFF80001FFFF80001FFFF00000
      07FF0000FFC000FFF00000FFFF00000FFFF0000007FF0000FF00007FF000007F
      FF000007FFF0000007FF0000FC00007FF80000007F80000007F00000021F0000
      F000003FF8000000078000000078000002FF0000C000001FF800000003800000
      0030000000FF00000000001FF8000000038000000030000000FF00000000000F
      FC00000003C000000034000000FF000080000007FC00000003C0000000380000
      00FF000080000007FE00000003E00000003E000001FF0000C0000003FF000000
      03F00000003F400003FF0000E0080001FF80000007F80000007E200005FF0000
      E0000001FFE0000007FE0000007FC00003FF0000F0840000FFF000000FFF0000
      00FFC40027FF0000F84000007FF000001FFF000001FFEA0017FF0000F8000000
      7FF801003FFF801003FFF50007FF0000FC2000003FF000007FFF000007FFFC00
      07FF0000FE1000001FE000003FFE000003FFFE800BFF0000FE0040001FE00000
      1FFE000001FFF90003FF0000FF0800000FE000001FFE000001FFF80003FF0000
      FF0400000FE000001FFE000001FFF00003FF0000FF8400019FE000001FFE0000
      01FFF00003FF0000FFC210007FE000001FFE000001FFF00003FF0000FFE00004
      7FE000001FFE000001FFF40003FF0000FFE00001FFE000001FFE000001FFF400
      03FF0000FFF00043FFF002003FFF002003FFF40003FF0000FFF8011FFFFC0C00
      3FFFC0C003FFF40003FF0000FFF8243FFFFFFC007FFFFFC007FFF00007FF0000
      FFFC11FFFFFFFC00FFFFFFC00FFFF00003FF0000FFFC07FFFFFFFF01FFFFFFF0
      1FFFF80003FF0000FFFEAFFFFFFFFFFFFFFFFFFFFFFFFA0037FF0000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFAC1D7FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000FFFFFFFFFFFFFFFFFFFFF800FFFFFF800FFF0000FFFFF00FFFFFFF00
      FFFF80000FFFF80000FF0000FFFFE007FFFFFE007FFF000007FFF000007F0000
      FFFFC003FFFFFC003FFF000007FFF000007F0000FC3FC003FFC3FC003FFE0000
      03FFE000003F0000E00FC001FE00FC001FFC000001FFC000001F0000C007C001
      FC007C001FF8300000FF8300000F0000C0020001FC0020001FF04000007F0400
      00070000C0000000FC0000000FE18000007E180000070000C00000007C000000
      07E30000003E300000030000800000003800000003C60000003C600000030000
      800000001800000001C40000001C400000010000800070001800070001C80000
      011C800000110000800010001800010001880000009880000009000080000000
      18000000019000000099000000090000C00000003C0000000390000000090000
      00000000C00000003C000000038000000008000000000000E00000007E000000
      078000000048000000040000F00000007F000000078000000048000000040000
      F00000003F000000038000000048000000040000F80000003F80000003800000
      0008000000000000FC0000003FC00000038000000018000000010000FC000000
      3FC00000038000000018000000010000FE0000003FE0000003C00000001C0000
      00010000FE0000007FE0000007C00000001C000000010000FE0000007FE00000
      07C00000003C000000030000FF0000607FF0000607E00000003E000000030000
      FF8000F07FF8000F07F00000007F000000070000FF8003FFFFF8003FFFF00000
      00FF0000000F0000FFE03FFFFFFE03FFFFF8000001FF8000001F0000FFF07FFF
      FFFF07FFFFFC000003FFC000003F0000FFF07FFFFFFF07FFFFFE000007FFE000
      007F0000FFFFFFFFFFFFFFFFFFFF84020FFFF84020FF0000FFFFFFFFFFFFFFFF
      FFFFC0003FFFFC0003FF0000FFFFFFFFFFFFFFFFFFFFF801FFFFFF801FFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFE001
      FFFFFE001FFF0000FFFFFFFFFFFFFFFFFFFF00003FFFF00003FF0000FFFFFFFF
      FFFFFFFFFFFC00001FFFC00001FF0000800003FFF800003FFFFC00000FFFC000
      00FF0000C0000001FC0000001FF800000FFF800000FF0000C00000007C000000
      07F800000FFF800000FF0000E00000007E00000007F800000FFF800000FF0000
      F01800007F01800007F800001FFF800001FF0000F007FC007F007FC007F80000
      7FFF800007FF0000F803FFFFFF803FFFFFF800007FFF800007FF0000FC01FFFF
      FFC01FFFFFF800007FFF800007FF0000FC00FFFFFFC00FFFFFF800007FFF8000
      07FF0000FE007FFFFFE007FFFFF800007FFF800007FF0000FF003FFFFFF003FF
      FFF800007FFF800007FF0000FFC00FFFFFFC00FFFFF800007FFF800007FF0000
      FFE007FFFFFE007FFFF800007FFF800007FF0000FFF003FFFFFF003FFFF00000
      7FFF000007FF0000FFF801FFFFFF801FFFF000007FFF000007FF0000FFFC00FF
      FFFFC00FFFF000007FFF000007FF0000FFFE007FFFFFE007FFF000003FFF0000
      03FF0000FFFF001FFFFFF001FFF200003FFF200003FF0000FFFF800FFFFFF800
      FFF000003FFF000003FF0000FFFFE007FFFFFE007FF200013FFF200013FF0000
      FFFFF003FFFFFF003FF180013FFF180013FF0000FFFFF801FFFFFF801FF20000
      3FFF200003FF0000FFFFFC00FFFFFFC00FF000003FFF000003FF0000FFFFFE00
      3FFFFFE003F000003FFF000003FF0000FFFFFF001FFFFFF001F000003FFF0000
      03FF0000FFFFFF801FFFFFF801F000003FFF000003FF0000FFFFFFC00FFFFFFC
      00F000003FFF000003FF0000FFFFFFE01FFFFFFE01F000003FFF000003FF0000
      FFFFFFF01FFFFFFF01F800007FFF800007FF0000FFFFFFF83FFFFFFF83FC0001
      FFFFC0001FFF0000FFFFFFFFFFFFFFFFFFFF8007FFFFF8007FFF0000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFE07FFFFFFE07FFFC00004083C0000
      40830000FFFC03FFFFFFC03FFF8000000018000000010000FFF800FFFFFF800F
      FF8000000018000000010000FFF0007FFFFF0007FF8000400018000400010000
      FFC0003FFFFC0003FF8FFF800018FFF800010000FF80001FFFF80001FF8FFF00
      C018FFF00C010000FF000007FFF000007F8FFF00C018FFF00C010000FC000003
      FFC000003F8FFE00C018FFE00C010000F8000001FF8000001F8FFE00C018FFE0
      0C010000F8000001FF8000001F8FFE00C008FFE00C000000F8000001FF800000
      1F8FFE0FFE08FFE0FFE00000F8400001FF8400001F8FFE0FFE08FFE0FFE00000
      FF80001FFFF80001FF8FFE00C008FFE00C000000FF00000FFFF00000FF8FFE00
      C008FFE00C000000FE000007FFE000007F8FFE00C018FFE00C010000FE000007
      FFE000007F8FFF00C018FFF00C010000FE000007FFE000007F8FFF00C018FFF0
      0C010000FE000007FFE000007F8FFF800018FFF800010000FFF000FFFFFF000F
      FF8FFFC00018FFFC00010000FFF000FFFFFF000FFF8FFFE00118FFFE00110000
      FFF000FFFFFF000FFF0FFFF00310FFFF00310000FFF000FFFFFF000FFF0FFFFE
      1F10FFFFE1F10000FFF000FFFFFF000FFF0FFFFFFF10FFFFFFF10000FFF000FF
      FFFF000FFF0FFFFFFF10FFFFFFF10000FFF000FFFFFF000FFF0FFFFFFF10FFFF
      FFF10000FFF000FFFFFF000FFF0FFFFFFF10FFFFFFF10000FFF000FFFFFF000F
      FF0FFFFFFF10FFFFFFF10000FFF000FFFFFF000FFF0FFFFFFF10FFFFFFF10000
      FFF000FFFFFF000FFF0FFFFFFF10FFFFFFF10000FFF000FFFFFF000FFF000000
      0010000000010000FFF000FFFFFF000FFF0000000010000000010000FFF001FF
      FFFF001FFF0000000010000000010000FFF001FFFFFF001FFF00000000100000
      00010000FFF001FFFFFF001FFF8000000018000000010000FFF001FFFFFF001F
      FF8000000018000000010000FFF801FFFFFF801FFFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000FFFE3FFFFFFFE3FFFFFFFFC7FFFFFFFC7FFF0000FFE01FFF
      FFFE01FFFFFFFF00FFFFFFF00FFF0000FF0000EFFFF0000EFFFF60001FFFF600
      01FF0000F80000001F8000000180000003F80000003F0000E00000001E000000
      010000000070000000070000C00000001C000000010000000070000000070000
      C00000001C000000018000000078000000070000F80000003F80000003800000
      01F80000001F0000FF404000FFF404000FE000205FFE000205FF0000FF807FFF
      FFF807FFFFFFFFE03FFFFFFE03FF0000FF007FFFFFF007FFFF8000E00FF8000E
      00FF0000FE0000003FE000000380000007F80000007F0000F80000001F800000
      0180000003F80000003F0000F00000001F0000000180000001F80000001F0000
      E00000001E000000018000000078000000070000C00000001C00000001800000
      0038000000030000800000003800000003800000001800000001000080000000
      38000000038000000038000000030000E00000003E0000000380000000780000
      00070000F00000001F0000000180000000F80000000F0000F80000001F800000
      0180000001F80000001F0000FC0000003FC000000380000003F80000003F0000
      FE00000FFFE00000FF8000000FF8000000FF0000FF007FFFFFF007FFFFEFFFE0
      1FFEFFFE01FF0000FFC07FFFFFFC07FFFFFFFFE03FFFFFFE03FF0000FFE07FFF
      FFFE07FFFFFFFFE07FFFFFFE07FF0000FFF07FFFFFFF07FFFFFFFFE0FFFFFFFE
      0FFF0000FFF87FFFFFFF87FFFFFFFFE1FFFFFFFE1FFF0000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FC0000FFFFC0000FFFFFFFFFFFFFFFFF
      FFFF0000F0000003FF0000003FFFF000FFFFFF000FFF0000E100000FFE100000
      FFFFC0003FFFFC0003FF0000C0FFFFFFFC0FFFFFFFFFC0001FFFFC0001FF0000
      807FFFFFF807FFFFFFFFC0001FFFFC0001FF0000803FFFFFF803FFFFFFFFC000
      3FFFFC0003FF0000C01FFFFFFC01FFFFFFFFC0003FFFFC0003FF0000E00FFFFF
      FE00FFFFFFFFC0003FFFFC0003FF0000F007FFFFFF007FFFFFFFC0003FFFFC00
      03FF0000F803FFFFFF803FFFFFFFC0003FFFFC0003FF0000FC03FFFFFFC03FFF
      FFFFC0007FFFFC0007FF0000FE03FFFFFFE03FFFFFFFC0007FFFFC0007FF0000
      FF01FFFFFFF01FFFFFFFE0007FFFFE0007FF0000FF81FE3FFFF81FE3FFFFF000
      7FFFFF0007FF0000FFF0F007FFFF0F007FFE00000FFFE00000FF0000FFF80001
      FFFF80001FFC000007FFC000007F0000FFFC0000FFFFC0000FFC000007FFC000
      007F0000FFFE00007FFFE00007FE00000FFFE00000FF0000FFFE00003FFFE000
      03FF00001FFFF00001FF0000FFFE00003FFFE00003FFF000FFFFFF000FFF0000
      FFFC00001FFFC00001FE000087FFE000087F0000FFFC00001FFFC00001FE0000
      07FFE000007F0000FFFC00001FFFC00001FC000007FFC000007F0000FFFC0000
      0FFFC00000FE000007FFE000007F0000FFFC00000FFFC00000FE00000FFFE000
      00FF0000FFFC00000FFFC00000FF00000FFFF00000FF0000FFFC00001FFFC000
      01FF80001FFFF80001FF0000FFFC00001FFFC00001FFC0003FFFFC0003FF0000
      FFFC00001FFFC00001FFE0007FFFFE0007FF0000FFFE00023FFFE00023FFF000
      FFFFFF000FFF0000FFFE00043FFFE00043FFF801FFFFFF801FFF0000FFFF0000
      7FFFF00007FFFC01FFFFFFC01FFF0000FFFF8000FFFFF8000FFFFC03FFFFFFC0
      3FFF0000FFFFC001FFFFFC001FFFFE07FFFFFFE07FFF0000FFFFF003FFFFFF00
      3FFFFF0FFFFFFFF0FFFF0000FFFFFE1FFFFFFFE1FFFFFF9FFFFFFFF9FFFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFE7FFFFFFFE7FFFFFFC3FF
      9FFFFC3FF9FF0000FFFC3FFFFFFFC3FFFFFFC1FF3FFFFC1FF3FF0000FFF83FFF
      FFFF83FFFFFFC1FE7FFFFC1FE7FF0000FFF01FFFFFFF01FFFFFFC1FCFFFFFC1F
      CFFF0000FFE01FFFFFFE01FFFFFFE1F1FFFFFE1F1FFF0000FFC00FFFFFFC00FF
      FFFFF0E3FFFFFF0E3FFF0000FF8107FFFFF8107FFFFFF047FFFFFF047FFF0000
      FFC387FFFFFC387FFFFFF80FFFFFFF80FFFF0000FFE7C3FFFFFE7C3FFFFFFC0F
      FFFFFFC0FFFF0000FFFFC3FFFFFFFC3FFFFFFC1FFFFFFFC1FFFF0000FFFFE1FF
      FFFFFE1FFFFFF80FFFFFFF80FFFF0000FFFFF0FFFFFFFF0FFFFFF007FFFFFF00
      7FFF0000FFFFF0FFFFFFFF0FFFFFC0C3FFFFFC0C3FFF0000FFFFF87FFFFFFF87
      FFFF81E1FFFFF81E1FFF0000FFFFFC3FFFFFFFC3FFFF83F87FFFF83F87FF0000
      FFFFFE1FFFFFFFE1FFFF87FE1FFFF87FE1FF0000FFFFFF9FFFFFFFF9FFFFEFFF
      DFFFFEFFFDFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  inherited S_BUSQUEDA: TDataSource
    Left = 648
    Top = 152
  end
end
