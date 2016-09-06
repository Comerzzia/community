inherited FrmBuscarArticulo: TFrmBuscarArticulo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Buscar Art'#237'culos'
  ClientHeight = 614
  ClientWidth = 978
  Color = clWhite
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  KeyPreview = True
  Position = poScreenCenter
  Visible = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  ExplicitWidth = 984
  ExplicitHeight = 642
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox3: TRzGroupBox [0]
    AlignWithMargins = True
    Left = 10
    Top = 3
    Width = 958
    Height = 96
    Margins.Left = 10
    Margins.Right = 10
    Align = alTop
    FlatColor = 10382147
    TabOrder = 0
    Transparent = True
    object RzBitBtn1: TRzBitBtn
      AlignWithMargins = True
      Left = 7572
      Top = 20
      Width = 52
      Height = 42
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 0
      FrameColor = 7617536
      Align = alCustom
      Color = clNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      ImageIndex = 2
    end
    object RzBitBtn2: TRzBitBtn
      AlignWithMargins = True
      Left = 7566
      Top = 78
      Width = 52
      Height = 42
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 0
      FrameColor = 7617536
      Align = alCustom
      Color = clNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      ImageIndex = 2
    end
    object RzPanel18: TRzPanel
      AlignWithMargins = True
      Left = 4
      Top = 17
      Width = 794
      Height = 75
      Align = alClient
      BorderOuter = fsNone
      BorderSides = []
      TabOrder = 2
      Transparent = True
      VisualStyle = vsClassic
      object Label5: TLabel
        Left = 3
        Top = 3
        Width = 70
        Height = 24
        Caption = 'Art'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12670976
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 3
        Top = 37
        Width = 111
        Height = 24
        Caption = 'Descripci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12670976
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 283
        Top = 3
        Width = 135
        Height = 24
        Caption = 'C'#243'digo Barras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12670976
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object EditBuscarArticulo: TRzEdit
        Left = 120
        Top = 1
        Width = 150
        Height = 26
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12670976
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        FocusColor = 8454143
        FrameColor = 10382147
        FrameVisible = True
        ParentFont = False
        TabOrder = 0
        OnClick = EditBuscarArticuloClick
        OnEnter = EditBuscarArticuloEnter
      end
      object EditBuscarArticuloDescripcion: TRzEdit
        Left = 120
        Top = 33
        Width = 537
        Height = 26
        Color = clWhite
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
        OnClick = EditBuscarArticuloClick
        OnEnter = EditBuscarArticuloEnter
      end
      object EditBuscarCodigoBarras: TRzEdit
        Left = 424
        Top = 1
        Width = 233
        Height = 26
        Color = clWhite
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
        OnClick = EditBuscarArticuloClick
        OnEnter = EditBuscarArticuloEnter
      end
    end
    object RzPanel19: TRzPanel
      AlignWithMargins = True
      Left = 804
      Top = 14
      Width = 150
      Height = 76
      Margins.Top = 0
      Margins.Bottom = 5
      Align = alRight
      BorderOuter = fsNone
      BorderSides = []
      TabOrder = 3
      Transparent = True
      VisualStyle = vsClassic
      object BtnBuscaArticulo: TRzBitBtn
        AlignWithMargins = True
        Left = 0
        Top = 10
        Width = 129
        Height = 44
        Margins.Top = 0
        Margins.Right = 8
        Margins.Bottom = 0
        FrameColor = 10382147
        Caption = 'Buscar...'
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
        OnClick = BtnBuscaArticuloClick
        DisabledIndex = 5
        ImageIndex = 4
        Images = ImagenesBuscarArticulo
      end
    end
  end
  object RzGroupBox5: TRzGroupBox [1]
    AlignWithMargins = True
    Left = 10
    Top = 105
    Width = 958
    Height = 259
    Margins.Left = 10
    Margins.Right = 10
    Align = alTop
    BorderWidth = 1
    FlatColor = 10382147
    TabOrder = 1
    Transparent = True
    object RzPanel23: TRzPanel
      Left = 2
      Top = 14
      Width = 954
      Height = 243
      Align = alClient
      AutoSize = True
      BorderSides = []
      TabOrder = 0
      Transparent = True
      object GridBuscarArticulo: TDBGridEh
        AlignWithMargins = True
        Left = 5
        Top = 0
        Width = 883
        Height = 238
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        Color = clWhite
        DataSource = S_BUSCARARTICULO
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
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = GridBuscarArticuloDblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CODART'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12670976
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'ARTICULO'
            Title.Color = 16249582
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 12670976
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'DESART'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12670976
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'DESCRIPCION'
            Title.Color = 16249582
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 12670976
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 389
          end
          item
            EditButtons = <>
            FieldName = 'DESGLOSE1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12670976
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'TALLA'
            Title.Color = 16249582
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 12670976
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'DESGLOSE2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12670976
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'COLOR'
            Title.Color = 16249582
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 12670976
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'CODIGO_BARRAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12670976
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'COD. BARRAS'
            Title.Color = 16249582
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = 12670976
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Width = 100
          end>
      end
      object RzPanel24: TRzPanel
        AlignWithMargins = True
        Left = 896
        Top = 3
        Width = 50
        Height = 237
        Margins.Right = 8
        Align = alRight
        AutoSize = True
        BorderSides = []
        TabOrder = 1
        Transparent = True
        object BtnBuscarArticuloPrimero: TRzToolButton
          Left = 0
          Top = -1
          Width = 50
          Height = 45
          Margins.Top = 0
          Margins.Bottom = 0
          DisabledIndex = 7
          SelectionFrameColor = 7617536
          ImageIndex = 6
          Images = ImagenesBuscarArticulo
          Color = clNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = BtnBuscarArticuloPrimeroClick
        end
        object BtnBuscarArticuloAnterior: TRzToolButton
          Left = 0
          Top = 45
          Width = 50
          Height = 45
          DisabledIndex = 9
          SelectionFrameColor = 7617536
          ImageIndex = 8
          Images = ImagenesBuscarArticulo
          Color = clNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = BtnBuscarArticuloAnteriorClick
        end
        object BtnBuscarArticuloSiguiente: TRzToolButton
          Left = 0
          Top = 96
          Width = 50
          Height = 45
          DisabledIndex = 11
          SelectionFrameColor = 7617536
          ImageIndex = 10
          Images = ImagenesBuscarArticulo
          Color = clNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = BtnBuscarArticuloSiguienteClick
        end
        object BtnBuscarArticuloUltimo: TRzToolButton
          Left = 0
          Top = 147
          Width = 50
          Height = 45
          DisabledIndex = 13
          SelectionFrameColor = 7617536
          ImageIndex = 12
          Images = ImagenesBuscarArticulo
          Color = clNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = BtnBuscarArticuloUltimoClick
        end
        object Shape1: TShape
          Left = 0
          Top = 45
          Width = 49
          Height = 1
          Brush.Color = clMaroon
          Pen.Color = 10382147
        end
        object Shape2: TShape
          Left = 0
          Top = 91
          Width = 49
          Height = 1
          Brush.Color = clMaroon
          Pen.Color = 10382147
        end
        object Shape3: TShape
          Left = 0
          Top = 142
          Width = 49
          Height = 1
          Brush.Color = clMaroon
          Pen.Color = 10382147
        end
      end
    end
  end
  object AdvTouchKeyboard1: TAdvTouchKeyboard [2]
    AlignWithMargins = True
    Left = 15
    Top = 409
    Width = 960
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
    object BtnCancelarBuscarArticulo: TRzBitBtn
      AlignWithMargins = True
      Left = 817
      Top = 156
      Width = 114
      Height = 44
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 0
      FrameColor = 10382147
      ModalResult = 2
      Caption = 'Cancelar'
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
      DisabledIndex = 3
      ImageIndex = 2
      Images = ImagenesBuscarArticulo
    end
    object BtnAceptarBuscarArticulo: TRzBitBtn
      AlignWithMargins = True
      Left = 695
      Top = 156
      Width = 114
      Height = 44
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 0
      FrameColor = 10382147
      Caption = 'Aceptar'
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
      TabOrder = 1
      OnClick = BtnAceptarBuscarArticulosClick
      DisabledIndex = 1
      ImageIndex = 0
      Images = ImagenesBuscarArticulo
    end
  end
  object ImagenesBuscarArticulo: TImageList
    Height = 36
    Width = 36
    Left = 665
    Top = 40
    Bitmap = {
      494C01010E001300080024002400FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000900000009000000001002000000000000044
      0100000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F9FB
      F800EAF1EA00CFE1D100ADCBB10077AA7D000C92340010BA460026D166000ACB
      610067B07A00A1BFA200C1D9C500DFEBE000F2F7F300FCFDFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F9F9F900ECECEC00D5D5D500B8B8B8008A8A
      8A00464646005A5A5A00747474006767670085858500ABABAB00CACACA00E3E3
      E300F4F4F400FCFCFC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F6F9F600E5EE
      E600C9DDCC00A8C9AD0089B28D0021933F0009B5460007B02B0012B6360024DC
      750016D36E007EB187009FC1A200BDD7C100DBE9DD00F0F5F000FBFCFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00F7F7F700E8E8E800D0D0D000B4B4B400989898005151
      5100565656004B4B4B00545454007C7C7C007272720092929200ABABAB00C7C7
      C700E0E0E000F1F1F100FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFDFC00F3F7F300E0EBE100C3DA
      C700A3C6A8008DB6920036994D0004AD40000CB7370005B2300003B72F001EC3
      49001EE87E0026D4760088AF8B009DC1A200BBD5BF00D7E6D900EDF3ED00F9FA
      F900FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00F4F4F400E4E4E400CCCCCC00B0B0B0009C9C9C005E5E5E005050
      5000535353004D4D4D004D4D4D0063636300818181007A7A7A0096969600AAAA
      AA00C5C5C500DCDCDC00EFEFEF00F9F9F900FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FAFCFA00EFF5EF00DAE8DC00BED7C2009FC4
      A50091B6940050A6630002BD48000DBA3E0005B7330007BF3B0009C53F0004BE
      33002AD05E0015F4850040CE7E0091B190009DC2A300B8D3BC00D4E4D600E9F1
      EA00F7FAF700FDFEFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FAFA
      FA00F1F1F100DFDFDF00C7C7C700ADADAD009E9E9E0073737300575757005757
      57004F4F4F005555550059595900515151007272720084848400848484009B9B
      9B00ABABAB00C2C2C200DADADA00ECECEC00F8F8F800FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FAFBFA00EFF5EF00DAE8DC00C0D8C300A4C7A90098BD
      9C006BA8750007A53D000CC54A0006B9350007C6410008CA42000ACF450009D1
      470007C53A0033DC710010F685005CC383009CB99B00A2C6A800BBD5BF00D4E5
      D700EAF2EB00F7F9F700FDFEFD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FAFAFA00F1F1
      F100DFDFDF00C9C9C900B1B1B100A5A5A500828282004D4D4D005E5E5E005151
      51005A5A5A005C5C5C005F5F5F00606060005757570080808000838383008B8B
      8B00A5A5A500B0B0B000C5C5C500DADADA00EDEDED00F7F7F700FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00F7FAF700E9F1EA00D4E4D700BFD7C200B3CEB6009AC1
      9E0014B34A0007BE470006BB380007CB440008D1490009D74E000AD951000ADA
      520008D950000CC83F0036EB84000EE3760089C29800B5CCB600BBD6BF00D0E2
      D200E4EEE500F4F7F400FCFDFC00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F8F8F800ECEC
      EC00DADADA00C8C8C800BDBDBD00A8A8A8005B5B5B0059595900535353005C5C
      5C0060606000646464006666660067676700656565005B5B5B008C8C8C007777
      7700A1A1A100BDBDBD00C5C5C500D6D6D600E7E7E700F5F5F500FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FCFDFC00F9FBF900F7FAF700000000006EB9800000B3
      3E0006B2370006C5430008D7560009DC5D0008DF5E0009E467000AE76D000AE8
      6E000AE76C000AE76C0004DE5A0022D2580022D9740046DE8C00FDF9FA00F8F8
      F700F7FAF700FBFCFB00FEFEFE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FCFCFC00F9F9
      F900F8F8F800000000008D8D8D00505050004F4F4F005A5A5A00676767006B6B
      6B006C6C6C007171710074747400757575007474740074747400696969006E6E
      6E007A7A7A0090909000FAFAFA00F7F7F700F8F8F800FBFBFB00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A2C7A80000972C0005AF
      380004B0340006C1400007D2500008D95A0007DD5C0008E2640009E76E000BEA
      72000AE96E0009E66A0009E5690002D44D002DD3630011E1730077F5B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B0B0B000414141004E4E4E004D4D4D0057575700636363006969
      69006A6A6A006F6F6F0074747400777777007575750073737300727272006161
      61007676760077777700B6B6B600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBDACB00097F260001AF380004AC
      340004AE360004B3370006C5430007D04D0007D6540007DC5A0008E465000AE8
      6E000AE86D0008E3640007DC5C0007D7550003C23D0035D670000CF17E00A0F0
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0D0D0003A3A3A004D4D4D004C4C4C004D4D4D004F4F4F005A5A5A006161
      610065656500696969007070700075757500757575006F6F6F006A6A6A006666
      6600565656007E7E7E007E7E7E00C7C7C7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEF1ED00227A3200009D2B0003A42F0004AD
      370004A8330003A6300005B5390006C3420007CE490006D44E0007DC570009E3
      620009E3640008DE5C0006D24B0007CB440004C4430007AE320036E480000FDF
      7100CDEFDB000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEEE
      EE004444440042424200474747004D4D4D004A4A4A0048484800515151005959
      59005F5F5F0062626200686868006F6F6F00707070006B6B6B00616161005C5C
      5C00595959004D4D4D008888880075757500DDDDDD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000093BC9900008D200006A2300006A3330007AA
      380006A7340003A02E0003A6300005B7380007C6410006CC410006D3470007D8
      4E0009DC550008D84F0006C83D0008C03D0009BE430005B43C0015AE3E0027DF
      790079E1A7000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A2A2
      A2003939390048484800494949004D4D4D004B4B4B0045454500484848005151
      51005A5A5A005B5B5B0060606000646464006868680065656500595959005757
      57005858580051515100555555007F7F7F00ABABAB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000053B66B00008B0F0000911E0000952000009C
      2400019C2600039D2B00039C2A0004AA300005BC3A0006C43B0006CA3B0006CC
      3B0008D1430008D0440005BF370000AB290000A7280000AC2E00009D1F0004A0
      2B008FEDB8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007C7C
      7C00333333003A3A3A003C3C3C00404040004141410043434300434343004A4A
      4A00535353005757570059595900595959005E5E5E005E5E5E00535353004646
      460045454500484848003E3E3E0045454500BCBCBC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A2D4AD0088C694008DCA9A008DCB9A0091CE
      9E0062BA7600009321000296260003A12B0004B0310006BB360006C0360005C0
      330007C3380005C2390004B62E0072C5840091CE9E008ED39E008ED39E0084C6
      9000C4E7CD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B6B6
      B600A0A0A000A5A5A500A6A6A600A9A9A900868686003C3C3C003F3F3F004545
      45004C4C4C0052525200545454005252520056565600555555004D4D4D009393
      9300A9A9A900AAAAAA00AAAAAA009E9E9E00D2D2D20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFDFC500008B1800018F2100039A260004A52B0005B02F0006B6300005B4
      2E0006B7310002B12C0007B42D00DBF4E1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCB00363636003B3B3B004141
      4100464646004C4C4C004E4E4E004D4D4D004F4F4F004A4A4A004D4D4D00E5E5
      E500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C5E2CA000086160000891D0003932200039C250005A6290006AA2A0005A9
      280005AA290001A4240009B02D00DDF5E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0D0D00034343400373737003D3D
      3D004141410046464600484848004747470048484800434343004C4C4C00E7E7
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCE5D0000081140000831A00038D1E0003932000049D2400059D2300059E
      2300059F240001991E000CAD2D00E3F8E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5D5D50031313100343434003A3A
      3A003C3C3C00414141004141410042424200424242003D3D3D004C4C4C00ECEC
      EC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0E6D400017E1600007F160002861B00038D1D000495200004941F000494
      1F0004951F0000911A000EA92E00E7FAED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8D8D80031313100313131003636
      3600393939003D3D3D003D3D3D003D3D3D003D3D3D00393939004C4C4C00EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D4E7D7000F7F21000D8522000081170003891A00038F1D00048D1C00048F
      1D00048D1C00008B170012A73000EBFDF1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DBDBDB003A3A3A003C3C3C003232
      3200373737003A3A3A00393939003A3A3A0039393900363636004D4D4D00F3F3
      F300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DAEBDD00187F2800268E3800138B280000871800028B1A00048B1B00048D
      1C00048B1B000088150016A63300F0FEF5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0E0E0003F3F3F004E4E4E004242
      42003535350037373700383838003939390038383800343434004F4F4F00F6F6
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0EEE2002384320033924300339A4500209B3800048E1E00008E19000391
      1D0004921E00008C160019A73600F3FFF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E5E50048484800585858005B5B
      5B00515151003A3A3A00373737003B3B3B003C3C3C003636360052525200F8F8
      F800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      2800000090000000900000000100010000000000400B00000000000000000000
      000000000000000000000000FFFFFF00FFFE07FFFFFFE07FFF00000000000000
      00000000FFFC03FFFFFFC03FFF0000000000000000000000FFF800FFFFFF800F
      FF0000000000000000000000FFF0007FFFFF0007FF0000000000000000000000
      FFC0003FFFFC0003FF0000000000000000000000FF80001FFFF80001FF000000
      0000000000000000FF000007FFF000007F0000000000000000000000FC000003
      FFC000003F0000000000000000000000F8000001FF8000001F00000000000000
      00000000F8000001FF8000001F0000000000000000000000F8000001FF800000
      1F0000000000000000000000F8400001FF8400001F0000000000000000000000
      FF80001FFFF80001FF0000000000000000000000FF00000FFFF00000FF000000
      0000000000000000FE000007FFE000007F0000000000000000000000FE000007
      FFE000007F0000000000000000000000FE000007FFE000007F00000000000000
      00000000FE000007FFE000007F0000000000000000000000FFF000FFFFFF000F
      FF0000000000000000000000FFF000FFFFFF000FFF0000000000000000000000
      FFF000FFFFFF000FFF0000000000000000000000FFF000FFFFFF000FFF000000
      0000000000000000FFF000FFFFFF000FFF0000000000000000000000FFF000FF
      FFFF000FFF0000000000000000000000FFF000FFFFFF000FFF00000000000000
      00000000FFF000FFFFFF000FFF0000000000000000000000FFF000FFFFFF000F
      FF0000000000000000000000FFF000FFFFFF000FFF0000000000000000000000
      FFF000FFFFFF000FFF0000000000000000000000FFF000FFFFFF000FFF000000
      0000000000000000FFF000FFFFFF000FFF0000000000000000000000FFF001FF
      FFFF001FFF0000000000000000000000FFF001FFFFFF001FFF00000000000000
      00000000FFF001FFFFFF001FFF0000000000000000000000FFF001FFFFFF001F
      FF0000000000000000000000FFF801FFFFFF801FFF0000000000000000000000
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
  object S_BUSCARARTICULO: TDataSource
    OnDataChange = S_BUSCARARTICULODataChange
    Left = 64
    Top = 184
  end
end
