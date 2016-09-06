inherited FrmCaja: TFrmCaja
  Left = 0
  Top = 0
  Caption = 'FrmCaja'
  ClientHeight = 742
  ClientWidth = 1028
  Color = clWhite
  KeyPreview = True
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  ExplicitWidth = 1044
  ExplicitHeight = 780
  PixelsPerInch = 96
  TextHeight = 13
  object Paginas: TRzPageControl [0]
    Left = 0
    Top = 0
    Width = 1028
    Height = 742
    ActivePage = TabCaja
    Align = alClient
    Color = 16119543
    UseColoredTabs = True
    FlatColor = 10263441
    ParentColor = False
    TabColors.HighlightBar = 1350640
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 19
    object TabCaja: TRzTabSheet
      Color = clWhite
      Caption = 'TabCaja'
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 1024
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Gesti'#243'n de Caja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12670976
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExplicitWidth = 129
      end
      object RZPanel5: TRzPanel
        Left = 0
        Top = 89
        Width = 1024
        Height = 630
        Align = alClient
        AutoSize = True
        BorderSides = []
        Color = clWindow
        GradientDirection = gdVerticalEnd
        TabOrder = 0
        Transparent = True
        VisualStyle = vsClassic
        object RZPanel10: TRzPanel
          Left = 0
          Top = 441
          Width = 1024
          Height = 189
          Align = alBottom
          BorderOuter = fsNone
          BorderSides = []
          TabOrder = 0
          Transparent = True
          VisualStyle = vsClassic
          object RzGroupBox1: TRzGroupBox
            AlignWithMargins = True
            Left = 10
            Top = 2
            Width = 1004
            Height = 184
            Margins.Left = 10
            Margins.Right = 10
            Align = alBottom
            FlatColor = 10382147
            TabOrder = 0
            Transparent = True
            object RzPanel1: TRzPanel
              AlignWithMargins = True
              Left = 6
              Top = 14
              Width = 994
              Height = 169
              Margins.Left = 5
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alClient
              AutoSize = True
              BorderSides = []
              TabOrder = 0
              Transparent = True
              object F3: TRzToolButton
                Left = 274
                Top = -4
                Width = 135
                Height = 76
                Cursor = crHandPoint
                GradientColorStyle = gcsSystem
                SelectionFrameColor = 7617536
                Images = ImagenesBotones
                Layout = blGlyphTop
                ShowCaption = True
                UseToolbarButtonLayout = False
                UseToolbarShowCaption = False
                UseToolbarVisualStyle = False
                VisualStyle = vsWinXP
                Color = 16776176
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
              end
              object F9: TRzToolButton
                Left = 412
                Top = 78
                Width = 135
                Height = 79
                Cursor = crHandPoint
                SelectionFrameColor = 7617536
                Images = ImagenesBotones
                Layout = blGlyphTop
                ShowCaption = True
                UseToolbarButtonLayout = False
                UseToolbarShowCaption = False
                Color = 16776176
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
              end
              object F10: TRzToolButton
                Left = 550
                Top = 78
                Width = 135
                Height = 79
                Cursor = crHandPoint
                SelectionFrameColor = 7617536
                Images = ImagenesBotones
                Layout = blGlyphTop
                ShowCaption = True
                UseToolbarButtonLayout = False
                UseToolbarShowCaption = False
                Color = 16776176
                Font.Charset = ANSI_CHARSET
                Font.Color = 12670976
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
              end
              object F8: TRzToolButton
                Left = 274
                Top = 78
                Width = 135
                Height = 79
                Cursor = crHandPoint
                SelectionFrameColor = 7617536
                Images = ImagenesBotones
                Layout = blGlyphTop
                ShowCaption = True
                UseToolbarButtonLayout = False
                UseToolbarShowCaption = False
                Color = 16776176
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
              end
              object F7: TRzToolButton
                Left = 136
                Top = 78
                Width = 135
                Height = 79
                Cursor = crHandPoint
                SelectionFrameColor = 7617536
                Images = ImagenesBotones
                Layout = blGlyphTop
                ShowCaption = True
                UseToolbarButtonLayout = False
                UseToolbarShowCaption = False
                Color = 16776176
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
              end
              object F2: TRzToolButton
                Left = 136
                Top = -4
                Width = 135
                Height = 76
                Cursor = crHandPoint
                SelectionFrameColor = 7617536
                Images = ImagenesBotones
                Layout = blGlyphTop
                ShowCaption = True
                UseToolbarButtonLayout = False
                UseToolbarShowCaption = False
                Color = 16776176
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
              end
              object F6: TRzToolButton
                Left = -3
                Top = 78
                Width = 135
                Height = 79
                Cursor = crHandPoint
                SelectionFrameColor = 7617536
                Images = ImagenesBotones
                Layout = blGlyphTop
                ShowCaption = True
                UseToolbarButtonLayout = False
                UseToolbarShowCaption = False
                Color = 16776176
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
              end
              object F4: TRzToolButton
                Left = 410
                Top = -4
                Width = 137
                Height = 76
                Cursor = crHandPoint
                SelectionFrameColor = 7617536
                Images = ImagenesBotones
                Layout = blGlyphTop
                ShowCaption = True
                UseToolbarButtonLayout = False
                UseToolbarShowCaption = False
                Color = 16776176
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
              end
              object F5: TRzToolButton
                Left = 550
                Top = -4
                Width = 135
                Height = 76
                Cursor = crHandPoint
                SelectionFrameColor = 7617536
                Images = ImagenesBotones
                Layout = blGlyphTop
                ShowCaption = True
                UseToolbarButtonLayout = False
                UseToolbarShowCaption = False
                Color = 16776176
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
              end
              object F1: TRzToolButton
                Left = -1
                Top = -4
                Width = 133
                Height = 76
                Cursor = crHandPoint
                Images = ImagenesBotones
                Layout = blGlyphTop
                ShowCaption = True
                UseToolbarButtonLayout = False
                UseToolbarShowCaption = False
                Color = 16776176
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
              end
              object Shape1: TShape
                Left = 0
                Top = 74
                Width = 689
                Height = 1
                Brush.Color = clMaroon
                Pen.Color = 10382147
              end
              object Shape2: TShape
                Left = 133
                Top = 1
                Width = 1
                Height = 157
                Brush.Color = clMaroon
                Pen.Color = 10382147
              end
              object Shape3: TShape
                Left = 410
                Top = 1
                Width = 1
                Height = 157
                Brush.Color = clMaroon
                Pen.Color = 10382147
              end
              object Shape4: TShape
                Left = 272
                Top = 1
                Width = 1
                Height = 157
                Brush.Color = clMaroon
                Pen.Color = 10382147
              end
              object Shape5: TShape
                Left = 548
                Top = 1
                Width = 1
                Height = 157
                Brush.Color = clMaroon
                Pen.Color = 10382147
              end
            end
          end
        end
        object PaginasCaja: TRzPageControl
          Left = 0
          Top = 0
          Width = 1024
          Height = 441
          Margins.Left = 10
          Margins.Right = 10
          ActivePage = TabCierreCaja
          Align = alClient
          Color = clWhite
          UseColoredTabs = True
          FlatColor = 16119543
          FlatColorAdjustment = 16119543
          ParentColor = False
          TabColors.HighlightBar = 1350640
          TabIndex = 3
          TabOrder = 1
          Transparent = True
          FixedDimension = 19
          object TabMovimiento: TRzTabSheet
            Color = clWhite
            Caption = 'TabMovimiento'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object PaginasMovimientos: TRzPageControl
              Left = 0
              Top = 0
              Width = 1020
              Height = 418
              ActivePage = TabMov
              Align = alClient
              Images = ImagenesBotones
              TabIndex = 0
              TabOrder = 0
              TabStyle = tsCutCorner
              ExplicitHeight = 429
              FixedDimension = 43
              object TabMov: TRzTabSheet
                Color = clWhite
                DisabledIndex = 27
                ImageIndex = 26
                Caption = 'Movimientos'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object RZGroupBox8: TRzGroupBox
                  AlignWithMargins = True
                  Left = 10
                  Top = 10
                  Width = 996
                  Height = 362
                  Margins.Left = 10
                  Margins.Top = 10
                  Margins.Right = 10
                  Margins.Bottom = 10
                  Align = alClient
                  BorderWidth = 1
                  FlatColor = 10382147
                  TabOrder = 0
                  Transparent = True
                  object RzPanel2: TRzPanel
                    Left = 2
                    Top = 14
                    Width = 992
                    Height = 346
                    Align = alClient
                    AutoSize = True
                    BorderSides = []
                    TabOrder = 0
                    Transparent = True
                    object GridMovimientos: TDBGridEh
                      AlignWithMargins = True
                      Left = 5
                      Top = 0
                      Width = 921
                      Height = 341
                      Margins.Left = 5
                      Margins.Top = 0
                      Margins.Right = 5
                      Margins.Bottom = 5
                      Align = alClient
                      AutoFitColWidths = True
                      DataSource = S_MOVIMIENTOS
                      FixedColor = 16776176
                      Flat = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = 12670976
                      Font.Height = -16
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      FooterColor = clWindow
                      FooterFont.Charset = DEFAULT_CHARSET
                      FooterFont.Color = clWindowText
                      FooterFont.Height = -11
                      FooterFont.Name = 'MS Sans Serif'
                      FooterFont.Style = []
                      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clMaroon
                      TitleFont.Height = -13
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      Columns = <
                        item
                          Alignment = taRightJustify
                          EditButtons = <>
                          FieldName = 'FECHA'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Width = 75
                        end
                        item
                          Alignment = taRightJustify
                          EditButtons = <>
                          FieldName = 'ENTRADA'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Caption = 'ENTRADAS'
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Width = 114
                        end
                        item
                          Alignment = taRightJustify
                          EditButtons = <>
                          FieldName = 'SALIDA'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Caption = 'SALIDAS'
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Width = 114
                        end
                        item
                          EditButtons = <>
                          FieldName = 'CONCEPTO'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Width = 348
                        end
                        item
                          EditButtons = <>
                          FieldName = 'DOCUMENTO'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Width = 82
                        end
                        item
                          EditButtons = <>
                          FieldName = 'CODMEDPAG'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Visible = False
                        end
                        item
                          EditButtons = <>
                          FieldName = 'DESMEDPAG'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Caption = 'F. PAGO'
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Width = 101
                        end>
                    end
                    object RzPanel6: TRzPanel
                      AlignWithMargins = True
                      Left = 934
                      Top = 3
                      Width = 50
                      Height = 340
                      Margins.Right = 8
                      Align = alRight
                      AutoSize = True
                      BorderSides = []
                      TabOrder = 1
                      Transparent = True
                      object BtnEliminar: TRzToolButton
                        Left = 0
                        Top = 197
                        Width = 50
                        Height = 45
                        Cursor = crHandPoint
                        DisabledIndex = 15
                        SelectionFrameColor = 7617536
                        Images = ImagenesBotones
                        Action = AcEliminarMovimiento
                        Align = alCustom
                        Color = clNone
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clMaroon
                        Font.Height = -19
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = False
                      end
                      object BtnInicio: TRzToolButton
                        Left = 0
                        Top = -3
                        Width = 50
                        Height = 45
                        Cursor = crHandPoint
                        Margins.Top = 0
                        Margins.Bottom = 0
                        DisabledIndex = 9
                        SelectionFrameColor = 7617536
                        Images = ImagenesBotones
                        Action = AcInicio
                        Color = clNone
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clMaroon
                        Font.Height = -19
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = False
                      end
                      object BtnAnterior: TRzToolButton
                        Left = 0
                        Top = 45
                        Width = 50
                        Height = 45
                        Cursor = crHandPoint
                        DisabledIndex = 8
                        SelectionFrameColor = 7617536
                        Images = ImagenesBotones
                        Action = AcAnterior
                        Color = clNone
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clMaroon
                        Font.Height = -19
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = False
                      end
                      object BtnSiguiente: TRzToolButton
                        Left = 0
                        Top = 96
                        Width = 50
                        Height = 45
                        Cursor = crHandPoint
                        DisabledIndex = 11
                        SelectionFrameColor = 7617536
                        Images = ImagenesBotones
                        Action = AcSiguiente
                        Color = clNone
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clMaroon
                        Font.Height = -19
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = False
                      end
                      object BtnFin: TRzToolButton
                        Left = 0
                        Top = 146
                        Width = 50
                        Height = 45
                        Cursor = crHandPoint
                        DisabledIndex = 10
                        SelectionFrameColor = 7617536
                        Images = ImagenesBotones
                        Action = AcFin
                        Color = clNone
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clMaroon
                        Font.Height = -19
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = False
                      end
                      object Shape6: TShape
                        Left = 0
                        Top = 43
                        Width = 49
                        Height = 1
                        Brush.Color = clMaroon
                        Pen.Color = 10382147
                      end
                      object Shape7: TShape
                        Left = 1
                        Top = 91
                        Width = 49
                        Height = 1
                        Brush.Color = clMaroon
                        Pen.Color = 10382147
                      end
                      object Shape8: TShape
                        Left = 1
                        Top = 142
                        Width = 49
                        Height = 1
                        Brush.Color = clMaroon
                        Pen.Color = 10382147
                      end
                      object Shape9: TShape
                        Left = 1
                        Top = 192
                        Width = 49
                        Height = 1
                        Brush.Color = clMaroon
                        Pen.Color = 10382147
                      end
                      object Shape18: TShape
                        Left = 1
                        Top = 243
                        Width = 49
                        Height = 1
                        Brush.Color = clMaroon
                        Pen.Color = 10382147
                      end
                      object BtnImprimirMov: TRzToolButton
                        Left = 0
                        Top = 248
                        Width = 50
                        Height = 45
                        Cursor = crHandPoint
                        DisabledIndex = 17
                        SelectionFrameColor = 7617536
                        ImageIndex = 16
                        Images = ImagenesBotones
                        Align = alCustom
                        Color = clNone
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clMaroon
                        Font.Height = -19
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = False
                        Visible = False
                      end
                    end
                  end
                end
              end
              object TabVentas: TRzTabSheet
                Color = clWhite
                DisabledIndex = 35
                ImageIndex = 34
                Caption = 'Ventas'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object RzGroupBox2: TRzGroupBox
                  AlignWithMargins = True
                  Left = 10
                  Top = 10
                  Width = 996
                  Height = 362
                  Margins.Left = 10
                  Margins.Top = 10
                  Margins.Right = 10
                  Margins.Bottom = 10
                  Align = alClient
                  BorderWidth = 1
                  FlatColor = 10382147
                  TabOrder = 0
                  Transparent = True
                  object RzPanel9: TRzPanel
                    Left = 2
                    Top = 14
                    Width = 992
                    Height = 346
                    Align = alClient
                    AutoSize = True
                    BorderSides = []
                    TabOrder = 0
                    Transparent = True
                    object GridMovimientosVentas: TDBGridEh
                      AlignWithMargins = True
                      Left = 5
                      Top = 0
                      Width = 921
                      Height = 341
                      Margins.Left = 5
                      Margins.Top = 0
                      Margins.Right = 5
                      Margins.Bottom = 5
                      Align = alClient
                      AutoFitColWidths = True
                      DataSource = S_MOVIMIENTOS_VENTAS
                      FixedColor = 16776176
                      Flat = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = 12670976
                      Font.Height = -16
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      FooterColor = clWindow
                      FooterFont.Charset = DEFAULT_CHARSET
                      FooterFont.Color = clWindowText
                      FooterFont.Height = -11
                      FooterFont.Name = 'MS Sans Serif'
                      FooterFont.Style = []
                      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clMaroon
                      TitleFont.Height = -13
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      Columns = <
                        item
                          Alignment = taRightJustify
                          EditButtons = <>
                          FieldName = 'FECHA'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Width = 123
                        end
                        item
                          Alignment = taRightJustify
                          EditButtons = <>
                          FieldName = 'ENTRADA'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Caption = 'ENTRADAS'
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Width = 114
                        end
                        item
                          Alignment = taRightJustify
                          EditButtons = <>
                          FieldName = 'SALIDA'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Caption = 'SALIDAS'
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Width = 114
                        end
                        item
                          EditButtons = <>
                          FieldName = 'CONCEPTO'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Width = 348
                        end
                        item
                          EditButtons = <>
                          FieldName = 'DOCUMENTO'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Width = 82
                        end
                        item
                          EditButtons = <>
                          FieldName = 'CODMEDPAG'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Visible = False
                        end
                        item
                          EditButtons = <>
                          FieldName = 'DESMEDPAG'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = 12670976
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          Footers = <>
                          Title.Alignment = taCenter
                          Title.Caption = 'F. PAGO'
                          Title.Color = 16249582
                          Title.Font.Charset = DEFAULT_CHARSET
                          Title.Font.Color = 12670976
                          Title.Font.Height = -13
                          Title.Font.Name = 'Tahoma'
                          Title.Font.Style = []
                          Width = 101
                        end>
                    end
                    object RzPanel11: TRzPanel
                      AlignWithMargins = True
                      Left = 934
                      Top = 3
                      Width = 50
                      Height = 340
                      Margins.Right = 8
                      Align = alRight
                      AutoSize = True
                      BorderSides = []
                      TabOrder = 1
                      Transparent = True
                      object BtnInicioMovVentas: TRzToolButton
                        Left = 0
                        Top = -3
                        Width = 50
                        Height = 45
                        Cursor = crHandPoint
                        Margins.Top = 0
                        Margins.Bottom = 0
                        DisabledIndex = 1
                        SelectionFrameColor = 7617536
                        Images = ImagenesBotones
                        Action = AcInicio
                        Color = clNone
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clMaroon
                        Font.Height = -19
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = False
                      end
                      object BtnAnteriorMovVentas: TRzToolButton
                        Left = 0
                        Top = 45
                        Width = 50
                        Height = 45
                        Cursor = crHandPoint
                        DisabledIndex = 3
                        SelectionFrameColor = 7617536
                        Images = ImagenesBotones
                        Action = AcAnterior
                        Color = clNone
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clMaroon
                        Font.Height = -19
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = False
                      end
                      object BtnSiguienteMovVentas: TRzToolButton
                        Left = 0
                        Top = 96
                        Width = 50
                        Height = 45
                        Cursor = crHandPoint
                        DisabledIndex = 5
                        SelectionFrameColor = 7617536
                        Images = ImagenesBotones
                        Action = AcSiguiente
                        Color = clNone
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clMaroon
                        Font.Height = -19
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = False
                      end
                      object BtnFinMovVentas: TRzToolButton
                        Left = 0
                        Top = 146
                        Width = 50
                        Height = 45
                        Cursor = crHandPoint
                        DisabledIndex = 7
                        SelectionFrameColor = 7617536
                        Images = ImagenesBotones
                        Action = AcFin
                        Color = clNone
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clMaroon
                        Font.Height = -19
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = False
                      end
                      object Shape13: TShape
                        Left = 0
                        Top = 42
                        Width = 49
                        Height = 1
                        Brush.Color = clMaroon
                        Pen.Color = 10382147
                      end
                      object Shape14: TShape
                        Left = 1
                        Top = 92
                        Width = 49
                        Height = 1
                        Brush.Color = clMaroon
                        Pen.Color = 10382147
                      end
                      object Shape15: TShape
                        Left = 1
                        Top = 142
                        Width = 49
                        Height = 1
                        Brush.Color = clMaroon
                        Pen.Color = 10382147
                      end
                      object Shape16: TShape
                        Left = 1
                        Top = 192
                        Width = 49
                        Height = 1
                        Brush.Color = clMaroon
                        Pen.Color = 10382147
                      end
                      object BtnImprimirVentas: TRzToolButton
                        Left = 0
                        Top = 196
                        Width = 50
                        Height = 45
                        Cursor = crHandPoint
                        DisabledIndex = 15
                        SelectionFrameColor = 7617536
                        Images = ImagenesBotones
                        Action = AcReimprimirTicket
                        Align = alCustom
                        Color = clNone
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clMaroon
                        Font.Height = -19
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = False
                      end
                    end
                  end
                end
              end
            end
          end
          object TabAperturaCaja: TRzTabSheet
            Color = clWhite
            Caption = 'TabAperturaCaja'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object RzGroupBox4: TRzGroupBox
              AlignWithMargins = True
              Left = 10
              Top = 3
              Width = 1000
              Height = 412
              Margins.Left = 10
              Margins.Right = 10
              Align = alClient
              FlatColor = 10382147
              TabOrder = 0
              Transparent = True
              ExplicitHeight = 423
              object Label9: TLabel
                Left = 6
                Top = 22
                Width = 143
                Height = 24
                Caption = 'Fecha Apertura'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -21
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label10: TLabel
                Left = 6
                Top = 65
                Width = 53
                Height = 24
                Caption = 'Saldo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -21
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object EditSaldoApertura: TRzNumericEdit
                Left = 73
                Top = 63
                Width = 137
                Height = 26
                DisabledColor = clWindow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = []
                FocusColor = 8454143
                FrameColor = 10382147
                FrameVisible = True
                MaxLength = 30
                ParentFont = False
                TabOrder = 1
                OnClick = EditFechaAperturaClick
                CheckRange = True
                IntegersOnly = False
                Max = 999999.000000000000000000
                DisplayFormat = '###,###,##0.00'
              end
              object EditFechaApertura: TRzDateTimeEdit
                Left = 166
                Top = 20
                Width = 96
                Height = 26
                EditType = etDate
                Color = clWhite
                DropButtonVisible = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = []
                FrameColor = 10382147
                FrameHotTrack = True
                FrameVisible = True
                ParentFont = False
                ReadOnly = True
                ReadOnlyColor = clWhite
                TabOrder = 0
                OnClick = EditFechaAperturaClick
              end
              object RzPanel14: TRzPanel
                AlignWithMargins = True
                Left = 851
                Top = 17
                Width = 140
                Height = 185
                Margins.Right = 8
                Align = alRight
                AutoSize = True
                BorderSides = []
                TabOrder = 2
                Transparent = True
                ExplicitHeight = 196
                object BtnAbrir: TRzBitBtn
                  AlignWithMargins = True
                  Left = 3
                  Top = 0
                  Width = 129
                  Height = 44
                  Margins.Top = 0
                  Margins.Right = 8
                  Margins.Bottom = 0
                  FrameColor = 7617536
                  Action = AcConfirmarAbrirCaja
                  Align = alTop
                  Caption = 'Abrir Caja'
                  Color = clNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12670976
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  HotTrack = True
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 0
                  DisabledIndex = 25
                  ImageIndex = 24
                  Images = ImagenesBotones
                end
              end
              object AdvTouchKeyboard1: TAdvTouchKeyboard
                AlignWithMargins = True
                Left = 16
                Top = 208
                Width = 980
                Height = 200
                Margins.Left = 15
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
                ExplicitTop = 219
                ExplicitWidth = 600
              end
              object BtnFechaApertura: TRzBitBtn
                AlignWithMargins = True
                Left = 266
                Top = 14
                Width = 48
                Height = 43
                Margins.Top = 0
                Margins.Right = 8
                Margins.Bottom = 0
                FrameColor = 7617536
                AlignmentVertical = avBottom
                Color = clNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = []
                HotTrack = True
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 4
                OnClick = BtnFechaAperturaClick
                DisabledIndex = 23
                ImageIndex = 22
                Images = ImagenesBotones
              end
            end
          end
          object TabInsertarApunte: TRzTabSheet
            Color = clWhite
            Caption = 'TabInsertarApunte'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object RzGroupBox3: TRzGroupBox
              AlignWithMargins = True
              Left = 10
              Top = 3
              Width = 1000
              Height = 412
              Margins.Left = 10
              Margins.Right = 10
              Align = alClient
              FlatColor = 10382147
              TabOrder = 0
              Transparent = True
              ExplicitHeight = 423
              object Label6: TLabel
                Left = 6
                Top = 59
                Width = 90
                Height = 24
                Caption = 'Concepto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -21
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label7: TLabel
                Left = 6
                Top = 26
                Width = 70
                Height = 24
                Caption = 'Importe'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -21
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label15: TLabel
                Left = 6
                Top = 92
                Width = 106
                Height = 24
                Caption = 'Documento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -21
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object lblTipoMovCaja: TLabel
                Left = 262
                Top = 26
                Width = 6
                Height = 24
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -21
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object EditConceptoApunte: TRzEdit
                Left = 119
                Top = 57
                Width = 545
                Height = 26
                DisabledColor = clWindow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = []
                FocusColor = 8454143
                FrameColor = 10382147
                FrameVisible = True
                ParentFont = False
                TabOrder = 1
                OnClick = EditImporteApunteClick
              end
              object EditImporteApunte: TRzNumericEdit
                Left = 119
                Top = 24
                Width = 137
                Height = 26
                DisabledColor = clWindow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = []
                FocusColor = 8454143
                FrameColor = 10382147
                FrameVisible = True
                MaxLength = 30
                ParentFont = False
                TabOrder = 0
                OnChange = EditImporteApunteChange
                OnClick = EditImporteApunteClick
                OnDblClick = EditImporteApunteDblClick
                IntegersOnly = False
                DisplayFormat = '###,###,##0.00'
              end
              object RzPanel13: TRzPanel
                AlignWithMargins = True
                Left = 851
                Top = 17
                Width = 140
                Height = 185
                Margins.Right = 8
                Align = alRight
                AutoSize = True
                BorderSides = []
                TabOrder = 3
                Transparent = True
                ExplicitHeight = 196
                object BtnInsertarApunte: TRzBitBtn
                  AlignWithMargins = True
                  Left = 3
                  Top = 0
                  Width = 129
                  Height = 44
                  Margins.Top = 0
                  Margins.Right = 8
                  Margins.Bottom = 0
                  FrameColor = 7617536
                  Action = AcConfirmarInsertarApunte
                  Align = alTop
                  Caption = 'Insertar'
                  Color = clNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12670976
                  Font.Height = -16
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  HotTrack = True
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 0
                  DisabledIndex = 9
                  ImageIndex = 8
                  Images = ImagenesBotones
                end
              end
              object AdvTouchKeyboard2: TAdvTouchKeyboard
                AlignWithMargins = True
                Left = 16
                Top = 208
                Width = 980
                Height = 200
                Margins.Left = 15
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
                ExplicitTop = 219
                ExplicitWidth = 600
              end
              object EditDocumentoApunte: TRzEdit
                Left = 119
                Top = 90
                Width = 137
                Height = 26
                DisabledColor = clWindow
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = []
                FocusColor = 8454143
                FrameColor = 10382147
                FrameVisible = True
                ParentFont = False
                TabOrder = 2
                OnClick = EditImporteApunteClick
              end
            end
          end
          object TabCierreCaja: TRzTabSheet
            Color = clWhite
            Caption = 'TabCierreCaja'
            object RzGroupBox5: TRzGroupBox
              AlignWithMargins = True
              Left = 10
              Top = 3
              Width = 1002
              Height = 70
              Margins.Left = 10
              Margins.Right = 8
              Align = alTop
              FlatColor = 10382147
              TabOrder = 0
              Transparent = True
              object Label11: TLabel
                Left = 8
                Top = 27
                Width = 143
                Height = 24
                Caption = 'Fecha Apertura'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -21
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label13: TLabel
                Left = 280
                Top = 27
                Width = 123
                Height = 24
                Caption = 'Fecha Cierre'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -21
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object EditFechaInicioCierre: TRzLabel
                Left = 158
                Top = 24
                Width = 102
                Height = 27
                AutoSize = False
                Color = 15658734
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                BorderInner = fsFlat
                BorderColor = clBtnShadow
                BorderWidth = 1
                FlatColor = clBtnFace
              end
              object RzPanel15: TRzPanel
                AlignWithMargins = True
                Left = 845
                Top = 17
                Width = 148
                Height = 49
                Margins.Right = 8
                Align = alRight
                AutoSize = True
                BorderSides = []
                TabOrder = 0
                Transparent = True
                object BtnCerraCaja: TRzBitBtn
                  AlignWithMargins = True
                  Left = 3
                  Top = 0
                  Width = 137
                  Height = 44
                  Margins.Top = 0
                  Margins.Right = 8
                  Margins.Bottom = 0
                  FrameColor = 7617536
                  Action = AcConfirmarCerrarCaja
                  Align = alTop
                  Caption = 'Cerrar Caja'
                  Color = clNone
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12670976
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = []
                  HotTrack = True
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 0
                  DisabledIndex = 29
                  ImageIndex = 28
                  Images = ImagenesBotones
                end
              end
              object EditFechaFinCierre: TRzDateTimeEdit
                Left = 409
                Top = 25
                Width = 102
                Height = 26
                EditType = etDate
                Color = clWhite
                DropButtonVisible = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = []
                FrameColor = 12670976
                FrameHotTrack = True
                FrameVisible = True
                ParentFont = False
                ReadOnly = True
                ReadOnlyColor = clWhite
                TabOrder = 1
              end
              object BtnFechaCierre: TRzBitBtn
                AlignWithMargins = True
                Left = 517
                Top = 16
                Width = 50
                Height = 44
                Margins.Top = 0
                Margins.Right = 8
                Margins.Bottom = 0
                FrameColor = 7617536
                Color = clNone
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12670976
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = []
                HotTrack = True
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 2
                OnClick = BtnFechaCierreClick
                DisabledIndex = 23
                ImageIndex = 22
                Images = ImagenesBotones
              end
            end
            object RzPanel7: TRzPanel
              Left = 0
              Top = 76
              Width = 1020
              Height = 342
              Align = alClient
              BorderOuter = fsNone
              BorderSides = []
              TabOrder = 1
              Transparent = True
              VisualStyle = vsClassic
              object RzGroupBox6: TRzGroupBox
                AlignWithMargins = True
                Left = 10
                Top = 3
                Width = 743
                Height = 224
                Margins.Left = 10
                Align = alLeft
                BorderWidth = 1
                FlatColor = 10382147
                TabOrder = 0
                Transparent = True
                object RzPanel4: TRzPanel
                  Left = 2
                  Top = 14
                  Width = 739
                  Height = 208
                  Align = alClient
                  AutoSize = True
                  BorderSides = []
                  TabOrder = 0
                  Transparent = True
                  object GridPagos: TDBGridEh
                    AlignWithMargins = True
                    Left = 5
                    Top = 0
                    Width = 668
                    Height = 203
                    Margins.Left = 5
                    Margins.Top = 0
                    Margins.Right = 5
                    Margins.Bottom = 5
                    Align = alClient
                    AutoFitColWidths = True
                    DataSource = S_CIERRE
                    FixedColor = 16776176
                    Flat = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = []
                    FooterColor = clWindow
                    FooterFont.Charset = DEFAULT_CHARSET
                    FooterFont.Color = clWindowText
                    FooterFont.Height = -11
                    FooterFont.Name = 'MS Sans Serif'
                    FooterFont.Style = []
                    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clMaroon
                    TitleFont.Height = -13
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    Columns = <
                      item
                        EditButtons = <>
                        FieldName = 'DESMEDPAG'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = 12670976
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        Footers = <>
                        Title.Alignment = taCenter
                        Title.Caption = 'MEDIO PAGO'
                        Title.Color = 16249582
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = 12670976
                        Title.Font.Height = -13
                        Title.Font.Name = 'Tahoma'
                        Title.Font.Style = []
                        Width = 206
                      end
                      item
                        EditButtons = <>
                        FieldName = 'ENTRADA'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = 12670976
                        Font.Height = -13
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        Footers = <>
                        Title.Caption = 'ENTRADAS'
                        Title.Color = 16249582
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = 12670976
                        Title.Font.Height = -13
                        Title.Font.Name = 'Tahoma'
                        Title.Font.Style = []
                        Width = 82
                      end
                      item
                        EditButtons = <>
                        FieldName = 'SALIDA'
                        Footers = <>
                        Title.Caption = 'SALIDAS'
                        Title.Color = 16249582
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = 12670976
                        Title.Font.Height = -13
                        Title.Font.Name = 'Tahoma'
                        Title.Font.Style = []
                        Width = 80
                      end
                      item
                        EditButtons = <>
                        FieldName = 'TOTAL'
                        Footers = <>
                        Title.Caption = 'TOTAL (E-S)'
                        Title.Color = 16249582
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = 12670976
                        Title.Font.Height = -13
                        Title.Font.Name = 'Tahoma'
                        Title.Font.Style = []
                        Width = 94
                      end
                      item
                        EditButtons = <>
                        FieldName = 'RECUENTO'
                        Footers = <>
                        Title.Color = 16249582
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = 12670976
                        Title.Font.Height = -13
                        Title.Font.Name = 'Tahoma'
                        Title.Font.Style = []
                        Width = 81
                      end
                      item
                        EditButtons = <>
                        FieldName = 'DESCUADRE'
                        Footers = <>
                        Title.Color = 16249582
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = 12670976
                        Title.Font.Height = -13
                        Title.Font.Name = 'Tahoma'
                        Title.Font.Style = []
                        Width = 92
                      end>
                  end
                  object RzPanel8: TRzPanel
                    AlignWithMargins = True
                    Left = 681
                    Top = 3
                    Width = 50
                    Height = 202
                    Margins.Right = 8
                    Align = alRight
                    AutoSize = True
                    BorderSides = []
                    TabOrder = 1
                    Transparent = True
                    object BtnAnteriorResumen: TRzToolButton
                      Left = 0
                      Top = 0
                      Width = 50
                      Height = 45
                      Cursor = crHandPoint
                      DisabledIndex = 3
                      SelectionFrameColor = 7617536
                      Images = ImagenesBotones
                      Action = AcAnterior
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
                    object BtnSiguienteResumen: TRzToolButton
                      Left = 0
                      Top = 51
                      Width = 50
                      Height = 45
                      Cursor = crHandPoint
                      DisabledIndex = 5
                      SelectionFrameColor = 7617536
                      Images = ImagenesBotones
                      Action = AcSiguiente
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
                    object Shape11: TShape
                      Left = 1
                      Top = 46
                      Width = 49
                      Height = 1
                      Brush.Color = clMaroon
                      Pen.Color = 10382147
                    end
                    object Shape12: TShape
                      Left = 1
                      Top = 97
                      Width = 49
                      Height = 1
                      Brush.Color = clMaroon
                      Pen.Color = 10382147
                    end
                    object BtnRecuento: TRzToolButton
                      Left = 0
                      Top = 99
                      Width = 50
                      Height = 45
                      Cursor = crHandPoint
                      DisabledIndex = 41
                      SelectionFrameColor = 7617536
                      Images = ImagenesBotones
                      ShowCaption = False
                      UseToolbarShowCaption = False
                      Action = AcRecuento
                      Color = clNone
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clMaroon
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                    end
                  end
                end
              end
              object RzPanel16: TRzPanel
                AlignWithMargins = True
                Left = 10
                Top = 233
                Width = 1002
                Height = 106
                Margins.Left = 10
                Margins.Right = 8
                Align = alBottom
                BorderSides = []
                TabOrder = 1
                Transparent = True
                object RzGroupBox10: TRzGroupBox
                  Left = 0
                  Top = -5
                  Width = 1002
                  Height = 111
                  Margins.Top = 0
                  Margins.Bottom = 0
                  Align = alBottom
                  FlatColor = 10382147
                  TabOrder = 0
                  Transparent = True
                  object Label18: TLabel
                    Left = 7
                    Top = 49
                    Width = 115
                    Height = 19
                    Caption = 'Entradas (Mov)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = True
                  end
                  object EditEntradasMov: TRzLabel
                    Left = 145
                    Top = 45
                    Width = 126
                    Height = 27
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = '0'
                    Color = 15658734
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    BorderInner = fsFlat
                    BorderColor = clBtnShadow
                    BorderWidth = 1
                    FlatColor = clBtnFace
                  end
                  object Label19: TLabel
                    Left = 438
                    Top = 49
                    Width = 102
                    Height = 19
                    Caption = 'Salidas (Mov)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = True
                  end
                  object EditSalidasMov: TRzLabel
                    Left = 607
                    Top = 45
                    Width = 126
                    Height = 27
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = '0'
                    Color = 15658734
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    BorderInner = fsFlat
                    BorderColor = clBtnShadow
                    BorderWidth = 1
                    FlatColor = clBtnFace
                  end
                  object Label3: TLabel
                    Left = 7
                    Top = 18
                    Width = 135
                    Height = 19
                    Caption = 'Entradas (Ventas)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = True
                  end
                  object EditEntradasVentas: TRzLabel
                    Left = 145
                    Top = 14
                    Width = 126
                    Height = 27
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = '0'
                    Color = 15658734
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    BorderInner = fsFlat
                    BorderColor = clBtnShadow
                    BorderWidth = 1
                    FlatColor = clBtnFace
                  end
                  object Label4: TLabel
                    Left = 7
                    Top = 80
                    Width = 110
                    Height = 19
                    Caption = 'Total Entradas'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = True
                  end
                  object EditTotalEntradas: TRzLabel
                    Left = 145
                    Top = 76
                    Width = 126
                    Height = 27
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = '0'
                    Color = 15658734
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    BorderInner = fsFlat
                    BorderColor = clBtnShadow
                    BorderWidth = 1
                    FlatColor = clBtnFace
                  end
                  object EditSalidasDev: TRzLabel
                    Left = 607
                    Top = 14
                    Width = 126
                    Height = 27
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = '0'
                    Color = 15658734
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    BorderInner = fsFlat
                    BorderColor = clBtnShadow
                    BorderWidth = 1
                    FlatColor = clBtnFace
                  end
                  object Label5: TLabel
                    Left = 438
                    Top = 18
                    Width = 157
                    Height = 19
                    Caption = 'Salidas (Devolucion)'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = True
                  end
                  object EditTotalSalidas: TRzLabel
                    Left = 607
                    Top = 76
                    Width = 126
                    Height = 27
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = '0'
                    Color = 15658734
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                    BorderInner = fsFlat
                    BorderColor = clBtnShadow
                    BorderWidth = 1
                    FlatColor = clBtnFace
                  end
                  object Label8: TLabel
                    Left = 438
                    Top = 80
                    Width = 97
                    Height = 19
                    Caption = 'Total Salidas'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = True
                  end
                  object lblEnNTicketsVentas: TLabel
                    Left = 277
                    Top = 18
                    Width = 93
                    Height = 19
                    Caption = 'En 0 Tickets'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = True
                  end
                  object lblEnNTicketsDev: TLabel
                    Left = 739
                    Top = 18
                    Width = 93
                    Height = 19
                    Caption = 'En 0 Tickets'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 12670976
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = True
                  end
                end
              end
              object RzGroupBox9: TRzGroupBox
                AlignWithMargins = True
                Left = 766
                Top = 3
                Width = 244
                Height = 224
                Margins.Left = 10
                Margins.Right = 10
                Align = alClient
                FlatColor = 10382147
                TabOrder = 2
                Transparent = True
                object Label16: TLabel
                  Left = 253
                  Top = 13
                  Width = 7
                  Height = 25
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12670976
                  Font.Height = -21
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  Transparent = True
                end
                object Label17: TLabel
                  Left = 12
                  Top = 26
                  Width = 78
                  Height = 19
                  Caption = 'Total (E-S)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12670976
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object EditTotal: TRzLabel
                  Left = 12
                  Top = 51
                  Width = 126
                  Height = 27
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '0'
                  Color = 15658734
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12670976
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  BorderInner = fsFlat
                  BorderColor = clBtnShadow
                  BorderWidth = 1
                  FlatColor = clBtnFace
                end
                object Label12: TLabel
                  Left = 12
                  Top = 98
                  Width = 115
                  Height = 19
                  Caption = 'Total Recuento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12670976
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object EditTotalRecuento: TRzLabel
                  Left = 12
                  Top = 123
                  Width = 126
                  Height = 27
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '0'
                  Color = 15658734
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12670976
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  BorderInner = fsFlat
                  BorderColor = clBtnShadow
                  BorderWidth = 1
                  FlatColor = clBtnFace
                end
                object Label14: TLabel
                  Left = 12
                  Top = 167
                  Width = 83
                  Height = 19
                  Caption = 'Descuadre'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12670976
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object EditTotalDescuadre: TRzLabel
                  Left = 12
                  Top = 192
                  Width = 126
                  Height = 27
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '0'
                  Color = 15658734
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12670976
                  Font.Height = -16
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  BorderInner = fsFlat
                  BorderColor = clBtnShadow
                  BorderWidth = 1
                  FlatColor = clBtnFace
                end
              end
            end
          end
        end
      end
      object RzPanel3: TRzPanel
        Left = 0
        Top = 19
        Width = 1024
        Height = 6
        Align = alTop
        BiDiMode = bdLeftToRight
        BorderOuter = fsNone
        BorderSides = []
        BorderColor = clWhite
        BorderHighlight = clWhite
        BorderShadow = clWhite
        Color = clWhite
        Ctl3D = True
        FlatColor = clWhite
        GradientColorStyle = gcsCustom
        GradientColorStop = 13546913
        GradientDirection = gdHorizontalCenter
        GridColor = clWhite
        ParentBiDiMode = False
        ParentCtl3D = False
        TabOrder = 1
        VisualStyle = vsGradient
      end
      object RzPanel12: TRzPanel
        AlignWithMargins = True
        Left = 3
        Top = 28
        Width = 1013
        Height = 58
        Margins.Right = 8
        Align = alTop
        AutoSize = True
        BorderSides = []
        TabOrder = 2
        Transparent = True
        object RZGroupBox7: TRzGroupBox
          AlignWithMargins = True
          Left = 10
          Top = 3
          Width = 792
          Height = 52
          Margins.Left = 10
          Margins.Right = 10
          Align = alClient
          FlatColor = 10382147
          TabOrder = 0
          Transparent = True
          object Label1: TLabel
            Left = 4
            Top = 14
            Width = 62
            Height = 24
            Caption = 'Cajero'
            Font.Charset = ANSI_CHARSET
            Font.Color = 12670976
            Font.Height = -21
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object LabelUsuario: TRzLabel
            Left = 72
            Top = 11
            Width = 161
            Height = 28
            AutoSize = False
            Color = 15658734
            Font.Charset = ANSI_CHARSET
            Font.Color = 12670976
            Font.Height = -21
            Font.Name = 'Arial'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            BorderInner = fsFlat
            BorderColor = clBtnShadow
            BorderWidth = 1
            FlatColor = clBtnFace
          end
          object LabelDesUsuario: TRzLabel
            Left = 239
            Top = 11
            Width = 538
            Height = 28
            AutoSize = False
            Color = 15658734
            Font.Charset = ANSI_CHARSET
            Font.Color = 12670976
            Font.Height = -21
            Font.Name = 'Arial'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            BorderInner = fsFlat
            BorderColor = clBtnShadow
            BorderWidth = 1
            FlatColor = clBtnFace
          end
        end
        object RzPanel17: TRzPanel
          Left = 812
          Top = 0
          Width = 201
          Height = 58
          Align = alRight
          BorderOuter = fsNone
          TabOrder = 1
          Transparent = True
          object Image1: TImage
            Left = 29
            Top = 3
            Width = 42
            Height = 55
            Center = True
            Picture.Data = {
              07544269746D6170660F0000424D660F00000000000036000000280000002400
              0000240000000100180000000000300F0000C40E0000C40E0000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF5F5F5F1F1F1F0F0F0F0F0F0F2F2F2F6F6
              F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1CECECEBDBDBDC0C0C0CBCBCBD2D2
              D2D4D4D4D3D3D3D0D0D0C7C7C7BCBCBCC1C1C1D7D7D7FAFAFAFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBC1C1C1A4A4A4BBBB
              BBCDCDCDD7D7D7DCDCDCE0E0E0E1E1E1E0E0E0E2E2E2E7E7E7E0E0E0CBCBCBB7
              B7B7A9A9A9D3D3D3FDFDFDFBFBFBF9F9F9F9F9F9FAFAFAFCFCFCFEFEFEFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFA
              FAB0B0B0B5B5B5C9C9C9CBCBCBD1D1D1D8D8D8DDDDDDE2E2E2E5E5E5E4E4E4E3
              E3E3E6E6E6DCDCDCCFCFCFE1E1E1D3D3D3B4B4B4ACACACCDCDCDCFCFCFD4D4D4
              DBDBDBE5E5E5EEEEEEF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFCCCCCCB9B9B9C7C7C7C3C3C3CACACAD2D2D2DADADADF
              DFDFE5E5E5EBEBEBEAEAEAE5E5E5E5E5E5D9D9D9DFDFDFD4D4D4C2C2C2CCCCCC
              B2B2B28F8F8FA7A7A7B4B4B4C5C5C5D6D6D6E7E7E7F6F6F6FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCC2C2C2C4C4C4C4
              C4C4CACACAD2D2D2DADADADFDFDFE6E6E6ECECECECECECE6E6E6E1E1E1DFDFDF
              D8D8D8C8C8C8C4C4C4BBBBBBAFAFAF8F8F8F979797B2B2B2C9C9C9DFDFDFF1F1
              F1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFD9D9D9C0C0C0C4C4C4C4C4C4C8C8C8D1D1D1D8D8D8DEDEDEE3E3E3E7E7E7
              E8E8E8E3E3E3DFDFDFDBDBDBD2D2D2C7C7C7B9B9B9ADADAD9D9D9D9D9D9DB6B6
              B6D0D0D0E5E5E5F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFC3C3C3C4C4C4C5C5C5C7C7C7CFCFCF
              D6D6D6DCDCDCE0E0E0E3E3E3E3E3E3E1E1E1DADADACECECEB8B8B8AEAEAEA6A6
              A69494948C8C8CBFBFBFD2D2D2E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8E9E9E9CDCDCD
              BEBEBEBDBDBDBFBFBFC5C5C5CBCBCBCECECECFCFCFCDCDCDC4C4C4B2B2B29797
              977B7B7B767676A1A1A1AEAEAEB1B1B1CCCCCCDEDEDEE6E6E6D1D1D1F9F9F9FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              F9F9F9EAEAEAD8D8D8C6C6C6B1B1B19E9E9E9A9A9A9E9E9EA4A4A4AAAAAAB2B2
              B2A8A8A89B9B9B9898989F9F9FB2B2B2CECECED8D8D8D8D8D8DDDDDDD2D5D5CC
              CDCDDFDFDFDCDCDCE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7EBEBEBDFDFDFD4D4D4CACACAC2C2C2BBBB
              BBB6B6B6B2B2B2B6B6B6C1C1C1C2C2C2C5C5C5C7C7C7CECECED5D7D7D1D7D8D0
              D8D9D1DADBD8DEDEDED7D5D7D3D2D7D8D8BFBFBFD2D2D2FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF7F7
              F7EDEDEDE3E3E3D9D9D9D4D4D4D0D0D0C0C0C0B3B3B3AAACADA8AEAFAEB7B9BE
              C7C8D3D9DADED9D7DFC6C2DBABA4D0837AC0574CAB2D22CFA8A5DAE2E2BDBDBD
              C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
              FEF8F5F7E9E9E9DCDCDCD4D4D4C8C8C8BFBFBFBABDBEB9BFBFB5BDBEAAB2B3B1
              B5B5BDB6B4C8AFABCE9E97CB7E75BD564AA9332799190D8F0B008D0800940B00
              9E0600C68781DBE4E5C4C4C4BABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFE0E0E0C3C2C3AEB5B19AA99F9D9D9EB0B5B6B9C1C2BCC4C5C2C5C5C6
              BFBEC8B1ADC59791C0766DB75144AA33279D1A10910C03860900860B008B1000
              9316029D1905A71B06B01D06B71300C87168D9E4E6CCCCCCB4B4B4FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF908F928DA99D8BB79DB6ADB0C3
              AEACC1948FBA736BAE4D42A331259E190D970D01940A00920A02930D0894100D
              94130E9519069B1A069F1A07A51C07AD1C08B41D08BC1F08C51500CD5C51D7E1
              E3D3D3D3AFAFAFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C3C393
              87859D5852A8463FA233259B2413951F0D8F21108A2618941E13A1160DA11811
              A11711A11712A01612A01514A01710A51B07A91C08AD1D08B41D08BB1E08C220
              08CB2108D31A00D34E40D6DBDDD7D7D7ACACACF3F3F3FFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFCFD6D69C7E7DA121119B321C9A38209A3C22993D23963B22
              953722A61D15AB1813AA1914A91915A91815A91816A81618AC1910B41E07B71F
              08BD1F08C32008C92108D12208D8260CDB2E13D74D40D5D2D4D8DADAACACACE9
              E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDFDFA19292AC4034A04C35
              9F47309E432B9D40289A4026A2311FB31816B21A17B21A18B21918B21919B118
              1AB0181BBA1D10C42108C82109CE2109D22209D7250CDB2E15DD3B24E04831DC
              5347D7C9CBD8DCDCAFAFAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              E6E8E8A39E9FB64D48A6503EA54F3BA24B36A047329E462EB3261FBB191BBA1B
              1CBA1B1DBA1A1DBA1A1EB91A1FB9191FCB1F0ED52208D8240BDB290FDC3018DD
              3B24DF4631E1513EE45F4CE15E53DABEC1D9DFDFB4B4B4D4D4D4FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1AFB2B3C15E5EAE594CAC5A4BA95544A653
              40AA4435C11B1EC11C1FC11B20C21C20C21C21C21B22C21B22C31A22D92B17DF
              341BDF3A22E0412BE14935E2533FE35C4BE56656E77364E56E64DCB2B5D8E0E0
              BBBBBBC4C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBC0C7C7C872
              76BB675FB66B60B36257AE6152BD3533CA1920C91D23CA1C24CA1C25CA1C25CB
              1C26CA1A26CE2128E04633E24E39E35340E45947E5604FE66858E87162E97A6C
              EA8579EA8078DFA1A6D7DFDEC1C1C1BABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFC6CECECD8A8FC87671C38079BE7870BD6861CC1F2BCF1B27D1
              1D28D21D28D21D29D31D29D31D2AD21928D82C33E66150E66554E7695AE86F60
              E97567EA7D70EC8479ED8C82EE958CEF948DE4989FD6DDDCC8C8C8B5B5B5FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDD5D4CC999FD27F80CE958FCA
              928BCC5459D31527D41C2CD71D2CD91E2CDA1E2CDA1E2DDA1E2ED9182CE03E44
              EA7A6CEA7A6DEA7E72EB8378EC887EED8F85EE958DEF9C95F1A49EF2A6A1EA95
              9ED6D9D9CFCFCFB0B0B0FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8
              DEDDC5A1A6DB888CD8A9A5D59B99D62B3FD8152EDA1B33DC1C33DE1D33E01E33
              E11E33E31E32E3192CEA595AEF9185EF8F84EF9389F0988EF19D94F2A29BF3A9
              A2F4AFA8F4B6B0F6BCB7EF989CD6D3D4D3D4D4ACACACF8F8F8FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFE1E5E4BEA8ADE28E96E1C0BCDE7E88DD1230E01A32
              E31C2DE61E27EB2021F1231AF72713FC290EFD2607F67F6DF3ABA0F3A99CF4AC
              A0F4B0A5F5B5AAF6BAB0F7BFB6F7C5BDF7CAC3F9D5CEF4A39CD8CBCAD7DADAAA
              AAAAF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAECEBB9B0B1E3949B
              EBCFCCE04142E11210E51C12E91E0EED210BF1230AF52509F82708FC2806FF2E
              0AF79F90F5BCB2F6B9AFF6BCB3F7C0B7F7C4BBF8C8C0F9CCC6F9D1CBFAD6D0FA
              E1DDF8AEA7DCC4C2DBE1E1AAAAAAE8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF3F3F3B6B5B5DEA2A0EEB4B1DA100BDE170FE11A10E41C10E81E0FEB20
              0EEF220DF3240CF62206FA381CF8BDB3F8CAC2F8C9C1F8CBC4F9CEC7F9D1CBFA
              D5CFFAD9D4FBDCD8FCE0DCFCECE9FABAB4E2BEBBE1E8E9AEAEAEDEDEDEFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAB6BABAD29C9CE45F5FD50808DA16
              13DD1812E01A11E41B10E71D0FEB1F0EEE210DF21C04F64C35FAD6D0FAD5D0FA
              D6D0FAD8D2FBDBD5FBDDD8FCE0DBFCE2DFFCE5E2FDE9E6FEF3F1FCC9C3E9B7B3
              E7EFF0B4B4B4D4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3BE
              BEBC7577D40D12D31113D61414DA1613DD1712E01911E31B10E61D0FEA1F0EED
              1702F46858FCE8E5FBE0DBFCE1DCFCE3DEFCE4E0FDE6E3FDE9E5FDEBE8FEEDEB
              FEF1EFFEF9F8FED9D6EEAFA8ECF4F4BCBCBCC8C8C8FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFB9C4C4AF777ACF060ED11016D31215D61414D91513DC
              1712DF1911E21B10E61C0FE91403F58D83FDF4F2FDE9E6FDEBE8FDEDEAFEF0EE
              FFF4F2FFF8F6FFFBF9FFFCFAFFFAF8FFF6F3FFCFC9EB8E83F0F7F8C6C6C6BABA
              BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5CCCCA7898BCB0C17CE
              0D15D01016D31215D51314D81513DB1713DE1912E3180EE9180BFBBBB5FFFFFF
              FFF7F4FFF2F0FFEBE7FEE0DBF7D2CCECC0B8DEABA3CF988FC1877EB67B73A972
              6AB3938FF7FAFBD2D2D2ACACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFD5D9D9A49798C61420CD0914D20D16D60D14D80D11DA0C0EDA0C0BD90C08
              D60C06D0130BD3837ECBA4A1BF918DB58883A9817C9D7E7A9B827E9E8D8AA59C
              9AABA8A8B8BBBBCBD0D0DCE3E4EAF0F0F4F4F4D1D1D1C9C9C9FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E4E4A3A3A3B71724B80009AF0A13A8141B
              A324289E3638954B4B946060997877A19291A69F9EACA9A9B3B4B4BCBFBFC3C7
              C8C9CECECED3D3D4D7D8D9DADBDBDCDBE3E3E3EBEBEBF0F0F0F4F4F4F7F7F7FA
              FAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEEEEA9A9A9
              8D77799B8A8CA5A4A4AEB5B4B7C2C1C0CCCBC7D3D3CCD7D7D1D9D9D6DBDBDBDE
              DEDEDFDFE4E4E4EAEAEAEFEFEFF4F4F4F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFF7F7F7BDBDBDCAD0CFDADFDEDEE0E0E0E1E1E8E8E8EEEEEEF2F2
              F2F7F7F7FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFEFEFEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          end
          object lblEstadoCaja: TLabel
            AlignWithMargins = True
            Left = 79
            Top = 32
            Width = 4
            Height = 16
            Margins.Right = 10
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12670976
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
        end
      end
    end
  end
  inherited Acciones: TActionList
    Images = ImagenesBotones
    Left = 144
    Top = 248
    object AcAbrirCaja: TAction
      Caption = 'APERTURA'
      ImageIndex = 16
      OnExecute = AcAbrirCajaExecute
    end
    object AcMovimientos: TAction
      Caption = 'MOVIMIENTOS'
      ImageIndex = 26
      OnExecute = AcMovimientosExecute
    end
    object AcImprimirUltimoCierre: TAction
      Caption = 'IMPRIMIR ULTIMO CIERRE'
      ImageIndex = 14
      OnExecute = AcImprimirUltimoCierreExecute
    end
    object AcCambiarUsuario: TAction
      Caption = 'CAJERO'
      ImageIndex = 10
      OnExecute = AcCambiarUsuarioExecute
    end
    object AcCierre: TAction
      Caption = 'CIERRE'
      ImageIndex = 18
      OnExecute = AcCierreExecute
    end
    object AcInsertarApunte: TAction
      Caption = 'INSERTAR APUNTE'
      ImageIndex = 20
      OnExecute = AcInsertarApunteExecute
    end
    object AcAbrirCajon: TAction
      Caption = 'ABRIR CAJON'
      ImageIndex = 32
      OnExecute = AcAbrirCajonExecute
    end
    object AcReimprimirTicket: TAction
      Caption = 'AcReimprimirTicket'
      ImageIndex = 14
      OnExecute = AcReimprimirTicketExecute
    end
    object AcInicio: TAction
      Caption = 'Inicio'
      ImageIndex = 2
      OnExecute = AcInicioExecute
    end
    object AcAnterior: TAction
      Caption = 'Anterior'
      ImageIndex = 0
      OnExecute = AcInicioExecute
    end
    object AcSiguiente: TAction
      Caption = 'Siguiente'
      ImageIndex = 6
      OnExecute = AcInicioExecute
    end
    object AcFin: TAction
      Caption = 'Fin'
      ImageIndex = 4
      OnExecute = AcInicioExecute
    end
    object AcEliminarMovimiento: TAction
      Caption = 'BORRAR MOVIMIENTO'
      ImageIndex = 12
      OnExecute = AcEliminarMovimientoExecute
    end
    object AcConfirmarAbrirCaja: TAction
      Caption = 'Abrir Caja'
      ImageIndex = 24
      OnExecute = AcConfirmarAbrirCajaExecute
    end
    object AcConfirmarInsertarApunte: TAction
      Caption = 'Insertar'
      ImageIndex = 8
      OnExecute = AcConfirmarInsertarApunteExecute
    end
    object AcConfirmarCerrarCaja: TAction
      Caption = 'Cerrar Caja'
      ImageIndex = 28
      OnExecute = AcConfirmarCerrarCajaExecute
    end
    object AcRecuento: TAction
      Caption = 'Recuento'
      ImageIndex = 40
      OnExecute = AcRecuentoExecute
    end
  end
  object S_CIERRE: TDataSource
    OnDataChange = S_MOVIMIENTOSDataChange
    Left = 544
    Top = 64
  end
  object S_MOVIMIENTOS: TDataSource
    OnDataChange = S_MOVIMIENTOSDataChange
    Left = 464
    Top = 64
  end
  object S_MOVIMIENTOS_VENTAS: TDataSource
    OnDataChange = S_MOVIMIENTOSDataChange
    Left = 640
    Top = 64
  end
  object ImagenesBotones: TImageList
    Height = 36
    Width = 36
    Left = 744
    Top = 64
    Bitmap = {
      494C01012C0031000C0024002400FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000090000000B0010000010020000000000000CC
      0300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB0000000000000000000000
      00000000000000000000FEFEFE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4E4E400CACA
      CA00CBCBCB00CBCBCB00CBCBCB00CACACB00CBCBCB00CBCBCB00CBCBCB00CBCB
      CB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCB
      CB00CBCBCB00CBCBCB00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CECECE00EFEFEF00000000000000
      00000000000000000000E4E4E400CACACA00CBCBCB00CBCBCB00CBCBCB00CACA
      CA00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCB
      CB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CECECE00EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00E6E6E600E9E9
      E900E9E9E900EAEAEA00EAEAEB00DFDFEB00EDEDEC00EDEDED00EEEEEE00EFEF
      EF00F0F0F000F1F1F100F2F2F200F2F2F200F3F3F300F4F4F400F5F5F500F6F6
      F600F7F7F700F7F7F700F8F8F800F9F9F900FAFAFA00FAFAFA00FBFBFB00FCFC
      FC00FCFCFC00FDFDFD00FDFDFD00FEFEFE00FBFBFB00EAEAEA00000000000000
      000000000000FDFDFD00E6E6E600E9E9E900E9E9E900EAEAEA00EAEAEA00E3E3
      E300ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1F100F2F2F200F2F2
      F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F7F7F700F8F8F800F9F9
      F900FAFAFA00FAFAFA00FBFBFB00FCFCFC00FCFCFC00FDFDFD00FDFDFD00FEFE
      FE00FBFBFB00EAEAEA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FDFDFD00FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FDFDFD00FDFDFD000000000000000000FDFDFD00E6E6E600E8E8
      E800E8E8E800E9E9E900E9E9EA00DDDDEA00EDEDEC00EDEDED00EEEEEE00EFEF
      EF00F0F0F000F1F1F100F2F2F200F3F3F300F4F4F400F5F5F500F5F5F500F6F6
      F600F7F7F700F8F8F800F9F9F900FAFAFA00FAFAFA00FBFBFB00FCFCFC00FDFD
      FD00FDFDFD00FEFEFE00FEFEFE0000000000FCFCFC00EBEBEB00000000000000
      000000000000FDFDFD00E6E6E600E8E8E800E8E8E800E9E9E900E9E9E900E1E1
      E100ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1F100F2F2F200F3F3
      F300F4F4F400F5F5F500F5F5F500F6F6F600F7F7F700F8F8F800F9F9F900FAFA
      FA00FAFAFA00FBFBFB00FCFCFC00FDFDFD00FDFDFD00FEFEFE00FEFEFE000000
      0000FCFCFC00EBEBEB00000000000000000000000000EFEFEF00CBCBCB00C4C4
      C400C5C5C500C4C4C400C4C4C400C3C3C300C2C2C200C2C2C200C2C2C200C2C2
      C200C2C2C200C0C0C000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BEBE
      BE00BDBDBD00BDBDBD00BCBCBC00BCBCBC00BCBCBC00BBBBBB00B9B9B900BBBB
      BB00BABABA00BABABA00BABABA00B8B8B800B5B5B500BBBBBB00E8E8E8000000
      000000000000EFEFEF00CBCBCB00C4C4C400C5C5C500C4C4C400C4C4C400C3C3
      C300C2C2C200C2C2C200C2C2C200C2C2C200C2C2C200C0C0C000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BEBEBE00BDBDBD00BDBDBD00BCBCBC00BCBC
      BC00BCBCBC00BBBBBB00B9B9B900BBBBBB00BABABA00BABABA00BABABA00B8B8
      B800B5B5B500BBBBBB00E8E8E8000000000000000000FDFDFD00E7E7E700EAEA
      EA00EAEAEA00EBEBEB00EBEBEC00DFDFEB00EEEEEE00EFEFEF00EFEFEF00F0F0
      F000F1F1F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8
      F800F8F8F800F9F9F900FAFAFA00FBFBFB00FBFBFB00FCFCFC00FDFDFD00FDFD
      FD00FEFEFE00FEFEFE000000000000000000FCFCFC00EBEBEB00000000000000
      000000000000FDFDFD00E7E7E700EAEAEA00EAEAEA00EBEBEB00EBEBEB00E3E3
      E300EEEEEE00EFEFEF00EFEFEF00F0F0F000F1F1F100F2F2F200F3F3F300F4F4
      F400F5F5F500F6F6F600F7F7F700F8F8F800F8F8F800F9F9F900FAFAFA00FBFB
      FB00FBFBFB00FCFCFC00FDFDFD00FDFDFD00FEFEFE00FEFEFE00000000000000
      0000FCFCFC00EBEBEB00000000000000000000000000ECECEC00B2B2B200CCCC
      CC00CBCBCB00CBCBCB00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CBCBCB00CACA
      CA00D2D2D200CDCDCD00CBCBCB00CBCBCB00CBCBCB00D2D2D200D2D2D200CDCD
      CD00CBCBCB00CBCBCB00CCCCCC00D7D7D700D3D3D300CCCCCC00B9B9B900A5A5
      A500B7B7B700BABABA00B4B4B400B2B2B200ACACAC009D9D9D00EBEBEB000000
      000000000000ECECEC00B2B2B200CCCCCC00CBCBCB00CBCBCB00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CBCBCB00CACACA00D2D2D200CDCDCD00CBCBCB00CBCB
      CB00CBCBCB00D2D2D200D2D2D200CDCDCD00CBCBCB00CBCBCB00CCCCCC00D7D7
      D700D3D3D300CCCCCC00B9B9B900A5A5A500B7B7B700BABABA00B4B4B400B2B2
      B200ACACAC009D9D9D00EBEBEB000000000000000000FDFDFD00E7E7E700EBEB
      EB00EBEBEB00ECECEC00EBEBEC00E0E0EC00EFEFEE00EFEFEF00F0F0F000F1F1
      F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F7F7F700F8F8
      F800F9F9F900FAFAFA00FBFBFB00FBFBFB00FCFCFC00FCFCFC00FDFDFD00FEFE
      FE00FEFEFE00000000000000000000000000FBFBFB00EBEBEB00000000000000
      000000000000FDFDFD00E7E7E700EBEBEB00EBEBEB00ECECEC00EBEBEB00E4E4
      E400EEEEEE00EFEFEF00F0F0F000F1F1F100F2F2F200F3F3F300F4F4F400F5F5
      F500F6F6F600F7F7F700F7F7F700F8F8F800F9F9F900FAFAFA00FBFBFB00FBFB
      FB00FCFCFC00FCFCFC00FDFDFD00FEFEFE00FEFEFE0000000000000000000000
      0000FBFBFB00EBEBEB00000000000000000000000000FBFBFB00D6D6D600E4E4
      E400DCDCDC00DDDDDD00E5E5E500E8E8E800E7E7E700EAEAEA00ECECEC00F1F1
      F100C4C4C400E1E1E100EEEEEE00ECECEC00ECECEC00C0C0C000C4C4C400DDDD
      DD00EFEFEF00EDEDED00EBEBEB009D9D9D00BCBCBC00F3F3F300E4E4E400C5C5
      C500BABABA00DDDDDD00EEEEEE00DBDBDB00E2E2E200C4C4C400FBFBFB000000
      000000000000FBFBFB00D6D6D600E4E4E400DCDCDC00DDDDDD00E5E5E500E8E8
      E800E7E7E700EAEAEA00ECECEC00F1F1F100C4C4C400E1E1E100EEEEEE00ECEC
      EC00ECECEC00C0C0C000C4C4C400DDDDDD00EFEFEF00EDEDED00EBEBEB009D9D
      9D00BCBCBC00F3F3F300E4E4E400C5C5C500BABABA00DDDDDD00EEEEEE00DBDB
      DB00E2E2E200C4C4C400FBFBFB000000000000000000FDFDFD00E7E7E700ECEC
      EC00EBEBEB00EDEDED00EDEDEE00E0E0EC00EFEFEF00F0F0F000F0F0F000F1F1
      F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F7F7F700F8F8
      F800F9F9F900FAFAFA00FAFAFA00FBFBFB00FCFCFC00FCFCFC00FDFDFD00FDFD
      FD00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FAFAFA00EBEBEB00000000000000
      000000000000FDFDFD00E7E7E700ECECEC00EBEBEB00EDEDED00EDEDED00E4E4
      E400EFEFEF00F0F0F000F0F0F000F1F1F100F2F2F200F3F3F300F4F4F400F5F5
      F500F6F6F600F7F7F700F7F7F700F8F8F800F9F9F900FAFAFA00FAFAFA00FBFB
      FB00FCFCFC00FCFCFC00FDFDFD00FDFDFD00FEFEFE00FEFEFE00FEFEFE00FDFD
      FD00FAFAFA00EBEBEB0000000000000000000000000000000000E5E5E500DDDD
      DD00D8D8D800D8D8D800D7D7D700D7D7D700D7D7D700DCDCDC00EBEBEB00F2F2
      F20078787800C5C5C500EFEFEF00EAEAEA00EEEEEE005F5F5F0048484800C7C7
      C700F0F0F000F0F0F000C7C7C7006767670074747400EEEEEE00E7E7E700DCDC
      DC00CECECE00B1B1B100E0E0E000FBFBFB00D5D5D500CECECE00000000000000
      00000000000000000000E5E5E500DDDDDD00D8D8D800D8D8D800D7D7D700D7D7
      D700D7D7D700DCDCDC00EBEBEB00F2F2F20078787800C5C5C500EFEFEF00EAEA
      EA00EEEEEE005F5F5F0048484800C7C7C700F0F0F000F0F0F000C7C7C7006767
      670074747400EEEEEE00E7E7E700DCDCDC00CECECE00B1B1B100E0E0E000FBFB
      FB00D5D5D500CECECE00000000000000000000000000FDFDFD00E7E7E700EDED
      ED00F2F2F200EFEFEF00EDEDEE00DDDDE900EBEBEA00EBEBEB00ECECEC00EDED
      ED00EEEEEE00EEEEEE00EFEFEF00F0F0F000F1F1F100F2F2F200F3F3F300F3F3
      F300F4F4F400F5F5F500F5F5F500F6F6F600F6F6F600F7F7F700F8F8F800F8F8
      F800F9F9F900F8F8F800F7F7F700F8F8F800F4F4F400E9E9E900000000000000
      000000000000FDFDFD00E7E7E700EDEDED00F2F2F200EFEFEF00EDEDED00E1E1
      E100EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EEEEEE00EFEFEF00F0F0
      F000F1F1F100F2F2F200F3F3F300F3F3F300F4F4F400F5F5F500F5F5F500F6F6
      F600F6F6F600F7F7F700F8F8F800F8F8F800F9F9F900F8F8F800F7F7F700F8F8
      F800F4F4F400E9E9E90000000000000000000000000000000000E8E8E800DDDD
      DD00D7D7D700D7D7D700D7D7D700D6D6D600D6D6D600DBDBDB00EFEFEF00E3E3
      E3007B7B7B00AFAFAF00F2F2F200EBEBEB00ECECEC00AFAFAF00B3B3B300DADA
      DA00F0F0F000EFEFEF00D6D6D600B1B1B100AEAEAE00ECECEC00E9E9E900E4E4
      E400EDEDED00D1D1D100B4B4B400F0F0F000DEDEDE00CCCCCC00000000000000
      00000000000000000000E8E8E800DDDDDD00D7D7D700D7D7D700D7D7D700D6D6
      D600D6D6D600DBDBDB00EFEFEF00E3E3E3007B7B7B00AFAFAF00F2F2F200EBEB
      EB00ECECEC00AFAFAF00B3B3B300DADADA00F0F0F000EFEFEF00D6D6D600B1B1
      B100AEAEAE00ECECEC00E9E9E900E4E4E400EDEDED00D1D1D100B4B4B400F0F0
      F000DEDEDE00CCCCCC00000000000000000000000000FDFDFD00E8E8E800EEEE
      EE00C1C1C100E4E4E400F1F1F200DEDEEA00EDEDEC00EDEDED00EEEEEE00EFEF
      EF00F0F0F000F1F1F100F2F2F200F2F2F200F5F5F400F5F4F300F5F5F500F6F6
      F600F6F6F600F7F7F700F7F7F700F8F8F800F9F9F900F9F9F900F9F9F900FAFA
      FA00FAFAFA00F9F9F900F9F9F900F8F8F800F5F5F500E9E9E900000000000000
      000000000000FDFDFD00E8E8E800EEEEEE00C1C1C100E4E4E400F1F1F100E2E2
      E200ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1F100F2F2F200F2F2
      F200F4F4F400F4F4F400F5F5F500F6F6F600F6F6F600F7F7F700F7F7F700F8F8
      F800F9F9F900F9F9F900F9F9F900FAFAFA00FAFAFA00F9F9F900F9F9F900F8F8
      F800F5F5F500E9E9E90000000000000000000000000000000000E9E9E900DCDC
      DC00D3D3D300D4D4D400D3D3D300D2D2D200D2D2D200D9D9D900EFEFEF00EDED
      ED00F7F7F700F2F2F200ECECEC00F1F1F100F5F5F500EFEFEF00E8E8E800E6E6
      E600F0F0F000F4F4F400EFEFEF00F4F4F400F4F4F400EDEDED00EBEBEB00E8E8
      E80000000000EFEFEF00D2D2D200C7C7C700E6E6E600CACACA00000000000000
      00000000000000000000E9E9E900DCDCDC00D3D3D300D4D4D400D3D3D300D2D2
      D200D2D2D200D9D9D900EFEFEF00EDEDED00F7F7F700F2F2F200ECECEC00F1F1
      F100F5F5F500EFEFEF00E8E8E800E6E6E600F0F0F000F4F4F400EFEFEF00F4F4
      F400F4F4F400EDEDED00EBEBEB00E8E8E80000000000EFEFEF00D2D2D200C7C7
      C700E6E6E600CACACA00000000000000000000000000FDFDFD00E8E8E800EEEE
      EE00C9C9C900E6E6E600F2F2F300DFDFEB00EEEEED00EEEEEE00EFEFEF00F0F0
      F000F1F1F100F2F2F200F2F2F200F9F9F900A5A9AB00C7C9CB00F1EFEE00F7F7
      F700F7F7F700F7F7F700F8F8F800F9F9F900F9F9F900FAFAFA00FAFAFA00FAFA
      FA00F9F9F900F9F9F900F8F8F800F8F8F800F4F4F400E9E9E900000000000000
      000000000000FDFDFD00E8E8E800EEEEEE00C9C9C900E6E6E600F2F2F200E3E3
      E300EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1F100F2F2F200F2F2F200F9F9
      F900A8A8A800C9C9C900EFEFEF00F7F7F700F7F7F700F7F7F700F8F8F800F9F9
      F900F9F9F900FAFAFA00FAFAFA00FAFAFA00F9F9F900F9F9F900F8F8F800F8F8
      F800F4F4F400E9E9E90000000000000000000000000000000000EAEAEA00E3E3
      E300D8D8D800D9D9D900D8D8D800D8D8D800D7D7D700E1E1E100F2F2F200F0F0
      F000F0F0F000F0F0F000F5F5F500E5E5E500909090006B6B6B00656565006868
      68007B7B7B00C6C6C600F6F6F600F0F0F000F0F0F000F0F0F000EEEEEE00E9E9
      E900FEFEFE00FCFCFC00F1F1F100D1D1D100D4D4D400CACACA00000000000000
      00000000000000000000EAEAEA00E3E3E300D8D8D800D9D9D900D8D8D800D8D8
      D800D7D7D700E1E1E100F2F2F200F0F0F000F0F0F000F0F0F000F5F5F500E5E5
      E500909090006B6B6B0065656500686868007B7B7B00C6C6C600F6F6F600F0F0
      F000F0F0F000F0F0F000EEEEEE00E9E9E900FEFEFE00FCFCFC00F1F1F100D1D1
      D100D4D4D400CACACA00000000000000000000000000FDFDFD00E7E7E700EFEF
      EF00F4F4F400F1F1F100F0F0F100DFDFEB00EEEEEE00EFEFEF00F0F0F000F1F1
      F100F2F2F200F2F2F200F2F3F300FAF7F600C1D1DA00ADD0E600BDC7CD00EAE5
      E300F7F7F700F8F8F800F8F8F800F9F9F900F9F9F900FAFAFA00FAFAFA00F9F9
      F900F9F9F900F8F8F800F8F8F800F7F7F700F3F3F300E9E9E900000000000000
      000000000000FDFDFD00E7E7E700EFEFEF00F4F4F400F1F1F100F0F0F000E3E3
      E300EEEEEE00EFEFEF00F0F0F000F1F1F100F2F2F200F2F2F200F2F2F200F7F7
      F700CECECE00CBCBCB00C5C5C500E6E6E600F7F7F700F8F8F800F8F8F800F9F9
      F900F9F9F900FAFAFA00FAFAFA00F9F9F900F9F9F900F8F8F800F8F8F800F7F7
      F700F3F3F300E9E9E90000000000000000000000000000000000E9E9E900F2F2
      F200F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F3F3F300F2F2F200F2F2
      F200F2F2F200F3F3F300F4F4F400777777004949490054545400555555005454
      54005050500050505000D0D0D000F9F9F900F2F2F200F2F2F200F2F2F200F1F1
      F100F1F1F100F1F1F100F1F1F100E9E9E900CBCBCB00C4C4C400000000000000
      00000000000000000000E9E9E900F2F2F200F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F3F3F300F2F2F200F2F2F200F2F2F200F3F3F300F4F4F4007777
      7700494949005454540055555500545454005050500050505000D0D0D000F9F9
      F900F2F2F200F2F2F200F2F2F200F1F1F100F1F1F100F1F1F100F1F1F100E9E9
      E900CBCBCB00C4C4C400000000000000000000000000FDFDFD00E7E7E700F0F0
      F000F6F6F600F3F3F300F1F1F200E0E0EC00EFEFEE00EFEFEF00F0F0F000F1F1
      F100F2F2F200F3F3F300F3F3F300FBF8F600CCDDE70095C9E800B3D7EE00A7BB
      C500E8E5E400F8F8F800F8F8F800F8F8F800F9F9F900F9F9F900F8F8F800F8F8
      F800F7F7F700F7F7F700F6F6F600F6F6F600F2F2F200E9E9E900000000000000
      000000000000FDFDFD00E7E7E700F0F0F000F6F6F600F3F3F300F1F1F100E4E4
      E400EEEEEE00EFEFEF00F0F0F000F1F1F100F2F2F200F3F3F300F3F3F300F8F8
      F800DADADA00C2C2C200D2D2D200B7B7B700E5E5E500F8F8F800F8F8F800F8F8
      F800F9F9F900F9F9F900F8F8F800F8F8F800F7F7F700F7F7F700F6F6F600F6F6
      F600F2F2F200E9E9E90000000000000000000000000000000000EAEAEA00F3F3
      F300F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400FBFBFB00D5D5D5004A4A4A004D4D4D004F4F4F00CDCDCD007474
      7400494949004242420097979700FEFEFE00F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F400F6F6F600DFDFDF00C6C6C600000000000000
      00000000000000000000EAEAEA00F3F3F300F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400FBFBFB00D5D5D5004A4A
      4A004D4D4D004F4F4F00CDCDCD0074747400494949004242420097979700FEFE
      FE00F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F6F6
      F600DFDFDF00C6C6C600000000000000000000000000FDFDFD00E8E8E800F1F1
      F100CECECE00EAEAEA00F4F4F500E1E1ED00F1F1F000F1F1F100F2F2F200F3F3
      F300F4F4F400F4F4F400F5F5F500FCFAF800D7E1E700488FB80086C9EE005DCD
      F100B2D0D700F7F0EF00FBFBFB00FAFAFA00FAFAFA00F9F9F900F9F9F900F8F8
      F800F8F8F800F7F7F700F6F6F600F6F6F600F3F3F300E9E9E900000000000000
      000000000000FDFDFD00E8E8E800F1F1F100CECECE00EAEAEA00F4F4F400E5E5
      E500F0F0F000F1F1F100F2F2F200F3F3F300F4F4F400F4F4F400F5F5F500FAFA
      FA00DFDFDF0085858500BFBFBF00B3B3B300C8C8C800F2F2F200FBFBFB00FAFA
      FA00FAFAFA00F9F9F900F9F9F900F8F8F800F8F8F800F7F7F700F6F6F600F6F6
      F600F3F3F300E9E9E90000000000000000000000000000000000EBEBEB00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F70000000000C5C5C5003F3F3F00444444004E4E4E00F6F6F6008080
      80003D3D3D003C3C3C008484840000000000F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F6F6F600D3D3D300000000000000
      00000000000000000000EBEBEB00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F70000000000C5C5C5003F3F
      3F00444444004E4E4E00F6F6F600808080003D3D3D003C3C3C00848484000000
      0000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F6F6F600D3D3D300000000000000000000000000FDFDFD00E9E9E900F2F2
      F200C3C3C300E7E7E700F6F6F700E1E1ED00F1F1F100F2F2F200F2F2F200F3F3
      F300F4F4F400F5F5F500F6F6F600F9F8F700F1F2F2004693CD003BA5E60054CE
      FD0073D3EC00DFDCDA00FDFBFA00FAFAFA00F9F9F900F9F9F900F8F8F800F8F8
      F800F7F7F700F6F6F600F6F6F600F6F6F600F2F2F200E9E9E900000000000000
      000000000000FDFDFD00E9E9E900F2F2F200C3C3C300E7E7E700F6F6F600E5E5
      E500F1F1F100F2F2F200F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F8F8
      F800F1F1F1008C8C8C0097979700B5B5B500BBBBBB00DCDCDC00FBFBFB00FAFA
      FA00F9F9F900F9F9F900F8F8F800F8F8F800F7F7F700F6F6F600F6F6F600F6F6
      F600F2F2F200E9E9E90000000000000000000000000000000000ECECEC00F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F90000000000C4C4C400383838003D3D3D004A4A4A00F5F5F5007D7D
      7D0037373700353535008181810000000000F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8F800D4D4D400000000000000
      00000000000000000000ECECEC00F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F90000000000C4C4C4003838
      38003D3D3D004A4A4A00F5F5F5007D7D7D003737370035353500818181000000
      0000F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900F8F8F800D4D4D400000000000000000000000000FDFDFD00E8E8E800F3F3
      F300F7F7F700F5F5F500F3F3F400E2E2EE00F2F2F200F2F2F200F3F3F300F4F4
      F400F4F4F400F5F5F500F6F6F600F5F6F700FFFEF900A4C9E8003295DE0052BC
      F40058D6FE009FCFDA00F5ECE900F9FAFB00F9F9F900F8F8F800F8F8F800F7F7
      F700F6F6F600F6F6F600F5F5F500F5F5F500F1F1F100E9E9E900000000000000
      000000000000FDFDFD00E8E8E800F3F3F300F7F7F700F5F5F500F3F3F300E6E6
      E600F2F2F200F2F2F200F3F3F300F4F4F400F4F4F400F5F5F500F6F6F600F6F6
      F600FCFCFC00C7C7C7008C8C8C00ABABAB00B9B9B900C2C2C200EEEEEE00FAFA
      FA00F9F9F900F8F8F800F8F8F800F7F7F700F6F6F600F6F6F600F5F5F500F5F5
      F500F1F1F100E9E9E90000000000000000000000000000000000ECECEC00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB0000000000CACACA00323232003838380040404000F2F2F2007373
      7300313131002E2E2E008282820000000000FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FAFAFA00D5D5D500000000000000
      00000000000000000000ECECEC00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB0000000000CACACA003232
      32003838380040404000F2F2F20073737300313131002E2E2E00828282000000
      0000FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FAFAFA00D5D5D500000000000000000000000000FDFDFD00E8E8E800F4F4
      F400F8F8F800F6F6F600F4F4F500E3E3EF00F3F3F200F3F3F300F4F4F400F5F5
      F500F5F5F500F6F6F600F7F7F700F7F7F700FBFAF900F8F7F60057A0DB003DA4
      E80055C9FB0068D6F400D0D6D700F9F6F600F8F8F800F8F8F800F7F7F700F6F6
      F600F6F6F600F5F5F500F4F4F400F4F4F400F1F1F100E9E9E900000000000000
      000000000000FDFDFD00E8E8E800F4F4F400F8F8F800F6F6F600F4F4F400E7E7
      E700F2F2F200F3F3F300F4F4F400F5F5F500F5F5F500F6F6F600F7F7F700F7F7
      F700FAFAFA00F7F7F7009B9B9B0098989800B3B3B300BBBBBB00D4D4D400F7F7
      F700F8F8F800F8F8F800F7F7F700F6F6F600F6F6F600F5F5F500F4F4F400F4F4
      F400F1F1F100E9E9E90000000000000000000000000000000000EDEDED00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD0000000000E8E8E800383838003232320035353500686868004141
      41003434340024242400ABABAB0000000000FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FCFCFC00D6D6D600000000000000
      00000000000000000000EDEDED00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD0000000000E8E8E8003838
      3800323232003535350068686800414141003434340024242400ABABAB000000
      0000FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FCFCFC00D6D6D600000000000000000000000000FCFCFC00E9E9E900F5F5
      F500DCDCDC00F0F0F000F7F7F800E3E3EF00F4F4F300F4F4F400F5F5F500F5F5
      F500F6F6F600F7F7F700F7F7F700F8F8F800F8F8F900FFFFFB00BCD6EB003090
      DB004EB7F10056D3FF0090D1E100EFE5E200F9F9FA00F7F7F700F7F7F700F6F6
      F600F5F5F500F5F5F500F4F4F400F3F3F300F0F0F000E9E9E900000000000000
      000000000000FCFCFC00E9E9E900F5F5F500DCDCDC00F0F0F000F7F7F700E7E7
      E700F3F3F300F4F4F400F5F5F500F5F5F500F6F6F600F7F7F700F7F7F700F8F8
      F800F8F8F800FDFDFD00D4D4D40089898900A7A7A700B8B8B800C0C0C000E7E7
      E700F9F9F900F7F7F700F7F7F700F6F6F600F5F5F500F5F5F500F4F4F400F3F3
      F300F0F0F000E9E9E90000000000000000000000000000000000EDEDED00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0000000000A3A3A30028282800303030001D1D1D002B2B
      2B0028282800757575000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFDFD00D6D6D600000000000000
      00000000000000000000EDEDED00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE0000000000A3A3
      A30028282800303030001D1D1D002B2B2B002828280075757500000000000000
      0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FDFDFD00D6D6D600000000000000000000000000FCFCFC00E9E9E900F6F6
      F600BDBDBD00E9E9E900F9F9FA00E4E4F000F5F5F400F5F5F500F5F5F500F6F6
      F600F7F7F700F7F7F700F8F8F800F8F8F800F9F9F900F9F9F900FFFDFA006EAB
      DF00379DE40055C5F80060D6F900BFD0D400F7F2F100F7F7F700F6F6F600F5F5
      F500F5F5F500F4F4F400F3F3F300F2F2F200EFEFEF00E9E9E900000000000000
      000000000000FCFCFC00E9E9E900F6F6F600BDBDBD00E9E9E900F9F9F900E8E8
      E800F4F4F400F5F5F500F5F5F500F6F6F600F7F7F700F7F7F700F8F8F800F8F8
      F800F9F9F900F9F9F900FCFCFC00A8A8A80092929200B0B0B000BABABA00CBCB
      CB00F3F3F300F7F7F700F6F6F600F5F5F500F5F5F500F4F4F400F3F3F300F2F2
      F200EFEFEF00E9E9E90000000000000000000000000000000000EEEEEE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006F6F6F002222220028282800616161003838
      38002424240045454500E4E4E400000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00D7D7D700000000000000
      00000000000000000000EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006F6F
      6F00222222002828280061616100383838002424240045454500E4E4E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00D7D7D700000000000000000000000000FCFCFC00E8E8E800F7F7
      F700FAFAFA00F8F8F800F7F7F800E4E4F000F5F5F400F5F5F500F5F5F500F6F6
      F600F7F7F700F7F7F700F8F8F800F8F8F800F9F9F900F8F9F900FFFDFA00D8E5
      F0003C95DB0049B0ED0057D1FF007CD2E800E2DBD900F6F6F600F5F5F500F4F4
      F400F3F3F300F2F2F200F1F1F100F1F1F100EEEEEE00E9E9E900000000000000
      000000000000FCFCFC00E8E8E800F7F7F700FAFAFA00F8F8F800F7F7F700E8E8
      E800F4F4F400F5F5F500F5F5F500F6F6F600F7F7F700F7F7F700F8F8F800F8F8
      F800F9F9F900F8F8F800FCFCFC00E4E4E4008E8E8E00A2A2A200B7B7B700BCBC
      BC00DCDCDC00F6F6F600F5F5F500F4F4F400F3F3F300F2F2F200F1F1F100F1F1
      F100EEEEEE00E9E9E90000000000000000000000000000000000EEEEEE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEDEDE00222222002323230027272700E6E6E6005D5D
      5D001E1E1E001212120090909000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00D7D7D700000000000000
      00000000000000000000EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE002222
      22002323230027272700E6E6E6005D5D5D001E1E1E0012121200909090000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00D7D7D700000000000000000000000000FCFCFC00E9E9E900F7F7
      F700FAFAFA00F9F9F900F8F8F900E5E5F100F6F6F500F6F6F600F7F7F700F7F7
      F700F8F8F800F8F8F800F9F9F900F9F9F900FAFAFA00FAFAFA00F8F8F900FFFF
      FB008CBAE1003296E00053BFF5005AD7FD00ACCED600F2EBE900F4F5F500F4F4
      F400F3F3F300F2F2F200F1F1F100F0F0F000EEEEEE00E9E9E900000000000000
      000000000000FCFCFC00E9E9E900F7F7F700FAFAFA00F9F9F900F8F8F800E9E9
      E900F5F5F500F6F6F600F7F7F700F7F7F700F8F8F800F8F8F800F9F9F900F9F9
      F900FAFAFA00FAFAFA00F8F8F800FDFDFD00B7B7B7008D8D8D00ADADAD00BABA
      BA00C5C5C500ECECEC00F4F4F400F4F4F400F3F3F300F2F2F200F1F1F100F0F0
      F000EEEEEE00E9E9E90000000000000000000000000000000000EEEEEE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D1D1D1001D1D1D002020200024242400EAEAEA005E5E
      5E00191919001313130083838300000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00D7D7D700000000000000
      00000000000000000000EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1D1D1001D1D
      1D002020200024242400EAEAEA005E5E5E001919190013131300838383000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00D7D7D700000000000000000000000000FCFCFC00E9E9E900F8F8
      F800E8E8E800F5F5F500F9F9FA00E6E6F200F7F7F600F7F7F700F7F7F700F8F8
      F800F9F9F900F9F9F900FAFAFA00FAFAFA00FAFAFA00F9F9F900F9F9F900FCFB
      F900EDF0F4004898D90040A8EA0056CDFC006FD3EE00D7D7D600F4F3F300F4F3
      F300F2F2F200F2F2F200F1F1F100F0F0F000EDEDED00E9E9E900000000000000
      000000000000FCFCFC00E9E9E900F8F8F800E8E8E800F5F5F500F9F9F900EAEA
      EA00F6F6F600F7F7F700F7F7F700F8F8F800F9F9F900F9F9F900FAFAFA00FAFA
      FA00FAFAFA00F9F9F900F9F9F900FAFAFA00F0F0F000939393009B9B9B00B5B5
      B500BABABA00D6D6D600F3F3F300F3F3F300F2F2F200F2F2F200F1F1F100F0F0
      F000EDEDED00E9E9E90000000000000000000000000000000000EEEEEE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E6E6E6001C1C1C0017171700191919009A9A9A003C3C
      3C001717170008080800A1A1A100000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00D7D7D700000000000000
      00000000000000000000EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E6E6E6001C1C
      1C0017171700191919009A9A9A003C3C3C001717170008080800A1A1A1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00D7D7D700000000000000000000000000FCFCFC00EAEAEA00F9F9
      F900BABABA00EAEAEA00FDFDFE00E6E6F100F7F7F700F7F7F700F8F8F800F8F8
      F800F9F9F900F9F9F900FAFAFA00FAFAFA00F9F9F900F9F9F900F8F8F800F6F7
      F700FFFEF900AACBE7003092DD0051BBF30057D6FF0099CDD800ECE3E100F3F3
      F300F1F1F100F0F0F000EFEFEF00EFEFEF00ECECEC00E9E9E900000000000000
      000000000000FCFCFC00EAEAEA00F9F9F900BABABA00EAEAEA00FDFDFD00E9E9
      E900F7F7F700F7F7F700F8F8F800F8F8F800F9F9F900F9F9F900FAFAFA00FAFA
      FA00F9F9F900F9F9F900F8F8F800F6F6F600FCFCFC00C9C9C9008A8A8A00AAAA
      AA00B9B9B900BFBFBF00E5E5E500F3F3F300F1F1F100F0F0F000EFEFEF00EFEF
      EF00ECECEC00E9E9E90000000000000000000000000000000000EEEEEE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006C6C6C000000000003030300010101000404
      04000000000023232300ECECEC00000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00D7D7D700000000000000
      00000000000000000000EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6C
      6C00000000000303030001010100040404000000000023232300ECECEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00D7D7D700000000000000000000000000FCFCFC00E9E9E900FAFA
      FA00F9F9F900FAFAFA00FAFAFB00E6E6F200F8F8F700F8F8F800F8F8F800F9F9
      F900F9F9F900FAFAFA00F9F9F900F9F9F900F9F9F900F8F8F800F7F7F700F7F7
      F700F8F7F700F9F6F4005DA2DB003BA2E60055C8FA0065D6F500C5CFD000F2EE
      ED00F0F0F100EFEFEF00EEEEEE00EDEDED00EBEBEB00E9E9E900000000000000
      000000000000FCFCFC00E9E9E900FAFAFA00F9F9F900FAFAFA00FAFAFA00EAEA
      EA00F7F7F700F8F8F800F8F8F800F9F9F900F9F9F900FAFAFA00F9F9F900F9F9
      F900F9F9F900F8F8F800F7F7F700F7F7F700F7F7F700F6F6F6009E9E9E009696
      9600B2B2B200BABABA00CCCCCC00EFEFEF00F0F0F000EFEFEF00EEEEEE00EDED
      ED00EBEBEB00E9E9E90000000000000000000000000000000000EEEEEE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFB009898980047474700393939003E3E
      3E006B6B6B00DDDDDD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00D7D7D700000000000000
      00000000000000000000EEEEEE00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FB009898980047474700393939003E3E3E006B6B6B00DDDDDD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00D7D7D700000000000000000000000000FCFCFC00E9E9E900FBFB
      FB00FCFCFC00FBFBFB00FAFAFB00E7E7F300F9F9F800F8F8F800F9F9F900F9F9
      F900FAFAFA00FAFAFA00F9F9F900F9F9F900F8F8F800F8F8F800F7F7F700F6F6
      F600F5F5F600FFFBF700C3D7E9003391DB004CB5F00057D3FF0087CFE100E2DB
      D900F0F0F000EFEFEF00EEEEEE00EDEDED00EBEBEB00E9E9E900000000000000
      000000000000FCFCFC00E9E9E900FBFBFB00FCFCFC00FBFBFB00FAFAFA00EBEB
      EB00F8F8F800F8F8F800F9F9F900F9F9F900FAFAFA00FAFAFA00F9F9F900F9F9
      F900F8F8F800F8F8F800F7F7F700F6F6F600F5F5F500FBFBFB00D6D6D6008A8A
      8A00A5A5A500B8B8B800BDBDBD00DCDCDC00F0F0F000EFEFEF00EEEEEE00EDED
      ED00EBEBEB00E9E9E90000000000000000000000000000000000EEEEEE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00D7D7D700000000000000
      00000000000000000000EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00D7D7D700000000000000000000000000FCFCFC00EAEAEA00FCFC
      FC00F3F3F300FAFAFA00FCFCFD00E7E7F300F9F9F800F9F9F900F9F9F900FAFA
      FA00FAFAFA00F9F9F900F9F9F900F8F8F800F8F8F800F7F7F700F7F7F700F6F6
      F600F5F5F500F4F5F500FFFAF50077AFDE00349AE3004EC4FB005DD5FA00BCCA
      CD00EBE7E700EEEFEF00EDEDED00ECECEC00EAEAEA00E9E9E900000000000000
      000000000000FCFCFC00EAEAEA00FCFCFC00F3F3F300FAFAFA00FCFCFC00EBEB
      EB00F8F8F800F9F9F900F9F9F900FAFAFA00FAFAFA00F9F9F900F9F9F900F8F8
      F800F8F8F800F7F7F700F7F7F700F6F6F600F5F5F500F4F4F400FAFAFA00ACAC
      AC0090909000AFAFAF00B9B9B900C6C6C600E8E8E800EEEEEE00EDEDED00ECEC
      EC00EAEAEA00E9E9E90000000000000000000000000000000000EEEEEE000000
      00000000000000000000E9E9E900ECECEC00000000000000000000000000FCFC
      FC00EDEDED00F8F8F800000000000000000000000000F9F9F900F3F3F3000000
      0000000000000000000000000000EAEAEA00F4F4F40000000000000000000000
      0000FBFBFB00F2F2F200FCFCFC0000000000FEFEFE00D7D7D700000000000000
      00000000000000000000EEEEEE00000000000000000000000000E9E9E900ECEC
      EC00000000000000000000000000FCFCFC00EDEDED00F8F8F800000000000000
      000000000000F9F9F900F3F3F30000000000000000000000000000000000EAEA
      EA00F4F4F400000000000000000000000000FBFBFB00F2F2F200FCFCFC000000
      0000FEFEFE00D7D7D700000000000000000000000000FCFCFC00EBEBEB00FCFC
      FC00BABABA00ECECEC0000000000E8E8F300FAFAF900F9F9F900FAFAFA00FAFA
      FA00F9F9F900F9F9F900F8F8F800F8F8F800F7F7F700F6F6F600F6F6F600F5F5
      F500F5F5F500F3F3F400F9F6F400DCE4EC003A94DB005FB0DF00D2EAF300EBE8
      E200D5D4D100ECEDED00ECECEC00EBEBEB00E9E9E900E9E9E900000000000000
      000000000000FCFCFC00EBEBEB00FCFCFC00BABABA00ECECEC0000000000EBEB
      EB00F9F9F900F9F9F900FAFAFA00FAFAFA00F9F9F900F9F9F900F8F8F800F8F8
      F800F7F7F700F6F6F600F6F6F600F5F5F500F5F5F500F3F3F300F6F6F600E4E4
      E4008D8D8D00A4A4A400E5E5E500E7E7E700D3D3D300ECECEC00ECECEC00EBEB
      EB00E9E9E900E9E9E90000000000000000000000000000000000EEEEEE000000
      0000000000000000000084848400989898000000000000000000000000000000
      00008B8B8B00EAEAEA00000000000000000000000000C7C7C700909090000000
      0000000000000000000000000000A6A6A600DFDFDF0000000000000000000000
      0000E7E7E70093939300EFEFEF0000000000FEFEFE00D7D7D700000000000000
      00000000000000000000EEEEEE00000000000000000000000000848484009898
      9800000000000000000000000000000000008B8B8B00EAEAEA00000000000000
      000000000000C7C7C7009090900000000000000000000000000000000000A6A6
      A600DFDFDF00000000000000000000000000E7E7E70093939300EFEFEF000000
      0000FEFEFE00D7D7D700000000000000000000000000FCFCFC00EAEAEA00FDFD
      FD00F6F6F600FCFCFC00FCFCFD00E8E8F400FAFAF900FAFAFA00FAFAFA00F9F9
      F900F9F9F900F8F8F800F8F8F800F7F7F700F6F6F600F6F6F600F5F5F500F4F4
      F400F4F4F400F3F3F300F1F1F200F9F7F600A8B7C400A9A5A100ECE3D600DBE3
      F700BAC3D900E9E8E500ECECEC00EAEAEA00E8E8E800E9E9E900000000000000
      000000000000FCFCFC00EAEAEA00FDFDFD00F6F6F600FCFCFC00FCFCFC00ECEC
      EC00F9F9F900FAFAFA00FAFAFA00F9F9F900F9F9F900F8F8F800F8F8F800F7F7
      F700F6F6F600F6F6F600F5F5F500F4F4F400F4F4F400F3F3F300F1F1F100F7F7
      F700B6B6B600A5A5A500E1E1E100E7E7E700C7C7C700E7E7E700ECECEC00EAEA
      EA00E8E8E800E9E9E90000000000000000000000000000000000EEEFEF000000
      00000000000000000000E8E9EE00ECEDF0000000000000000000000000000000
      0000EBEDF000FDFDFE00000000000000000000000000F0F1F400E4E7EC000000
      0000000000000000000000000000EAEEF200F5F6F80000000000000000000000
      0000FBFCFD00F1F4F700FCFDFD0000000000FEFEFE00D6D9DA00000000000000
      00000000000000000000EEEEEE00000000000000000000000000EAEAEA00EDED
      ED0000000000000000000000000000000000EDEDED00FDFDFD00000000000000
      000000000000F1F1F100E7E7E70000000000000000000000000000000000EEEE
      EE00F6F6F600000000000000000000000000FCFCFC00F4F4F400FCFCFC000000
      0000FEFEFE00D8D8D800000000000000000000000000FCFCFC00EAEAEA00FDFD
      FD00FEFEFE00FEFEFE00FDFDFE00E8E8F500FBFBFA00FAFAFA00F9F9F900F9F9
      F900F8F8F800F8F8F800F7F7F700F7F7F700F6F6F600F5F5F500F5F5F500F4F4
      F400F3F3F300F2F2F200F1F1F100F3F3F300F0EBE5008E929F005D78C4004C79
      EB0094AEEC00ECEAE400EBEBEB00E9E9E900E8E8E800E9E9E900000000000000
      000000000000FCFCFC00EAEAEA00FDFDFD00FEFEFE00FEFEFE00FDFDFD00ECEC
      EC00FAFAFA00FAFAFA00F9F9F900F9F9F900F8F8F800F8F8F800F7F7F700F7F7
      F700F6F6F600F5F5F500F5F5F500F4F4F400F3F3F300F2F2F200F1F1F100F3F3
      F300EAEAEA00959595008888880090909000BABABA00E8E8E800EBEBEB00E9E9
      E900E8E8E800E9E9E90000000000000000000000000000000000E5D9C200E8D3
      9C00E8D5A200E8D5A200EDD8A600ECD7A500E8D2A100E7D1A000E7D0A000E6CE
      9E00E8CC9700E5C99700E6CB9F00E5C99C00E3C39200E7C79800EACCA200E3C3
      9A00E1BD8F00E3BF9400E3C19B00E7C39C00E4BC9300E2BD9900E2BC9800E1BB
      9800E2BB9900E4BC9A00E1B99800E0B79700DEB39100D0B39D00000000000000
      00000000000000000000D5D5D500C7C7C700CACACA00CACACA00CECECE00CDCD
      CD00C9C9C900C8C8C800C7C7C700C6C6C600C3C3C300C1C1C100C5C5C500C3C3
      C300BDBDBD00C2C2C200C8C8C800C0C0C000B9B9B900BCBCBC00BFBFBF00C2C2
      C200BBBBBB00BDBDBD00BCBCBC00BCBCBC00BCBCBC00BEBEBE00BBBBBB00BABA
      BA00B6B6B600B5B5B500000000000000000000000000FCFCFC00EAEAEA00FEFE
      FE00FBFBFB00FEFEFE00FDFDFE00E9E9F500FAFAFA00F9F9F900F9F9F900F8F8
      F800F7F7F700F7F7F700F6F6F600F5F5F500F5F5F500F4F4F400F4F4F400F3F3
      F300F2F2F200F1F1F100F0F0F000EEEEEF00FCFAF2009FAFDE00073AC9003A66
      DB00BCC9E900EFEDE900E9E9E900E8E8E800E7E7E700E9E9E900000000000000
      000000000000FCFCFC00EAEAEA00FEFEFE00FBFBFB00FEFEFE00FDFDFD00EDED
      ED00FAFAFA00F9F9F900F9F9F900F8F8F800F7F7F700F7F7F700F6F6F600F5F5
      F500F5F5F500F4F4F400F4F4F400F3F3F300F2F2F200F1F1F100F0F0F000EEEE
      EE00F8F8F800B9B9B900585858007E7E7E00CFCFCF00ECECEC00E9E9E900E8E8
      E800E7E7E700E9E9E90000000000000000000000000000000000E4CE9100EACA
      3A00EACB4500EAC84500E9C64400E8C34300E7C14200E6BE4000E5BA3D00E5BA
      4700E0C78800DABA7000DFAA3600E2AC3E00DFBF8400D2A85F00DD9B2E00DE9D
      3A00DCB78100CF9D5900D98C2700DC953E00D29F6400D4822700D7832A00D580
      2900D57C2800D47A2700D4772600D3752500D16D1A00D5915C00000000000000
      00000000000000000000C1C1C100A4A4A400A8A8A800A7A7A700A6A6A600A4A4
      A400A3A3A300A1A1A1009E9E9E00A2A2A200BABABA00ACACAC00959595009999
      9900B6B6B6009D9D9D008C8C8C0091919100B1B1B10097979700848484008F8F
      8F009C9C9C007F7F7F00818181007F7F7F007D7D7D007C7C7C007B7B7B007979
      79007272720096969600000000000000000000000000FCFCFC00EBEBEB00FEFE
      FE00BCBCBC00EEEEEE0000000000E8E8F400F9F9F800F8F8F800F8F8F800F7F7
      F700F6F6F600F6F6F600F5F5F500F5F5F500F4F4F400F3F3F300F3F3F300F2F2
      F200F1F1F100F0F0F000EFEFEF00EEEEEE00EDEDED00F2F1ED00C9D0E300CAD0
      E300EDECE800E9E9E900E8E8E800E7E7E700E5E5E500E9E9E900000000000000
      000000000000FCFCFC00EBEBEB00FEFEFE00BCBCBC00EEEEEE0000000000ECEC
      EC00F8F8F800F8F8F800F8F8F800F7F7F700F6F6F600F6F6F600F5F5F500F5F5
      F500F4F4F400F3F3F300F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00EEEE
      EE00EDEDED00F0F0F000D4D4D400D4D4D400EBEBEB00E9E9E900E8E8E800E7E7
      E700E5E5E500E9E9E90000000000000000000000000000000000E4D09500EACC
      4100EACD4C00EACA4C00E9C84B00E8C54A00E8C34900E7C04800E6BC4500E6BA
      4600F5ECD600D9BF8300E1AA3000E9C37400EDE8DD00E5D8C100D6962B00E8BA
      7100EEE7DE00E3D4BD00D48B2D00E19D4800EADDCE00D0863500DA873000D784
      3100D7813000D67F2F00D67C2E00D57A2D00D3722200D5936000000000000000
      00000000000000000000C3C3C300A7A7A700ABABAB00AAAAAA00A9A9A900A7A7
      A700A6A6A600A5A5A500A2A2A200A2A2A200E7E7E700B3B3B30093939300B5B5
      B500E6E6E600D4D4D40087878700B1B1B100E6E6E600D1D1D100848484009797
      9700DCDCDC008383830085858500848484008282820081818100808080007E7E
      7E007777770098989800000000000000000000000000FCFCFC00EAEAEA000000
      0000F0F0F000FCFCFC0000000000E8E8F300F9F9F800F8F8F800F7F7F700F6F6
      F600F6F6F600F5F5F500F5F5F500F4F4F400F3F3F300F2F2F200F2F2F200F1F1
      F100F0F0F000EFEFEF00EEEEEE00EDEDED00ECECEC00EBEBEB00F3F1EC00F1EF
      EB00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E9E9E900000000000000
      000000000000FCFCFC00EAEAEA0000000000F0F0F000FCFCFC0000000000EBEB
      EB00F8F8F800F8F8F800F7F7F700F6F6F600F6F6F600F5F5F500F5F5F500F4F4
      F400F3F3F300F2F2F200F2F2F200F1F1F100F0F0F000EFEFEF00EEEEEE00EDED
      ED00ECECEC00EBEBEB00F0F0F000EEEEEE00E9E9E900E8E8E800E7E7E700E6E6
      E600E5E5E500E9E9E90000000000000000000000000000000000E7D5AA00F1DC
      7B00F1DC8200F1DB8200F0D98100EFD78000EFD58000EFD37F00EED17E00ECCC
      7800E5D3A500E0D7C300E4BD6A00F1D7A200E6E1D500E5DCCB00E1B46A00EFD0
      9F00E6DFD500E4D9C900E0AE6E00E7B06E00EBDFD000D9AD7D00E6AB6D00E3AA
      6F00E3A76F00E2A66E00E2A46D00E2A26C00E19D6500DDAC8700FEFFFF000000
      00000000000000000000CCCCCC00C2C2C200C5C5C500C4C4C400C3C3C300C2C2
      C200C1C1C100C0C0C000BFBFBF00BABABA00C9C9C900D3D3D300AEAEAE00CECE
      CE00DEDEDE00D9D9D900AAAAAA00CACACA00DEDEDE00D7D7D700A9A9A900ACAC
      AC00DEDEDE00ABABAB00AAAAAA00A9A9A900A8A8A800A7A7A700A6A6A600A5A5
      A500A1A1A100B0B0B000FEFEFE000000000000000000FCFCFC00EAEAEA000000
      00000000000000000000FDFDFE00EAEAF600FCFCFB00FBFBFB00FAFAFA00F9F9
      F900F8F8F800F8F8F800F7F7F700F6F6F600F6F6F600F5F5F500F4F4F400F3F3
      F300F2F2F200F1F1F100F0F0F000F0F0F000EEEEEE00EEEEEE00ECECED00EBEB
      EC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7E700EAEAEA00000000000000
      000000000000FCFCFC00EAEAEA00000000000000000000000000FDFDFD00EEEE
      EE00FBFBFB00FBFBFB00FAFAFA00F9F9F900F8F8F800F8F8F800F7F7F700F6F6
      F600F6F6F600F5F5F500F4F4F400F3F3F300F2F2F200F1F1F100F0F0F000F0F0
      F000EEEEEE00EEEEEE00ECECEC00EBEBEB00EBEBEB00EAEAEA00E9E9E900E8E8
      E800E7E7E700EAEAEA0000000000000000000000000000000000E9DABC00F7E9
      AA00F6E9AE00F6E8AE00F6E7AE00F5E5AD00F5E4AD00F5E3AC00F4E1AA00F5E3
      B200E8E5DD00E8E2D500EFD7A300F5E1B700E9E6E100E8DFCE00EED09F00F2DA
      B500E9E6E100E7DCCC00EDCA9E00EBD1B100E9E5E000E4CAAD00EEC8A000EDC8
      A200EDC6A200ECC5A100ECC4A100ECC3A000ECC19D00E3C1A700FEFFFF000000
      00000000000000000000D5D5D500D8D8D800D9D9D900D9D9D900D9D9D900D7D7
      D700D7D7D700D6D6D600D5D5D500D8D8D800E3E3E300DFDFDF00CDCDCD00D9D9
      D900E5E5E500DCDCDC00C9C9C900D5D5D500E5E5E500DADADA00C7C7C700CFCF
      CF00E4E4E400C9C9C900C7C7C700C7C7C700C7C7C700C6C6C600C5C5C500C5C5
      C500C3C3C300C3C3C300FEFEFE000000000000000000FCFCFC00EAEAEA000000
      000000000000FEFEFE00FCFCFD00ECECF800FFFFFE00FDFDFD00FCFCFC00FCFC
      FC00FBFBFB00FAFAFA00F9F9F900F9F9F900F8F8F800F7F7F700F6F6F600F5F5
      F500F4F4F400F3F3F300F2F2F200F2F2F200F0F0F000EFEFEF00EFEFEF00EEEE
      EE00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900EBEBEB00000000000000
      000000000000FCFCFC00EAEAEA000000000000000000FEFEFE00FCFCFC00F0F0
      F000FEFEFE00FDFDFD00FCFCFC00FCFCFC00FBFBFB00FAFAFA00F9F9F900F9F9
      F900F8F8F800F7F7F700F6F6F600F5F5F500F4F4F400F3F3F300F2F2F200F2F2
      F200F0F0F000EFEFEF00EFEFEF00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEA
      EA00E9E9E900EBEBEB0000000000000000000000000000000000E7D6B400F4E4
      9C00F3E4A100F3E3A100F3E2A100F2E0A000F2DFA000F2DD9F00F1DB9F00F1D9
      9D00F1DBA300F0D7A000F0D59B00EFD39900F0D4A200EED09B00EECE9900EDCB
      9700EECE9F00ECC99900ECC69500ECC79A00ECC79D00EBC29500EAC09400EABF
      9300EABD9300E9BC9200E9BB9200E9B99100E9B68D00E0B99C00FEFFFF000000
      00000000000000000000D0D0D000D1D1D100D2D2D200D2D2D200D2D2D200D0D0
      D000D0D0D000CFCFCF00CECECE00CDCDCD00CFCFCF00CDCDCD00CACACA00C9C9
      C900CCCCCC00C8C8C800C7C7C700C5C5C500C9C9C900C4C4C400C2C2C200C4C4
      C400C5C5C500C0C0C000BFBFBF00BEBEBE00BEBEBE00BDBDBD00BCBCBC00BBBB
      BB00B9B9B900BCBCBC00FEFEFE000000000000000000FCFCFC00EAEAEA000000
      0000FEFEFE00FEFEFE00FCFCFD00EAEAF700FDFDFD00FCFCFC00FBFBFB00FAFA
      FA00FAFAFA00F9F9F900F8F8F800F7F7F700F6F6F600F5F5F500F4F4F400F3F3
      F300F2F2F200F2F2F200F1F1F100EFEFEF00EEEEEE00EDEDED00EDEDED00ECEC
      EC00EBEBEB00EAEAEA00E9E9E900E7E7E700E7E7E700EAEAEA00000000000000
      000000000000FCFCFC00EAEAEA0000000000FEFEFE00FEFEFE00FCFCFC00EEEE
      EE00FDFDFD00FCFCFC00FBFBFB00FAFAFA00FAFAFA00F9F9F900F8F8F800F7F7
      F700F6F6F600F5F5F500F4F4F400F3F3F300F2F2F200F2F2F200F1F1F100EFEF
      EF00EEEEEE00EDEDED00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E7E7
      E700E7E7E700EAEAEA0000000000000000000000000000000000F1E7DB00EADB
      C000EADDC400EADCC400EADCC400EADBC400EADBC400EADBC300EADAC300EADA
      C300EAD9C100EAD9C200E9D8C200E9D8C200E9D7C000E9D6C100E9D6C200E9D5
      C100E9D4BF00E8D4C000E8D4C100E8D3C000E8D2BF00E8D2C000E8D2C000E8D2
      C000E8D1C000E7D1C000E7D1C000E7D0BF00E6CEBC00EBDACE00000000000000
      00000000000000000000E6E6E600D7D7D700D9D9D900D8D8D800D8D8D800D8D8
      D800D8D8D800D8D8D800D7D7D700D7D7D700D6D6D600D7D7D700D6D6D600D6D6
      D600D5D5D500D5D5D500D5D5D500D5D5D500D4D4D400D4D4D400D4D4D400D3D3
      D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3D300D2D2D200D2D2D200D2D2
      D200D0D0D000DBDBDB00000000000000000000000000FDFDFD00EFEFEF00FEFE
      FE00FDFDFD00FCFCFC00FBFBFC00EDEDF700FCFCFB00FAFAFA00FAFAFA00F9F9
      F900F8F8F800F8F8F800F7F7F700F6F6F600F6F6F600F5F5F500F5F5F500F4F4
      F400F3F3F300F2F2F200F1F1F100F1F1F100F0F0F000EFEFEF00EEEEEE00EEEE
      EE00EDEDED00ECECEC00EBEBEB00EAEAEA00EBEBEB00F0F0F000000000000000
      000000000000FDFDFD00EFEFEF00FEFEFE00FDFDFD00FCFCFC00FBFBFB00F0F0
      F000FBFBFB00FAFAFA00FAFAFA00F9F9F900F8F8F800F8F8F800F7F7F700F6F6
      F600F6F6F600F5F5F500F5F5F500F4F4F400F3F3F300F2F2F200F1F1F100F1F1
      F100F0F0F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00EBEBEB00EAEA
      EA00EBEBEB00F0F0F00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FCFCFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FEFEFE00000000000000
      00000000000000000000FDFDFD00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFE00FEFE
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00DFE3E500E2E7E90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00E2E2E200E6E6E600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFE00FFFEFE00000000000000
      0000FEFDFC00F4EEE300EBE0CD00E3D6BC00F6F1E90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FEFEFE000000000000000000FDFDFD00ECECEC00DDDDDD00D1D1
      D100F0F0F0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEF0F200B2B6
      BA00A38E8200B8897200DDD8D500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0F0F000B6B6B6009191910091919100D8D8D8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE000000000000000000EDE5D400CEB6
      8900BB9A5C00B38F4B00B18D4800AC853C00C7AD7A0000000000FEFEFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE000000000000000000E2E2E200AFAFAF009090900084848400828282007979
      7900A4A4A40000000000FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFCFD00C9CFD3009D939000BE89
      6900EFA97400CA774A00AD725A00DCDAD8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00CECECE009595950090909000AEAEAE00838383007D7D7D00DADA
      DA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFEFE0000000000ECE3D200C2A46C00B28D4800B390
      4E00B2904F00AD894500A57E3300AB864000C5A9740000000000FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE000000
      0000E0E0E0009B9B9B008282820085858500858585007E7E7E00727272007B7B
      7B00A0A0A00000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E3E8EB00ABA9A900B0877000E39C6A00F1B3
      8200ECBB9300D49264008F482E00B77E6400D8D7D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7E7
      E700A9A9A9008D8D8D00A3A3A300B7B7B700BEBEBE0098989800575757008888
      8800D7D7D7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFD00D1BB9100B18B4500BA9B6000B8995D00AB87
      41009E74230096670F008F5E01009C701D00C5A9740000000000FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00B4B4
      B40080808000919191008F8F8F007B7B7B0067676700595959004F4F4F006363
      6300A0A0A00000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F4F8FA00C2C4C700AD918200D7946800F1AD7A00EAB58A00E7B4
      8C00E5AB7E00E69D6300934A290094523B00BE846900D5D6D500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700C4C4C4009595
      95009B9B9B00B2B2B200B8B8B800B7B7B700AFAFAF00A2A2A200575757006060
      60008E8E8E00D5D5D50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFAF700C2A46B00B7975700C2A87500B49354009F7624009262
      05008E5D00008E5D00008D5B00009C701B00C5A9740000000000FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F9009B9B9B008C8C
      8C009F9F9F008989890068686800535353004E4E4E004E4E4E004D4D4D006262
      6200A0A0A00000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEE2E500B09F9800C98D6A00EDA57200EDB38500E6B48B00E5AE8200E09D
      6800DD925600E5995D00C371410073352000AF674A00BD856B00D4D6D7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E1E1E100A2A2A20095959500ACAC
      AC00B7B7B700B7B7B700B1B1B100A1A1A100979797009E9E9E007C7C7C004242
      4200757575008F8F8F00D5D5D500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFBF900C1A36B00BFA26900C6AE7E00B2904D00986B1100905E00009160
      010091600100905F00008F5E00009F742000C4A8720000000000FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFB009A9A9A0098989800A6A6
      A600858585005C5C5C004F4F4F0050505000505050004F4F4F004F4F4F006666
      66009F9F9F0000000000FEFEFE00000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F4F4F500B3B1
      B100AE856F00E9A07100EFB28500E6B08600E5AE8300E2A16F00DE945900DE92
      5700E0955B00E3995D00DE8F56009041230084452C00C2745400BE886F00D4D6
      D700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F4F4F400B1B1B1008B8B8B00A8A8A800B7B7B700B4B4
      B400B2B2B200A6A6A60099999900979797009A9A9A009D9D9D00969696005151
      5100515151008383830091919100D5D5D5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9AE7B00C1A36B00CEB98D00B59451009564060092610000946303009260
      0000986B0F009F741F00A3792600A3772300C7AD790000000000FEFEFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A6A6A6009A9A9A00B1B1B1008888
      8800555555005151510053535300505050005B5B5B00666666006B6B6B006969
      6900A4A4A40000000000FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFFFF00D4D3D400A29692007B78
      78008F6E5800F5BC9300E5AE8500E2A07000DE935A00DD905500DF945A00E196
      5B00E1975C00E2985D00E89E6100B35C34008C4327009A573C00D1866700BE8C
      7400D6D8DA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00D3D3D300989898007979790071717100C1C1C100B2B2B200A6A6
      A6009999990096969600999999009B9B9B009C9C9C009D9D9D00A2A2A2006B6B
      6B0052525200646464009494940094949400D8D8D80000000000000000000000
      00000000000000000000000000000000000000000000FFFEFE0000000000DFD0
      B200BC9C5D00D7C5A000BEA16500986A0B00956503009666050097690800A77E
      2C00AA813200B6924E00CEB68900DDCDAE00F7F2EB0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00F3EEE300FEFDFC0000000000000000000000000000000000000000000000
      000000000000FEFEFE0000000000CBCBCB0091919100BEBEBE00969696005959
      5900545454005555550058585800707070007474740087878700AFAFAF00C8C8
      C800F1F1F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00ECECEC00FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EAEEF000CCAFA100755E5300929394007B7F
      800050494400E4A98000E0935D00DC8B5100DE8F5500DF935900E1965B00E298
      5D00E3995E00E49A5E00E99F6200D5804D009C523700A05D4200AE6D5100DC94
      7400BD8E7800D9DCDD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EDED
      ED00B4B4B40062626200939393007E7E7E0049494900AFAFAF009A9A9A009292
      920096969600999999009B9B9B009D9D9D009E9E9E009E9E9E00A3A3A3008B8B
      8B00616161006A6A6A0079797900A1A1A10096969600DBDBDB00000000000000
      0000000000000000000000000000000000000000000000000000FAF7F300BA99
      5900D8C6A100D0B98B00A2761B0098680300996A07009D6F0F00AC853400B18B
      4200DCCBAB00FCFBF90000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE0000000000E0D1
      B400AB813200DBCAA90000000000FEFEFE000000000000000000000000000000
      00000000000000000000F6F6F6008E8E8E00BFBFBF00B1B1B100666666005656
      5600585858005E5E5E00777777007F7F7F00C6C6C600FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE0000000000CCCCCC0074747400C4C4C40000000000FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000F7FCFE00D6C8C200D1927400F0A37700B1896F003A3F41009999
      9A003E414300B0734B00E68D5000DE8D5400E0905700E1945A00E2965C00E499
      5E00E59A5F00E69B6000E99F6500E89B6200B1634200AA694C00AF6C4D00C180
      6200E49F7F00BE937D00DCE0E200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00CACACA009D9D
      9D00AEAEAE008D8D8D003E3E3E0099999900404040007A7A7A00969696009595
      9500979797009A9A9A009C9C9C009E9E9E009F9F9F00A0A0A000A4A4A400A1A1
      A1007272720075757500787878008B8B8B00ABABAB009A9A9A00DFDFDF000000
      0000000000000000000000000000000000000000000000000000D8C5A100C7AC
      7700E0D2B300B8964E00996800009E6F0C009F710F00AF873700B8955400F5F0
      E600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6F1EA00B08A
      4000C0A16100B18A4000F3EDE300000000000000000000000000000000000000
      00000000000000000000BFBFBF00A3A3A300CCCCCC0089898900555555005D5D
      5D005F5F5F00797979008B8B8B00EEEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0F0F0007E7E7E00969696007E7E7E00EBEBEB000000
      000000000000000000000000000000000000000000000000000000000000FDFF
      FF00E8E3E100D5A38C00E2966E00EDAE8A00EBB59500E4AD8B00413935008284
      85005A5F630066463000EA8E5200E08C5300E1905600E2935900E4955B00E598
      5E00E79D6300E9A06700EAA36800EFA76A00CD7B5000B3715500BC7A5B00BD79
      5700D1856100E5977100C0968000E0E4E7000000000000000000000000000000
      0000000000000000000000000000FEFEFE00E4E4E400ACACAC00A2A2A200B7B7
      B700BCBCBC00B4B4B4003A3A3A00838383005E5E5E0049494900989898009595
      9500979797009A9A9A009C9C9C009E9E9E00A2A2A200A5A5A500A7A7A700AAAA
      AA00888888007D7D7D00858585008484840092929200A4A4A4009C9C9C00E3E3
      E3000000000000000000000000000000000000000000FEFEFE00C1A26800E0D0
      AF00D7C39800A4781700A1710C00A1720D00B18A3700B6924D00F6F2EB000000
      0000FEFEFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C7AC7800B089
      3700B08A3400BA985000C3A66F00000000000000000000000000000000000000
      000000000000FEFEFE0099999900CACACA00BBBBBB00666666005F5F5F006060
      60007B7B7B0087878700F1F1F10000000000FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A3A3A3007A7A7A007A7A7A008B8B8B009D9D9D000000
      0000000000000000000000000000000000000000000000000000F4F4F400DEB9
      A900E0957300ECAA8600EBB69800E8B39400E6AC8A00F1A981007E5B48004C50
      530094979800312B2700D4824B00E58F5400E2905500E4935700E6975D00E89C
      6400E9A06800EBA36A00ECA56B00F0A96E00E4956100BF765700C4785400C974
      4A00CD774C00E2916700E79C7500C39B8600E4E8EA0000000000000000000000
      00000000000000000000F4F4F400C0C0C000A2A2A200B4B4B400BDBDBD00BABA
      BA00B4B4B400B3B3B300606060004F4F4F00969696002B2B2B008B8B8B009898
      9800979797009A9A9A009E9E9E00A2A2A200A5A5A500A8A8A800A9A9A900ADAD
      AD009E9E9E00848484008585850082828200858585009E9E9E00A8A8A800A1A1
      A100E7E7E70000000000000000000000000000000000ECE3D200C3A66C00ECE2
      CB00C7AA6B00A1710800A4760F00AE852A00AF883A00E5DAC30000000000FFFF
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFEFE0000000000E3D6BD00B0893A00AD84
      2700A77A1800BC9A4D00B48E4400DFCFB20000000000FEFEFE00000000000000
      000000000000E0E0E0009C9C9C00DDDDDD009E9E9E005E5E5E00636363007474
      74007B7B7B00D6D6D60000000000FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000D2D2D2007B7B7B0072727200686868008B8B8B0082828200CACA
      CA0000000000FEFEFE00000000000000000000000000FAE0D600E49F8000E9A4
      8200EDB99D00EAB89C00E8B19300E6A88600E4A07C00ECA47E00C58969002D2E
      2E009B9C9C003E434700925A3600F1925300E4905600E6975E00E89C6400EA9F
      6600EBA26900EDA56B00EEA86E00F0AA6F00F0A36700CF704400CC754B00D67E
      5200E0875700E68D5C00EFA07300E8A37B00C7A18D00E9EDF000000000000000
      000000000000E5E5E500ABABAB00AFAFAF00C1C1C100BFBFBF00B9B9B900B1B1
      B100AAAAAA00AFAFAF00929292002D2D2D009B9B9B0042424200606060009C9C
      9C00989898009E9E9E00A2A2A200A5A5A500A7A7A700A9A9A900ACACAC00ADAD
      AD00A8A8A80081818100848484008C8C8C00949494009A9A9A00ABABAB00ACAC
      AC00A7A7A700ECECEC00000000000000000000000000DAC8A600D3BD8F00EDE4
      CE00B9954100A7780D00AA7D1500B48D3600C2A46C0000000000FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFAF800B7945000B7913C00A87A
      0F00AB801C00B58E3400C2A15800B7934F00F9F6F10000000000000000000000
      000000000000C2C2C200B5B5B500DFDFDF008585850064646400696969007D7D
      7D009B9B9B0000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFAFA008989890081818100656565006D6D6D007D7D7D00939393008888
      8800F5F5F500000000000000000000000000FDEFE800F6AC8B00F6BFA400EDBF
      A700EAB89D00E9B09300E7A88800E6A58400E6A48100E7A27E00EFA77F004B3A
      310075787A007A7D7E0034282200C6805100ED995E00E89A6200EA9D6500EBA1
      6800EDA46B00EFA66C00F0A66A00F2A46700F6A96800E1855000DD825500E78E
      5D00EA936100EC986500EF9D6B00F5AF8000EAAB8200CDA99600EDF0F2000000
      0000F1F1F100B9B9B900C8C8C800C6C6C600BFBFBF00B9B9B900B2B2B200AFAF
      AF00AEAEAE00ADADAD00B1B1B1003C3C3C00777777007C7C7C002A2A2A008787
      8700A1A1A100A1A1A100A4A4A400A6A6A600A9A9A900ABABAB00AAAAAA00A9A9
      A900ADADAD0092929200919191009B9B9B009F9F9F00A3A3A300A7A7A700B6B6
      B600B2B2B200AEAEAE00EFEFEF000000000000000000CFB78B00E1D1B000E9DC
      BF00B38A2900AC7F1300B2882300B48D3A00E3D5BC0000000000FFFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000CEB68A00B68F3C00B2882300AD80
      1600AE821A00B7903400BE9B4500BE9B5100CAB0800000000000FFFEFE000000
      000000000000B0B0B000CBCBCB00D6D6D600777777006A6A6A00747474007E7E
      7E00D1D1D10000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE000000
      0000AFAFAF0080808000747474006B6B6B006E6E6E007E7E7E008A8A8A008E8E
      8E00A8A8A80000000000FEFEFE0000000000FEF6F200F8C9B300F8CBB400F4BE
      A300ECB29700E8AC9000E9AB8C00E8A98800E8A68400E8A48000F4AC84009C71
      58003B404300979797006E7274009D969100CE895A00EF9C6200EC9F6600EDA2
      6900EEA16700F0A06400F3A36400F3A56500EE9C6200E9915E00EA926100EC98
      6500EE9D6900F0A26E00F2A67100F3AB7600F7BA8900EBAF8200D9BAA900FAFE
      FF00F7F7F700D1D1D100D2D2D200C7C7C700BCBCBC00B6B6B600B5B5B500B3B3
      B300B0B0B000AEAEAE00B6B6B600777777003F3F3F0097979700717171009696
      960090909000A4A4A400A5A5A500A8A8A800A7A7A700A6A6A600A8A8A800A9A9
      A900A4A4A4009D9D9D009F9F9F00A3A3A300A6A6A600AAAAAA00ADADAD00B1B1
      B100BEBEBE00B4B4B400BEBEBE00FDFDFD0000000000CCB28200EBE0C800E4D5
      AF00B2871F00B1851A00B78F2B00B7934800F4F0E80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFE0000000000ECE3D300B38C3F00BC973A00B0841800B287
      1E00B1861C00BA943500BC973C00C7A75800B6914700E7DCC800000000000000
      000000000000AAAAAA00DBDBDB00CDCDCD0072727200707070007B7B7B008686
      8600EEEEEE000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE0000000000E0E0
      E0007F7F7F00848484006E6E6E00727272007171710081818100858585009797
      970084848400D9D9D900000000000000000000000000F8CBB600F9D3C000F9C1
      A800F6B99D00EEB39700EAAE9000EAAB8B00EAA98800EAA88500EEAA8400DE9B
      7500312B280082848500BBBCBC00AAADAF00D0A58800EC975C00ED9C6200EE9A
      5E00F19C5E00F3A06100EF9C6000E9915D00E88F5F00EB966500ED9C6900EFA1
      6D00F1A67100F3AA7500F3AE7800F5B17800F8B67E00FBD4B200F8EFE900FEFF
      FF0000000000D3D3D300D9D9D900CBCBCB00C4C4C400BDBDBD00B8B8B800B5B5
      B500B3B3B300B2B2B200B4B4B400A4A4A4002C2C2C0083838300BBBBBB00ACAC
      AC00A9A9A9009F9F9F00A3A3A300A2A2A200A3A3A300A6A6A600A3A3A3009D9D
      9D009C9C9C00A2A2A200A6A6A600A9A9A900ADADAD00B0B0B000B3B3B300B4B4
      B400B9B9B900D5D5D500F0F0F000FEFEFE0000000000CCB28100F0E7D300E4D4
      AB00B68A1E00B68A1E00BB932E00BC995300FAF8F60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BF9F6200BF9A4100B68B1D00B78C2200B78C
      2200B68B2000BD973600C29E4400C09B3E00C9A95C00BD9C5D00FDFCFB000000
      000000000000AAAAAA00E3E3E300CBCBCB0074747400747474007E7E7E008D8D
      8D00F8F8F8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009595
      95008888880074747400777777007777770075757500838383008C8C8C008888
      88009A9A9A0092929200FCFCFC000000000000000000FAD7C700F8D2C000F9D3
      C100F9C1A700F7BA9D00F0B49700EBAE9100EBAC8C00EBAC8A00ECB09000F6A8
      7B0065402B0051575A00CFD2D40083777000E28D5500EE955800EF955700F199
      5A00EE985C00E9915B00E88F5D00EA956300EC9C6900EDA06B00EFA57000F2AA
      7400F3AD7700F4B07800F7B37900F8C49500FAE7D700FDFEFF00000000000000
      000000000000DDDDDD00D8D8D800D9D9D900CBCBCB00C4C4C400BEBEBE00B8B8
      B800B6B6B600B5B5B500B9B9B900B3B3B3004545450056565600D1D1D1007878
      7800969696009E9E9E009E9E9E00A1A1A100A0A0A0009C9C9C009C9C9C00A0A0
      A000A5A5A500A8A8A800ACACAC00B0B0B000B2B2B200B4B4B400B6B6B600C5C5
      C500E8E8E800FEFEFE00000000000000000000000000CCB38100F1E9D700E9DA
      B500BB902300BB8F2100C0983100BC995100F9F6F30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE0000000000DAC9A900B38A3200C9A75100C19B3900BB902300BC91
      2500BB902300C29C3A00C9A75000CBAC5C00CCAD5E00BA944300D6C29C000000
      000000000000AAAAAA00E5E5E500D2D2D2007A7A7A0079797900838383008C8C
      8C00F6F6F6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000C4C4C4007A7A
      7A0095959500878787007A7A7A007B7B7B007A7A7A0088888800959595009B9B
      9B009D9D9D0085858500BCBCBC000000000000000000FCE6DC00F8CEBA00F9D9
      C900F9D1BF00F9C1A600F7BA9D00F2B59800EDB39500EDB59700EEB89A00F39F
      7000AF663C003D414300CACBCB005B5E5F00B06A3C00F8965400E9905300E68E
      5700E78F5D00E9946200EC9B6700EDA06B00EEA36E00F0A77200F2AD7700F3B0
      7900F5B27800F8BD8900F9DCC200FCFBFA000000000000000000000000000000
      000000000000EAEAEA00D5D5D500DEDEDE00D8D8D800CACACA00C4C4C400BFBF
      BF00BCBCBC00BDBDBD00C0C0C000ABABAB007070700040404000CACACA005D5D
      5D0072727200A0A0A00099999900999999009B9B9B009F9F9F00A4A4A400A8A8
      A800AAAAAA00ADADAD00B2B2B200B4B4B400B5B5B500BFBFBF00DDDDDD00FBFB
      FB000000000000000000000000000000000000000000CDB48400EFE6D100F1E7
      CD00C29A3000BE942400C69F3600BB964700F0E9DE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFEFE0000000000EADFCC00CAB07B00B48F4A00BE9A4900C59E3400BF96
      2700C0972900C9A44400D3B56B00B58F4600C8AE7900C9AF7900E7DBC5000000
      000000000000ACACAC00E2E2E200E1E1E100848484007C7C7C00898989008888
      8800E7E7E7000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000DCDCDC00A7A7
      A700848484008B8B8B00878787007E7E7E008080800090909000A6A6A6008383
      8300A5A5A500A5A5A500D7D7D7000000000000000000FDF3EE00F8CDB900F9DA
      CB00F9D7C600F9D0BC00F9C2A800F8C2A800F5C0A500F0BA9D00EFBA9D00EB96
      6700E27F480050423A00A5AAAD0098A2A800815B4200E7894D00DB875600E591
      6000EB9A6600EC9F6B00EDA36E00EEA67100F0AB7500F2AF7900F4B27900F7B8
      8000F9D1AD00FBF4EE00FEFFFF00000000000000000000000000000000000000
      000000000000F4F4F400D4D4D400DFDFDF00DCDCDC00D7D7D700CBCBCB00CBCB
      CB00C8C8C800C2C2C200C2C2C200A2A2A2008D8D8D0044444400A9A9A900A0A0
      A0005F5F5F0094949400929292009C9C9C00A3A3A300A7A7A700AAAAAA00ACAC
      AC00B0B0B000B3B3B300B5B5B500BABABA00D2D2D200F4F4F400FEFEFE000000
      00000000000000000000000000000000000000000000D2BB9000E7DABD00FBF8
      EC00CDAB4C00C3982500C9A23600BF9A4300D9C7A70000000000FEFEFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFD0000000000D2BE9700BE983F00C9A13500C49B
      2C00C69D3000D2B25700CAAA5C00D0B98E0000000000FEFEFD00000000000000
      000000000000B4B4B400D4D4D400F5F5F50096969600808080008B8B8B008989
      8900C2C2C20000000000FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD000000
      0000B7B7B700878787008A8A8A0083838300868686009E9E9E009A9A9A00B2B2
      B20000000000FDFDFD00000000000000000000000000FFFDFC00F8CCB800FADB
      CC00F9D8C700F9D6C500F9D1BE00F9C8B000F9C5AB00F6C2A700F2BDA100E889
      5600F57D3C0088533500848E9400AC928200CD815300E48F5E00E8976500EA9D
      6900EDA26E00EEA67100EFA97300F0AE7800F3B27A00F6B57A00F9C89B00FAEB
      DE00FDFFFF000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00D4D4D400E0E0E000DDDDDD00DCDCDC00D8D8D800D0D0
      D000CDCDCD00CACACA00C5C5C500979797008F8F8F005A5A5A008C8C8C009595
      95008B8B8B009B9B9B00A1A1A100A5A5A500A9A9A900ACACAC00AEAEAE00B2B2
      B200B5B5B500B7B7B700C9C9C900EBEBEB00FEFEFE0000000000000000000000
      00000000000000000000000000000000000000000000DECFB000D9C49A000000
      0000DDC47C00C69C2400CAA22F00CEAB4B00BB9A5900FDFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFBFA00BB9A5700CFAB4B00CAA12E00C9A1
      2E00CCA63B00DBBE6A00C5A45800E2D5BC0000000000FDFDFB00FFFEFE000000
      000000000000C9C9C900BDBDBD0000000000B4B4B40082828200898989009696
      96008F8F8F00FCFCFC0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FB008E8E8E009797970088888800888888008F8F8F00ABABAB0095959500D1D1
      D10000000000FCFCFC00FEFEFE00000000000000000000000000F9D7C700FAD9
      CA00FADACB00F9D7C700F9D5C400F9D0BC00F9C7AF00F8C2A600F8B89800F67B
      4300EF793B00D2733D00B0704800E8915D00EC996500EA9D6900EBA16C00EDA6
      7000EEA97300EFAD7600F2B17900F5B47A00F8C18E00FAE1CA00FDFDFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DDDDDD00DFDFDF00DFDFDF00DDDDDD00DBDBDB00D7D7
      D700CFCFCF00CACACA00C2C2C200919191008B8B8B0080808000787878009C9C
      9C00A3A3A300A5A5A500A8A8A800ABABAB00AEAEAE00B0B0B000B4B4B400B6B6
      B600C2C2C200E1E1E100FCFCFC00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F1EADD00C9AD7500FFFF
      FE00F0E3BF00CDA52F00CEA63200D6B14500C19C4700D5C29F0000000000FFFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFD0000000000D4BF9B00C29E4800D5B14300CEA73400CEA6
      3200D5B35100E0C67800BF9D5500F4EFE7000000000000000000000000000000
      000000000000E8E8E800A3A3A300FEFEFE00DBDBDB008B8B8B008C8C8C009999
      99008C8C8C00BCBCBC0000000000FEFEFE000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD0000000000BABA
      BA008D8D8D00989898008D8D8D008C8C8C009D9D9D00B4B4B40090909000EEEE
      EE00000000000000000000000000000000000000000000000000FBE4DA00F9D6
      C500FADDD000F9D9CA00F9D7C600F9D5C400F9CDB700FABD9E00F6B9980089AE
      740053C07F00F17F3F00E68E5500EB9E6A00EAA16B00ECA56F00EEA97300EFAC
      7600F0B07900F4B37900F7BB8300F9D6B500FCF8F300FEFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E8E8E800DCDCDC00E2E2E200DEDEDE00DCDCDC00DBDB
      DB00D4D4D400C7C7C700C2C2C2008E8E8E00868686008F8F8F0098989800A6A6
      A600A7A7A700AAAAAA00AEAEAE00B0B0B000B3B3B300B5B5B500BCBCBC00D6D6
      D600F7F7F700FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C7AB7500F1E9
      D500FEFCF600DDBF6400D1A92F00D3AC3700DBBA5500BA944500E4D8C4000000
      0000FEFEFD00FFFEFE000000000000000000000000000000000000000000FFFE
      FE00FEFEFD0000000000E3D6C000BA944300DBBA5500D2AB3500D3AD3800D5AF
      3F00E1C57000DABF7400C6AA740000000000FFFEFE0000000000000000000000
      00000000000000000000A2A2A200E5E5E500FAFAFA00AAAAAA008D8D8D009292
      9200A3A3A30086868600D5D5D50000000000FDFDFD00FEFEFE00000000000000
      0000000000000000000000000000FEFEFE00FDFDFD0000000000D3D3D3008585
      8500A3A3A300909090009292920096969600B2B2B200AFAFAF00A1A1A1000000
      0000FEFEFE000000000000000000000000000000000000000000FDF1EB00F9D3
      C100FAE1D400FADBCD00F9D9C900FBD6C400FDD6C400FFDCD000C2EAD80000E7
      AD0032CD8B00DF844700E3925B00ECA67000ECA87200EEAC7500EFAF7900F2B3
      7A00F6B87E00F9CCA100FBF0E500FEFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3F3F300D9D9D900E5E5E500E0E0E000DEDEDE00DCDC
      DC00DDDDDD00E3E3E300D6D6D60086868600838383008E8E8E009A9A9A00ABAB
      AB00ACACAC00AFAFAF00B2B2B200B5B5B500B9B9B900CCCCCC00F0F0F000FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1D2B600D0B7
      860000000000F3E8C500D6AF3500D7B13B00D9B33B00DDBD5A00B9944500DDCE
      B400000000000000000000000000000000000000000000000000000000000000
      000000000000DBCBB000B9944400DEBD5B00D8B23A00D8B23D00D7B03900DFC0
      6100ECD58D00C5A35800E5D9C40000000000FFFFFE0000000000000000000000
      00000000000000000000CDCDCD00AFAFAF0000000000E0E0E000939393009696
      960097979700A6A6A60086868600CACACA000000000000000000000000000000
      00000000000000000000000000000000000000000000C7C7C70085858500A7A7
      A700969696009797970095959500AAAAAA00C4C4C40095959500D6D6D6000000
      0000FEFEFE000000000000000000000000000000000000000000FFFCFA00F9D1
      BE00FBE2D600FADDCF00FFDECF00EED7CB00DAD8D600FBFFFF00E0EDE30098A0
      6400E7945900F2A87300EFAB7500EDAB7400EEAE7700F1B27A00F5B57900F8C3
      9100FBE5D100FEFEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC00D8D8D800E6E6E600E2E2E200E4E4E400DADA
      DA00D8D8D800FDFDFD00E5E5E500898989009C9C9C00AFAFAF00AFAFAF00AEAE
      AE00B1B1B100B4B4B400B6B6B600C4C4C400E5E5E500FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C2A3
      6800F0E7D40000000000EBD59000DAB23300DDB74100DEB84000E2C25D00C19C
      4800C4A77200E9DFCF00FDFCFC00000000000000000000000000FCFBFA00E8DE
      CC00C3A56F00C29D4900E2C25C00DDB83F00DDB74100DCB63C00E0BF5600EDD6
      8B00E0C88300C2A3690000000000FFFFFE000000000000000000000000000000
      000000000000000000000000000099999900E3E3E30000000000C5C5C5009595
      95009C9C9C009C9C9C00ABABAB008C8C8C009F9F9F00DDDDDD00FCFCFC000000
      00000000000000000000FBFBFB00DBDBDB009D9D9D008D8D8D00AAAAAA009C9C
      9C009C9C9C009A9A9A00A7A7A700C4C4C400B9B9B9009A9A9A0000000000FEFE
      FE0000000000000000000000000000000000000000000000000000000000FAD9
      CA00FBE2D500F9E4DB00DDD8D600CDD8DE00EAE9E900F2CBB600EFBDA400FED0
      B900FFB98200FEBB8400F8B88200F2B47C00F3B47900F8BD8600FADABC00FDFA
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DFDFDF00E6E6E600E8E8E800D9D9D900D6D6
      D600E9E9E900D1D1D100C5C5C500D7D7D700BEBEBE00BFBFBF00BBBBBB00B6B6
      B600B5B5B500BEBEBE00DADADA00FAFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFE0000000000EBE2
      D000C5A76B0000000000FEFCF600E9CE7800DFB73600E1BD4600E1BC4300E8C8
      5A00D9B85800C39E4900C2A25F00CBB07C00CFB88A00CAB07C00C2A15E00C39F
      4900DAB95900E8C75A00E1BC4200E1BD4600E0BA3F00E3C15300ECD68B00F2DF
      A000BF9D5500EDE5D80000000000FFFFFE000000000000000000000000000000
      000000000000FEFEFE0000000000DFDFDF009D9D9D0000000000FAFAFA00BABA
      BA0099999900A1A1A100A0A0A000AEAEAE00A3A3A3008E8E8E0096969600A7A7
      A700B0B0B000A7A7A700959595008E8E8E00A4A4A400ADADAD009F9F9F00A1A1
      A1009D9D9D00A7A7A700C4C4C400D0D0D00090909000E3E3E30000000000FEFE
      FE0000000000000000000000000000000000000000000000000000000000FCE3
      D800FDE8DE00E9F1F300D7D9DB00F7D7C700F0B89C00F2DACC00FEFFFF000000
      0000FFE5CF00FFBE8400FFBF8400FBBD8400FAD0A800FCF3EA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7E7E700EBEBEB00EFEFEF00D9D9D900DCDC
      DC00C1C1C100DDDDDD00FEFEFE0000000000E6E6E600C0C0C000C0C0C000BEBE
      BE00D0D0D000F3F3F30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFEFE000000
      0000D7C39E00CFB6830000000000FDFBF300EDD58200E4BD3C00E5C04300E5C0
      4500E8C44A00EBCA5700E5C45700DFBC5100DCB94F00DFBC5100E6C55700EBCA
      5600E8C44A00E5C04500E5C14600E5BF4000E8C85C00F1DC9500F8E8AE00C7A7
      5E00D9C8A7000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000BDBDBD00ADADAD0000000000F9F9
      F900C1C1C1009F9F9F00A2A2A200A3A3A300A7A7A700AEAEAE00AAAAAA00A4A4
      A400A1A1A100A4A4A400ABABAB00AEAEAE00A7A7A700A3A3A300A4A4A400A1A1
      A100AEAEAE00CBCBCB00DADADA0099999900C2C2C20000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDEE
      E700FBE0D400F9E4D900F2BA9E00EFCDBA00FCFBF90000000000000000000000
      000000000000FFE4CA00FFCA9900FFECDB00FEFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0F0F000E5E5E500E7E7E700C3C3C300D2D2
      D200FAFAFA0000000000000000000000000000000000E4E4E400CBCBCB00ECEC
      EC00FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D0BA8F00D3BC8B0000000000FFFFFC00F5E5B000EBCA5900E9C3
      4000E9C44500E9C44700EAC64A00EBC84D00ECC84D00EBC84C00EAC64A00E9C5
      4800E9C54700E9C44400EAC74F00EFD57B00F7E6AB00FBEDB800CCAE6800D3BD
      960000000000FFFEFE0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3B3B300B3B3B3000000
      0000FEFEFE00D8D8D800AFAFAF00A4A4A400A6A6A600A6A6A600A8A8A800AAAA
      AA00ABABAB00AAAAAA00A8A8A800A7A7A700A7A7A700A5A5A500AAAAAA00BFBF
      BF00D8D8D800E0E0E000A0A0A000B7B7B70000000000FEFEFE00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFD
      FC00F3BEA400EDC3AC00F9F4EF00000000000000000000000000000000000000
      000000000000FFFEFD00FFFDFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFD00C7C7C700C9C9C900F4F4F4000000
      00000000000000000000000000000000000000000000FEFEFE00FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFE0000000000D3BE9500C9AD7400FAF6EB0000000000FDF8E800F4E2
      A000EFD16700EDCA4C00ECC84500ECC84500ECC84600EDC84600EDC84600EDCA
      4B00EECE5C00F1D87F00F7E7AD00FFF5C900F4E4B100C4A35D00D6C29E000000
      0000FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000B7B7B700A3A3
      A300F3F3F30000000000F4F4F400D2D2D200B7B7B700ABABAB00A8A8A800A8A8
      A800A8A8A800A9A9A900A9A9A900ABABAB00B2B2B200C2C2C200D9D9D900E9E9
      E900D8D8D80096969600BCBCBC0000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCF8F500FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F800FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E4D8BF00BF9F6000DFCDA500FDFBF4000000
      0000FFFEF500FCF2D000F8E7AC00F5DF9000F4DC8400F5DE8A00F6E39D00FAEB
      B400FEF5CE00FFFADA00FAEFC700DAC28600BF9E5D00E7DCC800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D3D3
      D30094949400C5C5C500F9F9F90000000000FBFBFB00EAEAEA00D9D9D900CCCC
      CC00C6C6C600C9C9C900D2D2D200DDDDDD00EBEBEB00F1F1F100E5E5E500B6B6
      B60093939300D9D9D90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFEFE0000000000F9F7F200D5C09800C6A86E00D8C3
      9400EEE4C900FCF8EA00FFFFF700FFFFF600FFFFF100FFFEED00FFFBE600FAF1
      D400ECDDB200D6BD8300C4A66800D6C29D00FAF8F50000000000FFFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE000000
      0000F6F6F600B9B9B9009E9E9E00BABABA00DEDEDE00F4F4F400FCFCFC00FCFC
      FC00FAFAFA00F8F8F800F5F5F500EAEAEA00D3D3D300B2B2B2009B9B9B00BCBC
      BC00F7F7F70000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFEFE00FFFFFE0000000000FAF7F300E2D4
      B900CEB68700C9AE7700CCB17A00D1B98500D6BE8B00D2B88200CBAF7700C9AD
      7500CEB68900E3D5BD00FBF9F60000000000FFFEFE00FFFFFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFEFE0000000000F6F6F600CFCFCF00AEAEAE00A4A4A400A7A7A700AFAF
      AF00B5B5B500AEAEAE00A5A5A500A3A3A300AFAFAF00D1D1D100F8F8F8000000
      0000FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00000000000000
      000000000000FDFDFC00F7F3EC00F1EBE000F0E9DB00F1ECE100F7F4EE00FDFD
      FC00000000000000000000000000FEFEFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00000000000000000000000000FCFCFC00F2F2F200E9E9
      E900E6E6E600EAEAEA00F3F3F300FCFCFC00000000000000000000000000FDFD
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
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFEFD000000000000000000000000000000000000000000000000000000
      0000FEFEFD00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FDFDFD0000000000000000000000
      000000000000000000000000000000000000FDFDFD00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0F8F400D2EADD00FCFDFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4F4F400DDDDDD00FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFEF
      EF00E8E8E800E9E9E900E9E9E900E9E9E900E9E9E900E8E9E900EEEBEC00E6E8
      E70066B990004CB4830084C2A300F8EFF400E8E9E800E9E9E900E9E9E900E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900F8F8F800000000000000
      0000000000000000000000000000EFEFEF00E8E8E800E9E9E900E9E9E900E9E9
      E900E9E9E900E8E8E800ECECEC00E7E7E7008F8F8F0081818100A3A3A300F3F3
      F300E8E8E800E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9E900E9E9
      E900E9E9E900F8F8F80000000000000000000000000000000000000000000000
      0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFD00FEFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FEFDFD00FEFEFD00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00000000000000000000000000000000000000000000000000F3F3F300E9E9
      EA00F4F4F500F2F2F300F2F2F300F2F2F300F2F2F300F2F2F200FEF8FC006AB7
      90007FCEAD0074D1AF003FAC7A009DCCB400FFFAFF00F0F1F100F2F2F300F2F2
      F300F2F2F300F2F2F300F2F2F300F2F2F300F2F2F300F2F2F300F2F2F300F2F2
      F300F2F2F300F2F2F300F2F2F300F2F2F300F2F2F300E6E6E700FEFEFE000000
      00000000000000000000F3F3F300E9E9E900F4F4F400F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200FBFBFB0090909000A8A8A800A6A6A60077777700B4B4
      B400FDFDFD00F0F0F000F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200E6E6E600FEFEFE0000000000000000000000000000000000E6E3
      DF00D5D0CA00D8D3CC00D8D3CD00D8D3CD00D9D4CE00D9D4CF00DAD5CF00DAD5
      D000DBD6D000DBD6D100DBD7D100DCD7D100DCD7D200DCD7D200DCD7D200DCD7
      D200DCD7D100DCD7D100DBD6D100DBD6D000DAD6D000DAD5CF00DAD4CF00D9D4
      CE00D8D4CD00D8D3CD00D8D3CD00D6D0C900E6E3DF0000000000000000000000
      0000000000000000000000000000E2E2E200CFCFCF00D2D2D200D2D2D200D2D2
      D200D3D3D300D4D4D400D4D4D400D5D5D500D5D5D500D6D6D600D6D6D600D6D6
      D600D7D7D700D7D7D700D7D7D700D7D7D700D6D6D600D6D6D600D6D6D600D5D5
      D500D5D5D500D4D4D400D4D4D400D3D3D300D3D3D300D2D2D200D2D2D200CFCF
      CF00E2E2E2000000000000000000000000000000000000000000F0F0EF00F0F0
      F100F2F2F300F0F0F100F0F0F100F0F0F100EFF0F100FFF8FF0089C3A60075C8
      A3009CE2CA0043BB8D0054BD940045AB7A00C0DBCE00FDF6FB00EEEFF000F0F0
      F100F0F0F100F0F0F100F0F0F100F0F0F100F0F0F100F0F0F100F0F0F100F0F0
      F100F0F0F100F0F0F100F0F0F100EFEFF000F5F5F600E9E9E900FBFBFB000000
      00000000000000000000EFEFEF00F0F0F000F2F2F200F0F0F000F0F0F000F0F0
      F000F0F0F000FCFCFC00A6A6A600A0A0A000C2C2C200838383008C8C8C007878
      7800CDCDCD00FAFAFA00EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEF
      EF00F5F5F500E9E9E900FBFBFB00000000000000000000000000F7F6F500CDC7
      C000D1CBC200D7D1C900D8D2CB00D9D4CD00DCD6CF00DED9D300E0DCD600E3DF
      D900E4E1DB00E5E2DD00E7E4DF00E9E5E000E9E6E200EBE7E300EBE8E400EAE7
      E200E9E5E100E8E4DF00E6E2DD00E4E1DB00E3DED900E0DCD500DDD9D300D9D7
      D000D7D7CE00D5D5CC00D5D3C900D1CCC300CDC7BF00F7F6F500000000000000
      00000000000000000000F6F6F600C6C6C600CACACA00D0D0D000D1D1D100D3D3
      D300D5D5D500D8D8D800DBDBDB00DEDEDE00E0E0E000E1E1E100E3E3E300E4E4
      E400E5E5E500E7E7E700E7E7E700E6E6E600E5E5E500E3E3E300E1E1E100E0E0
      E000DEDEDE00DBDBDB00D8D8D800D5D5D500D4D4D400D2D2D200D0D0D000CACA
      CA00C6C6C600F6F6F60000000000000000000000000000000000F0F0F000F0F0
      F100F2F2F400F0F0F200F0F0F200EEEFF000FFF6FD00ABD2C00068C09700AFEB
      D70083D7B9004DBF93002CAC790057B88F0046A97800DDE8E400F7F3F700EFF0
      F200F0F0F200F0F0F200F0F0F200F0F0F200F0F0F200F0F0F200F0F0F200F0F0
      F200F0F0F200F0F0F200F0F0F200EFEFF100F4F4F600E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F0F0F000F2F2F200F0F0F000F0F0F000EFEF
      EF00FBFBFB00BFBFBF0095959500D0D0D000B1B1B1008A8A8A00707070008A8A
      8A0077777700E3E3E300F5F5F500F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEF
      EF00F4F4F400E9E9E900FCFCFC00000000000000000000000000F0EDEC00D1CA
      C200D7D1C900D3CEC600D1CBC500D3CEC800D5D0CA00D7D2CC00D9D5D000DCD8
      D200E3DFDA00E8E4DF00E8E5E000EAE6E200EBE7E400EBE9E500EBE9E500EBE8
      E400EAE6E300E9E6E100E7E4DF00E6E2DE00E5E0DB00E1DFD800DDDDD600D9DD
      D400D6DDD300D5DBD100D5D9CF00D4D3CA00D0CCC400F0EEEC00000000000000
      00000000000000000000EDEDED00C9C9C900D0D0D000CDCDCD00CBCBCB00CDCD
      CD00CFCFCF00D1D1D100D4D4D400D7D7D700DEDEDE00E3E3E300E4E4E400E6E6
      E600E7E7E700E8E8E800E8E8E800E7E7E700E6E6E600E5E5E500E3E3E300E2E2
      E200E0E0E000DDDDDD00DADADA00D8D8D800D7D7D700D5D5D500D4D4D400D0D0
      D000CACACA00EEEEEE0000000000000000000000000000000000F0F0F000F1F1
      F100F3F3F400F1F1F200F0F0F100FCF6FA00CCE0D7005CB78B00BDF1E00096E2
      C80087D9BB004DBF93002EAD7B0030A7760051B0850055AF8200F5F3F500F5F3
      F600F1F1F300F1F1F300F1F1F300F1F1F300F1F1F300F1F1F300F1F1F300F1F1
      F300F1F1F300F1F1F300F1F1F200F0F0F100F5F5F600E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F1F1F100F3F3F300F1F1F100F0F0F000F9F9
      F900D6D6D6008A8A8A00DADADA00C0C0C000B3B3B3008A8A8A00727272006F6F
      6F008282820082828200F4F4F400F4F4F400F1F1F100F1F1F100F1F1F100F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F0F0
      F000F5F5F500E9E9E900FCFCFC00000000000000000000000000E9E6E300D4CE
      C700DFDAD400CBC6C000C0BBB500C4C0BA00C7C2BD00C8C4BE00CBC7C200CCC8
      C400E0DDD800EDEAE500EBE8E500ECEAE700EDEBE800EEECE900EEECE900EEEB
      E800EDEBE700ECE9E600EBE8E400EAE7E200E8E5E000E5E3DE00DFE3DC00DAE4
      DB00D9E6DC00D8E5DA00D7E2D700D8DCD400D3D1C900E9E6E300000000000000
      00000000000000000000E6E6E600CDCDCD00D9D9D900C5C5C500BABABA00BFBF
      BF00C2C2C200C3C3C300C6C6C600C8C8C800DCDCDC00E9E9E900E8E8E800E9E9
      E900EAEAEA00EBEBEB00EBEBEB00EBEBEB00EAEAEA00E9E9E900E7E7E700E6E6
      E600E4E4E400E2E2E200DFDFDF00DDDDDD00DEDEDE00DDDDDD00DADADA00D8D8
      D800CFCFCF00E6E6E60000000000000000000000000000000000F0F0F000F1F1
      F100F3F3F400F1F1F200F7F4F600E4EBE90058B38600BDEFDD00AEEDD80096E1
      C70087D9BB004DBF930030AE7C002AA4710030A1700048AA7C0074BC9700FEF5
      F900EEEDEC00EFEDED00EFEDED00EFEDED00EFEDED00EFEDED00EFEDED00EFED
      ED00EFEDED00EFEEEE00F1F1F200F0F0F100F5F5F600E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F1F1F100F3F3F300F1F1F100F5F5F500E8E8
      E80085858500D8D8D800D1D1D100BFBFBF00B3B3B3008A8A8A00737373006A6A
      6A006B6B6B007A7A7A0097979700F9F9F900EDEDED00EDEDED00EDEDED00EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EEEEEE00F1F1F100F0F0
      F000F5F5F500E9E9E900FCFCFC00000000000000000000000000E2DEDA00DAD5
      CE00E5E1DB00CCC8C100C0BBB500C4BFBA00C7C2BD00C7C4BF00CAC7C200CBC8
      C300E1DEDB00F0EDEA00EEEBE800EFECEA00F0EDEB00F1EEEC00F1EEEC00F0EE
      EB00EFEDEA00EFECE900EDEBE800EDEAE700EBE8E500E8E7E200E1E7E000E3EB
      E300A7DFC6009CE1C400E0E8DF00DBE2DA00D9D7D000E2DEDA00000000000000
      00000000000000000000DEDEDE00D4D4D400E0E0E000C7C7C700BABABA00BFBF
      BF00C2C2C200C3C3C300C6C6C600C7C7C700DEDEDE00EDEDED00EBEBEB00ECEC
      EC00EDEDED00EEEEEE00EEEEEE00EDEDED00ECECEC00ECECEC00EAEAEA00EAEA
      EA00E8E8E800E5E5E500E2E2E200E5E5E500C4C4C400C0C0C000E2E2E200DDDD
      DD00D5D5D500DEDEDE0000000000000000000000000000000000F0F0F000F1F1
      F100F3F3F500F3F2F400F5F3F60069B99200AEE6D000C5F7E800A7EAD30097E2
      C80087D9BB004DBF930030AE7C002EA67500209A6500379E700041A5730092C1
      A500F9EBED00E8E4E100EAE5E200EAE5E200EAE5E200EAE5E200EAE5E200EAE5
      E200EAE5E100EBE7E500F1F1F300F0F0F200F5F5F700E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F1F1F100F3F3F300F3F3F300F4F4F4009191
      9100CCCCCC00E1E1E100CCCCCC00C0C0C000B3B3B3008A8A8A00737373006D6D
      6D005F5F5F006C6C6C0073737300A8A8A800F0F0F000E4E4E400E5E5E500E5E5
      E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E7E7E700F1F1F100F0F0
      F000F5F5F500E9E9E900FCFCFC00000000000000000000000000DDD8D300DFDB
      D600E9E6E100C7C3BE00B7B2AD00BDB8B300C0BCB600C0BDB700C3BFBB00C3C0
      BD00E0DDDA00F2F0ED00EFEDEA00F1EEEC00F2F0ED00F2F0ED00F2F1ED00F2F0
      ED00F1EFED00F0EEEB00EFEDEA00EEECE900EDEBE800EAEAE600E4EAE200E1EC
      E400C6E6D500C0E5D300DFEAE100DEE5DC00DEDED700DDD8D300000000000000
      00000000000000000000D8D8D800DADADA00E5E5E500C2C2C200B2B2B200B8B8
      B800BBBBBB00BCBCBC00BFBFBF00C0C0C000DDDDDD00EFEFEF00ECECEC00EEEE
      EE00EFEFEF00EFEFEF00F0F0F000EFEFEF00EFEFEF00EDEDED00ECECEC00EBEB
      EB00EAEAEA00E8E8E800E5E5E500E5E5E500D5D5D500D2D2D200E3E3E300DFDF
      DF00DBDBDB00D8D8D80000000000000000000000000000000000F0F0F000F1F1
      F100F2F3F400FCF6FA008AC6A8009FDBC200E2FFFC00B6F1DE00A9EAD40097E1
      C80087D9BB004DBF930030AE7C002EA67400259C6800158E57003D9C70003DA2
      7000BDDECF00FEF9FE00F4F5F700F4F5F700F4F5F700F4F5F700F4F5F700F4F5
      F700F4F5F700F4F5F600F2F2F300F1F1F200F6F6F700E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F1F1F100F3F3F300F9F9F900A8A8A800BEBE
      BE00F4F4F400D7D7D700CDCDCD00C0C0C000B3B3B3008A8A8A00737373006D6D
      6D0063636300535353006D6D6D006F6F6F00CECECE00FCFCFC00F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F2F2F200F1F1
      F100F6F6F600E9E9E900FCFCFC000000000000000000FCFCFB00DBD6D000E4E1
      DA00E7E4DF00D9D4D000D2CEC800D5D1CD00D7D3CE00D8D5CF00DAD7D300DBD8
      D500E9E6E300F1EFEC00F1EEEB00F1EFEC00F2F0ED00F3F1EE00F3F1EE00F2F1
      EE00F1F0ED00F1EEEC00F0EDEB00EFEDEA00EEEBE800EBEAE600E7EAE300E2EA
      E200E2ECE300E2EBE200DFE7DF00E1E5DE00E3E2DB00DBD6D000FCFCFB000000
      000000000000FBFBFB00D5D5D500DFDFDF00E3E3E300D4D4D400CDCDCD00D1D1
      D100D2D2D200D4D4D400D6D6D600D8D8D800E6E6E600EEEEEE00EEEEEE00EEEE
      EE00EFEFEF00F0F0F000F0F0F000F0F0F000EFEFEF00EEEEEE00EDEDED00ECEC
      EC00EBEBEB00E9E9E900E6E6E600E4E4E400E5E5E500E5E5E500E1E1E100E1E1
      E100E0E0E000D5D5D500FBFBFB00000000000000000000000000F0F0F000F1F1
      F200F3F4F600F4F2F5006CBC9300A9E3CB00ACE5CF00C0F1E100A9EBD50097E1
      C80087D9BB004DBF930030AE7C002CA573002B9F6C004BA97E003A9E6E00349B
      670084BE9D00FDF1F300EDEAE800EDEAE800EDEAE800EDEAE800EDEAE800EDEA
      E800EDEAE800EEEBEA00F2F2F400F1F1F300F6F6F800E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F1F1F100F4F4F400F3F3F30093939300C7C7
      C700CACACA00DBDBDB00CDCDCD00C0C0C000B3B3B3008A8A8A00737373006C6C
      6C00676767007B7B7B006C6C6C00676767009F9F9F00F5F5F500EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EBEBEB00F2F2F200F1F1
      F100F6F6F600E9E9E900FCFCFC000000000000000000F7F7F600DBD7D100E7E4
      E000E5E2DE00E8E5E100EAE7E200EBE8E300ECE9E500EDEAE700EFECE900F0EE
      EB00F0EDEB00F0EDEB00F1EEEB00F1EFED00F2F0EE00F3F1EF00F3F1EF00F2F0
      EE00F1EFED00F1EFEB00F0EEEB00EFEDEA00EEEBE800EBEAE600E8E9E400E6E8
      E300E3E8E100E2E6E000E3E5DF00E4E4DF00E6E4E000DBD7D100F8F7F6000000
      000000000000F6F6F600D6D6D600E3E3E300E1E1E100E4E4E400E6E6E600E7E7
      E700E8E8E800EAEAEA00ECECEC00EDEDED00EDEDED00EDEDED00EEEEEE00EFEF
      EF00F0F0F000F1F1F100F1F1F100F0F0F000EFEFEF00EEEEEE00EDEDED00ECEC
      EC00EBEBEB00E9E9E900E7E7E700E5E5E500E4E4E400E2E2E200E2E2E200E2E2
      E200E3E3E300D6D6D600F7F7F700000000000000000000000000F0F0F000F1F1
      F200F4F4F500F8F5F700D0E4DB00ABD5C0007BBF9C009CDCC200B3F0DC0097E1
      C80087D9BB004DBF930030AE7C0029A4710037A4750052AE8100A0D0B800AAD3
      BF00E2E7E200EFEBE900EDEAE800EDEAE800EDEAE800EDEAE800EDEAE800EDEA
      E800EDEAE800EEEBEA00F3F3F400F2F2F300F7F7F800E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F1F1F100F4F4F400F6F6F600DADADA00C0C0
      C0009C9C9C00BEBEBE00D5D5D500C0C0C000B3B3B3008A8A8A00737373006A6A
      6A007070700080808000B8B8B800BEBEBE00E3E3E300EBEBEB00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EBEBEB00F3F3F300F2F2
      F200F7F7F700E9E9E900FCFCFC000000000000000000F2F0EF00D0C9C200D6D0
      CA00D5CFC900D5CFC900D5D0C900D5D0C900D6D0CA00D6D1CA00D6D1CB00D7D1
      CB00D7D2CB00D7D2CC00D7D2CC00D7D2CC00D8D2CC00D8D2CC00D8D2CC00D8D2
      CC00D7D2CC00D7D2CC00D7D2CC00D7D2CC00D7D1CB00D6D1CB00D6D1CA00D6D0
      CA00D5D0C900D5D0C900D5D0C900D5CFC900D6D0CA00CFC8C100F2F0EF000000
      000000000000F0F0F000C9C9C900D0D0D000CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00D0D0D000D0D0D000D0D0D000D1D1D100D1D1D100D1D1D100D1D1D100D1D1
      D100D2D2D200D2D2D200D2D2D200D2D2D200D1D1D100D1D1D100D1D1D100D1D1
      D100D1D1D100D0D0D000D0D0D000D0D0D000CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00D0D0D000C8C8C800F0F0F000000000000000000000000000F0F0F000F1F1
      F200F5F5F600F2F3F300F9F6F800FFFEFF00BBD9CA0096D9BC00B3F0DD0097E1
      C80087D9BB004DBF930030AE7C002AA4720032A271005AB18700F6F7F900FFFC
      FF00F8F7FB00F4F6F800F5F6F800F5F6F800F5F6F800F5F6F800F5F6F800F5F6
      F800F5F6F800F5F6F700F3F3F400F2F2F300F7F7F800E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F1F1F100F5F5F500F2F2F200F7F7F700FEFE
      FE00CACACA00B9B9B900D5D5D500C0C0C000B3B3B3008A8A8A00737373006A6A
      6A006C6C6C0086868600F7F7F700FEFEFE00F8F8F800F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F3F3F300F2F2
      F200F7F7F700E9E9E900FCFCFC000000000000000000EDEBE800DEDAD400EAE7
      E200E9E6E100EAE7E300EBE8E400ECEAE500EDEAE600EDEBE700EEEBE700EEEC
      E800EEECE800EFECE900EFECE900EFEDE900EFEDE900EFEDE900EFEDE900EFED
      E900EFEDE900EFECE900EFECE900EFECE800EEECE800EEEBE800EDEBE700EDEA
      E600EDEAE500EBE9E500EBE7E300EAE6E200EBE8E300DDD8D300EBE9E6000000
      000000000000EAEAEA00D9D9D900E6E6E600E5E5E500E6E6E600E7E7E700E9E9
      E900E9E9E900EAEAEA00EAEAEA00EBEBEB00EBEBEB00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00EBEB
      EB00EBEBEB00EBEBEB00EAEAEA00E9E9E900E9E9E900E8E8E800E7E7E700E6E6
      E600E7E7E700D8D8D800E8E8E800000000000000000000000000F0F0F000F2F2
      F200F6F6F700F4F4F500F2F3F400FDF8FC00B1D6C40097DABE00B3F0DD0097E1
      C80087D9BB004DBF930030AE7C002AA4720033A3720057AF8300E1E2DC00EDE7
      E400EBE6E300EBE6E300EBE6E300EBE6E300EBE6E300EBE6E300EBE6E300EBE6
      E300EBE5E200ECE8E600F4F4F500F3F3F400F8F8F800E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F2F2F200F6F6F600F4F4F400F3F3F300FBFB
      FB00C3C3C300BABABA00D5D5D500C0C0C000B3B3B3008A8A8A00737373006A6A
      6A006D6D6D0083838300DFDFDF00E8E8E800E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E8E8E800F4F4F400F3F3
      F300F8F8F800E9E9E900FCFCFC000000000000000000F1EFED00DFDBD600EAE7
      E200E9E6E200EBE8E300ECE9E500EDEAE600EDEBE700EEECE800EEECE900F0ED
      EA00F0EDEA00F0EEEB00F1EEEB00F1EEEC00F1EFEC00F1EFEC00F1EFEC00F1EF
      EC00F1EEEC00F1EEEB00F1EEEB00F0EEEB00F0EDEA00EFECEA00EEECE800EEEB
      E700EDEBE700ECEAE500EBE8E400EAE6E200EBE8E300DDD9D400F0EEEC000000
      000000000000EFEFEF00DADADA00E6E6E600E5E5E500E7E7E700E8E8E800E9E9
      E900EAEAEA00EBEBEB00EBEBEB00EDEDED00EDEDED00EDEDED00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EDED
      ED00EDEDED00ECECEC00EBEBEB00EAEAEA00EAEAEA00E9E9E900E7E7E700E6E6
      E600E7E7E700D8D8D800EEEEEE00000000000000000000000000F0F0F000F2F2
      F200F6F6F700F4F4F500F3F4F400FFF9FE00B3D7C50097DABE00B3F0DD0097E1
      C80087D9BB004DBF930030AE7C002AA4720032A2720058B08500E9ECE900F5F1
      F200F2F0F000F2F0F000F2F0F000F2F0F000F2F0F000F2F0F000F2F0F000F2F0
      F000F2F0F000F2F1F100F4F4F500F3F3F400F8F8F800E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F2F2F200F6F6F600F4F4F400F3F3F300FCFC
      FC00C5C5C500BABABA00D5D5D500C0C0C000B3B3B3008A8A8A00737373006A6A
      6A006C6C6C0084848400EAEAEA00F2F2F200F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F1F1F100F4F4F400F3F3
      F300F8F8F800E9E9E900FCFCFC000000000000000000F6F5F400DDD8D300EBE8
      E300EAE7E200EBE9E500EDEAE600EDEBE700EEECE800EEECE900F0EDEA00F0ED
      EA00F1EEEB00F1EEEB00F1EFEC00F2F0EC00F2F0ED00F2F0ED00F2F0ED00F2F0
      ED00F2F0EC00F1EFEC00F1EEEC00F1EEEB00F0EEEB00F0EDEA00EFECE900EEEC
      E800EEEBE700EDEAE600ECE9E500EAE7E300ECE8E400DBD6D000F5F4F3000000
      000000000000F5F5F500D8D8D800E7E7E700E6E6E600E8E8E800E9E9E900EAEA
      EA00EBEBEB00EBEBEB00EDEDED00EDEDED00EEEEEE00EEEEEE00EEEEEE00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EEEEEE00EEEEEE00EEEE
      EE00EDEDED00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E6E6
      E600E8E8E800D5D5D500F4F4F400000000000000000000000000F0F0F000F2F2
      F200F6F6F800F4F4F600F3F4F500FFF9FF00B3D7C60097DABE00B3F0DD0097E1
      C80087D9BB004DBF930030AE7C002AA4720032A2710059B18600ECF1F100F8F6
      F900F5F5F700F5F5F700F5F5F700F5F5F700F5F5F700F5F5F700F5F5F700F5F5
      F700F5F5F700F5F5F700F4F4F600F3F3F500F8F8F900E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F2F2F200F6F6F600F4F4F400F4F4F400FDFD
      FD00C5C5C500BABABA00D5D5D500C0C0C000B3B3B3008A8A8A00737373006A6A
      6A006C6C6C0085858500EFEFEF00F7F7F700F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F4F4F400F3F3
      F300F8F8F800E9E9E900FCFCFC000000000000000000FAFAF900DED9D400EBE8
      E300EBE8E300EDE9E500EEEBE700EEEBE800EFECE900F0EDEA00F0EDEA00F1EE
      EB00F1EFEC00F2EFEC00F2F0ED00F2F0ED00F3F0ED00F3F1ED00F3F1ED00F3F1
      ED00F2F0ED00F2F0ED00F2F0EC00F1EFEC00F1EEEB00F0EDEA00F0EDEA00EFEC
      E900EEEBE800EEEBE700EDEAE600EBE8E400ECE8E400DBD6D000FAFAF9000000
      000000000000F9F9F900D9D9D900E7E7E700E7E7E700E9E9E900EAEAEA00EBEB
      EB00ECECEC00EDEDED00EDEDED00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEF
      EF00F0F0F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEFEF00EEEE
      EE00EEEEEE00EDEDED00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E7E7
      E700E8E8E800D5D5D500F9F9F900000000000000000000000000F0F0F000F2F2
      F200F7F7F800F5F5F600F4F5F500FFFAFF00B4D8C60097DABE00B3F0DD0097E1
      C80087D9BB004DBF930030AE7C002AA4720033A3720057AF8300E3E3DD00EFE8
      E500ECE7E300ECE7E300ECE7E300ECE7E300ECE7E300ECE7E300ECE7E300ECE7
      E300ECE6E200EDE9E600F5F5F600F4F4F500F8F8F900E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F2F2F200F7F7F700F5F5F500F4F4F400FDFD
      FD00C6C6C600BABABA00D5D5D500C0C0C000B3B3B3008A8A8A00737373006A6A
      6A006D6D6D0083838300E1E1E100E9E9E900E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E6E6E600E9E9E900F5F5F500F4F4
      F400F8F8F800E9E9E900FCFCFC000000000000000000FEFEFE00DEDAD500EBE8
      E300ECEAE500EDEBE700EEECE800EFEDE900F0EDEA00F0EEEB00F1EFEB00F1F0
      EC00F2F0ED00F2F1ED00F3F1EE00F3F2EE00F3F2EF00F3F2EF00F3F2EF00F3F2
      EF00F3F2EE00F3F1EE00F2F1EE00F2F1ED00F2F0EC00F1EFEC00F0EEEB00F0EE
      EA00EFEDE900EEECE800EDEBE700ECEAE500EBE8E400DDD8D300FEFEFE000000
      000000000000FEFEFE00D9D9D900E7E7E700E9E9E900EAEAEA00EBEBEB00ECEC
      EC00EDEDED00EDEDED00EEEEEE00EFEFEF00EFEFEF00F0F0F000F0F0F000F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F0F0F000F0F0F000F0F0
      F000EFEFEF00EEEEEE00EDEDED00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9
      E900E7E7E700D8D8D800FEFEFE00000000000000000000000000F0F0F000F2F2
      F200F7F7F800F5F5F600F4F5F500FFFAFF00B4D8C60097DABE00B3F0DD0097E1
      C80087D9BB004DBF930030AE7C002AA4720032A2710059B18600ECF1EF00F8F6
      F800F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5F600F5F5
      F600F5F5F600F5F5F600F5F5F600F4F4F500F8F8F900E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F2F2F200F7F7F700F5F5F500F4F4F400FDFD
      FD00C6C6C600BABABA00D5D5D500C0C0C000B3B3B3008A8A8A00737373006A6A
      6A006C6C6C0085858500EEEEEE00F7F7F700F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F4F4
      F400F8F8F800E9E9E900FCFCFC00000000000000000000000000E2DED900EAE7
      E300EDEBE700EEECE800EFEDE900F0EDEA00F0EEEB00F1EFEC00F2F0ED00F2F1
      EE00F3F1EE00F3F2EF00F4F2F000F4F3F000F4F3F100F4F3F100F4F3F100F4F3
      F100F4F3F000F4F2F000F3F2EF00F3F1EE00F2F1EE00F2F0ED00F1EFEC00F1EE
      EB00F0EEEA00EFEDEA00EEECE900EEECE800E9E7E200DFDBD600000000000000
      00000000000000000000DDDDDD00E6E6E600EAEAEA00EBEBEB00ECECEC00EDED
      ED00EDEDED00EEEEEE00EFEFEF00F0F0F000F0F0F000F1F1F100F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F1F1F100F0F0
      F000F0F0F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00EBEBEB00EBEB
      EB00E6E6E600DADADA0000000000000000000000000000000000F0F0F000F2F2
      F200F8F8F900F6F6F700F5F6F600FFFBFF00B4D8C70097DABE00B3F0DD0097E1
      C80087D9BB004DBF930030AE7C002AA4720032A2720059B18500EBEFED00F7F4
      F500F4F3F300F4F3F300F4F3F300F4F3F300F4F3F300F4F3F300F4F3F300F4F3
      F300F4F3F300F4F3F400F6F6F700F5F5F700F9F9FA00E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F2F2F200F8F8F800F6F6F600F5F5F500FDFD
      FD00C6C6C600BABABA00D5D5D500C0C0C000B3B3B3008A8A8A00737373006A6A
      6A006C6C6C0085858500EDEDED00F5F5F500F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F6F6F600F5F5
      F500F9F9F900E9E9E900FCFCFC00000000000000000000000000E6E2DF00E7E5
      E000EFEDE900EFECE900F0EDEA00F1EEEB00F1EFEC00F2F0ED00F2F0EE00F3F1
      EE00F3F2F000F4F2F000F4F3F100F4F3F100F5F3F200F5F4F200F5F4F200F5F3
      F200F5F3F100F4F3F100F4F2F000F3F2F000F3F1EF00F3F1EE00F2F0ED00F1EF
      EC00F1EEEB00F0EDEA00EFECEA00EFEDEA00E7E4DF00E4E1DD00000000000000
      00000000000000000000E2E2E200E4E4E400ECECEC00ECECEC00EDEDED00EEEE
      EE00EEEEEE00EFEFEF00F0F0F000F0F0F000F1F1F100F2F2F200F2F2F200F2F2
      F200F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F2F2F200F2F2F200F1F1
      F100F1F1F100F0F0F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00ECEC
      EC00E3E3E300E0E0E00000000000000000000000000000000000F0F0F000F2F2
      F200F8F8F900F6F6F700F5F6F600FFFBFF00B4D8C70097DABE00B3F0DD0097E1
      C80087D9BB004DBF930030AE7C002AA4720033A3720058AF8300E5E5DF00F1EA
      E700EEE9E500EEE9E500EEE9E500EEE9E500EEE9E500EEE9E500EEE9E500EEE9
      E500EEE8E400EFEBE800F6F6F700F5F5F700F9F9FA00E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F2F2F200F8F8F800F6F6F600F5F5F500FDFD
      FD00C6C6C600BABABA00D5D5D500C0C0C000B3B3B3008A8A8A00737373006A6A
      6A006D6D6D0083838300E3E3E300EBEBEB00E9E9E900E9E9E900E9E9E900E9E9
      E900E9E9E900E9E9E900E9E9E900E9E9E900E8E8E800EBEBEB00F6F6F600F5F5
      F500F9F9F900E9E9E900FCFCFC00000000000000000000000000EBE9E600E6E3
      DE00F0EEEA00F0EDEA00F0EEEB00F1EFEC00F2F0ED00F2F1EE00F3F1EF00F4F2
      F000F4F3F100F5F3F100F5F4F200F5F4F200F6F5F300F6F5F300F6F5F300F6F5
      F300F5F4F200F5F4F200F5F3F100F4F3F100F4F2F000F3F2EF00F3F1EE00F2F0
      ED00F1F0EC00F1EEEC00F0EEEB00F1EFEC00E5E2DD00E9E6E300000000000000
      00000000000000000000E8E8E800E2E2E200EDEDED00EDEDED00EDEDED00EEEE
      EE00EFEFEF00F0F0F000F1F1F100F2F2F200F2F2F200F3F3F300F3F3F300F3F3
      F300F4F4F400F4F4F400F4F4F400F4F4F400F3F3F300F3F3F300F3F3F300F2F2
      F200F2F2F200F1F1F100F0F0F000EFEFEF00EFEFEF00EEEEEE00EDEDED00EEEE
      EE00E1E1E100E6E6E60000000000000000000000000000000000F0F0F000F2F2
      F300F9F9FA00F7F7F800F6F7F700FFFCFF00B5D9C70096DABE00B3F0DD0097E1
      C80087D9BB004DBF930030AE7C002AA4720032A2710059B28700F0F6F500FCFB
      FE00F9FAFC00F9FAFC00F9FAFC00F9FAFC00F9FAFC00F9FAFC00F9FAFC00F9FA
      FC00F9FAFC00F9FAFB00F7F7F800F7F7F800FAFAFB00E9E9EA00FCFCFC000000
      00000000000000000000F0F0F000F2F2F200F9F9F900F7F7F700F6F6F600FEFE
      FE00C7C7C700BABABA00D5D5D500C0C0C000B3B3B3008A8A8A00737373006A6A
      6A006C6C6C0086868600F3F3F300FCFCFC00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00F7F7F700F7F7
      F700FAFAFA00E9E9E900FCFCFC00000000000000000000000000F1EFED00E8E5
      E000F3F1EF00F1EEEB00F1EFEC00F2F0ED00F3F1EE00F3F1EE00F4F2F000F4F3
      F000F5F3F100F5F4F200F6F4F200F6F5F300F7F5F300F7F5F400F7F5F400F7F5
      F300F6F5F300F6F4F200F6F4F200F5F3F100F5F3F100F4F2F000F4F2EF00F3F1
      EE00F2F0ED00F2EFEC00F1EEEB00F3F0EE00E2DEDA00EFEDEB00000000000000
      00000000000000000000EFEFEF00E4E4E400F1F1F100EEEEEE00EEEEEE00EFEF
      EF00F0F0F000F0F0F000F2F2F200F2F2F200F3F3F300F3F3F300F4F4F400F4F4
      F400F5F5F500F5F5F500F5F5F500F5F5F500F4F4F400F4F4F400F4F4F400F3F3
      F300F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00EFEFEF00EEEEEE00F0F0
      F000DEDEDE00EDEDED0000000000000000000000000000000000F0F0F000F2F2
      F300F9F9FA00F7F7F800F6F7F700FFFCFF00B6D9C70096D9BD00B1EFDB0095E0
      C70085D8BA004BBE91002EAD7A0028A3700030A2700059B08500E9EBE700F5F0
      EF00F2EFED00F2EFED00F2EFED00F2EFED00F2EFED00F2EFED00F2EFED00F2EF
      ED00F2EFED00F3F0EF00F7F7F800F7F7F800FAFAFB00E9E9EA00FCFCFC000000
      00000000000000000000F0F0F000F2F2F200F9F9F900F7F7F700F6F6F600FEFE
      FE00C7C7C700B9B9B900D3D3D300BEBEBE00B2B2B20088888800717171006969
      69006B6B6B0084848400E9E9E900F1F1F100EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F7F7F700F7F7
      F700FAFAFA00E9E9E900FCFCFC00000000000000000000000000F5F4F200E6E3
      DF00F7F4F300F4F2F000F3F1EF00F3F1EE00F3F1EE00F3F2F000F4F2F000F4F3
      F100F5F4F200F5F4F200F6F5F300F6F5F400F7F6F400F7F6F400F7F6F500F7F6
      F400F6F5F400F6F5F300F6F4F300F5F4F200F5F3F100F4F3F100F4F2F000F3F1
      EF00F2F1EE00F2F0ED00F1EEEC00F3F1EF00DFDBD600F4F3F100000000000000
      00000000000000000000F3F3F300E2E2E200F4F4F400F2F2F200F1F1F100F0F0
      F000F0F0F000F1F1F100F2F2F200F2F2F200F3F3F300F3F3F300F4F4F400F5F5
      F500F5F5F500F5F5F500F6F6F600F5F5F500F5F5F500F4F4F400F4F4F400F3F3
      F300F3F3F300F2F2F200F2F2F200F1F1F100F0F0F000EFEFEF00EEEEEE00F1F1
      F100DADADA00F2F2F20000000000000000000000000000000000F0F0F000F3F3
      F300FAFAFA00F8F8F800F7F8F700FFFEFF00B3D8C4009CDCC000BFF6E600A1E6
      D00091DEC30054C49A0037B2820031A777003BA6780057AE8100E8EBE400F5F0
      ED00F2EFEB00F2EFEB00F2EFEB00F2EFEB00F2EFEB00F2EFEB00F2EFEB00F2EF
      EB00F2EFEA00F3F0ED00F8F8F800F8F8F800FBFBFB00EAEAEA00FCFCFC000000
      00000000000000000000F0F0F000F3F3F300FAFAFA00F8F8F800F7F7F700FEFE
      FE00C5C5C500BDBDBD00DEDEDE00C7C7C700BBBBBB0090909000797979006F6F
      6F007373730082828200E7E7E700F0F0F000EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00F0F0F000F8F8F800F8F8
      F800FBFBFB00EAEAEA00FCFCFC00000000000000000000000000F9F9F800E4E0
      DC00F7F5F300F5F4F100F5F5F200F6F5F200F5F3F200F5F3F100F5F3F100F5F4
      F200F6F4F200F6F5F300F7F5F400F7F6F400F7F6F500F8F6F500F8F7F500F7F6
      F500F7F6F400F7F5F400F6F5F300F6F5F300F5F4F200F5F3F100F4F3F100F4F2
      F000F3F2EE00F3F1EE00F2F0EC00F4F2EE00DED9D400F9F9F800000000000000
      00000000000000000000F8F8F800E0E0E000F5F5F500F3F3F300F4F4F400F4F4
      F400F3F3F300F3F3F300F3F3F300F3F3F300F4F4F400F4F4F400F5F5F500F5F5
      F500F6F6F600F6F6F600F6F6F600F6F6F600F5F5F500F5F5F500F4F4F400F4F4
      F400F3F3F300F3F3F300F2F2F200F2F2F200F1F1F100F0F0F000EFEFEF00F1F1
      F100D9D9D900F8F8F80000000000000000000000000000000000F0F0F000F3F3
      F300FAFAFB00F8F8F900F8F8F900FFFBFF00D2E6DC0066BE950089D3B4007ECD
      AB0077C9A5005DBE940051B6890051B3870044AB7B0066B99100FEFDFF00FBFC
      FF00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFBFE00FAFB
      FE00FAFBFE00FAFBFD00F8F8F900F8F8F900FBFBFB00EAEAE900FCFCFC000000
      00000000000000000000F0F0F000F3F3F300FAFAFA00F8F8F800F8F8F800FDFD
      FD00DCDCDC0093939300B0B0B000A7A7A700A1A1A1008F8F8F00858585008383
      83007878780090909000FEFEFE00FCFCFC00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00F8F8F800F8F8
      F800FBFBFB00E9E9E900FCFCFC00000000000000000000000000FDFCFC00E3DF
      DB00F6F5F300F5F4F200F6F5F200F6F5F400F7F5F500F8F6F500F7F6F400F7F6
      F400F6F5F300F7F5F400F7F6F400F7F6F400F8F6F500F8F7F500F8F7F500F8F7
      F500F7F6F500F7F6F400F7F5F400F6F5F300F6F4F300F5F4F200F5F3F100F4F3
      F000F4F2F000F3F1EF00F2F0ED00F2F1EE00DDD9D300FDFDFD00000000000000
      00000000000000000000FCFCFC00DFDFDF00F4F4F400F3F3F300F4F4F400F5F5
      F500F5F5F500F6F6F600F5F5F500F5F5F500F4F4F400F5F5F500F5F5F500F5F5
      F500F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F5F5F500F5F5F500F4F4
      F400F4F4F400F3F3F300F3F3F300F2F2F200F2F2F200F1F1F100EFEFEF00F0F0
      F000D8D8D800FDFDFD0000000000000000000000000000000000F0F0F000F3F3
      F300FAFAFB00F8F8F900F8F8F900F7F8F800FEFCFE00D8E5DB00C0D5C300C4D8
      C700C5D8C800C8D9CA00C9DACB00CADBCC00C8DACA00EAEAE400F4EDEB00F1EC
      E900F1ECE900F1ECE900F1ECE900F1ECE900F1ECE900F1ECE900F1ECE900F1EC
      E900F1ECE800F2EEEC00F8F8F900F8F8F900FBFBFB00EAEAE900FCFCFC000000
      00000000000000000000F0F0F000F3F3F300FAFAFA00F8F8F800F8F8F800F7F7
      F700FDFDFD00DDDDDD00C8C8C800CBCBCB00CCCCCC00CECECE00CFCFCF00D0D0
      D000CECECE00E8E8E800EEEEEE00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00EEEEEE00F8F8F800F8F8
      F800FBFBFB00E9E9E900FCFCFC0000000000000000000000000000000000E4E0
      DC00F4F3F100F6F5F200F6F5F400F7F5F400F7F6F500F8F7F500F8F7F500F8F8
      F600F8F8F600F8F7F600F8F7F600F8F7F600F8F7F500F8F7F500F8F7F500F8F7
      F500F7F6F500F7F6F400F7F6F400F6F5F400F6F5F300F5F4F200F5F4F200F4F3
      F100F4F3F100F3F2F000F4F2EF00F0EEEB00DFDBD70000000000000000000000
      0000000000000000000000000000E0E0E000F2F2F200F4F4F400F5F5F500F5F5
      F500F6F6F600F6F6F600F6F6F600F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F5F5F500F5F5F500F5F5
      F500F4F4F400F3F3F300F3F3F300F2F2F200F2F2F200F1F1F100F1F1F100EDED
      ED00DBDBDB000000000000000000000000000000000000000000F0F0F000F3F3
      F300FBFBFC00F9F9FA00F9F9FA00F9F9FA00F8F9FA00FEFAFB00FFF9FB00FFF9
      FB00FFF9FB00FFF9FB00FFF9FB00FFF9FB00FFF9FB00F9F6F600F5F4F300F6F4
      F300F6F4F300F6F4F300F6F4F300F6F4F300F6F4F300F6F4F300F6F4F300F6F4
      F300F6F4F300F6F5F400F9F9FA00F9F9FA00FBFBFC00E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F3F3F300FBFBFB00F9F9F900F9F9F900F9F9
      F900F9F9F900FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00F7F7F700F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F5F5F500F9F9F900F9F9
      F900FBFBFB00E9E9E900FCFCFC0000000000000000000000000000000000E6E3
      E000F1F0ED00F8F6F500F7F6F400F7F6F500F8F7F500F8F7F500F8F8F600F8F8
      F600F9F8F700F9F8F700F9F8F800F9F9F800FAF9F800F9F9F700F9F8F700F9F8
      F600F8F7F600F8F7F500F7F6F400F7F6F400F6F5F300F6F4F300F5F4F200F5F3
      F200F4F3F100F4F2F000F5F3F200EDEBE800E3DFDB0000000000FFFEFE000000
      0000000000000000000000000000E3E3E300EFEFEF00F6F6F600F5F5F500F6F6
      F600F6F6F600F6F6F600F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8
      F800F9F9F900F8F8F800F8F8F800F7F7F700F7F7F700F6F6F600F5F5F500F5F5
      F500F4F4F400F4F4F400F3F3F300F3F3F300F2F2F200F2F2F200F3F3F300EAEA
      EA00DFDFDF0000000000FEFEFE00000000000000000000000000F0F0F000F3F3
      F300FBFBFC00F9F9FA00F9F9FA00F9F9FA00F9F9FA00F9FAFB00F9FAFB00F9FA
      FB00F9FAFB00F9FAFB00F9FAFB00F9FAFB00F9FAFB00FAFAFB00FAFAFB00FAFA
      FB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFA
      FB00FAFAFB00FAFAFB00F9F9FA00F9F9FA00FBFBFC00E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F3F3F300FBFBFB00F9F9F900F9F9F900F9F9
      F900F9F9F900FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00F9F9F900F9F9
      F900FBFBFB00E9E9E900FCFCFC000000000000000000FFFFFE0000000000ECE9
      E600EFECE900F9F7F600F7F6F500F8F6F500F8F7F500F8F7F600F8F8F600F9F8
      F700F9F8F700F9F8F800FAF8F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9
      F800FAF9F800FAF8F800F9F8F800F9F8F600F8F7F600F7F6F500F7F6F400F6F5
      F300F6F5F200F5F3F200F7F6F400EAE7E300E9E6E30000000000FFFEFE000000
      000000000000FEFEFE0000000000E9E9E900ECECEC00F7F7F700F6F6F600F6F6
      F600F6F6F600F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8F800F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8F800F8F8F800F7F7
      F700F7F7F700F6F6F600F5F5F500F4F4F400F4F4F400F3F3F300F5F5F500E6E6
      E600E6E6E60000000000FEFEFE00000000000000000000000000F0F0F000F3F3
      F300FCFCFC00FAFAFA00FAFAFA00FAFAFA00FBFBFB00F5F2F000F0EBE600F1EC
      E700F1ECE700F1ECE700F1ECE700F1ECE700F1ECE700F1ECE700F1ECE700F1EC
      E700F1ECE700F1ECE700F1ECE700F1ECE700F1ECE700F1ECE700F1ECE700F1EC
      E700F1EBE600F2EEEA00FAFAFA00FAFAFA00FCFCFC00E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F3F3F300FCFCFC00FAFAFA00FAFAFA00FAFA
      FA00FBFBFB00F2F2F200EBEBEB00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00EBEBEB00EEEEEE00FAFAFA00FAFA
      FA00FCFCFC00E9E9E900FCFCFC0000000000000000000000000000000000F0ED
      EB00EBE8E500FAF9F800F8F6F500F8F7F500F8F7F600F8F8F600F9F8F700F9F8
      F700F9F8F800F9F8F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9
      F800FAF9F800FAF9F800FAF8F800F9F8F800F9F8F700F9F8F700F8F8F600F8F8
      F600F8F7F500F8F6F400FBFAF900E8E5E200EDEBE90000000000000000000000
      0000000000000000000000000000EDEDED00E8E8E800F9F9F900F6F6F600F6F6
      F600F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8F800F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8F800F8F8
      F800F8F8F800F8F8F800F7F7F700F7F7F700F6F6F600F6F6F600FAFAFA00E5E5
      E500EBEBEB000000000000000000000000000000000000000000F0F0F000F3F3
      F300FCFCFD00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFA
      FB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFA
      FB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FAFA
      FB00FAFAFB00FAFAFB00FAFAFB00FAFAFB00FCFCFD00E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F3F3F300FCFCFC00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FCFCFC00E9E9E900FCFCFC0000000000000000000000000000000000F5F3
      F200E8E5E200FBF9F800F8F7F400F8F7F600F8F8F600F8F8F700F9F8F700F9F8
      F700F9F8F800F9F9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9
      F800FAF9F800FAF9F800FAF9F800F9F8F800F9F8F800F9F8F700F9F8F700F8F8
      F600F8F7F600F8F7F500FBFAF900E4E1DD00F4F2F10000000000000000000000
      0000000000000000000000000000F3F3F300E5E5E500F9F9F900F6F6F600F7F7
      F700F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8F800F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8
      F800F8F8F800F8F8F800F8F8F800F7F7F700F7F7F700F6F6F600FAFAFA00E0E0
      E000F2F2F2000000000000000000000000000000000000000000F0F0F000F3F3
      F300FDFDFD00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FAF9F900F9F8F700F9F8
      F700F9F8F700F9F8F700F9F8F700F9F8F700F9F8F700F9F8F700F9F8F700F9F8
      F700F9F8F700F9F8F700F9F8F700F9F8F700F9F8F700F9F8F700F9F8F700F9F8
      F700F9F8F700F9F8F800FBFBFB00FBFBFB00FDFDFD00E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F3F3F300FDFDFD00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00F9F9F900F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800FBFBFB00FBFB
      FB00FDFDFD00E9E9E900FCFCFC0000000000000000000000000000000000F9F8
      F700E5E2DE00FAF9F800F8F7F500F8F8F600F8F8F700F9F8F700F9F8F700F9F8
      F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9
      F800FAF9F800FAF9F800FAF9F800FAF9F800F9F8F800F9F8F800F9F8F700F8F8
      F700F8F8F600F8F8F600FAFAF800E2DEDA00F8F7F60000000000000000000000
      0000000000000000000000000000F8F8F800E1E1E100F9F9F900F6F6F600F7F7
      F700F7F7F700F8F8F800F8F8F800F8F8F800F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900F8F8F800F8F8F800F8F8F800F7F7F700F7F7F700F7F7F700F9F9F900DEDE
      DE00F7F7F7000000000000000000000000000000000000000000F0F0F000F3F3
      F300FDFDFD00FBFBFB00FBFBFB00FBFBFB00FCFCFC00F6F3F100F1ECE800F2ED
      E900F2EDE900F2EDE900F2EDE900F2EDE900F2EDE900F2EDE900F2EDE900F2ED
      E900F2EDE900F2EDE900F2EDE900F2EDE900F2EDE900F2EDE900F2EDE900F2ED
      E900F2ECE800F3EFEC00FBFBFB00FBFBFB00FDFDFD00E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F3F3F300FDFDFD00FBFBFB00FBFBFB00FBFB
      FB00FCFCFC00F3F3F300ECECEC00EDEDED00EDEDED00EDEDED00EDEDED00EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00ECECEC00EFEFEF00FBFBFB00FBFB
      FB00FDFDFD00E9E9E900FCFCFC0000000000000000000000000000000000FDFD
      FC00E5E1DE00F9F8F600F8F8F600F8F8F700F9F8F700F9F8F800F9F8F800F9F8
      F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9
      F800FAF9F800FAF9F800FAF9F800FAF9F800FAF8F800F9F8F800F9F8F800F9F8
      F700F8F8F700F8F8F700F8F8F600E1DCD800FDFDFD0000000000000000000000
      0000000000000000000000000000FCFCFC00E1E1E100F7F7F700F7F7F700F7F7
      F700F8F8F800F8F8F800F8F8F800F8F8F800F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900F8F8F800F8F8F800F8F8F800F8F8F800F7F7F700F7F7F700F7F7F700DCDC
      DC00FDFDFD000000000000000000000000000000000000000000F0F0F000F3F3
      F300FDFDFE00FBFBFC00FBFBFC00FBFBFC00FBFBFC00FCFCFD00FCFDFE00FCFD
      FE00FCFDFE00FCFDFE00FCFDFE00FCFDFE00FCFDFE00FCFDFE00FCFDFE00FCFD
      FE00FCFDFE00FCFDFE00FCFDFE00FCFDFE00FCFDFE00FCFDFE00FCFDFE00FCFD
      FE00FCFDFE00FCFDFE00FBFBFC00FBFBFC00FDFDFE00E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F3F3F300FDFDFD00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FCFCFC00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FBFBFB00FBFB
      FB00FDFDFD00E9E9E900FCFCFC00000000000000000000000000000000000000
      0000E4E0DC00F9F9F800FCFCFB00FCFBFB00FCFBFB00FCFCFB00FDFCFC00FDFC
      FC00FDFCFC00FDFCFC00FDFCFC00FDFDFC00FDFDFC00FEFDFC00FEFDFC00FDFD
      FC00FDFDFC00FDFDFC00FDFCFC00FDFCFC00FDFCFC00FDFCFC00FDFCFB00FCFB
      FB00FCFBFB00FCFCFB00F9F8F700E0DCD8000000000000000000000000000000
      000000000000000000000000000000000000E0E0E000F8F8F800FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FDFDFD00FDFDFD00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FBFBFB00FBFBFB00FBFBFB00F8F8F800DCDC
      DC00000000000000000000000000000000000000000000000000F0F0F000F3F3
      F300FEFEFE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FEFEFE00E9E9E900FCFCFC000000
      00000000000000000000F0F0F000F3F3F300FEFEFE00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FEFEFE00E9E9E900FCFCFC00000000000000000000000000000000000000
      0000E9E6E300E4E0DC00EBE9E500EAE8E400EAE8E400EAE8E400EAE8E500EAE8
      E500EAE8E500EBE8E500EBE8E500EBE8E500EBE8E500EBE8E500EBE8E500EBE8
      E500EBE8E500EBE8E500EBE8E500EBE8E500EAE8E500EAE8E500EAE8E400EAE8
      E400EAE8E400EBE9E600E2DEDA00E7E4E0000000000000000000000000000000
      000000000000000000000000000000000000E6E6E600E0E0E000E8E8E800E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E8E8E800DEDEDE00E3E3
      E300000000000000000000000000000000000000000000000000EFEFEF00F4F4
      F400FEFEFE00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FEFEFE00E9E9E900FBFBFB000000
      00000000000000000000EFEFEF00F4F4F400FEFEFE00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FEFEFE00E9E9E900FBFBFB00000000000000000000000000000000000000
      0000FEFDFD00F0EEEC00ECEAE800EDEBE900EDEBE900EDEBE900EDEBE900EDEB
      E900EDEBE900EDEBE900EDEBE900EDEBE900EDEBE900EDEBE900EDEBE900EDEB
      E900EDEBE900EDEBE900EDEBE900EDEBE900EDEBE900EDEBE900EDEBE900EDEB
      E900EDEBE900ECEAE800F0EEEC00FEFEFD000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00EEEEEE00EAEAEA00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EAEAEA00EEEEEE00FDFD
      FD00000000000000000000000000000000000000000000000000EFEFEF00F3F3
      F300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E8E800FCFCFC000000
      00000000000000000000EFEFEF00F3F3F3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E8E8E800FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F9F900E6E6
      E600ECECEC00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00E9E9E900ECECEC00000000000000
      00000000000000000000F9F9F900E6E6E600ECECEC00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00E9E9E900ECECEC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FB00F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F7F7F700FEFEFE00000000000000
      0000000000000000000000000000FBFBFB00F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F7F7F700FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FDFEFD00FCFDFC00FCFDFC00FCFD
      FC00FDFDFD00FDFEFD00FEFEFE00000000000000000000000000FEFEFE00F7FA
      F700F2F6F200F6F9F600FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FDFDFD00FCFCFC00FCFCFC00FCFCFC00FDFDFD00FDFDFD00FEFEFE000000
      00000000000000000000FEFEFE00F8F8F800F3F3F300F7F7F700FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFDFC00F7FA
      F700F1F6F100EBF2EB00E5EFE600E0EBE100DCE9DE00D9E7DB00D8E6DA00D7E6
      D900D9E7DA00DBE8DD00DEEBE000E3EEE500E9F1EA00ECF3ED00E2EDE300CBDF
      CE00BED7C100D1E2D300F0F5F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC00F8F8F800F2F2F200EDEDED00E8E8E800E4E4
      E400E1E1E100DEDEDE00DDDDDD00DCDCDC00DEDEDE00E0E0E000E3E3E300E7E7
      E700ECECEC00EEEEEE00E6E6E600D2D2D200C7C7C700D7D7D700F1F1F1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFDFC00F4F8F400E8F0E900DBE8DD00CFE1
      D100C4DAC700BBD5BE00B3D0B700ADCDB200A9CAAE00A7C8AC00A5C7AA00A4C7
      A900A4C7A900A7C8AC00AACAAF00AFCDB300B5D1BA00B8D3BC00ACCCB00096BF
      9D008DB99400A6C8AB00D6E5D800F9FBF9000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00F5F5F500EBEBEB00E0E0E000D5D5D500CCCCCC00C4C4C400BEBEBE00B9B9
      B900B5B5B500B3B3B300B2B2B200B1B1B100B1B1B100B3B3B300B6B6B600BABA
      BA00C0C0C000C2C2C200B8B8B800A6A6A6009E9E9E00B3B3B300DBDBDB00F9F9
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F4F8F400DAE8DC00C0D8C300B0CEB400A7C9
      AC00A2C6A700A1C5A600A2C5A700A3C7A800A4C7AA00A5C7AA00A4C7A900A0C4
      A6009AC1A00093BC99008EBA95008DB994008FB995008EBA95008AB7910089B4
      8E008DB3900092BA9700B7D3BB00E8F0E900FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F5F5
      F500DFDFDF00C9C9C900BBBBBB00B4B4B400AFAFAF00AEAEAE00AFAFAF00B0B0
      B000B1B1B100B2B2B200B1B1B100AEAEAE00A9A9A900A2A2A2009F9F9F009E9E
      9E009F9F9F009F9F9F009B9B9B00999999009A9A9A00A1A1A100C1C1C100EBEB
      EB00FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F4F8F500DAE8DC00BFD8C300B3D0B800B5D1
      B900BCD5C000C3DAC600CADECC00D3E2D500DDE7DE00E2EAE300E3EBE300D9E5
      DA00C1D6C400A3C5A70090BB97008DB994008DB993008BB8920091B8950073BB
      870032B4610079B78900AAC8AD00D6E5D800F9FAF90000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F5F5
      F500DFDFDF00C8C8C800BEBEBE00BFBFBF00C5C5C500CBCBCB00D1D1D100D8D8
      D800E0E0E000E5E5E500E5E5E500DDDDDD00C9C9C900AFAFAF00A0A0A0009E9E
      9E009D9D9D009C9C9C009F9F9F00919191006D6D6D0093939300B5B5B500DBDB
      DB00F9F9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFE
      FE00FFF9F700FFF9F700F3F2F200FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FAFAFA00FAFAFA00F2F2F200FCFC
      FC0000000000000000000000000000000000000000000000000000000000FEFE
      FE00FCFDFC00FBFCFB00F9FBF900F4F8F400E7F0E800D7E6D900CDE0D000CEE1
      D100D3E3D500DCE5DC00E8EDE800ECF6ED00E1F4E400D0EBD500C5E5CB00C0E1
      C700B6D7BC00AECDB200B1CBB400B1CCB500ABCAAF00AACAAE00B6CEB70031D7
      790004C6540056AA6E00CADCCB00E0ECE200FAFBFA0000000000000000000000
      0000000000000000000000000000FEFEFE00FCFCFC00FBFBFB00F9F9F900F5F5
      F500EAEAEA00DCDCDC00D4D4D400D5D5D500D9D9D900DFDFDF00E9E9E900EFEF
      EF00E8E8E800DADADA00D1D1D100CDCDCD00C3C3C300B9B9B900BABABA00BBBB
      BB00B6B6B600B6B6B600BEBEBE00808080005F5F5F007A7A7A00D0D0D000E4E4
      E400FAFAFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFD00BFDD
      EA007AC6E20080BEDC0087B8DD00F1F0F0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00D7D7D700B6B6B600B3B3B300B4B4B400F0F0
      F000000000000000000000000000000000000000000000000000FDFEFD00F3F7
      F300E6EFE700DEEADF00DAE8DC00D5E5D800D1E2D300CADECD00C6DBC900CAD8
      C900BFDAC50097D6A6005ECA750029B646000BAC2E0000A9270000A8250000A9
      270008AB2F001AAE3C0043B55C007DC08900AFCEB300D7DED5009DD3AE0004E4
      700020C458001B953100E3EFE700FDFCFC00FDFEFD0000000000000000000000
      00000000000000000000FDFDFD00F4F4F400E9E9E900E2E2E200DFDFDF00DBDB
      DB00D7D7D700D1D1D100CECECE00CECECE00CACACA00B1B1B100898989006161
      61004C4C4C004545450044444400454545004B4B4B0056565600717171009797
      9700BABABA00D8D8D800B4B4B40072727200696969004B4B4B00E8E8E800FCFC
      FC00FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C5DFEE0053C4
      F10056C8F7004FBAF4005EA9E200F3EFEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DBDBDB00ADADAD00B1B1B100A9A9A900A3A3A300F0F0
      F000000000000000000000000000000000000000000000000000FCFDFC00EAF2
      EB00CFE1D200BED7C200B9D4BD00B6D2BA00B2D0B700B3CEB600B4CEB80080D5
      A10031BF590003A6260000AB220000B62C0000BB300000BD300001BD320001BC
      320000B9300000B42C0000AE260000A822000EA22C005EB26A002DA352001AD3
      6B0010A2290000961300ABDCB600000000000000000000000000000000000000
      00000000000000000000FCFCFC00EDEDED00D6D6D600C7C7C700C3C3C300C0C0
      C000BDBDBD00BDBDBD00BEBEBE00A7A7A7006D6D6D0045454500444444004B4B
      4B004E4E4E004F4F4F00505050004F4F4F004D4D4D004A4A4A00464646004343
      4300494949007E7E7E0060606000727272004949490038383800BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFE00FFFFF90094CCEB0050B9
      F4005DC1F20048A9EE00579EDC00F2EFEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FDFDFD00C3C3C300A9A9A900B0B0B0009F9F9F009B9B9B00EFEF
      EF00000000000000000000000000000000000000000000000000FEFEFE00F1F6
      F200D7E6D800BDD6C000B2D0B600B0CEB400B4CEB700B1CFB70052CF85000AA9
      35000097180000AC270002B82F0002BE320003C3380003C83C0003C93A0003C7
      350002C3320003BE310003B9310003B22E0000A62300009C1500029C1B0018B0
      3B0001A31D0000AA1E0057C57000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F3F3F300DCDCDC00C6C6C600BDBDBD00BBBB
      BB00BDBDBD00BDBDBD008C8C8C004D4D4D003A3A3A00464646004D4D4D005050
      50005454540057575700575757005555550052525200505050004F4F4F004B4B
      4B00434343003B3B3B003D3D3D00565656004040400042424200848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFE00C1D4E90087AFDE006AA9E4005AC4
      F30051B2EE003E98EB005BA8E300F6F3F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00D4D4D400B1B1B100A7A7A700B0B0B000A5A5A50095959500A2A2A200F3F3
      F30000000000000000000000000000000000000000000000000000000000FDFD
      FD00EDF4EE00D2E3D400BCD6C000BBD3BD00BED8C30046C87A00009A27000095
      1A0000A9250001B1280002BB2E0003C93D0003D4490003D84C0003D7460003D2
      3C0003CB360003C1320003B82D0003AA2700039E210001971C0001961900009B
      190001A6220000AE26001AB74200F1F8F3000000000000000000000000000000
      0000000000000000000000000000FDFDFD00EFEFEF00D8D8D800C6C6C600C3C3
      C300C8C8C80082828200404040003A3A3A0044444400484848004E4E4E005858
      58006060600062626200606060005B5B5B0056565600525252004D4D4D004646
      4600404040003C3C3C003A3A3A003C3C3C0043434300464646005B5B5B00F4F4
      F400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7ECF100417FE8003C84EF0054BCF10057B8
      EF0052A8EE0058BEED00C6DCE900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ECEC
      EC008D8D8D008F8F8F00ABABAB00AAAAAA00A2A2A200ABABAB00D9D9D9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFCFB00E9F1EA00D6E5D800D9E4D9005FD18F0006A633001EAA3C001AB7
      410007B6310000BE2F0002CE410004DA4F0004DD510003DB4D0004D6440004CF
      3B0003C7360003BE310003B22C0003A3230002961C000191190001941A00029A
      1E0002A2230002AF2A0000B82E00B1E3C0000000000000000000000000000000
      000000000000000000000000000000000000FBFBFB00ECECEC00DBDBDB00DCDC
      DC00959595004A4A4A00565656005B5B5B004F4F4F004F4F4F005B5B5B006464
      640066666600636363005F5F5F005A5A5A0055555500505050004B4B4B004343
      43003C3C3C00393939003A3A3A003E3E3E0042424200494949004C4C4C00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFD00CAD6E80083A3DD004481EC0055B8F00057B4EF0052A1
      ED0058C1EE00C8DDE900FFFFFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00D8D8D800ABAB
      AB0090909000A9A9A900A8A8A800A0A0A000ADADAD00DADADA00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FAFCFA00FCF8FA00B8F1C60016B33D0033B04C0039BE590035C3
      570030CC590019D7580003DF530000DF500001DB490000D33B0000CC310000C7
      300002C3340004BD320003B02A0002A4220001A01E0002A11E0002A3200003A9
      250004B22B0004BD330000C532005ED081000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00FAFAFA00CFCF
      CF005757570065656500707070006F6F6F00717171006D6D6D00676767006565
      6500616161005A5A5A0054545400525252005353530051515100494949004242
      42003F3F3F004040400041414100454545004B4B4B0051515100525252008F8F
      8F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFD00B9D5E800308EEC002C87EF0041B5F00042AFEF003D98EC004ABC
      ED00C7DDE800FFFFFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00D2D2D2008E8E8E008B8B
      8B00A2A2A200A0A0A00095959500A6A6A600D9D9D900FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DAF7E3001EB73F0041B5560057C871004ECF
      6D004CDE7A004DEA87003BE678000DD34C0005C63C0020C34A002AC2500018BC
      420001B1260000A81E0002A32300019E1F0001A01E0002A6200002AE250004B6
      2C0002BD320003C73A0006D3450027CF5E00F2F8F50000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E6E6
      E6005C5C5C006E6E6E0085858500838383008C8C8C0094949400888888006464
      64005757570064646400696969005C5C5C004848480042424200424242003F3F
      3F003F3F3F0042424200474747004C4C4C0050505000565656005F5F5F007171
      7100F5F5F5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FD00BAD7E8002999EE002794F10033B1EF0035A9EE00308FEA003AB0EA00C0DB
      E800FFFFFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00D3D3D300909090008E8E8E009B9B
      9B00999999008D8D8D009C9C9C00D6D6D600FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008CE3AB000EAD340073CF850071E0
      8F006CEB97004DDC790050D3750091DFA700D6F3DF00F8FCFA00FEFEFF00F3FB
      F600B7E9C6003DB55800008F1200008E150000901500009C1A0000AA220000B7
      2C000AC53D001ED4540023DF610017D95F00BAE9CC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B3B3B3004F4F4F0097979700A0A0A000A4A4A4008B8B8B0088888800B2B2
      B200E2E2E200FAFAFA00FEFEFE00F6F6F600CCCCCC006E6E6E00353535003636
      3600373737003C3C3C00444444004B4B4B00595959006C6C6C00767676006F6F
      6F00CFCFCF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFE00FFFFFD00000000000000000000000000FFFFFD00BAD8
      E9002EA1EF002798F00031A6ED00339FEB002F8AE80038A4E800C1D9E800FFFF
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FEFEFE000000
      00000000000000000000FEFEFE00D3D3D300949494008F8F8F00969696009494
      94008B8B8B0096969600D6D6D600FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFFFF0037BD63003AB2530086E0
      9D0054D1750098E2AD00F4FCF700000000000000000000000000000000000000
      0000000000000000000067C57E00099921001DA635001DAD3A0027BA470036CA
      5C0040D76C003FDF72003AE678002DE87A0075DDA00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00727272006A6A6A00ABABAB0088888800B7B7B700F7F7F7000000
      00000000000000000000000000000000000000000000000000008E8E8E004141
      4100525252005656560062626200747474008181810085858500888888008585
      8500A6A6A6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFD00F0EF
      EF00D0DDE500BED5E300BED6E300CDDBE300E7E7E800FAF2EF00BBDAE80030AA
      EF00299EF0002F9EEB003097E9002D86E7003498E600C0D7E700FFFFFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00EFEFEF00DBDBDB00D2D2D200D2D2D200D9D9
      D900E7E7E700F3F3F300D4D4D400989898009292920092929200909090008888
      880090909000D4D4D400FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6F2E10013A13C005DC4
      7600DBF6E5000000000000000000000000000000000000000000000000000000
      000000000000FBFDFC0036CE780027C2590068CA79006FD2850069D7850064DC
      85005EE1860059E78B005AEF970057F5A00054DE8C00EFF6F200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E3E3E3005050500087878700E7E7E70000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC007E7E7E006B6B
      6B008E8E8E009797970097979700979797009797970099999900A0A0A000A4A4
      A40094949400F2F2F20000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F4F200A9CAE1006FB9
      EA0066BFF5006DC9F90075D0FB007FD1FA0070C1EB0051B5E30033ADEB002AA5
      EF002D99EA002F92E8002B85E500318EE400BED4E700FFFFFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F4F4F400C6C6C600B0B0B000B3B3B300BABABA00C0C0C000C3C3
      C300B4B4B400A3A3A3009999990094949400909090008D8D8D00878787008B8B
      8B00D3D3D300FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAF7EF00F5FC
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000009FE8BD0000CE590031C05E0085D4930089DC9D0084E19D0085E9
      A30084EEA80079EEA60062E6950049D8780035C05B00DCF0E300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0F0F000F8F8F8000000000000000000000000000000
      00000000000000000000000000000000000000000000C1C1C100626262006F6F
      6F00A4A4A400ABABAB00ABABAB00B0B0B000B3B3B300AFAFAF009F9F9F008888
      880070707000E5E5E50000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEEEE0076B4E3004AAFF5005ABF
      F7005FC9F70063D1F80068D7FA0072D9FB007CD4FD0057C4F80031ABEE002D9C
      E9002E93E7002987E4002D87E300BCD2E600FFFFFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EDEDED00AFAFAF00A4A4A400B0B0B000B5B5B500B9B9B900BDBDBD00C2C2
      C200C4C4C400B1B1B10098989800909090008D8D8D008686860087878700D1D1
      D100FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFF9F100DDF5E4000000000000000000000000000000
      0000F5F4F20022BD60000CD867007ECC8B00B8E8C200A9E7B90098E6AD007BDF
      970060D27F005ACA750071CA8400A0D8AB00D3EBD700FEFFFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F3F3F300E7E7
      E70000000000000000000000000000000000F3F3F3006A6A6A006E6E6E009C9C
      9C00CBCBCB00C3C3C300B9B9B900A5A5A500909090008888880095959500B6B6
      B600DCDCDC00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000FAF7F40074B3E3003CA7F5004DB2EE0050C2
      F40055C8F50053CBF60058D4F8005BD5F90062D2FA0077D6FB005FBEF50037A1
      EB002B8FE4002C89E300BBD1E600FFFFFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F700AEAEAE009D9D9D00A4A4A400ACACAC00B0B0B000B1B1B100B6B6B600B8B8
      B800BABABA00C2C2C200B0B0B000969696008A8A8A0088888800D0D0D000FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E8F4
      EA00AAE0B7005AC3730021AF3E001EC35E00B7EDCF0000000000000000000000
      0000DBE4DA000188280048CE7300B8E3BE00A0DEAD008AD59A008CD59C00AEE0
      B800D7EEDC00F7FAF70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ECECEC00C0C0C000858585005A5A5A006A6A
      6A00D1D1D100000000000000000000000000DDDDDD003B3B3B0083838300C8C8
      C800B9B9B900A8A8A800A9A9A900C2C2C200E0E0E000F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B0CFE6003CA6F3005EACE400C3D4E00073CF
      F00071DEFA0061CFF60051CFF7005AD2F8005CCBF8005ED1FA0076D5FB005FBA
      F400419EE500B8D0E500FFFFFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CCCC
      CC009C9C9C00A4A4A400D2D2D200BBBBBB00C3C3C300B7B7B700B2B2B200B6B6
      B600B5B5B500B8B8B800C2C2C200AFAFAF0096969600CFCFCF00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFCFB00D5ECD90094D8A4004AC56A0015B7
      420000AE2D0000A320001CB8470000C756007ED8A10000000000000000000000
      000000000000A6D3B00096D6A200CEEBD300DFF2E300F7FBF800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FB00DEDEDE00B0B0B0007D7D7D005A5A5A0049494900414141005E5E5E005F5F
      5F00A7A7A70000000000000000000000000000000000B8B8B800AFAFAF00D9D9
      D900E6E6E600F8F8F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9F7F6006EB9EC0040A6EF00C0D1DE0000000000DDE8
      EF007DDBF1008AEDFD006AD6F7004FCCF6005AC5F6005CCAF70061D1F90079D0
      FC0083C2E900F3EEEA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F7F700B1B1
      B1009C9C9C00CFCFCF0000000000E6E6E600C3C3C300D1D1D100BDBDBD00B0B0
      B000B1B1B100B4B4B400B9B9B900C1C1C100BABABA00EEEEEE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F9F300C0E3C6007CCC8E003ABC5C000DBA400000BC390000BE3A0003BB
      3A0004B4350008A72A001FCF66000DD06500E2F3E80000000000000000000000
      0000000000000000000000000000000000000000000000000000CAEBD500E5F6
      EC00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F500CDCDCD009C9C9C007070
      7000575757005151510052525200525252004F4F4F0048484800717171006B6B
      6B00E9E9E9000000000000000000000000000000000000000000000000000000
      00000000000000000000D8D8D800EDEDED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEE9F00056B7F40062ADE100F7F2EF00000000000000
      0000DFEBF1008BE7F4009BF6FF006FD3F7004FBCF30059C5F50059CAF7006FD0
      FA007BC7F500D3DCE20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E700ABAB
      AB00A5A5A500F2F2F2000000000000000000E9E9E900CCCCCC00DADADA00BDBD
      BD00AAAAAA00B1B1B100B3B3B300BDBDBD00BDBDBD00DBDBDB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007FD098000CB73C0005BF400001C4420005C7460005C5440004C13F0005BD
      3B0002B8330016B03A0007B24C005CE299000000000000000000000000000000
      0000000000000000000000000000000000000000000084D29A000084100038B8
      6200FAFFFE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A2A2A20055555500565656005757
      57005B5B5B005A5A5A0056565600545454004F4F4F0055555500575757009D9D
      9D00000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A5003131310070707000FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CFE3F00052BBF7007DB7DC00FFFBF700000000000000
      000000000000E1EDF1008DECF60094EEFD0067C2F30050BCF30056C4F50064CA
      F80070C2F700C4D5E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E0E0E000ACAC
      AC00B0B0B000FBFBFB00000000000000000000000000EAEAEA00CFCFCF00D5D5
      D500B4B4B400AAAAAA00AFAFAF00B7B7B700B8B8B800D3D3D300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A1DEBD0023C95D001ECE5A0006C9490004CC470005CB460005C7410006C1
      3C0005B8350006AD2D001AAA4100C9EFD9000000000000000000000000000000
      0000000000000000000000000000DCF6E60047BB6700008D150000881A00008F
      18006BD691000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEBEBE006D6D6D006C6C6C005D5D
      5D005D5D5D005C5C5C005959590056565600505050004A4A4A0057575700DBDB
      DB0000000000000000000000000000000000000000000000000000000000E8E8
      E800787878003636360036363600373737009B9B9B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D2E5F0005BC3FA007CB9DC00FFF9F600000000000000
      00000000000000000000E2EEF10082E3F4007BD8F8005CBCF10051BCF2005EC4
      F60067BBF400C6D6E10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2E2E200B2B2
      B200B0B0B000FAFAFA0000000000000000000000000000000000EBEBEB00C8C8
      C800C3C3C300ADADAD00AAAAAA00B2B2B200B2B2B200D4D4D400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EBF6F2004ACC7A0039D36C0021D35E0003D34B0005D34A0006CC420005C0
      380006B2300004A62900009A1E0048B96300CCF1D80000000000000000000000
      000000000000DAF5E40073D391000BA732000096190001952200028C1E000180
      160000961F00A5DFBA0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1F1F100858585007D7D7D007070
      700060606000606060005C5C5C00545454004D4D4D00464646003D3D3D007676
      7600DCDCDC0000000000000000000000000000000000E6E6E6009D9D9D004C4C
      4C003A3A3A003D3D3D0039393900323232003C3C3C00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E3EDF3006ECEFA0063B9E400EEEAE800000000000000
      0000000000000000000000000000DFEBF00073CDEE005FC6F40050B8F0005ABD
      F50062B4EF00DAE1E60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EBEBEB00BCBC
      BC00AAAAAA00EAEAEA000000000000000000000000000000000000000000E8E8
      E800BABABA00B3B3B300A8A8A800AEAEAE00ACACAC00E0E0E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000085D8A70050D77D0046DB790022DC640001D84B0006D2460007C6
      3D0007B8330006AA2C0005A22800009D1D0004A5290031BB570057C7770057C5
      760034BA590008AC340000A5230001A6280002A32800029B2400039220000387
      1C0000820F00129F3A00E4F8ED00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ACACAC008C8C8C008888
      880076767600616161005F5F5F00585858005050500049494900454545003E3E
      3E00464646006B6B6B0087878700868686006D6D6D004D4D4D00424242004545
      450044444400404040003C3C3C0037373700303030004E4E4E00EDEDED000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAF8F80093D9F50055C8F700B0C8D400FFFFFD000000
      000000000000000000000000000000000000DEE9F0006CC1EC004BB3EF004FB1
      F50075B4E500F9F5F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F8F8F800CBCB
      CB00B1B1B100C4C4C400FEFEFE00000000000000000000000000000000000000
      0000E7E7E700B3B3B300A4A4A400A7A7A700AFAFAF00F5F5F500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CAECD90068D88E0065E08E0052E2840020DC600000D1430007C8
      400007BD370007B3310006AE2E0006B0300002B4320000B02A0000AE270000AE
      260000AF270000B22D0002B22E0002B02D0003AC2C0004A62800049D24000391
      1E00008B15003EBC6600F5FEF900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DADADA009A9A9A009B9B
      9B0092929200747474005C5C5C005A5A5A00535353004E4E4E004B4B4B004C4C
      4C004D4D4D00484848004747470046464600474747004A4A4A004B4B4B004A4A
      4A004949490046464600414141003B3B3B003535350075757500F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFE00CAE5F00070DAFF005CC3E800D3D6D900FFFE
      FC0000000000000000000000000000000000FFFFFC00B3CBDE0045A7EE0045A4
      EF00BAD0E1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00DFDF
      DF00C3C3C300ADADAD00D6D6D600FDFDFD000000000000000000000000000000
      0000FEFEFE00C9C9C9009E9E9E009D9D9D00CECECE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7FBF90083D9A30084E4A30070E395005DE185001ECE510000BC
      310007B3310007AD2D0007AA2B0005B2300005BD360004C1380004C2390003C3
      390003C3380002C2360002BE310003B82D0003B02A0004A72700049A22000089
      15001AB04600CEF6DB0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900AAAAAA00AEAE
      AE00A2A2A20096969600696969004F4F4F004E4E4E004B4B4B00494949004D4D
      4D00525252005454540055555500555555005454540053535300505050004D4D
      4D00494949004646460040404000343434005A5A5A00DFDFDF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDF9F800A9E0F20068DEFF005AC7EA00ADCB
      D600E9E6E600FAF2F000FCF3F200E8E7E800A3C0D90050A3E9003BA0F30087B7
      DF00FFFAF6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAFA
      FA00D3D3D300C1C1C100AEAEAE00C4C4C400E7E7E700F4F4F400F5F5F500E7E7
      E700BEBEBE009E9E9E009A9A9A00B4B4B400FAFAFA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B2E5C60099E6B20090E6AB007DE19A006EDB8B0024BF
      4A0000A7240005A2260005A4280006B32F0005C3360005C9390004CE3F0003D1
      450004D4490003D3470003CC3B0003BF2C0003B02600029D1F0000810F0015B0
      4200B7F7CC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9C9C900BBBB
      BB00B5B5B500A8A8A8009C9C9C00646464004343430044444400454545004D4D
      4D0054545400575757005B5B5B005D5D5D00606060005F5F5F00585858004F4F
      4F00484848003F3F3F003030300057575700D3D3D30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4F5F600ACE3F30074E2FF0059D9
      FB0061CDEB0071C9E30070CDE50055C0EB0042A3F2004BA9F20091BFE200F8F6
      F300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5F5F500D6D6D600C7C7C700B9B9B900B3B3B300B4B4B400B6B6B600AAAA
      AA009D9D9D00A2A2A200BBBBBB00F5F5F5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E0F4E800A3E6BA00B4EFC7009FE9B60076DB910073D6
      8B0035BC540001A5250004A8290005B6300005C4340004CD3B0004D6480004DC
      510004DE550004DC510004D2420004C3310001AA2200008C11002ABB4F00C0FD
      D300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9E9E900C1C1
      C100CECECE00BFBFBF00A0A0A0009C9C9C006C6C6C0043434300474747004E4E
      4E005454540059595900606060006565650067676700656565005D5D5D005252
      5200444444003434340066666600DADADA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFBFA00CFEBF2009BE5
      F7007AE3FC0069E1FD0063E0FD006AD4F80088C1EB00CBDCE800FFFCF9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB00E4E4E400D2D2D200C8C8C800C2C2C200C0C0C000BCBC
      BC00BCBCBC00DADADA00FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFEFD00AEE5C100CDF4DA00BCEEC90038CB690014B0
      400051BF67002AB1480000A6250001B52F0004C3360004CC3A0004D4450004DA
      4E0004DD520002D84A0000C8350000B01F0008AA280066D98000E5FFEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00C6C6
      C600DEDEDE00D1D1D10079797900565656007D7D7D0061616100434343004C4C
      4C0054545400585858005F5F5F00646464006666660061616100545454004545
      45004848480095959500F0F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFB
      FA00EBF3F500DDEEF300DDEEF200ECF1F300FEFCF90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFB00F1F1F100EAEAEA00E9E9E900F0F0
      F000FBFBFB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CCECD700D8F1DF00ADE9BF0003D6610058CC
      8600D9EBDB007DC88C0035B1500005AB2D0000AF260000B6240000BC280000BF
      2C0000BD2B0000B828001DB93E0066D47D00CFF9D90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DADA
      DA00E2E2E200C7C7C700686868008E8E8E00DFDFDF009B9B9B00676767004949
      490047474700484848004C4C4C004E4E4E004D4D4D004A4A4A005C5C5C009292
      9200E0E0E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0F9F400CFE9DA0064DD930000E96E00CDF6
      E0000000000000000000FEFEFE00DFF2E300B9E6C4009EDDAD0095D8A4009ADA
      A700AEE3B800D1F1D700F6FEF800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400DBDBDB009C9C9C0072727200E1E1E1000000000000000000FEFEFE00E6E6
      E600CBCBCB00B8B8B800B0B0B000B3B3B300C3C3C300DDDDDD00F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1DCC40004B2480042EE93000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C5C5C5005454540096969600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ECF5EF009DDCB500D1F8E3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0F0F000BABABA00E4E4E400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6E6E60084848400696969007C7C7C008383
      83009C9C9C00C0C0C000DEDEDE00EAEAEA00EDEDED00EBEBEB00E7E7E700E2E2
      E200DDDDDD00D9D9D900BFBFBF00959595008585850096969600ADADAD00A4A4
      A400B7B7B700F8F8F80000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E6E6
      E60084848400696969007C7C7C00838383009C9C9C00C0C0C000DEDEDE00EAEA
      EA00EDEDED00EBEBEB00E7E7E700E2E2E200DDDDDD00D9D9D900BFBFBF009595
      95008585850096969600ADADAD00A4A4A400B7B7B700F8F8F800000000000000
      000000000000000000000000000000000000F8F8F800D8D6D300D3D0CC00D4D2
      CE00D5D2CF00D5D3D000D5D4D100D6D5D200D7D5D300D7D6D400D8D7D500D9D8
      D600D9D9D700DAD9D900DADAD900DBDBDA00DBDBDB00DCDCDB00DBDBDB00DBDB
      DB00DBDADA00DADAD900DAD9D800D9D8D700D9D7D600D8D7D500D7D6D400D7D5
      D200D6D4D100D5D4D000D5D3CF00D4D2CE00D4D1CD00D2D0CB00DEDDDB00FEFE
      FE00F8F8F800D5D5D500CFCFCF00D1D1D100D2D2D200D2D2D200D3D3D300D4D4
      D400D5D5D500D5D5D500D6D6D600D7D7D700D8D8D800D9D9D900D9D9D900DADA
      DA00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DADADA00D9D9D900D9D9D900D8D8
      D800D7D7D700D6D6D600D5D5D500D4D4D400D3D3D300D3D3D300D2D2D200D1D1
      D100D0D0D000CFCFCF00DCDCDC00FEFEFE000000000000000000000000000000
      00000000000000000000D3D3D3007F7F7F005757570066666600A6A6A600E2E2
      E200FBFBFB00FCFCFC00FCF9FB00F9F3F800F3ECF100EDE5EA00E7DFE500E1D9
      DE00DBD4D900D5D0D300D0CFD000D0D0D000CFCFCF00BABABA00A2A2A200B5B5
      B500C9C9C900BDBDBD00F1F1F100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3D3D3007F7F
      7F005757570066666600A6A6A600E2E2E200FBFBFB00FCFCFC00FAFAFA00F6F6
      F600F0F0F000E9E9E900E3E3E300DDDDDD00D8D8D800D2D2D200CFCFCF00D0D0
      D000CFCFCF00BABABA00A2A2A200B5B5B500C9C9C900BDBDBD00F1F1F1000000
      000000000000000000000000000000000000E2E0DE00BEB6A900CAC4BA00CBC5
      BB00CCC7BD00CDC8BF00D0CBC300D6CEC900D9D0CC00D8D2CE00D5D3CE00D7D4
      D100D8D6D400DAD8D600DBDAD800DDDCDB00DDDDDD00DEDEDE00DEDEDE00DDDD
      DC00DCDBDA00DBD9D800D9D8D500D8D6D300D6D4D000D5D2CD00D3CFCA00D1CD
      C700D0CBC400CEC9C100CDC8BF00CBC6BC00CBC4BA00C8C1B500BDB7AC00F4F4
      F500E0E0E000B4B4B400C2C2C200C3C3C300C5C5C500C6C6C600CACACA00CFCF
      CF00D1D1D100D2D2D200D2D2D200D4D4D400D6D6D600D8D8D800D9D9D900DCDC
      DC00DDDDDD00DEDEDE00DEDEDE00DCDCDC00DBDBDB00D9D9D900D7D7D700D5D5
      D500D3D3D300D1D1D100CECECE00CCCCCC00CACACA00C8C8C800C6C6C600C4C4
      C400C3C3C300BFBFBF00B5B5B500F4F4F4000000000000000000000000000000
      000000000000CFCFCF00858585006868680081818100E2E2E200000000000000
      0000FFFCFF00F3EDF100CCD5CD009FBDA6007EAD8A006DA77C006AA47A006FA3
      7D0082A78B009DAFA000B9B9B800C8BFC500C1BBBF00B8B8B800C4C4C400BDBD
      BD00B7B7B700D0D0D000BFBFBF00F1F1F1000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00858585006868
      680081818100E2E2E2000000000000000000FEFEFE00F0F0F000CFCFCF00ABAB
      AB009191910085858500828282008585850091919100A4A4A400B8B8B800C4C4
      C400BEBEBE00B8B8B800C4C4C400BDBDBD00B7B7B700D0D0D000BFBFBF00F1F1
      F10000000000000000000000000000000000DFDDD900CECBC500000000000000
      00000000000000000000FDFDFE00E9F5F200E1F3EE00F1F7F600000000000000
      000000000000FEFFFF00FEFEFF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFF00FEFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F800C0BBB300F2F2
      F300DCDCDC00CACACA0000000000000000000000000000000000FDFDFD00F0F0
      F000EBEBEB00F4F4F400000000000000000000000000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800BABABA00F2F2F2000000000000000000000000000000
      0000DCDCDC008181810078787800B8B8B800FDFDFD0000000000FFFEFF00E5E6
      E40089B5930037974F00159739000DA139000FA83F0012AD450014AE470014AD
      480014A84500169F4300259548004D9261008C9E9000B4ADB100B4B0B300BEBE
      BE00CFCFCF00BFBFBF00CCCCCC00C2C2C200F9F9F90000000000000000000000
      000000000000000000000000000000000000DCDCDC008181810078787800B8B8
      B800FDFDFD0000000000FEFEFE00E5E5E5009B9B9B005F5F5F004C4C4C004D4D
      4D00525252005656560058585800585858005555550052525200565656006A6A
      6A0093939300B0B0B000B2B2B200BEBEBE00CFCFCF00BFBFBF00CCCCCC00C2C2
      C200F9F9F900000000000000000000000000DFDDD900CFCBC500000000000000
      000000000000A7D0C0004DC0900047DD9E004BE9A60046D2970061BE9800D7E6
      E100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F800C0BBB300F2F2
      F300DCDCDC00CACACA00000000000000000000000000BDBDBD00898989009696
      96009E9E9E008F8F8F0092929200DFDFDF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800BABABA00F2F2F200000000000000000000000000F5F5
      F5008A8A8A0072727200CECECE000000000000000000FAF6F9008CB796001A92
      390004A333000DB9430013BD4C0017BE53001CC25A0022C3600024C2610024C2
      620025C3640025C464001FC15F0017B65300149F46003B8D56009CA69E00CBC3
      C800CCCCCC00DADADA00C3C3C300C3C3C300CECECE0000000000000000000000
      0000000000000000000000000000F5F5F5008A8A8A0072727200CECECE000000
      000000000000F8F8F8009D9D9D004C4C4C0048484800585858005E5E5E006262
      6200686868006C6C6C006D6D6D006D6D6D006E6E6E006F6F6F006A6A6A006060
      6000535353005F5F5F00A0A0A000C7C7C700CCCCCC00DADADA00C3C3C300C3C3
      C300CECECE00000000000000000000000000DFDDD900CFCBC500000000000000
      000082B8A00034AD71004DDD950032F49D002FFFA40049EFA00050D28F00309D
      6900CEE0D9000000000000000000F6F6F600F0F0F000F1F1F100F1F1F100F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1
      F100F1F1F100F1F1F100F1F1F100F0F0F000FCFCFC00FAFAF900C0BBB300F2F2
      F300DCDCDC00CACACA0000000000000000009E9E9E0070707000959595009696
      96009B9B9B009D9D9D009090900067676700D7D7D7000000000000000000F6F6
      F600F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F0F0
      F000FCFCFC00F9F9F900BABABA00F2F2F200000000000000000000000000B4B4
      B40065656500C9C9C9000000000000000000E2E6E200409A5700009F2B000FBF
      480013C6530017A14A00378053003D855A002795560018BA610022C96F0022C7
      6F0023C76F0023C76F0023C76F0022C86F0021CA6D0014BE5D00139846007DA3
      8900DED4DA00DBDBDB00E3E3E300C2C2C200BBBBBB00EAEAEA00000000000000
      0000000000000000000000000000B4B4B40065656500C9C9C900000000000000
      0000E3E3E30065656500434343005C5C5C006464640056565600585858005E5E
      5E005B5B5B006666660073737300727272007373730073737300737373007373
      73007272720065656500505050008D8D8D00D9D9D900DBDBDB00E3E3E300C2C2
      C200BBBBBB00EAEAEA000000000000000000DFDDD900CFCBC50000000000DFE9
      E50048956F0033A56C001CC27300B4FFDF0035FCAD0000DA760005AA5A004FA6
      7A0068A387000000000000000000F9F9F900F4F4F400F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500FEFEFE00FAFAF900C0BBB300F2F2
      F300DCDCDC00CACACA0000000000E4E4E4006E6E6E006C6C6C0070707000DBDB
      DB009F9F9F0070707000585858007A7A7A00868686000000000000000000F9F9
      F900F4F4F400F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500FEFEFE00F9F9F900BABABA00F2F2F2000000000000000000F0F0F0006E6E
      6E00ABABAB000000000000000000D9E1DA002095400000B4390011C852000CCA
      540016984A0079807C00C8BBC300D1C7CD00B9B1B6004C93700012BE6D001FD1
      7E001FCE7D001FCE7D001FCE7C001FCE7B001ECD79001ECE770019CD700007A7
      4D006DA48000EDE4E900ECECEC00E7E8E700B9B9B900C7C7C700000000000000
      00000000000000000000F0F0F0006E6E6E00ABABAB000000000000000000DCDC
      DC00515151004F4F4F006363630063636300525252007C7C7C00C2C2C200CCCC
      CC00B5B5B5006F6F6F00696969007A7A7A007878780078787800787878007878
      78007676760076767600727272005353530085858500E8E8E800ECECEC00E7E7
      E700B9B9B900C7C7C7000000000000000000DFDDD900CFCBC50000000000D2DF
      DA006B9A860001693F008FC7B3007FDBBE00C8F9E90040C39400007D4D002878
      570083A99800FDFEFE0000000000F9F9F900F5F5F500F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600FEFEFE00FAF9F900C0BBB300F2F2
      F300DCDCDC00CACACA0000000000D9D9D9008383830038383800ADADAD00B2B2
      B200E3E3E30087878700434343005252520096969600FDFDFD0000000000F9F9
      F900F5F5F500F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600FEFEFE00F9F9F900BABABA00F2F2F2000000000000000000B7B7B7007878
      7800FAFAFA0000000000E6E9E6002295420000BB3D000ECA530008CC5500149C
      4D007F828100D3CDD100DDDEDD00DEDEDE00E6E4E500D0C6CB00469473000EC5
      7A001BD68A001BD288001BD287001BD287001AD2850019D1820019D17D0015D2
      770000A94E0085B39600FFF5FB00FAFAFA00DCDCDC00ACACAC00F2F2F2000000
      00000000000000000000B7B7B70078787800FAFAFA0000000000E7E7E7005353
      53005252520063636300636363005454540080808000D0D0D000DDDDDD00DEDE
      DE00E5E5E500CBCBCB006F6F6F006F6F6F007E7E7E007C7C7C007C7C7C007C7C
      7C007B7B7B00797979007777770074747400525252009A9A9A00FAFAFA00FAFA
      FA00DCDCDC00ACACAC00F2F2F20000000000DFDDD900CFCBC50000000000EFF4
      F20097B3A9005F927F004B967D0046AE8E0078C9B100CFE3DD0050927B00749D
      8E00AFC4BD000000000000000000F6F6F600F0F0EF00F1F1F000F1F1F000F1F1
      F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1
      F000F1F1F000F1F1F000F1F1F000F0F0EF00FCFCFC00FAFAF900C0BBB300F2F2
      F300DCDCDC00CACACA0000000000F1F1F100A6A6A6007A7A7A00747474008080
      8000A6A6A600DADADA00747474008A8A8A00BABABA000000000000000000F6F6
      F600EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEF
      EF00FCFCFC00F9F9F900BABABA00F2F2F200000000000000000083838300C8C8
      C80000000000FFF9FD004CA1630000B335000AC9500005CB5200109F4B00868C
      8900E7E0E400E7E8E700DADADA00D5D5D500D5D5D500DFDEDF00C9BFC3003B94
      73000BC9820017D68F0016D38C0016D38B0016D28A0015D2870014D1820013D0
      7D000ED0740005A04B00BED2C40000000000FBFBFB00B3B3B300D9D9D9000000
      0000000000000000000083838300C8C8C80000000000FCFCFC00707070004D4D
      4D0061616100606060005353530089898900E3E3E300E7E7E700DADADA00D5D5
      D500D5D5D500DEDEDE00C3C3C3006B6B6B00727272007E7E7E007C7C7C007C7C
      7C007B7B7B007A7A7A0077777700757575007070700050505000C6C6C6000000
      0000FBFBFB00B3B3B300D9D9D90000000000DFDDD900CFCBC500000000000000
      0000DCE5E200C0D1CB00A8C5BB009FC7BA0098C6B700A4C8BC00B5CCC300C5D5
      CF00F2F5F4000000000000000000F8F8F800F3F3F300F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F400F3F3F300FDFDFD00FAFAF900C0BBB300F2F2
      F300DCDCDC00CACACA000000000000000000E1E1E100C9C9C900B8B8B800B5B5
      B500B1B1B100B8B8B800C1C1C100CDCDCD00F3F3F3000000000000000000F8F8
      F800F3F3F300F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F3F3
      F300FDFDFD00F9F9F900BABABA00F2F2F20000000000E8E8E80089898900FBFB
      FB0000000000A5C5AC0000A02A0006C84B0003C94D0009A145007F878200E6DE
      E300EFF0EF00EBEBEB00EBEBEB00E7E7E700DEDEDE00D7D7D700DFDCDD00BFB6
      B9002F95700006CC840012D68F0012D38C0012D38B0011D2880011D1830010D0
      7D000FD0780001C46300339E5F00FCF6F90000000000D6D6D600C4C4C4000000
      000000000000E8E8E80089898900FBFBFB0000000000B2B2B200434343005D5D
      5D005D5D5D004F4F4F0082828200E2E2E200EFEFEF00EBEBEB00EBEBEB00E7E7
      E700DEDEDE00D7D7D700DDDDDD00BABABA0066666600727272007D7D7D007B7B
      7B007A7A7A00797979007777770074747400727272006262620065656500F9F9
      F90000000000D6D6D600C4C4C40000000000DFDDD900CFCBC500000000000000
      000000000000F6F9F800EAF1EE00E6EDEB00E4ECE900E6EEEB00ECF2F000FBFD
      FC00000000000000000000000000FAFAFA00F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FEFEFE00FAF9F900C0BBB300F2F2
      F300DCDCDC00CACACA00000000000000000000000000F7F7F700EDEDED00EAEA
      EA00E8E8E800EAEAEA00EFEFEF00FCFCFC00000000000000000000000000FAFA
      FA00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FEFEFE00F9F9F900BABABA00F2F2F20000000000D2D2D200B6B6B6000000
      0000F9F3F7002D98490000BB3B0003C7480004A5400073847A00E0D7DD00EBEB
      EB00E7E7E700E8E8E800F2EBEE00F8EDF100EFEDED00E9E9E900E3E3E300E4E1
      E200B6B1B30026946B0006CA830011D28B0011D0880010CF860010CE81000FCD
      7B000ECB74000CCD6F0000A64800A6C6B00000000000EFEFEF00C3C3C3000000
      000000000000D2D2D200B6B6B60000000000F6F6F6005A5A5A00525252005B5B
      5B004D4D4D007B7B7B00DCDCDC00EBEBEB00E7E7E700E8E8E800EEEEEE00F2F2
      F200EDEDED00E9E9E900E3E3E300E2E2E200B3B3B30061616100717171007A7A
      7A00787878007777770075757500727272006F6F6F006D6D6D004F4F4F00B4B4
      B40000000000EFEFEF00C3C3C30000000000DFDDD900CFCBC500000000000000
      0000000000000000000000000000F6F8F800EFF6F400FCFBFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F800C0BBB300F2F2
      F300DCDCDC00CACACA000000000000000000000000000000000000000000F7F7
      F700F3F3F300FBFBFB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800BABABA00F2F2F20000000000CDCDCD00DCDCDC000000
      0000BACDBD000099280003C3420000AA390062816D00DBD0D700EBECEB00E5E5
      E500E5E5E500F3E8ED00A0D6BE0066CDA200E3E4E400F2EDEE00EBEBEB00EBEB
      EB00F1EDEE00B8B5B60020966A0005C87E0010CD85000ECA81000EC97C000DC8
      76000CC66F000BC6690000BA530046A06600FFFBFF00F9F9F900CFCFCF00FBFB
      FB0000000000CDCDCD00DCDCDC0000000000C1C1C10040404000585858004B4B
      4B0070707000D6D6D600EBEBEB00E5E5E500E5E5E500EDEDED00BCBCBC009C9C
      9C00E3E3E300EFEFEF00EBEBEB00EBEBEB00EEEEEE00B6B6B600606060006E6E
      6E007676760073737300717171006E6E6E006B6B6B0068686800595959006E6E
      6E00FDFDFD00F9F9F900CFCFCF00FBFBFB00DFDDD900CFCBC500000000000000
      000000000000BDDACF005BC298004ADB9E004DE7A7004AD1990076C4A400E6EE
      EC00000000000000000000000000F9F9F900F4F4F400F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F4F4F400FDFDFE00FAFAF900C0BBB300F2F2
      F300DCDCDC00CACACA00000000000000000000000000CCCCCC00919191009696
      96009E9E9E00919191009F9F9F00EAEAEA00000000000000000000000000F9F9
      F900F4F4F400F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F4F4
      F400FDFDFD00F9F9F900BABABA00F2F2F20000000000D7D7D700ECECEC00FFFE
      FF0078B0860000A6290000B339004C855F00D9CCD500F3F3F300E8E8E800E5E6
      E500F3E9EE00B3D6C50005B9660000C068003DBE8900E6E0E300EEEBEC00E9E9
      E900EBEBEB00F8F2F500B6B6B6001996650004C378000DC67B000CC475000BC2
      70000AC1690009BF620003BE580012974400E5E8E400FFFEFF00E0E0E000F8F8
      F80000000000D7D7D700ECECEC00FEFEFE008F8F8F00454545004E4E4E006565
      6500D3D3D300F3F3F300E8E8E800E5E5E500EEEEEE00C4C4C400616161006262
      620081818100E3E3E300ECECEC00E9E9E900EBEBEB00F5F5F500B6B6B6005C5C
      5C006A6A6A006F6F6F006C6C6C006969690066666600636363005D5D5D004F4F
      4F00E5E5E500FEFEFE00E0E0E000F8F8F800DFDDD900CFCBC500000000000000
      000094C1AD002CA76C0050DC96003FF5A2003CFEA90056EFA60046CD8900349D
      6C00DCE7E3000000000000000000F9F9F900F4F4F400F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F4F4F400FDFDFE00FAFAF900C0BBB300F2F2
      F300DCDCDC00CACACA000000000000000000ABABAB006A6A6A00969696009C9C
      9C00A1A1A100A3A3A3008989890069696900E2E2E2000000000000000000F9F9
      F900F4F4F400F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F4F4
      F400FDFDFD00F9F9F900BABABA00F2F2F20000000000E0E0E000F1F1F100FCF6
      FA0069AE7B0007B13A0005A33700C1BDC00000000000F4F5F400F0F0F000F9F1
      F500D6E1DB0018B3630001BA61000BBD6C0000BB690046B98900EBE2E600ECE9
      EA00E7E7E700E9EAE900F5F0F200ACB1AF0010925C0003BD6D000BBE6E000ABC
      670009BA610008B95A0007BB550000963700C1D3C50000000000E7E7E700F6F6
      F60000000000E0E0E000F1F1F100F9F9F90086868600505050004A4A4A00BFBF
      BF0000000000F4F4F400F0F0F000F5F5F500DBDBDB00646464005E5E5E006666
      66006161610082828200E6E6E600EAEAEA00E7E7E700E9E9E900F2F2F200AEAE
      AE0054545400646464006767670064646400616161005E5E5E005D5D5D004444
      4400C8C8C80000000000E7E7E700F6F6F600DFDDD900CFCBC50000000000E5EC
      E90046956E003CAC740015C37000A1FED50027FCA70000DD78000EB1620050A9
      7B006BA68A000000000000000000F6F6F600F0F0EF00F1F1F000F1F1F000F1F1
      F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1
      F000F1F1F000F1F1F000F1F1F000F0F0EF00FCFCFC00FAFAF900C0BBB300F2F2
      F300DCDCDC00CACACA0000000000E8E8E8006D6D6D00747474006D6D6D00D1D1
      D1009898980071717100606060007C7C7C00898989000000000000000000F6F6
      F600EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEF
      EF00FCFCFC00F9F9F900BABABA00F2F2F20000000000E2E2E200F2F2F200F2EF
      F10063AD76003DBE630003AA360063BA7E00000000000000000000000000F3F4
      F40034B36A0000AF4D0008B45C0009B5610009B6660000B4600050B78900ECE3
      E800EAE8E900E5E6E600E8E8E800F4EDF000A0ABA6000B8F520002B55F0009B5
      5E0008B2570007B1510006B34D0000943100A8C6AF0000000000EAEAEA00F6F6
      F60000000000E2E2E200F2F2F200F0F0F00082828200747474004B4B4B008989
      8900000000000000000000000000F3F3F30070707000545454005D5D5D005F5F
      5F00616161005C5C5C0085858500E7E7E700E9E9E900E5E5E500E8E8E800F0F0
      F000A5A5A5004E4E4E005C5C5C005E5E5E005B5B5B0058585800575757004141
      4100B4B4B40000000000EAEAEA00F6F6F600DFDDD900CFCBC50000000000D1DE
      D8006B9B8500006A3D008FCAB40097E3CB00C3FAE70030C28D00007E4B00287A
      570081A89600FEFEFE0000000000F9F9F900F4F4F400F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F4F4F400FDFDFE00FAFAF900C0BBB300F2F2
      F300DCDCDC00CACACA0000000000D7D7D7008383830037373700AFAFAF00C1C1
      C100E1E1E1007F7F7F00434343005353530095959500FEFEFE0000000000F9F9
      F900F4F4F400F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F4F4
      F400FDFDFD00F9F9F900BABABA00F2F2F20000000000E6E6E600F0EFF000EEEC
      ED0068AF7A0051C0700047BD6A0002A3310048B66A00D1ECDA00E9F5ED0048B6
      700000A23B0006AB4C0006AB500007AC550007AD590007AF5D0000AA54005DB4
      8A00EFE5EA00E8E7E700E5E5E500E7E7E700F1EAED0094A39B00068A450001AB
      4F0006AB4D0005A9480005AA4400008F2A009FC0A70000000000E7E7E700F6F6
      F60000000000E6E6E600EFEFEF00EDEDED0085858500808080007A7A7A004747
      470078787800DDDDDD00EEEEEE007A7A7A004949490054545400555555005858
      5800595959005B5B5B005454540089898900EAEAEA00E7E7E700E5E5E500E7E7
      E700EDEDED009B9B9B0047474700535353005454540052525200515151003D3D
      3D00ACACAC0000000000E7E7E700F6F6F600DFDDD900CFCBC50000000000ECF1
      EF0092AFA500548B77004B987E0040B08D0082CEB800CCE3DC00458D74006B98
      8700A9C0B8000000000000000000F9F9F900F4F4F400F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500FEFEFE00FAFAF900C0BBB300F2F2
      F300DCDCDC00CACACA0000000000EEEEEE00A2A2A20072727200757575007F7F
      7F00ADADAD00D9D9D9006C6C6C0083838300B5B5B5000000000000000000F9F9
      F900F4F4F400F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500FEFEFE00F9F9F900BABABA00F2F2F20000000000ECECEC00EBEAEB00F0ED
      EF0078B3860059BE750060C17B0053BC72000DA0360000972800089E3800009B
      320004A03E0005A1420005A2460006A34A0006A44D0006A5500005A6520000A0
      47006EB59000F7EAF200E7E6E700E5E5E500E7E7E700F2E9ED00879B90000283
      360001A2400004A13F0004A23C0000852300ACC6B100FFFCFF00E1E1E100F9F9
      F90000000000ECECEC00EAEAEA00EEEEEE009090900084848400898989008080
      80004B4B4B003F3F3F004A4A4A00444444004B4B4B004D4D4D004F4F4F005151
      51005252520053535300545454004D4D4D0091919100F1F1F100E6E6E600E5E5
      E500E7E7E700EDEDED00909090003E3E3E004B4B4B004C4C4C004B4B4B003838
      3800B6B6B600FEFEFE00E1E1E100F9F9F900DFDDD900CFCBC500000000000000
      0000D5E0DC00BACDC6009DBFB30097C2B4008FC2B200A2C7BB00ADC6BD00C0D0
      CA00EDF2F0000000000000000000F3F3F300EBEBEB00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00EBEBEB00FBFBFB00FAFAF900C0BBB300F2F2
      F300DCDCDC00CACACA000000000000000000DBDBDB00C4C4C400AFAFAF00AFAF
      AF00ABABAB00B6B6B600BABABA00C8C8C800EFEFEF000000000000000000F3F3
      F300EBEBEB00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00EBEB
      EB00FBFBFB00F9F9F900BABABA00F2F2F20000000000F0F0F000E4E4E400F4F0
      F30090BA990066BD7C0069C0800068C0800063BE7D002EA9520000942A000095
      2D000398350004993900049A3C00049B3F00059C4200059C4400059D4600039D
      460000963D0082BA9A00FAF0F600E8E8E800E5E5E500E7E8E800EEE5EA007C95
      8600007E2A0001993400029B3400007C2100C4D1C600F4F0F400E1E1E1000000
      000000000000F0F0F000E4E4E400F2F2F200A1A1A1008A8A8A008D8D8D008D8D
      8D008A8A8A00636363003F3F3F00404040004545450047474700484848004A4A
      4A004B4B4B004C4C4C004D4D4D004C4C4C00464646009C9C9C00F5F5F500E8E8
      E800E5E5E500E7E7E700E9E9E900878787003838380044444400454545003434
      3400C9C9C900F2F2F200E1E1E10000000000DFDCD900CECBC500000000000000
      000000000000F1F6F400E4EDEA00DDE9E500DAE8E300DDE9E500E7EFEC00F8FA
      FA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F800C0BBB300F2F3
      F300DCDCDC00CACACA00000000000000000000000000F3F3F300E9E9E900E3E3
      E300E1E1E100E3E3E300EBEBEB00F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F8F800BABABA00F2F2F20000000000F6F6F600DBDBDB00F4F1
      F300B3C9B70072BA830076C2890072C0860070BF850072C0870055B36F001A9A
      3F00008C2800008E2B000291320003923500049237000493390004933B000494
      3C0001943A00008B310099C3A900FFF7FE00EBECEB00E8E8E800EAEAEA00ECE3
      E900718D7A00007A2400008E2600187A2F00E3E3E200E3E2E300E6E6E6000000
      000000000000F6F6F600DBDBDB00F2F2F200BBBBBB008F8F8F00959595009292
      920091919100939393007D7D7D00515151003C3C3C003D3D3D00414141004343
      430044444400454545004646460046464600454545003E3E3E00ACACAC00FCFC
      FC00EBEBEB00E8E8E800EAEAEA00E8E8E8007D7D7D00343434003C3C3C004040
      4000E2E2E200E2E2E200E6E6E60000000000E0DEDB00D1CEC900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE0000000000F9F9F900C2BEB600F2F2
      F300DDDDDD00CDCDCD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE0000000000F9F9F900BCBCBC00F2F2F2000000000000000000D5D5D500EBEA
      EB00D8DDD90083B98F0082C592007FC28F007CC18D0079BF8A007AC08C0076BF
      89004FAD69001A943D00008727000086260000892B00028B2F00028B3100028C
      3100028C3200008B2E0002842B00AECDB900FFFEFF00F0F1F100EDEDED00EEEE
      EE00F1E4EE00518B610000750C00528C5C00F1EBF000D5D5D500F2F2F2000000
      00000000000000000000D5D5D500EAEAEA00DADADA00999999009D9D9D009A9A
      9A0098989800969696009797970094949400777777004E4E4E003A3A3A003939
      39003C3C3C003E3E3E003F3F3F003F3F3F00404040003D3D3D003B3B3B00BCBC
      BC00FEFEFE00F0F0F000EDEDED00EEEEEE00EBEBEB00696969002B2B2B006868
      6800EEEEEE00D5D5D500F2F2F20000000000E5E4E200D9D7D400000000000000
      000000000000F5F7F700AEDDCA0082DDB9007BE1B9008EDBBD00CAE5DB00FFFE
      FF00000000000000000000000000F3F3F300EBEBEA00ECECEB00ECECEB00ECEC
      EB00ECECEB00ECECEB00ECECEB00ECECEB00ECECEB00ECECEB00ECECEB00ECEC
      EB00ECECEB00ECECEB00ECECEB00EBEBEA00FBFBFB00FBFBFA00C9C5C000F2F2
      F200E3E3E300D6D6D600000000000000000000000000F6F6F600C7C7C700B2B2
      B200B1B1B100B7B7B700D8D8D800FEFEFE00000000000000000000000000F3F3
      F300EAEAEA00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EAEA
      EA00FBFBFB00FAFAFA00C4C4C400F2F2F2000000000000000000E1E1E100D6D6
      D600F0EDEF00A4C3AB008AC497008BC6980088C4950084C2930081C190007FBF
      8E0081C090007BBE8C005EB073002F994C000A882E0000802100008021000081
      2400008327000184290000822400087F2700BFD6C60000000000F6F6F600F4F3
      F400FFFAFF00499B5E0000620500AFBEB100E3E0E300D3D3D300FEFEFE000000
      00000000000000000000E1E1E100D6D6D600EEEEEE00B0B0B000A1A1A100A3A3
      A300A0A0A0009D9D9D009B9B9B00999999009B9B9B0097979700808080005C5C
      5C0040404000353535003535350037373700383838003A3A3A00373737003A3A
      3A00C9C9C90000000000F6F6F600F3F3F300FDFDFD006B6B6B0022222200B4B4
      B400E2E2E200D3D3D300FEFEFE0000000000E4E3E200D8D6D400000000000000
      0000D5E3DE003DA677003ECC8B004BEEA40056F9B00051E5A10033BA7D0069B2
      9200FEFBFD000000000000000000F8F8F800F2F2F200F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F2F2F200FDFDFD00FAFAFA00C8C5BF00F2F2
      F200E3E3E300D6D6D6000000000000000000DCDCDC0073737300878787009F9F
      9F00AAAAAA009D9D9D00787878008F8F8F00FCFCFC000000000000000000F8F8
      F800F2F2F200F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F2F2
      F200FDFDFD00FAFAFA00C4C4C400F2F2F2000000000000000000F8F8F800C3C4
      C300ECEAEC00D6DCD70097C29F0096C9A10094C79F0091C69C008DC49A008AC3
      970087C1940084C0920086C0940084C0920076B987005AAB6E0036995000198A
      370008812900007D2100007B1D00007714000B782000C2D9C900000000000000
      00008DBD970000650100437F4D00EAE4E900CDCDCD00E7E7E700000000000000
      00000000000000000000F8F8F800C3C3C300EBEBEB00D8D8D800A8A8A800AAAA
      AA00A8A8A800A6A6A600A3A3A300A1A1A1009E9E9E009C9C9C009E9E9E009C9C
      9C00929292007B7B7B005F5F5F00484848003B3B3B0034343400323232002E2E
      2E0036363600CCCCCC000000000000000000A0A0A000222222005A5A5A00E7E7
      E700CDCDCD00E7E7E7000000000000000000E4E3E200D8D6D40000000000F9F9
      F9004598710050BD84001FD078004CF7AB000DFE9B000FE884003BCD810042A9
      740087B8A1000000000000000000FAFAFA00F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FEFEFE00FAFAFA00C8C5BF00F2F2
      F200E3E3E300D6D6D60000000000F9F9F9006F6F6F008585850077777700A4A4
      A4008C8C8C007E7E7E008383830075757500A0A0A0000000000000000000FAFA
      FA00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FEFEFE00FAFAFA00C4C4C400F2F2F200000000000000000000000000DADA
      DA00CACACA00F2F0F200BFD0C2009DC7A5009FCCA8009CCAA60099C9A30096C7
      A00093C59E0090C49B008DC2980089C0960088C0950088C0950087BF930080BB
      8D0072B4810062AB730052A36500439B57002D9145003C935000C8DECD009BC8
      A500278A3C0041894F00D2D7D300E3E0E200D1D1D100FEFEFE00000000000000
      0000000000000000000000000000DADADA00CACACA00F1F1F100C5C5C500ADAD
      AD00B1B1B100AEAEAE00ACACAC00A9A9A900A7A7A700A5A5A500A2A2A2009F9F
      9F009F9F9F009F9F9F009D9D9D00989898008D8D8D0080808000737373006767
      6700565656005F5F5F00D1D1D100ADADAD004F4F4F005D5D5D00D4D4D400E1E1
      E100D1D1D100FEFEFE000000000000000000E4E3E200D8D6D40000000000D1DF
      D80061997E00047944006CC9A000DAFAF00097FCD60003C77A00008948003589
      630074A48D000000000000000000F6F6F600F0F0EF00F1F1F000F1F1F000F1F1
      F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1
      F000F1F1F000F1F1F000F1F1F000F0F0EF00FCFCFC00FBFAFA00C8C5BF00F2F2
      F200E3E3E300D6D6D60000000000D8D8D8007D7D7D00404040009C9C9C00ECEC
      EC00CDCDCD006C6C6C0045454500606060008C8C8C000000000000000000F6F6
      F600EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEF
      EF00FCFCFC00FAFAFA00C4C4C400F2F2F2000000000000000000000000000000
      0000BDBDBD00D8D7D800ECEBEC00B8CEBC00A6CCAC00A7CFAF00A4CDAC00A1CC
      AA009ECAA7009BC9A40098C7A20095C59F0092C49C008FC299008CC0970089BF
      950087BE930086BD920085BC900082BB8E007FBA8B0075B5830066AC740060A9
      6F0068A17200CAD4CB00F0ECEF00CBCBCB00F2F2F20000000000000000000000
      000000000000000000000000000000000000BDBDBD00D7D7D700EBEBEB00C0C0
      C000B4B4B400B7B7B700B4B4B400B2B2B200AFAFAF00ADADAD00ABABAB00A8A8
      A800A6A6A600A3A3A300A1A1A1009F9F9F009D9D9D009C9C9C009B9B9B009999
      9900969696008F8F8F00828282007D7D7D007E7E7E00CDCDCD00EEEEEE00CBCB
      CB00F2F2F200000000000000000000000000E4E3E200D8D6D40000000000DFE8
      E40081A597002A75590062A8910036B98F00ABE3D300A8DACA0021805F004783
      6C0097B4A9000000000000000000F8F8F800F2F2F200F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F2F2F200FDFDFD00FAFAFA00C8C5BF00F2F2
      F200E3E3E300D6D6D60000000000E3E3E3009494940052525200898989007F7F
      7F00CBCBCB00C4C4C4005555550067676700A6A6A6000000000000000000F8F8
      F800F2F2F200F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F2F2
      F200FDFDFD00FAFAFA00C4C4C400F2F2F2000000000000000000000000000000
      0000F3F3F300ACACAC00DDDDDD00ECECEC00BFD2C200ACCFB300AED3B500ACD1
      B300A9D0B000A6CEAE00A3CCAB00A1CBA9009ECAA6009BC8A40098C7A10095C5
      9E0091C39B008EC199008BC0960087BE930084BC8F0081BB8C0079B4840078AA
      8200C5D2C800F2EFF100CECECE00E5E5E5000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300ACACAC00DDDDDD00ECEC
      EC00C6C6C600BABABA00BCBCBC00BABABA00B8B8B800B6B6B600B3B3B300B1B1
      B100AFAFAF00ADADAD00AAAAAA00A8A8A800A5A5A500A2A2A200A0A0A0009D9D
      9D009A9A9A0098989800909090008C8C8C00CACACA00F0F0F000CECECE00E5E5
      E50000000000000000000000000000000000E4E3E200D8D6D40000000000FEFF
      FF00B9CBC5009AB7AD0071A7940077B6A20074BCA600AFCFC5008AB0A300A5BD
      B400D5E0DC000000000000000000FBFBFB00F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800FEFEFE00FAFAFA00C8C5BF00F2F2
      F200E3E3E300D6D6D60000000000FEFEFE00C3C3C300AAAAAA008E8E8E009A9A
      9A009C9C9C00C1C1C1009F9F9F00B2B2B200DBDBDB000000000000000000FBFB
      FB00F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800FEFEFE00FAFAFA00C4C4C400F2F2F2000000000000000000000000000000
      000000000000E9E9E900ABABAB00E2E1E200F4F3F400CFDCD100B4D1B900B2D4
      B800B2D5B900B0D4B700AED2B500ABD1B200A8CFB000A6CEAD00A3CCAB00A0CB
      A8009DC9A5009AC7A30097C6A00094C59D008EC1980086B88F0096BA9D00DAE0
      DB00F5F2F500CFCFCF00E0E0E000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900ABABAB00E1E1
      E100F3F3F300D4D4D400BFBFBF00BFBFBF00C0C0C000BEBEBE00BCBCBC00BABA
      BA00B7B7B700B5B5B500B3B3B300B1B1B100AEAEAE00ACACAC00A9A9A900A7A7
      A700A2A2A20099999900A4A4A400DCDCDC00F4F4F400CFCFCF00E0E0E0000000
      000000000000000000000000000000000000E4E3E200D8D6D400000000000000
      0000F9FBFB00DDE7E400D5E2DD00CADDD700C4DBD300C7DCD400D5E2DE00E7EE
      EC00000000000000000000000000F6F6F600F0F0F000F1F1F100F1F1F100F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1
      F100F1F1F100F1F1F100F1F1F100F0F0F000FCFCFC00FBFAFA00C8C5BF00F2F2
      F200E3E3E300D6D6D6000000000000000000FAFAFA00E2E2E200DCDCDC00D4D4
      D400D0D0D000D2D2D200DCDCDC00EBEBEB00000000000000000000000000F6F6
      F600F0F0F000F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F0F0
      F000FCFCFC00FAFAFA00C4C4C400F2F2F2000000000000000000000000000000
      00000000000000000000EEEEEE00B6B6B600DEDDDE00FDFCFD00E8ECE900C7DA
      CB00B8D4BD00B5D5BB00B5D6BB00B4D6BA00B2D5B900AFD4B600ADD2B400AAD1
      B200A7D0AF00A4CDAC009FC9A7009AC4A100A0C3A700C2D4C600F5F4F500F0EE
      F000CCCCCC00E3E3E30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEEEEE00B6B6
      B600DDDDDD00FCFCFC00E9E9E900CECECE00C3C3C300C1C1C100C2C2C200C1C1
      C100C0C0C000BDBDBD00BBBBBB00B9B9B900B7B7B700B4B4B400AFAFAF00AAAA
      AA00AEAEAE00C9C9C900F4F4F400EFEFEF00CCCCCC00E3E3E300000000000000
      000000000000000000000000000000000000E4E3E200D7D5D30000000000FEFF
      FF000000000000000000FBFDFD00F5F8F800F2F7F600F7F9F900FDFEFE000000
      0000FEFEFE00FEFEFE00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900C8C4BF00F2F2
      F300E3E3E300D5D5D50000000000FEFEFE000000000000000000FCFCFC00F7F7
      F700F5F5F500F8F8F800FDFDFD0000000000FEFEFE00FEFEFE00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9F9F900C3C3C300F2F2F2000000000000000000000000000000
      0000000000000000000000000000F9F9F900C8C8C800D0D0D000F8F7F800FFFE
      FF00EDF2EE00D5E3D700C4D9C800BBD5C000B7D3BC00B4D2BA00B2D1B700AFD0
      B500AECEB400B1CEB700BDD3C100D8E3DA00F6F7F600FCFAFC00DDDDDD00CCCC
      CC00EFEFEF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F900C8C8C800D0D0D000F7F7F700FEFEFE00EFEFEF00DADADA00CCCCCC00C5C5
      C500C2C2C200C0C0C000BEBEBE00BCBCBC00BABABA00BCBCBC00C5C5C500DCDC
      DC00F6F6F600FBFBFB00DDDDDD00CCCCCC00EFEFEF0000000000000000000000
      000000000000000000000000000000000000E6E5E300D7D3CC00E0DDD800E0DD
      D800E0DDD900E1DEDA00E3E0DC00E5E1DE00E6E3E000E6E3E100E5E3E000E5E4
      E200E6E5E300E7E6E400E7E7E500E8E8E700E8E8E800E9E9E800E8E8E800E8E8
      E700E7E7E600E6E5E400E5E4E300E4E3E100E3E1DF00E2E0DC00E0DEDA00DFDD
      D800DEDBD600DDDAD400DBD8D200DBD7D000DAD6CF00D5D1CA00CAC5BE00F2F2
      F300E4E4E400D2D2D200DCDCDC00DCDCDC00DCDCDC00DDDDDD00DFDFDF00E1E1
      E100E3E3E300E3E3E300E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7
      E700E8E8E800E8E8E800E8E8E800E7E7E700E6E6E600E5E5E500E4E4E400E2E2
      E200E1E1E100DFDFDF00DDDDDD00DCDCDC00DADADA00D9D9D900D7D7D700D6D6
      D600D5D5D500D0D0D000C4C4C400F2F2F2000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900D5D5D500E5E5
      E500FAF9FA0000000000FEFEFE00F6F9F700EEF3EF00E9EFEA00E7EEE800E9EF
      EA00F0F4F100FAFBFB0000000000F9F7F900E2E1E100CCCCCC00DDDDDD00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9E9E900D5D5D500E5E5E500F9F9F90000000000FEFEFE00F7F7
      F700F0F0F000EBEBEB00E9E9E900EBEBEB00F1F1F100FAFAFA0000000000F8F8
      F800E1E1E100CCCCCC00DDDDDD00FCFCFC000000000000000000000000000000
      000000000000000000000000000000000000EBEAEA00D9D5CD00DCD7D000DCD8
      D100DDD9D200DEDAD300DFDBD500E0DCD700E1DDDA00E2DFDB00E3E1DD00E5E3
      DF00E6E4E100E6E6E300E7E6E500E8E8E600E9E9E800EAEAE900E9E9E900E8E8
      E700E7E6E500E6E5E300E5E3E100E3E1DD00E1DEDB00DFDCD800DDDAD400DBD8
      D100DAD5CE00D8D3CB00D6D1C800D5CFC600D4CEC300C8C3BA00CECAC300F7F8
      F800EAEAEA00D3D3D300D6D6D600D7D7D700D8D8D800D9D9D900DADADA00DBDB
      DB00DDDDDD00DEDEDE00E0E0E000E2E2E200E3E3E300E5E5E500E6E6E600E7E7
      E700E8E8E800E9E9E900E9E9E900E7E7E700E6E6E600E4E4E400E3E3E300E0E0
      E000DEDEDE00DBDBDB00D9D9D900D6D6D600D4D4D400D2D2D200CFCFCF00CECE
      CE00CCCCCC00C1C1C100C9C9C900F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F2F2
      F200E6E6E600E5E5E500ECECEC00F3F2F300F7F6F700FAF8F900FBF9FA00F9F8
      F900F6F5F600EEEEEE00DCDCDC00D2D2D200E3E3E300FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F2F2F200E6E6E600E5E5E500ECECEC00F2F2
      F200F6F6F600F9F9F900FAFAFA00F8F8F800F5F5F500EEEEEE00DCDCDC00D2D2
      D200E3E3E300FAFAFA0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00F3F3F300F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F6F6F7000000
      0000FEFEFE00F3F3F300F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F6F6F600000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000FAFAFA00FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00FBFBFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000F1F1F100E3E3E300E0E0E000E3E3E300E8E8E800EFEFEF00F6F6F600FBFB
      FB00FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1F1F100E3E3E300E0E0E000E3E3
      E300E8E8E800EFEFEF00F6F6F600FBFBFB00FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000DEDEDE00D7D7D700E7E7E700E5E5E500E4E4E400E0E0E000DEDEDE00DFDF
      DF00E3E3E300E8E8E800EEEEEE00F4F4F400FAFAFA00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEDEDE00D7D7D700E7E7E700E5E5
      E500E4E4E400E0E0E000DEDEDE00DFDFDF00E3E3E300E8E8E800EEEEEE00F4F4
      F400FAFAFA00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000D6D6D600C1C1C100DADADA00D3D3D300D8D8D800DFDFDF00E3E3E300E4E4
      E400E5E5E500E3E3E300E1E1E100DEDEDE00DFDFDF00E2E2E200E6E6E600EDED
      ED00F4F4F400FAFAFA00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6D6D600C1C1C100DADADA00D3D3
      D300D8D8D800DFDFDF00E3E3E300E4E4E400E5E5E500E3E3E300E1E1E100DEDE
      DE00DFDFDF00E2E2E200E6E6E600EDEDED00F4F4F400FAFAFA00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000CCCCCC00C5C5C50000000000F9F9F900EEEEEE00E1E1E100DBDBDB00D9D9
      D900DCDCDC00E1E1E100E4E4E400E4E4E400E3E3E300E3E3E300E2E2E200E1E1
      E100DFDFDF00DEDEDE00E1E1E100E6E6E600EDEDED00F3F3F300F9F9F900FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCCCCC00C5C5C50000000000F9F9
      F900EEEEEE00E1E1E100DBDBDB00D9D9D900DCDCDC00E1E1E100E4E4E400E4E4
      E400E3E3E300E3E3E300E2E2E200E1E1E100DFDFDF00DEDEDE00E1E1E100E6E6
      E600EDEDED00F3F3F300F9F9F900FDFDFD000000000000000000000000000000
      00000000000000000000000000000000000000000000C1C1C100B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A09079005B2F0000633B00005F37
      0000623A01006A4102006D4400008A6726000000000000000000C4B085007E54
      0000835B07007E5706007A520600774F0500714600006B4F2000C2C3C7000000
      000000000000C1C1C100B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008D8D8D002E2E2E00343434003232320034343400393939003B3B3B005D5D
      5D000000000000000000A8A8A800464646004C4C4C0049494900464646004343
      43003D3D3D0048484800C4C4C40000000000000000000000000000000000FDFD
      FD00C3C3C300D4D4D4000000000000000000000000000000000000000000F8F8
      F800EFEFEF00E6E6E600E3E3E300E3E3E300E2E2E200E4E4E400E5E5E500E5E5
      E500E2E2E200E2E2E200E3E3E300E1E1E100DEDEDE00DADADA00DBDBDB00DEDE
      DE00E5E5E500ECECEC00F3F3F300F9F9F900FDFDFD0000000000000000000000
      0000000000000000000000000000FDFDFD00C3C3C300D4D4D400000000000000
      0000000000000000000000000000F8F8F800EFEFEF00E6E6E600E3E3E300E3E3
      E300E2E2E200E4E4E400E5E5E500E5E5E500E2E2E200E2E2E200E3E3E300E1E1
      E100DEDEDE00DADADA00DBDBDB00DEDEDE00E5E5E500ECECEC00F3F3F300F9F9
      F900FDFDFD0000000000000000000000000000000000C1C1C100B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E9E9E8006D4A1A005F3400005F3600006239
      01006A420200744C04007B520000977528000000000000000000CCB887008F66
      0000926B09008C640800845C07007C550600774F040069400000A9A296000000
      000000000000C1C1C100B5B5B500FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E8E8
      E800454545003131310031313100343434003A3A3A0041414100444444006666
      66000000000000000000AEAEAE005151510057575700525252004D4D4D004747
      47004343430038383800A0A0A00000000000000000000000000000000000FBFB
      FB00BBBBBB00E1E1E10000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F7F7F700EEEEEE00E9E9E900E9E9E900EBEB
      EB00ECECEC00EBEBEB00E9E9E900E4E4E400DFDFDF00DADADA00D7D7D700D6D6
      D600D5D5D500D4D4D400D3D3D300D7D7D700DCDCDC00EDEDED00FDFDFD000000
      0000000000000000000000000000FBFBFB00BBBBBB00E1E1E100000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F7F7
      F700EEEEEE00E9E9E900E9E9E900EBEBEB00ECECEC00EBEBEB00E9E9E900E4E4
      E400DFDFDF00DADADA00D7D7D700D6D6D600D5D5D500D4D4D400D3D3D300D7D7
      D700DCDCDC00EDEDED00FDFDFD000000000000000000C1C1C100B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3BBAE005C3300005F36000061380000663C
      000072490000815900008B630000A78526000000000000000000D4C288009F78
      00009F790700976F01008C630000855C06007C5506006F44000093805A000000
      000000000000C1C1C100B5B5B500FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B9B9
      B9002F2F2F003131310033333300363636003E3E3E00484848004F4F4F007070
      70000000000000000000B4B4B4005D5D5D005F5F5F00575757004F4F4F004D4D
      4D00474747003B3B3B007979790000000000000000000000000000000000F7F7
      F700B5B5B500EEEEEE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBFBFB00F5F5
      F500EEEEEE00EBEBEB00EEEEEE00F4F4F400F6F6F600F1F1F100E7E7E700DBDB
      DB00D5D5D500D1D1D100CECECE00CBCBCB00CACACA00D0D0D000F5F5F5000000
      0000000000000000000000000000F7F7F700B5B5B500EEEEEE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBFBFB00F5F5F500EEEEEE00EBEBEB00EEEEEE00F4F4
      F400F6F6F600F1F1F100E7E7E700DBDBDB00D5D5D500D1D1D100CECECE00CBCB
      CB00CACACA00D0D0D000F5F5F5000000000000000000C1C1C100B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A6967C00592E0000613800006B4200009374
      3300A78B4500B2974800BBA04800CCB769000000000000000000E6DBAF00C6AD
      5000C4AB5400BEA34D00B699480096711500825A05007349000085683200F6F8
      FC0000000000C1C1C100B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009292
      92002D2D2D003333330039393900686868007D7D7D00858585008B8B8B00A4A4
      A4000000000000000000D0D0D00096969600969696008F8F8F00878787005E5E
      5E004B4B4B003E3E3E005F5F5F00F8F8F800000000000000000000000000F2F2
      F200B5B5B500F8F8F80000000000000000000000000000000000FBFBFB00D1D1
      D100EAEAEA000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00F8F8F800EFEFEF00E8E8E800EAEAEA00F0F0F000F4F4
      F400F3F3F300ECECEC00E3E3E300D8D8D800D0D0D000C9C9C900E1E1E1000000
      0000000000000000000000000000F2F2F200B5B5B500F8F8F800000000000000
      00000000000000000000FBFBFB00D1D1D100EAEAEA0000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00F8F8F800EFEF
      EF00E8E8E800EAEAEA00F0F0F000F4F4F400F3F3F300ECECEC00E3E3E300D8D8
      D800D0D0D000C9C9C900E1E1E1000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000978261005D310000704800007D550000E7E0
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B1933D008C6501007B5200007F5F2200EEF0
      F10000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007E7E
      7E002F2F2F003D3D3D0046464600DBDBDB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000505050004444440055555500EFEFEF00000000000000000000000000EAEA
      EA00B9B9B9000000000000000000000000000000000000000000E7E7E7000808
      080005050500272727004F4F4F0083838300ACACAC00D2D2D200FBFBFB000000
      000000000000000000000000000000000000FEFEFE00F4F4F400E8E8E800DFDF
      DF00E0E0E000E5E5E500ECECEC00EEEEEE00ECECEC00E6E6E600E3E3E300FDFD
      FD00000000000000000000000000EAEAEA00B9B9B90000000000000000000000
      00000000000000000000E7E7E7000808080005050500272727004F4F4F008383
      8300ACACAC00D2D2D200FBFBFB00000000000000000000000000000000000000
      0000FEFEFE00F4F4F400E8E8E800DFDFDF00E0E0E000E5E5E500ECECEC00EEEE
      EE00ECECEC00E6E6E600E3E3E300FDFDFD0000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009B8761006D430000825B0000906B0000EBE4
      CD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B99D4200967005008760010087682400EEF0
      F10000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008181
      81003A3A3A004949490053535300DEDEDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008888
      8800595959004D4D4D005B5B5B00EFEFEF00000000000000000000000000E1E1
      E100C2C2C2000000000000000000000000000000000000000000E2E2E2000A0A
      0A0000000000010101000000000000000000000000000D0D0D00EAEAEA000000
      0000FCFCFC00BDBDBD0098989800B5B5B500F2F2F20000000000FCFCFC00F4F4
      F400EBEBEB00DFDFDF00D6D6D600D4D4D400DADADA00E1E1E100EFEFEF000000
      0000000000000000000000000000E1E1E100C2C2C20000000000000000000000
      00000000000000000000E2E2E2000A0A0A000000000001010100000000000000
      0000000000000D0D0D00EAEAEA0000000000FCFCFC00BDBDBD0098989800B5B5
      B500F2F2F20000000000FCFCFC00F4F4F400EBEBEB00DFDFDF00D6D6D600D4D4
      D400DADADA00E1E1E100EFEFEF000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B4A57D007E550000916C0100A2800900C3AC
      4A00D3C06800DAC97300E1D28100EADFA4000000000000000000F7F3D500ECE2
      9E00E8DC9700DFD18500D4C27100B6972C00A07C10008D660100977D3700F7F9
      FD0000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C0046464600545454006363630093939300A9A9A900B2B2B200BCBCBC00CFCF
      CF000000000000000000EAEAEA00CECECE00C9C9C900BCBCBC00ADADAD007D7D
      7D0064646400515151006E6E6E00F9F9F900000000000000000000000000D7D7
      D700CFCFCF000000000000000000000000000000000000000000000000009E9E
      9E00000000001B1B1B00BDBDBD00A0A0A0005F5F5F005858580000000000FCFC
      FC004949490000000000000000000000000014141400BCBCBC0000000000FBFB
      FB00F6F6F600F0F0F000E8E8E800DFDFDF00D4D4D400CACACA00D4D4D400F8F8
      F800000000000000000000000000D7D7D700CFCFCF0000000000000000000000
      00000000000000000000000000009E9E9E00000000001B1B1B00BDBDBD00A0A0
      A0005F5F5F005858580000000000FCFCFC004949490000000000000000000000
      000014141400BCBCBC0000000000FBFBFB00F6F6F600F0F0F000E8E8E800DFDF
      DF00D4D4D400CACACA00D4D4D400F8F8F80000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0C9B1008C6700009D7A0000AE8F0D00B89B
      1900C4AA2C00D0B94200D8C55800E4D688000000000000000000F5EFC800E6D9
      8200E2D37900D7C45F00C7AE3E00B89A2700A6841700916A0000A9976000FEFF
      FF0000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C3C3
      C300515151005D5D5D006E6E6E00797979008888880099999900A7A7A700C0C0
      C0000000000000000000E4E4E400C0C0C000BABABA00A8A8A800919191007D7D
      7D006B6B6B00535353008A8A8A00FEFEFE00000000000000000000000000CECE
      CE00DCDCDC000000000000000000000000000000000000000000000000000000
      0000717171000000000052525200000000000000000000000000000000008484
      8400000000000000000078787800686868000000000014141400EBEBEB000000
      0000FCFCFC00F6F6F600F0F0F000E9E9E900E3E3E300DBDBDB00D3D3D300F6F6
      F600000000000000000000000000CECECE00DCDCDC0000000000000000000000
      0000000000000000000000000000000000007171710000000000525252000000
      0000000000000000000000000000848484000000000000000000787878006868
      68000000000014141400EBEBEB0000000000FCFCFC00F6F6F600F0F0F000E9E9
      E900E3E3E300DBDBDB00D3D3D300F6F6F60000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEEEEC00A2841900A5820000B5970E00C0A6
      2500CBB53E00D5C25600DECE6A00E9DD96000000000000000000F6F1CF00E9DD
      9200E5D88A00DDCC7200CFB85000BC9F2D00A886170094710300B9B39D000000
      000000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EDED
      ED006A6A6A0062626200737373008383830094949400A4A4A400B2B2B200C9C9
      C9000000000000000000E7E7E700C8C8C800C2C2C200B3B3B3009D9D9D008282
      82006C6C6C0058585800ADADAD0000000000000000000000000000000000C7C7
      C700E8E8E8000000000000000000000000000000000000000000000000000000
      0000000000004646460000000000676767000000000000000000FDFDFD002222
      2200000000004D4D4D0000000000F8F8F80019191900000000009C9C9C000000
      000000000000FDFDFD00F7F7F700F1F1F100EBEBEB00E1E1E100E7E7E7000000
      0000000000000000000000000000C7C7C700E8E8E80000000000000000000000
      0000000000000000000000000000000000000000000046464600000000006767
      67000000000000000000FDFDFD0022222200000000004D4D4D0000000000F8F8
      F80019191900000000009C9C9C000000000000000000FDFDFD00F7F7F700F1F1
      F100EBEBEB00E1E1E100E7E7E7000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5B97D00A9870000B89B0B00C3AA
      2500CDB74000D7C55B00E0D16E00EAE097000000000000000000F6F1D100E9DE
      9400E5D98C00DDCD7200CFB94E00BB9F2D00A8850F0098812C00C5C7CB000000
      000000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A9A9A90065656500747474008686860096969600A7A7A700B5B5B500CBCB
      CB000000000000000000E8E8E800C9C9C900C3C3C300B4B4B4009C9C9C008282
      8200696969006C6C6C00C7C7C700000000000000000000000000FDFDFD00C4C4
      C400F4F4F4000000000000000000000000000000000000000000000000000000
      000000000000E7E7E7001717170000000000A8A8A80000000000D5D5D5000000
      000000000000A2A2A20000000000000000002E2E2E00000000006D6D6D000000
      00000000000000000000FEFEFE00F8F8F800F2F2F200EAEAEA00F6F6F6000000
      00000000000000000000FDFDFD00C4C4C400F4F4F40000000000000000000000
      00000000000000000000000000000000000000000000E7E7E700171717000000
      0000A8A8A80000000000D5D5D5000000000000000000A2A2A200000000000000
      00002E2E2E00000000006D6D6D00000000000000000000000000FEFEFE00F8F8
      F800F2F2F200EAEAEA00F6F6F6000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0F1F000B8A12600B89A0000C4AB
      1D00CEB83C00D7C65900E0D16E00EAE093000000000000000000F6F1CE00E8DC
      8E00E4D78400DBC96800CBB44700B6982300A68611009F9A8700CDCFD4000000
      000000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0F0F0007F7F7F00707070008484840096969600A7A7A700B5B5B500C9C9
      C9000000000000000000E7E7E700C6C6C600BFBFBF00AEAEAE00979797007B7B
      7B006969690095959500D0D0D000000000000000000000000000F8F8F800C4C4
      C400FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000096969600000000002D2D2D0000000000B6B6B6000000
      000000000000D3D3D30000000000FEFEFE0023232300000000006A6A6A000000
      0000000000000000000000000000FEFEFE00FAFAFA00F2F2F200FDFDFD000000
      00000000000000000000F8F8F800C4C4C400FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000969696000000
      00002D2D2D0000000000B6B6B6000000000000000000D3D3D30000000000FEFE
      FE0023232300000000006A6A6A0000000000000000000000000000000000FEFE
      FE00FAFAFA00F2F2F200FDFDFD000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4E1CC00BCA30D00C3A7
      0500CDB73100D6C44F00DECF6900E5D97F00EDE39D00EFE6A300ECE19700E6DA
      8300E0D17400D4C15A00C1A73400B0921600C4BB9100AFB1B900CDCDCC000000
      000000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DBDBDB00797979007A7A7A0091919100A3A3A300B2B2B200BFBF
      BF00CFCFCF00D2D2D200CCCCCC00C1C1C100B7B7B700A5A5A500898989007272
      7200B0B0B000B3B3B300CCCCCC00000000000000000000000000F1F1F100C7C7
      C700000000000000000000000000000000000000000000000000B0B0B000E6E6
      E6000000000000000000BBBBBB000000000001010100ECECEC00ABABAB000000
      00000C0C0C00EAEAEA0000000000EBEBEB000B0B0B0000000000878787000000
      000000000000000000000000000000000000FEFEFE00F7F7F700000000000000
      00000000000000000000F1F1F100C7C7C7000000000000000000000000000000
      00000000000000000000B0B0B000E6E6E6000000000000000000BBBBBB000000
      000001010100ECECEC00ABABAB00000000000C0C0C00EAEAEA0000000000EBEB
      EB000B0B0B000000000087878700000000000000000000000000000000000000
      0000FEFEFE00F7F7F700000000000000000000000000C2C2C200B5B5B500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4E2CA00C4B0
      1E00C8AF0B00D3BE3600DACA5900E0D26D00E4D77600E5D87B00E4D77B00E0D1
      7300D6C45D00C5AD3400B79C2700D4CBA300F5F6FB00B0AFAF00CCCCCC000000
      000000000000C2C2C200B5B5B500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DADADA00868686008080800097979700A9A9A900B5B5
      B500BBBBBB00BDBDBD00BCBCBC00B6B6B600A7A7A7008C8C8C007E7E7E00C0C0
      C000F7F7F700AFAFAF00CCCCCC00000000000000000000000000EBEBEB00D1D1
      D1000000000000000000000000000000000000000000000000003E3E3E001212
      120099999900C6C6C600484848000000000007070700F3F3F300B7B7B7000000
      00000D0D0D00ECECEC0000000000C0C0C0000000000000000000B8B8B8000000
      000000000000000000000000000000000000FCFCFC00FAFAFA00000000000000
      00000000000000000000EBEBEB00D1D1D1000000000000000000000000000000
      000000000000000000003E3E3E001212120099999900C6C6C600484848000000
      000007070700F3F3F300B7B7B700000000000D0D0D00ECECEC0000000000C0C0
      C0000000000000000000B8B8B800000000000000000000000000000000000000
      0000FCFCFC00FAFAFA00000000000000000000000000C2C2C200B4B4B400FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0F0
      EA00D3C87200CCB92C00D2BD2C00D7C54400DBCA5400DCCB5900D7C65400D0BB
      4600C5AF3D00C7B76700E4E1D30000000000F7F7F600ADADAD00CCCCCC000000
      000000000000C2C2C200B4B4B400FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEEEEE00AFAFAF009090900093939300A0A0
      A000A8A8A800AAAAAA00A5A5A5009B9B9B0090909000A1A1A100DDDDDD000000
      0000F6F6F600ADADAD00CCCCCC00000000000000000000000000ECECEC00E6E6
      E600000000000000000000000000000000000000000000000000949494000505
      0500000000000000000000000000000000005E5E5E0000000000DEDEDE000202
      020000000000C3C3C300000000005F5F5F000000000011111100EEEEEE000000
      000000000000000000000000000000000000FAFAFA00FCFCFC00000000000000
      00000000000000000000ECECEC00E6E6E6000000000000000000000000000000
      0000000000000000000094949400050505000000000000000000000000000000
      00005E5E5E0000000000DEDEDE000202020000000000C3C3C300000000005F5F
      5F000000000011111100EEEEEE00000000000000000000000000000000000000
      0000FAFAFA00FCFCFC000000000000000000FEFEFE00C6C6C600C5C5C500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFEFF00EEEDE600DDD7A600D8CE8100D5C87200D3C67300D4C98100D7CF
      9F00E7E4D600FAFBFE000000000000000000F8F8F800BEBEBE00CECECE000000
      0000FEFEFE00C6C6C600C5C5C500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00EBEBEB00C8C8C800B7B7
      B700AFAFAF00AEAEAE00B4B4B400C1C1C100E0E0E000FBFBFB00000000000000
      0000F8F8F800BEBEBE00CECECE00000000000000000000000000EFEFEE00F4F4
      F30000000000000000000000000000000000000000000000000000000000E7E7
      E70090909000585858004F4F4F0093939300FAFAFA0000000000000000006060
      6000000000001D1D1D004A4A4A00020202000000000077777700000000000000
      000000000000000000000000000000000000F8F8F800FEFEFE00000000000000
      00000000000000000000EEEEEE00F3F3F3000000000000000000000000000000
      0000000000000000000000000000E7E7E70090909000585858004F4F4F009393
      9300FAFAFA00000000000000000060606000000000001D1D1D004A4A4A000202
      0200000000007777770000000000000000000000000000000000000000000000
      0000F8F8F800FEFEFE000000000000000000FDFDFD00CACACA00D5D5D500FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFFFF00FBFCFF00FAFBFF00FDFEFF000000
      000000000000000000000000000000000000F9F9F900D0D0D000CFCFCF000000
      0000FDFDFD00CACACA00D5D5D500FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FCFCFC00FCFCFC00FEFEFE00000000000000000000000000000000000000
      0000F9F9F900D0D0D000CFCFCF00000000000000000000000000D3D3E2007978
      C000A2A1D500CBCAE800E3E2F300FBFBFD000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F9006C6C6C000707070000000000000000005D5D5D00FAFAFA00000000000000
      0000000000000000000000000000FEFEFE00F8F8F80000000000000000000000
      00000000000000000000D8D8D80090909000B2B2B200D4D4D400E8E8E800FBFB
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F9F9F9006C6C6C0007070700000000000000
      00005D5D5D00FAFAFA000000000000000000000000000000000000000000FEFE
      FE00F8F8F800000000000000000000000000FDFDFD00C9C9C900D2D2D200FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900CCCCCC00CFCFCF000000
      0000FDFDFD00C9C9C900D2D2D200FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900CCCCCC00CFCFCF00000000000000000000000000AEAED0003E3D
      A7006C6BBD003433A500504EB2005553B6006A69C0008D8CD000B2B1DF00D5D5
      EE00EDECF800FDFDFE0000000000000000000000000000000000000000000000
      000000000000EFEFEF00D3D3D300E2E2E2000000000000000000000000000000
      0000000000000000000000000000FCFCFC00FAFAFA0000000000000000000000
      00000000000000000000B9B9B900606060008686860059595900707070007474
      740086868600A3A3A300C0C0C000DDDDDD00F0F0F000FDFDFD00000000000000
      00000000000000000000000000000000000000000000EFEFEF00D3D3D300E2E2
      E20000000000000000000000000000000000000000000000000000000000FCFC
      FC00FAFAFA00000000000000000000000000FDFDFD00C8C8C800D0D0D000FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900CBCBCB00CFCFCF000000
      0000FDFDFD00C8C8C800D0D0D000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900CBCBCB00CFCFCF000000000000000000000000009190C2008181
      C700B7B6DF008988CA00DBDBF0005150B4009D9CD6006261BD00605EBE003F3D
      B2004F4DBA006462C4008280D1009E9DDC00C5C4EB00DFDFF400F4F4FB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FAFAFA00FDFDFD0000000000000000000000
      00000000000000000000A1A1A10098989800C4C4C4009E9E9E00E2E2E2007171
      7100AFAFAF00808080007E7E7E006464640072727200838383009B9B9B00B2B2
      B200D1D1D100E6E6E600F6F6F600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAFA
      FA00FDFDFD00000000000000000000000000FEFEFE00C8C8C800CFCFCF00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900C9C9C900CFCFCF000000
      0000FEFEFE00C8C8C800CFCFCF00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900C9C9C900CFCFCF000000000000000000FFFFFE007A79B800A2A2
      D600B3B3DD00D9D9EE00D7D6ED008B8ACD00CFCEEB008988CE00DFDEF2005655
      BC008A89D100B0AFE100514EBE007372CD004F4CC1005754C6006764CD007C79
      D6009795E000B8B6EA00D2D1F200E8E7F900F9F9FD0000000000000000000000
      0000000000000000000000000000F8F8F8000000000000000000000000000000
      000000000000FEFEFE008E8E8E00B3B3B300C1C1C100E0E0E000DEDEDE00A0A0
      A000D8D8D8009F9F9F00E5E5E50077777700A1A1A100C0C0C000747474009090
      9000747474007B7B7B008888880099999900AEAEAE00C8C8C800DCDCDC00EDED
      ED00FAFAFA00000000000000000000000000000000000000000000000000F8F8
      F80000000000000000000000000000000000FEFEFE00C8C8C800CDCDCD00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900C7C7C700CECECE000000
      0000FEFEFE00C8C8C800CDCDCD00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900C7C7C700CECECE000000000000000000FBFBF700706FB600C3C2
      E500F1F1F900ACACDA00ACACDB00D5D5ED00BAB9E2005B59BA00F5F4FB00C7C7
      E900FEFEFE008887D2007675CC00E1E1F4005754C4005C59C8005D5ACA005C59
      CC005C59CD005E5AD000625ED3006B67D7007A77DD008E8BE300A6A3EA00C3C1
      F200DBDAF700EFEFFC00FCFCFD00F8F8F8000000000000000000000000000000
      000000000000F9F9F90087878700CECECE00F3F3F300BBBBBB00BBBBBB00DDDD
      DD00C7C7C7007A7A7A00F6F6F600D2D2D200FEFEFE00A0A0A00092929200E7E7
      E7007A7A7A007F7F7F0080808000808080008080800082828200868686008D8D
      8D009A9A9A00A9A9A900BBBBBB00D2D2D200E4E4E400F3F3F300FCFCFC00F8F8
      F80000000000000000000000000000000000FEFEFE00C7C7C700CBCBCB00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900C5C5C500CECECE000000
      0000FEFEFE00C7C7C700CBCBCB00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900C5C5C500CECECE000000000000000000EDEDEE007170B800D7D7
      EE00F3F3FA006D6CBF00A2A1D60000000000B2B2DE006F6EC300D6D6EF00A2A1
      DA00D1D0ED003E3CB600C5C4E900DADAF2005250C3005D5AC800605DCB00625F
      CD006562D0006764D3006A66D5006B67D7006A67D9006966DA006966DC006B67
      DE006F6BE0007672E3008D8AE700F7F7FA000000000000000000000000000000
      000000000000EDEDED0088888800DEDEDE00F5F5F50088888800B3B3B3000000
      0000C0C0C0008A8A8A00DEDEDE00B4B4B400DADADA0065656500D0D0D000E2E2
      E200777777007F7F7F008282820084848400878787008A8A8A008C8C8C008D8D
      8D008E8E8E008D8D8D008E8E8E00909090009393930099999900AAAAAA00F8F8
      F80000000000000000000000000000000000FEFEFE00C7C7C700C9C9C900FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F800C3C3C300CECECE000000
      0000FEFEFE00C7C7C700C9C9C900FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800C3C3C300CECECE000000000000000000DEDDE5007776BD007F7E
      C5008584C8007675C300908FCE00E3E3F3009F9ED6007977C700DCDCF1000000
      00008A89D2009C9BD900EBEBF800DDDDF3006966CB005552C6005D5ACA00605D
      CD006461D0006764D3006A66D5006C69D8006E6BDA00706DDC00726EDE007470
      E0007572E1006F6BE200928FE700FFFFFE000000000000000000000000000000
      000000000000E0E0E0008E8E8E00969696009B9B9B008F8F8F00A4A4A400E8E8
      E800B1B1B10092929200E3E3E30000000000A1A1A100B0B0B000EFEFEF00E4E4
      E40088888800797979008080800083838300878787008A8A8A008C8C8C008F8F
      8F00919191009393930094949400969696009898980094949400ADADAD00FEFE
      FE0000000000000000000000000000000000FEFEFE00C6C6C600C8C8C800FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F800C1C1C100CECECE000000
      0000FEFEFE00C6C6C600C8C8C800FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800C1C1C100CECECE000000000000000000CBCBDA007D7CC2008382
      C7008382C8008888CA008685CA008181C9008A89CD008B8AD000A3A2DA00B5B4
      E1009493D500EEEEF900A6A5DE00D3D3EF00B3B2E5006D6BCD006D6ACF006865
      CF006663D1006562D2006662D4006864D7006A67D9006D6ADB00716DDE007470
      E0007672E1006F6AE200B6B4ED00000000000000000000000000000000000000
      000000000000D0D0D0009393930099999900999999009E9E9E009C9C9C009999
      9900A0A0A000A1A1A100B5B5B500C3C3C300A9A9A900F1F1F100B8B8B800DCDC
      DC00C3C3C3008C8C8C008C8C8C00898989008888880088888800898989008B8B
      8B008E8E8E009090900094949400969696009898980093939300C7C7C7000000
      000000000000000000000000000000000000FEFEFE00C6C6C600C5C5C500FBFB
      FB00FDFDFD00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FEFEFE00F5F5F500BFBFBF00CDCDCD000000
      0000FEFEFE00C6C6C600C5C5C500FBFBFB00FDFDFD00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FEFE
      FE00F5F5F500BFBFBF00CDCDCD000000000000000000BEBDD5007F7FC4008887
      CA008A89CB008D8CCD00908FCF009291D0009392D0009291CD009291D2009190
      D3009A99D7009A99D9009896D900ABAAE100BAB9E700A2A0DF00A4A2E100A1A0
      E1009E9CE2009A98E1009592E1008C8AE0008480DF007D7ADF007673DF00726E
      DF00716DE000706BE100DBDAF400000000000000000000000000000000000000
      000000000000C5C5C500969696009D9D9D009F9F9F00A2A2A200A4A4A400A6A6
      A600A7A7A700A5A5A500A7A7A700A6A6A600AEAEAE00AEAEAE00ADADAD00BCBC
      BC00C8C8C800B5B5B500B7B7B700B6B6B600B4B4B400B1B1B100ADADAD00A7A7
      A700A1A1A1009C9C9C0098989800959595009494940094949400E3E3E3000000
      000000000000000000000000000000000000FEFEFE00C6C6C600C1C1C100C9C9
      C900CACACA00CBCBCB00CDCDCD00CFCFCF00D1D1D100D3D3D300D4D4D400D6D6
      D600D8D8D800DADADA00DCDCDC00DDDDDD00DFDFDF00E0E0E000E0E0E000DEDE
      DE00DDDDDD00DCDCDC00DADADA00D8D8D800D6D6D600D4D4D400D2D2D200D1D1
      D100CECECE00CDCDCD00CBCBCB00CACACA00C8C8C800BEBEBE00CDCDCD000000
      0000FEFEFE00C6C6C600C1C1C100C9C9C900CACACA00CBCBCB00CDCDCD00CFCF
      CF00D1D1D100D3D3D300D4D4D400D6D6D600D8D8D800DADADA00DCDCDC00DDDD
      DD00DFDFDF00E0E0E000E0E0E000DEDEDE00DDDDDD00DCDCDC00DADADA00D8D8
      D800D6D6D600D4D4D400D2D2D200D1D1D100CECECE00CDCDCD00CBCBCB00CACA
      CA00C8C8C800BEBEBE00CDCDCD000000000000000000F1F1F600D4D4E800C0C0
      DF00B0B0D900A3A2D4009A99D1009595D200908FC9009695B5009594D2009C9B
      D8009E9DDA00A09FDB00A3A2DD00A19FDD00A1A0DE00A7A5E100A8A7E300AAA9
      E400ADABE600AFADE800B1B0EA00B2B1EA00B3B1EB00B2B0EC00AEACEC00A6A4
      EB009491E8008A86E500F4F4FB00000000000000000000000000000000000000
      000000000000F2F2F200DADADA00CACACA00BDBDBD00B3B3B300ACACAC00A9A9
      A900A2A2A200A0A0A000A9A9A900AFAFAF00B1B1B100B3B3B300B6B6B600B4B4
      B400B5B5B500B9B9B900BBBBBB00BDBDBD00BFBFBF00C1C1C100C3C3C300C4C4
      C400C5C5C500C4C4C400C2C2C200BCBCBC00AFAFAF00A7A7A700F6F6F6000000
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
      000000000000FEFEFD00F4F4F800E6E6F100D4D3E800BFBFDE00B6B5DE00ABAA
      DC00A4A3DA00A1A0DA00A19FDC00A3A1DE00A5A4E000A8A7E200ABAAE400ADAB
      E500AFADE600AFADE800AFADE800B2B1EB00B3B2EC00B5B3ED00B7B5EE00B9B7
      EF00B8B6F000C6C5F100FFFFFE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F5F5F500E9E9
      E900DADADA00C9C9C900C3C3C300BBBBBB00B5B5B500B3B3B300B4B4B400B6B6
      B600B8B8B800BBBBBB00BDBDBD00BFBFBF00C0C0C000C1C1C100C1C1C100C4C4
      C400C5C5C500C7C7C700C8C8C800CACACA00CACACA00D4D4D400FEFEFE000000
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
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00F2F2F700E6E5F200D7D7EC00C7C7E700BBBAE400B2B1E300ADABE300ABA9
      E400ACAAE800A4A3D400A4A3C600B2B0EC00B5B3EC00B6B5ED00B7B6EE00B8B6
      EF00B4B2EF00D7D6F30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFCFC00F3F3F300E9E9E900DEDEDE00D1D1
      D100C8C8C800C2C2C200BEBEBE00BDBDBD00BFBFBF00B3B3B300AFAFAF00C4C4
      C400C6C6C600C8C8C800C9C9C900C9C9C900C7C7C700E0E0E000000000000000
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
      000000000000000000000000000000000000FFFFFE00FBFBFB00F1F1F700E6E5
      F300D8D8EF00C7C6E500BAB9DE00BAB8EA00B5B4EB00B3B2EC00B4B2EE00B5B3
      EF00B4B1EF00EAE9F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FBFBFB00F3F3F300EAEAEA00DFDFDF00D0D0D000C5C5C500C9C9
      C900C6C6C600C5C5C500C6C6C600C7C7C700C6C6C600EEEEEE00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F9F9FB00F0F0F800E5E5F400D9D8F100CDCB
      F000C8C6F000F8F8FC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F900F2F2F200EAEAEA00E0E0E000D8D8D800D4D4D400F9F9F900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAF5F400FFFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6F600FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00F9F3F100FFFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00F4F4F400FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEF9F800C3BC
      BA007B99A200AFC4C90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAFAFA00BDBDBD0092929200BEBEBE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCF6F400BCBB
      BA0074A1AE00A9C0C600FFFEFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F7F7F700BBBBBB0096969600BABABA00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EAE2DF0092A0A50056A0
      B5005BC4E2002A7085009BA9AB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E3E3E3009D9D9D008E8E8E00ABABAB005F5F5F00A5A5A5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5DEDC008AA4AC0054A9
      C10069CAE6003D93AC00929FA300FFFFFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFDFDF009E9E9E0094949400B3B3B3007E7E7E009C9C9C00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF9F700C5C8C90069A5B6005ABEDB0084D6
      EC0091DAEC00589DB2004E5C600097A9AC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAFA
      FA00C7C7C70096969600A6A6A600C2C2C200C7C7C7008D8D8D0058585800A4A4
      A400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCF6F300BCC7CA0065A9BD005CBFDC007ACD
      E5007CC9DE0078CCE4002C73890082888900FFFCFB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F700C4C4C40099999900A7A7A700B9B9B900B6B6B600B8B8B800626262008686
      8600FCFCFC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EEE9E80095BDC90057B9D60070CFEA008FD5E7008ED3
      E50079D0E8005CC1DF00747E83004B62670098ADB100FFFFFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAEAEA00B3B3
      B300A2A2A200B8B8B800C3C3C300C2C2C200BBBBBB00A9A9A9007C7C7C005C5C
      5C00A7A7A700FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFD00E6E5E5008CBDCA0058BAD50070CBE40079C8DE007AC8
      DD007BC9DD0066C0D90044B3D500205C6F006F747400F4F2F100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00E5E5E500B1B1
      B100A2A2A200B5B5B500B5B5B500B5B5B500B5B5B500AAAAAA00999999004E4E
      4E0072727200F2F2F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEF9F700C4D9E00071C3DB0060C7E4007FCFE4008FD3E50080D1E70062C6
      E40055C0DF0055C5E6006B99A8008C8482003F656E009DB3B600FFFDFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFAFA00D4D4D400AFAFAF00AEAE
      AE00BBBBBB00C2C2C200BDBDBD00AEAEAE00A6A6A600AAAAAA008E8E8E008686
      86005B5B5B00ACACAC00FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F4F300B7D4DC006DC0D70067C6E10076C8DF0077C6DB007AC8DD006DC2
      DA0048B1D00039AACC0040B0D20042ADCE0024566600636B6C00E6E3E2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F500CDCDCD00ACACAC00AFAF
      AF00B4B4B400B2B2B200B5B5B500ADADAD00989898008F8F8F00969696009494
      94004A4A4A0068686800E3E3E300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFEFD00E3EC
      EE0091D1E3006BCBE60074CAE10086CEE10086D3E7006AC9E50057C2E10056C0
      DF0058C0DE005AC7E6005EB2CC00979494008A8B8B0035647000A2B7BA00FFFB
      FA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00E9E9E900C1C1C100B4B4B400B5B5B500BCBC
      BC00C0C0C000B2B2B200A8A8A800A7A7A700A7A7A700ADADAD009E9E9E009595
      95008A8A8A0058585800B1B1B100FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFBFA00D8E5
      E90087CBDD006DC8E1007DCCE10074C5DA0077C6DB0073C4DA0052B5D1003BAB
      CC003CACCE003FAFCF003FAFD00043B5D70040A3C2002A57650060696A00D5D2
      D100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC00E2E2E200BABABA00B2B2B200B8B8B800B1B1
      B100B2B2B200B0B0B0009D9D9D00909090009292920094949400949494009A9A
      9A008C8C8C004C4C4C0066666600D2D2D2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4F5F500AFDDEA0074CE
      E80077CEE5008ACEE00088D1E40074CDE6005CC5E20057C0DF0058C0DF005CC4
      E3005CC4E3005FC8E6005AC4E3008397A000B4ADAB007D838500366A7700A7B9
      BC00FFFBF9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F4F4F400D2D2D200B8B8B800B8B8B800BDBDBD00BFBFBF00B7B7
      B700ABABAB00A7A7A700A7A7A700ABABAB00ABABAB00AFAFAF00ABABAB009393
      9300AEAEAE00818181005D5D5D00B4B4B400FBFBFB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFC00EBEFF000A3D6E30072CA
      E1007ECEE30084CCDE007FCADD0073C4D9005EBAD4003FACCC003BABCC0040AF
      CE003FAFCF0040B0D10041B1D20041B1D30045B8DA003E96B40037616D00646E
      6E00C8C4C400FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00EEEEEE00C9C9C900B4B4B400BABABA00BABABA00B7B7B700B0B0
      B000A4A4A4009292920090909000949494009494940095959500969696009797
      97009D9D9D0082828200575757006A6A6A00C5C5C500FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFAF900C8E6EF0085D4EA007ACFE6008BD0
      E10099D6E50088D3E70060C5E00059C1DE0060C7E4005DC5E2005BC3E0005DC5
      E3005EC6E5005FC7E5005ECDED006AA4B700ACA5A400C1BEBD00747C80003F73
      8000A9BABD00FEFAF90000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAFA
      FA00DFDFDF00C1C1C100BABABA00BEBEBE00C6C6C600C0C0C000ACACAC00A8A8
      A800AEAEAE00ACACAC00AAAAAA00ACACAC00ADADAD00AEAEAE00B2B2B2009797
      9700A7A7A700BEBEBE007A7A7A0066666600B5B5B500FBFBFB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFE00F8F5F400BBDFE8007FCEE40080CEE3008ACE
      E00087CCDE0087CDDF0073C4DA0046AFCD003CABCB0040AECE0041B0CF0040B0
      D00041B1D10041B1D20042B2D30044B3D40046B4D50048B9DB00438EA700456E
      7A006E777700C2BEBE00F6F6F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F5F5
      F500D6D6D600BBBBBB00BBBBBB00BDBDBD00BBBBBB00BBBBBB00B0B0B0009696
      9600909090009494940095959500959595009696960096969600979797009999
      99009A9A9A009E9E9E007D7D7D006464640074747400BFBFBF00F6F6F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFDFC00DEEDF2009AD9EB0081D2E7008ED1E3009CD6E4009BDA
      E90089D3E70064C4DE005AC0DD005CC1DD005FC4E10061C7E5005FC6E40060C8
      E6005FC7E60060C9E70061CDEB0061BDD900999B9D00C4C3C200CBC8C600737C
      8000487B8800ADBBBE00FEFAF900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00E9E9E900CACA
      CA00BEBEBE00C0C0C000C7C7C700CACACA00C1C1C100ACACAC00A7A7A700A8A8
      A800ACACAC00AFAFAF00ADADAD00AFAFAF00AEAEAE00B0B0B000B3B3B300A7A7
      A7009B9B9B00C3C3C300C8C8C8007A7A7A006E6E6E00B7B7B700FBFBFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFAF800D5E7EC0091D4E50082D1E50090D2E3008DCFDF008BCE
      DF0086CCDE0071C2D90052B4D0003EACCC0042AECE0042B0CF0042B1D00042B2
      D20042B2D20044B3D30046B4D50048B5D60049B6D7004AB9DA0049B6D6004C8C
      A300507B87007B838400C1BEBD00EEEEEE000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00E2E2E200C3C3
      C300BDBDBD00C1C1C100BEBEBE00BDBDBD00BABABA00AEAEAE009C9C9C009292
      92009494940095959500969696009797970097979700989898009A9A9A009B9B
      9B009C9C9C009F9F9F009C9C9C007E7E7E007070700080808000BEBEBE00EEEE
      EE0000000000000000000000000000000000000000000000000000000000FFFF
      FE00EEF3F500B2E0EC008CD6E90092D4E500A1D7E400A5DCE90098D8E80088D1
      E4007DCCE1005EC1DB005EC2DD0060C4DF0061C6E30065CAE80063C9E70062C9
      E70064CBE90064CCEA0065CDEC0060CDED0089A8B300BAB5B300D3D4D400CFCC
      CB00788487004D828F00B0BDBF00FEFAF9000000000000000000000000000000
      0000000000000000000000000000FEFEFE00F2F2F200D4D4D400C3C3C300C3C3
      C300C9C9C900CECECE00C8C8C800BFBFBF00B8B8B800A8A8A800A9A9A900ABAB
      AB00AEAEAE00B2B2B200B1B1B100B0B0B000B2B2B200B3B3B300B4B4B400B3B3
      B300A1A1A100B6B6B600D3D3D300CCCCCC008181810074747400B9B9B900FBFB
      FB0000000000000000000000000000000000000000000000000000000000FFFC
      FB00E8EEF000ABDBE7008BD4E70096D6E50096D3E20092D1E1008FCFE00081C9
      DC006DC0D7006BBFD70058B7D30041AECD0043B0CF0043B1D00043B2D20044B3
      D30047B4D4004AB6D5004BB6D6004BB7D7004BB8D8004DB9D9004EBDDE0049AF
      CE00508FA7005084920089919100C8C5C400E7E8E80000000000000000000000
      0000000000000000000000000000FCFCFC00ECECEC00CFCFCF00C2C2C200C5C5
      C500C3C3C300C1C1C100BFBFBF00B7B7B700ACACAC00ABABAB00A0A0A0009494
      9400969696009696960097979700989898009A9A9A009C9C9C009D9D9D009D9D
      9D009E9E9E009F9F9F00A3A3A3009797970082828200777777008E8E8E00C5C5
      C500E7E7E7000000000000000000000000000000000000000000F7F7F700C4E4
      ED0097D9EA0098D7E700A6D9E400AFDEE800A7DCE90096D5E50092D5E7008FD4
      E50077CADF005FC2DD0062C5DF0063C6E10065C9E50063C8E40068CEEB0065CC
      E90064CBE80065CCEA0067CFED0064D3F20071B7CD00B5AFAF00D0CFCF00E6E6
      E600D1CDCC0089969A0050849100B5C1C200FFFBFA0000000000000000000000
      00000000000000000000F7F7F700DCDCDC00C8C8C800C7C7C700CBCBCB00D1D1
      D100CECECE00C5C5C500C4C4C400C2C2C200B5B5B500AAAAAA00ACACAC00AEAE
      AE00B1B1B100AFAFAF00B5B5B500B3B3B300B2B2B200B3B3B300B6B6B600B8B8
      B800A7A7A700B1B1B100CFCFCF00E6E6E600CECECE009393930077777700BDBD
      BD00FCFCFC0000000000000000000000000000000000FFFEFD00F3F3F300BEE0
      E80095D7E8009BD9E900A0D8E5009BD5E30098D3E2008FCFDF007EC7DB0075C4
      D90074C3D90072C3DA005BB9D40041B0CF0044B1D00044B2D20047B4D3004BB6
      D4004DB7D6004DB7D7004DB9D7004EBAD9004FBADA004FBBDB004CBBDC004BC0
      E20041A4C500549AB200578D9B00969C9C00D2CECE00E5E5E500FDFDFD000000
      000000000000FEFEFE00F3F3F300D7D7D700C6C6C600C9C9C900C9C9C900C6C6
      C600C4C4C400BFBFBF00B5B5B500B0B0B000B0B0B000AFAFAF00A2A2A2009595
      950097979700989898009A9A9A009C9C9C009E9E9E009E9E9E009F9F9F00A0A0
      A000A1A1A100A1A1A100A1A1A100A4A4A4008E8E8E008A8A8A007F7F7F009A9A
      9A00CFCFCF00E5E5E500FDFDFD000000000000000000DEF3F800A4DCEA009FDA
      E900ADDBE600B6DFE800B4E1EB00A6DBE7009BD5E30097D3E30096D5E60096D8
      EA0070C8E00063C5DF0065C6E00065C8E30066C9E50067CCE80067CCE9006AD0
      ED0066CDEA0066CDEB0067CFED0067D2F00063C8E600ABB8BD00E0DEDC00EEEE
      EE00FCFCFC00D5D2D100A1ADB10057879200BAC4C600FEFAFA00000000000000
      000000000000EDEDED00CECECE00CBCBCB00CFCFCF00D4D4D400D5D5D500CDCD
      CD00C6C6C600C4C4C400C5C5C500C8C8C800B2B2B200ADADAD00AEAEAE00B0B0
      B000B1B1B100B3B3B300B4B4B400B7B7B700B4B4B400B4B4B400B6B6B600B8B8
      B800B0B0B000B5B5B500DEDEDE00EEEEEE00FCFCFC00D2D2D200AAAAAA007A7A
      7A00C1C1C100FBFBFB00000000000000000000000000DAF0F5009FD9E800A1DC
      EB00ABDDE900A5D9E500A1D7E4009CD5E3008ECEDF0083CADC0080C9DC007EC8
      DC007AC7DB0078C6DC005EBCD60042B1D00047B3D2004CB6D4004FB7D5004FB7
      D6004FB9D70050BAD80050BCD90050BDDA004DBCDB004ABBDD004ABCDD004BBD
      DF004CC0E300449FBE0062AAC2006197A500A4AAAB00DFDBDB00EAEBEB00FCFC
      FC0000000000EAEAEA00CACACA00CDCDCD00D0D0D000CBCBCB00C9C9C900C6C6
      C600BEBEBE00B8B8B800B7B7B700B6B6B600B4B4B400B3B3B300A5A5A5009696
      9600999999009C9C9C009E9E9E009E9E9E009F9F9F00A0A0A000A1A1A100A2A2
      A200A1A1A100A0A0A000A1A1A100A2A2A200A5A5A5008B8B8B009A9A9A008989
      8900A8A8A800DCDCDC00EAEAEA00FCFCFC00D4F1F800A6E4F400B7E5F000BFE2
      E900BEE4EC00B7E2EB00ACDCE800A5D9E500A1D7E5009FD9E7009AD6E60096D7
      E9006AC7E00066C5DF0067C7E20068C9E40067CAE50067CBE70066CCE7006DD4
      F0006DD3F00069D0ED006AD2F00065D4F40068D0EE00A4BCC500DDD9D700F5F5
      F50000000000FCFCFC00CBC7C600B8C1C40065919B00C3CBCC00FEFBFA000000
      0000E9E9E900D4D4D400D9D9D900D8D8D800DADADA00D6D6D600D0D0D000CBCB
      CB00C9C9C900CACACA00C7C7C700C7C7C700B0B0B000AEAEAE00B0B0B000B1B1
      B100B2B2B200B3B3B300B3B3B300BBBBBB00BABABA00B7B7B700B9B9B900B9B9
      B900B7B7B700B7B7B700D9D9D900F5F5F50000000000FCFCFC00C8C8C800BFBF
      BF0085858500C8C8C800FBFBFB0000000000D7F2F9009FE1F200B6E7F300B2DF
      EB00AADBE600A7DAE6009ED5E30093D0E1008ECFE0008BCEDF0087CCDE0083CB
      DE007FC9DD007ECADE0064BFD90049B4D20051B8D50052B9D60052B9D70052BB
      D80053BCD80052BDDA004FBDDB004BBCDB004ABCDC004BBCDE004BBDDF004CBE
      E0004DC0E3004BBEE1004DA3C00074BCD4006AA0AE00B6BCBD00F4F1F000FBFB
      FB00EBEBEB00D0D0D000DADADA00D4D4D400CECECE00CDCDCD00C7C7C700C1C1
      C100BFBFBF00BDBDBD00BBBBBB00B9B9B900B7B7B700B7B7B700A9A9A9009A9A
      9A009F9F9F00A0A0A000A0A0A000A1A1A100A2A2A200A3A3A300A2A2A200A0A0
      A000A0A0A000A1A1A100A2A2A200A3A3A300A5A5A500A3A3A30090909000ACAC
      AC0092929200BABABA00F1F1F100FBFBFB00E5F7FA00BEEAF500BDEAF500C6EA
      F200BCE3ED00B6E1EB00B2E0EA00ABDBE700A7DBE800A2D9E700A1DAE8008FD3
      E5006BCAE20069C8E1006ACBE4006BCCE6006ACCE7006ACDE80069CDE9006ED4
      EF0072D7F4006BD5F40064D0EE0080C7DD00C3D0D400E7E4E300E2E2E200DEDE
      DE00FAFAFA0000000000F4F4F300BBBCBC0097CDDF0075B4C400CCD4D500FFFD
      FC00F2F2F200DFDFDF00DEDEDE00E0E0E000D9D9D900D6D6D600D4D4D400CFCF
      CF00CECECE00CBCBCB00CBCBCB00C2C2C200B2B2B200B0B0B000B3B3B300B4B4
      B400B4B4B400B5B5B500B5B5B500BBBBBB00BFBFBF00BCBCBC00B6B6B600B6B6
      B600CDCDCD00E4E4E400E2E2E200DEDEDE00FAFAFA0000000000F3F3F300BBBB
      BB00C1C1C100A4A4A400D1D1D100FDFDFD00FCFEFE00BBE9F400B8E8F500B4E5
      F100ACDFEB00A2D7E4009CD3E20099D3E30095D2E20091D1E1008CCFE10088CE
      E00084CCE00086CDE10075C6DC0052B8D50054BAD60054BBD70055BDD80056BD
      D90052BDDA004CBCDB004ABCDC004CBDDD004CBEDE004DBFDF004DBFE1004DC0
      E2004FC2E50051C6E8004CB2D10066B8D4008AD6EF0078B3C100CBD3D300FEFC
      FC00FDFDFD00DDDDDD00DCDCDC00D8D8D800D2D2D200C9C9C900C5C5C500C5C5
      C500C3C3C300C1C1C100BEBEBE00BCBCBC00BABABA00BCBCBC00B2B2B2009F9F
      9F00A1A1A100A2A2A200A3A3A300A4A4A400A3A3A300A1A1A100A0A0A000A2A2
      A200A2A2A200A3A3A300A4A4A400A5A5A500A7A7A700AAAAAA009A9A9A00A6A6
      A600C5C5C500A4A4A400D0D0D000FCFCFC00F4FBFD00C7EDF500C7EBF400C8EC
      F400C8EDF500BDE5EE00B7E2EC00AFDDE900ACDDE900A6DBE800A6DCEA0086D0
      E30069C7E00070CEE7006DCCE5006CCCE6006CCDE7006CCEE8006ED1EC006CD2
      EF006AD6F50080D7F000B4D0D900E2DDDB00E9E5E400EEEFEE00E4E4E400E1E1
      E100EDEDED00FEFEFE0000000000E0E4E50070B2C800A4DFF200D3DBDD00FCFA
      F900F9F9F900E3E3E300E2E2E200E2E2E200E3E3E300DADADA00D7D7D700D1D1
      D100D0D0D000CDCDCD00CECECE00BDBDBD00B0B0B000B7B7B700B4B4B400B4B4
      B400B5B5B500B6B6B600B9B9B900B9B9B900BCBCBC00C2C2C200C9C9C900DEDE
      DE00E6E6E600EEEEEE00E4E4E400E1E1E100EDEDED00FEFEFE0000000000E3E3
      E300A3A3A300D1D1D100D9D9D900FAFAFA0000000000E7F7FB00BAE8F400B8E8
      F500ADE3F100A9DFEE00A4DAE8009FD6E4009AD4E40096D3E40091D2E3008FD1
      E30091D2E20093D3E3007FCBDF0055BAD60057BCD70058BED90055BDD9004EBC
      DA004BBCDB004CBCDC004DBDDD004DBEDE004EBFE0004EC1E1004FC2E30051C4
      E6004FBEE00055B5D40068C2DF0074D1F0007ED7F500A6DDEF00D3DBDD00FCFA
      F90000000000F3F3F300DCDCDC00DCDCDC00D5D5D500D2D2D200CCCCCC00C8C8
      C800C6C6C600C4C4C400C2C2C200C1C1C100C1C1C100C3C3C300B8B8B800A1A1
      A100A3A3A300A5A5A500A3A3A300A1A1A100A0A0A000A1A1A100A2A2A200A3A3
      A300A4A4A400A5A5A500A6A6A600A9A9A900A4A4A4009F9F9F00ADADAD00BCBC
      BC00C3C3C300D0D0D000D9D9D900FAFAFA00FEFFFF00C8EDF500D3F0F700D0F0
      F700CCEEF700C8EDF600BFE8F100B7E2EC00B0DEEA00ABDDE900AADEEA0080CF
      E3006BC9E10070CCE40072D0E8006DCCE6006FCFE8006ED0EB0069D1EE006DCC
      E7009AC8D600E8E9EA0000000000ECEBEB00E1E1E100DBDBDB00DEDEDE00DEDE
      DE00E7E7E700FEFDFD00FDFDFD00ECF2F500CBDADF00EDEEEF00FFFDFD000000
      0000FEFEFE00E3E3E300E8E8E800E7E7E700E5E5E500E3E3E300DDDDDD00D7D7
      D700D2D2D200D0D0D000D0D0D000BBBBBB00B1B1B100B5B5B500B8B8B800B5B5
      B500B7B7B700B8B8B800B8B8B800B5B5B500BDBDBD00E9E9E90000000000EBEB
      EB00E1E1E100DBDBDB00DEDEDE00DEDEDE00E7E7E700FDFDFD00FDFDFD00F1F1
      F100D6D6D600EEEEEE00FDFDFD00000000000000000000000000D1F0F600C4EB
      F600B7E7F500B0E4F200ABE2F000A6DEEC00A0D8E7009DD6E6009DD6E5009DD7
      E5009BD6E50098D6E5008BD0E3005ABDD80057BDD90050BCD9004CBCDA004CBC
      DB004EBDDC004FBEDD004FBFDF004FC0E00050C2E20052C5E60051C3E30052B8
      D80062BBD80073CDEA0077D5F40089D8F100C0E0EB00F2F0F000FFFDFC000000
      00000000000000000000E7E7E700E1E1E100DBDBDB00D7D7D700D4D4D400D0D0
      D000CACACA00C8C8C800C8C8C800C8C8C800C7C7C700C6C6C600BFBFBF00A5A5
      A500A4A4A400A1A1A100A0A0A000A1A1A100A2A2A200A3A3A300A4A4A400A5A5
      A500A6A6A600A9A9A900A7A7A700A0A0A000A7A7A700B8B8B800C0C0C000C6C6
      C600D9D9D900F0F0F000FDFDFD000000000000000000D5F1F700D1F0F700D2F0
      F700CEEFF600CBEEF700C8EEF700C0E9F200B7E3ED00AFDFEA00AEE0EC007CCF
      E3006FCBE2006FCBE20076D2EA0073D1E9006FD2ED006ACDE70086C5D700CAD5
      D800E6DFDD00EEECEC00FEFEFE00F7F7F700DFDFDF00D8D8D800E0E1E100EFEE
      EE0000000000EBF3F600D0DFE400DDE3E500FAF8F80000000000000000000000
      000000000000E9E9E900E8E8E800E8E8E800E6E6E600E5E5E500E4E4E400DEDE
      DE00D7D7D700D2D2D200D3D3D300BABABA00B4B4B400B4B4B400BBBBBB00B9B9
      B900BABABA00B4B4B400B6B6B600D2D2D200E0E0E000ECECEC00FEFEFE00F7F7
      F700DFDFDF00D8D8D800E0E0E000EEEEEE0000000000F1F1F100DBDBDB00E1E1
      E100F8F8F8000000000000000000000000000000000000000000F5FCFD00C7EC
      F500CAEEF700B7E7F500B1E4F200ACE2F000ADE2EF00AEE0EC00AADBE800A4DA
      E700A1D9E7009FD9E70097D6E60059BFD9004BBBD8004DBCDA004EBDDB004FBE
      DC0050BFDE0050C0DF0051C1E00052C4E40053C6E60051BCDC005BB7D50070C7
      E40076D4F20080D6F200ABDBEB00E5E9EA00FEF8F70000000000000000000000
      00000000000000000000FAFAFA00E2E2E200E5E5E500DBDBDB00D7D7D700D4D4
      D400D4D4D400D3D3D300CFCFCF00CCCCCC00CBCBCB00CACACA00C6C6C600A5A5
      A5009F9F9F00A1A1A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A8A8
      A800AAAAAA00A3A3A300A2A2A200B3B3B300BEBEBE00C2C2C200D0D0D000E8E8
      E800F9F9F90000000000000000000000000000000000E4F6FA00CEEFF600D7F2
      F800D1F0F700CDEEF600CBEEF700C5EBF500BCE6F000B9E5EF00AEE0EC0079CF
      E30071CCE20074CEE50076D6ED0072D6EF007AC6DB00B0C7CE00DAD4D200E7E3
      E200E5E6E500E9E9E900E2E2E20000000000F3F3F300E8E6E600FFFEFD00F4FB
      FD00CFE1E800CFDBDE00F0EFEF00FFFFFE000000000000000000000000000000
      000000000000F1F1F100E6E6E600EBEBEB00E8E8E800E5E5E500E5E5E500E1E1
      E100DBDBDB00D9D9D900D3D3D300B9B9B900B5B5B500B7B7B700BDBDBD00BDBD
      BD00B3B3B300C1C1C100D5D5D500E4E4E400E5E5E500E9E9E900E2E2E2000000
      0000F3F3F300E6E6E600FEFEFE00F9F9F900DDDDDD00D8D8D800EFEFEF00FEFE
      FE0000000000000000000000000000000000000000000000000000000000E0F5
      F900CEEFF600CAEEF800BBE9F600BDE8F300BBE7F100B7E6F100B3E3F000ADDF
      EC00A7DCE9009FD9E80098D7E8005DC2DC004CBCD90050BEDB0051BFDD0052C0
      DE0052C1DF0053C3E20054C5E50051BEDD0054B2D00069C0DD0076D1F0007AD6
      F30099D7EC00D3E1E600F9F2F000FFFEFD000000000000000000000000000000
      0000000000000000000000000000EFEFEF00E6E6E600E5E5E500DEDEDE00DDDD
      DD00DBDBDB00DADADA00D7D7D700D2D2D200CECECE00CACACA00C7C7C700A9A9
      A900A0A0A000A3A3A300A4A4A400A5A5A500A6A6A600A8A8A800AAAAAA00A4A4
      A4009C9C9C00ACACAC00BDBDBD00C1C1C100C9C9C900DEDEDE00F3F3F300FEFE
      FE000000000000000000000000000000000000000000F1FAFC00CDEEF500DAF3
      F800D5F1F700D1F0F600CCEEF500CAEEF700C2E9F300BFE8F200B0E2EE0075CC
      E10074CEE40072CEE50072C6DC00AAD0DB00ECEAEB00F1ECEB00E5E5E500E9E9
      E900E9E9E900DFDFDF00DDDDDD00F2F2F20000000000F9FDFE00D1E6ED00C4D7
      DD00E5E7E800FDFCFB0000000000000000000000000000000000000000000000
      000000000000F7F7F700E5E5E500ECECEC00E9E9E900E7E7E700E5E5E500E5E5
      E500DFDFDF00DDDDDD00D5D5D500B6B6B600B7B7B700B7B7B700B1B1B100C7C7
      C700EBEBEB00EDEDED00E5E5E500E9E9E900E9E9E900DFDFDF00DDDDDD00F2F2
      F20000000000FCFCFC00E1E1E100D2D2D200E6E6E600FCFCFC00000000000000
      000000000000000000000000000000000000000000000000000000000000FEFF
      FF00CDEEF600D7F2F800CFF0F700C7EDF600C2EAF400BDE7F200B9E6F200B0E3
      F100A5DEEE009EDAEB00A0DAEB0070CAE1004EBEDB0053C0DD0054C1DE0054C2
      E00056C5E30054C2E10052B4D1005DB1CC006FC4E00076D4F1008BD6EE00C0DC
      E500EFECEA00FFFBFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00E5E5E500EBEBEB00E7E7E700E3E3
      E300E0E0E000DCDCDC00DBDBDB00D6D6D600D0D0D000CBCBCB00CCCCCC00B3B3
      B300A2A2A200A5A5A500A6A6A600A7A7A700AAAAAA00A7A7A7009D9D9D009E9E
      9E00B1B1B100BEBEBE00C5C5C500D5D5D500ECECEC00FCFCFC00000000000000
      00000000000000000000000000000000000000000000FCFEFE00CCEEF500DCF3
      F800D8F2F800D4F1F700D0EFF600CBEDF500C9EEF700C3EAF200B5E7F80079D0
      ED0073CEE4007EC8DD00C5CCCF00E8E2E000FFFEFE00F6F6F600DFDFDF00E9E9
      E900DBDBDB00E1E0E000FBFAF900FDFFFF00D6E9F000BAD3DC00D7DEE100F9F6
      F600000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00E5E5E500EDEDED00EBEBEB00E9E9E900E7E7E700E4E4
      E400E4E4E400DFDFDF00DCDCDC00BCBCBC00B7B7B700B6B6B600CACACA00E3E3
      E300FEFEFE00F6F6F600DFDFDF00E9E9E900DBDBDB00E0E0E000FAFAFA00FEFE
      FE00E5E5E500CDCDCD00DCDCDC00F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFFAFC00CCEEF500DCF3F800D0F0F700C8EDF700C0E9F400B3E4F100ACE2
      F000A9E1F000A6E0F000A6DFEF0089D3E70051C0DC0056C2DF0056C3E00057C4
      E20053B9D70057AFCB006BBEDA0074CFEC007FD2ED00AAD5E300E2E4E400FCF7
      F500000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700E5E5E500EDEDED00E7E7
      E700E4E4E400DFDFDF00D8D8D800D4D4D400D3D3D300D2D2D200D1D1D100C1C1
      C100A4A4A400A7A7A700A8A8A800A9A9A900A1A1A1009B9B9B00ABABAB00BABA
      BA00BFBFBF00CBCBCB00E3E3E300F8F8F8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6F1F700DBF3
      F700DAF2F800D7F2F800D4F1F700CFEFF600C9EDF500C8EDF800ADE3DD0073C5
      5F0076C082007DCCE900DEDEDF00E1E0DF00E5E5E60000000000E7E7E700DCDC
      DC00EEEDED00FFFFFE00DDECF100B2D2DC00C6D5D900F1EFEE00FFFFFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EAEAEA00ECECEC00ECECEC00EBEBEB00E9E9E900E6E6
      E600E3E3E300E4E4E400CFCFCF008787870092929200BBBBBB00DEDEDE00E0E0
      E000E5E5E50000000000E7E7E700DCDCDC00EDEDED00FEFEFE00E8E8E800CACA
      CA00D1D1D100EFEFEF00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DBF3F800D6F1F700DDF3F800CBEEF700BCEAF700B8E8F400B4E5
      F200AFE3F100ACE3F100ABE2F1009FDEEF005BC5E80057C4E8005AC7E80055B6
      D20065B8D30074CDEA007AD3F00099D3E600D1DBDE00F6EFED00FFFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECECEC00EAEAEA00EDED
      ED00E5E5E500DFDFDF00DCDCDC00D9D9D900D6D6D600D5D5D500D4D4D400CECE
      CE00ADADAD00ABABAB00ADADAD009F9F9F00A5A5A500B9B9B900BFBFBF00C6C6
      C600D8D8D800F0F0F000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3F6FA00D7F2
      F700DEF4F800DAF2F800D6F2F800D3F3FA00D2F1F900E8F7FF00B4ED93005CC6
      000074BF72008CC5DC00D8DADC00E5E4E400DADADA00EEEEEE00F8F9F900F9F8
      F700F3F5F600B7D1D900B5CBD200E5E6E600FEFCFA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F1F1F100EAEAEA00EEEEEE00ECECEC00EAEAEA00EAEA
      EA00E9E9E900F4F4F400BCBCBC00606060008C8C8C00B9B9B900DADADA00E4E4
      E400DADADA00EEEEEE00F8F8F800F8F8F800F4F4F400CBCBCB00C6C6C600E5E5
      E500FCFCFC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FAFDFE00CEEFF600DFF4F800DBF2F800CAEEF700BFEBF700BBE9
      F500B6E6F300B3E4F200ADE3F200ACE3F6006DD1C2005BC04D0061C3AD0058C2
      E7006BC4E1008CD4EB00BED5DC00ECE7E600FEFBFA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00E6E6E600EEEE
      EE00ECECEC00E5E5E500E0E0E000DDDDDD00DADADA00D8D8D800D6D6D600D7D7
      D700AAAAAA00787878009B9B9B00ABABAB00B0B0B000C3C3C300CFCFCF00E8E8
      E800FBFBFB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFFAFC00D4F1
      F700E1F5F800DCF4FA00DDF6FB00CEDFE300E2E6E70000000000B9EBCD007FCE
      AB00C7DEEB00E2DFDF00D8D7D700DADADA00E7E7E700F0F0F000F7F6F600E1E5
      E600B9C9CE00D4D9DB00FAF7F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F7F7F700E9E9E900EFEFEF00EEEEEE00EFEFEF00DADA
      DA00E5E5E50000000000D0D0D000A8A8A800DADADA00E0E0E000D7D7D700DADA
      DA00E7E7E700F0F0F000F6F6F600E4E4E400C5C5C500D8D8D800F7F7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EAF8FB00D2F0F700E1F5F900DCF3F800CAEEF800C1EC
      F800BCE9F500B9E9F600BEE9F600DEF3FF009CE77F0053C6000064BA380058C5
      E0007FB7CA00E0DEDE00FBF6F400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F4F4F400E8E8
      E800EFEFEF00EDEDED00E5E5E500E1E1E100DEDEDE00DDDDDD00DFDFDF00F0F0
      F000ABABAB005D5D5D0072727200A9A9A900AAAAAA00DEDEDE00F7F7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAFEFE00D2F0
      F600E5F8FB00E1F0F300D2D6D700DCDADB00DFF2F600B5E3ED00BADAE800EAE9
      F200F8F4F300F2F1F100DFDFDF00E8E8E800F2F2F200F2F2F200DADBDC00CCCF
      D100EDEDEC00FFFFFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC00E8E8E800F2F2F200ECECEC00D5D5D500DBDB
      DB00EDEDED00D7D7D700D4D4D400ECECEC00F5F5F500F1F1F100DFDFDF00E8E8
      E800F2F2F200F2F2F200DBDBDB00CECECE00ECECEC00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D8F2F800DDF4F800E1F5F900DBF3F800CCF0
      F900CCF3FD00C5DDE500DFEBEF00FDFFFF00D1F6D30055CD610068BAB000A5C2
      CC00E9E8E800FFFFFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EBEB
      EB00EDEDED00EFEFEF00ECECEC00E7E7E700E9E9E900D7D7D700E8E8E800FEFE
      FE00DEDEDE00818181009B9B9B00BBBBBB00E8E8E800FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D7F2
      F700F4FEFF00E4E1E100DCE7E900C2ECF500B4DDE700E7F0F30000000000F5F4
      F400EBEBEB00EEEEED00ECECEC00F0F0F000EFEFEF00DADADA00DFDFDF00FBFB
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EAEAEA00FBFBFB00E2E2E200E4E4E400E1E1
      E100D2D2D200EEEEEE0000000000F4F4F400EBEBEB00EDEDED00ECECEC00F0F0
      F000EFEFEF00DADADA00DFDFDF00FBFBFB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F6FCFD00D3F1F600E3F6F900E2F6FA00E3F1
      F400C9D3D600C8CDCF00F2F9FB00CCF2FB0086CCE2008EBAD300DADBE300FFFC
      FA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAFA
      FA00E8E8E800F0F0F000F0F0F000EDEDED00D0D0D000CCCCCC00F7F7F700E8E8
      E800BCBCBC00B3B3B300DDDDDD00FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E3F6
      FA00E5F7FB00CFEFF600B2DEE800DBEBEF00FFFEFE000000000000000000FEFE
      FE00EFEFEF00E3E7E800F1F2F200F4F3F300E0E0E000F1F1F100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F1F1F100F2F2F200E6E6E600D2D2D200E7E7
      E700FEFEFE000000000000000000FEFEFE00EFEFEF00E6E6E600F1F1F100F3F3
      F300E0E0E000F1F1F10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4F6FA00DCF3F800FCFFFF00CDCC
      CC00E2E1E100E2FAFF009DDFF1008CC6D600C1CDD200FAF4F300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1F1F100EDEDED00FEFEFE00CCCCCC00E1E1E100F3F3F300CFCFCF00B8B8
      B800CACACA00F5F5F50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFFA
      FC00AFDEE900CFE5EB00FCFCFC00000000000000000000000000000000000000
      0000FEFEFD00F3F8FA00F8FAFA00F6F5F500FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F7F700D2D2D200DFDFDF00FCFCFC000000
      000000000000000000000000000000000000FDFDFD00F7F7F700F9F9F900F5F5
      F500FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFFFF00D6F1F700F2FBFC00F7FE
      FF00C2ECF5009AD3E200C8E0E800FEFBFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00EAEAEA00F8F8F800FCFCFC00E1E1E100C5C5C500DADADA00FBFB
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FF00FAFBFC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FBFBFB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4FCFD00C5EBF400A1D8
      E500BBDAE300F7F8F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9F9F900E1E1E100CACACA00D2D2D200F7F7F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3F3F700EAF1
      F300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFEFEF00EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FAFAFA00B7B7B70093868000A68A7B00BBA79900BFAFA4009F8B
      7C00B4A79A00D6CBC300CDC1B600DED3CC00D8CBC400CABBB200C9B6AC00C6A2
      9100E5C0B100CDA69500503A300075727100C4C4C400B8B8B800CDCDCD00F4F4
      F400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00B7B7B7008888
      88008E8E8E00A9A9A900B0B0B0008C8C8C00A7A7A700CCCCCC00C1C1C100D4D4
      D400CDCDCD00BDBDBD00B9B9B900A8A8A800C7C7C700ADADAD003E3E3E007272
      7200C4C4C400B8B8B800CDCDCD00F4F4F4000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFDFD009C918D0096817500C2B4AB00B5AB9F00B8B0A800B9B2
      A900C1B9B000C2BBB000DCD6CF00E7DDD800D5CAC100CFC2BB00C7BCB600BDB0
      A600D9C6BC00F5E2DA00CAB0A50085756F00BDBFC000BABABA00D1D1D100F5F5
      F500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00939393008484
      8400B5B5B500AAAAAA00B0B0B000B1B1B100B8B8B800B9B9B900D5D5D500DEDE
      DE00CACACA00C4C4C400BDBDBD00B1B1B100C9C9C900E5E5E500B5B5B5007878
      7800BEBEBE00BABABA00D1D1D100F5F5F5000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00F9F9F900F6F6F600F2F2F200F0F0F000EEEEEE00EBEBEB00E7E7E700E5E5
      E500E1E1E100DDDDDD00DADADA00D6D6D600D2D2D200CECECE00CACACA00C6C6
      C600C1C2C200BDBDBE00B8B8B900D1D1D100FCFCFC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFCFC00F9F9F900F6F6F600F2F2F200F0F0
      F000EEEEEE00EBEBEB00E7E7E700E5E5E500E1E1E100DDDDDD00DADADA00D6D6
      D600D2D2D200CECECE00CACACA00C6C6C600C1C1C100BDBDBD00B8B8B800D1D1
      D100FCFCFC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFFFF00A9918700A7948800DFD9D500D2CBC600C6BEB700CBC3
      BD00E1DDDC00D5D0CB00D5D2CC00DFDCD800D0C6C000C2B8B000C1B7AF00D1C5
      C000D7CCC600E5D8D300DACAC400997D7200C1C4C400CECECE00EAEAEA00FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00959595009696
      9600D9D9D900CBCBCB00BEBEBE00C3C3C300DEDEDE00D0D0D000D1D1D100DBDB
      DB00C7C7C700B8B8B800B7B7B700C7C7C700CDCDCD00DADADA00CDCDCD008282
      8200C3C3C300CECECE00EAEAEA00FDFDFD000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00F9F9F900E6E6E600A3A2A200898B8C008B91950089909400888F9300888F
      9300888E9200888B8F00898E93008A9196008B9297008C9399008E959B009198
      9C00959A9E00989DA0009B9FA20074747400D0CFCF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFD00F9F9F900E6E6E600A2A2A2008A8A
      8A00909090008F8F8F008E8E8E008E8E8E008D8D8D008B8B8B008E8E8E009090
      900091919100929292009494940097979700999999009C9C9C009E9E9E007474
      7400CFCFCF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8F7F600B8998C00C1B1A500C6BFB900E2DEDF00D7D1CF00AFA7
      9C00D3BEA900DBD0C400D6D5D100E8E6E300D9D4CF00DBD7D400C8C2BC00BFB6
      AF00D5CEC900D7CECA00E9DAD400AB8B7F00E3E4E500F3F3F300FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F7009F9F9F00B2B2
      B200BFBFBF00DFDFDF00D2D2D200A6A6A600BEBEBE00CFCFCF00D4D4D400E5E5
      E500D4D4D400D7D7D700C2C2C200B6B6B600CECECE00CFCFCF00DDDDDD009191
      9100E4E4E400F3F3F300FDFDFD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FDFDFD00FDFD
      FD00F9F9F900E9E9E900D6D8D900D0C2BA00CBAC9900CFAF9C00D2AF9A00D3AF
      9700D6B09600DDC2AC00DCB59500DCA98200DEA67A00E0A47500E0A27000DB99
      6700D58D5B00D2814C00DF9767008F8E8D0080818200ECECEC00F8F7F800F8F7
      F800F9F9F900FAFAFA00FDFCFD00000000000000000000000000000000000000
      000000000000FEFEFE00FDFDFD00FDFDFD00F9F9F900E9E9E900D7D7D700C4C4
      C400B0B0B000B3B3B300B3B3B300B3B3B300B4B4B400C3C3C300B7B7B700ADAD
      AD00AAAAAA00A8A8A800A6A6A6009E9E9E00949494008A8A8A009F9F9F008E8E
      8E0081818100ECECEC00F7F7F700F7F7F700F9F9F900FAFAFA00FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F3EFED00AF918300D0C4BE00D7C9B800C7AA7F00BC976500CABB
      AA00AD753300BC803E00CEB19200D3D1CD00E9E7E500E1DFDC00D1CDC800B9B3
      AA00D7D3CE00E3E0DC00F5ECE900B8978B00F9F8F80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF0096969600C6C6
      C600C8C8C800A5A5A50092929200BABABA00717171007E7E7E00B0B0B000D0D0
      D000E7E7E700DEDEDE00CCCCCC00B2B2B200D2D2D200DFDFDF00EEEEEE009E9E
      9E00F8F8F8000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FCFCFC00F8F8F800F2F2
      F200EBEBEB00E7E7E700B0B4B700DEC7BA00D65F1500D9621500DE6D1C00E071
      1700EDB17F00ECC7A200D8843400D4701900D4721B00DB7E2300DE822600D173
      1D00CA671700C45E1400C25E1900CAB8AB005F646700A2A2A200BFBFBF00BCBC
      BC00BCBCBC00BBBABB00BBBBBB00D2D2D200FBFBFB0000000000000000000000
      0000FEFEFE00FCFCFC00F8F8F800F2F2F200EBEBEB00E7E7E700B3B3B300CACA
      CA006E6E6E00707070007777770078787800B4B4B400C7C7C700858585007474
      7400757575007E7E7E0082828200757575006D6D6D006767670068686800B9B9
      B90063636300A2A2A200BFBFBF00BCBCBC00BCBCBC00BABABA00BBBBBB00D2D2
      D200FBFBFB000000000000000000000000000000000000000000000000000000
      000000000000EAE4E200B3958800CDC4C000C7AE8400B7853300BD904D00CDB5
      9800AE712400BF7C3200C2813E00E2DAD000FAFAFB00E2DEDB00DCD8D400DCD5
      D100E8E3E100E7E3E000F5F3F100C1A59B00F3F0EE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5E5E5009A9A9A00C5C5
      C500A8A8A8007A7A7A0088888800B3B3B3006B6B6B007979790080808000D9D9
      D900FAFAFA00DEDEDE00D8D8D800D6D6D600E4E4E400E3E3E300F3F3F300ABAB
      AB00F0F0F0000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F3F3F300AFAFAF008A8A
      8A0084848400828282005252520090979E00EDB98D00E4822700E8923C00E491
      3800E19D5400D78C3B00D6862C00DC943C00E39C4400E7A44C00E4A24D00DC97
      4800C0783800A05C2E00793D1E00AB9082006F72740041414100626262006161
      610061616100606060005E5E5E0067676700CCCCCC0000000000000000000000
      000000000000F3F3F300AFAFAF008A8A8A008484840082828200525252009797
      9700BBBBBB0084848400929292008F8F8F009B9B9B008A8A8A00828282008E8E
      8E00969696009D9D9D009B9B9B00939393007A7A7A0063636300464646009494
      94007171710041414100626262006161610061616100606060005E5E5E006767
      6700CCCCCC000000000000000000000000000000000000000000000000000000
      000000000000DFD6D200B99F9400C6B69F00C8A56100C1A37200BF9E6F00D8CE
      C400BD976800C7A67F00C1854600D5BB9F00F0F2F300F2F0F000D8D3CE00C5BE
      B600EFEBEA00E9E6E300F4F2F000D2BEB700ECE7E50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7D7D700A4A4A400B3B3
      B3009A9A9A009C9C9C0099999900CECECE0094949400A4A4A40084848400BABA
      BA00F1F1F100F0F0F000D3D3D300BDBDBD00ECECEC00E6E6E600F2F2F200C2C2
      C200E8E8E8000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F9008F8F8F005F5E
      5F0065656500656565006868680045474900C0BDBA00EEAE6200F9B65C00F4BC
      6600EFB65F00FBCF8400F8CD8000EFC37300D0A56200B08650008C5E39007B50
      35006949360058463A004B3D3100665C54007E7F8000434343006E6E6E006C6C
      6C006C6C6C006D6D6D006F6F6F005050500081818100F4F4F400000000000000
      000000000000F9F9F9008F8F8F005E5E5E006565650065656500686868004747
      4700BDBDBD00AAAAAA00AEAEAE00B2B2B200ACACAC00C4C4C400C1C1C100B7B7
      B7009D9D9D008282820061616100555555004D4D4D00484848003D3D3D005C5C
      5C007F7F7F00434343006E6E6E006C6C6C006C6C6C006D6D6D006F6F6F005050
      500081818100F4F4F40000000000000000000000000000000000000000000000
      000000000000D5C9C400C9B0A700E4CD9F00CFBB9800D6D1D100C8C1BA00BEB5
      AB00C8C3BC00C4AB8E00BB7B3600D0A67A00EDEEED00D3D0CA00D3CEC800C8C2
      BB00CEC9C200E3E0DC00F9F7F600C8AFA600E4DCD90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBCBCB00B5B5B500C5C5
      C500B6B6B600D2D2D200C1C1C100B4B4B400C2C2C200A9A9A90079797900A5A5
      A500EDEDED00CFCFCF00CDCDCD00C1C1C100C8C8C800DFDFDF00F7F7F700B4B4
      B400DDDDDD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AEAEAE006B6B
      6B007474740074747400767676006666660064636600AFB4AB006AA0930078B5
      AB0077B7B3007FB9B3007BBBBA006FADA8004E8E960043869300468D99004C92
      98004793A1004C9BA700488D98004A8F9800868D8C005A585800747474007373
      73007373730073737300777777005353530047474700C9C9C900000000000000
      00000000000000000000AEAEAE006B6B6B007474740074747400767676006666
      660064646400AFAFAF00898989009D9D9D00A0A0A000A3A3A300A5A5A5009696
      96007B7B7B0074747400797979007C7C7C007E7E7E0084848400797979007B7B
      7B008A8A8A005858580074747400737373007373730073737300777777005353
      530047474700C9C9C90000000000000000000000000000000000000000000000
      000000000000CEC0BA00C6AD9C00E1CA9700CDB89200D0C5BB00D4CDC800C2BA
      B300C5B7A600BE864300B9742A00D0A17000D5D5D000BFBBB100D2CEC800B6B0
      A500C6C1B900E7E4E200FBFBFB00D1BBB400DCD1CD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200AFAFAF00C0C0
      C000B2B2B200C5C5C500CDCDCD00BABABA00B6B6B6008282820072727200A0A0
      A000D3D3D300B9B9B900CDCDCD00AEAEAE00C0C0C000E4E4E400FBFBFB00C0C0
      C000D3D3D3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B6B6B6007171
      71007A7A7A007A7A7A007A7A7A007E7E7E0064636200787B7F00437F8E002776
      8B003477840038767F00377A8700377683003E7B8400427A7D0039758000356D
      7800376D740038616200365F620033636700455353004F4D4D007D7D7D007A7A
      7A007A7A7A007A7A7A007E7E7E00585858002E2E2E0096969600FCFCFC000000
      00000000000000000000B6B6B600717171007A7A7A007A7A7A007A7A7A007E7E
      7E00636363007B7B7B0070707000626262006565650064646400686868006565
      65006969690068686800646464005E5E5E005D5D5D0053535300525252005454
      54004E4E4E004D4D4D007D7D7D007A7A7A007A7A7A007A7A7A007E7E7E005858
      58002E2E2E0096969600FCFCFC00000000000000000000000000000000000000
      000000000000C6B6B100C8AE9400E1C78800D5BA8600CDC5BF00D2C9C300E0DD
      DE00D5C3AD00B2762B00BC7A3100C5B29800DCDCD900C5C0B700D1CDC800CECA
      C500D8D4D000E2DFDC00F8F9F800D7C5BF00D3C6C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9B9B900AEAEAE00BABA
      BA00B1B1B100C5C5C500CACACA00DEDEDE00C1C1C1007171710077777700AFAF
      AF00DBDBDB00BEBEBE00CCCCCC00C9C9C900D4D4D400DFDFDF00F8F8F800C9C9
      C900C8C8C8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7B7B7007777
      7700808080008080800080808000858585006161610035333300363839001C2E
      31001D3033001B2D3100222B29001B2628001E2727001E2828001D2627001B25
      26001A2426001A202000191E1D00181F2100161D1F003C3C3B00858585008080
      80008080800080808000858585005A5A5A002323230072727200F2F3F2000000
      00000000000000000000B7B7B700777777008080800080808000808080008585
      8500616161003333330037373700292929002A2A2A0028282800272727002323
      230024242400242424002323230022222200212121001E1E1E001C1C1C001D1D
      1D001B1B1B003B3B3B0085858500808080008080800080808000858585005A5A
      5A002323230072727200F2F2F200000000000000000000000000000000000000
      000000000000C4B1AB00C1A88D00E1CB9300DFD1BD00D8CEC400BBB3A900D9CE
      C200C4AF9300C3A68200D3A97A00D8D6CF00F2F2F100E5E3E000D6D3CE00DFDC
      DA00EBE9E800ECEAE900F4F4F200E1D5D000CCBBB60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500A7A7A700BFBF
      BF00CFCFCF00CECECE00B2B2B200CDCDCD00ACACAC00A3A3A300A7A7A700D4D4
      D400F1F1F100E2E2E200D2D2D200DCDCDC00E9E9E900EAEAEA00F3F3F300D7D7
      D700BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6009191
      91009898980098989800989798009D9D9D007F7F7F0027272700201F1F002423
      23002523230028262600292828002C2B2B002E2E2E002E2D2D002F2E2D003130
      300034323200373635003A3A3A003B3A390034343400616161009D9D9D009898
      980098989800989898009F9F9F00676767001D1D1D006A6A6A00FCFCFC000000
      00000000000000000000C6C6C600919191009898980098989800979797009D9D
      9D007F7F7F00272727001F1F1F00232323002323230026262600282828002B2B
      2B002E2E2E002D2D2D002E2E2E003030300032323200363636003A3A3A003A3A
      3A0034343400616161009D9D9D009898980098989800989898009F9F9F006767
      67001D1D1D006A6A6A00FCFCFC00000000000000000000000000000000000000
      000000000000CBB3AB00C9B6A700D2CAC200D1BE9900D1B47D00C6C0BB00C09B
      6600AF732000C9AC8700DFDFDD00DBD8D100DDDAD500EDECEA00E4E2E000BEB8
      B000E5E3E000EFEDEC00F1F0EF00EEE6E300CEBFB90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B8B8B800B7B7B700CACA
      CA00B8B8B800ABABAB00C0C0C000959595006B6B6B00A9A9A900DEDEDE00D6D6
      D600D9D9D900EBEBEB00E2E2E200B7B7B700E2E2E200EDEDED00F0F0F000E7E7
      E700C2C2C2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DBDBDB00B6B6
      B600BCBCBC00BDBBBC00BEBBBE00BABABA00BBBBBB00ABABAB00A6A6A600A7A6
      A600A8A8A800A9A9A900ACACAC00AFAFAF00B2B2B200B2B2B200B3B3B300B4B4
      B400B5B5B500B7B7B700B9B9B900BBBBBB00BBBBBB00BDBDBD00BABABA00B9BA
      BA00BDB8B700BCB8B700C2C3C300797979001A1A1A0067676700000000000000
      00000000000000000000DBDBDB00B6B6B600BCBCBC00BCBCBC00BDBDBD00BABA
      BA00BBBBBB00ABABAB00A6A6A600A6A6A600A8A8A800A9A9A900ACACAC00AFAF
      AF00B2B2B200B2B2B200B3B3B300B4B4B400B5B5B500B7B7B700B9B9B900BBBB
      BB00BBBBBB00BDBDBD00BABABA00B9B9B900B9B9B900B9B9B900C2C2C2007979
      79001A1A1A006767670000000000000000000000000000000000000000000000
      0000FEFFFF00CEB2A900EDDDDB00EADDCB00D5B87A00CDAB6A00BBA27A00B387
      4200B8823700B9966700C9C5BC00DDDBD500F2F2F100E4E2DF00D3CFCA00D6D3
      CF00CAC6BF00DFDCD800F5F5F500EAE2DF00C1AEA70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00B8B8B800E1E1E100DBDB
      DB00ADADAD00A0A0A0009D9D9D007E7E7E007B7B7B0092929200C3C3C300D9D9
      D900F1F1F100E1E1E100CECECE00D2D2D200C5C5C500DBDBDB00F5F5F500E3E3
      E300B2B2B2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DBDBDB00AAA9
      AA00A7A9A80090C0950083C28800AEB7AF00B2B1B200B5B5B500B6B6B600B6B6
      B600B6B6B600B5B5B500B5B5B500B5B5B500B4B4B400B4B4B400B3B3B300B3B3
      B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B2B2B200B1B1B100B4B1
      B000B2CED400B5CACF00B9B7B600757575002222220064646400000000000000
      00000000000000000000DBDBDB00A9A9A900A8A8A800A1A1A10099999900B1B1
      B100B1B1B100B5B5B500B6B6B600B6B6B600B6B6B600B5B5B500B5B5B500B5B5
      B500B4B4B400B4B4B400B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3
      B300B3B3B300B2B2B200B1B1B100B1B1B100C6C6C600C4C4C400B7B7B7007575
      7500222222006464640000000000000000000000000000000000000000000000
      0000FCFCFC00CDAFA500F1E4E000EBDFD100DEC38800D1B27300C49F5E00B282
      3500C7A57700C2BBAF00C1BAAC00E1DFDA00E7E6E200E2E0DD00E1DFDC00D8D5
      D200D3CFC900E7E6E300F8F8F800F2EBE900BCA79F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00B5B5B500E7E7E700DEDE
      DE00B8B8B800A7A7A7009595950078787800A1A1A100B9B9B900B7B7B700DEDE
      DE00E5E5E500DFDFDF00DEDEDE00D5D5D500CECECE00E5E5E500F8F8F800ECEC
      EC00ABABAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D8D8D8008C8A
      8B00989A990060C0650051CB56008B9F8E009391920099989800A1A1A100A0A0
      A000A0A0A000A0A0A000A0A0A0009F9F9F009F9F9F009F9F9F009E9E9E009D9D
      9D009C9C9C009B9B9B009A9A9A0099999900989898009898980098989800A89B
      9A0069E1EC007BDAE300AEA2A00071717100353535006C6C6C00000000000000
      00000000000000000000D8D8D8008B8B8B0099999900818181007B7B7B009292
      92009292920098989800A1A1A100A0A0A000A0A0A000A0A0A000A0A0A0009F9F
      9F009F9F9F009F9F9F009E9E9E009D9D9D009C9C9C009B9B9B009A9A9A009999
      99009898980098989800989898009F9F9F00BCBCBC00BDBDBD00A5A5A5007171
      7100353535006C6C6C0000000000000000000000000000000000000000000000
      0000F8F7F600CEAFA400F4EAE600E2DEDB00D9CEBA00D8C8AD00DAC9B100D0C1
      AF00C7BEB400C1BAAF00DFDBD400D9D6CF00E6E5E100E7E5E300DDDAD600D8D5
      D100EFEDEC00F4F3F300F8F8F800F5F0EF00BCA59D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700B5B5B500ECECEC00DEDE
      DE00CBCBCB00C4C4C400C6C6C600C0C0C000BDBDBD00B8B8B800DADADA00D4D4
      D400E4E4E400E5E5E500D9D9D900D4D4D400EDEDED00F3F3F300F8F8F800F1F1
      F100AAAAAA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAEAEA00B0AF
      B000BABBBB00ADCAB100ADD2B200B9BFBB00C5C4C600929293005C5C5C006060
      60005E5E5E0059595900525252004F4F4F004E4E4E004C4C4C004A4A4A004646
      460043434300414141003F3F3F003E3E3E003535350058585800E7E7E900F2EA
      E900B1EAFA0075DEFD00FEF7F600BBBBBC004343430078787800000000000000
      00000000000000000000EAEAEA00AFAFAF00BABABA00B8B8B800BBBBBB00BBBB
      BB00C5C5C500929292005C5C5C00606060005E5E5E0059595900525252004F4F
      4F004E4E4E004C4C4C004A4A4A004646460043434300414141003F3F3F003E3E
      3E003535350058585800E7E7E700ECECEC00DCDCDC00C5C5C500F9F9F900BBBB
      BB00434343007878780000000000000000000000000000000000000000000000
      0000F4F1EF00D0B2A600F5F1EF00E2DEDA00E7E3E200E6E2E100D7D2CF00D8D2
      CE00C9C0B600C4BBAF00F1EEEA00FAF9F800E1DEDA00F1EFEE00DAD7D300C0BB
      B200D3CFC900E8E7E400F6F5F400F8F5F400BFA8A000FBFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1F1F100B8B8B800F1F1F100DEDE
      DE00E4E4E400E3E3E300D2D2D200D2D2D200BFBFBF00BABABA00EDEDED00F9F9
      F900DDDDDD00EFEFEF00D6D6D600B9B9B900CECECE00E6E6E600F5F5F500F5F5
      F500ADADAD00FAFAFA0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0F0
      F100E5E5E600E8E6E800E8E5E800E8E8E900F1F1F200B8B8B8002A2A2A003535
      350046464600494949004A4A4A004C4C4C004D4D4D004E4E4E00505050005252
      5200545454005555550057575700595959005858580066666600DDDDDE00E7E7
      E800E7E5E600D7E4EA00E8E9EA00D9D9DA005E5E5E0082828200000000000000
      0000000000000000000000000000F0F0F000E5E5E500E7E7E700E7E7E700E8E8
      E800F1F1F100B8B8B8002A2A2A003535350046464600494949004A4A4A004C4C
      4C004D4D4D004E4E4E0050505000525252005454540055555500575757005959
      59005858580066666600DDDDDD00E7E7E700E6E6E600E1E1E100E9E9E900D9D9
      D9005E5E5E008282820000000000000000000000000000000000000000000000
      0000F0E9E700D3B5A90000000000F8F6F500F2EFED00DED9D300D0C9C100CDC6
      BE00DBD3CC00BEB4A700E0DBD300F5F4F100DCD9D400E9E7E500E3E0DE00CDC8
      C300D2CEC800DDDBD700EFEDEC00FCFBFA00CBB7AF00F5F3F300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00BBBBBB0000000000F6F6
      F600EFEFEF00D8D8D800C8C8C800C5C5C500D3D3D300B3B3B300DADADA00F3F3
      F300D8D8D800E7E7E700E0E0E000C8C8C800CDCDCD00DADADA00EDEDED00FBFB
      FB00BBBBBB00F3F3F30000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8F8
      F800D7D8D700D7D7D700D8D8D800D8D8D800D9D9D900DBDBDB006C6C6C004B4B
      4B006E6E6E006D6D6D006A6A6A006A6A6A006B6B6B006E6E6E006F6F6F007171
      7100747474007575750077777700797979007B7B7B0077777700B5B5B500CECE
      CE00CBCACA00CECBC900CACACA00D1D1D1008282820088888800000000000000
      0000000000000000000000000000F8F8F800D7D7D700D7D7D700D8D8D800D8D8
      D800D9D9D900DBDBDB006C6C6C004B4B4B006E6E6E006D6D6D006A6A6A006A6A
      6A006B6B6B006E6E6E006F6F6F00717171007474740075757500777777007979
      79007B7B7B0077777700B5B5B500CECECE00CACACA00CBCBCB00CACACA00D1D1
      D100828282008888880000000000000000000000000000000000000000000000
      0000EBE1DE00D4B9AE00FEFFFF00FCFBFB00F3F1EE00F2EFED00D6D0CA00D8D2
      CC00EAE3DF00C1B8AB00CEC8BD00E9E7E300E8E6E200E6E4E100E0DDDB00E6E4
      E400E2DFDD00E6E4E100F3F2F200FEFEFD00C0AAA000F0EDEC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3E3E300BEBEBE00FEFEFE00FBFB
      FB00F0F0F000EFEFEF00D0D0D000D2D2D200E4E4E400B6B6B600C6C6C600E6E6
      E600E5E5E500E3E3E300DDDDDD00E4E4E400DFDFDF00E3E3E300F2F2F200FDFD
      FD00AEAEAE00EDEDED0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5F5F500E1E1E100E2E2E200E4E4E400E4E4E400E9E9E900CDCDCD009F9F
      9F00C2C2C200C4C4C400BCBCBC00B5B5B500AEAEAE00A7A7A700A3A3A300A0A0
      A0009F9F9F009F9F9F009F9F9F009F9F9F00A1A1A1009C9C9C00B9B9B900D3D3
      D300D0D0D100D3D3D300D7D7D700E1E1E100BCBCBC0088888800000000000000
      000000000000000000000000000000000000F5F5F500E1E1E100E2E2E200E4E4
      E400E4E4E400E9E9E900CDCDCD009F9F9F00C2C2C200C4C4C400BCBCBC00B5B5
      B500AEAEAE00A7A7A700A3A3A300A0A0A0009F9F9F009F9F9F009F9F9F009F9F
      9F00A1A1A1009C9C9C00B9B9B900D3D3D300D0D0D000D3D3D300D7D7D700E1E1
      E100BCBCBC008888880000000000000000000000000000000000000000000000
      0000E6DAD500D9C1B70000000000FCFBFB00FAF9F800FBF9F700FEFAF900FBF7
      F500F3EEEA00DAD3CA00C5BEB200E6E3DE00F1EFEC00F3F2F100F1EFEE00EBE8
      E700EFEDEC00EBE9E700F6F6F60000000000C3A9A000E9E3E100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCDCDC00C5C5C50000000000FBFB
      FB00F9F9F900F9F9F900FBFBFB00F7F7F700EEEEEE00D2D2D200BCBCBC00E2E2
      E200EEEEEE00F2F2F200EFEFEF00E8E8E800EDEDED00E9E9E900F6F6F6000000
      0000AEAEAE00E4E4E40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FAFAFA00EBEBEB00E7E7E700E5E5E500E5E5E500E8E8E800CECE
      CE00D4D4D400DFDFDF00DEDEDE00DEDEDE00DFDFDF00DFDFDF00E0E0E000DFDF
      DF00DCDCDC00DBDBDB00DADADA00D9D9D900DBDBDB00D6D6D600C9C9C900E9E9
      E900E7E7E800E8E8E800E8E8E800E9E9E900E4E4E400C6C6C700000000000000
      00000000000000000000000000000000000000000000FAFAFA00EBEBEB00E7E7
      E700E5E5E500E5E5E500E8E8E800CECECE00D4D4D400DFDFDF00DEDEDE00DEDE
      DE00DFDFDF00DFDFDF00E0E0E000DFDFDF00DCDCDC00DBDBDB00DADADA00D9D9
      D900DBDBDB00D6D6D600C9C9C900E9E9E900E7E7E700E8E8E800E8E8E800E9E9
      E900E4E4E400C6C6C60000000000000000000000000000000000000000000000
      0000E1D1CB00E0C9C000FEFFFF000000000000000000EBE9E900BFBEBB009694
      90007A7875007D7B79008E8C8A009F9E9C00AAA9A800AAA9A900A9A8A700B2B0
      AE00D3D1CF00ECEAE900FEFDFC0000000000C9AEA400E2DAD700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D4D4D400CDCDCD00FEFEFE000000
      000000000000E9E9E900BDBDBD0093939300777777007B7B7B008C8C8C009D9D
      9D00A9A9A900A9A9A900A8A8A800B0B0B000D1D1D100EAEAEA00FDFDFD000000
      0000B3B3B300DBDBDB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFCFC00F8F8F800F9F9F900FBFBFB00FAFA
      FA00E1E1E100E0E0E000E0E0E000E1E1E100E1E1E100E3E3E300E5E5E500E4E4
      E400E3E3E300E3E3E300E4E4E400E4E4E400E7E7E700D9D9D900A1A1A1000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00F8F8F800F9F9F900FBFBFB00FAFAFA00E1E1E100E0E0E000E0E0E000E1E1
      E100E1E1E100E3E3E300E5E5E500E4E4E400E3E3E300E3E3E300E4E4E400E4E4
      E400E7E7E700D9D9D900A1A1A100000000000000000000000000000000000000
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
      0000EEEEEE00ECECEC00EDEDED00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00EBEBEB00E9E9E900AAAAAA00F7F7
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EEEEEE00ECECEC00EDEDED00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00EBEBEB00E9E9E900AAAAAA00F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000F3F3F300EEEEEE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F3F3F300B5B5B500EBEB
      EB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300EEEEEE00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00F3F3F300B5B5B500EBEBEB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000F9F9F900F3F3F300F4F4F400F4F4F400F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F6F6F600F6F6F600F4F4F400F9F9F900C7C7C700DCDC
      DC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900F3F3F300F4F4F400F4F4
      F400F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F6F6F600F6F6
      F600F4F4F400F9F9F900C7C7C700DCDCDC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000FCFCFC00F6F6F600F9F9F900F3F3F300F3F3F300F5F5F500F4F4F400F4F4
      F400F3F3F300F3F3F300F3F3F300F3F3F300F5F5F500FCFCFC00DDDDDD00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00F6F6F600F9F9F900F3F3
      F300F3F3F300F5F5F500F4F4F400F4F4F400F3F3F300F3F3F300F3F3F300F3F3
      F300F5F5F500FCFCFC00DDDDDD00CECECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000FEFEFE00F8F8F800F7F7F700F5F5F500F3F3F300F3F3F300F3F3F300F3F3
      F300F4F4F400F4F4F400F4F4F400F5F5F500F7F7F700F9F9F900EDEDED00E9E9
      E900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00F8F8F800F7F7F700F5F5
      F500F3F3F300F3F3F300F3F3F300F3F3F300F4F4F400F4F4F400F4F4F400F5F5
      F500F7F7F700F9F9F900EDEDED00E9E9E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000F7F7F700F5F5F500F5F5F500F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F3F3F300F1F1
      F100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700F5F5F500F5F5
      F500F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F3F3F300F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000F9F9F900EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900EFEFEF00F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000EFEFEF00EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000FEFEFE00F7F7F700F8F8F800F8F8F800F8F8F800F9F9F900F9F9
      F900F9F9F900FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBFBFB00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00F7F7F700F8F8
      F800F8F8F800F8F8F800F9F9F900F9F9F900F9F9F900FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FBFBFB00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8F8
      F800E0E0E000EBEBEB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F8F8F800E0E0E000EBEBEB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00F6F5F500E9E9E900DFDEDE00DAD9
      D900BFBEBE00908F8E00D8D8D800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00F5F5F500E9E9E900DEDEDE00D9D9D900BEBEBE008F8F8F00D8D8D8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00F3F2F200E6E5E500DCDBDB00D7D6D600D5D4D400D5D4D400D4D3
      D300D7D6D700D2D1D10097969600DADAD9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00F2F2F200E5E5E500DBDB
      DB00D6D6D600D4D4D400D4D4D400D3D3D300D6D6D600D1D1D10096969600D9D9
      D900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1F0F000E3E2
      E200D9D8D800D4D3D300D2D1D100D1D0D100D1D0D000D1D0D000D4D3D400DADA
      DA00E2E2E200CECDCE00CDCCCC0097969500DEDEDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0F0F000E2E2E200D8D8D800D3D3D300D1D1D100D0D0
      D000D0D0D000D0D0D000D3D3D300DADADA00E2E2E200CDCDCD00CCCCCC009696
      9600DEDEDE000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000FBFBFB00D1D0D000CDCC
      CC00D0CFD000CECDCE00D0CFD000D6D6D600DFDFDF00E8E7E800EDEDED00EFEF
      EF00F2F2F200B5B4B50083838300C0BFC00097969500E1E1E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB00D0D0D000CCCCCC00CFCFCF00CDCDCD00CFCFCF00D6D6
      D600DFDFDF00E7E7E700EDEDED00EFEFEF00F2F2F200B4B4B40083838300BFBF
      BF0096969600E0E0E00000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000F3F2F300D8D7
      D700C7C6C700DFDEDF00ECECEC00EFEFEF00EFEFEF00EDEDEE00ECECEC00EBEB
      EB00EEEEEE00B5B5B6005D5D5D0084848400BAB9BA0096959500F0F0EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F2F2F200D7D7D700C6C6C600DEDEDE00ECECEC00EFEF
      EF00EFEFEF00EDEDED00ECECEC00EBEBEB00EEEEEE00B5B5B5005D5D5D008484
      8400B9B9B90095959500EFEFEF00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFEFEF00EAEAEA00ECECEC00EAEAEA00EAE9EA00E9E9E900E8E8E800E7E7
      E700EBEBEB00B3B2B3007F7F7F008A8A8A00A6A6A600BAB9BA00DEDEDE00F9F9
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00EAEAEA00ECECEC00EAEA
      EA00E9E9E900E9E9E900E8E8E800E7E7E700EBEBEB00B2B2B2007F7F7F008A8A
      8A00A6A6A600B9B9B900DEDEDE00F9F9F9000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBEBEB00E7E7E700E7E7E700E6E6E600E5E5E500E5E4E500E4E4
      E400E8E7E800B4B4B5006D6C6D007070700092929200B4B5B500D1D1D100E7E7
      E700F9F9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EBEBEB00E7E7E700E7E7
      E700E6E6E600E5E5E500E4E4E400E4E4E400E7E7E700B4B4B4006C6C6C007070
      700092929200B4B4B400D1D1D100E7E7E700F9F9F90000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00E7E7E700E3E3E300E3E3E300E2E2E200E2E1E200E1E1E100E0E0
      E000E4E4E400B1B0B1008484840091919100A3A3A300BABABA00D2D2D200E7E7
      E700F8F8F8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00E7E7E700E3E3E300E3E3
      E300E2E2E200E1E1E100E1E1E100E0E0E000E4E4E400B0B0B000848484009191
      9100A3A3A300BABABA00D2D2D200E7E7E700F8F8F80000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00E3E3E300DFDFDF00DFDFDF00DEDEDE00DDDDDD00DDDCDD00DCDC
      DC00E0E0E000A9A8A900C1C0C100F7F8F700EDEDED00F0F0F000F5F5F500FBFB
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00E3E3E300DFDFDF00DFDF
      DF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00E0E0E000A8A8A800C0C0C000F7F7
      F700EDEDED00F0F0F000F5F5F500FBFBFB000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00DEDEDE00DBDBDB00DBDBDB00DADADA00D9D9D900D8D8D800D7D7
      D700DBDBDB00A8A7A800B9B9BA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00DEDEDE00DBDBDB00DBDB
      DB00DADADA00D9D9D900D8D8D800D7D7D700DBDBDB00A7A7A700B9B9B9000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFAFA00D9D9D900D7D7D700D7D6D700D6D6D600D5D4D500D4D3D400D3D2
      D300D7D6D700A7A7A700AFAEAF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFAFA00D9D9D900D7D7D700D6D6
      D600D6D6D600D4D4D400D3D3D300D2D2D200D6D6D600A7A7A700AEAEAE000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800D4D3D400D3D2D300D2D2D200D1D1D100D0D0D000CFCFCF00CECE
      CE00D1D1D100A7A7A700A6A5A600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F800D3D3D300D2D2D200D2D2
      D200D1D1D100D0D0D000CFCFCF00CECECE00D1D1D100A7A7A700A5A5A5000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F6F600CECECE00CECECE00CDCDCD00CCCCCC00CBCBCB00CACACA00C9C9
      C900CCCCCC00A8A7A8009E9D9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6F600CECECE00CECECE00CDCD
      CD00CCCCCC00CBCBCB00CACACA00C9C9C900CCCCCC00A7A7A7009D9D9D000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F3F300C8C8C800C9C9C900C8C8C800C7C7C700C6C6C600C5C5C500C4C3
      C400C6C6C600A8A7A80096959600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300C8C8C800C9C9C900C8C8
      C800C7C7C700C6C6C600C5C5C500C3C3C300C6C6C600A7A7A700959595000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFEFEF00C3C3C300C4C4C400C3C3C300C2C2C200C1C0C100C0BFC000BFBE
      BF00C1C0C100A7A7A7008F8F8F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00C3C3C300C4C4C400C3C3
      C300C2C2C200C0C0C000BFBFBF00BEBEBE00C0C0C000A7A7A7008F8F8F000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000EBEBEB00BDBDBD00BFBFBF00BEBDBE00BDBCBD00BCBBBC00BABABA00B9B9
      B900BBBABB00A6A6A60089888900FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EBEBEB00BDBDBD00BFBFBF00BDBD
      BD00BCBCBC00BBBBBB00BABABA00B9B9B900BABABA00A6A6A60088888800FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000E6E6E600B7B7B700BAB9BA00B9B8B900B7B7B700B6B6B600B5B5B500B4B4
      B400B5B5B500A6A5A60085848500F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E6E6E600B7B7B700B9B9B900B8B8
      B800B7B7B700B6B6B600B5B5B500B4B4B400B5B5B500A5A5A50084848400F9F9
      F900000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000E1E1E100B1B1B100B4B4B400B4B3B400B3B2B300B2B1B200B1B0B000AFAE
      AF00ADADAD009F9E9F007D7C7D00F3F3F3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E1E1E100B1B1B100B4B4B400B3B3
      B300B2B2B200B1B1B100B0B0B000AEAEAE00ADADAD009E9E9E007C7C7C00F3F3
      F300000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDC00ACACAC00AFAFAF00ADADAD00AAA9AA00A5A5A500A0A0A0009A99
      9A00959495008787870067666700ECECEC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCDCDC00ACACAC00AFAFAF00ADAD
      AD00A9A9A900A5A5A500A0A0A00099999900949494008787870066666600ECEC
      EC00000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000D2D2D2009D9C9D009D9C9D0096969700908F900089888900828283007C7B
      7C00757475006767680048474800E0E0E0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D2D2D2009C9C9C009C9C9C009696
      96008F8F8F0088888800828282007B7B7B00747474006767670047474700E0E0
      E000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBE007E7D7E007D7D7E00747475006A696B005F5F6000565557004E4D
      4F004B4B4D004D4C4E0046454600D2D1D1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD007D7D7D007D7D7D007474
      74006A6A6A005F5F5F00565656004E4E4E004B4B4B004D4D4D0045454500D1D1
      D100000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9B9C0051505200575658005A595B006362630071707100858483009F9D
      9C00B5B4B200C6C4C300B5B3B10084838200FBFCFC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B0051515100575757005A5A
      5A006262620070707000848484009D9D9D00B3B3B300C4C4C400B3B3B3008383
      8300FBFBFB000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000FCFCFC00FEFD
      FC00B0AFAE009C9B9A00B8B7B500C8C7C500D7D5D300DFDEDB00E2E0DD00E6E4
      E100E2E0DD00D3D1CF00A7A5A3004E4D4C00D1D1D10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC00FDFDFD00AFAFAF009B9B9B00B6B6B600C6C6
      C600D5D5D500DDDDDD00DFDFDF00E3E3E300DFDFDF00D1D1D100A5A5A5004D4D
      4D00D1D1D1000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000EEEDEC00DCDAD700D9D8D500D7D5
      D300DDDBD800E7E5E200E3E1DE00DCDAD800D2D0CE00C5C4C100B7B6B400A5A5
      A400979999008B8B8A007E7C7A004F4D4C008B8B8B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EDEDED00D9D9D900D7D7D700D5D5D500DADADA00E4E4E400E0E0E000DADA
      DA00D0D0D000C3C3C300B5B5B500A4A4A400989898008A8A8A007C7C7C004D4D
      4D008B8B8B000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000E2E1DF00DAD8D500D7D5D300D0CF
      CD00C5C4C300BABAB900AFB2B200A4A8A8009DA1A1009799990091908D008C83
      7C008671650090847E00949492006564620056555500F3F3F200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0E0E000D7D7D700D5D5D500CECECE00C4C4C400B9B9B900B1B1B100A6A6
      A6009F9F9F00989898008F8F8F00838383007474740086868600939393006363
      630055555500F2F2F20000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000D0CFCD00A9A7A500AFADAB00A9AA
      A800A19D9A0099908900917E7200886857007F4F39007A3C2000762E0C007423
      00006F170000834C3B00959999007D7B790046454500BBBBBB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00A7A7A700ADADAD00A9A9A9009D9D9D0090909000808080006D6D
      6D0057575700474747003A3A3A00323232002C2C2C0058585800979797007B7B
      7B0045454500BBBBBB0000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000E5E4E300B0B1AF00806B64006A32
      1800722E0B00721F0000771700007F12000085100000A9140000BD190300BC1B
      0600B9180200B7231100988B89008B8E8C005755540075747400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E4E4E400B0B0B0006F6F6F003C3C3C0039393900303030002F2F2F003030
      3000313131003F3F3F004848480049494900464646004E4E4E008E8E8E008C8C
      8C00555555007474740000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000BEBFBE00877C7A007103
      00008C1700008A15060092140E00991114009B0A1700CD393600E95C4A00E65A
      4A00E6594800E94A3900B5766F008A92910072706E004A494900E3E2E2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BEBEBE007F7F7F002626260036363600373737003C3C3C003F3F
      3F003E3E3E006969690085858500838383008282820079797900888888008F8F
      8F007070700049494900E2E2E200000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000DFDEDD00A5A9A700A12E
      2800A4100E009B0F1900A40B1E00AB062300B1001E00E1666400FEB69C00FBB1
      9A00FBAF9800FEA99100E38B78008A898800858482004A484800A09F9F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEDEDE00A7A7A700525252004040400041414100444444004646
      4600454545008E8E8E00C5C5C500C2C2C200C0C0C000BDBDBD00A2A2A2008989
      890083838300484848009F9F9F00000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000FCFBFB00B3B9B700A679
      7300AC051200AF032400BE052100CE091400DA040000F3928200FFFCEE00FFF2
      E500FFF2E500FFF5E600FFD5C100A18A8500868887006361600061616100FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB00B6B6B6008686860041414100474747004C4C4C004E4E
      4E004A4A4A00ADADAD00F8F8F800F2F2F200F2F2F200F3F3F300DCDCDC009090
      9000878787006161610061616100FCFCFC000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000D6D6D400A2A5
      A300B41A2200D8060B00E2120200E5130000E3090000F49C9500000000000000
      00000000000000000000FFFDF900CC9C9200808280007C7B790048474700D1D1
      D000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D5D5D500A3A3A300505050004D4D4D00525252005252
      52004E4E4E00B7B7B70000000000000000000000000000000000FCFCFC00A8A8
      A800808080007A7A7A0047474700D0D0D0000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000F6F6F500A9B5
      B400B25A5500E9030000E70C0000E7090000E7000000F7908100FFF8E700FFDD
      C900FBCCB600F3BAA700EAA79700D08E830082817F008584820056545300CFCF
      CF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F5F5F500B0B0B000757575004E4E4E00515151005050
      50004D4D4D00ADADAD00F4F4F400E1E1E100D4D4D400C6C6C600B8B8B800A0A0
      A000808080008383830054545400CFCFCF000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000CACD
      CC00A2928F00CF2B1D00D5372800C9463A00BD524900B6857B00AF9B9000A38F
      8800988985008E8683008683820081838200807E7C0083817F0082807F00F6F6
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CBCBCB00969696005D5D5D00666666006D6D
      6D0072727200929292009E9E9E00939393008C8C8C0087878700838383008282
      82007E7E7E008181810080808000F6F6F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0F0
      EF00A6A6A400A6A8A600A5ABAA00A4AEAD00A7B2B200AAB0B000AFB1B000B5B7
      B600BCBDBD00C3C3C200C8C8C700D4D3D200DEDEDD00E4E3E300F4F4F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFEF00A5A5A500A6A6A600A8A8A800AAAA
      AA00AEAEAE00AEAEAE00B0B0B000B6B6B600BCBCBC00C2C2C200C7C7C700D3D3
      D300DDDDDD00E3E3E300F4F4F400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E6E600E6E8E700EEEFEE00F4F4F400F9F9F900FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E6E6E600E7E7E700EEEEEE00F4F4
      F400F9F9F900FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFEFD00F7F9F700E6EFE700C8DCCB00C2D5C200DBE9
      DD00EEF4EF00FAFBFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00F7F7
      F700E9E9E900CFCFCF00C8C8C800E0E0E000F0F0F000FAFAFA00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFDFC00F3F7F300D8E7DA00A9C7AC004B9F5E0041AA620099BA
      9B00C8DDCB00E8F0E900F7FAF700FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00F4F4F400DDDD
      DD00B4B4B4006D6D6D006F6F6F00A4A4A400D0D0D000EBEBEB00F8F8F800FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFBFA00EEF4EF00D2E3D400A0C2A40053985D00028E290002BC500045A8
      640090B49200C2DAC600E4EEE500F5F8F500FDFEFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFAFA00F0F0F000D8D8D800ACAC
      AC006D6D6D003D3D3D005A5A5A00707070009C9C9C00CBCBCB00E7E7E700F6F6
      F600FDFDFD000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000FEFEFE00F9FB
      F800EAF1EA00CFE1D100ADCBB10077AA7D000C92340010BA460026D166000ACB
      610067B07A00A1BFA200C1D9C500DFEBE000F2F7F300FCFDFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F9F9F900ECECEC00D5D5D500B8B8B8008A8A
      8A00464646005A5A5A00747474006767670085858500ABABAB00CACACA00E3E3
      E300F4F4F400FCFCFC0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFCFB00F3F8F400ECF3
      EC00E7F0E800E6EFE700E5EFE700E5EEE600E4EEE600E4EEE500E4EEE500E3EE
      E400E3EDE400E2EDE400E2ECE300E1ECE300E0EBE100D5E5D800C0D8C400AACB
      AF009EC3A3009EC3A300A4C7A900AFCEB400BFD7C200D1E2D300E3EDE400F0F5
      F100F9FBF900FEFEFE0000000000000000000000000000000000000000000000
      000000000000FBFBFB00F5F5F500EEEEEE00EAEAEA00E9E9E900E9E9E900E8E8
      E800E8E8E800E7E7E700E7E7E700E7E7E700E6E6E600E6E6E600E5E5E500E5E5
      E500E4E4E400DBDBDB00C9C9C900B6B6B600ACACAC00ACACAC00B1B1B100BBBB
      BB00C8C8C800D7D7D700E6E6E600F2F2F200F9F9F900FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F6F9F600E5EE
      E600C9DDCC00A8C9AD0089B28D0021933F0009B5460007B02B0012B6360024DC
      750016D36E007EB187009FC1A200BDD7C100DBE9DD00F0F5F000FBFCFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00F7F7F700E8E8E800D0D0D000B4B4B400989898005151
      5100565656004B4B4B00545454007C7C7C007272720092929200ABABAB00C7C7
      C700E0E0E000F1F1F100FBFBFB00000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00F4F8F400E2EDE300CEE1
      D100C3DAC600C1D8C400C0D8C400C0D8C400C0D8C400C0D8C300C0D8C300BFD8
      C300BFD7C200BFD7C200BED7C200BED7C200BED7C100BCD6C000B9D4BD00B5D1
      B900B3D0B700B2CFB600B2CFB600B2CFB600B4D1B800B9D4BD00C3D9C600CFE1
      D200DDEADF00EBF2EB00F5F8F500FBFCFB00FEFEFE0000000000000000000000
      0000FEFEFE00F5F5F500E6E6E600D5D5D500CBCBCB00C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900C8C8C800C8C8C800C8C8C800C7C7C700C7C7
      C700C7C7C700C6C6C600C3C3C300BFBFBF00BEBEBE00BDBDBD00BDBDBD00BDBD
      BD00BFBFBF00C3C3C300CBCBCB00D6D6D600E2E2E200EDEDED00F6F6F600FBFB
      FB00FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFDFC00F3F7F300E0EBE100C3DA
      C700A3C6A8008DB6920036994D0004AD40000CB7370005B2300003B72F001EC3
      49001EE87E0026D4760088AF8B009DC1A200BBD5BF00D7E6D900EDF3ED00F9FA
      F900FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00F4F4F400E4E4E400CCCCCC00B0B0B0009C9C9C005E5E5E005050
      5000535353004D4D4D004D4D4D0063636300818181007A7A7A0096969600AAAA
      AA00C5C5C500DCDCDC00EFEFEF00F9F9F900FEFEFE0000000000000000000000
      000000000000000000000000000000000000FEFEFE00F6F9F600E4EEE600D2E3
      D400C7DCCA00C5DBC800C5DBC800C5DBC800C5DBC900C5DBC900C5DBC900C5DB
      C900C5DBC900C5DBC900C5DBC900C5DBC900C6DBC900C6DBC900C5DCC800CFDF
      D000D6DFD400D3DFD300CCDECE00C6DCCA00C6DCCA00C6DCC900C6DCC900C8DD
      CB00CDE0D000D7E6D900E5EEE600F3F7F300FBFCFB0000000000000000000000
      0000FEFEFE00F7F7F700E8E8E800D8D8D800CFCFCF00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CECECE00CECECE00CDCDCD00D4D4D400D8D8D800D7D7D700D2D2D200CECE
      CE00CECECE00CECECE00CECECE00D0D0D000D4D4D400DCDCDC00E8E8E800F4F4
      F400FBFBFB000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FAFCFA00EFF5EF00DAE8DC00BED7C2009FC4
      A50091B6940050A6630002BD48000DBA3E0005B7330007BF3B0009C53F0004BE
      33002AD05E0015F4850040CE7E0091B190009DC2A300B8D3BC00D4E4D600E9F1
      EA00F7FAF700FDFEFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FAFA
      FA00F1F1F100DFDFDF00C7C7C700ADADAD009E9E9E0073737300575757005757
      57004F4F4F005555550059595900515151007272720084848400848484009B9B
      9B00ABABAB00C2C2C200DADADA00ECECEC00F8F8F800FDFDFD00000000000000
      00000000000000000000000000000000000000000000FAFBFA00F0F5F000E4EE
      E500DCE9DE00DBE8DD00DBE8DD00DBE8DD00DAE8DC00DAE8DC00DAE8DC00DAE8
      DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00E0E9E000ACD9
      BA005ED4910073D19600CFE0D000E6ECE500D9E8DB00DAE8DC00DBE9DD00DDEA
      DF00E1ECE200E8F0E900F0F6F100F8FAF800FDFDFD0000000000000000000000
      000000000000FAFAFA00F1F1F100E7E7E700E1E1E100E0E0E000E0E0E000E0E0
      E000DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00E3E3E300BFBFBF00969696009E9E9E00D5D5D500E7E7
      E700DEDEDE00DFDFDF00E0E0E000E2E2E200E5E5E500EBEBEB00F2F2F200F8F8
      F800FDFDFD000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FAFBFA00EFF5EF00DAE8DC00C0D8C300A4C7A90098BD
      9C006BA8750007A53D000CC54A0006B9350007C6410008CA42000ACF450009D1
      470007C53A0033DC710010F685005CC383009CB99B00A2C6A800BBD5BF00D4E5
      D700EAF2EB00F7F9F700FDFEFD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FAFAFA00F1F1
      F100DFDFDF00C9C9C900B1B1B100A5A5A500828282004D4D4D005E5E5E005151
      51005A5A5A005C5C5C005F5F5F00606060005757570080808000838383008B8B
      8B00A5A5A500B0B0B000C5C5C500DADADA00EDEDED00F7F7F700FDFDFD000000
      00000000000000000000000000000000000000000000FEFEFE00FAFBFA00F5F8
      F500F2F6F200F1F6F100F1F6F100F1F6F100F1F6F100F0F5F100F0F5F100F0F5
      F100F0F5F100F0F5F100F0F5F000F0F5F000F0F5F000F0F5F000FFF9FA005DBE
      7C0000C9510025C35A0027AE4A00CBE6D300FDF9FA00EDF4EE00F0F6F100F5F8
      F500F9FBF900FCFDFC00FEFEFE00000000000000000000000000000000000000
      000000000000FEFEFE00FAFAFA00F6F6F600F3F3F300F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F1F1F100F1F1
      F100F1F1F100F1F1F100FBFBFB00878787005E5E5E006B6B6B005F5F5F00D6D6
      D600FAFAFA00EFEFEF00F2F2F200F6F6F600F9F9F900FCFCFC00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00F7FAF700E9F1EA00D4E4D700BFD7C200B3CEB6009AC1
      9E0014B34A0007BE470006BB380007CB440008D1490009D74E000AD951000ADA
      520008D950000CC83F0036EB84000EE3760089C29800B5CCB600BBD6BF00D0E2
      D200E4EEE500F4F7F400FCFDFC00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F8F8F800ECEC
      EC00DADADA00C8C8C800BDBDBD00A8A8A8005B5B5B0059595900535353005C5C
      5C0060606000646464006666660067676700656565005B5B5B008C8C8C007777
      7700A1A1A100BDBDBD00C5C5C500D6D6D600E7E7E700F5F5F500FCFCFC000000
      000000000000000000000000000000000000000000000000000000000000FFFE
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000066BC
      820000CE5C0030C9680000AD2C0010B03E00B5E1C10000000000FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00000000008C8C8C006363630075757500484848005454
      5400C7C7C70000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00F8FAF800EEF4EE00E1EDE300DAE8DC00D5E1D40036B4
      5C0000C64B0008BE3D0007CF4A0009D7520008DA570009E05F000AE262000AE2
      62000AE3630005DE580016CE4C002FE982001ECB6A00C8DFCD00DCE6DB00DFEB
      E000EAF2EB00F5F9F500FCFDFC00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F8F8F800F0F0
      F000E5E5E500DFDFDF00D8D8D8006C6C6C005B5B5B0056565600606060006666
      6600686868006D6D6D006F6F6F006F6F6F007070700069696900656565008888
      880071717100D1D1D100DFDFDF00E3E3E300EDEDED00F6F6F600FCFCFC000000
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
      000000000000FEFEFE00FCFDFC00F9FBF900F7FAF700000000006EB9800000B3
      3E0006B2370006C5430008D7560009DC5D0008DF5E0009E467000AE76D000AE8
      6E000AE76C000AE76C0004DE5A0022D2580022D9740046DE8C00FDF9FA00F8F8
      F700F7FAF700FBFCFB00FEFEFE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FCFCFC00F9F9
      F900F8F8F800000000008D8D8D00505050004F4F4F005A5A5A00676767006B6B
      6B006C6C6C007171710074747400757575007474740074747400696969006E6E
      6E007A7A7A0090909000FAFAFA00F7F7F700F8F8F800FBFBFB00FEFEFE000000
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
      00000000000000000000000000000000000000000000A2C7A80000972C0005AF
      380004B0340006C1400007D2500008D95A0007DD5C0008E2640009E76E000BEA
      72000AE96E0009E66A0009E5690002D44D002DD3630011E1730077F5B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B0B0B000414141004E4E4E004D4D4D0057575700636363006969
      69006A6A6A006F6F6F0074747400777777007575750073737300727272006161
      61007676760077777700B6B6B600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DBEBDF0013AC4B0023AC
      4A000B8C290015953600189638001B973B0022994100279944002B9B470033A0
      4F003BA3560042A75C0046A85F0048A760004CA5620052A666005DAA6F002C8C
      41000E9D390023AF4A0000921C0001951F0001991F00019F2200009E15003EB5
      5500E7F4EA000000000000000000000000000000000000000000000000000000
      000000000000E1E1E100585858005D5D5D00404040004A4A4A004C4C4C004F4F
      4F0054545400565656005959590060606000666666006C6C6C006F6F6F006F6F
      6F0071717100747474007C7C7C00535353004C4C4C005E5E5E003A3A3A003C3C
      3C003D3D3D00404040003B3B3B006D6D6D00ECECEC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBDACB00097F260001AF380004AC
      340004AE360004B3370006C5430007D04D0007D6540007DC5A0008E465000AE8
      6E000AE86D0008E3640007DC5C0007D7550003C23D0035D670000CF17E00A0F0
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0D0D0003A3A3A004D4D4D004C4C4C004D4D4D004F4F4F005A5A5A006161
      610065656500696969007070700075757500757575006F6F6F006A6A6A006666
      6600565656007E7E7E007E7E7E00C7C7C7000000000000000000000000000000
      00000000000000000000000000000000000000000000DDEEE20013CC650017A9
      3E0000831200008A1A00008E1B0000921C0000911C00008F1A00008B17000089
      15000088140000881400008C1500008F1600009015000091140000931300029A
      1D00049A1F00019A1C0001991D0001961C0001951B0001951A0001981B000099
      11001CA63300CAE8D00000000000000000000000000000000000000000000000
      000000000000E4E4E4006C6C6C00545454003131310036363600383838003A3A
      3A00393939003838380036363600343434003434340034343400353535003737
      37003737370037373700373737003D3D3D003F3F3F003D3D3D003D3D3D003B3B
      3B003B3B3B003A3A3A003C3C3C003838380051515100D6D6D600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEF1ED00227A3200009D2B0003A42F0004AD
      370004A8330003A6300005B5390006C3420007CE490006D44E0007DC570009E3
      620009E3640008DE5C0006D24B0007CB440004C4430007AE320036E480000FDF
      7100CDEFDB000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEEE
      EE004444440042424200474747004D4D4D004A4A4A0048484800515151005959
      59005F5F5F0062626200686868006F6F6F00707070006B6B6B00616161005C5C
      5C00595959004D4D4D008888880075757500DDDDDD0000000000000000000000
      00000000000000000000000000000000000000000000E3F2E8001AD9740019AA
      4300007C1200018019000182190001861B00018C1D0001911F0001921F00018F
      1D00018D1C00018B1B00018A1A00018B1A00018D1A00018D1900018E19000190
      1A0001931A0001981B00019D1D0001A01D0001A11E0001A31F0001A3200001A6
      210000A71D0009AA2800A2DCAF00000000000000000000000000000000000000
      000000000000E9E9E90077777700575757002F2F2F0033333300343434003636
      3600383838003B3B3B003B3B3B00393939003838380037373700373737003737
      3700383838003737370038383800393939003A3A3A003C3C3C003E3E3E003F3F
      3F00404040004141410041414100424242004141410049494900B9B9B9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000093BC9900008D200006A2300006A3330007AA
      380006A7340003A02E0003A6300005B7380007C6410006CC410006D3470007D8
      4E0009DC550008D84F0006C83D0008C03D0009BE430005B43C0015AE3E0027DF
      790079E1A7000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A2A2
      A2003939390048484800494949004D4D4D004B4B4B0045454500484848005151
      51005A5A5A005B5B5B0060606000646464006868680065656500595959005757
      57005858580051515100555555007F7F7F00ABABAB0000000000000000000000
      00000000000000000000000000000000000000000000E4F3E9001BD6710019A7
      420000760F00017A1500017A1500017A1400017C1500017E1500018216000084
      17000083160000831500008415000084150000861600018A1700018B1800018D
      180001911A0001941C00019B1E0001A4220002AB260002B12A0003B52D0003B8
      300003B9320000B92F0000B1280076D08E00FFFEFF0000000000000000000000
      000000000000EAEAEA0076767600565656002C2C2C0030303000303030002F2F
      2F00303030003131310033333300333333003333330032323200333333003333
      330034343400363636003636360037373700393939003B3B3B003E3E3E004242
      420046464600494949004C4C4C004E4E4E004F4F4F004D4D4D00484848009C9C
      9C00FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000053B66B00008B0F0000911E0000952000009C
      2400019C2600039D2B00039C2A0004AA300005BC3A0006C43B0006CA3B0006CC
      3B0008D1430008D0440005BF370000AB290000A7280000AC2E00009D1F0004A0
      2B008FEDB8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007C7C
      7C00333333003A3A3A003C3C3C00404040004141410043434300434343004A4A
      4A00535353005757570059595900595959005E5E5E005E5E5E00535353004646
      460045454500484848003E3E3E0045454500BCBCBC0000000000000000000000
      00000000000000000000000000000000000000000000E5F3E9001CD3700018A6
      400000740C00007712000075120000741100007511000076120000771200007B
      1200007E130000811400008416000087170001891800018D1A0001921C000296
      1E00029A2000029F220002A5260002AD2A0003B8310003C2370004C93C0004CD
      3F0004CE400004CA3F0003C73E0000BA2D004CC76F00F1F9F400000000000000
      000000000000EBEBEB0075757500545454002A2A2A002D2D2D002D2D2D002C2C
      2C002C2C2C002D2D2D002D2D2D002F2F2F003030300031313100333333003434
      340036363600383838003A3A3A003C3C3C003E3E3E0041414100444444004848
      48004E4E4E0054545400585858005A5A5A005B5B5B0059595900585858004D4D
      4D0080808000F4F4F40000000000000000000000000000000000000000000000
      0000000000000000000000000000A2D4AD0088C694008DCA9A008DCB9A0091CE
      9E0062BA7600009321000296260003A12B0004B0310006BB360006C0360005C0
      330007C3380005C2390004B62E0072C5840091CE9E008ED39E008ED39E0084C6
      9000C4E7CD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B6B6
      B600A0A0A000A5A5A500A6A6A600A9A9A900868686003C3C3C003F3F3F004545
      45004C4C4C0052525200545454005252520056565600555555004D4D4D009393
      9300A9A9A900AAAAAA00AAAAAA009E9E9E00D2D2D20000000000000000000000
      00000000000000000000000000000000000000000000E5F3E9001CD06E0017A4
      3E0000740B00007C1300007C1300007A12000079120001791300017B1300017F
      140001861700028E1A0002951C00029C200002A2220002A8250002AE290003B4
      2D0003B82F0003BA310002BD320001C0320001C4340004CB3A0008D2420007D7
      470006D94A0005D84A0004D4470004D0470000C5370027BA4C00F0F8F2000000
      000000000000EBEBEB0073737300535353002A2A2A002F2F2F002F2F2F002E2E
      2E002E2E2E002F2F2F002F2F2F003131310034343400383838003B3B3B003F3F
      3F004242420045454500484848004C4C4C004E4E4E004F4F4F00505050005151
      510053535300585858005E5E5E006161610063636300626262005F5F5F005E5E
      5E005454540064646400F3F3F300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFDFC500008B1800018F2100039A260004A52B0005B02F0006B6300005B4
      2E0006B7310002B12C0007B42D00DBF4E1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCB00363636003B3B3B004141
      4100464646004C4C4C004E4E4E004D4D4D004F4F4F004A4A4A004D4D4D00E5E5
      E500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5F3E9001CCD6C0015A0
      3900006B030000750F00007D130000861700028E1A0002971D00029F1F0002A4
      210002AA240002B0270002B72B0003BC2F0003C1310002C4330001C6340000C9
      340000CC370000CF3A0003D23F000BD6470014D94F0018DC540016DE580013E1
      5C0011E461000FE563000EE6670007E1610005CA450095DDA700000000000000
      000000000000EBEBEB00717171004F4F4F00242424002C2C2C00303030003434
      3400383838003C3C3C00404040004242420045454500484848004C4C4C004F4F
      4F005151510053535300535353005454540056565600585858005C5C5C006262
      6200696969006D6D6D006E6E6E00707070007272720072727200737373006D6D
      6D005C5C5C00B3B3B30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C5E2CA000086160000891D0003932200039C250005A6290006AA2A0005A9
      280005AA290001A4240009B02D00DDF5E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0D0D00034343400373737003D3D
      3D004141410046464600484848004747470048484800434343004C4C4C00E7E7
      E700000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5F3E90018C865002FB0
      5400278B35000D85230001871A000092190000A21D0000B1220000BA250000BE
      280000C1290000C32A0000C62C0000CA2F0000CD330001D13A0006D642000EDA
      4D0019DE590026E368002FE7730031E978002EEA7A0029EA780026EA770022EB
      76001FEC77001FEF7E0014EC76001FD45D00C0EBCA0000000000000000000000
      000000000000EBEBEB006C6C6C00666666004D4D4D003C3C3C00363636003939
      39003F3F3F00464646004A4A4A004C4C4C004E4E4E004F4F4F00505050005353
      530055555500595959005F5F5F0067676700707070007B7B7B00838383008686
      86008686860083838300828282008181810080808000848484007C7C7C007070
      7000D1D1D1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCE5D0000081140000831A00038D1E0003932000049D2400059D2300059E
      2300059F240001991E000CAD2D00E3F8E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5D5D50031313100343434003A3A
      3A003C3C3C00414141004141410042424200424242003D3D3D004C4C4C00ECEC
      EC00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5F3E90012C15C0050C3
      75009FCCA5008AC7950077C3860065C3780053C96C0045D164003ED762003AD9
      620039DB640039DD67003BDF6B003FE1710046E47A004BE7810050E9870052EB
      8B0052ED8D004EEE8D0048EF8D0044F08D0040F18F003DF18F0039F28E0035F2
      8C0034F5920022EC7E003CD76E00DCF2E0000000000000000000000000000000
      000000000000EBEBEB006565650082828200B0B0B000A2A2A200959595008A8A
      8A00828282007E7E7E007D7D7D007C7C7C007D7D7D007F7F7F00818181008585
      85008C8C8C009191910095959500989898009999990098989800969696009595
      950095959500949494009393930091919100939393008484840080808000E4E4
      E400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0E6D400017E1600007F160002861B00038D1D000495200004941F000494
      1F0004951F0000911A000EA92E00E7FAED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8D8D80031313100313131003636
      3600393939003D3D3D003D3D3D003D3D3D003D3D3D00393939004C4C4C00EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4F3E90010BE59004EC4
      7400AED7B500A5D7B000A4DAB000A2DFAF009FE6AD009BEBAF0098EFB00093F0
      B0008FF0AF008BF1AE0087F2AE0082F2AC007DF2AA0078F2A80072F2A6006DF3
      A4006BF5A50065F4A2005CF29B0058F29A0054F39B0050F39A004DF39A004EF6
      A00034E981005EDA8300F0F8F000000000000000000000000000000000000000
      000000000000EAEAEA006262620082828200BEBEBE00B9B9B900BABABA00BABA
      BA00BBBBBB00BCBCBC00BDBDBD00BBBBBB00BABABA00B8B8B800B7B7B700B5B5
      B500B3B3B300B0B0B000AEAEAE00ACACAC00ACACAC00A9A9A900A3A3A300A1A1
      A100A0A0A0009F9F9F009E9E9E00A1A1A1008A8A8A0093939300F2F2F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D4E7D7000F7F21000D8522000081170003891A00038F1D00048D1C00048F
      1D00048D1C00008B170012A73000EBFDF1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DBDBDB003A3A3A003C3C3C003232
      3200373737003A3A3A00393939003A3A3A0039393900363636004D4D4D00F3F3
      F300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3F2E70009B64B004AC2
      6E00C2E1C600B5E0BE00AFE0BA00A9E2B500A4E5B2009EE7B00097E7AC0090E5
      A7008AE4A30083E29E007CE0990077DF960072DD92006DDB8C0069D9880064D9
      840059D27A005BDD830072EDA1006EEC9F006AEC9C0066ED9B0067F1A10045DD
      7A007BD99300FCFCFB0000000000000000000000000000000000000000000000
      000000000000E9E9E900585858007E7E7E00CDCDCD00C6C6C600C3C3C300C0C0
      C000BEBEBE00BCBCBC00B8B8B800B4B4B400B0B0B000ABABAB00A7A7A700A4A4
      A400A0A0A0009C9C9C0098989800959595008C8C8C0093939300AAAAAA00A8A8
      A800A6A6A600A4A4A400A8A8A80089898900A2A2A200FBFBFB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DAEBDD00187F2800268E3800138B280000871800028B1A00048B1B00048D
      1C00048B1B000088150016A63300F0FEF5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0E0E0003F3F3F004E4E4E004242
      42003535350037373700383838003939390038383800343434004F4F4F00F6F6
      F600000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0EEE2002384320033924300339A4500209B3800048E1E00008E19000391
      1D0004921E00008C160019A73600F3FFF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E5E50048484800585858005B5B
      5B00515151003A3A3A00373737003B3B3B003C3C3C003636360052525200F8F8
      F800000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000E2EFE4002B8B3C00409A51003EA151003EAE560036AB4D0017A031000199
      1E00009C1E00009519001DAC3B00F7FFFB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7E7E70050505000636363006565
      65006B6B6B00646464004D4D4D003D3D3D003E3E3E003A3A3A0056565600FBFB
      FB00000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000E4F1E7003695480050A461004DAA5F004AB763004ABD630049C0610037B9
      500019B3390000A31F0020B24100F9FFFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E9E9E9005B5B5B00717171007272
      72007676760078787800787878006A6A6A0057575700404040005B5B5B00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
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
      0000E7F3EA0042A1550061B071005DB36F005AC0720058CA720055CE700053CD
      6C0051CF6C003EC35B0038C05B00F9FFFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ECECEC0068686800808080007F7F
      7F0084848400868686008686860084848400848484007474740071717100FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
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
      0000ECF5EE004DA9610070BC82006CBD7E006AC57E0068D1810065D67F0061D5
      79005ED4770058CC710049C86B00F9FFFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00727272008F8F8F008D8D
      8D008F8F8F0093939300939393008F8F8F008D8D8D00878787007E7E7E00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
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
      0000EFF6F10059AE6C0080C691007CC68D0079C98B0077D18C0074D68C0071D5
      87006DD3830065CA7A004FC87100FBFFFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F2F2F2007B7B7B009D9D9D009A9A
      9A00999999009C9C9C009C9C9C0099999900969696008D8D8D0082828200FDFD
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
      0000F0F6F10060AF720091CFA0008CCD9B0089CD980086D0970084D3960080D2
      94007DCF8F0074C5840057C57600FDFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F2F2F20080808000AAAAAA00A6A6
      A600A4A4A400A4A4A400A4A4A400A2A2A2009E9E9E009494940086868600FEFE
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
      0000F1F7F30069B07800A0D4AC009AD2A70098D0A40095D0A30092D1A10090D1
      A0008CCE9B0082C48F0069C78300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3F3F30085858500B5B5B500B1B1
      B100AEAEAE00ADADAD00ACACAC00ABABAB00A7A7A7009C9C9C00919191000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F4F8F50073B48100AEDAB800A9D8B400A6D6B100A3D6AF00A0D4AD009ED5
      AB009BD3A8008EC89A007ECA9100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F5008D8D8D00C0C0C000BCBC
      BC00B9B9B900B8B8B800B5B5B500B4B4B400B2B2B200A5A5A5009D9D9D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6FAF7007DB98900BFE3C700BBE0C300B8DFC200B6DEBF00B4DDBD00B1DE
      BC00AFDCBA009FD2AB008BCF9B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F70095959500CDCDCD00CACA
      CA00C8C8C800C6C6C600C4C4C400C3C3C300C1C1C100B4B4B400A7A7A7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFDFC0086BE9400A3D0AD00A0CDA9009FCDA8009CCBA70097C9A20095C9
      A00094C8A00082BD8E0096CBA300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC009D9D9D00B5B5B500B2B2
      B200B1B1B100AFAFAF00ABABAB00AAAAAA00A9A9A90099999900ACACAC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000FFFEFF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFD
      FE00FDFDFD00FDFDFD00FDFDFD00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FEFE
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
      0000000000000000000000000000000000000000000000000000FAFBFA00ECEF
      EC00D6DDD800C4CEC600BCC7BF00BCC7BE00BCC7BF00BCC8BF00BCC7BF00BBC7
      BE00BBC6BD00BAC6BD00BFCAC100CED6D000E5E9E600F7F8F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAFAFA00EDEDED00D9D9D900C8C8C800C0C0C000C0C0
      C000C0C0C000C1C1C100C0C0C000C0C0C000BFBFBF00BFBFBF00C3C3C300D1D1
      D100E6E6E600F7F7F70000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000F3F5F300D0D8
      D200A6B4A9007F9485006F8775006E8574006F8474006F8373006F8474006E84
      73006D8473006C837200768A7B0098A59B00C3CDC600EBEEEC00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3F3F300D3D3D300ABABAB0088888800797979007777
      77007777770077777700777777007777770076767600757575007E7E7E009D9D
      9D00C7C7C700ECECEC00FEFEFE00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000F2F4F200D2D8
      D40051835900155E20001763240017732B00188734001894390018863300188E
      3700167F2E00167D2D00167F2E0026843B00B3C1B500EDEFEE00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F2F2F200D4D4D4006464640031313100343434003C3C
      3C00464646004C4C4C0045454500494949004141410040404000414141004C4C
      4C00B8B8B800EEEEEE00FEFEFE00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000F5F6F500D1D8
      D300349249001B8B3400218F3B00219D420022AF4B0022BE530022B34E0022B9
      510022AE4C0022A9490020A948001EA34400ACC5B300F4F2F300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F5F5F500D4D4D4005A5A5A00484848004E4E4E005555
      55005E5E5E006666660061616100646464005E5E5E005C5C5C005B5B5B005757
      5700B6B6B600F3F3F30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFE00FCFCFC00F5F8F500E9F1EA00D9E7DB00C7DCCA00B6D2
      BA00A8C9AD00A0C4A5009CC2A200A3C6A800B6D2BA00CDE0CF00DDE9DE00E1EC
      E300E2ECE300E2EDE300E2EDE400E3EDE400E4EEE500E4EEE500E4EEE500E5EE
      E600E5EFE600E6EFE700E6F0E800E9F1EA00F0F5F000F8FAF800FEFEFD000000
      00000000000000000000000000000000000000000000FEFEFE00FCFCFC00F6F6
      F600ECECEC00DEDEDE00CFCFCF00C0C0C000B4B4B400ADADAD00AAAAAA00B0B0
      B000C0C0C000D4D4D400E1E1E100E5E5E500E5E5E500E6E6E600E6E6E600E6E6
      E600E7E7E700E7E7E700E7E7E700E8E8E800E8E8E800E9E9E900EAEAEA00ECEC
      EC00F1F1F100F8F8F800FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F8F900D4D9
      D5001A9433000296220007972700079524000797250007992500079E2800079B
      2700079B26000797240003972100169A3300BBD4C500F8F5F600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F8F8F800D6D6D6004B4B4B003E3E3E00414141004040
      40004141410041414100444444004343430042424200404040003E3E3E004B4B
      4B00C6C6C600F6F6F60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00F8FAF800F0F5F000E4EEE500D6E5D800C8DDCB00BDD6C100B6D2BA00B2D0
      B700B2CFB600B2CFB600B6D0B900BCD3BE00B7D3BB00BAD5BE00BDD6C100BED7
      C200BED7C200BED7C200BFD7C200BFD7C300C0D8C300C0D8C300C0D8C300C0D8
      C400C0D8C400C1D8C400C1D9C400C8DDCB00D8E7DA00ECF3ED00FBFCFB000000
      0000000000000000000000000000FDFDFD00F8F8F800F1F1F100E7E7E700DBDB
      DB00D0D0D000C6C6C600C0C0C000BDBDBD00BDBDBD00BDBDBD00BFBFBF00C4C4
      C400C1C1C100C4C4C400C6C6C600C7C7C700C7C7C700C7C7C700C8C8C800C8C8
      C800C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900CACACA00D0D0
      D000DDDDDD00EEEEEE00FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAFAFA00DDDF
      DD001A90340000911C000094210000921F000097210000992100009E2600009B
      2200009921000097200000991E000F952F00C0D4C700FCF9FB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAFAFA00DDDDDD004A4A4A00393939003C3C3C003B3B
      3B003D3D3D003E3E3E00414141003F3F3F003E3E3E003D3D3D003D3D3D004646
      4600C9C9C900FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F7FA
      F700EBF2EC00DDEADF00D1E3D300CADECD00C7DCCA00C6DCC900C6DCC900C7DC
      CA00C7DCCA00D3DED200BEDDC8009ED1AC00C3DAC600C7DCCA00C6DBC900C6DB
      C900C5DBC900C5DBC900C5DBC900C5DBC900C5DBC900C5DBC900C5DBC900C5DB
      C900C5DBC800C5DBC800C5DBC900CCDFCE00DCE9DD00EFF5EF00FCFCFC000000
      00000000000000000000FEFEFE00F8F8F800EDEDED00E2E2E200D7D7D700D1D1
      D100CFCFCF00CECECE00CECECE00CFCFCF00CFCFCF00D6D6D600CBCBCB00B3B3
      B300CBCBCB00CFCFCF00CECECE00CECECE00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00D3D3
      D300E0E0E000F1F1F100FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFCFC00E5E5
      E50022953C0000921C00019622000197220001A0250001A6270002AC2B0001A7
      250001A6240001A5240000A6230019A03900CCDAD100FFFCFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC00E5E5E500515151003A3A3A003D3D3D003E3E
      3E00424242004444440048484800444444004343430043434300434343005050
      5000D2D2D200FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FBFC
      FB00F4F8F400ECF3ED00E4EEE500DFEBE000DCE9DD00DAE8DC00DAE8DC00DCE8
      DD00EBEBE70097DCB4000EB74B001DA23900D6E5D700DDE9DF00DAE8DC00DAE8
      DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00DAE8DC00DBE8
      DC00DBE8DD00DBE8DD00DBE8DD00E0EBE100EAF2EB00F6F9F600FDFEFD000000
      00000000000000000000FEFEFE00FBFBFB00F5F5F500EEEEEE00E7E7E700E3E3
      E300E0E0E000DFDFDF00DFDFDF00E0E0E000E9E9E900B7B7B7005A5A5A005252
      5200DBDBDB00E1E1E100DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00E0E0E000E0E0E000E0E0E000E4E4
      E400EDEDED00F7F7F700FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00EEEB
      ED002D99450000911A0001972200019C230001A8280002B22C0002B72C0001B3
      260001B2250001B2270000B327001CA23B00D6DFD900FFFEFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFD00ECECEC0059595900393939003E3E3E004040
      4000454545004A4A4A004C4C4C00484848004848480048484800484848005353
      5300DADADA00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFEFD00FAFCFA00F6F9F600F2F7F300EEF4EF00F2F3F000FAF4
      F5007DDBA70000B33D0000A41F0026AE4300EAF1EB00F2F6F200F0F5F000F0F5
      F000F0F5F000F0F5F100F0F5F100F0F5F100F0F5F100F0F5F100F0F5F100F1F6
      F100F1F6F100F1F6F100F1F6F100F3F7F300F7FAF700FCFCFC00000000000000
      00000000000000000000000000000000000000000000FDFDFD00FAFAFA00F7F7
      F700F4F4F400F0F0F000F1F1F100F6F6F600AAAAAA0050505000414141005D5D
      5D00ECECEC00F3F3F300F1F1F100F1F1F100F1F1F100F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F4F4
      F400F8F8F800FCFCFC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F6F1
      F500359B4B00008D180001932000019D230002AD2A0002B82D0001BB290001BA
      260001B8250002BA2B0000B7270021A44000DDE3E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F4F4F4005E5E5E00373737003C3C3C004040
      4000484848004D4D4D004C4C4C004B4B4B004A4A4A004D4D4D004A4A4A005757
      5700E0E0E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000F7FFFC005EE9
      A10000B1340004B12D0002C137002AB94D00F7F8F70000000000FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FFFEFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE0000000000FBFBFB00A2A2A2004C4C4C004B4B4B00535353006565
      6500F7F7F70000000000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FCF6
      FA003C9A500000871400018E1E00029C250002AB290002B42A0001B6250001B6
      240001B4240002B92B0000B021002AA14500E7EAE90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F9F9F9006262620033333300393939004141
      4100474747004A4A4A004949490049494900484848004C4C4C00454545005A5A
      5A00E8E8E8000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000FFFB
      FF00499E590000801000018A1D00029A240002A3260002A9260001A7200001A8
      200001A8220002AF270000A01A002E9C4500EFEFF00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFD006A6A6A0030303000383838004040
      40004343430045454500424242004343430043434300484848003E3E3E005A5A
      5A00EFEFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6FEE4001DD16B0000BD370007CB
      450009DF5E0009E3640002E263002AC65700FCF9F90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E2E2E20073737300515151005D5D5D006C6C6C00707070006D6D6D006D6D
      6D00FAFAFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000A0F9CF000DE5700002C53F0008D5510009E5
      6A000AE86E0008E5680005E665000FD14E0047BF6B004EBD6F0051BC700056BC
      72005CBE760063BF7B0069C17F0070C5850077C98C007ECE920082D5980083D9
      9C0082DA9D007DD8980077D6950071D3910064CD85008ACA9C00000000000000
      000000000000000000000000000000000000000000000000000000000000CDCD
      CD00767676005757570064646400727272007575750071717100707070006464
      64007B7B7B007E7E7E007F7F7F008181810085858500898989008D8D8D009393
      9300999999009F9F9F00A5A5A500A8A8A800A8A8A800A4A4A400A0A0A0009C9C
      9C0092929200A5A5A50000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFEFD00FBFBFB00F9F9F900F7F8F700FFFC
      FF005DA56A0000790A0001851A0001921F0002911D0002901B00018A1800028E
      1900028E1A0002921B0000840F003E9C5100F5F3F500FAFAFA00FBFBFB00FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00FBFBFB00F9F9F900F7F7F700FEFEFE00797979002B2B2B00353535003B3B
      3B003A3A3A00393939003636360038383800383838003A3A3A00313131006363
      6300F4F4F400FAFAFA00FBFBFB00FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFEFD0073E8AB0000D65A0005C13C0007D24D0009E264000AE5
      680008E4640007E2600007E15F0006E15B0000D6460000D13E0000D03C0000D0
      3D0000CE390000CD370000CF390000CF380000CD340000CE370000D13B0000D2
      3C0000D23C0000D23A0000D1390000D23A0000CB32002BA33D00FFFCFF000000
      00000000000000000000000000000000000000000000FDFDFD00ACACAC006565
      650056565600626262006F6F6F0072727200707070006D6D6D006D6D6D006B6B
      6B005E5E5E005A5A5A0059595900595959005757570056565600585858005757
      57005555550057575700595959005A5A5A005A5A5A0059595900585858005959
      59005454540059595900FEFEFE00000000000000000000000000000000000000
      00000000000000000000FEFEFE00F9F9F900EEEFEE00E2E5E300DBDFDC00E7E3
      E60060A46C00007A0B0000841800018E1B000189190001891800018416000286
      1600018616000189170000800E003F9B5100D7D6D700DDE0DD00E9EBE900F6F7
      F600FDFEFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F9F9
      F900EEEEEE00E3E3E300DCDCDC00E5E5E5007A7A7A002C2C2C00343434003838
      38003636360036363600333333003434340034343400353535002F2F2F006363
      6300D6D6D600DEDEDE00E9E9E900F6F6F600FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ECF6EF0046CD800008C64F0013BB400002C33F0007D04B0008D64F0008DA
      530007D84F0007D84E0008DB540008DC570007DA520006DA500006D84E0005D6
      4A0005D5490005D5490004D3460004D3440004D3450004D3470004D4480005D3
      460003D0400003CD3C0003CE3C0003D03E0000C9380030A84800FFFCFF000000
      000000000000000000000000000000000000F0F0F000868686005F5F5F005A5A
      5A00565656006060600064646400676767006464640064646400676767006969
      69006666660065656500646464006161610061616100616161005F5F5F005E5E
      5E005E5E5E005F5F5F00606060005F5F5F005B5B5B0059595900595959005B5B
      5B005555550060606000FEFEFE00000000000000000000000000000000000000
      00000000000000000000FEFEFE00F9F9F900EDEFEE00DFE2DF00D3D8D400DEDA
      DD006CA87500007C0A0000841600008A17000086160001881700018215000183
      1500018415000186160000840F00439D5700CDCBCC00D4D8D400E6E8E600F6F7
      F600FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F9F9
      F900EEEEEE00E0E0E000D5D5D500DCDCDC00838383002C2C2C00333333003535
      3500343434003535350032323200333333003333330034343400313131006767
      6700CCCCCC00D5D5D500E6E6E600F6F6F600FEFEFE0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CFE7
      D60022B1580010BD4A0035BF580036C4600015BD470001BC380006C53E0007C6
      3C0006CA3C0008D0440008D2450007CE400007CB3C0005C7380005C6360005C6
      360005C4340004C2320005C3330004C2320004C2310005C4340005C3320003BC
      2A0002B9260002BA280002BB280002BA280000B6220031A44700FFFDFF000000
      0000000000000000000000000000D9D9D900636363005D5D5D006E6E6E007373
      73005D5D5D00515151005858580058585800595959005E5E5E005F5F5F005C5C
      5C005A5A5A005656560055555500555555005454540052525200535353005252
      52005252520054545400535353004D4D4D004B4B4B004C4C4C004C4C4C004C4C
      4C00484848005E5E5E00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000FDFEFD00F9F9F900EFF1EF00E3E6E400E8E4
      E70077B07F00007E0900008215000088170001861600018B1800018616000188
      170002891800028F1A000090130051A46400E1DDE000E8EAE800F5F6F500FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00F9F9F900EFEFEF00E4E4E400E6E6E6008C8C8C002D2D2D00323232003535
      3500343434003636360034343400353535003636360039393900363636007373
      7300DFDFDF00E8E8E800F5F5F500FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AFD9BB000DA0
      3E0024BF510049C3660047C3680044C0650042C0630021B9490002AF2F0002B5
      310007C03A0007C33B0008C33A0006BC340005B62F0006B7300006B6300005B0
      2C0005B02C0005B02D0005AB2A0004AB290005AF2C0004A9290003A22200029F
      2000029F2000029F200003A2220003A22200009B180030984300FFFEFF000000
      00000000000000000000C1C1C1004E4E4E00666666007B7B7B007B7B7B007878
      780077777700616161004A4A4A004D4D4D005555550057575700575757005252
      52004E4E4E004F4F4F004E4E4E004B4B4B004B4B4B004B4B4B00484848004848
      48004A4A4A004747470042424200404040004040400040404000424242004242
      42003B3B3B0059595900FEFEFE00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFE00FCFCFC00F4F5F400F7F1
      F60089BE92000081100000821400018C1900018D190001941C0002931C000295
      1C00029A1E0002A12100009F19005BAA6D00F9F2F800F9F9F900FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FCFCFC00F4F4F400F4F4F4009D9D9D0030303000323232003737
      3700373737003B3B3B003B3B3B003B3B3B003E3E3E00414141003D3D3D007B7B
      7B00F6F6F600F9F9F900FEFEFE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5D7BD00007F170037C3
      5C0063CB770058C6730054C36F0052C26C0050C16B0050C06A003ABC590011B1
      390000B22C0002B52F0005AD2B0005A9290005AC2B0005A92A0004A3270004A3
      2800039D260003982300039923000399230003922000028D1D0002881B000285
      190002881B00028E1E00028D1D0002861A000082120030904100000000000000
      000000000000C3C3C30032323200727272008C8C8C0085858500828282008080
      80007E7E7E007E7E7E006F6F6F00535353004A4A4A004C4C4C00494949004747
      470049494900484848004444440045454500424242003F3F3F003F3F3F003F3F
      3F003C3C3C00393939003737370035353500373737003A3A3A00393939003636
      3600313131005555550000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A8D2AF00108F2700058D1F0000911C000298200002A1240002A6240002AA
      250002B1290002B62B0000AE210067B079000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8B8B800424242003B3B3B003939
      39003E3E3E00424242004444440045454500494949004B4B4B00454545008585
      8500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5F8F500519F61000192
      280056C6700070CC810065C97A0061C677005EC674005BC472005CC3720057C5
      6F003BBC570016A63400029B2100009E2000009E2100029F2300039A22000392
      2000038D1E00038C1E0002871B0002851A00028119000179160001751500027D
      180002831A00027E1800017716000076140000710C002F893E00000000000000
      000000000000F6F6F600707070003E3E3E0084848400949494008D8D8D008A8A
      8A00888888008585850085858500838383006F6F6F00505050003F3F3F003F3F
      3F003F3F3F00414141003F3F3F003C3C3C003A3A3A0039393900363636003535
      350034343400303030002E2E2E003232320035353500323232002F2F2F002E2E
      2E00292929005252520000000000000000000000000000000000000000000000
      0000000000000000000000000000EAF2EB00DFEFE200DEF1E200DBEEDF00E6F1
      E80099CEA300229C3A0027A44200099D2A0000A4260002AF2B0003B82E0002BD
      2E0003C2310002C5330000B727006CB47D0000000000EEFDF500EDFCF400ECFA
      F200F8FDFB000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EDED
      ED00E5E5E500E5E5E500E2E2E200EAEAEA00AEAEAE0052525200595959004545
      450043434300494949004D4D4D004F4F4F0052525200535353004A4A4A008989
      890000000000F5F5F500F4F4F400F2F2F200FAFAFA0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000072D0
      970000AD3C0050C56C007DD08A0072CD84006ECA80006BC87D0068C87B0066C5
      790066C0780061BB71004EB5610030AD490018A7340008982300008B19000087
      160000821400007C1300007E1400007B140000711100006F100000781300007D
      14000077130000721100006D1000016B1200006E1200388C4600000000000000
      00000000000000000000000000009D9D9D004D4D4D00808080009D9D9D009696
      960092929200909090008E8E8E008C8C8C008A8A8A0084848400767676006262
      620051515100414141003636360034343400323232002F2F2F00303030002F2F
      2F002B2B2B002A2A2A002E2E2E00303030002E2E2E002B2B2B00292929002A2A
      2A002A2A2A005858580000000000000000000000000000000000000000000000
      0000000000000000000000000000378746000081190002A02E0000962700008C
      22000C8C280039AB51003AB1560034B3520013B43D0000B62D0000C3320003C8
      330003CC370003D13A0005C23500139B3C0017D56E0015EB7E0013DF730004CC
      5D008EE3B2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005656
      560033333300454545003F3F3F003A3A3A0040404000676767006B6B6B006868
      6800565656004B4B4B005151510054545400575757005A5A5A00545454004E4E
      4E00737373007F7F7F007777770064646400B6B6B60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000092E5B70000B9460045C468008AD3940081D090007BCE8A0077CB880075C8
      840071C180006FBF7E006FC680006FC9800068C179005CB66C004DAD5E003A9F
      4C002C953E00229236001C8C300017812900158128001585280015892900188A
      2B001C862F00228031002A82370031883F00308B3F004C975800FFFEFF000000
      000000000000000000000000000000000000BABABA00555555007B7B7B00A5A5
      A500A0A0A0009B9B9B009898980095959500909090008E8E8E00919191009292
      92008B8B8B007F7F7F007272720061616100555555004E4E4E00484848004040
      40003F3F3F0040404000424242004444440045454500464646004B4B4B005252
      52005353530069696900FEFEFE00000000000000000000000000000000000000
      00000000000000000000FFFEFF002C94470000A53D000AD968000CD365000BCF
      62000CA13D0042AE580046BB640043BE620042C867002CCA57000CCE410000D1
      390000D6400002DC470008CB3F0010872F0008AD4A000CD769000DCC610000C2
      52006DCF93000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE005757
      57004B4B4B006E6E6E006C6C6C00696969004E4E4E006D6D6D00777777007676
      76007B7B7B006F6F6F005E5E5E00585858005C5C5C00616161005B5B5B004242
      4200555555006E6E6E00686868005C5C5C009A9A9A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B4F2D20008C8580035C462008FD49B008ED49D0086D2970084CB
      930081CA90007ECF90007BCF8E007ACC8B0076C7870074C1830072BD810070BD
      80006CBB7C0068B6770064B273005FAF6F005BAD6A0058AD680054AE660051A5
      60004D9A5A00499756004597530040944E003691470049995600FDFEFD000000
      00000000000000000000000000000000000000000000D2D2D200626262007373
      7300AAAAAA00AAAAAA00A5A5A500A0A0A0009E9E9E009F9F9F009D9D9D009B9B
      9B009696960092929200909090008F8F8F008B8B8B0087878700838383007F7F
      7F007B7B7B007979790078787800727272006B6B6B0067676700656565006060
      60005A5A5A0068686800FDFDFD00000000000000000000000000000000000000
      00000000000000000000000000006FC4840024B04A003AC366003AC466003EC4
      690034B358004DB9680054C4720050C770004ED275004ED9760049E0770032E2
      6C0017E2600007E45C0002DA4C001DB9460021AF450021B94B0024BB4F0018AE
      4000A4D9B2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009292
      92005F5F5F007676760076767600797979006A6A6A007A7A7A00838383008282
      820087878700898989008A8A8A0080808000737373006D6D6D00626262005E5E
      5E005C5C5C00616161006464640057575700BABABA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D2FBE60018D66A0025C45C0093D8A2009DD8AB0092D6
      A30090D7A2008DD8A0008DD7A0007BCB8E0067BA790067BB790063BB76005FB6
      73005EB372005AB36F0055AE6A0051A967004EAA65004CAD660049A66200479E
      5E00489F600047A0600046A0600045A060003D9D5B005EAC7500000000000000
      0000000000000000000000000000000000000000000000000000E6E6E6007272
      72006C6C6C00AFAFAF00B5B5B500AEAEAE00ADADAD00ACACAC00ACACAC009C9C
      9C0088888800898989008686860082828200818181007E7E7E00797979007575
      75007474740075757500707070006B6B6B006D6D6D006D6D6D006C6C6C006C6C
      6C00676767007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000F1F7F10058B96D0064C47B006ECB850068C8
      810068CB820065C9800062CC7F005FD381005CDC830059E1850057E78B0057ED
      910055F094004BF092003BEC840028E369001DD556001CD1570008BF40005EC5
      7700000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F3F3
      F3007F7F7F008B8B8B009494940090909000919191008F8F8F008F8F8F009191
      91009393930095959500989898009C9C9C009D9D9D00999999008E8E8E007C7C
      7C006D6D6D006C6C6C0057575700888888000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EBFFF60032E07F0014BE510090D9A300AAE1
      B8009EE0B1009BDFAF009ADBAC008CCD9C00ECF5EF00FAFDFB00F8FCF900F8FC
      FA00FBFDFC00FCFDFD00FCFDFD00FCFEFE00FDFEFE00FDFEFF00FEFFFF00FEFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F5F5
      F5008585850061616100AEAEAE00C1C1C100BABABA00B8B8B800B5B5B500A7A7
      A700F0F0F000FBFBFB00F9F9F900FAFAFA00FCFCFC00FCFCFC00FCFCFC00FDFD
      FD00FDFDFD00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4F4E80057C0710079D695007BD6
      960076D4910073D28D0071D88F006EDF91006BE5950068E9970065ED9B0063F2
      9F0061F3A2005FF4A2005DF29D005AEE97005AEA93004AE0820060CF7E00FAFB
      FA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EAEAEA0082828200A1A1A100A2A2A2009E9E9E009B9B9B009D9D9D009F9F
      9F00A1A1A100A2A2A200A4A4A400A6A6A600A7A7A700A7A7A700A4A4A4009F9F
      9F009D9D9D008E8E8E008F8F8F00FAFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9FFFF0052DD8F0005AA3E0086DA
      9F00B7E8C500A9E1B900A7DFB70097D5A700F5FAF60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00949494004F4F4F00AAAAAA00CCCCCC00C1C1C100BFBFBF00B1B1
      B100F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5EEDB005AC878008ADE
      A40086DB9F0082DB9C0080E49F007DE9A3007AECA70077EFA70074F2A90072F6
      AE0070F6AE006DF6AB0069F4A50067F1A3005FEC9A0056D57C00ECF6ED000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFDFDF0088888800AEAEAE00AAAAAA00A8A8A800ABABAB00ADAD
      AD00AFAFAF00AFAFAF00AFAFAF00B2B2B200B1B1B100AFAFAF00ABABAB00A9A9
      A900A1A1A1008D8D8D00EFEFEF00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000C7EBD00064C9
      7F009AE3B00092E3AA008FEAAE008CEEB30089F1B40086F2B30083F4B40081F6
      B7007EF6B5007BF5B10079F3AC0076F2AB005AD98100DBF3E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6D6D6008E8E8E00B9B9B900B5B5B500B7B7B700B9B9
      B900BABABA00B9B9B900B9B9B900BABABA00B8B8B800B5B5B500B2B2B200B1B1
      B10091919100E4E4E40000000000000000000000000000000000000000000000
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
      0000BDF5D6000DC3530042C56F0092D5A200F6FAF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8D8D800616161007C7C7C00ADAD
      AD00F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000DBF8E80086D5A100A9E2BB00FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900A9A9A900C2C2
      C200FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000090000000B00100000100010000000000C02100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      C00000007C00000007FFFFFFFFFFFFFFFFFF0000C00000003C00000003FFFFFF
      FFFFFFFFFFFF0000800000003800000003FFFFFFFF1FFFFFFFF1000080000001
      3800000013800000001800000001000080000003380000003380000000180000
      0001000080000007380000007380000000180000000100008000000038000000
      03C00000003C000000030000800000003800000003C00000003C000000030000
      800000003800000003C00000083C000000830000800000003800000003C00000
      003C000000030000800000003800000003C00000003C00000003000080000000
      3800000003C00000003C000000030000800000003800000003C00401003C0040
      10030000800000003800000003C00401003C0040100300008000000038000000
      03C00401003C004010030000800000003800000003C00401003C004010030000
      800000003800000003C00203003C002030030000800000003800000003DFFE01
      FF3DFFE01FF30000800000003800000003DFFC01FF3DFFC01FF3000080000000
      3800000003DFFC01FF3DFFC01FF30000800000003800000003DFFC01FF3DFFC0
      1FF30000800000003800000003DFFE01FF3DFFE01FF300008000000038000000
      03DFFE03FF3DFFE03FF30000800000003800000003DFFFFFFF3DFFFFFFF30000
      800000003800000003DCE39E713DCE39E7130000820000003820000003DCF39E
      713DCF39E7130000800000003800000003DCF39E713DCF39E713000080000000
      3800000003C00000003C000000030000800000003800000003C00000003C0000
      00030000820000003820000003C00000003C0000000300009200000039200000
      03C00000001C0000000100009C00000039C0000003C00000001C000000010000
      980000003980000003C00000001C000000010000900000003900000003C00000
      003C000000030000800000003800000003FFFFFFFFFFFFFFFFFF0000C0000000
      3C00000003FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000FFFFFFFFFFFFFFFFFFFFCFFFFFFFFCFFFFFF0000FFFFE3FFFFFFFE3F
      FFFF307FFFFFF307FFFF0000FFFFC1FFFFFFFC1FFFFEC05FFFFFEC05FFFF0000
      FFFF00FFFFFFF00FFFFD005FFFFFD005FFFF0000FFFE007FFFFFE007FFFC005F
      FFFFC005FFFF0000FFF8003FFFFF8003FFF8005FFFFF8005FFFF0000FFF0001F
      FFFF0001FFF0005FF7FF0005FF7F0000FFC0000FFFFC0000FFF0005FFFFF0005
      FFFF0000FF000007FFF000007FA0007FE3FA0007FE3F0000FE000003FFE00000
      3FC003FFA2FC003FFA2F0000F8000001FF8000001FC00FFFC1FC00FFFC1F0000
      E0000000FE0000000F8017FFC1F8017FFC1F0000C00000007C00000007802FFE
      80B802FFE80B0000800000003800000003805FFF007805FFF007000000000000
      1000000001805FFD005805FFD0050000000000000000000000807FFA003807FF
      A0030000800000000800000000807FFE001807FFE00100008000000038000000
      03807FF4001807FF4001000080000000F80000000F807FF4001807FF40010000
      80000001F80000001F805FFD00B805FFD00B000080000007F80000007F903FFE
      009903FFE0090000C000001FFC000001FF802FFA00F802FFA00F0000C000003F
      FC000003FFC013E4017C013E40170000C00000FFFC00000FFFC80FF8017C80FF
      80170000C00003FFFC00003FFFE401C002FE401C002F0000E0000FFFFE0000FF
      FFA4000002FA4000002F0000E0103FFFFE0103FFFFD2000007FD2000007F0000
      E0787FFFFE0787FFFFF900000BFF900000BF0000E1F9FFFFFE1F9FFFFFF44000
      17FF4400017F0000F3FFFFFFFF3FFFFFFFFE10003FFFE10003FF0000FFFFFFFF
      FFFFFFFFFFFD00005FFFD00005FF0000FFFFFFFFFFFFFFFFFFFE40013FFFE400
      13FF0000FFFFFFFFFFFFFFFFFFFFB80EFFFFFB80EFFF0000FFFFFFFFFFFFFFFF
      FFFFE7F3FFFFFE7F3FFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFFF1FFFFFFFF1FFFFF0000FFFFFFFFFFFFFFFFFFE00000
      003E000000030000F0000000FF0000000FC00000001C000000010000E0000000
      7E00000007C00000001C000000010000C00000003C00000003C00000001C0000
      00010000C00000003C00000003C00000001C000000010000C00000003C000000
      03C00000001C000000010000C00000003C00000003C00000001C000000010000
      C00000003C00000003C00000001C000000010000800000001800000001C00000
      001C000000010000800000001800000001C00000001C00000001000080000000
      1800000001C00000001C000000010000800000001800000001C00000001C0000
      00010000800000001800000001C00000001C0000000100008000000018000000
      01C00000001C000000010000800000001800000001C00000001C000000010000
      800000001800000001C00000001C000000010000C00000003C00000003C00000
      001C000000010000C00000003C00000003C00000001C000000010000C0000000
      3C00000003C00000001C000000010000C00000003C00000003C00000001C0000
      00010000C00000003C00000003C00000001C000000010000C00000003C000000
      03C00000001C000000010000C00000003C00000003C00000001C000000010000
      E00000007E00000007C00000001C000000010000E00000005E00000005C00000
      001C000000010000A00000005A00000005C00000001C000000010000E0000000
      7E00000007C00000001C000000010000E00000007E00000007C00000001C0000
      00010000E00000007E00000007C00000001C000000010000E00000007E000000
      07C00000001C000000010000F0000000FF0000000FC00000001C000000010000
      F0000000FF0000000FC00000001C000000010000F0000000FF0000000FCFFFFF
      FF9CFFFFFFF90000FFFFFFFFFFFFFFFFFFC00000003C000000030000FFFFFFFF
      FFFFFFFFFFE00000003E000000030000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000FFFFFFFFFFFFFFFFFFFFFE01C1FFFFE01C1F0000FFFFFFFFFFFFFFFF
      FFFFC00001FFFC00001F0000FFFFFFFFFFFFFFFFFFFE000000FFE000000F0000
      FFFFFFFFFFFFFFFFFFFC0000007FC00000070000FFFFFFFFFFFFFFFFFFFE0000
      007FE00000070000FFFFFFE0FFFFFFFE0FE00000007E000000070000FFFFFFC0
      FFFFFFFC0FC00000007C000000070000FFFFFFC0FFFFFFFC0FC0000001FC0000
      001F0000FFFFFF00FFFFFFF00FC0000001FC0000001F0000FFFFFE00FFFFFFE0
      0FE0000000FE0000000F0000FFFFFE01FFFFFFE01FF0000000FF0000000F0000
      FFFFF801FFFFFF801FF8000000FF8000000F0000FFFFF003FFFFFF003FFE0000
      007FE00000070000FFFFE007FFFFFE007FFF0000007FF00000070000FFF9C00F
      FFFF9C00FFFF01FC007FF01FC0070000FFC0001FFFFC0001FFFF87F8003FF87F
      80030000FF80003FFFF80003FFFFCFF8003FFCFF80030000FF00007FFFF00007
      FFFFFCF0003FFFCF00030000FE0000FFFFE0000FFFFFE07003FFFE07003F0000
      FE0001FFFFE0001FFFFE00783FFFE00783FF0000FC2003FFFFC2003FFFF0007F
      CFFF0007FCFF0000FC3003FFFFC3003FFFF000FF87FF000FF87F0000FC3803FF
      FFC3803FFFF000FE07FF000FE07F0000FC3C03FFFFC3C03FFFF0007803FF0007
      803F0000FC3E03FFFFC3E03FFFF8000001FF8000001F0000FC1F03FFFFC1F03F
      FFF8000001FF8000001F0000FC0F07FFFFC0F07FFFF8000003FF8000003F0000
      FE0007FFFFE0007FFFFC000007FFC000007F0000FF000FFFFFF000FFFFFC0000
      0FFFC00000FF0000FF801FFFFFF801FFFFFC00001FFFC00001FF0000FFE07FFF
      FFFE07FFFFFE00007FFFE00007FF0000FFFFFFFFFFFFFFFFFFFE0C01FFFFE0C0
      1FFF0000FFFFFFFFFFFFFFFFFFFF1FFFFFFFF1FFFFFF0000FFFFFFFFFFFFFFFF
      FFFF1FFFFFFFF1FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFF800FFFFFF800FFFFFFFFF
      FFFFFFFFFFFF0000FF80000FFFF80000FFFFFFFFFFFFFFFFFFFF0000FF000007
      FFF000007FFFFFFFFFFFFFFFFFFF0000FF000007FFF000007FFFFFFFFFFFFFFF
      FFFF0000FE000003FFE000003F0000000000000000000000FC000001FFC00000
      1F0000000000000000000000F8300000FF8300000F3C3801FF83C3801FF80000
      F04000007F04000007380FFFFF8380FFFFF80000E18000007E18000007300600
      0003006000000000E30000003E300000032006000002006000000000C6000000
      3C600000032002000002002000000000C40000001C4000000120060000020060
      00000000C80000011C8000001130060000030060000000008800000098800000
      09380E00000380E0000000009000000099000000093E3FFFFF83E3FFFFF80000
      900000000900000000380E00000380E000000000800000000800000000300600
      0003006000000000808000004808000004200600000200600000000080E00000
      480E000004200200000200200000000080000000480000000420060000020060
      0000000080000000080000000030060000030060000000008000000018000000
      01380FFFFF8380FFFFF800008000000018000000013FFE000083FFE000080000
      C00000001C00000001380E00000380E000000000C00000401C00000401300600
      0003006000000000C00000303C000003032006000002006000000000E0000000
      3E000000032006000002006000000000F00000007F0000000720060000020060
      00000000F0000000FF0000000F2006000002006000000000F8000001FF800000
      1F300E00000300E000000000FC000003FFC000003F2C11FFFF82C11FFFF80000
      FE000007FFE000007F0000000000000000000000FF84020FFFF84020FF000000
      0000000000000000FFC0003FFFFC0003FF0000000010000000010000FFF801FF
      FFFF801FFFFFFFFFFFFFFFFFFFFF0000C00004083C00004083FFFFFFFFFFFFFF
      FFFF0000800000001800000001F9FFFFFFFF9FFFFFFF00008000000018000000
      01F007FFFFFF007FFFFF0000800040001800040001F0003FFFFF0003FFFF0000
      8FFF800018FFF80001F00001FFFF00001FFF00008FFF00C018FFF00C01F20000
      0FFF200000FF00008FFF00C018FFF00C01E3E000007E3E00000700008FFE00C0
      18FFE00C01E3FC00001E3FC0000100008FFE00C018FFE00C01E3FFC0001E3FFC
      000100008FFE00C008FFE00C00E3C7F8001E3C7F800100008FFE0FFE08FFE0FF
      E0E7C01F000E7C01F00000008FFE0FFE08FFE0FFE0E7C010401E7C0104010000
      8FFE00C008FFE00C00E7E020200E7E02020000008FFE00C008FFE00C00E7F1E0
      100E7F1E010000008FFE00C018FFE00C01E7F8C2181E7F8C218100008FFF00C0
      18FFF00C01C7F8431C1C7F8431C100008FFF00C018FFF00C01C7FC421E1C7FC4
      21E100008FFF800018FFF80001CFCC021F3CFCC021F300008FFFC00018FFFC00
      01CFC0021F3CFC0021F300008FFFE00118FFFE0011CFC0421F3CFC0421F30000
      0FFFF00310FFFF0031CFE0603F3CFE0603F300000FFFFE1F10FFFFE1F1C0FFE0
      3E7C0FFE03E700000FFFFFFF10FFFFFFF1C003F8FE7C003F8FE700000FFFFFFF
      10FFFFFFF1C0001FFE7C0001FFE700000FFFFFFF10FFFFFFF18000007EF80000
      07EF00000FFFFFFF10FFFFFFF180000000F80000000F00000FFFFFFF10FFFFFF
      F181000000F81000000F00000FFFFFFF10FFFFFFF180100000F80100000F0000
      0FFFFFFF10FFFFFFF180000001F80000001F0000000000001000000001800000
      01F80000001F000000000000100000000180000001F80000001F000000000000
      1000000001F8000001FF8000001F0000000000001000000001FFE00003FFFE00
      003F0000800000001800000001FFFF0003FFFFF0003F00008000000018000000
      01FFFFFE03FFFFFFE03F0000FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFFFFF7F0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFF3FF
      FFFFFF3FFFFFFFE3FFFFFFFE3FFF0000FFFFC3FFFFFFFC3FFFFFFFC1FFFFFFFC
      1FFF0000FFFF81FFFFFFF81FFFFFFF80FFFFFFF80FFF0000FFFE00FFFFFFE00F
      FFFFFE007FFFFFE007FF0000FFFC003FFFFFC003FFFFF8003FFFFF8003FF0000
      FFF0001FFFFF0001FFFFF0001FFFFF0001FF0000FFC0000FFFFC0000FFFFC000
      0FFFFC0000FF0000FF800007FFF800007FFF000003FFF000003F0000FE000003
      FFE000003FFC000001FFC000001F0000F8000001FF8000001FF8000000FF8000
      000F0000E0000000FE0000000FE00000007E000000070000C00000007C000000
      0780000000180000000100008000000038000000038000000008000000000000
      0000000810000000810000000000000000000000000000040000000040000000
      0000000000000000000000020000000020800000000800000000000000000200
      1000002001C00000001C000000010000800000087800000087C00000007C0000
      0007000080000100F80000100FE0000000FE0000000F000080000083F8000008
      3FE0000003FE0000003F00008000000FF8000000FFF000000FFF000000FF0000
      C000401FFC000401FFF800001FFF800001FF0000C000007FFC000007FFF80000
      7FFF800007FF0000C04001FFFC04001FFFFC0001FFFFC0001FFF0000C00003FF
      FC00003FFFFE0003FFFFE0003FFF0000E0200FFFFE0200FFFFFE000FFFFFE000
      FFFF0000E0603FFFFE0603FFFFFF003FFFFFF003FFFF0000E1F07FFFFE1F07FF
      FFFF00FFFFFFF00FFFFF0000E7FFFFFFFE7FFFFFFFFF83FFFFFFF83FFFFF0000
      FFFFFFFFFFFFFFFFFFFFCFFFFFFFFCFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000FFE001FFFFFE001FFFFFFFFFFFFFFFFFFFFF0000FF00003FFFF00003
      FFFFFFFFFFFFFFFFFFFF0000FC00001FFFC00001FFFFFFFFFFFFFFFFFFFF0000
      FC00000FFFC00000FFFFFFFFFFFFFFFFFFFF0000F800000FFF800000FFE3FFFF
      FFFE3FFFFFFF0000F800000FFF800000FFE000007FFE000007FF0000F800000F
      FF800000FFE000007FFE000007FF0000F800001FFF800001FF80000001F80000
      001F0000F800007FFF800007FF0000000070000000070000F800007FFF800007
      FF8000000078000000070000F800007FFF800007FF8000000038000000030000
      F800007FFF800007FFC00000003C000000030000F800007FFF800007FFC00000
      001C000000010000F800007FFF800007FFC00000001C000000010000F800007F
      FF800007FFC00000001C000000010000F800007FFF800007FFC00000003C0000
      00030000F000007FFF000007FFC00000003C000000030000F000007FFF000007
      FFC00000003C000000030000F000007FFF000007FFC00000003C000000030000
      F000003FFF000003FFE00000003E000000030000F200003FFF200003FFE00000
      003E000000030000F000003FFF000003FFF00000003F000000030000F200013F
      FF200013FFF80000003F800000030000F180013FFF180013FFFE00001FFFE000
      01FF0000F200003FFF200003FFFFF0000FFFFF0000FF0000F000003FFF000003
      FFFFF0000FFFFF0000FF0000F000003FFF000003FFFFF0000FFFFF0000FF0000
      F000003FFF000003FFFFF0000FFFFF0000FF0000F000003FFF000003FFFFF000
      0FFFFF0000FF0000F000003FFF000003FFFFF8000FFFFF8000FF0000F000003F
      FF000003FFFFF8000FFFFF8000FF0000F800007FFF800007FFFFF8000FFFFF80
      00FF0000FC0001FFFFC0001FFFFFFFFFFFFFFFFFFFFF0000FF8007FFFFF8007F
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFFFFE3FFFFFFFE3FFF0000FFFFFFFFFFFFFFFFFFFFFE01
      FFFFFFE01FFF0000FFFFFFFFFFFFFFFFFFFFF000FFFFFF000FFF0000FFFFFFFF
      FFFFFFFFFFFFC0007FFFFC0007FF0000800003FFF800003FFFFF80003FFFF800
      03FF0000C0000001FC0000001FFFC0001FFFFC0001FF0000C00000007C000000
      07FFF0000FFFFF0000FF0000E00000007E00000007FFF80007FFFF80007F0000
      F01800007F01800007FFF00007FFFF00007F0000F007FC007F007FC007FFF000
      0FFFFF0000FF0000F803FFFFFF803FFFFFFFF001FFFFFF001FFF0000FC01FFFF
      FFC01FFFFFFFF001FFFFFF001FFF0000FC00FFFFFFC00FFFFFFFF001FFFFFF00
      1FFF0000FE007FFFFFE007FFFFFFF001FFFFFF001FFF0000FF003FFFFFF003FF
      FFFFF001FFFFFF001FFF0000FFC00FFFFFFC00FFFFFFF001FFFFFF001FFF0000
      FFE007FFFFFE007FFFFFF000FFFFFF000FFF0000FFF003FFFFFF003FFFFFF000
      FFFFFF000FFF0000FFF801FFFFFF801FFFFFF000FFFFFF000FFF0000FFFC00FF
      FFFFC00FFFFFF000FFFFFF000FFF0000FFFE007FFFFFE007FFFFF000FFFFFF00
      0FFF0000FFFF001FFFFFF001FFFFF000FFFFFF000FFF0000FFFF800FFFFFF800
      FFFFF0007FFFFF0007FF0000FFFFE007FFFFFE007FFFC0007FFFFC0007FF0000
      FFFFF003FFFFFF003FFF00007FFFF00007FF0000FFFFF801FFFFFF801FFF0000
      3FFFF00003FF0000FFFFFC00FFFFFFC00FFF00003FFFF00003FF0000FFFFFE00
      3FFFFFE003FF00003FFFF00003FF0000FFFFFF001FFFFFF001FF80001FFFF800
      01FF0000FFFFFF801FFFFFF801FF80001FFFF80001FF0000FFFFFFC00FFFFFFC
      00FF80000FFFF80000FF0000FFFFFFE01FFFFFFE01FFC03C0FFFFC03C0FF0000
      FFFFFFF01FFFFFFF01FFC0000FFFFC0000FF0000FFFFFFF83FFFFFFF83FFE000
      0FFFFE0000FF0000FFFFFFFFFFFFFFFFFFFFE0001FFFFE0001FF0000FFFFFFFF
      FFFFFFFFFFFFF03FFFFFFF03FFFF0000FFFFFFFFFFFFFFFFFFFFFE07FFFFFFE0
      7FFF0000FFFFFFFFFFFFFFFFFFFFFC03FFFFFFC03FFF0000FFFFC7FFFFFFFC7F
      FFFFF800FFFFFF800FFF0000FFFF00FFFFFFF00FFFFFF0007FFFFF0007FF0000
      FF60001FFFF60001FFFFC0003FFFFC0003FF000080000003F80000003FFF8000
      1FFFF80001FF0000000000007000000007FF000007FFF000007F000000000000
      7000000007FC000003FFC000003F0000800000007800000007F8000001FF8000
      001F000080000001F80000001FF8000001FF8000001F0000E000205FFE000205
      FFF8000001FF8000001F0000FFFFE03FFFFFFE03FFF8400001FF8400001F0000
      8000E00FF8000E00FFFF80001FFFF80001FF000080000007F80000007FFF0000
      0FFFF00000FF000080000003F80000003FFE000007FFE000007F000080000001
      F80000001FFE000007FFE000007F0000800000007800000007FE000007FFE000
      007F0000800000003800000003FE000007FFE000007F00008000000018000000
      01FFF000FFFFFF000FFF0000800000003800000003FFF000FFFFFF000FFF0000
      800000007800000007FFF000FFFFFF000FFF000080000000F80000000FFFF000
      FFFFFF000FFF000080000001F80000001FFFF000FFFFFF000FFF000080000003
      F80000003FFFF000FFFFFF000FFF00008000000FF8000000FFFFF000FFFFFF00
      0FFF0000EFFFE01FFEFFFE01FFFFF000FFFFFF000FFF0000FFFFE03FFFFFFE03
      FFFFF000FFFFFF000FFF0000FFFFE07FFFFFFE07FFFFF000FFFFFF000FFF0000
      FFFFE0FFFFFFFE0FFFFFF000FFFFFF000FFF0000FFFFE1FFFFFFFE1FFFFFF000
      FFFFFF000FFF0000FFFFFFFFFFFFFFFFFFFFF000FFFFFF000FFF0000FFFFFFFF
      FFFFFFFFFFFFF001FFFFFF001FFF0000FFFFFFFFFFFFFFFFFFFFF001FFFFFF00
      1FFF0000FFFFFFFFFFFFFFFFFFFFF001FFFFFF001FFF0000FFFFFFFFFFFFFFFF
      FFFFF001FFFFFF001FFF0000FFFFFFFFFFFFFFFFFFFFF801FFFFFF801FFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFF000FFFFFF000FFFFFFFFF
      FFFFFFFFFFFF0000FFC0003FFFFC0003FFFFFE3FFFFFFFE3FFFF0000FFC0001F
      FFFC0001FFFFE01FFFFFFE01FFFF0000FFC0001FFFFC0001FFFF0000EFFFF000
      0EFF0000FFC0003FFFFC0003FFF80000001F800000010000FFC0003FFFFC0003
      FFE00000001E000000010000FFC0003FFFFC0003FFC00000001C000000010000
      FFC0003FFFFC0003FFC00000001C000000010000FFC0003FFFFC0003FFF80000
      003F800000030000FFC0007FFFFC0007FFFF404000FFF404000F0000FFC0007F
      FFFC0007FFFF807FFFFFF807FFFF0000FFE0007FFFFE0007FFFF007FFFFFF007
      FFFF0000FFF0007FFFFF0007FFFE0000003FE00000030000FE00000FFFE00000
      FFF80000001F800000010000FC000007FFC000007FF00000001F000000010000
      FC000007FFC000007FE00000001E000000010000FE00000FFFE00000FFC00000
      001C000000010000FF00001FFFF00001FF8000000038000000030000FFF000FF
      FFFF000FFF8000000038000000030000FE000087FFE000087FE00000003E0000
      00030000FE000007FFE000007FF00000001F000000010000FC000007FFC00000
      7FF80000001F800000010000FE000007FFE000007FFC0000003FC00000030000
      FE00000FFFE00000FFFE00000FFFE00000FF0000FF00000FFFF00000FFFF007F
      FFFFF007FFFF0000FF80001FFFF80001FFFFC07FFFFFFC07FFFF0000FFC0003F
      FFFC0003FFFFE07FFFFFFE07FFFF0000FFE0007FFFFE0007FFFFF07FFFFFFF07
      FFFF0000FFF000FFFFFF000FFFFFF87FFFFFFF87FFFF0000FFF801FFFFFF801F
      FFFFFFFFFFFFFFFFFFFF0000FFFC01FFFFFFC01FFFFFFFFFFFFFFFFFFFFF0000
      FFFC03FFFFFFC03FFFFFFFFFFFFFFFFFFFFF0000FFFE07FFFFFFE07FFFFFFFFF
      FFFFFFFFFFFF0000FFFF0FFFFFFFF0FFFFFFFFFFFFFFFFFFFFFF0000FFFF9FFF
      FFFFF9FFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
end
