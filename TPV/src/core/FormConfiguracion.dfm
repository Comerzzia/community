inherited FrmConfiguracion: TFrmConfiguracion
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Datos de configuraci'#243'n del TPV'
  ClientHeight = 671
  ClientWidth = 973
  Color = clWhite
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  KeyPreview = True
  Position = poMainFormCenter
  Visible = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  ExplicitWidth = 979
  ExplicitHeight = 699
  PixelsPerInch = 96
  TextHeight = 13
  object Paginas: TRzPageControl [0]
    AlignWithMargins = True
    Left = 147
    Top = 10
    Width = 816
    Height = 443
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    ActivePage = TabGeneral
    ActivePageDefault = TabGeneral
    Align = alClient
    Color = clWhite
    UseColoredTabs = True
    FlatColor = 10382147
    ParentColor = False
    TabColors.HighlightBar = 1350640
    TabIndex = 0
    TabOrder = 0
    TabStyle = tsRoundCorners
    Transparent = True
    FixedDimension = 19
    object TabGeneral: TRzTabSheet
      Color = clWhite
      ImageIndex = 3
      Caption = 'Generales'
      object RzGroupBox1: TRzGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 3
        Width = 792
        Height = 404
        Margins.Left = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        FlatColor = clWhite
        TabOrder = 0
        Transparent = True
        object EditCP: TRzNumericEdit
          Left = 676
          Top = 179
          Width = 66
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
          OnClick = EditDescripcionClick
          IntegersOnly = False
          DisplayFormat = '0;(0)'
        end
        object RzPanel1: TRzPanel
          Left = 1
          Top = 14
          Width = 790
          Height = 94
          Align = alTop
          BorderOuter = fsNone
          TabOrder = 1
          Transparent = True
          object Label28: TLabel
            Left = 13
            Top = 17
            Width = 62
            Height = 24
            Caption = 'Tienda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12670976
            Font.Height = -21
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label1: TLabel
            Left = 13
            Top = 64
            Width = 162
            Height = 24
            Caption = 'Caja Configurada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12670976
            Font.Height = -21
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object EditListaTiendas: TRzComboBox
            Left = 96
            Top = 18
            Width = 513
            Height = 26
            AllowEdit = False
            Style = csDropDownList
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12670976
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = []
            FlatButtonColor = 10382147
            FlatButtons = True
            FrameColor = 10382147
            ParentFont = False
            TabOrder = 0
            OnSelect = EditListaTiendasSelect
          end
        end
        object PanelCaja: TRzPanel
          Left = 1
          Top = 108
          Width = 790
          Height = 254
          Align = alClient
          BorderOuter = fsNone
          TabOrder = 2
          Transparent = True
        end
        object RzPanel2: TRzPanel
          Left = 1
          Top = 362
          Width = 790
          Height = 41
          Align = alBottom
          BorderOuter = fsNone
          TabOrder = 3
          Transparent = True
          object RzLabel1: TRzLabel
            Left = 13
            Top = 6
            Width = 172
            Height = 13
            Caption = 'Caja Configurada Actualmente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object RzLabel2: TRzLabel
            Left = 13
            Top = 25
            Width = 122
            Height = 13
            Caption = 'Caja Asignada a otro TPV'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsStrikeOut]
            ParentFont = False
            Transparent = True
          end
          object RzLabel3: TRzLabel
            Left = 213
            Top = 6
            Width = 174
            Height = 13
            Caption = 'Caja que se va a asignar al TPV'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
        end
      end
    end
    object TabVisor: TRzTabSheet
      Color = clWhite
      ImageIndex = 4
      Caption = 'Visor'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RzGroupBox2: TRzGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 3
        Width = 782
        Height = 401
        Margins.Left = 10
        Margins.Right = 10
        Align = alClient
        FlatColor = clWhite
        TabOrder = 0
        Transparent = True
        object Label4: TLabel
          Left = 13
          Top = 24
          Width = 122
          Height = 24
          Caption = 'Tipo de Visor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label5: TLabel
          Left = 13
          Top = 59
          Width = 193
          Height = 24
          Caption = 'M'#233'todo de Conexi'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object EditVisorTipo: TRzMRUComboBox
          Left = 224
          Top = 22
          Width = 513
          Height = 26
          RemoveItemCaption = '&Remove item from history list'
          Style = csDropDownList
          Color = clWhite
          FlatButtonColor = 10382147
          FlatButtons = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = 10382147
          Items.Strings = (
            'NO USA VISOR')
          ParentFont = False
          TabOrder = 0
          OnSelect = EditVisorTipoSelect
        end
        object EditVisorTipoConexion: TRzMRUComboBox
          Left = 224
          Top = 57
          Width = 513
          Height = 26
          RemoveItemCaption = '&Remove item from history list'
          Style = csDropDownList
          Color = clWhite
          FlatButtonColor = 10382147
          FlatButtons = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = 10382147
          Items.Strings = (
            '')
          ParentFont = False
          TabOrder = 1
          OnSelect = EditVisorTipoConexionSelect
        end
        object MemoVisorDetalle: TMemo
          Left = 13
          Top = 96
          Width = 724
          Height = 193
          Font.Charset = ANSI_CHARSET
          Font.Color = 12670976
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 2
        end
      end
    end
    object TabCajon: TRzTabSheet
      Color = clWhite
      ImageIndex = 5
      Caption = 'Caj'#243'n'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RzGroupBox3: TRzGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 3
        Width = 782
        Height = 401
        Margins.Left = 10
        Margins.Right = 10
        Align = alClient
        FlatColor = clWhite
        TabOrder = 0
        Transparent = True
        object Label3: TLabel
          Left = 13
          Top = 24
          Width = 128
          Height = 24
          Caption = 'Tipo de Caj'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label6: TLabel
          Left = 13
          Top = 59
          Width = 193
          Height = 24
          Caption = 'M'#233'todo de Conexi'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object EditCajonTipo: TRzMRUComboBox
          Left = 224
          Top = 22
          Width = 513
          Height = 26
          RemoveItemCaption = '&Remove item from history list'
          Style = csDropDownList
          Color = clWhite
          FlatButtonColor = 10382147
          FlatButtons = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = 10382147
          Items.Strings = (
            'NO USA CAJON')
          ParentFont = False
          ReadOnlyColor = clWhite
          TabOrder = 0
          OnSelect = EditVisorTipoSelect
        end
        object EditCajonTipoConexion: TRzMRUComboBox
          Left = 224
          Top = 57
          Width = 513
          Height = 26
          RemoveItemCaption = '&Remove item from history list'
          Style = csDropDownList
          Color = clWhite
          FlatButtonColor = 10382147
          FlatButtons = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = 10382147
          ParentFont = False
          ReadOnlyColor = clWhite
          TabOrder = 1
          OnSelect = EditVisorTipoConexionSelect
        end
        object MemoCajonDetalle: TMemo
          Left = 13
          Top = 96
          Width = 724
          Height = 194
          Font.Charset = ANSI_CHARSET
          Font.Color = 12670976
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ScrollBars = ssBoth
          ShowHint = False
          TabOrder = 2
        end
      end
    end
    object TabImpresora: TRzTabSheet
      Color = clWhite
      ImageIndex = 2
      Caption = 'Impresora'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RzGroupBox4: TRzGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 3
        Width = 782
        Height = 401
        Margins.Left = 10
        Margins.Right = 10
        Align = alClient
        FlatColor = clWhite
        TabOrder = 0
        Transparent = True
        object Label7: TLabel
          Left = 13
          Top = 24
          Width = 168
          Height = 24
          Caption = 'Tipo de Impresora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label8: TLabel
          Left = 13
          Top = 59
          Width = 193
          Height = 24
          Caption = 'M'#233'todo de Conexi'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object EditImpresoraTipo: TRzMRUComboBox
          Left = 224
          Top = 22
          Width = 513
          Height = 26
          RemoveItemCaption = '&Remove item from history list'
          Style = csDropDownList
          FlatButtonColor = 10382147
          FlatButtons = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = 10382147
          Items.Strings = (
            'NO USA IMPRESORA')
          ParentFont = False
          TabOrder = 0
          OnSelect = EditVisorTipoSelect
        end
        object EditImpresoraTipoConexion: TRzMRUComboBox
          Left = 224
          Top = 57
          Width = 513
          Height = 26
          RemoveItemCaption = '&Remove item from history list'
          Style = csDropDownList
          FlatButtonColor = 10382147
          FlatButtons = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = 10382147
          ParentFont = False
          TabOrder = 1
          OnSelect = EditVisorTipoConexionSelect
        end
        object MemoImpresoraDetalle: TMemo
          Left = 13
          Top = 96
          Width = 724
          Height = 194
          Font.Charset = ANSI_CHARSET
          Font.Color = 12670976
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 2
        end
      end
    end
    object TabTarjeta: TRzTabSheet
      Color = clWhite
      Caption = 'Tarjetas'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RzGroupBox6: TRzGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 3
        Width = 782
        Height = 401
        Margins.Left = 10
        Margins.Right = 10
        Align = alClient
        FlatColor = clWhite
        TabOrder = 0
        Transparent = True
        object Label9: TLabel
          Left = 13
          Top = 24
          Width = 137
          Height = 24
          Caption = 'Tipo de Tarjeta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label10: TLabel
          Left = 13
          Top = 59
          Width = 193
          Height = 24
          Caption = 'M'#233'todo de Conexi'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object EditTarjetaTipo: TRzMRUComboBox
          Left = 224
          Top = 22
          Width = 513
          Height = 26
          RemoveItemCaption = '&Remove item from history list'
          Style = csDropDownList
          FlatButtonColor = 10382147
          FlatButtons = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = 10382147
          Items.Strings = (
            'NO USA LECTOR TARJETAS')
          ParentFont = False
          TabOrder = 0
          OnSelect = EditVisorTipoSelect
        end
        object EditTarjetaTipoConexion: TRzMRUComboBox
          Left = 224
          Top = 54
          Width = 513
          Height = 26
          RemoveItemCaption = '&Remove item from history list'
          Style = csDropDownList
          FlatButtonColor = 10382147
          FlatButtons = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12670976
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = 10382147
          ParentFont = False
          TabOrder = 1
          OnSelect = EditVisorTipoConexionSelect
        end
        object MemoTarjetaDetalle: TMemo
          Left = 13
          Top = 96
          Width = 724
          Height = 194
          Font.Charset = ANSI_CHARSET
          Font.Color = 12670976
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 2
        end
        object BtnEditarConfigTarjeta: TRzBitBtn
          AlignWithMargins = True
          Left = 13
          Top = 303
          Width = 164
          Height = 44
          Margins.Top = 0
          Margins.Right = 8
          Margins.Bottom = 0
          FrameColor = 10382147
          Caption = 'Editar configuraci'#243'n'
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
          TabOrder = 3
          OnClick = BtnEditarConfigTarjetaClick
          DisabledIndex = 1
          ImageIndex = 4
          Images = ImagenesConfiguracion
        end
      end
    end
  end
  object AdvTouchKeyboard1: TAdvTouchKeyboard [1]
    AlignWithMargins = True
    Left = 15
    Top = 466
    Width = 955
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
    object BtnAceptar: TRzBitBtn
      AlignWithMargins = True
      Left = 665
      Top = 151
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
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnClick = BtnAceptarClick
      DisabledIndex = 1
      ImageIndex = 0
      Images = ImagenesConfiguracion
    end
    object BtnCancelar: TRzBitBtn
      AlignWithMargins = True
      Left = 790
      Top = 151
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
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      DisabledIndex = 3
      ImageIndex = 2
      Images = ImagenesConfiguracion
    end
  end
  object RzGroupBox5: TRzGroupBox [2]
    AlignWithMargins = True
    Left = 10
    Top = 3
    Width = 124
    Height = 450
    Margins.Left = 10
    Margins.Bottom = 10
    Align = alLeft
    Color = clWhite
    Ctl3D = True
    FlatColor = 10382147
    ParentCtl3D = False
    TabOrder = 2
    Transparent = True
    object Label31: TLabel
      Left = 227
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
    object BtnGenerales: TRzToolButton
      Left = 5
      Top = 13
      Width = 116
      Height = 60
      Cursor = crHandPoint
      DisabledIndex = 5
      SelectionFrameColor = 7617536
      GroupIndex = 1
      ImageIndex = 4
      Images = ImagenesConfiguracion
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alCustom
      Caption = 'Generales'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 12670976
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = BtnGeneralesClick
    end
    object BtnVisor: TRzToolButton
      Left = 5
      Top = 79
      Width = 116
      Height = 60
      Cursor = crHandPoint
      DisabledIndex = 7
      SelectionFrameColor = 7617536
      GroupIndex = 1
      ImageIndex = 6
      Images = ImagenesConfiguracion
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alCustom
      Caption = 'Visor       '
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 12670976
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = BtnGeneralesClick
    end
    object BtnCajon: TRzToolButton
      Left = 5
      Top = 145
      Width = 116
      Height = 60
      Cursor = crHandPoint
      DisabledIndex = 9
      SelectionFrameColor = 7617536
      GroupIndex = 1
      ImageIndex = 8
      Images = ImagenesConfiguracion
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alCustom
      Caption = 'Caj'#243'n       '
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 12670976
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = BtnGeneralesClick
    end
    object BtnImpresora: TRzToolButton
      Left = 5
      Top = 211
      Width = 116
      Height = 60
      Cursor = crHandPoint
      DisabledIndex = 11
      SelectionFrameColor = 7617536
      GroupIndex = 1
      ImageIndex = 10
      Images = ImagenesConfiguracion
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alCustom
      Caption = 'Impresora'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 12670976
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = BtnGeneralesClick
    end
    object Shape1: TShape
      Left = 1
      Top = 74
      Width = 123
      Height = 1
      Brush.Color = clMaroon
      Pen.Color = 10382147
    end
    object Shape2: TShape
      Left = 1
      Top = 140
      Width = 123
      Height = 1
      Brush.Color = clMaroon
      Pen.Color = 10382147
    end
    object Shape3: TShape
      Left = 1
      Top = 206
      Width = 123
      Height = 1
      Brush.Color = clMaroon
      Pen.Color = 10382147
    end
    object Shape4: TShape
      Left = 1
      Top = 272
      Width = 123
      Height = 1
      Brush.Color = clMaroon
      Pen.Color = 10382147
    end
    object BtnTarjeta: TRzToolButton
      Left = 4
      Top = 277
      Width = 117
      Height = 60
      Cursor = crHandPoint
      DisabledIndex = 13
      SelectionFrameColor = 7617536
      GroupIndex = 1
      ImageIndex = 12
      Images = ImagenesConfiguracion
      ShowCaption = True
      UseToolbarShowCaption = False
      Align = alCustom
      BiDiMode = bdRightToLeft
      Caption = ' Tarjetas'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 12670976
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnClick = BtnGeneralesClick
    end
  end
  inherited RzRegIniFile1: TRzRegIniFile
    Left = 0
  end
  object ImagenesConfiguracion: TImageList
    Height = 36
    Width = 36
    Left = 473
    Top = 16
    Bitmap = {
      494C010110001300080024002400FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000090000000B400000001002000000000000095
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00F7F7F700F0F0F000E7E7E700DDDDDD00D8D8D800D9D9D900DFDFDF00E7E7
      E700F0F0F000F8F8F800FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFD00F7F7F700F0F0F000E7E7E700DDDD
      DD00D8D8D800D9D9D900DFDFDF00E7E7E700F0F0F000F8F8F800FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00F2F2F200E5E5
      E500D7D7D700C0C0C000B6B6B600C1C1C100D1D1D100CFCFCF00C5C5C500C3C3
      C300C7C7C700D0D0D000E0E0E000F4F4F400FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00F2F2F200E5E5E500D7D7D700C0C0C000B6B6B600C1C1
      C100D1D1D100CFCFCF00C5C5C500C3C3C300C7C7C700D0D0D000E0E0E000F4F4
      F400FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00DFDFDF00C0C0C000BDBD
      BD00B7B7B700B8B8B800BDBDBD00D1D1D100F3F3F300EAEAEA00C9C9C900BFBF
      BF00C2C2C200C7C7C700CACACA00CFCFCF00E8E8E800FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00DFDFDF00C0C0C000BDBDBD00B7B7B700B8B8B800BDBDBD00D1D1
      D100F3F3F300EAEAEA00C9C9C900BFBFBF00C2C2C200C7C7C700CACACA00CFCF
      CF00E8E8E800FCFCFC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFDFDF00BFBFBF00C8C8C800CACA
      CA00C9C9C900C4C4C400BEBEBE00C5C5C500EBEBEB00DFDFDF00BFBFBF00BFBF
      BF00C3C3C300C7C7C700CCCCCC00D1D1D100CFCFCF00E9E9E900FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DFDFDF00BFBFBF00C8C8C800CACACA00C9C9C900C4C4C400BEBEBE00C5C5
      C500EBEBEB00DFDFDF00BFBFBF00BFBFBF00C3C3C300C7C7C700CCCCCC00D1D1
      D100CFCFCF00E9E9E900FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFEFE00FDFDFD00FDFDFD00FCFCFC00FBFBFB00F9F9F900F8F8F800F8F8
      F800F9F9F900FCFCFC00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FEFEFE00FDFDFD00FDFDFD00FCFC
      FC00FBFBFB00F9F9F900F8F8F800F8F8F800F9F9F900FCFCFC00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F3F3F300CFCFCF00DADADA00DADADA00D6D6
      D600D2D2D200CCCCCC00C6C6C600BEBEBE00DDDDDD00CFCFCF00BFBFBF00C6C6
      C600CCCCCC00D0D0D000D3D3D300D5D5D500D8D8D800D4D4D400F8F8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F3F3
      F300CFCFCF00DADADA00DADADA00D6D6D600D2D2D200CCCCCC00C6C6C600BEBE
      BE00DDDDDD00CFCFCF00BFBFBF00C6C6C600CCCCCC00D0D0D000D3D3D300D5D5
      D500D8D8D800D4D4D400F8F8F800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FEFEFE00FDFDFD00FDFDFD00FBFBFB00FAFAFA00F9F9F900F7F7
      F700F5F5F500F3F3F300F1F1F100EFEFEF00EDEDED00EBEBEB00E9E9E900E8E8
      E800EBEBEB00F2F2F200FAFAFA00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FDFDFD00FDFD
      FD00FBFBFB00FAFAFA00F9F9F900F7F7F700F5F5F500F3F3F300F1F1F100EFEF
      EF00EDEDED00EBEBEB00E9E9E900E8E8E800EBEBEB00F2F2F200FAFAFA00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EBEBEB00DFDFDF00E5E5E500E2E2E200E2E2
      E200E0E0E000E1E1E100BABABA00A5A5A500E6E6E600D8D8D800C7C7C700D6D6
      D600DADADA00DCDCDC00DDDDDD00DEDEDE00E0E0E000D9D9D900F2F2F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EBEB
      EB00DFDFDF00E5E5E500E2E2E200E2E2E200E0E0E000E1E1E100BABABA00A5A5
      A500E6E6E600D8D8D800C7C7C700D6D6D600DADADA00DCDCDC00DDDDDD00DEDE
      DE00E0E0E000D9D9D900F2F2F200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FDFDFD00FDFDFD00FCFCFC00FAFAFA00FAFAFA00F8F8
      F800F6F6F600F5F5F500F3F3F300F1F1F100EFEFEF00ECECEC00E9E9E900E7E7
      E700E4E4E400E1E1E100DEDEDE00DBDBDB00D8D8D800D5D5D500D2D2D200D2D2
      D200D9D9D900E6E6E600F4F4F400FDFDFD000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FDFDFD00FDFD
      FD00FCFCFC00FAFAFA00FAFAFA00F8F8F800F6F6F600F5F5F500F3F3F300F1F1
      F100EFEFEF00ECECEC00E9E9E900E7E7E700E4E4E400E1E1E100DEDEDE00DBDB
      DB00D8D8D800D5D5D500D2D2D200D2D2D200D9D9D900E6E6E600F4F4F400FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0F0F000E8E8E800ECECEC00ECECEC00EDED
      ED00EEEEEE00F6F6F600C5C5C50090909000E5E5E500E8E8E800CACACA00DFDF
      DF00EDEDED00E9E9E900E8E8E800E7E7E700E8E8E800E2E2E200F4F4F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0F0
      F000E8E8E800ECECEC00ECECEC00EDEDED00EEEEEE00F6F6F600C5C5C5009090
      9000E5E5E500E8E8E800CACACA00DFDFDF00EDEDED00E9E9E900E8E8E800E7E7
      E700E8E8E800E2E2E200F4F4F400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00FBFB
      FB00F9F9F900F6F6F600F4F4F400F2F2F200F0F0F000EEEEEE00EBEBEB00E9E9
      E900E6E6E600E3E3E300E0E0E000DDDDDD00DADADA00D7D7D700D3D3D300D0D0
      D000CDCDCD00C9CACA00C5C6C600C1C2C200BDBEBF00BCBCBD00BBBBBB00BDBD
      BD00CACACA00DBDBDB00EEEEEE00FAFAFA000000000000000000000000000000
      00000000000000000000FDFDFD00FBFBFB00F9F9F900F6F6F600F4F4F400F2F2
      F200F0F0F000EEEEEE00EBEBEB00E9E9E900E6E6E600E3E3E300E0E0E000DDDD
      DD00DADADA00D7D7D700D3D3D300D0D0D000CDCDCD00C9C9C900C5C5C500C1C1
      C100BEBEBE00BCBCBC00BBBBBB00BDBDBD00CACACA00DBDBDB00EEEEEE00FAFA
      FA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F9F9F900E8E8E800F2F2F200F2F2F200F3F3
      F300F3F3F300F7F7F700D9D9D90089898900D9D9D900EAEAEA00CDCDCD00DADA
      DA00F7F7F700F2F2F200F1F1F100F1F1F100ECECEC00E5E5E500FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F900E8E8E800F2F2F200F2F2F200F3F3F300F3F3F300F7F7F700D9D9D9008989
      8900D9D9D900EAEAEA00CDCDCD00DADADA00F7F7F700F2F2F200F1F1F100F1F1
      F100ECECEC00E5E5E500FCFCFC00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FAFAFA00F3F3
      F300EBEBEB00E6E6E600E2E2E200DFDFDF00DCDCDC00D9D9D900D6D6D600D2D2
      D200CFCFCF00CCCCCC00C8C8C800C3C4C400BFC0C100BDBDBE00BDBDBD00BDBD
      BC00BCBBBB00C1BFBD00CBC6C200D4CEC700DDD4CC00E4DBD200E6E2DF00CECF
      D000BFBFBF00D2D2D200E8E8E800F8F8F800FEFEFE0000000000000000000000
      000000000000FEFEFE00FAFAFA00F3F3F300EBEBEB00E6E6E600E2E2E200DFDF
      DF00DCDCDC00D9D9D900D6D6D600D2D2D200CFCFCF00CCCCCC00C8C8C800C3C3
      C300C0C0C000BDBDBD00BDBDBD00BCBCBC00BBBBBB00BFBFBF00C6C6C600CDCD
      CD00D4D4D400DBDBDB00E2E2E200CFCFCF00BFBFBF00D2D2D200E8E8E800F8F8
      F800FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300E9E9E900F2F2F200F3F3
      F300F0F0F000ECECEC00DADADA0088888800C9C9C900ECECEC00D4D4D400D1D1
      D100F6F6F600F5F5F500F5F5F500EEEEEE00E4E4E400F7F7F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F3F300E9E9E900F2F2F200F3F3F300F0F0F000ECECEC00DADADA008888
      8800C9C9C900ECECEC00D4D4D400D1D1D100F6F6F600F5F5F500F5F5F500EEEE
      EE00E4E4E400F7F7F70000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F6F6F600E9E9
      E900DADADA00D0D0D000CACACB00C6C6C700C2C2C300BEBFBF00BCBDBE00BDBD
      BD00BDBDBD00BDBCBC00C6C3C000D1CBC500DAD2CA00E1D7CF00E4DDD700E8E3
      DF00EDEAE700E3E8EC00CDDFEF00B9D9F500A4D1FA0089C6FB00DEF0FE00FDF9
      F600C1C2C200CBCBCB00E3E3E300F5F5F500FEFEFE0000000000000000000000
      000000000000FDFDFD00F6F6F600E9E9E900DADADA00D0D0D000CACACA00C6C6
      C600C2C2C200BEBEBE00BDBDBD00BDBDBD00BDBDBD00BCBCBC00C3C3C300CBCB
      CB00D2D2D200D7D7D700DDDDDD00E3E3E300EAEAEA00E7E7E700DEDEDE00D7D7
      D700CFCFCF00C3C3C300EEEEEE00F9F9F900C1C1C100CBCBCB00E3E3E300F5F5
      F500FEFEFE000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F6F600EAEAEA00E9E9
      E900E6E6E600DFDFDF00D5D5D5008C8C8C00B7B7B700EDEDED00DBDBDB00CCCC
      CC00F2F2F200ECECEC00E4E4E400E7E7E700F9F9F90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F6F600EAEAEA00E9E9E900E6E6E600DFDFDF00D5D5D5008C8C
      8C00B7B7B700EDEDED00DBDBDB00CCCCCC00F2F2F200ECECEC00E4E4E400E7E7
      E700F9F9F9000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F4F4F400E2E2
      E200CFCFCF00C2C2C200BFBEBD00C8C6C300D2CDC900DAD3CD00DFD8D200E4E0
      DC00E8E6E300E9EAEA00D7E2EE00C0DAF200ACD5F70096CCFC0074BCFA0056AE
      FB0037A1FE002198FE001492FD00068CFE000287FE00007EFE005BAEF700FFFF
      FC00CBCCCC00C5C5C500DEDEDE00F1F1F100FCFCFC0000000000000000000000
      000000000000FDFDFD00F4F4F400E2E2E200CFCFCF00C2C2C200BEBEBE00C5C5
      C500CDCDCD00D3D3D300D8D8D800E0E0E000E5E5E500E9E9E900E2E2E200D9D9
      D900D2D2D200CACACA00B8B8B800AAAAAA009C9C9C00929292008B8B8B008585
      8500828282007E7E7E00AAAAAA00FEFEFE00CBCBCB00C5C5C500DEDEDE00F1F1
      F100FCFCFC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00F5F5
      F500ECECEC00E1E1E100DDDDDD0099999900A5A5A500EBEBEB00E1E1E100C8C8
      C800E1E1E100ECECEC00F6F6F600FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFD00F5F5F500ECECEC00E1E1E100DDDDDD009999
      9900A5A5A500EBEBEB00E1E1E100C8C8C800E1E1E100ECECEC00F6F6F600FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00F3F2F200EFEC
      EA00E9E7E500EAE9E900E8EBED00DBE6F000CBE1F500BADCFA009ED0FB0079BF
      FA0054AFFC00309FFF001A94FF00098CFF000088FF000085FF000087FF00008A
      FF00008DFE00018FFE000392FE000693FE000B94FE00048DFF002898FA00FCFC
      FD00DBDAD900BFBFBF00D8D8D800EDEDED00FBFBFB0000000000000000000000
      000000000000FBFBFB00F2F2F200ECECEC00E7E7E700E9E9E900EAEAEA00E5E5
      E500E0E0E000DADADA00CDCDCD00BBBBBB00AAAAAA009A9A9A008F8F8F008686
      8600828282008181810082828200838383008383830084848400868686008787
      8700898989008585850093939300FCFCFC00DADADA00BFBFBF00D8D8D800EDED
      ED00FBFBFB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE0000000000BBBBBB0092929200E6E6E600E5E5E500CACA
      CA00F2F2F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE0000000000BBBB
      BB0092929200E6E6E600E5E5E500CACACA00F2F2F20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900F4F4F400CCE7
      FA00AED9FB00A2D2FE0095CDFF0086C6FE0072BDFE005AB4FD0048ACFD003BA9
      FC002EA4FC0024A0FD001A9DFD00119AFF000C99FF000B99FF000C9AFF000E9C
      FE000F9DFE00109EFE00129FFE0015A0FE00129EFE000999FE000C94FB00D2E9
      FB00F3EDE900BCBDBD00D3D3D300E9E9E900F8F8F80000000000000000000000
      000000000000F9F9F900F4F4F400E4E4E400D6D6D600D0D0D000CBCBCB00C3C3
      C300B9B9B900AEAEAE00A5A5A500A0A0A0009A9A9A0095959500919191008E8E
      8E008C8C8C008B8B8B008C8C8C008D8D8D008E8E8E008E8E8E008F8F8F009191
      91008F8F8F008A8A8A0089898900E7E7E700EDEDED00BCBCBC00D3D3D300E9E9
      E900F8F8F8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D4D4D40086868600DCDCDC00E9E9E900CDCD
      CD00EBEBEB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D4D4
      D40086868600DCDCDC00E9E9E900CDCDCD00EBEBEB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFF00F7F5F300BAE1
      FA009BD9FF009ED7FF009CD5FF009ED7FF009FD8FF0098D6FF008AD1FE0078CA
      FD0066C4FC0057BEFC004BB8FC003DB2FC0033ADFD0029A9FE0024A7FF0023A6
      FF0025A6FE0025A6FE0025A7FE0025A7FE0021A5FE0015A1FF000091FF0099D2
      FB00FFFAF300C0C1C200CDCDCD00E4E4E400F6F6F600FEFEFE00000000000000
      000000000000FEFEFE00F5F5F500DCDCDC00D1D1D100D1D1D100D0D0D000D1D1
      D100D2D2D200CFCFCF00C8C8C800BFBFBF00B7B7B700B0B0B000AAAAAA00A3A3
      A3009F9F9F009A9A9A0098989800989898009898980098989800989898009898
      9800969696009191910085858500CCCCCC00F9F9F900C1C1C100CDCDCD00E4E4
      E400F6F6F600FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7E7E70082828200CECECE00ECECEC00D2D2
      D200DFDFDF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7E7
      E70082828200CECECE00ECECEC00D2D2D200DFDFDF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBF8F700E1EC
      F300AEE0FF00B0E1FF00AEE0FF00ADE0FF00ADDFFE00ADDFFE00ABDFFF00A0DA
      FF008FD3FD007ECDFD006DC6FD0063C6FF0057C2FF0045B6FE003CB2FE0035B0
      FF002CA9FE002EAAFE0035B0FF0035AEFE0039AEFC003FB0FB0032A9FA0083C7
      F500FFFFFB00C9C9CA00C6C6C600DFDFDF00F2F2F200FDFDFD00000000000000
      00000000000000000000F8F8F800EAEAEA00D9D9D900DADADA00D9D9D900D9D9
      D900D8D8D800D8D8D800D8D8D800D3D3D300CACACA00C2C2C200BABABA00B8B8
      B800B2B2B200A8A8A800A4A4A400A1A1A1009B9B9B009C9C9C00A1A1A100A0A0
      A000A1A1A100A3A3A3009C9C9C00BFBFBF00FDFDFD00C9C9C900C6C6C600DFDF
      DF00F2F2F200FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F6F6F60088888800BBBBBB00EDEDED00D8D8
      D800D6D6D6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F6F6
      F60088888800BBBBBB00EDEDED00D8D8D800D6D6D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00F2F1
      F100C2E5FB00B4E3FF00B6E3FF00B9E4FF00C9F1FF00D0F6FF00C5E9FF00CDED
      FF00DAFAFF00C7EAFE00C3E9FF00A6CEE7009DC3DC00C0E6FD00B9DDF300BADA
      EF00CFECFE00D5EAF900CDDEEA00DEE6EB00E3E9ED00E4E7EA00E6E7E800E5E7
      E800FDFDFE00D6D6D600C1C1C100DADADA00EFEFEF00FBFBFB00000000000000
      00000000000000000000FDFDFD00F1F1F100E0E0E000DCDCDC00DDDDDD00DEDE
      DE00E8E8E800ECECEC00E4E4E400E8E8E800F1F1F100E5E5E500E3E3E300C9C9
      C900BEBEBE00E1E1E100D8D8D800D6D6D600E8E8E800E8E8E800DCDCDC00E5E5
      E500E8E8E800E7E7E700E7E7E700E6E6E600FDFDFD00D6D6D600C1C1C100DADA
      DA00EFEFEF00FBFBFB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000095959500A7A7A700EBEBEB00DEDE
      DE00D0D0D0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000095959500A7A7A700EBEBEB00DEDEDE00D0D0D00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F6F5
      F500F0F3F600F6FCFF00FAFDFF0000000000B4B6B700ACADAD0000000000EBEB
      EA009E9C9B00FFFDFB00B9B5B2003E3733004A44400088827E00BBB5B100504A
      4600CDC8C400D2CDCA00413D3A00AEABA900FEFBF900EDEBE900ECEAE900E7E6
      E500F8F8F800E6E6E600BEBEBE00D4D4D400EBEBEB00F9F9F900000000000000
      0000000000000000000000000000F5F5F500F3F3F300FBFBFB00FCFCFC000000
      0000B5B5B500ACACAC0000000000EAEAEA009C9C9C00FDFDFD00B5B5B5003838
      38004444440082828200B5B5B5004A4A4A00C8C8C800CDCDCD003D3D3D00ABAB
      AB00FBFBFB00EBEBEB00EAEAEA00E6E6E600F8F8F800E6E6E600BEBEBE00D4D4
      D400EBEBEB00F9F9F90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A9A9A90094949400E7E7E700E4E4
      E400CECECE00FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A9A9A90094949400E7E7E700E4E4E400CECECE00FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FB00F6F5F500FEFEFE000000000000000000908F8F003A393900C2C2C2000000
      000052515100B4B4B400AAAAAB0067686800EAEAEB0051525200878888007575
      76002E2F2F004747470029292900A6A6A600FDFDFD00EBEBEB00EBEBEB00E7E7
      E700F3F3F300F2F2F200C0C0C000CECECE00E5E5E500F6F6F600FEFEFE000000
      0000000000000000000000000000FBFBFB00F5F5F500FEFEFE00000000000000
      00008F8F8F0039393900C2C2C2000000000051515100B4B4B400AAAAAA006767
      6700EAEAEA005151510087878700757575002E2E2E004747470029292900A6A6
      A600FDFDFD00EBEBEB00EBEBEB00E7E7E700F3F3F300F2F2F200C0C0C000CECE
      CE00E5E5E500F6F6F600FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5F5F500F3F3F300FEFEFE0000000000C2C2C20086868600DFDFDF00E8E8
      E800CECECE00F3F3F30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F500F3F3F300FEFEFE000000
      0000C2C2C20086868600DFDFDF00E8E8E800CECECE00F3F3F300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5F5F500FBFBFB000000000000000000BCBCBC007D7D7D0081818100E6E6
      E600C5C5C5006F6F6F0000000000E2E2E200909090004A4A4A0086868600E1E1
      E1003D3D3D00A4A4A40049494900A2A2A200FEFEFE00EDEDED00ECECEC00E9E9
      E900EEEEEE00FBFBFB00C7C7C700C7C7C700E1E1E100F3F3F300FDFDFD000000
      000000000000000000000000000000000000F5F5F500FBFBFB00000000000000
      0000BCBCBC007D7D7D0081818100E6E6E600C5C5C5006F6F6F0000000000E2E2
      E200909090004A4A4A0086868600E1E1E1003D3D3D00A4A4A40049494900A2A2
      A200FEFEFE00EDEDED00ECECEC00E9E9E900EEEEEE00FBFBFB00C7C7C700C7C7
      C700E1E1E100F3F3F300FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDDDDD008181
      81004F4F4F004B4B4B007F7F7F00E6E6E600D7D7D7007E7E7E00D1D1D100ECEC
      EC00D1D1D100E9E9E90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DDDDDD00818181004F4F4F004B4B4B007F7F7F00E6E6
      E600D7D7D7007E7E7E00D1D1D100ECECEC00D1D1D100E9E9E900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900F8F8F800FEFEFE0000000000D3D3D30096959500C7C7C7008B8B
      8B00F7F7F70078787800C9C9C900949494005151510097979700D3D3D3000000
      0000979797005D5D5D004D4D4D00A4A4A40000000000EEEEEE00EDEDED00ECEC
      EC00EBEBEB00FDFDFD00D2D2D200C2C2C200DCDCDC00F0F0F000FBFBFB000000
      000000000000000000000000000000000000F9F9F900F8F8F800FEFEFE000000
      0000D3D3D30095959500C7C7C7008B8B8B00F7F7F70078787800C9C9C9009494
      94005151510097979700D3D3D30000000000979797005D5D5D004D4D4D00A4A4
      A40000000000EEEEEE00EDEDED00ECECEC00EBEBEB00FDFDFD00D2D2D200C2C2
      C200DCDCDC00F0F0F000FBFBFB00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8C8C800454545003232
      32003A3A3A0038373700252525005E5E5E00B2B2B2008E8E8E00C2C2C200F0F0
      F000D7D7D700DEDEDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C8C8C80045454500323232003A3A3A0037373700252525005E5E
      5E00B2B2B2008E8E8E00C2C2C200F0F0F000D7D7D700DEDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00F7F7F700FDFDFD0000000000EBEBEC0091919200F5F6F600AFAF
      B000B0B1B100BABBBC0091929300B7B8B9007F808100B6B8B90061626300D9D9
      DA00000000006869690020212200A7A8A90000000000F0F1F100F0F0F100EEEF
      EF00EAEBEA00F9F9F900E2E2E200BEBEBE00D6D6D600ECECEC00F9F9F9000000
      000000000000000000000000000000000000FDFDFD00F7F7F700FDFDFD000000
      0000EBEBEB0091919100F5F5F500AFAFAF00B0B0B000BBBBBB0092929200B8B8
      B80080808000B7B7B70062626200D9D9D900000000006868680021212100A8A8
      A80000000000F0F0F000F0F0F000EEEEEE00EAEAEA00F9F9F900E2E2E200BEBE
      BE00D6D6D600ECECEC00F9F9F900000000000000000000000000000000000000
      000000000000000000000000000000000000E7E7E7004B4B4B00393939004645
      4500404040003A3B3D00393A39002B2B2B0097979700B0B0B000AAAAAA00CECE
      CE00DCDCDC00DADADA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E7E7004B4B4B003939390045454500404040003B3B3B00393939002B2B
      2B0097979700B0B0B000AAAAAA00CECECE00DCDCDC00DADADA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9F9FA00F8F6F500F3EEE800EFEBE600BDB9B500E2DDD800F2EE
      EA00B0ADA900D3CEC900AAA5A100E4E0DC00B9B5B1008F8B8700A19E9B00EBE8
      E500FFFEFB00D1CFCC0077767400C0BFBC00FBFAF900F3F3F400F1F2F200F0F1
      F100F1F4F600FAFBFD00EEEEEE00BEBEBE00D0D0D000E7E7E700F7F7F700FEFE
      FE000000000000000000000000000000000000000000F9F9F900F6F6F600EDED
      ED00EAEAEA00B9B9B900DDDDDD00EEEEEE00ACACAC00CECECE00A5A5A500E0E0
      E000B5B5B5008B8B8B009E9E9E00E8E8E800FDFDFD00CECECE0075757500BEBE
      BE00FAFAFA00F3F3F300F1F1F100F0F0F000F3F3F300FBFBFB00EEEEEE00BEBE
      BE00D0D0D000E7E7E700F7F7F700FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000009494940038383800474746003C3D
      3E00272C300029343400343939002D2C2C007F7F7F00C0C0C000B1B1B100A8A8
      A800AEAEAE00C4C4C400FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009494940038383800464646003D3D3D002B2B2B0030303000373737002C2C
      2C007F7F7F00C0C0C000B1B1B100A8A8A800AEAEAE00C4C4C400FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFCFD00F8F8F700E3D6CA00DDCFBE00E2D3C300DACABA00DAC8
      B700DAC8B500CEB69F00C5A88C00B6947300B7936E00B28C6600B48F6900A982
      5A00A2794F00AA825A00AC8359009E7144009161300096683A0096683900976B
      3D00996E4100C6B19B00FCFEFF00C6C5C500C9C9C900E3E3E300F4F4F400FCFC
      FC000000000000000000000000000000000000000000FCFCFC00F7F7F700D6D6
      D600CECECE00D2D2D200CACACA00C8C8C800C7C7C700B6B6B600A8A8A8009494
      9400929292008C8C8C008E8E8E00818181007878780082828200828282007171
      71006060600068686800676767006A6A6A006D6D6D00B0B0B000FDFDFD00C5C5
      C500C9C9C900E3E3E300F4F4F400FCFCFC000000000000000000000000000000
      0000000000000000000000000000FCFCFC0064646400484848004A4A4A00292F
      32002E393900313735003A3337002E2E2E0086868600CDCDCD00BFBFBF00BABA
      BA00B2B2B200AAAAAA00B7B7B700E2E2E2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC0064646400484848004A4A4A002E2E2E003535350034343400363636002E2E
      2E0086868600CDCDCD00BFBFBF00BABABA00B2B2B200AAAAAA00B7B7B700E2E2
      E200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFE00FAFBFC00F1ECE600E2D5C800E3D7CA00E2D5C700E0D2
      C400DFD0C100DBCBBB00D2BEAA00C8AF9600BDA08300B8987800B08E6A00AA84
      5D00A47B52009D714500986A3B00936432008750190073340000733400007436
      02006B2800009263370000000000D4D4D400CBCBCB00E2E2E200F3F3F300FDFD
      FD000000000000000000000000000000000000000000FEFEFE00FBFBFB00EBEB
      EB00D5D5D500D6D6D600D4D4D400D2D2D200D0D0D000CBCBCB00BEBEBE00AFAF
      AF00A0A0A000989898008D8D8D00838383007B7B7B0071717100696969006363
      630050505000373737003737370039393900313131006464640000000000D4D4
      D400CBCBCB00E2E2E200F3F3F300FDFDFD000000000000000000000000000000
      0000000000000000000000000000F4F4F4005F5F5F0052515100505051003540
      3F003F444300524A4E003530320031313100AAAAAA00D7D7D700CBCBCB00C6C6
      C600C1C1C100BBBBBB00B1B1B100A9A9A900BABABA00E5E5E500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F4005F5F5F0051515100505050003C3C3C00424242004E4E4E00323232003131
      3100AAAAAA00D7D7D700CBCBCB00C6C6C600C1C1C100BBBBBB00B1B1B100A9A9
      A900BABABA00E5E5E50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBFCFC00F8F7F700EBE2D900E9DED400E7DDD200E6DA
      CF00E4D8CB00E2D6C800DDCEBF00D5C3AF00CCB69E00C5AA9100C0A38600B999
      7900B18E6A00A9825C00A47A5000A07449009E7346008E5C2800793D01007B40
      0400793D0000834D1600EFEBE600E9EAEB00D5D5D500E7E7E700F5F5F500FDFD
      FD00000000000000000000000000000000000000000000000000FBFBFB00F7F7
      F700E2E2E200DEDEDE00DCDCDC00DADADA00D7D7D700D5D5D500CECECE00C2C2
      C200B5B5B500AAAAAA00A3A3A300999999008D8D8D00828282007A7A7A007474
      7400727272005B5B5B003D3D3D003F3F3F003C3C3C004C4C4C00EAEAEA00EAEA
      EA00D5D5D500E7E7E700F5F5F500FDFDFD000000000000000000000000000000
      0000000000000000000000000000FDFDFD007070700055555500575857004A4D
      4C004F484C00737071003232320058585800DBDBDB00DDDDDD00D7D7D700D2D2
      D200CDCDCD00C8C8C800C2C2C200BCBCBC00B3B3B300ACACAC00BDBDBD00EAEA
      EA00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD007070700055555500575757004B4B4B004B4B4B0071717100323232005858
      5800DBDBDB00DDDDDD00D7D7D700D2D2D200CDCDCD00C8C8C800C2C2C200BCBC
      BC00B3B3B300ACACAC00BDBDBD00EAEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FAFAFB00FCFDFD00F9F9F900F8F6F500F7F5
      F200F6F3F000F5F2EF00F4F0EC00F1EAE500EAE2DA00E3D8CC00DCCEC000D5C3
      B100CCB69F00C1A58900B8997900B08C6900AB855E00A780590091602D007334
      0000702F00006C2A0000D8C9B800FBFFFF00E7E7E600F2F2F200F9F9F900FEFE
      FE00000000000000000000000000000000000000000000000000FEFEFE00FAFA
      FA00FCFCFC00F9F9F900F6F6F600F4F4F400F3F3F300F2F2F200F0F0F000EAEA
      EA00E2E2E200D7D7D700CECECE00C3C3C300B5B5B500A5A5A500989898008C8C
      8C0084848400808080005F5F5F00373737003535350032323200C8C8C800FDFD
      FD00E6E6E600F2F2F200F9F9F900FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000ADADAD00515151005F6060005A59
      5900565455004C4C4C0057585700C4C4C400EAEAEA00E3E3E300E0E0E000DCDC
      DC00D8D8D800D3D3D300CFCFCF00C9C9C900C4C4C400BEBEBE00B3B3B300AFAF
      AF00E5E5E5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADADAD00515151005F5F5F0059595900555555004C4C4C0057575700C4C4
      C400EAEAEA00E3E3E300E0E0E000DCDCDC00D8D8D800D3D3D300CFCFCF00C9C9
      C900C4C4C400BEBEBE00B3B3B300AFAFAF00E5E5E50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFF00FDFDFE00FDFDFD00FCFD
      FD00FDFEFE000000000000000000FEFFFF00FCFEFF00FCFDFE00FCFEFF00FDFE
      FF00FDFFFF00FCFDFE00F8F9F800F2F1EF00EEE9E600E8E1DA00E3DAD000D2C1
      B000C7B29C00C3AC9500EFEAE400F9FAFC00F2F2F200FBFBFB00FDFDFD00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FDFDFD00FDFDFD00FCFCFC00FDFDFD000000000000000000FEFE
      FE00FDFDFD00FDFDFD00FDFDFD00FEFEFE00FEFEFE00FDFDFD00F8F8F800F0F0
      F000E9E9E900E1E1E100D9D9D900C1C1C100B1B1B100ACACAC00E9E9E900FAFA
      FA00F2F2F200FBFBFB00FDFDFD00FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000F6F6F60087878700595959005C5C
      5C005B5B5B0072727200C0C0C000E1E1E100E0E0E000E3E3E300E5E5E500E4E4
      E400E1E1E100DDDDDD00D9D9D900D5D5D500D0D0D000CBCBCB00C6C6C600BCBC
      BC00BFBFBF00FCFCFC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F6F60087878700595959005C5C5C005B5B5B0072727200C0C0C000E1E1
      E100E0E0E000E3E3E300E5E5E500E4E4E400E1E1E100DDDDDD00D9D9D900D5D5
      D500D0D0D000CBCBCB00C6C6C600BCBCBC00BFBFBF00FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFE00FFFFFE00000000000000
      000000000000FEFEFE00FDFDFE00FDFDFE00FDFEFF00FEFFFF00000000000000
      000000000000FEFFFF00F6F7F700F1F1F100FBFBFB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FEFEFE00000000000000000000000000FEFEFE00FDFDFD00FDFD
      FD00FEFEFE00FEFEFE00000000000000000000000000FEFEFE00F6F6F600F1F1
      F100FBFBFB000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F6F600B9B9B9009999
      9900ABABAB00CBCBCB00D2D2D200D1D1D100D7D7D700DBDBDB00DFDFDF00E3E3
      E300E5E5E500E5E5E500E2E2E200DFDFDF00DADADA00D6D6D600D1D1D100CCCC
      CC00C4C4C400F3F3F30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F6F600B9B9B90099999900ABABAB00CBCBCB00D2D2D200D1D1
      D100D7D7D700DBDBDB00DFDFDF00E3E3E300E5E5E500E5E5E500E2E2E200DFDF
      DF00DADADA00D6D6D600D1D1D100CCCCCC00C4C4C400F3F3F300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFE
      FE00FEFEFE00FEFEFD00FFFFFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FEFEFE00FDFDFD00FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1F1
      F100CFCFCF00B9B9B900BBBBBB00C5C5C500CCCCCC00D1D1D100D5D5D500DADA
      DA00DEDEDE00E2E2E200E4E4E400E5E5E500E3E3E300E0E0E000DCDCDC00D8D8
      D800CFCFCF00F4F4F40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F1F1F100CFCFCF00B9B9B900BBBBBB00C5C5
      C500CCCCCC00D1D1D100D5D5D500DADADA00DEDEDE00E2E2E200E4E4E400E5E5
      E500E3E3E300E0E0E000DCDCDC00D8D8D800CFCFCF00F4F4F400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F4F4F400D5D5D500BDBDBD00B9B9B900C1C1C100CACACA00CFCF
      CF00D4D4D400D9D9D900DDDDDD00E1E1E100E4E4E400E5E5E500E4E4E400E1E1
      E100DADADA00FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4F4F400D5D5D500BDBD
      BD00B9B9B900C1C1C100CACACA00CFCFCF00D4D4D400D9D9D900DDDDDD00E1E1
      E100E4E4E400E5E5E500E4E4E400E1E1E100DADADA00FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFB00E0E0E000C4C4C400B9B9B900BEBE
      BE00C8C8C800CECECE00D3D3D300D7D7D700DCDCDC00E0E0E000E3E3E300E3E3
      E300E4E4E4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FB00E0E0E000C4C4C400B9B9B900BEBEBE00C8C8C800CECECE00D3D3D300D7D7
      D700DCDCDC00E0E0E000E3E3E300E3E3E300E4E4E40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EDEDED00CDCD
      CD00BBBBBB00BBBBBB00C5C5C500CCCCCC00D2D2D200D6D6D600D9D9D900DADA
      DA00F6F6F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EDEDED00CDCDCD00BBBBBB00BBBBBB00C5C5C500CCCC
      CC00D2D2D200D6D6D600D9D9D900DADADA00F6F6F60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F6F600D8D8D800C0C0C000BBBBBB00C0C0C000C6C6C600D1D1D100F2F2
      F200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6F600D8D8D800C0C0C000BBBB
      BB00C0C0C000C6C6C600D1D1D100F2F2F2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBFBFB00E5E5E500DADADA00E8E8E800FBFBFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBFBFB00E5E5
      E500DADADA00E8E8E800FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFD00FEFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FEFDFD00FEFEFD00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E6E3
      DF00D5D0CA00D8D3CC00D8D3CD00D8D3CD00D9D4CE00D9D4CF00DAD5CF00DAD5
      D000DBD6D000DBD6D100DBD7D100DCD7D100DCD7D200DCD7D200DCD7D200DCD7
      D200DCD7D100DCD7D100DBD6D100DBD6D000DAD6D000DAD5CF00DAD4CF00D9D4
      CE00D8D4CD00D8D3CD00D8D3CD00D6D0C900E6E3DF0000000000000000000000
      0000000000000000000000000000E2E2E200CFCFCF00D2D2D200D2D2D200D2D2
      D200D3D3D300D4D4D400D4D4D400D5D5D500D5D5D500D6D6D600D6D6D600D6D6
      D600D7D7D700D7D7D700D7D7D700D7D7D700D6D6D600D6D6D600D6D6D600D5D5
      D500D5D5D500D4D4D400D4D4D400D3D3D300D3D3D300D2D2D200D2D2D200CFCF
      CF00E2E2E2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F6F500CDC7
      C000D1CBC200D7D1C900D8D2CB00D9D4CD00DCD6CF00DED9D300E0DCD600E3DF
      D900E4E1DB00E5E2DD00E7E4DF00E9E5E000E9E6E200EBE7E300EBE8E400EAE7
      E200E9E5E100E8E4DF00E6E2DD00E4E1DB00E3DED900E0DCD500DDD9D300D9D7
      D000D7D7CE00D5D5CC00D5D3C900D1CCC300CDC7BF00F7F6F500000000000000
      00000000000000000000F6F6F600C6C6C600CACACA00D0D0D000D1D1D100D3D3
      D300D5D5D500D8D8D800DBDBDB00DEDEDE00E0E0E000E1E1E100E3E3E300E4E4
      E400E5E5E500E7E7E700E7E7E700E6E6E600E5E5E500E3E3E300E1E1E100E0E0
      E000DEDEDE00DBDBDB00D8D8D800D5D5D500D4D4D400D2D2D200D0D0D000CACA
      CA00C6C6C600F6F6F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0EDEC00D1CA
      C200D7D1C900D3CEC600D1CBC500D3CEC800D5D0CA00D7D2CC00D9D5D000DCD8
      D200E3DFDA00E8E4DF00E8E5E000EAE6E200EBE7E400EBE9E500EBE9E500EBE8
      E400EAE6E300E9E6E100E7E4DF00E6E2DE00E5E0DB00E1DFD800DDDDD600D9DD
      D400D6DDD300D5DBD100D5D9CF00D4D3CA00D0CCC400F0EEEC00000000000000
      00000000000000000000EDEDED00C9C9C900D0D0D000CDCDCD00CBCBCB00CDCD
      CD00CFCFCF00D1D1D100D4D4D400D7D7D700DEDEDE00E3E3E300E4E4E400E6E6
      E600E7E7E700E8E8E800E8E8E800E7E7E700E6E6E600E5E5E500E3E3E300E2E2
      E200E0E0E000DDDDDD00DADADA00D8D8D800D7D7D700D5D5D500D4D4D400D0D0
      D000CACACA00EEEEEE000000000000000000000000000000000000000000FEFE
      FE00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9E6E300D4CE
      C700DFDAD400CBC6C000C0BBB500C4C0BA00C7C2BD00C8C4BE00CBC7C200CCC8
      C400E0DDD800EDEAE500EBE8E500ECEAE700EDEBE800EEECE900EEECE900EEEB
      E800EDEBE700ECE9E600EBE8E400EAE7E200E8E5E000E5E3DE00DFE3DC00DAE4
      DB00D9E6DC00D8E5DA00D7E2D700D8DCD400D3D1C900E9E6E300000000000000
      00000000000000000000E6E6E600CDCDCD00D9D9D900C5C5C500BABABA00BFBF
      BF00C2C2C200C3C3C300C6C6C600C8C8C800DCDCDC00E9E9E900E8E8E800E9E9
      E900EAEAEA00EBEBEB00EBEBEB00EBEBEB00EAEAEA00E9E9E900E7E7E700E6E6
      E600E4E4E400E2E2E200DFDFDF00DDDDDD00DEDEDE00DDDDDD00DADADA00D8D8
      D800CFCFCF00E6E6E6000000000000000000000000000000000000000000FCFC
      FC00F9F9F900F6F6F600F2F2F200F0F0F000EEEEEE00EBEBEB00E7E7E700E5E5
      E500E1E1E100DDDDDD00DADADA00D6D6D600D2D2D200CECECE00CACACA00C6C6
      C600C1C2C200BDBDBE00B8B8B900D1D1D100FCFCFC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFCFC00F9F9F900F6F6F600F2F2F200F0F0
      F000EEEEEE00EBEBEB00E7E7E700E5E5E500E1E1E100DDDDDD00DADADA00D6D6
      D600D2D2D200CECECE00CACACA00C6C6C600C1C1C100BDBDBD00B8B8B800D1D1
      D100FCFCFC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2DEDA00DAD5
      CE00E5E1DB00CCC8C100C0BBB500C4BFBA00C7C2BD00C7C4BF00CAC7C200CBC8
      C300E1DEDB00F0EDEA00EEEBE800EFECEA00F0EDEB00F1EEEC00F1EEEC00F0EE
      EB00EFEDEA00EFECE900EDEBE800EDEAE700EBE8E500E8E7E200E1E7E000E3EB
      E300A7DFC6009CE1C400E0E8DF00DBE2DA00D9D7D000E2DEDA00000000000000
      00000000000000000000DEDEDE00D4D4D400E0E0E000C7C7C700BABABA00BFBF
      BF00C2C2C200C3C3C300C6C6C600C7C7C700DEDEDE00EDEDED00EBEBEB00ECEC
      EC00EDEDED00EEEEEE00EEEEEE00EDEDED00ECECEC00ECECEC00EAEAEA00EAEA
      EA00E8E8E800E5E5E500E2E2E200E5E5E500C4C4C400C0C0C000E2E2E200DDDD
      DD00D5D5D500DEDEDE000000000000000000000000000000000000000000FDFD
      FD00F9F9F900E6E6E600A3A2A200898B8C008B91950089909400888F9300888F
      9300888E9200888B8F00898E93008A9196008B9297008C9399008E959B009198
      9C00959A9E00989DA0009B9FA20074747400D0CFCF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFD00F9F9F900E6E6E600A2A2A2008A8A
      8A00909090008F8F8F008E8E8E008E8E8E008D8D8D008B8B8B008E8E8E009090
      900091919100929292009494940097979700999999009C9C9C009E9E9E007474
      7400CFCFCF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDD8D300DFDB
      D600E9E6E100C7C3BE00B7B2AD00BDB8B300C0BCB600C0BDB700C3BFBB00C3C0
      BD00E0DDDA00F2F0ED00EFEDEA00F1EEEC00F2F0ED00F2F0ED00F2F1ED00F2F0
      ED00F1EFED00F0EEEB00EFEDEA00EEECE900EDEBE800EAEAE600E4EAE200E1EC
      E400C6E6D500C0E5D300DFEAE100DEE5DC00DEDED700DDD8D300000000000000
      00000000000000000000D8D8D800DADADA00E5E5E500C2C2C200B2B2B200B8B8
      B800BBBBBB00BCBCBC00BFBFBF00C0C0C000DDDDDD00EFEFEF00ECECEC00EEEE
      EE00EFEFEF00EFEFEF00F0F0F000EFEFEF00EFEFEF00EDEDED00ECECEC00EBEB
      EB00EAEAEA00E8E8E800E5E5E500E5E5E500D5D5D500D2D2D200E3E3E300DFDF
      DF00DBDBDB00D8D8D800000000000000000000000000FEFEFE00FDFDFD00FDFD
      FD00F9F9F900E9E9E900D6D8D900D0C2BA00CBAC9900CFAF9C00D2AF9A00D3AF
      9700D6B09600DDC2AC00DCB59500DCA98200DEA67A00E0A47500E0A27000DB99
      6700D58D5B00D2814C00DF9767008F8E8D0080818200ECECEC00F8F7F800F8F7
      F800F9F9F900FAFAFA00FDFCFD00000000000000000000000000000000000000
      000000000000FEFEFE00FDFDFD00FDFDFD00F9F9F900E9E9E900D7D7D700C4C4
      C400B0B0B000B3B3B300B3B3B300B3B3B300B4B4B400C3C3C300B7B7B700ADAD
      AD00AAAAAA00A8A8A800A6A6A6009E9E9E00949494008A8A8A009F9F9F008E8E
      8E0081818100ECECEC00F7F7F700F7F7F700F9F9F900FAFAFA00FCFCFC000000
      00000000000000000000000000000000000000000000FCFCFB00DBD6D000E4E1
      DA00E7E4DF00D9D4D000D2CEC800D5D1CD00D7D3CE00D8D5CF00DAD7D300DBD8
      D500E9E6E300F1EFEC00F1EEEB00F1EFEC00F2F0ED00F3F1EE00F3F1EE00F2F1
      EE00F1F0ED00F1EEEC00F0EDEB00EFEDEA00EEEBE800EBEAE600E7EAE300E2EA
      E200E2ECE300E2EBE200DFE7DF00E1E5DE00E3E2DB00DBD6D000FCFCFB000000
      000000000000FBFBFB00D5D5D500DFDFDF00E3E3E300D4D4D400CDCDCD00D1D1
      D100D2D2D200D4D4D400D6D6D600D8D8D800E6E6E600EEEEEE00EEEEEE00EEEE
      EE00EFEFEF00F0F0F000F0F0F000F0F0F000EFEFEF00EEEEEE00EDEDED00ECEC
      EC00EBEBEB00E9E9E900E6E6E600E4E4E400E5E5E500E5E5E500E1E1E100E1E1
      E100E0E0E000D5D5D500FBFBFB0000000000FEFEFE00FCFCFC00F8F8F800F2F2
      F200EBEBEB00E7E7E700B0B4B700DEC7BA00D65F1500D9621500DE6D1C00E071
      1700EDB17F00ECC7A200D8843400D4701900D4721B00DB7E2300DE822600D173
      1D00CA671700C45E1400C25E1900CAB8AB005F646700A2A2A200BFBFBF00BCBC
      BC00BCBCBC00BBBABB00BBBBBB00D2D2D200FBFBFB0000000000000000000000
      0000FEFEFE00FCFCFC00F8F8F800F2F2F200EBEBEB00E7E7E700B3B3B300CACA
      CA006E6E6E00707070007777770078787800B4B4B400C7C7C700858585007474
      7400757575007E7E7E0082828200757575006D6D6D006767670068686800B9B9
      B90063636300A2A2A200BFBFBF00BCBCBC00BCBCBC00BABABA00BBBBBB00D2D2
      D200FBFBFB0000000000000000000000000000000000F7F7F600DBD7D100E7E4
      E000E5E2DE00E8E5E100EAE7E200EBE8E300ECE9E500EDEAE700EFECE900F0EE
      EB00F0EDEB00F0EDEB00F1EEEB00F1EFED00F2F0EE00F3F1EF00F3F1EF00F2F0
      EE00F1EFED00F1EFEB00F0EEEB00EFEDEA00EEEBE800EBEAE600E8E9E400E6E8
      E300E3E8E100E2E6E000E3E5DF00E4E4DF00E6E4E000DBD7D100F8F7F6000000
      000000000000F6F6F600D6D6D600E3E3E300E1E1E100E4E4E400E6E6E600E7E7
      E700E8E8E800EAEAEA00ECECEC00EDEDED00EDEDED00EDEDED00EEEEEE00EFEF
      EF00F0F0F000F1F1F100F1F1F100F0F0F000EFEFEF00EEEEEE00EDEDED00ECEC
      EC00EBEBEB00E9E9E900E7E7E700E5E5E500E4E4E400E2E2E200E2E2E200E2E2
      E200E3E3E300D6D6D600F7F7F7000000000000000000F3F3F300AFAFAF008A8A
      8A0084848400828282005252520090979E00EDB98D00E4822700E8923C00E491
      3800E19D5400D78C3B00D6862C00DC943C00E39C4400E7A44C00E4A24D00DC97
      4800C0783800A05C2E00793D1E00AB9082006F72740041414100626262006161
      610061616100606060005E5E5E0067676700CCCCCC0000000000000000000000
      000000000000F3F3F300AFAFAF008A8A8A008484840082828200525252009797
      9700BBBBBB0084848400929292008F8F8F009B9B9B008A8A8A00828282008E8E
      8E00969696009D9D9D009B9B9B00939393007A7A7A0063636300464646009494
      94007171710041414100626262006161610061616100606060005E5E5E006767
      6700CCCCCC0000000000000000000000000000000000F2F0EF00D0C9C200D6D0
      CA00D5CFC900D5CFC900D5D0C900D5D0C900D6D0CA00D6D1CA00D6D1CB00D7D1
      CB00D7D2CB00D7D2CC00D7D2CC00D7D2CC00D8D2CC00D8D2CC00D8D2CC00D8D2
      CC00D7D2CC00D7D2CC00D7D2CC00D7D2CC00D7D1CB00D6D1CB00D6D1CA00D6D0
      CA00D5D0C900D5D0C900D5D0C900D5CFC900D6D0CA00CFC8C100F2F0EF000000
      000000000000F0F0F000C9C9C900D0D0D000CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00D0D0D000D0D0D000D0D0D000D1D1D100D1D1D100D1D1D100D1D1D100D1D1
      D100D2D2D200D2D2D200D2D2D200D2D2D200D1D1D100D1D1D100D1D1D100D1D1
      D100D1D1D100D0D0D000D0D0D000D0D0D000CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00D0D0D000C8C8C800F0F0F0000000000000000000F9F9F9008F8F8F005F5E
      5F0065656500656565006868680045474900C0BDBA00EEAE6200F9B65C00F4BC
      6600EFB65F00FBCF8400F8CD8000EFC37300D0A56200B08650008C5E39007B50
      35006949360058463A004B3D3100665C54007E7F8000434343006E6E6E006C6C
      6C006C6C6C006D6D6D006F6F6F005050500081818100F4F4F400000000000000
      000000000000F9F9F9008F8F8F005E5E5E006565650065656500686868004747
      4700BDBDBD00AAAAAA00AEAEAE00B2B2B200ACACAC00C4C4C400C1C1C100B7B7
      B7009D9D9D008282820061616100555555004D4D4D00484848003D3D3D005C5C
      5C007F7F7F00434343006E6E6E006C6C6C006C6C6C006D6D6D006F6F6F005050
      500081818100F4F4F400000000000000000000000000EDEBE800DEDAD400EAE7
      E200E9E6E100EAE7E300EBE8E400ECEAE500EDEAE600EDEBE700EEEBE700EEEC
      E800EEECE800EFECE900EFECE900EFEDE900EFEDE900EFEDE900EFEDE900EFED
      E900EFEDE900EFECE900EFECE900EFECE800EEECE800EEEBE800EDEBE700EDEA
      E600EDEAE500EBE9E500EBE7E300EAE6E200EBE8E300DDD8D300EBE9E6000000
      000000000000EAEAEA00D9D9D900E6E6E600E5E5E500E6E6E600E7E7E700E9E9
      E900E9E9E900EAEAEA00EAEAEA00EBEBEB00EBEBEB00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00EBEB
      EB00EBEBEB00EBEBEB00EAEAEA00E9E9E900E9E9E900E8E8E800E7E7E700E6E6
      E600E7E7E700D8D8D800E8E8E800000000000000000000000000AEAEAE006B6B
      6B007474740074747400767676006666660064636600AFB4AB006AA0930078B5
      AB0077B7B3007FB9B3007BBBBA006FADA8004E8E960043869300468D99004C92
      98004793A1004C9BA700488D98004A8F9800868D8C005A585800747474007373
      73007373730073737300777777005353530047474700C9C9C900000000000000
      00000000000000000000AEAEAE006B6B6B007474740074747400767676006666
      660064646400AFAFAF00898989009D9D9D00A0A0A000A3A3A300A5A5A5009696
      96007B7B7B0074747400797979007C7C7C007E7E7E0084848400797979007B7B
      7B008A8A8A005858580074747400737373007373730073737300777777005353
      530047474700C9C9C900000000000000000000000000F1EFED00DFDBD600EAE7
      E200E9E6E200EBE8E300ECE9E500EDEAE600EDEBE700EEECE800EEECE900F0ED
      EA00F0EDEA00F0EEEB00F1EEEB00F1EEEC00F1EFEC00F1EFEC00F1EFEC00F1EF
      EC00F1EEEC00F1EEEB00F1EEEB00F0EEEB00F0EDEA00EFECEA00EEECE800EEEB
      E700EDEBE700ECEAE500EBE8E400EAE6E200EBE8E300DDD9D400F0EEEC000000
      000000000000EFEFEF00DADADA00E6E6E600E5E5E500E7E7E700E8E8E800E9E9
      E900EAEAEA00EBEBEB00EBEBEB00EDEDED00EDEDED00EDEDED00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EDED
      ED00EDEDED00ECECEC00EBEBEB00EAEAEA00EAEAEA00E9E9E900E7E7E700E6E6
      E600E7E7E700D8D8D800EEEEEE00000000000000000000000000B6B6B6007171
      71007A7A7A007A7A7A007A7A7A007E7E7E0064636200787B7F00437F8E002776
      8B003477840038767F00377A8700377683003E7B8400427A7D0039758000356D
      7800376D740038616200365F620033636700455353004F4D4D007D7D7D007A7A
      7A007A7A7A007A7A7A007E7E7E00585858002E2E2E0096969600FCFCFC000000
      00000000000000000000B6B6B600717171007A7A7A007A7A7A007A7A7A007E7E
      7E00636363007B7B7B0070707000626262006565650064646400686868006565
      65006969690068686800646464005E5E5E005D5D5D0053535300525252005454
      54004E4E4E004D4D4D007D7D7D007A7A7A007A7A7A007A7A7A007E7E7E005858
      58002E2E2E0096969600FCFCFC000000000000000000F6F5F400DDD8D300EBE8
      E300EAE7E200EBE9E500EDEAE600EDEBE700EEECE800EEECE900F0EDEA00F0ED
      EA00F1EEEB00F1EEEB00F1EFEC00F2F0EC00F2F0ED00F2F0ED00F2F0ED00F2F0
      ED00F2F0EC00F1EFEC00F1EEEC00F1EEEB00F0EEEB00F0EDEA00EFECE900EEEC
      E800EEEBE700EDEAE600ECE9E500EAE7E300ECE8E400DBD6D000F5F4F3000000
      000000000000F5F5F500D8D8D800E7E7E700E6E6E600E8E8E800E9E9E900EAEA
      EA00EBEBEB00EBEBEB00EDEDED00EDEDED00EEEEEE00EEEEEE00EEEEEE00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EEEEEE00EEEEEE00EEEE
      EE00EDEDED00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E6E6
      E600E8E8E800D5D5D500F4F4F400000000000000000000000000B7B7B7007777
      7700808080008080800080808000858585006161610035333300363839001C2E
      31001D3033001B2D3100222B29001B2628001E2727001E2828001D2627001B25
      26001A2426001A202000191E1D00181F2100161D1F003C3C3B00858585008080
      80008080800080808000858585005A5A5A002323230072727200F2F3F2000000
      00000000000000000000B7B7B700777777008080800080808000808080008585
      8500616161003333330037373700292929002A2A2A0028282800272727002323
      230024242400242424002323230022222200212121001E1E1E001C1C1C001D1D
      1D001B1B1B003B3B3B0085858500808080008080800080808000858585005A5A
      5A002323230072727200F2F2F2000000000000000000FAFAF900DED9D400EBE8
      E300EBE8E300EDE9E500EEEBE700EEEBE800EFECE900F0EDEA00F0EDEA00F1EE
      EB00F1EFEC00F2EFEC00F2F0ED00F2F0ED00F3F0ED00F3F1ED00F3F1ED00F3F1
      ED00F2F0ED00F2F0ED00F2F0EC00F1EFEC00F1EEEB00F0EDEA00F0EDEA00EFEC
      E900EEEBE800EEEBE700EDEAE600EBE8E400ECE8E400DBD6D000FAFAF9000000
      000000000000F9F9F900D9D9D900E7E7E700E7E7E700E9E9E900EAEAEA00EBEB
      EB00ECECEC00EDEDED00EDEDED00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEF
      EF00F0F0F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEFEF00EEEE
      EE00EEEEEE00EDEDED00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E7E7
      E700E8E8E800D5D5D500F9F9F900000000000000000000000000C6C6C6009191
      91009898980098989800989798009D9D9D007F7F7F0027272700201F1F002423
      23002523230028262600292828002C2B2B002E2E2E002E2D2D002F2E2D003130
      300034323200373635003A3A3A003B3A390034343400616161009D9D9D009898
      980098989800989898009F9F9F00676767001D1D1D006A6A6A00FCFCFC000000
      00000000000000000000C6C6C600919191009898980098989800979797009D9D
      9D007F7F7F00272727001F1F1F00232323002323230026262600282828002B2B
      2B002E2E2E002D2D2D002E2E2E003030300032323200363636003A3A3A003A3A
      3A0034343400616161009D9D9D009898980098989800989898009F9F9F006767
      67001D1D1D006A6A6A00FCFCFC000000000000000000FEFEFE00DEDAD500EBE8
      E300ECEAE500EDEBE700EEECE800EFEDE900F0EDEA00F0EEEB00F1EFEB00F1F0
      EC00F2F0ED00F2F1ED00F3F1EE00F3F2EE00F3F2EF00F3F2EF00F3F2EF00F3F2
      EF00F3F2EE00F3F1EE00F2F1EE00F2F1ED00F2F0EC00F1EFEC00F0EEEB00F0EE
      EA00EFEDE900EEECE800EDEBE700ECEAE500EBE8E400DDD8D300FEFEFE000000
      000000000000FEFEFE00D9D9D900E7E7E700E9E9E900EAEAEA00EBEBEB00ECEC
      EC00EDEDED00EDEDED00EEEEEE00EFEFEF00EFEFEF00F0F0F000F0F0F000F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F0F0F000F0F0F000F0F0
      F000EFEFEF00EEEEEE00EDEDED00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9
      E900E7E7E700D8D8D800FEFEFE00000000000000000000000000DBDBDB00B6B6
      B600BCBCBC00BDBBBC00BEBBBE00BABABA00BBBBBB00ABABAB00A6A6A600A7A6
      A600A8A8A800A9A9A900ACACAC00AFAFAF00B2B2B200B2B2B200B3B3B300B4B4
      B400B5B5B500B7B7B700B9B9B900BBBBBB00BBBBBB00BDBDBD00BABABA00B9BA
      BA00BDB8B700BCB8B700C2C3C300797979001A1A1A0067676700000000000000
      00000000000000000000DBDBDB00B6B6B600BCBCBC00BCBCBC00BDBDBD00BABA
      BA00BBBBBB00ABABAB00A6A6A600A6A6A600A8A8A800A9A9A900ACACAC00AFAF
      AF00B2B2B200B2B2B200B3B3B300B4B4B400B5B5B500B7B7B700B9B9B900BBBB
      BB00BBBBBB00BDBDBD00BABABA00B9B9B900B9B9B900B9B9B900C2C2C2007979
      79001A1A1A006767670000000000000000000000000000000000E2DED900EAE7
      E300EDEBE700EEECE800EFEDE900F0EDEA00F0EEEB00F1EFEC00F2F0ED00F2F1
      EE00F3F1EE00F3F2EF00F4F2F000F4F3F000F4F3F100F4F3F100F4F3F100F4F3
      F100F4F3F000F4F2F000F3F2EF00F3F1EE00F2F1EE00F2F0ED00F1EFEC00F1EE
      EB00F0EEEA00EFEDEA00EEECE900EEECE800E9E7E200DFDBD600000000000000
      00000000000000000000DDDDDD00E6E6E600EAEAEA00EBEBEB00ECECEC00EDED
      ED00EDEDED00EEEEEE00EFEFEF00F0F0F000F0F0F000F1F1F100F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F1F1F100F0F0
      F000F0F0F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00EBEBEB00EBEB
      EB00E6E6E600DADADA0000000000000000000000000000000000DBDBDB00AAA9
      AA00A7A9A80090C0950083C28800AEB7AF00B2B1B200B5B5B500B6B6B600B6B6
      B600B6B6B600B5B5B500B5B5B500B5B5B500B4B4B400B4B4B400B3B3B300B3B3
      B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B2B2B200B1B1B100B4B1
      B000B2CED400B5CACF00B9B7B600757575002222220064646400000000000000
      00000000000000000000DBDBDB00A9A9A900A8A8A800A1A1A10099999900B1B1
      B100B1B1B100B5B5B500B6B6B600B6B6B600B6B6B600B5B5B500B5B5B500B5B5
      B500B4B4B400B4B4B400B3B3B300B3B3B300B3B3B300B3B3B300B3B3B300B3B3
      B300B3B3B300B2B2B200B1B1B100B1B1B100C6C6C600C4C4C400B7B7B7007575
      7500222222006464640000000000000000000000000000000000E6E2DF00E7E5
      E000EFEDE900EFECE900F0EDEA00F1EEEB00F1EFEC00F2F0ED00F2F0EE00F3F1
      EE00F3F2F000F4F2F000F4F3F100F4F3F100F5F3F200F5F4F200F5F4F200F5F3
      F200F5F3F100F4F3F100F4F2F000F3F2F000F3F1EF00F3F1EE00F2F0ED00F1EF
      EC00F1EEEB00F0EDEA00EFECEA00EFEDEA00E7E4DF00E4E1DD00000000000000
      00000000000000000000E2E2E200E4E4E400ECECEC00ECECEC00EDEDED00EEEE
      EE00EEEEEE00EFEFEF00F0F0F000F0F0F000F1F1F100F2F2F200F2F2F200F2F2
      F200F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F2F2F200F2F2F200F1F1
      F100F1F1F100F0F0F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00ECEC
      EC00E3E3E300E0E0E00000000000000000000000000000000000D8D8D8008C8A
      8B00989A990060C0650051CB56008B9F8E009391920099989800A1A1A100A0A0
      A000A0A0A000A0A0A000A0A0A0009F9F9F009F9F9F009F9F9F009E9E9E009D9D
      9D009C9C9C009B9B9B009A9A9A0099999900989898009898980098989800A89B
      9A0069E1EC007BDAE300AEA2A00071717100353535006C6C6C00000000000000
      00000000000000000000D8D8D8008B8B8B0099999900818181007B7B7B009292
      92009292920098989800A1A1A100A0A0A000A0A0A000A0A0A000A0A0A0009F9F
      9F009F9F9F009F9F9F009E9E9E009D9D9D009C9C9C009B9B9B009A9A9A009999
      99009898980098989800989898009F9F9F00BCBCBC00BDBDBD00A5A5A5007171
      7100353535006C6C6C0000000000000000000000000000000000EBE9E600E6E3
      DE00F0EEEA00F0EDEA00F0EEEB00F1EFEC00F2F0ED00F2F1EE00F3F1EF00F4F2
      F000F4F3F100F5F3F100F5F4F200F5F4F200F6F5F300F6F5F300F6F5F300F6F5
      F300F5F4F200F5F4F200F5F3F100F4F3F100F4F2F000F3F2EF00F3F1EE00F2F0
      ED00F1F0EC00F1EEEC00F0EEEB00F1EFEC00E5E2DD00E9E6E300000000000000
      00000000000000000000E8E8E800E2E2E200EDEDED00EDEDED00EDEDED00EEEE
      EE00EFEFEF00F0F0F000F1F1F100F2F2F200F2F2F200F3F3F300F3F3F300F3F3
      F300F4F4F400F4F4F400F4F4F400F4F4F400F3F3F300F3F3F300F3F3F300F2F2
      F200F2F2F200F1F1F100F0F0F000EFEFEF00EFEFEF00EEEEEE00EDEDED00EEEE
      EE00E1E1E100E6E6E60000000000000000000000000000000000EAEAEA00B0AF
      B000BABBBB00ADCAB100ADD2B200B9BFBB00C5C4C600929293005C5C5C006060
      60005E5E5E0059595900525252004F4F4F004E4E4E004C4C4C004A4A4A004646
      460043434300414141003F3F3F003E3E3E003535350058585800E7E7E900F2EA
      E900B1EAFA0075DEFD00FEF7F600BBBBBC004343430078787800000000000000
      00000000000000000000EAEAEA00AFAFAF00BABABA00B8B8B800BBBBBB00BBBB
      BB00C5C5C500929292005C5C5C00606060005E5E5E0059595900525252004F4F
      4F004E4E4E004C4C4C004A4A4A004646460043434300414141003F3F3F003E3E
      3E003535350058585800E7E7E700ECECEC00DCDCDC00C5C5C500F9F9F900BBBB
      BB00434343007878780000000000000000000000000000000000F1EFED00E8E5
      E000F3F1EF00F1EEEB00F1EFEC00F2F0ED00F3F1EE00F3F1EE00F4F2F000F4F3
      F000F5F3F100F5F4F200F6F4F200F6F5F300F7F5F300F7F5F400F7F5F400F7F5
      F300F6F5F300F6F4F200F6F4F200F5F3F100F5F3F100F4F2F000F4F2EF00F3F1
      EE00F2F0ED00F2EFEC00F1EEEB00F3F0EE00E2DEDA00EFEDEB00000000000000
      00000000000000000000EFEFEF00E4E4E400F1F1F100EEEEEE00EEEEEE00EFEF
      EF00F0F0F000F0F0F000F2F2F200F2F2F200F3F3F300F3F3F300F4F4F400F4F4
      F400F5F5F500F5F5F500F5F5F500F5F5F500F4F4F400F4F4F400F4F4F400F3F3
      F300F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00EFEFEF00EEEEEE00F0F0
      F000DEDEDE00EDEDED000000000000000000000000000000000000000000F0F0
      F100E5E5E600E8E6E800E8E5E800E8E8E900F1F1F200B8B8B8002A2A2A003535
      350046464600494949004A4A4A004C4C4C004D4D4D004E4E4E00505050005252
      5200545454005555550057575700595959005858580066666600DDDDDE00E7E7
      E800E7E5E600D7E4EA00E8E9EA00D9D9DA005E5E5E0082828200000000000000
      0000000000000000000000000000F0F0F000E5E5E500E7E7E700E7E7E700E8E8
      E800F1F1F100B8B8B8002A2A2A003535350046464600494949004A4A4A004C4C
      4C004D4D4D004E4E4E0050505000525252005454540055555500575757005959
      59005858580066666600DDDDDD00E7E7E700E6E6E600E1E1E100E9E9E900D9D9
      D9005E5E5E008282820000000000000000000000000000000000F5F4F200E6E3
      DF00F7F4F300F4F2F000F3F1EF00F3F1EE00F3F1EE00F3F2F000F4F2F000F4F3
      F100F5F4F200F5F4F200F6F5F300F6F5F400F7F6F400F7F6F400F7F6F500F7F6
      F400F6F5F400F6F5F300F6F4F300F5F4F200F5F3F100F4F3F100F4F2F000F3F1
      EF00F2F1EE00F2F0ED00F1EEEC00F3F1EF00DFDBD600F4F3F100000000000000
      00000000000000000000F3F3F300E2E2E200F4F4F400F2F2F200F1F1F100F0F0
      F000F0F0F000F1F1F100F2F2F200F2F2F200F3F3F300F3F3F300F4F4F400F5F5
      F500F5F5F500F5F5F500F6F6F600F5F5F500F5F5F500F4F4F400F4F4F400F3F3
      F300F3F3F300F2F2F200F2F2F200F1F1F100F0F0F000EFEFEF00EEEEEE00F1F1
      F100DADADA00F2F2F2000000000000000000000000000000000000000000F8F8
      F800D7D8D700D7D7D700D8D8D800D8D8D800D9D9D900DBDBDB006C6C6C004B4B
      4B006E6E6E006D6D6D006A6A6A006A6A6A006B6B6B006E6E6E006F6F6F007171
      7100747474007575750077777700797979007B7B7B0077777700B5B5B500CECE
      CE00CBCACA00CECBC900CACACA00D1D1D1008282820088888800000000000000
      0000000000000000000000000000F8F8F800D7D7D700D7D7D700D8D8D800D8D8
      D800D9D9D900DBDBDB006C6C6C004B4B4B006E6E6E006D6D6D006A6A6A006A6A
      6A006B6B6B006E6E6E006F6F6F00717171007474740075757500777777007979
      79007B7B7B0077777700B5B5B500CECECE00CACACA00CBCBCB00CACACA00D1D1
      D100828282008888880000000000000000000000000000000000F9F9F800E4E0
      DC00F7F5F300F5F4F100F5F5F200F6F5F200F5F3F200F5F3F100F5F3F100F5F4
      F200F6F4F200F6F5F300F7F5F400F7F6F400F7F6F500F8F6F500F8F7F500F7F6
      F500F7F6F400F7F5F400F6F5F300F6F5F300F5F4F200F5F3F100F4F3F100F4F2
      F000F3F2EE00F3F1EE00F2F0EC00F4F2EE00DED9D400F9F9F800000000000000
      00000000000000000000F8F8F800E0E0E000F5F5F500F3F3F300F4F4F400F4F4
      F400F3F3F300F3F3F300F3F3F300F3F3F300F4F4F400F4F4F400F5F5F500F5F5
      F500F6F6F600F6F6F600F6F6F600F6F6F600F5F5F500F5F5F500F4F4F400F4F4
      F400F3F3F300F3F3F300F2F2F200F2F2F200F1F1F100F0F0F000EFEFEF00F1F1
      F100D9D9D900F8F8F80000000000000000000000000000000000000000000000
      0000F5F5F500E1E1E100E2E2E200E4E4E400E4E4E400E9E9E900CDCDCD009F9F
      9F00C2C2C200C4C4C400BCBCBC00B5B5B500AEAEAE00A7A7A700A3A3A300A0A0
      A0009F9F9F009F9F9F009F9F9F009F9F9F00A1A1A1009C9C9C00B9B9B900D3D3
      D300D0D0D100D3D3D300D7D7D700E1E1E100BCBCBC0088888800000000000000
      000000000000000000000000000000000000F5F5F500E1E1E100E2E2E200E4E4
      E400E4E4E400E9E9E900CDCDCD009F9F9F00C2C2C200C4C4C400BCBCBC00B5B5
      B500AEAEAE00A7A7A700A3A3A300A0A0A0009F9F9F009F9F9F009F9F9F009F9F
      9F00A1A1A1009C9C9C00B9B9B900D3D3D300D0D0D000D3D3D300D7D7D700E1E1
      E100BCBCBC008888880000000000000000000000000000000000FDFCFC00E3DF
      DB00F6F5F300F5F4F200F6F5F200F6F5F400F7F5F500F8F6F500F7F6F400F7F6
      F400F6F5F300F7F5F400F7F6F400F7F6F400F8F6F500F8F7F500F8F7F500F8F7
      F500F7F6F500F7F6F400F7F5F400F6F5F300F6F4F300F5F4F200F5F3F100F4F3
      F000F4F2F000F3F1EF00F2F0ED00F2F1EE00DDD9D300FDFDFD00000000000000
      00000000000000000000FCFCFC00DFDFDF00F4F4F400F3F3F300F4F4F400F5F5
      F500F5F5F500F6F6F600F5F5F500F5F5F500F4F4F400F5F5F500F5F5F500F5F5
      F500F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F5F5F500F5F5F500F4F4
      F400F4F4F400F3F3F300F3F3F300F2F2F200F2F2F200F1F1F100EFEFEF00F0F0
      F000D8D8D800FDFDFD0000000000000000000000000000000000000000000000
      000000000000FAFAFA00EBEBEB00E7E7E700E5E5E500E5E5E500E8E8E800CECE
      CE00D4D4D400DFDFDF00DEDEDE00DEDEDE00DFDFDF00DFDFDF00E0E0E000DFDF
      DF00DCDCDC00DBDBDB00DADADA00D9D9D900DBDBDB00D6D6D600C9C9C900E9E9
      E900E7E7E800E8E8E800E8E8E800E9E9E900E4E4E400C6C6C700000000000000
      00000000000000000000000000000000000000000000FAFAFA00EBEBEB00E7E7
      E700E5E5E500E5E5E500E8E8E800CECECE00D4D4D400DFDFDF00DEDEDE00DEDE
      DE00DFDFDF00DFDFDF00E0E0E000DFDFDF00DCDCDC00DBDBDB00DADADA00D9D9
      D900DBDBDB00D6D6D600C9C9C900E9E9E900E7E7E700E8E8E800E8E8E800E9E9
      E900E4E4E400C6C6C6000000000000000000000000000000000000000000E4E0
      DC00F4F3F100F6F5F200F6F5F400F7F5F400F7F6F500F8F7F500F8F7F500F8F8
      F600F8F8F600F8F7F600F8F7F600F8F7F600F8F7F500F8F7F500F8F7F500F8F7
      F500F7F6F500F7F6F400F7F6F400F6F5F400F6F5F300F5F4F200F5F4F200F4F3
      F100F4F3F100F3F2F000F4F2EF00F0EEEB00DFDBD70000000000000000000000
      0000000000000000000000000000E0E0E000F2F2F200F4F4F400F5F5F500F5F5
      F500F6F6F600F6F6F600F6F6F600F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F5F5F500F5F5F500F5F5
      F500F4F4F400F3F3F300F3F3F300F2F2F200F2F2F200F1F1F100F1F1F100EDED
      ED00DBDBDB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFCFC00F8F8F800F9F9F900FBFBFB00FAFA
      FA00E1E1E100E0E0E000E0E0E000E1E1E100E1E1E100E3E3E300E5E5E500E4E4
      E400E3E3E300E3E3E300E4E4E400E4E4E400E7E7E700D9D9D900A1A1A1000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00F8F8F800F9F9F900FBFBFB00FAFAFA00E1E1E100E0E0E000E0E0E000E1E1
      E100E1E1E100E3E3E300E5E5E500E4E4E400E3E3E300E3E3E300E4E4E400E4E4
      E400E7E7E700D9D9D900A1A1A100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E6E3
      E000F1F0ED00F8F6F500F7F6F400F7F6F500F8F7F500F8F7F500F8F8F600F8F8
      F600F9F8F700F9F8F700F9F8F800F9F9F800FAF9F800F9F9F700F9F8F700F9F8
      F600F8F7F600F8F7F500F7F6F400F7F6F400F6F5F300F6F4F300F5F4F200F5F3
      F200F4F3F100F4F2F000F5F3F200EDEBE800E3DFDB0000000000FFFEFE000000
      0000000000000000000000000000E3E3E300EFEFEF00F6F6F600F5F5F500F6F6
      F600F6F6F600F6F6F600F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8
      F800F9F9F900F8F8F800F8F8F800F7F7F700F7F7F700F6F6F600F5F5F500F5F5
      F500F4F4F400F4F4F400F3F3F300F3F3F300F2F2F200F2F2F200F3F3F300EAEA
      EA00DFDFDF0000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EEEEEE00ECECEC00EDEDED00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00EBEBEB00E9E9E900AAAAAA00F7F7
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EEEEEE00ECECEC00EDEDED00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECEC
      EC00EBEBEB00E9E9E900AAAAAA00F7F7F7000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFE0000000000ECE9
      E600EFECE900F9F7F600F7F6F500F8F6F500F8F7F500F8F7F600F8F8F600F9F8
      F700F9F8F700F9F8F800FAF8F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9
      F800FAF9F800FAF8F800F9F8F800F9F8F600F8F7F600F7F6F500F7F6F400F6F5
      F300F6F5F200F5F3F200F7F6F400EAE7E300E9E6E30000000000FFFEFE000000
      000000000000FEFEFE0000000000E9E9E900ECECEC00F7F7F700F6F6F600F6F6
      F600F6F6F600F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8F800F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8F800F8F8F800F7F7
      F700F7F7F700F6F6F600F5F5F500F4F4F400F4F4F400F3F3F300F5F5F500E6E6
      E600E6E6E60000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F3F300EEEEEE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F3F3F300B5B5B500EBEB
      EB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300EEEEEE00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00F3F3F300B5B5B500EBEBEB000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0ED
      EB00EBE8E500FAF9F800F8F6F500F8F7F500F8F7F600F8F8F600F9F8F700F9F8
      F700F9F8F800F9F8F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9
      F800FAF9F800FAF9F800FAF8F800F9F8F800F9F8F700F9F8F700F8F8F600F8F8
      F600F8F7F500F8F6F400FBFAF900E8E5E200EDEBE90000000000000000000000
      0000000000000000000000000000EDEDED00E8E8E800F9F9F900F6F6F600F6F6
      F600F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8F800F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8F800F8F8
      F800F8F8F800F8F8F800F7F7F700F7F7F700F6F6F600F6F6F600FAFAFA00E5E5
      E500EBEBEB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9F900F3F3F300F4F4F400F4F4F400F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F6F6F600F6F6F600F4F4F400F9F9F900C7C7C700DCDC
      DC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900F3F3F300F4F4F400F4F4
      F400F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F6F6F600F6F6
      F600F4F4F400F9F9F900C7C7C700DCDCDC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F5F3
      F200E8E5E200FBF9F800F8F7F400F8F7F600F8F8F600F8F8F700F9F8F700F9F8
      F700F9F8F800F9F9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9
      F800FAF9F800FAF9F800FAF9F800F9F8F800F9F8F800F9F8F700F9F8F700F8F8
      F600F8F7F600F8F7F500FBFAF900E4E1DD00F4F2F10000000000000000000000
      0000000000000000000000000000F3F3F300E5E5E500F9F9F900F6F6F600F7F7
      F700F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8F800F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8
      F800F8F8F800F8F8F800F8F8F800F7F7F700F7F7F700F6F6F600FAFAFA00E0E0
      E000F2F2F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00F6F6F600F9F9F900F3F3F300F3F3F300F5F5F500F4F4F400F4F4
      F400F3F3F300F3F3F300F3F3F300F3F3F300F5F5F500FCFCFC00DDDDDD00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00F6F6F600F9F9F900F3F3
      F300F3F3F300F5F5F500F4F4F400F4F4F400F3F3F300F3F3F300F3F3F300F3F3
      F300F5F5F500FCFCFC00DDDDDD00CECECE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F8
      F700E5E2DE00FAF9F800F8F7F500F8F8F600F8F8F700F9F8F700F9F8F700F9F8
      F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9
      F800FAF9F800FAF9F800FAF9F800FAF9F800F9F8F800F9F8F800F9F8F700F8F8
      F700F8F8F600F8F8F600FAFAF800E2DEDA00F8F7F60000000000000000000000
      0000000000000000000000000000F8F8F800E1E1E100F9F9F900F6F6F600F7F7
      F700F7F7F700F8F8F800F8F8F800F8F8F800F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900F8F8F800F8F8F800F8F8F800F7F7F700F7F7F700F7F7F700F9F9F900DEDE
      DE00F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00F8F8F800F7F7F700F5F5F500F3F3F300F3F3F300F3F3F300F3F3
      F300F4F4F400F4F4F400F4F4F400F5F5F500F7F7F700F9F9F900EDEDED00E9E9
      E900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00F8F8F800F7F7F700F5F5
      F500F3F3F300F3F3F300F3F3F300F3F3F300F4F4F400F4F4F400F4F4F400F5F5
      F500F7F7F700F9F9F900EDEDED00E9E9E9000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FC00E5E1DE00F9F8F600F8F8F600F8F8F700F9F8F700F9F8F800F9F8F800F9F8
      F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9F800FAF9
      F800FAF9F800FAF9F800FAF9F800FAF9F800FAF8F800F9F8F800F9F8F800F9F8
      F700F8F8F700F8F8F700F8F8F600E1DCD800FDFDFD0000000000000000000000
      0000000000000000000000000000FCFCFC00E1E1E100F7F7F700F7F7F700F7F7
      F700F8F8F800F8F8F800F8F8F800F8F8F800F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900F8F8F800F8F8F800F8F8F800F8F8F800F7F7F700F7F7F700F7F7F700DCDC
      DC00FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700F5F5F500F5F5F500F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F3F3F300F1F1
      F100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700F5F5F500F5F5
      F500F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F3F3F300F1F1F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E4E0DC00F9F9F800FCFCFB00FCFBFB00FCFBFB00FCFCFB00FDFCFC00FDFC
      FC00FDFCFC00FDFCFC00FDFCFC00FDFDFC00FDFDFC00FEFDFC00FEFDFC00FDFD
      FC00FDFDFC00FDFDFC00FDFCFC00FDFCFC00FDFCFC00FDFCFC00FDFCFB00FCFB
      FB00FCFBFB00FCFCFB00F9F8F700E0DCD8000000000000000000000000000000
      000000000000000000000000000000000000E0E0E000F8F8F800FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FDFDFD00FDFDFD00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FBFBFB00FBFBFB00FBFBFB00F8F8F800DCDC
      DC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9F9F900EFEFEF00F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900EFEFEF00F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000EFEFEF00EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E9E6E300E4E0DC00EBE9E500EAE8E400EAE8E400EAE8E400EAE8E500EAE8
      E500EAE8E500EBE8E500EBE8E500EBE8E500EBE8E500EBE8E500EBE8E500EBE8
      E500EBE8E500EBE8E500EBE8E500EBE8E500EAE8E500EAE8E500EAE8E400EAE8
      E400EAE8E400EBE9E600E2DEDA00E7E4E0000000000000000000000000000000
      000000000000000000000000000000000000E6E6E600E0E0E000E8E8E800E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E8E8E800DEDEDE00E3E3
      E300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00F7F7F700F8F8F800F8F8F800F8F8F800F9F9F900F9F9
      F900F9F9F900FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBFBFB00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00F7F7F700F8F8
      F800F8F8F800F8F8F800F9F9F900F9F9F900F9F9F900FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FBFBFB00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFDFD00F0EEEC00ECEAE800EDEBE900EDEBE900EDEBE900EDEBE900EDEB
      E900EDEBE900EDEBE900EDEBE900EDEBE900EDEBE900EDEBE900EDEBE900EDEB
      E900EDEBE900EDEBE900EDEBE900EDEBE900EDEBE900EDEBE900EDEBE900EDEB
      E900EDEBE900ECEAE800F0EEEC00FEFEFD000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00EEEEEE00EAEAEA00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EAEAEA00EEEEEE00FDFD
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00E9E9E900D5D5D500FEFEFE000000000000000000FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00E9E9E900D5D5D500FEFE
      FE000000000000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFBFB00F4F2F000EDEAE600E8E5E100E7E3DF00E7E3DF00E8E5
      E100ECE9E600F2F0EE00FAFAF900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00F2F2F200E9E9
      E900E4E4E400E3E3E300E3E3E300E4E4E400E9E9E900F0F0F000F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE000000
      0000C3C3C30094949400AAAAAA00E4E4E400EEEEEE00F8F8F80000000000BCBC
      BC00D4D4D4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000C3C3C30094949400AAAAAA00E4E4
      E400EEEEEE00F8F8F80000000000BCBCBC00D4D4D40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8F7
      F500E2DED900DCD7D100DFDBD600E2DFDA00E3E1DD00E3E0DD00E3E0DC00E3E1
      DD00E2DFDB00DFDCD700DCD7D100E1DCD700F6F5F30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F6F6F600DDDDDD00D6D6D600DADADA00DEDE
      DE00E0E0E000E0E0E000DFDFDF00E0E0E000DEDEDE00DBDBDB00D6D6D600DCDC
      DC00F4F4F4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE0000000000FEFE
      FE00DFDFDF00F0F0F000F1F1F100A4A4A400979797009A9A9A00A4A4A400C2C2
      C200A3A3A300BBBBBB0000000000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE0000000000FEFEFE00DFDFDF00F0F0F000F1F1F100A4A4
      A400979797009A9A9A00A4A4A400C2C2C200A3A3A300BBBBBB0000000000FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFBFA00DAD5
      CE00EBE9E600EFEEED00E8E5E200DFDCD700DBD6D100D9D4CE00D9D4CE00DAD5
      D000DFDBD700E8E5E200EFEEED00ECEBE800DCD8D200F9F8F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBFBFB00D4D4D400E8E8E800EEEEEE00E5E5E500DBDB
      DB00D6D6D600D3D3D300D3D3D300D5D5D500DBDBDB00E5E5E500EEEEEE00EAEA
      EA00D7D7D700F8F8F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F7F700A9A9
      A900BDBDBD00F2F2F200EEEEEE00F1F1F100F0F0F000E6E6E600D5D5D500F1F1
      F100E2E2E200D8D8D80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F7F7F700A9A9A900BDBDBD00F2F2F200EEEEEE00F1F1
      F100F0F0F000E6E6E600D5D5D500F1F1F100E2E2E200D8D8D800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00DED9
      D300EAE8E500E8E4E100D6D1CA00DFDCD700E1DFDA00E3E0DC00E3E1DC00E2DF
      DB00DFDDD700D7D1CA00E8E5E200EBE9E700DDD8D200FBFBFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFD00D8D8D800E7E7E700E4E4E400D0D0D000DBDB
      DB00DEDEDE00DFDFDF00E0E0E000DEDEDE00DBDBDB00D0D0D000E5E5E500E9E9
      E900D7D7D700FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500BDBDBD00A6A6A600B5B5
      B500ECECEC00EFEFEF00F0F0F000EEEEEE00EFEFEF00F2F2F200F5F5F500E7E7
      E700C5C5C500B0B0B000FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5B5B500BDBDBD00A6A6A600B5B5B500ECECEC00EFEFEF00F0F0F000EEEE
      EE00EFEFEF00F2F2F200F5F5F500E7E7E700C5C5C500B0B0B000FBFBFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FB00EBE8E400D8D1CB00DFDCD600E9E9E600E6E5E200E6E5E100E6E5E100E6E5
      E100E9E9E600DFDCD600D8D1CB00EAE6E200FBFAF90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFB00E7E7E700D1D1D100DBDBDB00E8E8
      E800E4E4E400E4E4E400E4E4E400E4E4E400E8E8E800DBDBDB00D1D1D100E6E6
      E600FAFAFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D9D9D900A2A2A2009E9E9E00A9A9A900BFBF
      BF00D4D4D400E2E2E200DCDCDC00D7D7D700D7D7D700DCDCDC00E2E2E200D4D4
      D400B9B9B9009F9F9F00BDBDBD0000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D9D9
      D900A2A2A2009E9E9E00A9A9A900BFBFBF00D4D4D400E2E2E200DCDCDC00D7D7
      D700D7D7D700DCDCDC00E2E2E200D4D4D400B9B9B9009F9F9F00BDBDBD000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F5F300DEDAD500EDECEA00EBEAE600EBEAE700EBEAE700EBEA
      E600EDECEA00DEDAD500F6F5F300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4F4F400D9D9D900EBEB
      EB00E9E9E900E9E9E900E9E9E900E9E9E900EBEBEB00D9D9D900F4F4F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C2C2C200B5B5B500C1C1C100B7B7B700AFAF
      AF00B9B9B900D2D2D200E0E0E000DEDEDE00DDDDDD00DEDEDE00CFCFCF00B8B8
      B800B1B1B100B9B9B900AAAAAA009E9E9E00B1B1B10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C2C2
      C200B5B5B500C1C1C100B7B7B700AFAFAF00B9B9B900D2D2D200E0E0E000DEDE
      DE00DDDDDD00DEDEDE00CFCFCF00B8B8B800B1B1B100B9B9B900AAAAAA009E9E
      9E00B1B1B1000000000000000000000000000000000000000000FBFAFA00FBFA
      FA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFA
      FA00FCFBFA00F7F6F400DBD5CF00ECECE800EBE9E500EBEAE600EBEAE600EBE9
      E500ECECE800DBD5CF00F7F6F400FCFBFA00FBFAFA00FBFAFA00FBFAFA00FBFA
      FA00FBFAFA00FAFAF900FBFAFA00FBFAFA00FBFAFA00FBFAFA00000000000000
      00000000000000000000FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBFBFB00F5F5F500D5D5D500EAEA
      EA00E8E8E800E9E9E900E9E9E900E8E8E800EAEAEA00D5D5D500F5F5F500FBFB
      FB00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00F9F9F900FAFAFA00FAFA
      FA00FAFAFA00FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F5F5F500C8C8C800C6C6C600C5C5C500C3C3
      C300D3D3D300CDCDCD00DEDEDE00ECECEC00ECECEC00DBDBDB00CACACA00D0D0
      D000C3C3C300C6C6C600C6C6C600B7B7B700B8B8B800F3F3F300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F5F5
      F500C8C8C800C6C6C600C5C5C500C3C3C300D3D3D300CDCDCD00DEDEDE00ECEC
      EC00ECECEC00DBDBDB00CACACA00D0D0D000C3C3C300C6C6C600C6C6C600B7B7
      B700B8B8B800F3F3F30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F5F300DEDAD500EDECEA00EBEAE600EBEAE700EBEAE700EBEA
      E600EDECEA00DEDAD500F6F5F300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4F4F400D9D9D900EBEB
      EB00E9E9E900E9E9E900E9E9E900E9E9E900EBEBEB00D9D9D900F4F4F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0D0D000D5D5D500D4D4D400EBEB
      EB00E1E1E100D5D5D500F8F8F8000000000000000000F6F6F600D3D3D300E0E0
      E000E9E9E900D4D4D400D9D9D900DADADA00CBCBCB00F0F0F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0D0D000D5D5D500D4D4D400EBEBEB00E1E1E100D5D5D500F8F8F8000000
      000000000000F6F6F600D3D3D300E0E0E000E9E9E900D4D4D400D9D9D900DADA
      DA00CBCBCB00F0F0F00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F5F300DEDAD500EDECEA00EBEAE600EBEAE700EBEAE700EBEA
      E600EDECEA00DEDAD500F6F5F300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4F4F400D9D9D900EBEB
      EB00E9E9E900E9E9E900E9E9E900E9E9E900EBEBEB00D9D9D900F4F4F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFB00DCDCDC00E3E3E300E6E6E600F9F9
      F900E8E8E800F3F3F30000000000000000000000000000000000F0F0F000E7E7
      E700F7F7F700E5E5E500E3E3E300E0E0E000E9E9E900FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FB00DCDCDC00E3E3E300E6E6E600F9F9F900E8E8E800F3F3F300000000000000
      00000000000000000000F0F0F000E7E7E700F7F7F700E5E5E500E3E3E300E0E0
      E000E9E9E900FDFDFD0000000000000000000000000000000000FBFAFA00FBFA
      FA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFA
      FA00FCFBFA00F7F6F400DBD5CF00ECECE800EBE9E500EBEAE600EBEAE600EBE9
      E500ECECE800DBD5CF00F7F6F400FCFBFA00FBFAFA00FBFAFA00FBFAFA00FBFA
      FA00FBFAFA00FAFAF900FBFAFA00FBFAFA00FBFAFA00FBFAFA00000000000000
      00000000000000000000FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBFBFB00F5F5F500D5D5D500EAEA
      EA00E8E8E800E9E9E900E9E9E900E8E8E800EAEAEA00D5D5D500F5F5F500FBFB
      FB00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00F9F9F900FAFAFA00FAFA
      FA00FAFAFA00FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3F3F300B2B2B200D5D5D500EDEDED00EEEEEE00FCFC
      FC00E7E7E700E2E2E20000000000FEFEFE00FEFEFE0000000000E0E0E000E9E9
      E900FBFBFB00EDEDED00E9E9E900E6E6E600FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F3F3F300B2B2
      B200D5D5D500EDEDED00EEEEEE00FCFCFC00E7E7E700E2E2E20000000000FEFE
      FE00FEFEFE0000000000E0E0E000E9E9E900FBFBFB00EDEDED00E9E9E900E6E6
      E600FEFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F5F300DEDAD500EDECEA00EBEAE600EBEAE700EBEAE700EBEA
      E600EDECEA00DEDAD500F6F5F300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4F4F400D9D9D900EBEB
      EB00E9E9E900E9E9E900E9E9E900E9E9E900EBEBEB00D9D9D900F4F4F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE0000000000E5E5E500AFAFAF00DCDCDC00E2E2E200E7E7E700F8F8
      F800EAEAEA00AAAAAA00E6E6E6000000000000000000E1E1E100ACACAC00EBEB
      EB00F7F7F700E6E6E600DFDFDF00E9E9E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000E5E5E500AFAF
      AF00DCDCDC00E2E2E200E7E7E700F8F8F800EAEAEA00AAAAAA00E6E6E6000000
      000000000000E1E1E100ACACAC00EBEBEB00F7F7F700E6E6E600DFDFDF00E9E9
      E900000000000000000000000000000000000000000000000000FBFAFA00FBFA
      FA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFA
      FA00FCFBFA00F7F6F400DBD5CF00ECECE800EBE9E500EBEAE600EBEAE600EBE9
      E500ECECE800DBD5CF00F7F6F400FCFBFA00FBFAFA00FBFAFA00FBFAFA00FBFA
      FA00FBFAFA00FAFAF900FBFAFA00FBFAFA00FBFAFA00FBFAFA00000000000000
      00000000000000000000FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBFBFB00F5F5F500D5D5D500EAEA
      EA00E8E8E800E9E9E900E9E9E900E8E8E800EAEAEA00D5D5D500F5F5F500FBFB
      FB00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00F9F9F900FAFAFA00FAFA
      FA00FAFAFA00FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBFBFB00D7D7D700D2D2D200D5D5D500D6D6D600EEEE
      EE00E4E4E400C0C0C0008A8A8A009D9D9D009B9B9B008C8C8C00C1C1C100E3E3
      E300ECECEC00D6D6D600D4D4D400BCBCBC00ECECEC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBFBFB00D7D7
      D700D2D2D200D5D5D500D6D6D600EEEEEE00E4E4E400C0C0C0008A8A8A009D9D
      9D009B9B9B008C8C8C00C1C1C100E3E3E300ECECEC00D6D6D600D4D4D400BCBC
      BC00ECECEC000000000000000000000000000000000000000000FBFAFA00FBFA
      FA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFA
      FA00FCFBFA00F7F6F400DBD5CF00ECECE800EBE9E500EBEAE600EBEAE600EBE9
      E500ECECE800DBD5CF00F7F6F400FCFBFA00FBFAFA00FBFAFA00FBFAFA00FBFA
      FA00FBFAFA00FAFAF900FBFAFA00FBFAFA00FBFAFA00FBFAFA00000000000000
      00000000000000000000FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBFBFB00F5F5F500D5D5D500EAEA
      EA00E8E8E800E9E9E900E9E9E900E8E8E800EAEAEA00D5D5D500F5F5F500FBFB
      FB00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00F9F9F900FAFAFA00FAFA
      FA00FAFAFA00FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F2F2F200F6F6
      F6000000000000000000FEFEFE00D5D5D500DADADA00C7C7C700C4C4C400CBCB
      CB00D6D6D600CCCCCC00D2D2D200B8B8B800B9B9B900D2D2D200C8C8C800D4D4
      D400CBCBCB00C6C6C600CACACA00AAAAAA00B9B9B90000000000FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F2F2F200F6F6F6000000000000000000FEFEFE00D5D5
      D500DADADA00C7C7C700C4C4C400CBCBCB00D6D6D600CCCCCC00D2D2D200B8B8
      B800B9B9B900D2D2D200C8C8C800D4D4D400CBCBCB00C6C6C600CACACA00AAAA
      AA00B9B9B90000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F5F300DEDAD500EDECEA00EBEAE600EBEAE700EBEAE700EBEA
      E600EDECEA00DEDAD500F6F5F300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4F4F400D9D9D900EBEB
      EB00E9E9E900E9E9E900E9E9E900E9E9E900EBEBEB00D9D9D900F4F4F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0F0F000A3A3A30092929200D3D3
      D30000000000FEFEFE0000000000EAEAEA00DADADA00D9D9D900B2B2B200B1B1
      B100C4C4C400DDDDDD00E5E5E500E7E7E700E7E7E700E3E3E300DBDBDB00C2C2
      C200B3B3B300B6B6B600B7B7B700B7B7B700E8E8E80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0F0F000A3A3A30092929200D3D3D30000000000FEFEFE0000000000EAEA
      EA00DADADA00D9D9D900B2B2B200B1B1B100C4C4C400DDDDDD00E5E5E500E7E7
      E700E7E7E700E3E3E300DBDBDB00C2C2C200B3B3B300B6B6B600B7B7B700B7B7
      B700E8E8E8000000000000000000000000000000000000000000FBFAFA00FBFA
      FA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFAFA00FBFA
      FA00FCFBFA00F7F6F400DBD5CF00ECECE800EBE9E500EBEAE600EBEAE600EBE9
      E500ECECE800DBD5CF00F7F6F400FCFBFA00FBFAFA00FBFAFA00FBFAFA00FBFA
      FA00FBFAFA00FAFAF900FBFAFA00FBFAFA00FBFAFA00FBFAFA00000000000000
      00000000000000000000FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FBFBFB00F5F5F500D5D5D500EAEA
      EA00E8E8E800E9E9E900E9E9E900E8E8E800EAEAEA00D5D5D500F5F5F500FBFB
      FB00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00F9F9F900FAFAFA00FAFA
      FA00FAFAFA00FAFAFA0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1F1F100D2D2D200F1F1F100C1C1
      C100969696009F9F9F00B6B6B600B8B8B800A4A4A400A8A8A800BBBBBB00B4B4
      B400D1D1D100EAEAEA00EFEFEF00EDEDED00EDEDED00EFEFEF00E9E9E900CFCF
      CF00B0B0B000C5C5C500D2D2D200C8C8C8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1F1F100D2D2D200F1F1F100C1C1C100969696009F9F9F00B6B6B600B8B8
      B800A4A4A400A8A8A800BBBBBB00B4B4B400D1D1D100EAEAEA00EFEFEF00EDED
      ED00EDEDED00EFEFEF00E9E9E900CFCFCF00B0B0B000C5C5C500D2D2D200C8C8
      C8000000000000000000000000000000000000000000E8E5E100D9D3CD00DAD5
      CF00DAD5CF00DAD5CF00DAD5CF00DAD5CF00DAD5CF00DAD5CF00DAD5CF00DAD5
      CF00DAD5CF00DAD5CF00D7D1CA00D9D4CD00D9D4CD00D9D4CD00D9D4CD00D9D4
      CD00D9D4CD00D7D1CA00DAD5CF00DAD5CF00DAD5CF00DAD5CF00DAD5CF00DAD5
      CF00DAD5CF00E1D6D300DBD5D000DAD5CF00DAD5CF00D9D3CD00E8E5E1000000
      000000000000E4E4E400D3D3D300D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D0D0D000D3D3
      D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3D300D0D0D000D4D4D400D4D4
      D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D8D8D800D5D5D500D4D4
      D400D4D4D400D3D3D300E4E4E400000000000000000000000000000000000000
      0000000000000000000000000000E4E4E400A6A6A600E9E9E900F2F2F200E9E9
      E900DFDFDF00D9D9D900BFBFBF00D6D6D600F3F3F300C9C9C900BABABA00C3C3
      C300E6E6E600EDEDED00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00E3E3
      E300D9D9D900FAFAFA0000000000FCFCFC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E4E4
      E400A6A6A600E9E9E900F2F2F200E9E9E900DFDFDF00D9D9D900BFBFBF00D6D6
      D600F3F3F300C9C9C900BABABA00C3C3C300E6E6E600EDEDED00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00E3E3E300D9D9D900FAFAFA0000000000FCFC
      FC0000000000000000000000000000000000FEFEFE00DBD6D000E7E5E200E6E4
      DF00E6E4E000E6E4E000E6E4E000E6E4E000E6E4E000E6E4E000E6E4E000E6E4
      E000E6E4E000E6E4E000E7E5E200E6E4E100E6E4E100E6E4E100E6E4E100E6E4
      E100E6E4E100E7E5E200E6E4E000E6E4E000E6E4E000E6E4E000E6E4E000E7E4
      E000E4E4DF00CAE0D100E1E4DE00E7E4E000E6E4DF00E7E5E200DBD6D000FEFE
      FE00FEFEFE00D5D5D500E4E4E400E3E3E300E3E3E300E3E3E300E3E3E300E3E3
      E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E4E4E400E3E3
      E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E4E4E400E3E3E300E3E3
      E300E3E3E300E3E3E300E3E3E300E3E3E300E2E2E200D3D3D300E1E1E100E3E3
      E300E3E3E300E4E4E400D5D5D500FEFEFE000000000000000000FEFEFE000000
      0000E7E7E700C3C3C300D7D7D70099999900D0D0D000F0F0F000EFEFEF00F1F1
      F100F3F3F300F4F4F400F8F8F800F1F1F100DCDCDC00B9B9B900C8C8C800DFDF
      DF00EAEAEA00F0F0F000EFEFEF00EEEEEE00EEEEEE00EFEFEF00EBEBEB00E8E8
      E800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000E7E7E700C3C3C300D7D7D7009999
      9900D0D0D000F0F0F000EFEFEF00F1F1F100F3F3F300F4F4F400F8F8F800F1F1
      F100DCDCDC00B9B9B900C8C8C800DFDFDF00EAEAEA00F0F0F000EFEFEF00EEEE
      EE00EEEEEE00EFEFEF00EBEBEB00E8E8E8000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00DCD8D200E5E3E000E3E1
      DD00E3E1DE00E3E1DE00E3E1DE00E3E1DE00E3E1DE00E3E1DE00E3E1DE00E3E1
      DE00E3E1DE00E3E1DE00E3E1DE00E3E1DE00E3E1DE00E3E1DE00E3E1DE00E3E1
      DE00E3E1DE00E3E1DE00E3E1DE00E3E1DE00E3E1DE00E3E1DE00E3E1DE00E8E2
      E100D4DDD40048BD8300C4DECE00E8E2E000E2E1DD00E5E3E000DCD8D200FEFE
      FE00FEFEFE00D7D7D700E2E2E200E0E0E000E0E0E000E0E0E000E0E0E000E0E0
      E000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000E0E0
      E000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000E0E0
      E000E0E0E000E0E0E000E0E0E000E3E3E300D7D7D70082828200D0D0D000E3E3
      E300E0E0E000E2E2E200D7D7D700FEFEFE000000000000000000000000000000
      0000B4B4B4009696960094949400B8B8B800D2D2D200E6E6E600E5E5E500DEDE
      DE00DBDBDB00DFDFDF00E6E6E600E4E4E400C8C8C800AAAAAA00A7A7A700FAFA
      FA00F8F8F80000000000FEFEFE00FDFDFD00F9F9F900ECECEC00ECECEC00EDED
      ED00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B4B4B4009696960094949400B8B8
      B800D2D2D200E6E6E600E5E5E500DEDEDE00DBDBDB00DFDFDF00E6E6E600E4E4
      E400C8C8C800AAAAAA00A7A7A700FAFAFA00F8F8F80000000000FEFEFE00FDFD
      FD00F9F9F900ECECEC00ECECEC00EDEDED000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00DDD8D200E5E4E000EEED
      E900F3F2EF00F2F1EE00F2F1EE00F2F1EE00F2F1EE00F2F1EE00F2F1EE00F1F1
      EE00F1F1EE00F1F1EE00F1F1EE00F1F1EE00F1F1EE00F1F1EE00F1F1EE00F1F1
      EE00F1F1EE00F1F1EE00F1F1EE00F1F1EE00F1F1EE00F2F1EE00F2F1EE00F2F1
      EE00F2F1EE00E1EEE400EFF0EC00F4F2EF00EEEDE900E5E4E000DDD8D200FEFE
      FE00FEFEFE00D7D7D700E3E3E300ECECEC00F1F1F100F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000E6E6E600EEEEEE00F1F1
      F100ECECEC00E3E3E300D7D7D700FEFEFE00000000000000000000000000E6E6
      E600A8A8A800C0C0C000BBBBBB00B0B0B000B4B4B400C9C9C900DADADA00DDDD
      DD00DADADA00DCDCDC00D8D8D800C4C4C400B3B3B300B4B4B400ACACAC00B7B7
      B700B3B3B300EFEFEF000000000000000000FEFEFE00F7F7F700FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6E6E600A8A8A800C0C0C000BBBBBB00B0B0
      B000B4B4B400C9C9C900DADADA00DDDDDD00DADADA00DCDCDC00D8D8D800C4C4
      C400B3B3B300B4B4B400ACACAC00B7B7B700B3B3B300EFEFEF00000000000000
      0000FEFEFE00F7F7F700FCFCFC00000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00DCD6D000F2F1ED009F9E
      9C0033312F003C3A36003D3A37003F3B3700403C3700423D3700433E3800453F
      3800464038004640390047413900484139004842390048423900494239004842
      390048413900474139004740390046403800453F3800433E3800423E3700413C
      37003F3B3700413B39003D3A370033312F009F9E9B00F2F1ED00DCD6D000FEFE
      FE00FEFEFE00D6D6D600F0F0F0009D9D9D0031313100393939003A3A3A003B3B
      3B003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F003F3F3F00404040004040
      4000414141004141410041414100414141004040400040404000404040003F3F
      3F003E3E3E003D3D3D003D3D3D003C3C3C003B3B3B003C3C3C003A3A3A003131
      31009D9D9D00F0F0F000D6D6D600FEFEFE00000000000000000000000000FAFA
      FA00CFCFCF00C1C1C100C4C4C400BCBCBC00C4C4C400CECECE00D7D7D700E5E5
      E500E8E8E800E3E3E300D2D2D200CBCBCB00C0C0C000BDBDBD00C6C6C600ABAB
      AB00A2A2A200D9D9D90000000000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FAFAFA00CFCFCF00C1C1C100C4C4C400BCBC
      BC00C4C4C400CECECE00D7D7D700E5E5E500E8E8E800E3E3E300D2D2D200CBCB
      CB00C0C0C000BDBDBD00C6C6C600ABABAB00A2A2A200D9D9D90000000000FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00DBD6D000F9F8F3005959
      570045311700574227005B45270061482800664B29006B4F2A0070532B007556
      2D007A592E007D5B2F00815E3000845F31008661320087623300876233008662
      330085613200835F32007F5D32007D5B310079593100745630006F5430006B50
      2F00664E2E00614B2D005D492E004D391F0059595700F9F8F300DBD6D000FEFE
      FE00FEFEFE00D5D5D500F6F6F600585858002F2F2F0040404000424242004545
      4500484848004C4C4C004F4F4F005252520055555500575757005A5A5A005C5C
      5C005D5D5D005E5E5E005E5E5E005E5E5E005D5D5D005C5C5C005A5A5A005858
      58005656560053535300515151004E4E4E004B4B4B0048484800464646003737
      370058585800F6F6F600D5D5D500FEFEFE000000000000000000FEFEFE000000
      0000E6E6E600CACACA00D4D4D400D8D8D800EBEBEB00D0D0D000E1E1E100FDFD
      FD00FEFEFE00FBFBFB00D8D8D800D1D1D100E9E9E900D4D4D400D4D4D400D9D9
      D900D0D0D000D4D4D40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000E6E6E600CACACA00D4D4D400D8D8
      D800EBEBEB00D0D0D000E1E1E100FDFDFD00FEFEFE00FBFBFB00D8D8D800D1D1
      D100E9E9E900D4D4D400D4D4D400D9D9D900D0D0D000D4D4D400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00DBD6D000FAF8F500605E
      5A00483319005A4528005E472800634A2900694E2B006E522D0073552E007959
      2F007D5B3000815E310084613200886333008A6433008B6533008C6534008B65
      34008964340086623400836033007F5E32007C5C320077593100725631006E53
      300069503000634D2F005F4B2F004F3A2000615E5A00FAF8F500DBD6D000FEFE
      FE00FEFEFE00D5D5D500F7F7F7005D5D5D003131310042424200444444004747
      47004B4B4B004F4F4F005252520055555500585858005A5A5A005D5D5D005F5F
      5F0060606000616161006161610061616100606060005E5E5E005C5C5C005A5A
      5A00585858005555550053535300505050004D4D4D004A4A4A00484848003838
      38005D5D5D00F7F7F700D5D5D500FEFEFE000000000000000000000000000000
      0000E5E5E500DCDCDC00DFDFDF00F0F0F000F1F1F100E4E4E400FDFDFD000000
      00000000000000000000F9F9F900E1E1E100F3F3F300EBEBEB00DFDFDF00DFDF
      DF00DDDDDD00EEEEEE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E5E500DCDCDC00DFDFDF00F0F0
      F000F1F1F100E4E4E400FDFDFD00000000000000000000000000F9F9F900E1E1
      E100F3F3F300EBEBEB00DFDFDF00DFDFDF00DDDDDD00EEEEEE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFD00DBD6D000FAF9F600615E
      5A004A3519005B462A005F492900664C2B0000FF000070542E0075572F007B5A
      300000FF00008360320000FF000000FF000000FF000000FF00008F6836008E68
      36008C66350000FF000000FF000000FF00007E5D3300795B330000FF00006F54
      31006B50300000FF0000614D3000513B2100625E5A00F9F9F600DBD6D000FEFE
      FD00FDFDFD00D5D5D500F8F8F8005D5D5D003232320043434300454545004949
      490000000000505050005353530057575700000000005C5C5C00000000000000
      0000000000000000000064646400646464006262620000000000000000000000
      00005A5A5A005757570000000000515151004E4E4E00000000004A4A4A003939
      39005E5E5E00F8F8F800D5D5D500FDFDFD00000000000000000000000000E3E3
      E300CBCBCB00EAEAEA00E9E9E900F8F8F800F5F5F500E0E0E000FEFEFE000000
      00000000000000000000F8F8F800DFDFDF00F8F8F800F4F4F400E9E9E900E5E5
      E500F3F3F3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E3E3E300CBCBCB00EAEAEA00E9E9E900F8F8
      F800F5F5F500E0E0E000FEFEFE00000000000000000000000000F8F8F800DFDF
      DF00F8F8F800F4F4F400E9E9E900E5E5E500F3F3F30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFD00DBD6D000FAFAF7006360
      5A00483215005B4526006047260000FF00006B4F290000FF000077562C007C59
      2D0000FF000086602F008A6330008E663100916833009369330000FF00009269
      340000FF00008C653200886232008360310000FF00007B5A300000FF00007053
      2E006B502C0000FF0000614B2D004F391D0064605A00FAFAF700DBD6D000FEFE
      FD00FDFDFD00D5D5D500F9F9F9005F5F5F002F2F2F0042424200444444000000
      00004B4B4B00000000005353530056565600000000005C5C5C005F5F5F006161
      61006464640065656500000000006565650000000000616161005E5E5E005C5C
      5C00000000005757570000000000505050004D4D4D0000000000484848003737
      37005F5F5F00F9F9F900D5D5D500FDFDFD00000000000000000000000000A6A6
      A600BABABA00E9E9E900E4E4E400F5F5F500F8F8F800C2C2C200D6D6D6000000
      0000FEFEFE0000000000C5C5C500CFCFCF00F8F8F800F1F1F100E3E3E300E2E2
      E200F9F9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A6A6A600BABABA00E9E9E900E4E4E400F5F5
      F500F8F8F800C2C2C200D6D6D60000000000FEFEFE0000000000C5C5C500CFCF
      CF00F8F8F800F1F1F100E3E3E300E2E2E200F9F9F90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFD00DBD6D100FBFBF8006762
      5C00483319005A4528005E47280000FF0000694E2B0000FF000073552E007959
      2F0000FF0000815E310084613200886333008A6433008B65330000FF00008B65
      340000FF000086623400836033007F5E320000FF00007759310000FF00006E53
      30006950300000FF00005F4B2F004F3A200067625C00FBFBF800DBD6D100FEFE
      FD00FDFDFD00D6D6D600FAFAFA00616161003131310042424200444444000000
      00004B4B4B00000000005252520055555500000000005A5A5A005D5D5D005F5F
      5F0060606000616161000000000061616100000000005E5E5E005C5C5C005A5A
      5A00000000005555550000000000505050004D4D4D0000000000484848003838
      380061616100FAFAFA00D6D6D600FDFDFD00000000000000000000000000E5E5
      E500D9D9D900D7D7D700D7D7D700E8E8E800EFEFEF00D3D3D30093939300AAAA
      AA00C3C3C3009F9F9F009C9C9C00DADADA00EFEFEF00E2E2E200D8D8D800CCCC
      CC00E7E7E7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E5E5E500D9D9D900D7D7D700D7D7D700E8E8
      E800EFEFEF00D3D3D30093939300AAAAAA00C3C3C3009F9F9F009C9C9C00DADA
      DA00EFEFEF00E2E2E200D8D8D800CCCCCC00E7E7E70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFD00DCD7D100FBFBF9006D67
      61004A3519005B462A0000FF0000664C2B006B502C0070542E0000FF00007B5A
      300000FF0000836032008762330000FF000000FF000000FF00008F6836008E68
      360000FF00008964350085623400825F340000FF0000795B330000FF000000FF
      000000FF0000654E3000614D3000513B210069645C00FCFBFA00DCD7D100FEFE
      FD00FDFDFD00D6D6D600FAFAFA00676767003232320043434300000000004949
      49004D4D4D00505050000000000057575700000000005C5C5C005E5E5E000000
      00000000000000000000646464006464640000000000606060005E5E5E005C5C
      5C0000000000575757000000000000000000000000004B4B4B004A4A4A003939
      390063636300FBFBFB00D6D6D600FDFDFD00000000000000000000000000E3E3
      E300C5C5C500CCCCCC00C9C9C900CBCBCB00DFDFDF00CDCDCD00CBCBCB00ABAB
      AB0097979700B3B3B300CACACA00CDCDCD00DBDBDB00C9C9C900CDCDCD00BBBB
      BB0096969600F6F6F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E3E3E300C5C5C500CCCCCC00C9C9C900CBCB
      CB00DFDFDF00CDCDCD00CBCBCB00ABABAB0097979700B3B3B300CACACA00CDCD
      CD00DBDBDB00C9C9C900CDCDCD00BBBBBB0096969600F6F6F600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFD00DCD7D100FCFBFA00706A
      6100483215005B45260000FF0000664A28006B4F290071532B0000FF00007C59
      2D0000FF000086602F0000FF00008E6631009168330093693300936A33009269
      340000FF00008C653200886232008360310000FF00007B5A300000FF00007053
      2E006B502C0000FF0000614B2D004F391D006C665D00FCFCFB00DCD7D100FEFE
      FD00FDFDFD00D6D6D600FBFBFB00696969002F2F2F0042424200000000004848
      48004B4B4B004F4F4F000000000056565600000000005C5C5C00000000006161
      61006464640065656500656565006565650000000000616161005E5E5E005C5C
      5C00000000005757570000000000505050004D4D4D0000000000484848003737
      370065656500FBFBFB00D6D6D600FDFDFD00000000000000000000000000FAFA
      FA00F9F9F900E8E8E800B5B5B500B5B5B500BCBCBC00D3D3D300DDDDDD00E8E8
      E800E6E6E600E6E6E600D9D9D900CECECE00B9B9B900B8B8B800BABABA00BABA
      BA00C4C4C400FCFCFC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FAFAFA00F9F9F900E8E8E800B5B5B500B5B5
      B500BCBCBC00D3D3D300DDDDDD00E8E8E800E6E6E600E6E6E600D9D9D900CECE
      CE00B9B9B900B8B8B800BABABA00BABABA00C4C4C400FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00DDD8D200000000008479
      6C00453117005742270000FF000061482800664B29006B4F2A0000FF00007556
      2D0000FF00007D5B2F0000FF0000845F31008661320087623300876233008662
      330000FF0000835F32007F5D32007D5B310000FF00007456300000FF00006B50
      2F00664E2E0000FF00005D492E004D391F00877C6E0000000000DDD8D200FDFD
      FD00FDFDFD00D7D7D70000000000787878002F2F2F0040404000000000004545
      4500484848004C4C4C0000000000525252000000000057575700000000005C5C
      5C005D5D5D005E5E5E005E5E5E005E5E5E00000000005C5C5C005A5A5A005858
      58000000000053535300000000004E4E4E004B4B4B0000000000464646003737
      37007B7B7B0000000000D7D7D700FDFDFD000000000000000000000000000000
      00000000000000000000D0D0D000AEAEAE00BEBEBE00DEDEDE00EEEEEE00EBEB
      EB00E9E9E900ECECEC00EDEDED00D8D8D800B9B9B900AEAEAE00CACACA00B4B4
      B400E3E3E3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0D0D000AEAE
      AE00BEBEBE00DEDEDE00EEEEEE00EBEBEB00E9E9E900ECECEC00EDEDED00D8D8
      D800B9B9B900AEAEAE00CACACA00B4B4B400E3E3E30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00DDD8D20000000000867B
      6C00483319005A45280000FF0000634A2900694E2B006E522D0000FF00007959
      2F0000FF0000815E31008461320000FF000000FF000000FF000000FF00008B65
      34008964340000FF000000FF000000FF00007C5C3200775931007256310000FF
      000000FF0000634D2F005F4B2F004F3A2000897D6F0000000000DDD8D200FDFD
      FD00FDFDFD00D7D7D70000000000797979003131310042424200000000004747
      47004B4B4B004F4F4F000000000055555500000000005A5A5A005D5D5D000000
      0000000000000000000000000000616161006060600000000000000000000000
      000058585800555555005353530000000000000000004A4A4A00484848003838
      38007C7C7C0000000000D7D7D700FDFDFD000000000000000000000000000000
      00000000000000000000EBEBEB00B0B0B000D6D6D600EBEBEB00EEEEEE00EFEF
      EF00EFEFEF00EFEFEF00EEEEEE00E9E9E900CECECE00DEDEDE0000000000F5F5
      F500FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EBEBEB00B0B0
      B000D6D6D600EBEBEB00EEEEEE00EFEFEF00EFEFEF00EFEFEF00EEEEEE00E9E9
      E900CECECE00DEDEDE0000000000F5F5F500FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00DDD8D20000000000887D
      6F004A3519005B462A005F492900664C2B006B502C0070542E0075572F007B5A
      30007F5D320083603200876233008B6533008E6635008F6836008F6836008E68
      36008C6635008964350085623400825F34007E5D3300795B3300745831006F54
      31006B503000654E3000614D3000513B21008B7F700000000000DDD8D200FDFD
      FD00FDFDFD00D7D7D700000000007C7C7C003232320043434300454545004949
      49004D4D4D005050500053535300575757005A5A5A005C5C5C005E5E5E006161
      61006363630064646400646464006464640062626200606060005E5E5E005C5C
      5C005A5A5A005757570054545400515151004E4E4E004B4B4B004A4A4A003939
      39007E7E7E0000000000D7D7D700FDFDFD000000000000000000000000000000
      0000FEFEFE0000000000E6E6E600C6C6C600E7E7E700EDEDED00EEEEEE00EDED
      ED00EDEDED00EEEEEE00EFEFEF00E8E8E800F5F5F50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000E6E6E600C6C6
      C600E7E7E700EDEDED00EEEEEE00EDEDED00EDEDED00EEEEEE00EFEFEF00E8E8
      E800F5F5F5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00DDD8D200000000008276
      6800483215005B45260060472600664A28006B4F290071532B0077562C007C59
      2D00815D2D0086602F008A6330008E6631009168330093693300936A33009269
      3400906733008C65320088623200836031007F5D30007B5A300075572F007053
      2E006B502C00654C2B00614B2D004F391D0085796B0000000000DDD8D300FDFD
      FD00FDFDFD00D7D7D70000000000757575002F2F2F0042424200444444004848
      48004B4B4B004F4F4F005353530056565600595959005C5C5C005F5F5F006161
      61006464640065656500656565006565650063636300616161005E5E5E005C5C
      5C00595959005757570053535300505050004D4D4D0049494900484848003737
      37007878780000000000D8D8D800FDFDFD000000000000000000000000000000
      0000000000000000000000000000F4F4F400EAEAEA00F5F5F500FDFDFD00F9F9
      F900F9F9F900EEEEEE00EEEEEE00E4E4E400F9F9F90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400EAEAEA00F5F5F500FDFDFD00F9F9F900F9F9F900EEEEEE00EEEEEE00E4E4
      E400F9F9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00DED8D30000000000ACA7
      A1005346350061533F0064543F00685640006B5941006F5B4200725D43007660
      4300796244007C6445007F6645008168460083694700856B4700866B4700856A
      470082684600806746007E6546007B6446007862450075604500725E44006E5C
      44006B5A42006757420064564200574A3800ADA8A20000000000DED8D300FDFD
      FD00FDFDFD00D8D8D80000000000A6A6A6004444440051515100525252005454
      540057575700595959005B5B5B005D5D5D005F5F5F0061616100636363006565
      6500666666006767670068686800676767006565650064646400636363006161
      61005F5F5F005E5E5E005C5C5C005A5A5A005757570055555500545454004848
      4800A7A7A70000000000D8D8D800FDFDFD000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00FEFEFE00000000000000
      000000000000F6F6F600F5F5F500FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00FEFEFE00000000000000000000000000F6F6F600F5F5F500FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00DED9D300FEFEFE00FEFE
      FF00FAFBFC00F8FAFB00F8FAFB00F8FAFB00F8F9FB00F7F9FB00F7F9FB00F7F9
      FB00F7F9FB00F7F9FB00F6F8FB00F6F8FA00F6F8FA00F6F8FA00F6F8FA00F6F8
      FA00F6F8FA00F6F8FA00F6F9FA00F7F9FA00F7F9FB00F7F9FB00F7F9FB00F7F9
      FB00F8F9FB00F8F9FB00F8FAFB00F9FAFC00FEFEFF00FEFEFE00DED9D300FDFD
      FD00FDFDFD00D8D8D800FEFEFE00FEFEFE00FBFBFB00F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900FAFA
      FA00FEFEFE00FEFEFE00D8D8D800FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5E1DD00E2DDD900E4E0
      DC00E7E2DE00E7E2DE00E7E2DE00E7E2DE00E7E2DE00E7E2DE00E7E2DE00E7E2
      DE00E7E2DE00E7E2DE00E7E2DE00E7E2DE00E7E2DE00E7E3DE00E7E3DE00E7E3
      DE00E7E2DE00E7E2DE00E7E2DE00E7E2DE00E7E2DE00E7E2DE00E7E2DE00E7E2
      DE00E7E2DE00E7E2DE00E7E2DE00E7E2DE00E4E0DC00E2DDD900E5E1DD000000
      000000000000E1E1E100DDDDDD00E0E0E000E2E2E200E2E2E200E2E2E200E2E2
      E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2
      E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2
      E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2
      E200E0E0E000DDDDDD00E1E1E100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F4F3F100F4F2
      F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2
      F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2
      F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2
      F000F4F2F000F4F2F000F4F2F000F4F2F000F4F2F000F4F3F100FDFDFD000000
      000000000000FDFDFD00F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      2800000090000000B40000000100010000000000100E00000000000000000000
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
      FFFFFFFFFFFFFFFFFFFFFF3FFFFFFFF3FFFF0000FFFFFFFFFFFFFFFFFFFFE001
      FFFFFE001FFF0000FFFFFFFFFFFFFFFFFFFF80007FFFF80007FF0000FFFFFFFF
      FFFFFFFFFFFF00003FFFF00003FF0000FFFFFFE7FFFFFFFE7FFF00001FFFF000
      01FF0000FFFFE001FFFFFE001FFE00001FFFE00001FF0000FFF00000FFFF0000
      0FFE00001FFFE00001FF0000F8000000FF8000000FFE00001FFFE00001FF0000
      C0000000FC0000000FFE00001FFFE00001FF0000800000007800000007FF0000
      3FFFF00003FF0000800000007800000007FF80007FFFF80007FF000080000000
      7800000007FFC000FFFFFC000FFF0000800000007800000007FFFA07FFFFFFA0
      7FFF0000800000007800000007FFFE07FFFFFFE07FFF00008000000038000000
      03FFFE07FFFFFFE07FFF0000C00000003C00000003FFFE07FFFFFFE07FFF0000
      C00000003C00000003FFFF07FFFFFFF07FFF0000E12000003E12000003FFFF03
      FFFFFFF03FFF0000E31000001E31000001FFF103FFFFFF103FFF0000F3020000
      1F30200001FFC003FFFFFC003FFF0000F10010801F10010801FF8003FFFFF800
      3FFF0000F10008801F10008801FF0003FFFFF0003FFF0000F80000000F800000
      00FF0001FFFFF0001FFF0000F80000000F80000000FE0000FFFFE0000FFF0000
      F80000020F80000020FE00003FFFE00003FF0000FC0000000FC0000000FE0000
      0FFFE00000FF0000FC0000000FC0000000FF000007FFF000007F0000FF060000
      0FF0600000FF000003FFF000003F0000FFFF38387FFFF38387FF800003FFF800
      003F0000FFFFFFE1FFFFFFFE1FFFE00003FFFE00003F0000FFFFFFFFFFFFFFFF
      FFFFF80003FFFF80003F0000FFFFFFFFFFFFFFFFFFFFFE0007FFFFE0007F0000
      FFFFFFFFFFFFFFFFFFFFFFC007FFFFFC007F0000FFFFFFFFFFFFFFFFFFFFFFF0
      0FFFFFFF00FF0000FFFFFFFFFFFFFFFFFFFFFFFC1FFFFFFFC1FF0000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F0000000FF000000
      0FFFFFFFFFFFFFFFFFFF0000E00000007E00000007FFFFFFFFFFFFFFFFFF0000
      C00000003C00000003FFFFFFFFFFFFFFFFFF0000C00000003C00000003E3FFFF
      FFFE3FFFFFFF0000C00000003C00000003E000007FFE000007FF0000C0000000
      3C00000003E000007FFE000007FF0000C00000003C0000000380000001F80000
      001F000080000000180000000100000000700000000700008000000018000000
      0180000000780000000700008000000018000000018000000038000000030000
      800000001800000001C00000003C000000030000800000001800000001C00000
      001C000000010000800000001800000001C00000001C00000001000080000000
      1800000001C00000001C000000010000800000001800000001C00000003C0000
      00030000C00000003C00000003C00000003C000000030000C00000003C000000
      03C00000003C000000030000C00000003C00000003C00000003C000000030000
      C00000003C00000003E00000003E000000030000C00000003C00000003E00000
      003E000000030000C00000003C00000003F00000003F000000030000C0000000
      3C00000003F80000003F800000030000E00000007E00000007FE00001FFFE000
      01FF0000E00000005E00000005FFF0000FFFFF0000FF0000A00000005A000000
      05FFF0000FFFFF0000FF0000E00000007E00000007FFF0000FFFFF0000FF0000
      E00000007E00000007FFF0000FFFFF0000FF0000E00000007E00000007FFF000
      0FFFFF0000FF0000E00000007E00000007FFF8000FFFFF8000FF0000F0000000
      FF0000000FFFF8000FFFFF8000FF0000F0000000FF0000000FFFF8000FFFFF80
      00FF0000F0000000FF0000000FFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFF0DFFFFFFF0DFFFFF801
      FFFFFF801FFF0000FFFFD027FFFFFD027FFFE0007FFFFE0007FF0000FFFFA002
      FFFFFA002FFFC0003FFFFC0003FF0000FFFFC003FFFFFC003FFFC0003FFFFC00
      03FF0000FFFF0001FFFFF0001FFFE0007FFFFE0007FF0000FFFE00017FFFE000
      17FFF801FFFFFF801FFF0000FFFE00007FFFE00007C00000003C000000030000
      FFFE00003FFFE00003FFF801FFFFFF801FFF0000FFFF01803FFFF01803FFF801
      FFFFFF801FFF0000FFFE03C03FFFE03C03C00000003C000000030000FFFC0240
      7FFFC02407FFF801FFFFFF801FFF0000FFF40180FFFF40180FC00000003C0000
      00030000FFFC00007FFFC00007C00000003C000000030000FFCC00005FFCC000
      05FFF801FFFFFF801FFF0000FF0A00007FF0A00007C00000003C000000030000
      FF000000FFF000000F8000000018000000010000FE000002FFE000002F000000
      0000000000000000D000000FFD000000FF0000000000000000000000F000040F
      FF000040FF0000000000000000000000E000031FFE000031FF00000000000000
      00000000E00002FFFE00002FFF0000000000000000000000D00003FFFD00003F
      FF0000000000000000000000F01C03FFFF01C03FFF000000000008BC72400000
      E01C07FFFE01C07FFF000000000014828A400000E01407FFFE01407FFF000000
      000014828A400000E00007FFFE00007FFF0000000000229C8B800000E00003FF
      FE00003FFF000000000022A08A400000E00003FFFE00003FFF200000004222A0
      8A440000FC0007FFFFC0007FFF2000000042229E71840000FC0027FFFFC0027F
      FF2000000042000000040000F4007FFFFF4007FFFF2000000042000000040000
      FE007FFFFFE007FFFF2000000042000000040000FF38FFFFFFF38FFFFF000000
      0000000000000000FFFFFFFFFFFFFFFFFF8000000018000000010000FFFFFFFF
      FFFFFFFFFF8000000018000000010000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000FFFE7FFFFFFFE7FFFFFFC3FF9FFFFC3FF9FF0000FFFC3FFFFFFFC3FF
      FFFFC1FF3FFFFC1FF3FF0000FFF83FFFFFFF83FFFFFFC1FE7FFFFC1FE7FF0000
      FFF01FFFFFFF01FFFFFFC1FCFFFFFC1FCFFF0000FFE01FFFFFFE01FFFFFFE1F1
      FFFFFE1F1FFF0000FFC00FFFFFFC00FFFFFFF0E3FFFFFF0E3FFF0000FF8107FF
      FFF8107FFFFFF047FFFFFF047FFF0000FFC387FFFFFC387FFFFFF80FFFFFFF80
      FFFF0000FFE7C3FFFFFE7C3FFFFFFC0FFFFFFFC0FFFF0000FFFFC3FFFFFFFC3F
      FFFFFC1FFFFFFFC1FFFF0000FFFFE1FFFFFFFE1FFFFFF80FFFFFFF80FFFF0000
      FFFFF0FFFFFFFF0FFFFFF007FFFFFF007FFF0000FFFFF0FFFFFFFF0FFFFFC0C3
      FFFFFC0C3FFF0000FFFFF87FFFFFFF87FFFF81E1FFFFF81E1FFF0000FFFFFC3F
      FFFFFFC3FFFF83F87FFFF83F87FF0000FFFFFE1FFFFFFFE1FFFF87FE1FFFF87F
      E1FF0000FFFFFF9FFFFFFFF9FFFFEFFFDFFFFEFFFDFF0000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      00000000000000000000000000000000000000000000}
  end
end
