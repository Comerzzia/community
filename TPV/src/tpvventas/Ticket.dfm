inherited FrmTicket: TFrmTicket
  Left = 0
  Top = 0
  Caption = 'FrmTicket'
  ClientHeight = 742
  ClientWidth = 1025
  KeyPreview = True
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  ExplicitWidth = 1041
  ExplicitHeight = 780
  PixelsPerInch = 96
  TextHeight = 13
  object Paginas: TRzPageControl [0]
    Left = 0
    Top = 0
    Width = 1025
    Height = 742
    ActivePage = TabVenta
    Align = alClient
    Color = 16119543
    UseColoredTabs = True
    FlatColor = 10263441
    ParentColor = False
    TabColors.HighlightBar = 1350640
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 19
    object TabVenta: TRzTabSheet
      Color = clWhite
      Caption = 'TabVenta'
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 1021
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Ventas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12670976
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExplicitWidth = 56
      end
      object RZPanel4: TRzPanel
        Left = 719
        Top = 25
        Width = 302
        Height = 694
        Align = alRight
        BorderOuter = fsNone
        BorderSides = []
        GradientColorStyle = gcsMSOffice
        TabOrder = 0
        Transparent = True
        VisualStyle = vsClassic
        object RzPanel14: TRzPanel
          Left = 0
          Top = 0
          Width = 302
          Height = 408
          Align = alTop
          BorderOuter = fsNone
          BorderSides = []
          TabOrder = 0
          Transparent = True
          VisualStyle = vsClassic
          object RzGroupBox2: TRzGroupBox
            AlignWithMargins = True
            Left = 10
            Top = 63
            Width = 282
            Height = 342
            Margins.Left = 10
            Margins.Right = 10
            Align = alClient
            FlatColor = 10382147
            TabOrder = 0
            Transparent = True
            object TecladoNumerico: TAdvTouchKeyboard
              Tag = 12
              Left = 10
              Top = 19
              Width = 263
              Height = 314
              Cursor = crHandPoint
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -60
              Font.Name = 'Tahoma'
              Font.Style = []
              Color = clWhite
              KeyboardType = ktCustom
              Keys = <
                item
                  X = 0
                  Y = 249
                  Caption = '0'
                  KeyValue = -1
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 65
                  Width = 131
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
                  Y = 183
                  Caption = '1'
                  KeyValue = -1
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 65
                  Width = 65
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
                  X = 66
                  Y = 183
                  Caption = '2'
                  KeyValue = -1
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 65
                  Width = 65
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
                  X = 132
                  Y = 183
                  Caption = '3'
                  KeyValue = -1
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 65
                  Width = 65
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
                  Y = 117
                  Caption = '4'
                  KeyValue = -1
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 65
                  Width = 65
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
                  X = 66
                  Y = 117
                  Caption = '5'
                  KeyValue = -1
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 65
                  Width = 65
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
                  X = 132
                  Y = 117
                  Caption = '6'
                  KeyValue = -1
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 65
                  Width = 65
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
                  Y = 51
                  Caption = '7'
                  KeyValue = -1
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 65
                  Width = 65
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
                  X = 66
                  Y = 51
                  Caption = '8'
                  KeyValue = -1
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 65
                  Width = 65
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
                  X = 132
                  Y = 51
                  Caption = '9'
                  KeyValue = -1
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 65
                  Width = 65
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
                  X = 132
                  Y = 249
                  Caption = ','
                  KeyValue = -1
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 65
                  Width = 65
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
                  Y = 0
                  Caption = 'Borrar'
                  KeyValue = 8
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 50
                  Width = 263
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
                  X = 198
                  Y = 51
                  Caption = 'Cant.'
                  KeyValue = 106
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 131
                  Width = 65
                  SpecialKey = skMultiply
                  BorderColor = 13546913
                  BorderColorDown = 13546913
                  Color = 16249582
                  ColorDown = 16249582
                  TextColor = 12670976
                  TextColorDown = 12670976
                  ImageIndex = -1
                end
                item
                  X = 198
                  Y = 183
                  Caption = 'Intro'
                  KeyValue = 13
                  ShiftKeyValue = -1
                  AltGrKeyValue = -1
                  Height = 131
                  Width = 65
                  SpecialKey = skReturn
                  BorderColor = 13546913
                  BorderColorDown = 13546913
                  Color = 16249582
                  ColorDown = 16249582
                  TextColor = 12670976
                  TextColorDown = 12670976
                  ImageIndex = -1
                end>
              SmallFont.Charset = DEFAULT_CHARSET
              SmallFont.Color = clMaroon
              SmallFont.Height = -16
              SmallFont.Name = 'Tahoma'
              SmallFont.Style = []
              Version = '1.2.7.0'
            end
          end
          object RzPanel11: TRzPanel
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 299
            Height = 57
            Margins.Left = 0
            Margins.Top = 0
            Align = alTop
            BorderOuter = fsNone
            BorderSides = []
            TabOrder = 1
            Transparent = True
            VisualStyle = vsClassic
            object lblTicketsAparcados: TLabel
              Left = 59
              Top = 32
              Width = 142
              Height = 16
              Caption = 'No hay tickets aparcados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Image1: TImage
              Left = 12
              Top = 6
              Width = 41
              Height = 57
              Center = True
              Picture.Data = {
                07544269746D6170660F0000424D660F00000000000036000000280000002400
                0000240000000100180000000000300F0000C40E0000C40E0000000000000000
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF1F1F1E0E0E0CC
                CCCCC0C0C0EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D9D9D9BBBBBB9D9D9D84
                84847979797777777E7E7E8585857070705B5B5BD6D6D6FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8DFDFDFC1C1C1A0A0A07A7A7A5C5C5C4F
                4F4F4B4B4B5252526767677A7A7A8585859292929696969797979C9C9C858585
                454545CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFCFCFCE4E4E4C6C6C6A4A4A47D7D7D62626253535350505059
                59596E6E6E838383949494A1A1A1A7A7A7A6A6A69D9D9D8B8B8B848484969696
                9696969494949494949E9E9E8B8B8B4E4E4EEFEFEFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A261616156565651515156565669696980
                8080919191A8A8A8B9B9B9B7B7B7AFAFAFA5A5A59999998A8A8A7C7C7C737373
                6767675454547B7B7B9191919595959999998F8F8F767676929292929292D9D9
                D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A5B8B8B8D6
                D6D6D5D5D5BCBCBCBBBBBBB6B6B6B0B0B09D9D9D8686867C7C7C757575717171
                7171717676767E7E7E8989899696969F9F9FB5B5B5BFBFBFC5C5C5C9C9C9CFCF
                CF979797808080D5D5D5E5E5E5F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF7F7F7EFEFEFF4F4F4E2E2E2AEAEAEA4A4A49F9F9F9D9D9D8E8E8E
                878787959595A2A2A2B1B1B1BDBDBDC6C6C6CBCBCBCFCFCFD0D0D0D1D1D1CFCF
                CFCBCBCBC9C9C9C8C8C8CBCBCBBABABA808080E5E5E5F4F4F4FCFCFCFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBEFEFEFD5D5D5C2C2C2C0C0C0ACACAC
                B3B3B3BDBDBDC4C4C4CBCBCBD2D2D2D4D4D4D4D4D4D3D3D3D1D1D1CECECECCCC
                CCC9C9C9C5C5C5C1C1C1BCBCBCC5C5C5C9C9C9C8C8C8CACACAC1C1C17C7C7CE6
                E6E6FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4CDCDCDC6C6C6
                CBCBCBCECECED3D3D3D8D8D8D9D9D9D8D8D8D6D6D6D3D3D3CFCFCFCACACAC6C6
                C6C2C2C2BEBEBEBABABAAFAFAFABABABA7A7A7A7A7A7A1A1A1BEBEBECACACAC8
                C8C8C9C9C9C8C8C8787878DFDFDFF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                F7F7F7D1D1D1D9D9D9D9D9D9D8D8D8D5D5D5D1D1D1CBCBCBC6C6C6C3C3C3BDBD
                BDB8B8B8B5B5B5B2B2B2AEAEAEAAAAAAABABAB919191A3A3A3A9A9A9A9A9A9A9
                A9A9A3A3A3BBBBBBCBCBCBC8C8C8C8C8C8CDCDCD7E7E7ED3D3D3F0F0F0FAFAFA
                FFFFFFFFFFFFFFFFFFFFFFFFFAFAFADBDBDBD9D9D9D8D8D8DADADAC8C8C8AFAF
                AFADADADADADADB0B0B0ADADAD919191ADADADADADADACACACACACACACACACA0
                A0A0AAAAAAABABABAAAAAAA6A6A6B0B0B0BEBEBECBCBCBC9C9C9C8C8C8CECECE
                8C8C8CC8C8C8F5F5F5F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDADA
                DAD9D9D9DBDBDBD0D0D0B5B5B5B4B4B4B2B2B2ACACAC989898AFAFAFAFAFAFAE
                AEAEACACACAEAEAEAFAFAFADADADACACACABABABABABABAAAAAAAAAAAAB3B3B3
                CCCCCCCACACAC9C9C9CFCFCF9B9B9BBFBFBFFDFDFDFCFCFCFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFE2E2E2DCDCDCDCDCDCDCDCDCD9D9D9B8B8B8B5B5B5B2B2B2B0
                B0B0ABABABB3B3B3B0B0B0AFAFAFAFAFAFA9A9A9969696AEAEAEABABABACACAC
                A9A9A9A7A7A7A6A6A6ADADADCDCDCDCBCBCBCACACACFCFCFA7A7A7B0B0B0FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEADEDEDEDEDEDEDEDEDEDF
                DFDFBDBDBDB5B5B5B3B3B3B0B0B0B1B1B1B0B0B0AEAEAEACACACAEAEAEABABAB
                A4A4A4B1B1B1B1B1B1B4B4B4B6B6B6B9B9B9BBBBBBC1C1C1CDCDCDCCCCCCCCCC
                CCCECECEB1B1B1A3A3A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0
                F0F0DFDFDFE1E1E1E0E0E0E3E3E3C7C7C7C1C1C1BABABAB6B6B6B8B8B8BBBBBB
                BDBDBDC3C3C3C8C8C8CBCBCBCFCFCFD0D0D0D1D1D1D2D2D2D3D3D3D2D2D2D2D2
                D2D1D1D1CECECECFCFCFD0CFCFD1D0D0BCBCBC9A9A9AFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFF5F5F5E0E0E0E4E4E4E2E2E2E3E3E3DDDDDDDCDCDC
                DEDEDEDBDBDBD9D9D9D9D9D9DADADAD9D9D9D8D8D8D7D7D7D6D6D6D5D5D5D5D5
                D5D5D5D5D7D6D6D8D5D5D9D4D2D9D1CFD6CDCBD0C7C5C4BDBCC6C1C0C7C7C797
                9797FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAE3E3E3E6E6E6
                E4E4E4E4E4E4E5E5E5E4E4E4E4E4E4E3E3E3DBDBDBD9D9D9D8D8D8D8D8D8D7D7
                D7D6D6D6D6D6D6D5D5D5D5CECCCDC6C4C0BDBDAFB6B899AFB483A9B36BA4B254
                A4B83AACC858A1B3CCC5C49B9B9BF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFEFEFEE4E4E4E7E7E7E6E6E6E6E6E6E6E6E6E5E5E5E5E5E5E5E5E5E1E1
                E1DADADAD9D9D9D9D9D9D8D8D8D8D8D8D9D7D7D3D4D56BB3C34CB1C63DB5CF33
                BAD82FC0E02DC5E72DC8EA2FCAEC2FCDF033BCDBB3BABBA4A1A0EAEAEAFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5E9E9E9E8E8E8E8E8E8E8E8
                E8E7E7E7E7E7E7E7E7E7E7E7E7DDDDDDDADADADADADAD9D9D9D9D9D9DAD9D9E0
                DAD992D9E84DD9F74FD7F440D2F03FCFEC40CEEB3ECCE93ECBE83ECCE936C8E6
                94B4BBB0A9A7DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDED
                EDE9E9E9EAEAEAEAEAEAE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E5E5E5DBDBDBDA
                DBDBDEDAD9E0D6D4DAD1D0D8CCCAC3C6C65FC0D353BACF46B2C934A9C335A8C1
                46CCE746D0EB46CFEA3ED0EC7BB7C3B9B0AED5D5D5FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFF1F1F1E9E9E9ECECECECECECEBEBEBEBEBEBEBEBEBEA
                EAEAEAEAEAEBEBEBE1E1E1E2DEDDAFC9CF63A7B65AA8BA4CABC142B0C934B3D1
                2FB6D62FBADB2FC0E32DB0CF47BED550D5EF4FD2EB4AD5EF6CBECDBDB4B2C9C9
                C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E9E9E9EFEFEFED
                EDEDEDEDEDEDEDEDEDEDEDECECECECECECEDEDEDE9E9E9E5DEDDAFD7DF39CDED
                38CDED32CBEC35CCED38CCEC39CCEB39CBEA39CAE936C3E247B8CC59D9EF57D6
                EC54D9F065C4D5BDB7B6C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFBFBFBE9E9E9F0F0F0EFEFEFEFEFEFEFEFEFEEEEEEEEEEEEEEEEEEEDEDED
                EEEEEEE7E5E5D9DCDC69D4EA59D4ED4CD2EC40CDEA43CFEB43D0EC42CFEB41CC
                E93FCBE948B5C961DAED60DAEE5DDCF063CBDCBBBAB9C0BFBFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE8E8E8F2F2F2F1F1F1F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0EFEFEFEFEFEFEEEEEEE6E0DE8CD8E762D6EC60CDE450CD
                E642C2DD3BB1CD3EB8D44BD2EC48D2EC53BCCF67D6E663D8EA66DFF065D3E3B7
                BCBDC1BFBFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEA
                F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F1F1F1F1F1F1F1F1F1F1F1F1F2F2F2EFE9
                E8AEDDE551B4CD48A2BD59BCD340ABC643B7D239A3C047BFD853DBF253BBCE64
                B3C45EC6D775E7F371DCE8BAC2C3C3C1C0F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFEFEFEFF2F2F2F5F5F5F3F3F3F3F3F3F3F3F3F3F3F3F3F3
                F3F2F2F2F2F2F2F2F2F2F7F2F1C7E4E85BB6CD50A6BF52AAC254B0C848B7D041
                ADC854CCE25CDCF157C6DA5BBDDB43BFE637B6E12BA8D6B0BFC6C8C4C3F1F1F1
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3F0F0F0F6F6F6F5F5
                F5F5F5F5F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F9F6F5DCEDEF84DAE982
                D7E684DBEA89E1F07CE0EF64DEF065DEF065DFF057C7DA3FA2CC49ADD950ADD7
                57ACD2C4D0D5C4C1C0E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFF7F7F7EFEFEFF9F9F9F9F9F9FAFAFAF9F9F9F8F8F8F9F9F9F9F9F9FAFAFAF3
                F3F3F5F2F2EBF5F684D0DF80CFDE95E4F08BDCE989DBE86CD1E15DCADC6DE4F2
                71D4E0CCCDCDE2DEDDE3DDDAE4DDD9DEDDDCBDBDBEDADADAFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBEFEFEFF1F1F1E9E9E9E1E1E1E2E2E2DF
                DFDFCDCDCDD1D1D1C3C3C3D8D8D8DFDDDCF5FBFB8CCFDB76BDCE78C1D274C0D2
                78C7D96EC5D954C0D95ED4ED5BC3DBC9CCCCE2E0DFDBDBDBDBDBDBDDDDDDC1C1
                C1C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEDEDEDE0
                E0E0CCCCCCBEBEBECACACACECECEC7C7C7D5D5D5CBCBCBEAEAEADCD9D9F0F7F8
                65C9E74DBFE446BBE33BB4E131AEDF2AA9DD25A5DB20A0D9289ACEC8D0D3E3E0
                DFDCDCDCDBDBDBDEDEDEC5C5C5B0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFEDEDEDF9F9F9F7F7F7FAFAFAFAFAFAFAFAFAFCFCFCFDFDFD
                FEFEFEFAFAFAFBF9F8F1F7F97FCEE983D1EA8BCEE395D0E29ECFE0AFD3E0B7D4
                DFC0D5DEC9D8DEDEDFDFDEDEDEDDDDDDDCDCDCDDDDDDC4C4C4D5D5D5FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0F4F4F4FDFDFDFCFCFC
                FBFBFBFBFBFBF9F9F9F9F9F9F7F7F7F6F6F6F4F5F5F5F4F4F9F4F3FBF4F2F1EA
                E7E6DFDDE8E1DEE7E1DEE6E0DEE6E2E0E4E0DFDFDFDFE0E0E0DEDEDEDFDFDFE2
                E2E2EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FCFCFCE8E8E8E8E8E8EAEAEAE7E7E7E5E5E5E9E9E9E7E7E7EBEBEBEFEFEFECEC
                ECF1F1F1F1F1F1F1F1F1F5F5F5F4F4F4F7F7F7F9F9F9FAFAFAFDFDFDFEFEFEFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFEFEFEFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            end
          end
        end
        object RzPanel15: TRzPanel
          Left = 0
          Top = 408
          Width = 302
          Height = 212
          Align = alTop
          BorderOuter = fsNone
          BorderSides = []
          TabOrder = 1
          Transparent = True
          VisualStyle = vsClassic
          object RzGroupBox4: TRzGroupBox
            AlignWithMargins = True
            Left = 10
            Top = 3
            Width = 282
            Height = 206
            Margins.Left = 10
            Margins.Right = 10
            Align = alClient
            FlatColor = 10382147
            TabOrder = 0
            Transparent = True
            object Label16: TLabel
              Left = 9
              Top = 24
              Width = 62
              Height = 22
              Caption = 'TOTAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label17: TLabel
              Left = 11
              Top = 72
              Width = 122
              Height = 22
              Caption = 'ENTREGADO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label18: TLabel
              Left = 13
              Top = 120
              Width = 110
              Height = 22
              Caption = 'PENDIENTE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label19: TLabel
              Left = 13
              Top = 168
              Width = 76
              Height = 22
              Caption = 'CAMBIO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LabelTotal: TRzLabel
              Left = 138
              Top = 24
              Width = 121
              Height = 27
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0,00'
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
            object LabelEntregado: TRzLabel
              Left = 138
              Top = 67
              Width = 121
              Height = 27
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0,00'
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
            object LabelPendiente: TRzLabel
              Left = 138
              Top = 115
              Width = 121
              Height = 27
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0,00'
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
            object LabelCambio: TRzLabel
              Left = 138
              Top = 163
              Width = 121
              Height = 27
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0,00'
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
      object RZPanel5: TRzPanel
        Left = 0
        Top = 25
        Width = 719
        Height = 694
        Align = alClient
        AutoSize = True
        BorderSides = []
        Color = clWindow
        GradientDirection = gdVerticalEnd
        TabOrder = 1
        Transparent = True
        VisualStyle = vsClassic
        object RZPanel8: TRzPanel
          Left = 0
          Top = 0
          Width = 719
          Height = 141
          Align = alTop
          AutoSize = True
          BorderSides = []
          TabOrder = 0
          Transparent = True
          object RZGroupBox7: TRzGroupBox
            AlignWithMargins = True
            Left = 10
            Top = 3
            Width = 699
            Height = 76
            Margins.Left = 10
            Margins.Right = 10
            Align = alTop
            FlatColor = 10382147
            TabOrder = 0
            Transparent = True
            object Label9: TLabel
              Left = 7
              Top = 16
              Width = 62
              Height = 24
              Caption = 'Cajero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label10: TLabel
              Left = 7
              Top = 47
              Width = 65
              Height = 24
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LabelUsuario: TRzLabel
              Left = 83
              Top = 17
              Width = 142
              Height = 23
              AutoSize = False
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
              BorderShadow = 10382147
              BorderWidth = 1
              FlatColor = clBtnHighlight
              FlyByColor = 10382147
            end
            object LabelCodcli: TRzLabel
              Left = 81
              Top = 46
              Width = 144
              Height = 23
              AutoSize = False
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
              BorderShadow = 10382147
              BorderWidth = 1
              FlatColor = clBtnHighlight
              FlyByColor = 10382147
            end
            object LabelDesUsuario: TRzLabel
              Left = 239
              Top = 17
              Width = 392
              Height = 23
              AutoSize = False
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
              BorderShadow = 10382147
              BorderWidth = 1
              FlatColor = clBtnHighlight
              FlyByColor = 10382147
            end
            object LabelDesCliente: TRzLabel
              Left = 239
              Top = 46
              Width = 392
              Height = 23
              AutoSize = False
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
              BorderShadow = 10382147
              BorderWidth = 1
              FlatColor = clBtnHighlight
              FlyByColor = 10382147
            end
          end
          object RZGroupBox10: TRzGroupBox
            AlignWithMargins = True
            Left = 10
            Top = 85
            Width = 699
            Height = 53
            Margins.Left = 10
            Margins.Right = 10
            Align = alTop
            FlatColor = 10382147
            TabOrder = 1
            Transparent = True
            object Label11: TLabel
              Left = 7
              Top = 18
              Width = 76
              Height = 24
              Caption = 'Art'#237'culo '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object lblEntrada: TLabel
              Left = 218
              Top = 13
              Width = 7
              Height = 25
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -21
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label1: TLabel
              Left = 410
              Top = 18
              Width = 14
              Height = 24
              Caption = 'X'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 12670976
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object BtnBuscar: TRzToolButton
              AlignWithMargins = True
              Left = 649
              Top = 14
              Width = 45
              Height = 34
              Cursor = crHandPoint
              Margins.Top = 0
              Margins.Right = 4
              Margins.Bottom = 4
              DisabledIndex = 9
              SelectionFrameColor = 7617536
              Images = ImagenesBotones
              UseToolbarButtonSize = False
              Action = AcBuscarArticulo
              Align = alRight
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              ExplicitHeight = 36
            end
            object Shape11: TShape
              AlignWithMargins = True
              Left = 644
              Top = 14
              Width = -1
              Height = 34
              Margins.Top = 0
              Margins.Bottom = 4
              Align = alRight
              Brush.Color = clMaroon
              Pen.Color = 10382147
              ExplicitLeft = 640
            end
            object BtnSeleccionarArticulo: TRzToolButton
              AlignWithMargins = True
              Left = 592
              Top = 14
              Width = 45
              Height = 34
              Cursor = crHandPoint
              Margins.Top = 0
              Margins.Right = 4
              Margins.Bottom = 4
              DisabledIndex = 9
              SelectionFrameColor = 7617536
              Images = ImagenesBotones
              UseToolbarButtonSize = False
              Action = AcSeleccionarArticulo
              Align = alRight
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              ExplicitHeight = 36
            end
            object EditEntrada: TRzEdit
              Left = 89
              Top = 16
              Width = 312
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
              OnClick = EditCantidadClick
              OnKeyPress = EditEntradaKeyPress
            end
            object EditCantidad: TRzNumericEdit
              Left = 438
              Top = 16
              Width = 88
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
              OnClick = EditCantidadClick
              OnEnter = EditCantidadEnter
              OnExit = EditCantidadExit
              IntegersOnly = False
              Value = 1.000000000000000000
              DisplayFormat = ',0.00;(,0.00)'
            end
          end
        end
        object RZPanel9: TRzPanel
          Left = 0
          Top = 141
          Width = 719
          Height = 356
          Align = alClient
          AutoSize = True
          BorderOuter = fsNone
          BorderSides = []
          GradientColorStyle = gcsMSOffice
          TabOrder = 1
          Transparent = True
          VisualStyle = vsClassic
          object RZGroupBox8: TRzGroupBox
            AlignWithMargins = True
            Left = 10
            Top = 3
            Width = 699
            Height = 350
            Margins.Left = 10
            Margins.Right = 10
            Align = alClient
            BorderWidth = 1
            FlatColor = 10382147
            TabOrder = 0
            Transparent = True
            object RzPanel2: TRzPanel
              Left = 2
              Top = 14
              Width = 695
              Height = 334
              Align = alClient
              AutoSize = True
              BorderSides = []
              TabOrder = 0
              Transparent = True
              object RzPanel3: TRzPanel
                Left = 0
                Top = 0
                Width = 653
                Height = 334
                Align = alClient
                BorderOuter = fsNone
                TabOrder = 0
                Transparent = True
                ExplicitWidth = 666
                object GridLineas: TDBGridEh
                  AlignWithMargins = True
                  Left = 5
                  Top = 0
                  Width = 643
                  Height = 73
                  Margins.Left = 5
                  Margins.Top = 0
                  Margins.Right = 5
                  Margins.Bottom = 5
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = S_LINEAS
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
                  OnDrawDataCell = GridLineasDrawDataCell
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'CODART'
                      Footers = <>
                      Title.Alignment = taCenter
                      Title.Caption = 'ARTICULO'
                      Title.Color = 16249582
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = 12670976
                      Title.Font.Height = -13
                      Title.Font.Name = 'Tahoma'
                      Title.Font.Style = []
                      Width = 88
                    end
                    item
                      EditButtons = <>
                      FieldName = 'DESART'
                      Footers = <>
                      Title.Alignment = taCenter
                      Title.Caption = 'DESCRIPCION'
                      Title.Color = 16249582
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = 12670976
                      Title.Font.Height = -13
                      Title.Font.Name = 'Tahoma'
                      Title.Font.Style = []
                      Width = 202
                    end
                    item
                      EditButtons = <>
                      FieldName = 'DESGLOSE1'
                      Footers = <>
                      Title.Alignment = taCenter
                      Title.Caption = 'TALLA'
                      Title.Color = 16249582
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = 12670976
                      Title.Font.Height = -13
                      Title.Font.Name = 'Tahoma'
                      Title.Font.Style = []
                      Width = 60
                    end
                    item
                      EditButtons = <>
                      FieldName = 'DESGLOSE2'
                      Footers = <>
                      Title.Alignment = taCenter
                      Title.Caption = 'COLOR'
                      Title.Color = 16249582
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = 12670976
                      Title.Font.Height = -13
                      Title.Font.Name = 'Tahoma'
                      Title.Font.Style = []
                      Width = 65
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CANTIDAD'
                      Footers = <>
                      Title.Alignment = taCenter
                      Title.Caption = 'UND.'
                      Title.Color = 16249582
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = 12670976
                      Title.Font.Height = -13
                      Title.Font.Name = 'Tahoma'
                      Title.Font.Style = []
                      Width = 65
                    end
                    item
                      EditButtons = <>
                      FieldName = 'PRECIO_TOTAL_SIN_DTO'
                      Footers = <>
                      Title.Alignment = taCenter
                      Title.Caption = 'PVP'
                      Title.Color = 16249582
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = 12670976
                      Title.Font.Height = -13
                      Title.Font.Name = 'Tahoma'
                      Title.Font.Style = []
                      Width = 88
                    end
                    item
                      EditButtons = <>
                      FieldName = 'DESCUENTO'
                      Footers = <>
                      Title.Alignment = taCenter
                      Title.Caption = '%DTO'
                      Title.Color = 16249582
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = 12670976
                      Title.Font.Height = -13
                      Title.Font.Name = 'Tahoma'
                      Title.Font.Style = []
                      Width = 44
                    end
                    item
                      EditButtons = <>
                      FieldName = 'IMPORTE_TOTAL'
                      Footers = <>
                      Title.Alignment = taCenter
                      Title.Caption = 'IMPORTE'
                      Title.Color = 16249582
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = 12670976
                      Title.Font.Height = -13
                      Title.Font.Name = 'Tahoma'
                      Title.Font.Style = []
                      Width = 88
                    end>
                end
                inline FrameArticulos: TFrameArticulos
                  Left = 0
                  Top = 78
                  Width = 653
                  Height = 256
                  Align = alBottom
                  TabOrder = 1
                  Visible = False
                  ExplicitTop = 78
                  ExplicitWidth = 666
                  ExplicitHeight = 256
                  inherited ImagenesBotones: TImageList
                    Bitmap = {
                      494C010103000400140024002400FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
                      0000000000003600000028000000900000002400000001002000000000000051
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
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
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000004A525D0000000000000000000000
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
                      0000000000000000000000000000000000000000000000000006000000150000
                      00160000001900000015000000160000000F0000000E0000000B000000040000
                      0001000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000002B5889007BC3FB005499D90031649900424B
                      5700000000000000000000000000000000000000000000000000000000000000
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
                      00000000000000000000000000000000000000000002000000370000007E281F
                      0F93150D0092251703941B120490120B03870000007C00000072000000520000
                      00290000000C0000000100000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000305E92005B9BCD00B9F0FE008BD5FC0065BBF400305E
                      9200334965000000000000000000000000000000000000000000000000000000
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
                      0000000000000000000000000000000000000000000200000032E8CDA4DFFFE4
                      A5FFFFC873FFF4AF42FFF4AF42FFF5AF45FFF3A731FEF19D1BFDE28D08F7B16E
                      04D9372201880000003200000009000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000002B659A0064A4D800AAE4FE00B9F0FE0097E2FD0097E2FD0065BB
                      F400468CC3002B58890000000000000000000000000000000000000000000000
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
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000004958C7F569E85
                      608BE19012DDE38D06E9EB9208F6E58D02FFE69614FFE4971BFFE29415FFE390
                      0CFFE98D00FFD28103EA3C240078000000110000000100000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000000000000000000000000000000000000000000000000000435F
                      7600357BB200A4E8FE00B4EDFD00B4EDFD00B4EDFD008CDCFE008CDCFE0083DA
                      FD007ED8FE007BD4FD0057B3E8003875AA002B4B760000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000D3D3D3007F7F7F005757570066666600A6A6A600E2E2
                      E200FBFBFB00FCFCFC00FCF9FB00F9F3F800F3ECF100EDE5EA00E7DFE500E1D9
                      DE00DBD4D900D5D0D300D0CFD000D0D0D000CFCFCF00BABABA00A2A2A200B5B5
                      B500C9C9C900BDBDBD00F1F1F100000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000002514
                      000185500003221300050D08001244372342B69561B5F3B44EFBF6B543FFFFE0
                      98FFFED178FFEDA42CFFE98E00FE8A5200AE0000001500000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000435F76003781
                      BA0073C4F200A4E8FE00A4E8FE00ABEAFE00ABEAFE008CDCFE0083DAFD007ED8
                      FE007BD4FD0074D3FD006CD1FD0065C5FC0052ABE5002B446B00424B57000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000CFCFCF00858585006868680081818100E2E2E200000000000000
                      0000FFFCFF00F3EDF100CCD5CD009FBDA6007EAD8A006DA77C006AA47A006FA3
                      7D0082A78B009DAFA000B9B9B800C8BFC500C1BBBF00B8B8B800C4C4C400BDBD
                      BD00B7B7B700D0D0D000BFBFBF00F1F1F1000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000004383B404FFBEBD5EFEBAE
                      4EFFF6C76FFFFFEBB9FFFFDA8EFFED9A15FFA86400BC0000000C000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000000000003689C40072CC
                      FC008CDCFE0097E2FD0097E2FD00A2E3FC00A4E8FE0083DAFD007ED8FE0074D3
                      FD0074D3FD006CD1FD0063CCFD0063CCFD0063CCFD0048A2DB00316499002B44
                      6B00000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000DCDCDC008181810078787800B8B8B800FDFDFD0000000000FFFEFF00E5E6
                      E40089B5930037974F00149738000DA039000FA93F0012AE450014AF470014AD
                      480014A84500169F4300259548004D9261008C9E9000B4ADB100B4B0B300BEBE
                      BE00CFCFCF00BFBFBF00CCCCCC00C2C2C200F9F9F90000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000000000041F212350FFFF
                      FFF6F1C585FFF4BA58FFFFE5ADFFFFE5AAFFF5A41FFF79480088000000020000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000003372A600429CD70074D3FD0074D3
                      FD007ED8FE0083DAFD0083DAFD008CDCFE0097E2FD0074D3FD0074D3FD006ACC
                      FD0063CCFD0063CCFD0058C7FD0058C7FD0058C7FD0048C2FD0048C2FD003689
                      C400000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000000000000000000000000000000000000000000000000000F5F5
                      F5008A8A8A0072727200CECECE000000000000000000FAF6F9008CB796001A92
                      390004A232000FB6430017C1510019C256001BC25A001DC35D001EC35F001FC4
                      61001FC5620024C5640020C15F0017B65300149F46003B8D56009CA69E00CBC3
                      C800CCCCCC00DADADA00C3C3C300C3C3C300CECECE0000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000000000000000000F6364
                      659AFFFFFFFFE7B260FFFDCA6FFFFFE3AEFFFFDD96FFF19709F9160C00270000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000000000000000000040769B0052ABE50063CCFD006ACCFD006CD1
                      FD006CD1FD0074D3FD007BD4FD007ED8FE0097E2FD006CD1FD006ACCFD0063CC
                      FD0058C7FD0058C7FD0058C7FD0048C2FD0048C2FD0048C2FD0038BBFC003689
                      C400000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000000000000000000000000000000000000000000000000000B4B4
                      B40065656500C9C9C9000000000000000000E2E6E200409A5700009F2B000EBE
                      480017C3540018C15700229A51002A8951002A8B54002B8C56002C8C57002C8B
                      58002B8F590022B6670023C9700022C86F0021CA6D0014BE5D00139846007DA3
                      8900DED4DA00DBDBDB00E3E3E300C2C2C200BBBBBB00EAEAEA00000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000030000
                      004CFEF6EAF5FDF4E6FFE89E26FFFFCF7BFFFFE3B3FFFFC353FF945700A00000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000003F779F0072CAF20058C7FD0058C7FD0063CC
                      FD0063CCFD006CD1FD0074D3FD0074D3FD00A2E3FC0065C5FC0065C2F50052AB
                      E50048A2DB004098CF0043B7F30048C2FD0048C2FD0038BBFC0038BBFC002A86
                      C500000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000F0F0F0006E6E
                      6E00ABABAB000000000000000000D9E1DA002095400000B4390011C7510012C5
                      560013C95C0016BE5E0088948E00C4B7BF00C0B8BD00C1BABE00C3BBBF00C4BD
                      C100C5B8BE003DAF7A0018CF79001FCE7B001ECD79001ECE770019CD700007A7
                      4D006DA48000EDE4E900ECECEC00E7E8E700B9B9B900C7C7C700000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000010000
                      0031B8AB9AD7FFF5E1FFE5AD56FFFFC45DFFFFDB9EFFFFDC99FFE48D04EA150B
                      0007000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000003E7AA30072CAF20038BBFC0048C2FD0047A9
                      E5003B9DDC00297FC0003689C400297FC000297FC0002D73AC003689C40065C5
                      FC0065C5FC0065C5FC0065BBF4004286BA002B659A002DB5FB002DB5FB002A86
                      C500000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000B7B7B7007878
                      7800FAFAFA0000000000E6E9E6002295420000BB3D000EC953000EC7570010C9
                      5E0010CC650012C167009CADA500ECE7E900E6E6E600E8E8E800EBEBEB00EEEE
                      EE00F5EDF00049BE8F0011D082001BD287001AD2850019D1820019D17D0015D2
                      770000A94E0085B39600FFF5FB00FAFAFA00DCDCDC00ACACAC00F2F2F2000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000010000
                      0026756A58BAFFECC8FFECC996FFFBB440FFFFCB76FFFFDCA0FFFFAC20FF341F
                      0020000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000407DA6006BC8F40038BBFC00349DE0003392
                      D10052ABE50058BAF50048A2DB00297FC0002A94D9002A8DD200297FC0004691
                      C50073C4F2007BD4FD007BD4FD007BD4FD006DBBEA002D6CA4002A94D9002A86
                      C500000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000000000000000000000000000000000000000000083838300C8C8
                      C80000000000FFF9FD004CA1630000B335000AC850000BC654000CC85B000DCA
                      63000ECD6B000EC46C0090A69C00DFD9DC00D9D9D900DCDCDC00DEDEDE00E2E1
                      E100E9E1E40042BD8F000CD2880016D38C0016D28A0015D2870014D1820013D0
                      7D000ED0740005A04B00BED2C40000000000FBFBFB00B3B3B300D9D9D9000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000010000
                      0026524839B1FFE5B7FFEED1A4FFF6A72BFFFFBB4FFFFFD490FFFFBA3BFF5632
                      0043000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000407DA6006BC8F4002DB5FB003997D5006DC6
                      F90072CCFC0048A2DB00297FC0002A94D9002A94D9002A94D9002A8DD2002B79
                      B6002D73AC005B9BCD0091DBFD0091DBFD0091DBFD007AB5D8003F73A2002B58
                      8900000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000E8E8E80089898900FBFB
                      FB0000000000A5C5AC0000A02A0006C84A0008C54E0009C755000AC85C000BCA
                      64000CCD6C000AC66E0094AEA200E1DADD00D4D4D400D5D5D500D8D8D800DBDB
                      DB00E2DADD003DBB8D0008D2890012D38C0012D38B0011D2880011D1830010D0
                      7D000FD0780001C46300339E5F00FCF6F90000000000D6D6D600C4C4C4000000
                      0000000000000000000000000000000000010000000400000005000000050000
                      000500000007000000090000000A0000000A0000000D0000000E0000000F0000
                      0013000000120000000C00000002000000000000000000000000000000010000
                      00305F533FB7FFDEA9FFEECE9EFFF4A525FFFFB339FFFFC875FFFFBD40FF5833
                      0050000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000003D7EA9003BA0DF0057B3E80091DBFD008BD5
                      FC0048A2DB007BD4FD0083DAFD007BD4FD003BA0DF00B7DCF200E2F3FB002A8D
                      D2003B9DDC0065C2F5003A84BC00417FB40088BCDB00C4F4FE00C4F4FE00C4F4
                      FE0082AFCB003862890033496500000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000D2D2D200B6B6B6000000
                      0000F9F3F7002D98490000BB3A0006C2480007C24D0008C4530009C55B000BC7
                      62000BCA6A0007C36C0099B6A900F3ECEF00E3E3E300DBDBDB00D6D6D600D6D5
                      D600DBD4D7003AB8890008D0860011D08A0011D0880010CF860010CE81000FCD
                      7B000ECB74000CCD6F0000A64800A6C6B00000000000EFEFEF00C3C3C3000000
                      00000000000000000000000000050000002D0000004D000000560000005B0000
                      005C0000005F000000670000006C0000006E000000770000007F000000810502
                      0086130C00890E08007900000035000000040000000000000000000000040000
                      00498F7245CFF8CC85FFECC88FFFF7A526FFFFAE31FFFFBA50FFFFB739FF643A
                      004A000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000003689C40063B9EA00A2E3FC009ADDFB00429C
                      D70047A9E5007ED8FE0083DAFD0083DAFD00CCE8F60090B19000568956006DBB
                      EA0065C5FC006ACCFD0072CCFC0061B0E400357BB200A7D3E400D4FAFC00D4FA
                      FC00D4FAFC00C6EBF2007AA0BC003A4657000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000CDCDCD00DCDCDC000000
                      0000BACDBD000099280004C0420004BF440000BF460001C04C0002C3540003C4
                      5B0004C7640000C165008FB1A200F4ECF000EBEBEB00EBEBEB00E7E7E700E0DF
                      E000DCD5D70031B4830000CD80000ACE84000ACD820009CD800009CC7B0009CB
                      76000CC770000BC6690000BA530046A06600FFFBFF00F9F9F900CFCFCF00FBFB
                      FB0000000000000000000000001900000080A96E11D9C87B01EAD48000F1D882
                      00F3DA8501F4DE8700F6E78C00F9E98F02F9EA9005FAEE9101FEF19301FFF294
                      01FFEF9100FFF19301FFE38A00F1321E00480000000000000000000000150000
                      0075D0A054ECF0BB69FFE5B15FFFFDAB2DFFFFB137FFFFAB2AFFFFAE29FFB66E
                      002C000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000007AC9F300B4EDFD00B4EDFD003BA0DF004BB1
                      EA006CD1FD007BD4FD007ED8FE0083DAFD0082A98200004E0000004E0000DDE9
                      E4008BD5FC006ACCFD0072CCFC0074D3FD0074D3FD003875AA00568AB400B5DD
                      E900D4FAFC00C6EBF200BBE1EA00335B8A002B4B76004A525D00000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000D7D7D700ECECEC00FFFE
                      FF0078B0860000A5290004BB3F000AA53E001A8441001B844400198747001A89
                      4C001A8A500014864F008BA29700F0EBED00E9E9E900EAEAEA00EBEBEB00ECEC
                      EC00EDE9EB00489A7A00138E5E001A8F6100198E5F00198E5F001A8D5C001596
                      5C0009BB660009C0620003BE580012974400E5E8E400FFFEFF00E0E0E000F8F8
                      F8000000000000000000000000113E2D1393F8A524FFDF8700FFDA8400FFDA84
                      00FFDB8400FFDA8300FFD78000FFD88000FFD88200FFD68000FFD77F00FFD87F
                      00FFD98000FFDA8000FFE68A00FFE48900E1CD7C000400000006000000492E21
                      0FABF6B54FFFE7AE56FFE29F36FFFFB237FFFFB23DFFFFA110FFF69F1CF7975B
                      0012000000000000000000000000000000000000000000000000000000000000
                      0000000000003997D500A1DDF400D4FAFC00A7E0F500349DE00058C7FD0063CC
                      FD0063CCFD0074D3FD00CCEDFB0082A9820001560100007B000000830000004E
                      000038763800DDECE9006ACCFD0072CCFC0072CCFC0072CCFC00468CC3003274
                      AB00385476000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000E0E0E000F1F1F100FCF6
                      FA0069AE7B000BB03D0000B13100429A5E00C7B4C000C6BEC300BEB6BB00BBB3
                      B700BBB3B700B9B1B500C9C7C800E7E8E700E6E6E600E7E7E700E8E8E800E9E9
                      E900ECECEC00CAC5C700B8B1B300B8B1B400B2ABAE00ACA5A700AEA3A800949B
                      98000CA85A0006BB5B0007BB550000963700C1D3C50000000000E7E7E700F6F6
                      F60000000000000000000000000400010555FBCD88FAE08700FFEC930AFFEE96
                      0FFFF19B14FFF5A021FFF7A932FFFAB144FFFCB850FFFEBF61FFFFC36AFFFFC6
                      6EFFFFC871FFFFCC75FFFFB535FFCE7D0065000000050000003300000088D393
                      31EFEBA73FFFE3A74CFFE9920CFFFFB848FFFFA722FFFFA413FFDB890AD80000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00003BA0DF00B4E8F700D4FAFC008BD0F000349DE00043B7F30058C7FD0058C7
                      FD0063CCFD00CCEDFB0082A98200004E0000008B0000008B0000008B00000073
                      0000004E0000387638008BD5FC006ACCFD0072CCFC003D89BB003A84BC0058BA
                      F5003274AB003950660000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000E2E2E200F2F2F200F2EF
                      F10063AD76003DBE630003AE37003FA15D00F9EFF600FBFBFB00F4F4F400F1F0
                      F000EEEEEE00ECECEC00E9E9E900E5E5E500E5E5E500E5E5E500E6E6E600E6E6
                      E600E8E8E800EEEDED00F0F0F000F1F1F100F1F1F100EFEFEF00F1ECEE00C4D1
                      CB0009A4510005B3510006B34D0000943100A8C6AF0000000000EAEAEA00F6F6
                      F60000000000000000000000000100000024BBAE9CD1EBA334FFFFBD54FFFFCD
                      7DFFFFD189FFFFD28AFFFFD08BFFFFCF87FFFFCF86FFFFCE86FFFFCE84FFFFCD
                      84FFFFCB7EFFFFC661FFD17E00CF0000001C00000044000000859F6409DDE999
                      1CFFE19B2EFFDE921FFFFFB23EFFFFBB53FFFF9800FFFFAD27FFC979008F0000
                      000000000000000000000000000000000000000000000000000000000000476C
                      840063B9EA0057B3E800429CD7002C9AE0002C9AE0003AA4E40058C7FD0058C7
                      FD0063CCFD0082A98200004E000000630000009A0000009A0000009A00000094
                      000000730000004E0000DDECE90091DBFD0065C2F5004493CC0065C5FC0065C5
                      FC0065BBF4003372A60039506600000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000E6E6E600F0EFF000EEEC
                      ED0068AF7A0051C070003FBC63003FA05C00F1EAEF00FEFEFE00F6F6F600F3F3
                      F300EFEFEF00ECECEC00E9E9E900E7E7E700E5E5E500E5E5E500E5E5E500E5E5
                      E500E5E5E500E6E6E600E7E7E700E8E8E800E9E9E900EAEAEA00F5F0F300C3D6
                      CC00029D450004AA480005AA4400008F2A009FC0A70000000000E7E7E700F6F6
                      F6000000000000000000000000000000000B32312E81FFD99DFFF6A220FFFFB7
                      47FFFFC160FFFFCB7DFFFFCF87FFFFD08AFFFFCE86FFFFCD82FFFFCA7DFFFFCA
                      7BFFFFC264FFF59B11FD190C0093000000862D1A00ACC07400EBE58B00FFDC8A
                      07FFD98B10FFF49C17FFFFC872FFFFA21AFFFF9800FFFDA727FC975B00210000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000000000000000000065C5FC0065C5FC0065C5FC0047A9E500B7DC
                      F20082A98200006B000000A2000000AB000000AB000000AB000000AB000000AB
                      000000AB000000AB00000156010037823700DDE9E40081D2FD0081D2FD0081D2
                      FD0081D2FD0081D2FD007AC9F300445667000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000ECECEC00EBEAEB00F0ED
                      EF0078B3860059BE750059C076006FB68300F1EDF00000000000FDFDFD00FBFB
                      FB00F8F8F800F4F4F400F1F1F100EDEDED00EAEAEA00E7E7E700E6E6E600E5E5
                      E500E5E5E500E5E5E500E5E5E500E6E6E600E7E7E700E8E8E800F4EEF200B6CF
                      C0000094390004A23F0004A23C0000852300ACC6B100FFFCFF00E1E1E100F9F9
                      F900000000000000000000000000000000020000003EF1E0C3F0E89410FFFFBF
                      53FFFFA61AFFFFAB29FFFFB13AFFFFB849FFFFB64AFFFFB649FFFFC165FFFFC2
                      67FFFFB03CFFDB8200FFE18900FCEB9002FDEA8F01FFE18800FFD88300FFD77F
                      00FFEB9006FFFFCC7CFFFFB649FFFF9700FFFFAB29FFE18B05B3000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000000000003F779F0072CCFC0072CCFC0072CCFC00C3EAFB0082B4
                      82000063000000AB000000B5000000B5000000B5000000B5000000B5000000B5
                      000000B5000000B50000008B00000063000037823700AAE4FE008CDCFE008BD5
                      FC008CDCFE008BD5FC006BB3DF00000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000F0F0F000E4E4E400F4F0
                      F30090BA990066BD7C0065C07D0077BB8900F1EEF00000000000000000000000
                      00000000000000000000FDFDFD00F6F6F600F3F3F300EFEFEF00ECECEC00E9E9
                      E900E6E7E700F0EAEE00F3EAEF00F2EAEF00F1EAEE00F1EAEF00FFF1FA00B3CB
                      BC00008D2D00039A3600029A3300007C2100C4D1C600F4F0F400E1E1E1000000
                      00000000000000000000000000000000000000000019898276B7F0B252FFFEBE
                      55FFFFAD2AFFFFA81FFFFFA71DFFFFA518FFFFA213FFFFA71EFFFFB647FFFFC1
                      63FFFAAE3CFFDE8500FFD57E00FFD78000FFD88200FFD57D00FFDA8000FFF4A1
                      22FFFFD086FFFFC163FFFF9D08FFFFA719FFF2A226F3D27E001D000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000349DE00081D2FD0081D2FD0081D2FD0082B482000063
                      0000007B000000BD000000BD000000BD000000BD000000BD000000BD000000BD
                      000000BD000000BD000000BD00000094000000630000E0EFE900B0E6FD009ADD
                      FB009ADDFB006AAED900326A9B00000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000000000000000000000000000F6F6F600DBDBDB00F4F1
                      F300B3C9B70072BA830075C2880074BD8700BBDAC300CFE9D600CCE6D300BBDF
                      C500A3D4B100A0D2B000D6E7DB0000000000FBFBFB00F8F8F800F4F4F400F1F1
                      F100EFEEEE00B0CEBC009DC9AE00A1CAB000A5CBB300A5CBB200AECEB90062AE
                      7C00008A280002902E00008D2700187A2F00E3E3E200E3E2E300E6E6E6000000
                      0000000000000000000000000000000000000000000710101167FFE7B9FDF2A3
                      26FFFFBC4BFFFFAF2AFFFFAD28FFFFAA25FFFFA81FFFFFA518FFFFA71BFFFFB8
                      4BFFFFCC7CFFFFCE80FFFFC467FFF9B54DFFF8B44BFFFCBC5CFFFFD185FFFFD6
                      98FFFFBE57FFFFB034FFFFB236FFFBB341FDD581005800000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000407DA6003BA0DF00A2E3FC00E2F3FB007FB97F000083000000C9
                      000000D2000000D2000000D2000000D2000000D2000000D2000000D2000000D2
                      000000D2000000D2000000D2000000D2000000D200000073000037923700E3F1
                      E900316591000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000D5D5D500EBEA
                      EB00D8DDD90083B98F0082C592007FC38F0073BD85006EBA81006BB97F0064B6
                      7A003EA55B0000862400629870000000000000000000FEFEFE00FCFCFC00FBFB
                      FB00F8F5F7002A88460000821F00008627000086260000852500008422000186
                      2300028A2A00028A2800007B1600528C5C00F1EBF000D5D5D500F2F2F2000000
                      000000000000000000000000000000000000000000010000002DD6C7B1E1E89A
                      20FFFFCB6EFFFFB434FFFFB231FFFFB02DFFFFB43CFFFFBA49FFFFB43DFFFFA9
                      22FFFFB43DFFFFD084FFFFD799FFFFD99EFFFFDA9FFFFFD595FFFFC86EFFFFB4
                      3EFFFFC569FFFFD894FFFCBB4FFDD884016B0000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000CCE8F60088C18800007B000000D2000000DB
                      000000DB000000DB000000DB000000DB000000DB000000DB000000DB000000DB
                      000000DB000000DB000000DB000000DB000000DB000000B50000007B00003C9C
                      3C0065696C000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000E1E1E100D6D6
                      D600F0EDEF00A4C3AB008AC497008BC6980088C4950084C2930081C190007FBF
                      8E0081C0900072BA85009DBEA600FFFDFF000000000000000000000000000000
                      0000FFFBFE002C88480000802100028429000184280001842700018326000183
                      2400018223000083210000681000AFBEB100E3E0E300D3D3D300FEFEFE000000
                      000000000000000000000000000000000000000000000000000F4E4A4494F8C5
                      75FFFCC15CFFFFBC45FFFFBA43FFFFC76AFFFFE0AEFFFFEDCFFFFFECCBFFFFDE
                      A9FFFFC972FFFFB844FFFFB43AFFFFB640FFFFB63FFFFFBA4BFFFFCA76FFFFDF
                      ABFFFFEFCEFFF7B64DF7D7830261D38204010000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000A0D0A0000083000000830000008B0000008B
                      0000008B000000DB000000E5000000E5000000E5000000E5000000E5000000E5
                      000000E5000000E5000000AB0000008B0000008B0000008B0000008300000083
                      0000EFF2EF000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000F8F8F800C3C4
                      C300ECEAEC00D6DCD70097C29F0096C9A10094C79F0091C69C008DC49A008AC3
                      970087C194007EBD8D00B0CAB600FFFDFF000000000000000000000000000000
                      0000FFFEFF002B84420000761400007A1B00007A1B0000791A0000791A000079
                      1900007A1900006C0B0044804E00EAE4E900CDCDCD00E7E7E700000000000000
                      000000000000000000000000000000000000000000000000000300000048F9E1
                      BCF5F0A72EFFFFC963FFFFCD77FFFFE4B4FFFFFFFFFFFEF8EEFFFFFFFFFFFFFE
                      FAFFFFEDD0FFFFE5B6FFFFDFA8FFFFDFAAFFFFE5B9FFFFF0D4FFFFFDF4FFFFEC
                      CBFFE59B23CED385092A00000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000587C94006BB3
                      E500AADAAC0000DB000000F9000000F9000000F9000000F9000000F9000000F9
                      000000F9000000F9000000A2000036A43600CCE8F600596C7A00000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000000000000000000000000000000000000000000000000000DADA
                      DA00CACACA00F2F0F200BFD0C2009DC7A5009FCCA8009CCAA60099C9A30096C7
                      A00093C59E008BC29600B2CBB700FFFDFF000000000000000000000000000000
                      0000000000007BB088004CA06000429B570037954C00319146002F9044003091
                      450031914500448A5100D2D7D300E3E0E200D1D1D100FEFEFE00000000000000
                      00000000000000000000000000000000000000000000000000000000001E9E95
                      87C4ECA638FFFFD27CFFFFE5B5FFFFFDF4FFFFF0CEFE9267239EF3B654EDFFE2
                      A8FFFFFFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5B9FDE9A63ECDB76F
                      0048D68609040000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000AADAAC0009E009000DFD0D000DFD0D000DFD0D000DFD0D000DFD0D000DFD
                      0D000DFD0D000DFD0D0000AB000037AC370097C0DD0000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000BDBDBD00D8D7D800ECEBEC00B8CEBC00A6CCAC00A7CFAF00A4CDAC00A1CC
                      AA009ECAA70097C7A000B8CFBD00FFFDFF000000000000000000000000000000
                      0000FFFEFF009AC2A20080BA8C0082BB8E007EB98B007BB7870077B6840070B1
                      7D0069A27400C9D3CB00F0ECEF00CBCBCB00F2F2F20000000000000000000000
                      00000000000000000000000000000000000000000000000000000000000A2222
                      2377FFD89BFFF9C25EFFFFFDF6FFFFFFFFFFE38F0AA8000000020A0D130E5142
                      2A4CA0773797A77422ADAA731CADD8962F8F573400527E530D1EDF9A30010000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000AADAAC001DE31D0029FE290029FE290029FE290029FE290029FE290029FE
                      290029FE290029FE29000CB50C0037B337008E91930000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000F3F3F300ACACAC00DDDDDD00ECECEC00BFD2C200ACCFB300AED3B500ACD1
                      B300A9D0B000A5CEAD00AACEB100C4DDC900C4DEC900C4DECA00C3DDC800C2DD
                      C800BCD9C20092C29C008ABF950087BE930084BC8F0081BB8C0079B4840078AA
                      8200C5D2C800F2EFF100CECECE00E5E5E5000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000010000
                      0035E6D4B7EAEEA934FFFFFFFFFFE5A744DED780000D00000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000ACE3AC0046E6460061FD610061FD610061FD610061FD610061FD610061FD
                      610061FD610061FD610012BA120037BA37008D8D8D0000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      000000000000E9E9E900ABABAB00E2E1E200F4F3F400CFDCD100B4D1B900B2D4
                      B800B2D5B900B0D4B700ACD2B300A5CEAC00A2CCAA009FCAA7009CC9A50099C7
                      A20096C59F0099C7A20097C6A00094C59D008EC1980086B88F0096BA9D00DAE0
                      DB00F5F2F500CFCFCF00E0E0E000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      001169665F99F6B95CFFF2C87FF8D37D00320000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000ACE3AC005AE95A007DFE7D007DFE7D007DFE7D007DFE7D007DFE7D007DFE
                      7D007DFE7D007DFE7D0017C1170037C337008D8D8D0000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00000000000000000000EEEEEE00B6B6B600DEDDDE00FDFCFD00E8ECE900C7DA
                      CB00B8D4BD00B5D5BB00B5D6BB00B4D6BA00B2D5B900AFD4B600ADD2B400AAD1
                      B200A7D0AF00A4CDAC009FC9A7009AC4A100A0C3A700C2D4C600F5F4F500F0EE
                      F000CCCCCC00E3E3E30000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      00010605061BCFAE7BCBDB911F6F000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000ACE3AC006DEB6D0098FF980097FD970098FF980097FD970098FF980097FD
                      970098FF980098FF98001CC61C0037CB37008D8D8D0000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000F9F9F900C8C8C800D0D0D000F8F7F800FFFE
                      FF00EDF2EE00D5E3D700C4D9C800BBD5C000B7D3BC00B4D2BA00B2D1B700AFD0
                      B500AECEB400B1CEB700BDD3C100D8E3DA00F6F7F600FCFAFC00DDDDDD00CCCC
                      CC00EFEFEF000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000ACE9AD0096EF9600D0FED000D0FED000D0FED000D0FED000D0FED000D0FE
                      D000D0FED000D0FED00027D2270037D437008D8D8D0000000000000000000000
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
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000ACE9AD0089EA8D00BDF5C000BDF5C000BDF5C000BDF5C000BDF5C000BDF5
                      C000BDF5C000BDF5C00023D52A0037D83D008D8D8D0000000000000000000000
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
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000AFECB80000CE1D0000CE1D0000CE1D0000CE1D0000CE1D0000CE1D0000CE
                      1D0000CE1D0000CE1D0000CE1D003DDA54008D8D8D0000000000000000000000
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
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
                      0000000000000000000000000000000000000000000000000000000000000000
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
                      2800000090000000240000000100010000000000D00200000000000000000000
                      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFF00000
                      00000000FFF800FFFFFFFFFFFFFFFF7FFFF0000000000000FF80000FFFFF800F
                      FFFFFE0FFFF0000000000000FF000007FFFF0003FFFFFC07FFF0000000000000
                      FF000007FFFF0001FFFFF803FFF0000000000000FE000003FFFF80007FFFE000
                      7FF0000000000000FC000001FFFFE0007FFFC0001FF0000000000000F8300000
                      FFFFFF003FFFC0000FF0000000000000F04000007FFFFF801FFF00000FF00000
                      00000000E18000007FFFFFC01FFE00000FF0000000000000E30000003FFFFFC0
                      1FFE00000FF0000000000000C60000003FFFFFC00FFE00000FF0000000000000
                      C40000001FFFFFC00FFE00000FF0000000000000C80000011FFFFFC00FFE0000
                      0FF0000000000000880000009E0001C00FFE000001F000000000000090000000
                      9C0000C00FFE000000F0000000000000900000000C0000C00FFE000000300000
                      00000000800000000C0000000FF8000007F0000000000000800000004C000000
                      1FF0000003F0000000000000800000004C0000001FE0000001F0000000000000
                      800000004E0000001FFE000000F0000000000000804000000E0000003FFC0000
                      01F0000000000000807C00001F0000003FFC000001F000000000000080010000
                      1F0000007FF8000007F0000000000000C00180001F000000FFFE000007F00000
                      00000000C000F0001F800000FFFE000007F0000000000000C000F0003F800003
                      FFFFC0003FF0000000000000E000F8003FC00007FFFFF0007FF0000000000000
                      F000F0007FC0001FFFFFF0007FF0000000000000F0000000FFC07FFFFFFFF000
                      7FF0000000000000F8000001FFE0FFFFFFFFF0007FF0000000000000FC000003
                      FFE1FFFFFFFFF0007FF0000000000000FE000007FFFFFFFFFFFFF0007FF00000
                      00000000FF84020FFFFFFFFFFFFFF0007FF0000000000000FFC0003FFFFFFFFF
                      FFFFF0007FF0000000000000FFF801FFFFFFFFFFFFFFFFFFFFF0000000000000
                      00000000000000000000000000000000000000000000}
                  end
                end
              end
              object RzToolbar1: TRzToolbar
                Left = 653
                Top = 0
                Width = 42
                Height = 334
                Align = alRight
                AutoStyle = False
                Images = ImagenesBotones
                Orientation = orVertical
                ButtonWidth = 42
                ButtonHeight = 42
                TextOptions = ttoCustom
                AutoSize = True
                BorderInner = fsNone
                BorderOuter = fsNone
                BorderSides = [sdRight]
                BorderWidth = 0
                Color = clWhite
                TabOrder = 1
                ExplicitLeft = 679
                ToolbarControls = (
                  RzToolButton1
                  RzToolButton2
                  RzToolButton3
                  RzToolButton4
                  RzToolButton5
                  RzToolButton6
                  RzToolButton7
                  RzSpacer2)
                object RzToolButton1: TRzToolButton
                  Left = 0
                  Top = 4
                  Action = AcInicio
                end
                object RzToolButton2: TRzToolButton
                  Left = 0
                  Top = 46
                  Action = AcAnterior
                end
                object RzToolButton3: TRzToolButton
                  Left = 0
                  Top = 88
                  Action = AcSiguiente
                end
                object RzToolButton4: TRzToolButton
                  Left = 0
                  Top = 130
                  Action = AcFin
                end
                object RzToolButton5: TRzToolButton
                  Left = 0
                  Top = 172
                  Action = AcBorrarLineaTicket
                end
                object RzToolButton6: TRzToolButton
                  Left = 0
                  Top = 214
                  Action = AcEditarLinea
                end
                object RzToolButton7: TRzToolButton
                  Left = 0
                  Top = 256
                  Action = AcDevolucion
                end
                object RzSpacer2: TRzSpacer
                  Left = 17
                  Top = 298
                  Height = 5
                end
              end
            end
          end
        end
        object RZPanel10: TRzPanel
          Left = 0
          Top = 497
          Width = 719
          Height = 197
          Align = alBottom
          BorderOuter = fsNone
          BorderSides = []
          TabOrder = 2
          Transparent = True
          VisualStyle = vsClassic
          object RzPanel1: TRzPanel
            Left = 0
            Top = 7
            Width = 719
            Height = 190
            Align = alBottom
            BorderOuter = fsNone
            BorderSides = []
            TabOrder = 0
            Transparent = True
            VisualStyle = vsClassic
            object RzPanel12: TRzPanel
              Left = 0
              Top = 0
              Width = 719
              Height = 190
              Align = alBottom
              BorderOuter = fsNone
              BorderSides = []
              TabOrder = 0
              Transparent = True
              VisualStyle = vsClassic
              object RzGroupBox1: TRzGroupBox
                AlignWithMargins = True
                Left = 10
                Top = 6
                Width = 699
                Height = 181
                Margins.Left = 10
                Margins.Right = 10
                Align = alBottom
                FlatColor = 10382147
                TabOrder = 0
                Transparent = True
                object RzPanel13: TRzPanel
                  AlignWithMargins = True
                  Left = 6
                  Top = 14
                  Width = 689
                  Height = 166
                  Margins.Left = 5
                  Margins.Top = 0
                  Margins.Bottom = 0
                  Align = alClient
                  AutoSize = True
                  BorderSides = []
                  TabOrder = 0
                  Transparent = True
                  object F3: TRzToolButton
                    Left = 265
                    Top = 0
                    Width = 125
                    Height = 73
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
                  object F1: TRzToolButton
                    Left = -3
                    Top = 1
                    Width = 131
                    Height = 72
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
                  object F8: TRzToolButton
                    Left = 265
                    Top = 78
                    Width = 125
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
                  object F9: TRzToolButton
                    Left = 391
                    Top = 78
                    Width = 127
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
                    Left = 134
                    Top = 0
                    Width = 130
                    Height = 73
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
                    Left = 134
                    Top = 78
                    Width = 130
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
                  object F6: TRzToolButton
                    Left = 0
                    Top = 78
                    Width = 128
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
                    Left = 390
                    Top = 0
                    Width = 128
                    Height = 73
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
                    Left = 524
                    Top = 0
                    Width = 131
                    Height = 73
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
                    Left = 519
                    Top = 78
                    Width = 136
                    Height = 79
                    Cursor = crHandPoint
                    DownIndex = 34
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
                    Left = 129
                    Top = 1
                    Width = 1
                    Height = 157
                    Brush.Color = clMaroon
                    Pen.Color = 10382147
                  end
                  object Shape3: TShape
                    Left = 391
                    Top = 1
                    Width = 1
                    Height = 157
                    Brush.Color = clMaroon
                    Pen.Color = 10382147
                  end
                  object Shape4: TShape
                    Left = 263
                    Top = 1
                    Width = 1
                    Height = 157
                    Brush.Color = clMaroon
                    Pen.Color = 10382147
                  end
                  object Shape5: TShape
                    Left = 519
                    Top = 1
                    Width = 1
                    Height = 157
                    Brush.Color = clMaroon
                    Pen.Color = 10382147
                  end
                end
              end
            end
          end
        end
      end
      object RzPanel16: TRzPanel
        Left = 0
        Top = 19
        Width = 1021
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
        TabOrder = 2
        VisualStyle = vsGradient
      end
    end
  end
  inherited Acciones: TActionList
    Images = ImagenesBotones
    Left = 128
    Top = 144
    object AcAparcarTicket: TAction
      Caption = 'APARCAR TICKET'
      ImageIndex = 28
      OnExecute = AcAparcarTicketExecute
    end
    object AcAnotarPagos: TAction
      Caption = 'PAGOS'
      ImageIndex = 24
      OnExecute = AcAnotarPagosExecute
    end
    object AcRecuperarTicket: TAction
      Caption = 'RECUPERAR TICKET'
      ImageIndex = 30
      OnExecute = AcRecuperarTicketExecute
    end
    object AcBuscarCliente: TAction
      Caption = 'CLIENTE'
      ImageIndex = 18
      OnExecute = AcBuscarClienteExecute
    end
    object AcBuscarArticulo: TAction
      Caption = 'BUSCAR ARTICULO'
      ImageIndex = 8
      OnExecute = AcBuscarArticuloExecute
    end
    object AcCambiarUsuario: TAction
      Caption = 'CAJERO'
      ImageIndex = 20
      OnExecute = AcCambiarUsuarioExecute
    end
    object AcAbrirCajon: TAction
      Caption = 'ABRIR CAJON'
      ImageIndex = 32
      OnExecute = AcAbrirCajonExecute
    end
    object AcBorrarLineaTicket: TAction
      Caption = 'BORRAR LINEA'
      ImageIndex = 26
      OnExecute = AcBorrarLineaTicketExecute
    end
    object AcEditarLinea: TAction
      Caption = 'EDITAR LINEA'
      ImageIndex = 12
      OnExecute = AcEditarLineaExecute
    end
    object AcDevolucion: TAction
      Caption = 'DEVOLUCION'
      ImageIndex = 22
      OnExecute = AcDevolucionExecute
    end
    object AcInicio: TAction
      Caption = 'AcInicio'
      ImageIndex = 2
      OnExecute = AcInicioExecute
    end
    object AcSiguiente: TAction
      Caption = 'AcSiguiente'
      ImageIndex = 6
      OnExecute = AcInicioExecute
    end
    object AcAnterior: TAction
      Caption = 'AcAnterior'
      ImageIndex = 0
      OnExecute = AcInicioExecute
    end
    object AcFin: TAction
      Caption = 'AcFin'
      ImageIndex = 4
      OnExecute = AcInicioExecute
    end
    object AcSeleccionarArticulo: TAction
      Caption = 'AcSeleccionarArticulo'
      GroupIndex = 1
      ImageIndex = 34
      OnExecute = AcSeleccionarArticuloExecute
    end
  end
  object S_LINEAS: TDataSource
    OnDataChange = S_LINEASDataChange
    Left = 520
    Top = 48
  end
  object ImagenesBotones: TImageList
    Height = 36
    Width = 36
    Left = 200
    Top = 144
    Bitmap = {
      494C010124002700100024002400FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000090000000680100000100200000000000002A
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A525D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000535353000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000002B5889007BC3FB005499D90031649900424B
      5700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005959
      5900BDBDBD0097979700646464004C4C4C000000000000000000000000000000
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
      00000000000000000000305E92005B9BCD00B9F0FE008BD5FC0065BBF400305E
      9200334965000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000606060009696
      9600E2E2E200C9C9C900B1B1B100606060004B4B4B0000000000000000000000
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
      0000000000002B659A0064A4D800AAE4FE00B9F0FE0097E2FD0097E2FD0065BB
      F400468CC3002B58890000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300A0A0A000D9D9
      D900E2E2E200D2D2D200D2D2D200B1B1B1008787870059595900000000000000
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
      D000CACACA00EEEEEE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000435F
      7600357BB200A4E8FE00B4EDFD00B4EDFD00B4EDFD008CDCFE008CDCFE0083DA
      FD007ED8FE007BD4FD0057B3E8003875AA002B4B760000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005D5D5D0076767600D8D8D800DFDFDF00DFDF
      DF00DFDFDF00CCCCCC00CCCCCC00C8C8C800C6C6C600C4C4C400A6A6A6007272
      72004E4E4E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9E6E300D4CE
      C700DFDAD400CBC6C000C0BBB500C4C0BA00C7C2BD00C8C4BE00CBC7C200CCC8
      C400E0DDD800EDEAE500EBE8E500ECEAE700EDEBE800EEECE900EEECE900EEEB
      E800EDEBE700ECE9E600EBE8E400EAE7E200E8E5E000E5E3DE00DFE3DC00DAE4
      DB00D9E6DC00D8E5DA00D7E2D700D8DCD400D3D1C900E9E6E300000000000000
      00000000000000000000E6E6E600CDCDCD00D9D9D900C5C5C500BABABA00BFBF
      BF00C2C2C200C3C3C300C6C6C600C8C8C800DCDCDC00E9E9E900E8E8E800E9E9
      E900EAEAEA00EBEBEB00EBEBEB00EBEBEB00EAEAEA00E9E9E900E7E7E700E6E6
      E600E4E4E400E2E2E200DFDFDF00DDDDDD00DEDEDE00DDDDDD00DADADA00D8D8
      D800CFCFCF00E6E6E60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000435F76003781
      BA0073C4F200A4E8FE00A4E8FE00ABEAFE00ABEAFE008CDCFE0083DAFD007ED8
      FE007BD4FD0074D3FD006CD1FD0065C5FC0052ABE5002B446B00424B57000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005D5D5D007B7B7B00B8B8B800D8D8D800D8D8D800DBDB
      DB00DBDBDB00CCCCCC00C8C8C800C6C6C600C4C4C400C1C1C100BEBEBE00B7B7
      B700A0A0A000484848004C4C4C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2DEDA00DAD5
      CE00E5E1DB00CCC8C100C0BBB500C4BFBA00C7C2BD00C7C4BF00CAC7C200CBC8
      C300E1DEDB00F0EDEA00EEEBE800EFECEA00F0EDEB00F1EEEC00F1EEEC00F0EE
      EB00EFEDEA00EFECE900EDEBE800EDEAE700EBE8E500E8E7E200E1E7E000E3EB
      E300A7DFC6009CE1C400E0E8DF00DBE2DA00D9D7D000E2DEDA00000000000000
      00000000000000000000DEDEDE00D4D4D400E0E0E000C7C7C700BABABA00BFBF
      BF00C2C2C200C3C3C300C6C6C600C7C7C700DEDEDE00EDEDED00EBEBEB00ECEC
      EC00EDEDED00EEEEEE00EEEEEE00EDEDED00ECECEC00ECECEC00EAEAEA00EAEA
      EA00E8E8E800E5E5E500E2E2E200E5E5E500C4C4C400C0C0C000E2E2E200DDDD
      DD00D5D5D500DEDEDE0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003689C40072CC
      FC008CDCFE0097E2FD0097E2FD00A2E3FC00A4E8FE0083DAFD007ED8FE0074D3
      FD0074D3FD006CD1FD0063CCFD0063CCFD0063CCFD0048A2DB00316499002B44
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000081818100BEBEBE00CCCCCC00D2D2D200D2D2D200D5D5
      D500D8D8D800C8C8C800C6C6C600C1C1C100C1C1C100BEBEBE00B9B9B900B9B9
      B900B9B9B9009797970064646400484848000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDD8D300DFDB
      D600E9E6E100C7C3BE00B7B2AD00BDB8B300C0BCB600C0BDB700C3BFBB00C3C0
      BD00E0DDDA00F2F0ED00EFEDEA00F1EEEC00F2F0ED00F2F0ED00F2F1ED00F2F0
      ED00F1EFED00F0EEEB00EFEDEA00EEECE900EDEBE800EAEAE600E4EAE200E1EC
      E400C6E6D500C0E5D300DFEAE100DEE5DC00DEDED700DDD8D300000000000000
      00000000000000000000D8D8D800DADADA00E5E5E500C2C2C200B2B2B200B8B8
      B800BBBBBB00BCBCBC00BFBFBF00C0C0C000DDDDDD00EFEFEF00ECECEC00EEEE
      EE00EFEFEF00EFEFEF00F0F0F000EFEFEF00EFEFEF00EDEDED00ECECEC00EBEB
      EB00EAEAEA00E8E8E800E5E5E500E5E5E500D5D5D500D2D2D200E3E3E300DFDF
      DF00DBDBDB00D8D8D80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003372A600429CD70074D3FD0074D3
      FD007ED8FE0083DAFD0083DAFD008CDCFE0097E2FD0074D3FD0074D3FD006ACC
      FD0063CCFD0063CCFD0058C7FD0058C7FD0058C7FD0048C2FD0048C2FD003689
      C400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006E6E6E0091919100C1C1C100C1C1C100C6C6C600C8C8C800C8C8C800CCCC
      CC00D2D2D200C1C1C100C1C1C100BBBBBB00B9B9B900B9B9B900B4B4B400B4B4
      B400B4B4B400ADADAD00ADADAD00818181000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFB00DBD6D000E4E1
      DA00E7E4DF00D9D4D000D2CEC800D5D1CD00D7D3CE00D8D5CF00DAD7D300DBD8
      D500E9E6E300F1EFEC00F1EEEB00F1EFEC00F2F0ED00F3F1EE00F3F1EE00F2F1
      EE00F1F0ED00F1EEEC00F0EDEB00EFEDEA00EEEBE800EBEAE600E7EAE300E2EA
      E200E2ECE300E2EBE200DFE7DF00E1E5DE00E3E2DB00DBD6D000FCFCFB000000
      000000000000FBFBFB00D5D5D500DFDFDF00E3E3E300D4D4D400CDCDCD00D1D1
      D100D2D2D200D4D4D400D6D6D600D8D8D800E6E6E600EEEEEE00EEEEEE00EEEE
      EE00EFEFEF00F0F0F000F0F0F000F0F0F000EFEFEF00EEEEEE00EDEDED00ECEC
      EC00EBEBEB00E9E9E900E6E6E600E4E4E400E5E5E500E5E5E500E1E1E100E1E1
      E100E0E0E000D5D5D500FBFBFB00000000000000000000000000000000000000
      000000000000000000000000000040769B0052ABE50063CCFD006ACCFD006CD1
      FD006CD1FD0074D3FD007BD4FD007ED8FE0097E2FD006CD1FD006ACCFD0063CC
      FD0058C7FD0058C7FD0058C7FD0048C2FD0048C2FD0048C2FD0038BBFC003689
      C400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007070
      7000A0A0A000B9B9B900BBBBBB00BEBEBE00BEBEBE00C1C1C100C4C4C400C6C6
      C600D2D2D200BEBEBE00BBBBBB00B9B9B900B4B4B400B4B4B400B4B4B400ADAD
      AD00ADADAD00ADADAD00A5A5A500818181000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F600DBD7D100E7E4
      E000E5E2DE00E8E5E100EAE7E200EBE8E300ECE9E500EDEAE700EFECE900F0EE
      EB00F0EDEB00F0EDEB00F1EEEB00F1EFED00F2F0EE00F3F1EF00F3F1EF00F2F0
      EE00F1EFED00F1EFEB00F0EEEB00EFEDEA00EEEBE800EBEAE600E8E9E400E6E8
      E300E3E8E100E2E6E000E3E5DF00E4E4DF00E6E4E000DBD7D100F8F7F6000000
      000000000000F6F6F600D6D6D600E3E3E300E1E1E100E4E4E400E6E6E600E7E7
      E700E8E8E800EAEAEA00ECECEC00EDEDED00EDEDED00EDEDED00EEEEEE00EFEF
      EF00F0F0F000F1F1F100F1F1F100F0F0F000EFEFEF00EEEEEE00EDEDED00ECEC
      EC00EBEBEB00E9E9E900E7E7E700E5E5E500E4E4E400E2E2E200E2E2E200E2E2
      E200E3E3E300D6D6D600F7F7F700000000000000000000000000000000000000
      00000000000000000000000000003F779F0072CAF20058C7FD0058C7FD0063CC
      FD0063CCFD006CD1FD0074D3FD0074D3FD00A2E3FC0065C5FC0065C2F50052AB
      E50048A2DB004098CF0043B7F30048C2FD0048C2FD0038BBFC0038BBFC002A86
      C500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      7100BABABA00B4B4B400B4B4B400B9B9B900B9B9B900BEBEBE00C1C1C100C1C1
      C100D5D5D500B7B7B700B4B4B400A0A0A000979797008D8D8D00A4A4A400ADAD
      AD00ADADAD00A5A5A500A5A5A5007C7C7C000000000000000000000000000000
      00000000000000000000000000000000000000000000F2F0EF00D0C9C200D6D0
      CA00D5CFC900D5CFC900D5D0C900D5D0C900D6D0CA00D6D1CA00D6D1CB00D7D1
      CB00D7D2CB00D7D2CC00D7D2CC00D7D2CC00D8D2CC00D8D2CC00D8D2CC00D8D2
      CC00D7D2CC00D7D2CC00D7D2CC00D7D2CC00D7D1CB00D6D1CB00D6D1CA00D6D0
      CA00D5D0C900D5D0C900D5D0C900D5CFC900D6D0CA00CFC8C100F2F0EF000000
      000000000000F0F0F000C9C9C900D0D0D000CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00D0D0D000D0D0D000D0D0D000D1D1D100D1D1D100D1D1D100D1D1D100D1D1
      D100D2D2D200D2D2D200D2D2D200D2D2D200D1D1D100D1D1D100D1D1D100D1D1
      D100D1D1D100D0D0D000D0D0D000D0D0D000CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00D0D0D000C8C8C800F0F0F000000000000000000000000000000000000000
      00000000000000000000000000003E7AA30072CAF20038BBFC0048C2FD0047A9
      E5003B9DDC00297FC0003689C400297FC000297FC0002D73AC003689C40065C5
      FC0065C5FC0065C5FC0065BBF4004286BA002B659A002DB5FB002DB5FB002A86
      C500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      7300BABABA00A5A5A500ADADAD009C9C9C009191910078787800818181007878
      7800787878006E6E6E0081818100B7B7B700B7B7B700B7B7B700B1B1B1008080
      8000636363009F9F9F009F9F9F007C7C7C000000000000000000000000000000
      00000000000000000000000000000000000000000000EDEBE800DEDAD400EAE7
      E200E9E6E100EAE7E300EBE8E400ECEAE500EDEAE600EDEBE700EEEBE700EEEC
      E800EEECE800EFECE900EFECE900EFEDE900EFEDE900EFEDE900EFEDE900EFED
      E900EFEDE900EFECE900EFECE900EFECE800EEECE800EEEBE800EDEBE700EDEA
      E600EDEAE500EBE9E500EBE7E300EAE6E200EBE8E300DDD8D300EBE9E6000000
      000000000000EAEAEA00D9D9D900E6E6E600E5E5E500E6E6E600E7E7E700E9E9
      E900E9E9E900EAEAEA00EAEAEA00EBEBEB00EBEBEB00ECECEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00ECECEC00EBEB
      EB00EBEBEB00EBEBEB00EAEAEA00E9E9E900E9E9E900E8E8E800E7E7E700E6E6
      E600E7E7E700D8D8D800E8E8E800000000000000000000000000000000000000
      0000000000000000000000000000407DA6006BC8F40038BBFC00349DE0003392
      D10052ABE50058BAF50048A2DB00297FC0002A94D9002A8DD200297FC0004691
      C50073C4F2007BD4FD007BD4FD007BD4FD006DBBEA002D6CA4002A94D9002A86
      C500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007676
      7600B7B7B700A5A5A5009090900087878700A0A0A000ADADAD00979797007878
      780087878700838383007878780089898900B8B8B800C4C4C400C4C4C400C4C4
      C400B0B0B00069696900878787007C7C7C000000000000000000000000000000
      00000000000000000000000000000000000000000000F1EFED00DFDBD600EAE7
      E200E9E6E200EBE8E300ECE9E500EDEAE600EDEBE700EEECE800EEECE900F0ED
      EA00F0EDEA00F0EEEB00F1EEEB00F1EEEC00F1EFEC00F1EFEC00F1EFEC00F1EF
      EC00F1EEEC00F1EEEB00F1EEEB00F0EEEB00F0EDEA00EFECEA00EEECE800EEEB
      E700EDEBE700ECEAE500EBE8E400EAE6E200EBE8E300DDD9D400F0EEEC000000
      000000000000EFEFEF00DADADA00E6E6E600E5E5E500E7E7E700E8E8E800E9E9
      E900EAEAEA00EBEBEB00EBEBEB00EDEDED00EDEDED00EDEDED00EEEEEE00EEEE
      EE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EDED
      ED00EDEDED00ECECEC00EBEBEB00EAEAEA00EAEAEA00E9E9E900E7E7E700E6E6
      E600E7E7E700D8D8D800EEEEEE00000000000000000000000000000000000000
      0000000000000000000000000000407DA6006BC8F4002DB5FB003997D5006DC6
      F90072CCFC0048A2DB00297FC0002A94D9002A94D9002A94D9002A8DD2002B79
      B6002D73AC005B9BCD0091DBFD0091DBFD0091DBFD007AB5D8003F73A2002B58
      8900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007676
      7600B7B7B7009F9F9F008C8C8C00B9B9B900BEBEBE0097979700787878008787
      8700878787008787870083838300737373006E6E6E0096969600CDCDCD00CDCD
      CD00CDCDCD00ADADAD0071717100595959000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F5F400DDD8D300EBE8
      E300EAE7E200EBE9E500EDEAE600EDEBE700EEECE800EEECE900F0EDEA00F0ED
      EA00F1EEEB00F1EEEB00F1EFEC00F2F0EC00F2F0ED00F2F0ED00F2F0ED00F2F0
      ED00F2F0EC00F1EFEC00F1EEEC00F1EEEB00F0EEEB00F0EDEA00EFECE900EEEC
      E800EEEBE700EDEAE600ECE9E500EAE7E300ECE8E400DBD6D000F5F4F3000000
      000000000000F5F5F500D8D8D800E7E7E700E6E6E600E8E8E800E9E9E900EAEA
      EA00EBEBEB00EBEBEB00EDEDED00EDEDED00EEEEEE00EEEEEE00EEEEEE00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EEEEEE00EEEEEE00EEEE
      EE00EDEDED00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E6E6
      E600E8E8E800D5D5D500F4F4F400000000000000000000000000000000000000
      00000000000000000000000000003D7EA9003BA0DF0057B3E80091DBFD008BD5
      FC0048A2DB007BD4FD0083DAFD007BD4FD003BA0DF00B7DCF200E2F3FB002A8D
      D2003B9DDC0065C2F5003A84BC00417FB40088BCDB00C4F4FE00C4F4FE00C4F4
      FE0082AFCB003862890033496500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007676
      760093939300A6A6A600CDCDCD00C9C9C90097979700C4C4C400C8C8C800C4C4
      C40093939300D7D7D700F0F0F0008383830091919100B4B4B4007E7E7E007C7C
      7C00B5B5B500E7E7E700E7E7E700E7E7E700A9A9A900616161004B4B4B000000
      00000000000000000000000000000000000000000000FAFAF900DED9D400EBE8
      E300EBE8E300EDE9E500EEEBE700EEEBE800EFECE900F0EDEA00F0EDEA00F1EE
      EB00F1EFEC00F2EFEC00F2F0ED00F2F0ED00F3F0ED00F3F1ED00F3F1ED00F3F1
      ED00F2F0ED00F2F0ED00F2F0EC00F1EFEC00F1EEEB00F0EDEA00F0EDEA00EFEC
      E900EEEBE800EEEBE700EDEAE600EBE8E400ECE8E400DBD6D000FAFAF9000000
      000000000000F9F9F900D9D9D900E7E7E700E7E7E700E9E9E900EAEAEA00EBEB
      EB00ECECEC00EDEDED00EDEDED00EEEEEE00EEEEEE00EFEFEF00EFEFEF00EFEF
      EF00F0F0F000F0F0F000F0F0F000F0F0F000EFEFEF00EFEFEF00EFEFEF00EEEE
      EE00EEEEEE00EDEDED00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9E900E7E7
      E700E8E8E800D5D5D500F9F9F900000000000000000000000000000000000000
      00000000000000000000000000003689C40063B9EA00A2E3FC009ADDFB00429C
      D70047A9E5007ED8FE0083DAFD0083DAFD00CCE8F60090B19000568956006DBB
      EA0065C5FC006ACCFD0072CCFC0061B0E400357BB200A7D3E400D4FAFC00D4FA
      FC00D4FAFC00C6EBF2007AA0BC003A4657000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008181
      8100ACACAC00D5D5D500D0D0D000919191009C9C9C00C6C6C600C8C8C800C8C8
      C800E3E3E3009B9B9B0067676700B0B0B000B7B7B700BBBBBB00BEBEBE00A7A7
      A70076767600CACACA00EEEEEE00EEEEEE00EEEEEE00E1E1E1009C9C9C004747
      47000000000000000000000000000000000000000000FEFEFE00DEDAD500EBE8
      E300ECEAE500EDEBE700EEECE800EFEDE900F0EDEA00F0EEEB00F1EFEB00F1F0
      EC00F2F0ED00F2F1ED00F3F1EE00F3F2EE00F3F2EF00F3F2EF00F3F2EF00F3F2
      EF00F3F2EE00F3F1EE00F2F1EE00F2F1ED00F2F0EC00F1EFEC00F0EEEB00F0EE
      EA00EFEDE900EEECE800EDEBE700ECEAE500EBE8E400DDD8D300FEFEFE000000
      000000000000FEFEFE00D9D9D900E7E7E700E9E9E900EAEAEA00EBEBEB00ECEC
      EC00EDEDED00EDEDED00EEEEEE00EFEFEF00EFEFEF00F0F0F000F0F0F000F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F0F0F000F0F0F000F0F0
      F000EFEFEF00EEEEEE00EDEDED00EDEDED00ECECEC00EBEBEB00EAEAEA00E9E9
      E900E7E7E700D8D8D800FEFEFE00000000000000000000000000000000000000
      00000000000000000000000000007AC9F300B4EDFD00B4EDFD003BA0DF004BB1
      EA006CD1FD007BD4FD007ED8FE0083DAFD0082A98200004E0000004E0000DDE9
      E4008BD5FC006ACCFD0072CCFC0074D3FD0074D3FD003875AA00568AB400B5DD
      E900D4FAFC00C6EBF200BBE1EA00335B8A002B4B76004A525D00000000000000
      000000000000000000000000000000000000000000000000000000000000BCBC
      BC00DFDFDF00DFDFDF0093939300A2A2A200BEBEBE00C4C4C400C6C6C600C8C8
      C8008F8F8F001A1A1A001A1A1A00E3E3E300C9C9C900BBBBBB00BEBEBE00C1C1
      C100C1C1C1007272720086868600D3D3D300EEEEEE00E1E1E100D7D7D7005D5D
      5D004E4E4E005353530000000000000000000000000000000000E2DED900EAE7
      E300EDEBE700EEECE800EFEDE900F0EDEA00F0EEEB00F1EFEC00F2F0ED00F2F1
      EE00F3F1EE00F3F2EF00F4F2F000F4F3F000F4F3F100F4F3F100F4F3F100F4F3
      F100F4F3F000F4F2F000F3F2EF00F3F1EE00F2F1EE00F2F0ED00F1EFEC00F1EE
      EB00F0EEEA00EFEDEA00EEECE900EEECE800E9E7E200DFDBD600000000000000
      00000000000000000000DDDDDD00E6E6E600EAEAEA00EBEBEB00ECECEC00EDED
      ED00EDEDED00EEEEEE00EFEFEF00F0F0F000F0F0F000F1F1F100F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F1F1F100F0F0
      F000F0F0F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00EBEBEB00EBEB
      EB00E6E6E600DADADA0000000000000000000000000000000000000000000000
      0000000000003997D500A1DDF400D4FAFC00A7E0F500349DE00058C7FD0063CC
      FD0063CCFD0074D3FD00CCEDFB0082A9820001560100007B000000830000004E
      000038763800DDECE9006ACCFD0072CCFC0072CCFC0072CCFC00468CC3003274
      AB00385476000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00D0D0D000EEEE
      EE00D4D4D40090909000B4B4B400B9B9B900B9B9B900C1C1C100E6E6E6008F8F
      8F001D1D1D00292929002B2B2B001A1A1A004C4C4C00E6E6E600BBBBBB00BEBE
      BE00BEBEBE00BEBEBE0087878700707070005656560000000000000000000000
      0000000000000000000000000000000000000000000000000000E6E2DF00E7E5
      E000EFEDE900EFECE900F0EDEA00F1EEEB00F1EFEC00F2F0ED00F2F0EE00F3F1
      EE00F3F2F000F4F2F000F4F3F100F4F3F100F5F3F200F5F4F200F5F4F200F5F3
      F200F5F3F100F4F3F100F4F2F000F3F2F000F3F1EF00F3F1EE00F2F0ED00F1EF
      EC00F1EEEB00F0EDEA00EFECEA00EFEDEA00E7E4DF00E4E1DD00000000000000
      00000000000000000000E2E2E200E4E4E400ECECEC00ECECEC00EDEDED00EEEE
      EE00EEEEEE00EFEFEF00F0F0F000F0F0F000F1F1F100F2F2F200F2F2F200F2F2
      F200F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F2F2F200F2F2F200F1F1
      F100F1F1F100F0F0F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00ECEC
      EC00E3E3E300E0E0E00000000000000000000000000000000000000000000000
      00003BA0DF00B4E8F700D4FAFC008BD0F000349DE00043B7F30058C7FD0058C7
      FD0063CCFD00CCEDFB0082A98200004E0000008B0000008B0000008B00000073
      0000004E0000387638008BD5FC006ACCFD0072CCFC003D89BB003A84BC0058BA
      F5003274AB003950660000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093939300DBDBDB00EEEEEE00C3C3
      C30090909000A4A4A400B4B4B400B4B4B400B9B9B900E6E6E6008F8F8F001A1A
      1A002E2E2E002E2E2E002E2E2E00262626001A1A1A004C4C4C00C9C9C900BBBB
      BB00BEBEBE00808080007E7E7E00ADADAD00707070004F4F4F00000000000000
      0000000000000000000000000000000000000000000000000000EBE9E600E6E3
      DE00F0EEEA00F0EDEA00F0EEEB00F1EFEC00F2F0ED00F2F1EE00F3F1EF00F4F2
      F000F4F3F100F5F3F100F5F4F200F5F4F200F6F5F300F6F5F300F6F5F300F6F5
      F300F5F4F200F5F4F200F5F3F100F4F3F100F4F2F000F3F2EF00F3F1EE00F2F0
      ED00F1F0EC00F1EEEC00F0EEEB00F1EFEC00E5E2DD00E9E6E300000000000000
      00000000000000000000E8E8E800E2E2E200EDEDED00EDEDED00EDEDED00EEEE
      EE00EFEFEF00F0F0F000F1F1F100F2F2F200F2F2F200F3F3F300F3F3F300F3F3
      F300F4F4F400F4F4F400F4F4F400F4F4F400F3F3F300F3F3F300F3F3F300F2F2
      F200F2F2F200F1F1F100F0F0F000EFEFEF00EFEFEF00EEEEEE00EDEDED00EEEE
      EE00E1E1E100E6E6E6000000000000000000000000000000000000000000476C
      840063B9EA0057B3E800429CD7002C9AE0002C9AE0003AA4E40058C7FD0058C7
      FD0063CCFD0082A98200004E000000630000009A0000009A0000009A00000094
      000000730000004E0000DDECE90091DBFD0065C2F5004493CC0065C5FC0065C5
      FC0065BBF4003372A60039506600000000000000000000000000000000000000
      000000000000000000000000000067676700ACACAC00A6A6A600919191008C8C
      8C008C8C8C0096969600B4B4B400B4B4B400B9B9B9008F8F8F001A1A1A002121
      210033333300333333003333330031313100262626001A1A1A00E6E6E600CDCD
      CD00B4B4B4008B8B8B00B7B7B700B7B7B700B1B1B1006E6E6E004F4F4F000000
      0000000000000000000000000000000000000000000000000000F1EFED00E8E5
      E000F3F1EF00F1EEEB00F1EFEC00F2F0ED00F3F1EE00F3F1EE00F4F2F000F4F3
      F000F5F3F100F5F4F200F6F4F200F6F5F300F7F5F300F7F5F400F7F5F400F7F5
      F300F6F5F300F6F4F200F6F4F200F5F3F100F5F3F100F4F2F000F4F2EF00F3F1
      EE00F2F0ED00F2EFEC00F1EEEB00F3F0EE00E2DEDA00EFEDEB00000000000000
      00000000000000000000EFEFEF00E4E4E400F1F1F100EEEEEE00EEEEEE00EFEF
      EF00F0F0F000F0F0F000F2F2F200F2F2F200F3F3F300F3F3F300F4F4F400F4F4
      F400F5F5F500F5F5F500F5F5F500F5F5F500F4F4F400F4F4F400F4F4F400F3F3
      F300F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00EFEFEF00EEEEEE00F0F0
      F000DEDEDE00EDEDED0000000000000000000000000000000000000000000000
      000000000000000000000000000065C5FC0065C5FC0065C5FC0047A9E500B7DC
      F20082A98200006B000000A2000000AB000000AB000000AB000000AB000000AB
      000000AB000000AB00000156010037823700DDE9E40081D2FD0081D2FD0081D2
      FD0081D2FD0081D2FD007AC9F300445667000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B7B7
      B700B7B7B700B7B7B7009C9C9C00D7D7D7008F8F8F0023232300363636003939
      39003939390039393900393939003939390039393900393939001D1D1D005050
      5000E3E3E300C5C5C500C5C5C500C5C5C500C5C5C500C5C5C500BCBCBC005555
      5500000000000000000000000000000000000000000000000000F5F4F200E6E3
      DF00F7F4F300F4F2F000F3F1EF00F3F1EE00F3F1EE00F3F2F000F4F2F000F4F3
      F100F5F4F200F5F4F200F6F5F300F6F5F400F7F6F400F7F6F400F7F6F500F7F6
      F400F6F5F400F6F5F300F6F4F300F5F4F200F5F3F100F4F3F100F4F2F000F3F1
      EF00F2F1EE00F2F0ED00F1EEEC00F3F1EF00DFDBD600F4F3F100000000000000
      00000000000000000000F3F3F300E2E2E200F4F4F400F2F2F200F1F1F100F0F0
      F000F0F0F000F1F1F100F2F2F200F2F2F200F3F3F300F3F3F300F4F4F400F5F5
      F500F5F5F500F5F5F500F6F6F600F5F5F500F5F5F500F4F4F400F4F4F400F3F3
      F300F3F3F300F2F2F200F2F2F200F1F1F100F0F0F000EFEFEF00EEEEEE00F1F1
      F100DADADA00F2F2F20000000000000000000000000000000000000000000000
      000000000000000000003F779F0072CCFC0072CCFC0072CCFC00C3EAFB0082B4
      82000063000000AB000000B5000000B5000000B5000000B5000000B5000000B5
      000000B5000000B50000008B00000063000037823700AAE4FE008CDCFE008BD5
      FC008CDCFE008BD5FC006BB3DF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000071717100BEBE
      BE00BEBEBE00BEBEBE00E2E2E2009292920021212100393939003C3C3C003C3C
      3C003C3C3C003C3C3C003C3C3C003C3C3C003C3C3C003C3C3C002E2E2E002121
      210050505000D9D9D900CCCCCC00C9C9C900CCCCCC00C9C9C900A9A9A9000000
      0000000000000000000000000000000000000000000000000000F9F9F800E4E0
      DC00F7F5F300F5F4F100F5F5F200F6F5F200F5F3F200F5F3F100F5F3F100F5F4
      F200F6F4F200F6F5F300F7F5F400F7F6F400F7F6F500F8F6F500F8F7F500F7F6
      F500F7F6F400F7F5F400F6F5F300F6F5F300F5F4F200F5F3F100F4F3F100F4F2
      F000F3F2EE00F3F1EE00F2F0EC00F4F2EE00DED9D400F9F9F800000000000000
      00000000000000000000F8F8F800E0E0E000F5F5F500F3F3F300F4F4F400F4F4
      F400F3F3F300F3F3F300F3F3F300F3F3F300F4F4F400F4F4F400F5F5F500F5F5
      F500F6F6F600F6F6F600F6F6F600F6F6F600F5F5F500F5F5F500F4F4F400F4F4
      F400F3F3F300F3F3F300F2F2F200F2F2F200F1F1F100F0F0F000EFEFEF00F1F1
      F100D9D9D900F8F8F80000000000000000000000000000000000000000000000
      00000000000000000000349DE00081D2FD0081D2FD0081D2FD0082B482000063
      0000007B000000BD000000BD000000BD000000BD000000BD000000BD000000BD
      000000BD000000BD000000BD00000094000000630000E0EFE900B0E6FD009ADD
      FB009ADDFB006AAED900326A9B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000090909000C5C5
      C500C5C5C500C5C5C5009292920021212100292929003F3F3F003F3F3F003F3F
      3F003F3F3F003F3F3F003F3F3F003F3F3F003F3F3F003F3F3F003F3F3F003131
      310021212100E8E8E800DBDBDB00D0D0D000D0D0D000A5A5A500676767000000
      0000000000000000000000000000000000000000000000000000FDFCFC00E3DF
      DB00F6F5F300F5F4F200F6F5F200F6F5F400F7F5F500F8F6F500F7F6F400F7F6
      F400F6F5F300F7F5F400F7F6F400F7F6F400F8F6F500F8F7F500F8F7F500F8F7
      F500F7F6F500F7F6F400F7F5F400F6F5F300F6F4F300F5F4F200F5F3F100F4F3
      F000F4F2F000F3F1EF00F2F0ED00F2F1EE00DDD9D300FDFDFD00000000000000
      00000000000000000000FCFCFC00DFDFDF00F4F4F400F3F3F300F4F4F400F5F5
      F500F5F5F500F6F6F600F5F5F500F5F5F500F4F4F400F5F5F500F5F5F500F5F5
      F500F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F5F5F500F5F5F500F4F4
      F400F4F4F400F3F3F300F3F3F300F2F2F200F2F2F200F1F1F100EFEFEF00F0F0
      F000D8D8D800FDFDFD0000000000000000000000000000000000000000000000
      000000000000407DA6003BA0DF00A2E3FC00E2F3FB007FB97F000083000000C9
      000000D2000000D2000000D2000000D2000000D2000000D2000000D2000000D2
      000000D2000000D2000000D2000000D2000000D200000073000037923700E3F1
      E900316591000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007676760093939300D5D5
      D500F0F0F000929292002B2B2B00434343004646460046464600464646004646
      4600464646004646460046464600464646004646460046464600464646004646
      4600464646002626260055555500E9E9E9006262620000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E4E0
      DC00F4F3F100F6F5F200F6F5F400F7F5F400F7F6F500F8F7F500F8F7F500F8F8
      F600F8F8F600F8F7F600F8F7F600F8F7F600F8F7F500F8F7F500F8F7F500F8F7
      F500F7F6F500F7F6F400F7F6F400F6F5F400F6F5F300F5F4F200F5F4F200F4F3
      F100F4F3F100F3F2F000F4F2EF00F0EEEB00DFDBD70000000000000000000000
      0000000000000000000000000000E0E0E000F2F2F200F4F4F400F5F5F500F5F5
      F500F6F6F600F6F6F600F6F6F600F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F5F5F500F5F5F500F5F5
      F500F4F4F400F3F3F300F3F3F300F2F2F200F2F2F200F1F1F100F1F1F100EDED
      ED00DBDBDB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CCE8F60088C18800007B000000D2000000DB
      000000DB000000DB000000DB000000DB000000DB000000DB000000DB000000DB
      000000DB000000DB000000DB000000DB000000DB000000B50000007B00003C9C
      3C0065696C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E3E3
      E3009B9B9B002929290046464600494949004949490049494900494949004949
      4900494949004949490049494900494949004949490049494900494949004949
      4900494949003C3C3C00292929005C5C5C006868680000000000000000000000
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
      0000000000000000000000000000A0D0A0000083000000830000008B0000008B
      0000008B000000DB000000E5000000E5000000E5000000E5000000E5000000E5
      000000E5000000E5000000AB0000008B0000008B0000008B0000008300000083
      0000EFF2EF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B0B0
      B0002B2B2B002B2B2B002E2E2E002E2E2E002E2E2E00494949004C4C4C004C4C
      4C004C4C4C004C4C4C004C4C4C004C4C4C004C4C4C004C4C4C00393939002E2E
      2E002E2E2E002E2E2E002B2B2B002B2B2B00F0F0F00000000000000000000000
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
      0000000000000000000000000000000000000000000000000000587C94006BB3
      E500AADAAC0000DB000000F9000000F9000000F9000000F9000000F9000000F9
      000000F9000000F9000000A2000036A43600CCE8F600596C7A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000078787800ABABAB00BABABA0049494900535353005353
      5300535353005353530053535300535353005353530053535300363636005A5A
      5A00E3E3E3006A6A6A0000000000000000000000000000000000000000000000
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
      0000AADAAC0009E009000DFD0D000DFD0D000DFD0D000DFD0D000DFD0D000DFD
      0D000DFD0D000DFD0D0000AB000037AC370097C0DD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABA00505050005D5D5D005D5D
      5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D00393939005E5E
      5E00BCBCBC000000000000000000000000000000000000000000000000000000
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
      0000AADAAC001DE31D0029FE290029FE290029FE290029FE290029FE290029FE
      290029FE290029FE29000CB50C0037B337008E91930000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABA005F5F5F00707070007070
      7000707070007070700070707000707070007070700070707000444444006060
      6000909090000000000000000000000000000000000000000000000000000000
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
      0000ACE3AC0046E6460061FD610061FD610061FD610061FD610061FD610061FD
      610061FD610061FD610012BA120037BA37008D8D8D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEBEBE007B7B7B00959595009595
      95009595950095959500959595009595950095959500959595004A4A4A006262
      62008D8D8D000000000000000000000000000000000000000000000000000000
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
      0000ACE3AC005AE95A007DFE7D007DFE7D007DFE7D007DFE7D007DFE7D007DFE
      7D007DFE7D007DFE7D0017C1170037C337008D8D8D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEBEBE0089898900A8A8A800A8A8
      A800A8A8A800A8A8A800A8A8A800A8A8A800A8A8A800A8A8A8004F4F4F006565
      65008D8D8D000000000000000000000000000000000000000000000000000000
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
      0000ACE3AC006DEB6D0098FF980097FD970098FF980097FD970098FF980097FD
      970098FF980098FF98001CC61C0037CB37008D8D8D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEBEBE0097979700BABABA00B9B9
      B900BABABA00B9B9B900BABABA00B9B9B900BABABA00BABABA00545454006868
      68008D8D8D000000000000000000000000000000000000000000000000000000
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
      0000ACE9AD0096EF9600D0FED000D0FED000D0FED000D0FED000D0FED000D0FE
      D000D0FED000D0FED00027D2270037D437008D8D8D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3B3B300DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00606060006B6B
      6B008D8D8D000000000000000000000000000000000000000000000000000000
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
      0000ACE9AD0089EA8D00BDF5C000BDF5C000BDF5C000BDF5C000BDF5C000BDF5
      C000BDF5C000BDF5C00023D52A0037D83D008D8D8D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AAAAAA00D0D0D000D0D0
      D000D0D0D000D0D0D000D0D0D000D0D0D000D0D0D000D0D0D000606060006E6E
      6E008D8D8D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFECB80000CE1D0000CE1D0000CE1D0000CE1D0000CE1D0000CE1D0000CE
      1D0000CE1D0000CE1D0000CE1D003DDA54008D8D8D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C6004E4E4E004E4E4E004E4E
      4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E004E4E4E007979
      79008D8D8D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFFFF00DEDEDD00CBCBCC00CDCDCF00CDCDCE00CCCBCB00C9C9C900C8C9
      C900C9C9C900C8C9C900C7C7C800C4C5C500C4C5C500C3C4C400C3C5C400C2C4
      C300C1C2C200C1C2C300C1C1C200C2C2C200C1C2C100BEBFBF00BEBEC000BEBF
      BF00BEBFBF00BDBEBF00BAB9B900D1D1D000FEFFFF0000000000000000000000
      000000000000000000000000000000000000FEFEFE00DDDDDD00CBCBCB00CDCD
      CD00CDCDCD00CBCBCB00C9C9C900C8C8C800C9C9C900C8C8C800C7C7C700C4C4
      C400C4C4C400C3C3C300C4C4C400C3C3C300C1C1C100C2C2C200C1C1C100C2C2
      C200C1C1C100BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00B9B9B900D0D0
      D000FEFEFE000000000000000000000000000000000000000000000000000000
      0000FEFFFF00DEDEDD00CBCBCC00CDCDCF00CDCDCE00CCCBCB00C9C9C900C8C9
      C900C9C9C900C8C9C900C7C7C800C4C5C500C4C5C500C3C4C400C3C5C400C2C4
      C300C1C2C200C1C2C300C1C1C200C2C2C200C1C2C100BEBFBF00BEBEC000BEBF
      BF00BEBFBF00BDBEBF00BAB9B900D1D1D000FEFFFF0000000000000000000000
      000000000000000000000000000000000000FEFEFE00DDDDDD00CBCBCB00CDCD
      CD00CDCDCD00CBCBCB00C9C9C900C8C8C800C9C9C900C8C8C800C7C7C700C4C4
      C400C4C4C400C3C3C300C4C4C400C3C3C300C1C1C100C2C2C200C1C1C100C2C2
      C200C1C1C100BEBEBE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00B9B9B900D0D0
      D000FEFEFE00000000000000000000000000000000000000000000000000FEFE
      FE0000000000A6B1BC0047709E00507BA9004D79A7004C78A6004976A3004876
      A3004575A00042729D0040729C003C6F9700366D9500336B9200326B9100356D
      9400386E96003C6F980040719C0042729D004574A0004674A0004976A3004B77
      A3004E78A3004D78A6004A6B8E00B4B5B60000000000FEFEFE00000000000000
      0000000000000000000000000000FEFEFE0000000000B1B1B100717171007C7C
      7C007979790078787800767676007575750073737300707070006F6F6F006B6B
      6B0068686800656565006464640067676700696969006B6B6B006F6F6F007070
      70007373730073737300767676007777770078787800797979006B6B6B00B5B5
      B50000000000FEFEFE000000000000000000000000000000000000000000FEFE
      FE0000000000A6B1BC0047709E00507BA9004D79A7004C78A6004976A3004876
      A3004575A00042729D0040729C003C6F9700366D9500336B9200326B9100356D
      9400386E96003C6F980040719C0042729D004574A0004674A0004976A3004B77
      A3004E78A3004D78A6004A6B8E00B4B5B60000000000FEFEFE00000000000000
      0000000000000000000000000000FEFEFE0000000000B1B1B100717171007C7C
      7C007979790078787800767676007575750073737300707070006F6F6F006B6B
      6B0068686800656565006464640067676700696969006B6B6B006F6F6F007070
      70007373730073737300767676007777770078787800797979006B6B6B00B5B5
      B50000000000FEFEFE000000000000000000000000000000000000000000FEFE
      FE0000000000BBCEE000437CB4005180AD004D7AA7004E7DAA004E7CA9004F7C
      A9004E7CA8004D7BA700507EAB004F7CA9004F7CA800507DAA004E7BA900507E
      AB004F7EAB004D7AA7004F7CA9004E7BA8004E7CA9004E7CA9004B7CAC004679
      AB004079AE00447EB6005284B600DCE2EA0000000000FEFEFE00000000000000
      0000000000000000000000000000FEFEFE0000000000CDCDCD007B7B7B007F7F
      7F007A7A7A007C7C7C007B7B7B007C7C7C007B7B7B007A7A7A007D7D7D007C7C
      7C007B7B7B007D7D7D007B7B7B007D7D7D007D7D7D007A7A7A007C7C7C007B7B
      7B007B7B7B007B7B7B007B7B7B0078787800777777007D7D7D0084848400E2E2
      E20000000000FEFEFE000000000000000000000000000000000000000000FEFE
      FE0000000000BBCEE000437CB4005180AD004D7AA7004E7DAA004E7CA9004F7C
      A9004E7CA8004D7BA700507EAB004F7CA9004F7CA800507DAA004E7BA900507E
      AB004F7EAB004D7AA7004F7CA9004E7BA8004E7CA9004E7CA9004B7CAC004679
      AB004079AE00447EB6005284B600DCE2EA0000000000FEFEFE00000000000000
      0000000000000000000000000000FEFEFE0000000000CDCDCD007B7B7B007F7F
      7F007A7A7A007C7C7C007B7B7B007C7C7C007B7B7B007A7A7A007D7D7D007C7C
      7C007B7B7B007D7D7D007B7B7B007D7D7D007D7D7D007A7A7A007C7C7C007B7B
      7B007B7B7B007B7B7B007B7B7B0078787800777777007D7D7D0084848400E2E2
      E20000000000FEFEFE000000000000000000000000000000000000000000FEFE
      FE0000000000C8D9EB004077AD00ABB0B700DBD9D600D4D4D400D5D5D400D5D4
      D400D5D4D400D5D5D400D5D5D400D5D5D400D5D5D400D5D4D400D5D5D400D5D4
      D400D5D4D400D5D5D400D2D2D100D0CFCF00CBCBCA00C9C9C900C8CACC00C1C6
      CB00B4BDC5007492AE00598BBA00EAF0F6000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000D9D9D90076767600B0B0
      B000D8D8D800D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D1D1D100CFCF
      CF00CACACA00C9C9C900CACACA00C6C6C600BCBCBC00919191008A8A8A00F0F0
      F00000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000C8D9EB004077AD00ABB0B700DBD9D600D4D4D400D5D5D400D5D4
      D400D5D4D400D5D5D400D5D5D400D5D5D400D5D5D400D5D4D400D5D5D400D5D4
      D400D5D4D400D5D5D400D2D2D100D0CFCF00CBCBCA00C9C9C900C8CACC00C1C6
      CB00B4BDC5007492AE00598BBA00EAF0F6000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000D9D9D90076767600B0B0
      B000D8D8D800D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4
      D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D1D1D100CFCF
      CF00CACACA00C9C9C900CACACA00C6C6C600BCBCBC00919191008A8A8A00F0F0
      F00000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000C9DCEC003E76AB00B7BEC40000000000FEFEFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFF
      FF00000000009CABB800588CBA00F0F5F9000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000DBDBDB0075757500BDBD
      BD0000000000FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000AAAAAA008A8A8A00F4F4
      F40000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000C9DCEC003E76AB00B7BEC40000000000FEFEFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFF
      FF00000000009CABB800588CBA00F0F5F9000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000DBDBDB0075757500BDBD
      BD0000000000FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000AAAAAA008A8A8A00F4F4
      F40000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000CCDEEC003E77AC00B4BBC20000000000FEFEFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFE00FEFEFE00FFFEFE00FDFE
      FE000000000096A9B9005A8FBD00F2F7FB000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000DCDCDC0075757500BBBB
      BB0000000000FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FEFEFE00FEFEFE00FDFDFD0000000000A8A8A8008C8C8C00F6F6
      F60000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000CCDEEC003E77AC00B4BBC20000000000FEFEFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FEFEFE00FFFEFE00FFFEFE00FFFEFE00FDFE
      FE000000000096A9B9005A8FBD00F2F7FB000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000DCDCDC0075757500BBBB
      BB0000000000FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FDFDFD0000000000A8A8A8008C8C8C00F6F6
      F60000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000CEDFED004076AC00B4BBC30000000000FEFEFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFF
      FF000000000095A7B8005D91BF00F5F9FC000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000DEDEDE0076767600BBBB
      BB0000000000FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000A6A6A6008F8F8F00F8F8
      F80000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000CEDFED004076AC00B4BBC30000000000FEFEFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFF
      FF000000000095A7B8005D91BF00F5F9FC000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000DEDEDE0076767600BBBB
      BB0000000000FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000A6A6A6008F8F8F00F8F8
      F80000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000D3E1EE004177AD00B2BCC30000000000FEFEFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFF
      FF00000000008FA4B5006195C100F9FBFC000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000E0E0E00077777700BBBB
      BB0000000000FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000A2A2A20092929200FAFA
      FA0000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000D3E1EE004177AD00B2BCC30000000000FEFEFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFEFE00FCFEFD00000000000000000000000000FEFF
      FF00000000008FA4B5006195C100F9FBFC000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000E0E0E00077777700BBBB
      BB0000000000FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00FDFD
      FD00000000000000000000000000FEFEFE0000000000A2A2A20092929200FAFA
      FA0000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000D6E3EF00437BB000B3BCC40000000000FEFEFF00000000000000
      0000000000000000000000000000000000000000000000000000FEFFFE00FAFC
      FA00F8FBF800FBFDFB00FEFFFE0000000000000000000000000000000000FEFF
      FF00000000008BA0B2006397C300FBFCFD000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000E2E2E2007A7A7A00BBBB
      BB0000000000FEFEFE0000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00FAFAFA00F9F9F900FBFBFB00FEFEFE000000
      0000000000000000000000000000FEFEFE00000000009F9F9F0094949400FCFC
      FC0000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000D6E3EF00437BB000B3BCC40000000000FEFEFF00000000000000
      000000000000F7FBF800E7F1E900D5E8D900C7E1CC00BEDCC400BCDAC300BFDC
      C600C8E1CD00D2E7D700BCD8C100BBD7BE00F4FAF3000000000000000000FEFF
      FF00000000008BA0B2006397C300FBFCFD000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000E2E2E2007A7A7A00BBBB
      BB0000000000FEFEFE00000000000000000000000000F8F8F800EBEBEB00DCDC
      DC00D1D1D100CACACA00C8C8C800CBCBCB00D2D2D200DADADA00C7C7C700C5C5
      C500F5F5F5000000000000000000FEFEFE00000000009F9F9F0094949400FCFC
      FC0000000000000000000000000000000000000000000000000000000000FEFE
      FF0000000000DAE6F1004580B400B2BCC50000000000FEFEFF0000000000FCFD
      FC00F4F9F400EDF5EE00EFF6F000F4F9F500F9FBF900FBFCFB00EFF5EF00D0E5
      D500BBDAC100B8D8BF00BDDBC300C1DDC600CFE5D400EBF4ED00FEFFFE000000
      000000000000889FB3006498C500FDFEFE000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000E5E5E5007D7D7D00BBBB
      BB0000000000FEFEFE0000000000FCFCFC00F5F5F500F0F0F000F1F1F100F6F6
      F600F9F9F900FBFBFB00F1F1F100D8D8D800C7C7C700C5C5C500C9C9C900CCCC
      CC00D8D8D800EEEEEE00FEFEFE0000000000000000009E9E9E0095959500FDFD
      FD0000000000000000000000000000000000000000000000000000000000FEFE
      FF0000000000DAE6F1004580B400B2BCC50000000000FEFEFF00000000000000
      0000FEFEFE00D6E8DA00B1D5B900B7D5BC00C6DBCA00CFE0D200CADDCD00ADCE
      B30096C29E0092C19A007BBE8D0074BF8E00D3E1DD000000000000000000FEFF
      FF0000000000889FB3006498C500FDFEFE000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000E5E5E5007D7D7D00BBBB
      BB0000000000FEFEFE000000000000000000FEFEFE00DDDDDD00BFBFBF00C2C2
      C200CECECE00D5D5D500D1D1D100BABABA00A7A7A700A4A4A400979797009595
      9500DBDBDB000000000000000000FEFEFE00000000009E9E9E0095959500FDFD
      FD0000000000000000000000000000000000000000000000000000000000FEFE
      FF0000000000DDE9F3004885B800B0BBC50000000000FDFEFF0000000000F9FB
      F900EAF3EC00DBEBDE00D2E6D600CEE4D300CCE3D000C7DFCC00C6DECB00C1DA
      C500AED0B4009FC9A80095C7A000A1CDAB00CBE2CF00F2F7F30000000000FEFF
      FF00000000008CA5B900679CC700000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000E8E8E80081818100BABA
      BA0000000000FEFEFE0000000000F9F9F900EDEDED00E1E1E100DADADA00D7D7
      D700D5D5D500D0D0D000CFCFCF00CACACA00BBBBBB00B0B0B000A9A9A900B3B3
      B300D4D4D400F4F4F40000000000FEFEFE0000000000A3A3A300989898000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FF0000000000DDE9F3004885B800B0BBC50000000000FEFEFF00FCFDFC00EEF5
      F000E6F2E900D4E7D700D1E3D300BEE3C80096DEA90073D68E0065CF830064C9
      80007FC99200B9D2BB0055DA960036BF6900E8E9EF000000000000000000FEFF
      FF00000000008CA5B900679CC700000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000E8E8E80081818100BABA
      BA0000000000FEFEFE00FCFCFC00F1F1F100EBEBEB00DBDBDB00D7D7D700CDCD
      CD00B4B4B4009D9D9D00929292008F8F8F009E9E9E00C2C2C200979797007474
      7400EAEAEA000000000000000000FEFEFE0000000000A3A3A300989898000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FF0000000000E0EBF5004887B900B0BCC600FFFEFC00FCFCFD00000000000000
      0000FEFEFE00FBFDFC00F5F9F600EFF6F000E8F2EB00EBF2EB00C4E4CD00B1DD
      BF00E0EEE500E8F0EA00E2E5E000EDEEEB00FDFEFD000000000000000000FBFC
      FC00FFFFFB008AA5BA006CA1CC00000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000EAEAEA0082828200BBBB
      BB00FDFDFD00FCFCFC000000000000000000FEFEFE00FCFCFC00F6F6F600F1F1
      F100ECECEC00EDEDED00D1D1D100C4C4C400E6E6E600EBEBEB00E2E2E200ECEC
      EC00FDFDFD000000000000000000FBFBFB00FDFDFD00A3A3A3009D9D9D000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FF0000000000E0EBF5004887B900B0BCC600FFFEFC00FDFDFE00FBFCFB00CCE3
      D100B2D3B700B8D7BF0067CB8B0011B53F0000BD350000C73D0000C93C0000C4
      3A0001BB3A0024B348001CBA4F000AB33400D1F0D7000000000000000000FBFC
      FC00FFFFFB008AA5BA006CA1CC00000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000EAEAEA0082828200BBBB
      BB00FDFDFD00FDFDFD00FBFBFB00D5D5D500BEBEBE00C4C4C400949494005757
      570050505000565656005757570054545400525252005F5F5F00616161005050
      5000DDDDDD000000000000000000FBFBFB00FDFDFD00A3A3A3009D9D9D000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FF0000000000E2EDF6004A88BB00AEBCC700FFFFFD00FCFDFD0000000000FEFF
      FF00FEFFFF00FEFFFF000000000000000000FCFEFD0000000000B8E8CB000DBA
      4C0034CC6E006BE39E00A2F3C900D0F9E600FCFFFE000000000000000000FAFB
      FB00FFFDF80088A3BB0071A3CE0000000000FEFFFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000ECECEC0084848400BBBB
      BB00FEFEFE00FCFCFC0000000000FEFEFE00FEFEFE00FEFEFE00000000000000
      0000FDFDFD0000000000CECECE005B5B5B007A7A7A00A4A4A400CACACA00E5E5
      E500FDFDFD000000000000000000FAFAFA00FCFCFC00A2A2A200A0A0A0000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFE
      FF0000000000E2EDF6004A88BB00AEBCC700FFFFFD00FCFDFD0000000000EFF5
      F000D5E7D60069CE900010B13E0003BC370001D5500001E05A0000D8490005CE
      440007BA390001A3250004A5260000B52E0085DFA10000000000FEFFFF00FAFB
      FB00FFFDF80088A3BB0071A3CE0000000000FEFFFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000ECECEC0084848400BBBB
      BB00FEFEFE00FCFCFC0000000000F1F1F100DBDBDB0097979700555555005252
      52006262620069696900606060005D5D5D005353530043434300454545004B4B
      4B00ACACAC0000000000FEFEFE00FAFAFA00FCFCFC00A2A2A200A0A0A0000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFE
      FF0000000000E4EEF6004D8CBE00AFBDC80000000000FCFDFE0000000000F4FB
      F500FAFDFA0000000000FEFEFE00FEFFFF00FEFFFF00FEFEFE000000000045CB
      730000BF3B0002C03E0002C03E0016C34D0035D0690061D98C00A7E1BC000000
      0000FFFFFB0086A4BB0074A7D00000000000FEFFFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000EDEDED0087878700BCBC
      BC0000000000FDFDFD0000000000F6F6F600FBFBFB0000000000FEFEFE00FEFE
      FE00FEFEFE00FEFEFE0000000000818181005353530055555500555555006262
      62007A7A7A0097979700C1C1C10000000000FDFDFD00A1A1A100A3A3A3000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFE
      FF0000000000E4EEF6004D8CBE00AFBDC80000000000FCFDFE00000000000000
      0000EAFCF10041C464005ECE78004AE27F001DE16C002CDA6A0039D66A000CC0
      3F0000AA270000AA270001B7310000C73D0046DA7C00FCFCFD0000000000FCFE
      FE00FFFFFB0086A4BB0074A7D00000000000FEFFFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000EDEDED0087878700BCBC
      BC0000000000FDFDFD000000000000000000F2F2F200787878008C8C8C008E8E
      8E00787878007A7A7A007D7D7D005959590045454500454545004D4D4D005656
      560089898900FCFCFC0000000000FDFDFD00FDFDFD00A1A1A100A3A3A3000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFE
      FF0000000000E5EFF600508FC000ADBDC8000000000000000000FCFEFB0050BD
      670062C47900F3FAF40000000000000000000000000000000000FCFCFC0054C7
      730002B52E000DB734000AB8320006B92F0011BB36000EBB3F008DDCAE000000
      0000FFFEFA0084A4BC007BACD30000000000FEFFFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000EEEEEE008A8A8A00BBBB
      BB000000000000000000FCFCFC007C7C7C008A8A8A00F5F5F500000000000000
      00000000000000000000FCFCFC00848484004C4C4C0052525200515151004F4F
      4F005656560058585800B2B2B20000000000FDFDFD00A1A1A100A8A8A8000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFE
      FF0000000000E5EFF600508FC000ADBDC80000000000FDFEFE0000000000FDFE
      FE000000000099E0B10056CC77008DE7AA00C5EED100F4FAF600FEFFFF00CCED
      D5002DB34E0015AF39002BC9580041E0770044E88900D5F6E50000000000FCFD
      FD00FFFEFB0084A4BC007BACD30000000000FEFFFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000EEEEEE008A8A8A00BBBB
      BB0000000000FDFDFD0000000000FDFDFD0000000000B8B8B80088888800B4B4
      B400D6D6D600F6F6F600FEFEFE00DADADA0064646400545454006E6E6E008888
      880091919100E5E5E50000000000FCFCFC00FDFDFD00A1A1A100A8A8A8000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFE
      FF0000000000E6F0F7005090C100ABBCC80000000000FAFCFD0074C583000094
      1A0000981F002BAB460096D3A200D9EFDC00E4F4E600B6E3BF0044B85E0000A6
      270009B0310009BC37000BC9410027D35A0044D770003FD68000EAFAF4000000
      0000FFFFFB0080A2BB0080B1D60000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000EFEFEF008B8B8B00BABA
      BA0000000000FBFBFB00949494003A3A3A003D3D3D005E5E5E00AEAEAE00E1E1
      E100EAEAEA00C8C8C80073737300444444004E4E4E00545454005C5C5C007171
      71008383830087878700F2F2F20000000000FDFDFD009F9F9F00ADADAD000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFE
      FF0000000000E6F0F7005090C100ABBCC80000000000FDFEFE0000000000FDFE
      FD00FEFFFE00F6FCF900BCE7CB00FAFDFB0000000000FEFFFE0000000000CDF8
      E6003ED37E0094DCA20089E5A4007AE9A10060E39300B7EACA0000000000FDFF
      FF00FFFFFC0080A2BB0080B1D60000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000EFEFEF008B8B8B00BABA
      BA0000000000FDFDFD0000000000FDFDFD00FEFEFE00F9F9F900CFCFCF00FBFB
      FB0000000000FEFEFE0000000000E3E3E30085858500B0B0B000B0B0B000ACAC
      AC009C9C9C00CECECE0000000000FEFEFE00FEFEFE009F9F9F00ADADAD000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFE
      FF0000000000E8F1F8005193C400A7BAC60000000000D0EBD7000D9D2700029A
      2000089B270001991D00009A1C0009A32B000FAB360000AB2D0001B231000ABE
      410009CC4A0009DB580037E87A006BF19F004BE1870083EEB90000000000FDFF
      FF00FFFEF9007DA2BB0083B7DA0000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F0F0F0008D8D8D00B7B7
      B70000000000DBDBDB00454545003E3E3E00434343003D3D3D003C3C3C004747
      470050505000484848004C4C4C00585858005F5F5F006969690088888800A9A9
      A90091919100B8B8B80000000000FEFEFE00FCFCFC009E9E9E00B1B1B1000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFE
      FF0000000000E8F1F8005193C400A9BAC70000000000FDFEFE00000000000000
      00000000000000000000F3FBF500A5E2B30080DCA100D8F7E900000000007ED1
      9F0070D79500BCE6C200B3E9C200C0EBCB00DAF0DE00F9FCF900000000000000
      0000FFFEF9007DA2BB0083B7DA0000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F0F0F0008D8D8D00B8B8
      B80000000000FDFDFD0000000000000000000000000000000000F6F6F600BEBE
      BE00A9A9A900E8E8E80000000000A4A4A4009E9E9E00CCCCCC00CACACA00D2D2
      D200E2E2E200FAFAFA000000000000000000FCFCFC009E9E9E00B1B1B1000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000E9F2F8005497C500A6B9C600FFFFFE0000000000B1DFBA00069D
      230001A4290008B5350008C43D0006C5400005C4410008C746000BCD4D0006D7
      54000CE567004CF2940079F6B10096F6C10040E58D00D9FAEB0000000000FEFF
      FF00FFFCF8007BA2BD0088BADC0000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F1F1F10090909000B7B7
      B700FEFEFE0000000000C3C3C300424242004444440050505000585858005959
      5900585858005C5C5C006161610065656500727272009B9B9B00B5B5B500C4C4
      C40090909000EAEAEA0000000000FEFEFE00FBFBFB009E9E9E00B4B4B4000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000E9F2F8005497C500A6B9C60000000000FDFEFE0000000000DAF2
      E00094DFAC0054D380001BC8580004B73A0018CC6800D6F7E80000000000F6FA
      F60000000000F1FAF400E1F4E70000000000FEFFFE0000000000000000000000
      0000FFFCF8007BA2BD0088BADC0000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F1F1F10090909000B7B7
      B70000000000FDFDFD0000000000E4E4E400B5B5B5008D8D8D00696969005151
      51006E6E6E00E7E7E70000000000F7F7F70000000000F5F5F500E9E9E9000000
      0000FEFEFE00000000000000000000000000FBFBFB009E9E9E00B4B4B4000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000EBF3F9005799C900A4B7C50000000000FDFEFF0000000000A6D7
      B0000FA6310000BE310004DA4E0008E6630009E9690006E8690002E96A000FEC
      760044ED8D0072EDA300BDFBD90082E8AB006DE7A90000000000FEFFFE000000
      0000FFFCF70078A0BD008CBDDF0000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F2F2F20093939300B5B5
      B50000000000FEFEFE0000000000B9B9B9004C4C4C004F4F4F00646464007070
      70007373730072727200717171007B7B7B0094949400ABABAB00DBDBDB00B1B1
      B100A9A9A90000000000FEFEFE0000000000FBFBFB009C9C9C00B8B8B8000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000EBF3F9005799C900A4B7C50000000000FCFEFE000000000084DE
      A60007CA510000D0510006CC4D0007BA3E0064D18E0000000000FEFFFE000000
      0000E7F9ED005AC2770018A84300DAF6E50000000000FEFFFE00000000000000
      0000FFFCF70078A0BD008CBDDF0000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F2F2F20093939300B5B5
      B50000000000FDFDFD0000000000ADADAD0060606000606060005F5F5F005555
      55009696960000000000FEFEFE0000000000EFEFEF008686860056565600E7E7
      E70000000000FEFEFE000000000000000000FBFBFB009C9C9C00B8B8B8000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000ECF4F9005A9DCC00A1B6C400FFFFFE00FDFEFF00FEFEFE000000
      0000D5ECD90064C27A0023BA4C000CC7470007D2520014DB61002AE172005DE6
      93008EE8AC00B2E7C300DAF4E10048C17300CEF1DE0000000000000000000000
      0000FFFAF60075A0BD0090C0E00000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F3F3F30096969600B3B3
      B300FEFEFE00FEFEFE00FEFEFE0000000000DEDEDE008A8A8A00636363005E5E
      5E0063636300707070007F7F7F009C9C9C00B6B6B600C9C9C900E5E5E5007E7E
      7E00DFDFDF00000000000000000000000000FAFAFA009B9B9B00BABABA000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000ECF4F9005A9DCC00A1B6C400FFFFFE00FDFEFF0000000000E0F6
      EA005CDD8B0020DF6C0005D34F000ABB3F0018B3410065D2880093E0AC0066D2
      880018B9490000A72B0000941D003BB65E00FBFFFF0000000000000000000000
      0000FFFAF60075A0BD0090C0E00000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F3F3F30096969600B3B3
      B300FEFEFE00FEFEFE0000000000EAEAEA009696960079797900626262005656
      56005959590095959500B5B5B500959595005E5E5E00464646003B3B3B006F6F
      6F00FDFDFD00000000000000000000000000FAFAFA009B9B9B00BABABA000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000EEF5FA005CA0CE009FB5C400FFFFFE00FDFEFF0000000000FEFE
      FE0000000000FFFEFF00E7EEE600C8E5CB00C2E8CA00D0F1D900E3F8EA00F6FE
      FA0000000000000000009FD4B1007AC6930000000000FEFEFE00000000000000
      0000FFF8F400739FBD0096C4E30000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F4F4F40098989800B2B2
      B200FEFEFE00FEFEFE0000000000FEFEFE0000000000FEFEFE00E9E9E900D2D2
      D200D1D1D100DEDEDE00ECECEC00FAFAFA000000000000000000B6B6B6009B9B
      9B0000000000FEFEFE000000000000000000F9F9F9009A9A9A00BFBFBF000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000EEF5FA005CA0CE009FB5C400FFFFFE00FDFEFF0000000000F7FC
      FA00A0E7BA0072E69A0024D45F0008BB3C000AB93C0000C13A0000C43D0000C5
      3D0003C33D0005B33300009E240086D9A10000000000FEFFFE00000000000000
      0000FFF8F400739FBD0096C4E30000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F4F4F40098989800B2B2
      B200FEFEFE00FEFEFE0000000000F9F9F900C0C0C000A6A6A600727272005555
      550055555500535353005555550056565600565656004E4E4E0040404000AAAA
      AA0000000000FEFEFE000000000000000000F9F9F9009A9A9A00BFBFBF000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000EEF6FA005DA1CF009DB4C400FFFFFE00FEFFFF00000000000000
      0000FDFEFD00FEFEFE0000000000000000000000000000000000000000000000
      0000FDFFFE0000000000E5F3EA00F9FCFA000000000000000000000000000000
      0000FEF7F200709DBC009CC7E50000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F4F4F40099999900B1B1
      B100FEFEFE00FEFEFE000000000000000000FDFDFD00FEFEFE00000000000000
      000000000000000000000000000000000000FEFEFE0000000000EBEBEB00FAFA
      FA0000000000000000000000000000000000F7F7F70098989800C2C2C2000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000EEF6FA005DA1CF009DB4C400FFFFFE00FEFFFF00FEFFFE000000
      0000D3F3DF00B5EDC60073D78E001CB5430000B4300007D1470007DF5D0003E2
      620000CB3A000DAF32008FDDA70000000000FFFFFE0000000000000000000000
      0000FEF7F200709DBC009CC7E50000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F4F4F40099999900B1B1
      B100FEFEFE00FEFEFE00FEFEFE0000000000E1E1E100CDCDCD009D9D9D005C5C
      5C004C4C4C005F5F5F006B6B6B006D6D6D00575757004F4F4F00B1B1B1000000
      0000FEFEFE00000000000000000000000000F7F7F70098989800C2C2C2000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000F0F6FA005FA3D0009BB4C500FFFFFE00FEFFFF00000000000000
      00000000000000000000FEFFFE00FEFEFE00FDFFFE00FEFFFE00FEFFFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCF6F1006C9CBD009FCAE70000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F5F5F5009B9B9B00B1B1
      B100FEFEFE00FEFEFE0000000000000000000000000000000000FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6F60097979700C5C5C5000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000F0F6FA005FA3D0009BB4C500FFFFFE00FEFFFF00000000000000
      0000F3FAF500B9EECE004ADC8D00ABDFB70053CC760020C955001BD15A002CD5
      65006CDB8C00DCF5E20000000000FDFFFD000000000000000000000000000000
      0000FCF6F1006C9CBD009FCAE70000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F5F5F5009B9B9B00B1B1
      B100FEFEFE00FEFEFE000000000000000000F6F6F600D1D1D10091919100C0C0
      C000878787006A6A6A006C6C6C00777777009B9B9B00E6E6E60000000000FDFD
      FD0000000000000000000000000000000000F6F6F60097979700C5C5C5000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000F0F6FA0062A6D20099B3C400FFFFFE00FEFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00000000000000000000000000000000000000
      0000FAF4F0006B9EBE00A5CDE90000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F5F5F5009E9E9E00B0B0
      B000FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE000000
      000000000000000000000000000000000000F4F4F40097979700C9C9C9000000
      0000FEFEFE00000000000000000000000000000000000000000000000000FEFF
      FF0000000000F0F6FA0062A6D20099B3C400FFFFFE00FEFFFF0000000000FCFE
      FD0000000000A7EAC60096F2C60000000000FBFEFC00EEF9F100E9F7EC00F3FA
      F3000000000000000000FDFEFE00000000000000000000000000000000000000
      0000FAF4F0006B9EBE00A5CDE90000000000FEFEFF0000000000000000000000
      0000000000000000000000000000FEFEFE0000000000F5F5F5009E9E9E00B0B0
      B000FEFEFE00FEFEFE0000000000FDFDFD0000000000C7C7C700C4C4C4000000
      0000FCFCFC00F2F2F200EEEEEE00F5F5F5000000000000000000FDFDFD000000
      000000000000000000000000000000000000F4F4F40097979700C9C9C9000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F3F8FB0064A7D30096B2C400FFFFFE00FEFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFE000000
      0000F8F2EF006A9EC000A8D0E90000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000F7F7F7009F9F9F00AEAE
      AE00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000F3F3F30098989800CBCBCB000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F3F8FB0064A7D30096B2C400FFFFFE00FEFFFF00000000000000
      000000000000F4FCF700F9FDFB00FDFEFD00FEFFFE0000000000000000000000
      0000FCFEFD00FEFFFE0000000000000000000000000000000000FFFFFE000000
      0000F8F2EF006A9EC000A8D0E90000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000F7F7F7009F9F9F00AEAE
      AE00FEFEFE00FEFEFE00000000000000000000000000F7F7F700FBFBFB00FDFD
      FD00FEFEFE00000000000000000000000000FDFDFD00FEFEFE00000000000000
      00000000000000000000FEFEFE0000000000F3F3F30098989800CBCBCB000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F4F8FB0066AAD50095B1C400FFFFFD00FEFFFF00000000000000
      000000000000FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFE000000
      0000F6F0ED00679DC000ADD2EB0000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700A1A1A100AEAE
      AE00FEFEFE00FEFEFE00000000000000000000000000FEFEFE00FEFEFE00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000F1F1F10096969600CECECE000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F4F8FB0066AAD50095B1C400FFFFFD00FEFFFF00000000000000
      0000FEFEFE0000000000FEFFFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFE000000
      0000F6F0ED00679DC000ADD2EB0000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700A1A1A100AEAE
      AE00FEFEFE00FEFEFE000000000000000000FEFEFE0000000000FEFEFE00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000F1F1F10096969600CECECE000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F6F9FC0069ADD70091B0C300FFFFFC00FEFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFE000000
      0000F4EFEB00669CBF00B3D5EC0000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900A4A4A400ACAC
      AC00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000EFEFEF0095959500D1D1D1000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F6F9FC0069ADD70091B0C300FFFFFC00FEFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFE000000
      0000F4EFEB00669CBF00B3D5EC0000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900A4A4A400ACAC
      AC00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000EFEFEF0095959500D1D1D1000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F7F9FC006AACD70090AFC300FFFFFC00FEFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFE00FEFEFE000000
      0000F1EDE900629ABF00B6D8EE0000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900A4A4A400ABAB
      AB00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FEFEFE0000000000EDEDED0093939300D4D4D4000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F7F9FC006AACD70090AFC300FFFFFC00FEFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFE00FEFEFE000000
      0000F1EDE900629ABF00B6D8EE0000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900A4A4A400ABAB
      AB00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FEFEFE0000000000EDEDED0093939300D4D4D4000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F8FBFD006CACD6008BACC100FFFEFC00FDFEFF0000000000F5F5
      F600E6E6E600E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E7E7E700E7E7E700F8F8F900FEFFFF00FDFDFE000000
      0000EEEAE8005F9ABF00BBDBEF0000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00A4A4A400A8A8
      A800FDFDFD00FEFEFE0000000000F5F5F500E6E6E600E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E7E7E700E7E7
      E700F8F8F800FEFEFE00FDFDFD0000000000EAEAEA0092929200D7D7D7000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F8FBFD006CACD6008BACC100FFFEFC00FDFEFF0000000000F5F5
      F600E6E6E600E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E7E7E700E7E7E700F8F8F900FEFFFF00FDFDFE000000
      0000EEEAE8005F9ABF00BBDBEF0000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00A4A4A400A8A8
      A800FDFDFD00FEFEFE0000000000F5F5F500E6E6E600E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E7E7E700E7E7
      E700F8F8F800FEFEFE00FDFDFD0000000000EAEAEA0092929200D7D7D7000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F9FBFC006EAED8008EACBF00FFFFFC00FEFFFF0000000000E7E6
      E400CECECD00D5D5D500D4D4D400D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500D5D5D500D5D5D500CCCCCC00EEECEA0000000000FEFEFE000000
      0000F1EBE700629BC000BEDCF00000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00A6A6A600A8A8
      A800FEFEFE00FEFEFE0000000000E5E5E500CDCDCD00D5D5D500D4D4D400D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500CCCC
      CC00ECECEC0000000000FEFEFE0000000000EBEBEB0094949400D8D8D8000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000F9FBFC006EAED8008EACBF00FFFFFC00FEFFFF0000000000E7E6
      E400CECECD00D5D5D500D4D4D400D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500D5D5D500D5D5D500CCCCCC00EEECEA0000000000FEFEFE000000
      0000F1EBE700629BC000BEDCF00000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00A6A6A600A8A8
      A800FEFEFE00FEFEFE0000000000E5E5E500CDCDCD00D5D5D500D4D4D400D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500CCCC
      CC00ECECEC0000000000FEFEFE0000000000EBEBEB0094949400D8D8D8000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000FAFBFD006FADD900609AC10097B9CF0092B7D10093B9D30092A9
      B800AAA7A500B0B1B100AEAEAE00ACACAC00ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00B1B1B100A6A5A4008DA9BB0096BBD40094B9D10095BA
      D2008EB1C9005098C600C3DDEF0000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00A7A7A7009393
      9300B5B5B500B3B3B300B5B5B500A6A6A600A7A7A700B0B0B000AEAEAE00ACAC
      AC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00B1B1B100A5A5
      A500A5A5A500B7B7B700B4B4B400B5B5B500ADADAD008F8F8F00DADADA000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000FAFBFD006FADD900609AC10097B9CF0092B7D10093B9D30092A9
      B800AAA7A500B0B1B100AEAEAE00ACACAC00ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00B1B1B100A6A5A4008DA9BB0096BBD40094B9D10095BA
      D2008EB1C9005098C600C3DDEF0000000000FEFEFF0000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00A7A7A7009393
      9300B5B5B500B3B3B300B5B5B500A6A6A600A7A7A700B0B0B000AEAEAE00ACAC
      AC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00ACACAC00B1B1B100A5A5
      A500A5A5A500B7B7B700B4B4B400B5B5B500ADADAD008F8F8F00DADADA000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000FEFFFF00D4E5F200BFDDF000BADAED00B8D6EA00BEDAEE00A6B7
      C300817F7E007B7B7C0080807F008D8D8D008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C008A8A8A00777777007E7D7D00ABBFCD00BDDAEC00BAD8ED00BAD9
      EC00BDDBEF00C5DEF000EEF5FA00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00E3E3E300D9D9
      D900D5D5D500D2D2D200D7D7D700B5B5B5007F7F7F007B7B7B007F7F7F008D8D
      8D008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008A8A8A00777777007D7D
      7D00BDBDBD00D6D6D600D5D5D500D5D5D500D7D7D700DBDBDB00F4F4F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFFFF00D4E5F200BFDDF000BADAED00B8D6EA00BEDAEE00A6B7
      C300817F7E007B7B7C0080807F008D8D8D008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C008A8A8A00777777007E7D7D00ABBFCD00BDDAEC00BAD8ED00BAD9
      EC00BDDBEF00C5DEF000EEF5FA00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00E3E3E300D9D9
      D900D5D5D500D2D2D200D7D7D700B5B5B5007F7F7F007B7B7B007F7F7F008D8D
      8D008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008A8A8A00777777007D7D
      7D00BDBDBD00D6D6D600D5D5D500D5D5D500D7D7D700DBDBDB00F4F4F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00FCFCFC00DBDBDB00B0B0B000BBBBBB00BABABA00BABABA00BABABA00BABA
      BA00BABABA00B7B7B700B8B8B800F6F6F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFD00FCFCFC00DBDBDB00B0B0B000BBBB
      BB00BABABA00BABABA00BABABA00BABABA00BABABA00B7B7B700B8B8B800F6F6
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00FCFCFC00DBDBDB00B0B0B000BBBBBB00BABABA00BABABA00BABABA00BABA
      BA00BABABA00B7B7B700B8B8B800F6F6F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFD00FCFCFC00DBDBDB00B0B0B000BBBB
      BB00BABABA00BABABA00BABABA00BABABA00BABABA00B7B7B700B8B8B800F6F6
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFEFE00FDFEFE00FDFEFE00FDFEFE00FDFEFE00FDFE
      FE0000000000ECECEC00CBCBCB00CECECE00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CCCCCC00D3D3D300FEFEFE00FEFFFF00FDFEFE00FDFEFE00FDFE
      FE00FDFEFE00FDFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD0000000000ECECEC00CBCBCB00CECE
      CE00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CCCCCC00D3D3D300FEFE
      FE00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFEFE00FDFEFE00FDFEFE00FDFEFE00FDFEFE00FDFE
      FE0000000000ECECEC00CBCBCB00CECECE00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CCCCCC00D3D3D300FEFEFE00FEFFFF00FDFEFE00FDFEFE00FDFE
      FE00FDFEFE00FDFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD0000000000ECECEC00CBCBCB00CECE
      CE00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CCCCCC00D3D3D300FEFE
      FE00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00F3F3F300F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F1F1F100F8F8F800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F3F3F300F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F1F1F100F8F8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00F3F3F300F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F1F1F100F8F8F800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F3F3F300F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F1F1F100F8F8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC00F5F5F500F5F5F500F0F0F000E9E9E900E3E3E300E4E4E400ECECEC00F7F7
      F700FCFCFC00FBFBFB00FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FCFCFC00F5F5F500F5F5F500F0F0F000E9E9
      E900E3E3E300E4E4E400ECECEC00F7F7F700FCFCFC00FBFBFB00FCFCFC000000
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
      000000000000000000000000000000000000FCFCFC00D2D2D200939494007374
      7400828283009D9C9C0097979600888787007877770067666600636263007372
      72009A9A9A00CDCECE00E4E4E400E7E7E700F4F4F400FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00D2D2D2009393930073737300828282009C9C9C00969696008787
      8700777777006666660062626200727272009A9A9A00CDCDCD00E4E4E400E7E7
      E700F4F4F400FDFDFD0000000000000000000000000000000000000000000000
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
      00000000000000000000FEFEFE00E7E7E7009192920043424200413B39005B4F
      49007561580081695D00856A5D0082665900786054006E594F00594A42003D36
      3300232121002E2D2D0091919100C9C9C900CECECE00E4E4E400F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00E7E7
      E70091919100424242003C3C3C0051515100646464006D6D6D006E6E6E006B6B
      6B00646464005C5C5C004C4C4C0037373700212121002D2D2D0091919100C9C9
      C900CECECE00E4E4E400F9F9F900000000000000000000000000000000000000
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
      00000000000000000000E2E3E30094959500635A5600826C6100B3938400C8A0
      8F00CBA59400CFAA9A00CBA89800B6948000B3958200B9978300CA9D8900B889
      7600896A5C003A2D270017161600A5A6A600BFBFBF00C3C3C300E1E1E100FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2E2E2009494
      94005B5B5B006F6F6F0098989800A7A7A700ACACAC00B1B1B100AEAEAE009898
      9800989898009B9B9B00A5A5A500929292006F6F6F002F2F2F0016161600A5A5
      A500BFBFBF00C3C3C300E1E1E100FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6E6E60084848400696969007C7C7C008383
      83009C9C9C00C0C0C000DEDEDE00EAEAEA00EDEDED00EBEBEB00E7E7E700E2E2
      E200DDDDDD00D9D9D900BFBFBF00959595008585850096969600ADADAD00A4A4
      A400B7B7B700F8F8F80000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E6E6
      E60084848400696969007C7C7C00838383009C9C9C00C0C0C000DEDEDE00EAEA
      EA00EDEDED00EBEBEB00E7E7E700E2E2E200DDDDDD00D9D9D900BFBFBF009595
      95008585850096969600ADADAD00A4A4A400B7B7B700F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FAFAFA00B7B7B70093868000A68A7B00BBA79900BFAFA4009F8B
      7C00B4A79A00D6CBC300CDC1B600DED3CC00D8CBC400CABBB200C9B6AC00C6A2
      9100E5C0B100CDA69500503A300075727100C4C4C400B8B8B800CDCDCD00F4F4
      F400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00B7B7B7008888
      88008E8E8E00A9A9A900B0B0B0008C8C8C00A7A7A700CCCCCC00C1C1C100D4D4
      D400CDCDCD00BDBDBD00B9B9B900A8A8A800C7C7C700ADADAD003E3E3E007272
      7200C4C4C400B8B8B800CDCDCD00F4F4F4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D3D3D3007F7F7F005757570066666600A6A6A600E2E2
      E200FBFBFB00FCFCFC00FCF9FB00F9F3F800F3ECF100EDE5EA00E7DFE500E1D9
      DE00DBD4D900D5D0D300D0CFD000D0D0D000CFCFCF00BABABA00A2A2A200B5B5
      B500C9C9C900BDBDBD00F1F1F100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3D3D3007F7F
      7F005757570066666600A6A6A600E2E2E200FBFBFB00FCFCFC00FAFAFA00F6F6
      F600F0F0F000E9E9E900E3E3E300DDDDDD00D8D8D800D2D2D200CFCFCF00D0D0
      D000CFCFCF00BABABA00A2A2A200B5B5B500C9C9C900BDBDBD00F1F1F1000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFDFD009C918D0096817500C2B4AB00B5AB9F00B8B0A800B9B2
      A900C1B9B000C2BBB000DCD6CF00E7DDD800D5CAC100CFC2BB00C7BCB600BDB0
      A600D9C6BC00F5E2DA00CAB0A50085756F00BDBFC000BABABA00D1D1D100F5F5
      F500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00939393008484
      8400B5B5B500AAAAAA00B0B0B000B1B1B100B8B8B800B9B9B900D5D5D500DEDE
      DE00CACACA00C4C4C400BDBDBD00B1B1B100C9C9C900E5E5E500B5B5B5007878
      7800BEBEBE00BABABA00D1D1D100F5F5F5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF00858585006868680081818100E2E2E200000000000000
      0000FFFCFF00F3EDF100CCD5CD009FBDA6007EAD8A006DA77C006AA47A006FA3
      7D0082A78B009DAFA000B9B9B800C8BFC500C1BBBF00B8B8B800C4C4C400BDBD
      BD00B7B7B700D0D0D000BFBFBF00F1F1F1000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00858585006868
      680081818100E2E2E2000000000000000000FEFEFE00F0F0F000CFCFCF00ABAB
      AB009191910085858500828282008585850091919100A4A4A400B8B8B800C4C4
      C400BEBEBE00B8B8B800C4C4C400BDBDBD00B7B7B700D0D0D000BFBFBF00F1F1
      F100000000000000000000000000000000000000000000000000000000000000
      000000000000FEFFFF00A9918700A7948800DFD9D500D2CBC600C6BEB700CBC3
      BD00E1DDDC00D5D0CB00D5D2CC00DFDCD800D0C6C000C2B8B000C1B7AF00D1C5
      C000D7CCC600E5D8D300DACAC400997D7200C1C4C400CECECE00EAEAEA00FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00959595009696
      9600D9D9D900CBCBCB00BEBEBE00C3C3C300DEDEDE00D0D0D000D1D1D100DBDB
      DB00C7C7C700B8B8B800B7B7B700C7C7C700CDCDCD00DADADA00CDCDCD008282
      8200C3C3C300CECECE00EAEAEA00FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDC008181810078787800B8B8B800FDFDFD0000000000FFFEFF00E5E6
      E40089B5930037974F00149738000DA039000FA93F0012AE450014AF470014AD
      480014A84500169F4300259548004D9261008C9E9000B4ADB100B4B0B300BEBE
      BE00CFCFCF00BFBFBF00CCCCCC00C2C2C200F9F9F90000000000000000000000
      000000000000000000000000000000000000DCDCDC008181810078787800B8B8
      B800FDFDFD0000000000FEFEFE00E5E5E5009B9B9B005F5F5F004B4B4B004C4C
      4C00525252005757570058585800585858005555550052525200565656006A6A
      6A0093939300B0B0B000B2B2B200BEBEBE00CFCFCF00BFBFBF00CCCCCC00C2C2
      C200F9F9F9000000000000000000000000000000000000000000000000000000
      000000000000F8F7F600B8998C00C1B1A500C6BFB900E2DEDF00D7D1CF00AFA7
      9C00D3BEA900DBD0C400D6D5D100E8E6E300D9D4CF00DBD7D400C8C2BC00BFB6
      AF00D5CEC900D7CECA00E9DAD400AB8B7F00E3E4E500F3F3F300FDFDFD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F7009F9F9F00B2B2
      B200BFBFBF00DFDFDF00D2D2D200A6A6A600BEBEBE00CFCFCF00D4D4D400E5E5
      E500D4D4D400D7D7D700C2C2C200B6B6B600CECECE00CFCFCF00DDDDDD009191
      9100E4E4E400F3F3F300FDFDFD00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F5F5
      F5008A8A8A0072727200CECECE000000000000000000FAF6F9008CB796001A92
      390004A232000FB6430017C1510019C256001BC25A001DC35D001EC35F001FC4
      61001FC5620024C5640020C15F0017B65300149F46003B8D56009CA69E00CBC3
      C800CCCCCC00DADADA00C3C3C300C3C3C300CECECE0000000000000000000000
      0000000000000000000000000000F5F5F5008A8A8A0072727200CECECE000000
      000000000000F8F8F8009D9D9D004C4C4C004848480058585800636363006565
      650067676700696969006A6A6A006C6C6C006C6C6C006F6F6F006A6A6A006060
      6000535353005F5F5F00A0A0A000C7C7C700CCCCCC00DADADA00C3C3C300C3C3
      C300CECECE000000000000000000000000000000000000000000000000000000
      000000000000F3EFED00AF918300D0C4BE00D7C9B800C7AA7F00BC976500CABB
      AA00AD753300BC803E00CEB19200D3D1CD00E9E7E500E1DFDC00D1CDC800B9B3
      AA00D7D3CE00E3E0DC00F5ECE900B8978B00F9F8F80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF0096969600C6C6
      C600C8C8C800A5A5A50092929200BABABA00717171007E7E7E00B0B0B000D0D0
      D000E7E7E700DEDEDE00CCCCCC00B2B2B200D2D2D200DFDFDF00EEEEEE009E9E
      9E00F8F8F8000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B4B4
      B40065656500C9C9C9000000000000000000E2E6E200409A5700009F2B000EBE
      480017C3540018C15700229A51002A8951002A8B54002B8C56002C8C57002C8B
      58002B8F590022B6670023C9700022C86F0021CA6D0014BE5D00139846007DA3
      8900DED4DA00DBDBDB00E3E3E300C2C2C200BBBBBB00EAEAEA00000000000000
      0000000000000000000000000000B4B4B40065656500C9C9C900000000000000
      0000E3E3E30065656500434343005C5C5C006464640065656500595959005656
      560058585800595959005A5A5A005A5A5A005B5B5B006A6A6A00747474007373
      73007272720065656500505050008D8D8D00D9D9D900DBDBDB00E3E3E300C2C2
      C200BBBBBB00EAEAEA0000000000000000000000000000000000000000000000
      000000000000EAE4E200B3958800CDC4C000C7AE8400B7853300BD904D00CDB5
      9800AE712400BF7C3200C2813E00E2DAD000FAFAFB00E2DEDB00DCD8D400DCD5
      D100E8E3E100E7E3E000F5F3F100C1A59B00F3F0EE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5E5E5009A9A9A00C5C5
      C500A8A8A8007A7A7A0088888800B3B3B3006B6B6B007979790080808000D9D9
      D900FAFAFA00DEDEDE00D8D8D800D6D6D600E4E4E400E3E3E300F3F3F300ABAB
      AB00F0F0F0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0F0F0006E6E
      6E00ABABAB000000000000000000D9E1DA002095400000B4390011C7510012C5
      560013C95C0016BE5E0088948E00C4B7BF00C0B8BD00C1BABE00C3BBBF00C4BD
      C100C5B8BE003DAF7A0018CF79001FCE7B001ECD79001ECE770019CD700007A7
      4D006DA48000EDE4E900ECECEC00E7E8E700B9B9B900C7C7C700000000000000
      00000000000000000000F0F0F0006E6E6E00ABABAB000000000000000000DCDC
      DC00515151004F4F4F00636363006464640068686800666666008E8E8E00BEBE
      BE00BCBCBC00BDBDBD00BFBFBF00C0C0C000BEBEBE0077777700757575007878
      78007676760076767600727272005353530085858500E8E8E800ECECEC00E7E7
      E700B9B9B900C7C7C70000000000000000000000000000000000000000000000
      000000000000DFD6D200B99F9400C6B69F00C8A56100C1A37200BF9E6F00D8CE
      C400BD976800C7A67F00C1854600D5BB9F00F0F2F300F2F0F000D8D3CE00C5BE
      B600EFEBEA00E9E6E300F4F2F000D2BEB700ECE7E50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7D7D700A4A4A400B3B3
      B3009A9A9A009C9C9C0099999900CECECE0094949400A4A4A40084848400BABA
      BA00F1F1F100F0F0F000D3D3D300BDBDBD00ECECEC00E6E6E600F2F2F200C2C2
      C200E8E8E8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7B7B7007878
      7800FAFAFA0000000000E6E9E6002295420000BB3D000EC953000EC7570010C9
      5E0010CC650012C167009CADA500ECE7E900E6E6E600E8E8E800EBEBEB00EEEE
      EE00F5EDF00049BE8F0011D082001BD287001AD2850019D1820019D17D0015D2
      770000A94E0085B39600FFF5FB00FAFAFA00DCDCDC00ACACAC00F2F2F2000000
      00000000000000000000B7B7B70078787800FAFAFA0000000000E7E7E7005353
      5300525252006363630064646400676767006B6B6B0068686800A4A4A400E9E9
      E900E6E6E600E8E8E800EBEBEB00EEEEEE00F0F0F00087878700767676007C7C
      7C007B7B7B00797979007777770074747400525252009A9A9A00FAFAFA00FAFA
      FA00DCDCDC00ACACAC00F2F2F200000000000000000000000000000000000000
      000000000000D5C9C400C9B0A700E4CD9F00CFBB9800D6D1D100C8C1BA00BEB5
      AB00C8C3BC00C4AB8E00BB7B3600D0A67A00EDEEED00D3D0CA00D3CEC800C8C2
      BB00CEC9C200E3E0DC00F9F7F600C8AFA600E4DCD90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBCBCB00B5B5B500C5C5
      C500B6B6B600D2D2D200C1C1C100B4B4B400C2C2C200A9A9A90079797900A5A5
      A500EDEDED00CFCFCF00CDCDCD00C1C1C100C8C8C800DFDFDF00F7F7F700B4B4
      B400DDDDDD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000083838300C8C8
      C80000000000FFF9FD004CA1630000B335000AC850000BC654000CC85B000DCA
      63000ECD6B000EC46C0090A69C00DFD9DC00D9D9D900DCDCDC00DEDEDE00E2E1
      E100E9E1E40042BD8F000CD2880016D38C0016D28A0015D2870014D1820013D0
      7D000ED0740005A04B00BED2C40000000000FBFBFB00B3B3B300D9D9D9000000
      0000000000000000000083838300C8C8C80000000000FCFCFC00707070004D4D
      4D00606060006161610065656500686868006C6C6C006A6A6A009B9B9B00DCDC
      DC00D9D9D900DCDCDC00DEDEDE00E1E1E100E4E4E40084848400777777007C7C
      7C007B7B7B007A7A7A0077777700757575007070700050505000C6C6C6000000
      0000FBFBFB00B3B3B300D9D9D900000000000000000000000000000000000000
      000000000000CEC0BA00C6AD9C00E1CA9700CDB89200D0C5BB00D4CDC800C2BA
      B300C5B7A600BE864300B9742A00D0A17000D5D5D000BFBBB100D2CEC800B6B0
      A500C6C1B900E7E4E200FBFBFB00D1BBB400DCD1CD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2C2C200AFAFAF00C0C0
      C000B2B2B200C5C5C500CDCDCD00BABABA00B6B6B6008282820072727200A0A0
      A000D3D3D300B9B9B900CDCDCD00AEAEAE00C0C0C000E4E4E400FBFBFB00C0C0
      C000D3D3D3000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E8E80089898900FBFB
      FB0000000000A5C5AC0000A02A0006C84A0008C54E0009C755000AC85C000BCA
      64000CCD6C000AC66E0094AEA200E1DADD00D4D4D400D5D5D500D8D8D800DBDB
      DB00E2DADD003DBB8D0008D2890012D38C0012D38B0011D2880011D1830010D0
      7D000FD0780001C46300339E5F00FCF6F90000000000D6D6D600C4C4C4000000
      000000000000E8E8E80089898900FBFBFB0000000000B2B2B200434343005D5D
      5D005E5E5E006161610064646400686868006C6C6C006A6A6A00A1A1A100DDDD
      DD00D4D4D400D5D5D500D8D8D800DBDBDB00DDDDDD0081818100767676007B7B
      7B007A7A7A00797979007777770074747400727272006262620065656500F9F9
      F90000000000D6D6D600C4C4C400000000000000000000000000000000000000
      000000000000C6B6B100C8AE9400E1C78800D5BA8600CDC5BF00D2C9C300E0DD
      DE00D5C3AD00B2762B00BC7A3100C5B29800DCDCD900C5C0B700D1CDC800CECA
      C500D8D4D000E2DFDC00F8F9F800D7C5BF00D3C6C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9B9B900AEAEAE00BABA
      BA00B1B1B100C5C5C500CACACA00DEDEDE00C1C1C1007171710077777700AFAF
      AF00DBDBDB00BEBEBE00CCCCCC00C9C9C900D4D4D400DFDFDF00F8F8F800C9C9
      C900C8C8C8000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D2D2D200B6B6B6000000
      0000F9F3F7002D98490000BB3A0006C2480007C24D0008C4530009C55B000BC7
      62000BCA6A0007C36C0099B6A900F3ECEF00E3E3E300DBDBDB00D6D6D600D6D5
      D600DBD4D7003AB8890008D0860011D08A0011D0880010CF860010CE81000FCD
      7B000ECB74000CCD6F0000A64800A6C6B00000000000EFEFEF00C3C3C3000000
      000000000000D2D2D200B6B6B60000000000F6F6F6005A5A5A00515151005A5A
      5A005C5C5C005F5F5F0063636300666666006A6A6A0067676700A8A8A800EFEF
      EF00E3E3E300DBDBDB00D6D6D600D5D5D500D7D7D7007E7E7E00747474007979
      7900787878007777770075757500727272006F6F6F006D6D6D004F4F4F00B4B4
      B40000000000EFEFEF00C3C3C300000000000000000000000000000000000000
      000000000000C4B1AB00C1A88D00E1CB9300DFD1BD00D8CEC400BBB3A900D9CE
      C200C4AF9300C3A68200D3A97A00D8D6CF00F2F2F100E5E3E000D6D3CE00DFDC
      DA00EBE9E800ECEAE900F4F4F200E1D5D000CCBBB60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500A7A7A700BFBF
      BF00CFCFCF00CECECE00B2B2B200CDCDCD00ACACAC00A3A3A300A7A7A700D4D4
      D400F1F1F100E2E2E200D2D2D200DCDCDC00E9E9E900EAEAEA00F3F3F300D7D7
      D700BFBFBF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDCDCD00DCDCDC000000
      0000BACDBD000099280004C0420004BF440000BF460001C04C0002C3540003C4
      5B0004C7640000C165008FB1A200F4ECF000EBEBEB00EBEBEB00E7E7E700E0DF
      E000DCD5D70031B4830000CD80000ACE84000ACD820009CD800009CC7B0009CB
      76000CC770000BC6690000BA530046A06600FFFBFF00F9F9F900CFCFCF00FBFB
      FB0000000000CDCDCD00DCDCDC0000000000C1C1C10040404000575757005757
      570057575700595959005D5D5D00606060006565650062626200A0A0A000F0F0
      F000EBEBEB00EBEBEB00E7E7E700DFDFDF00D8D8D800787878006F6F6F007474
      74007373730072727200707070006E6E6E006B6B6B0068686800595959006E6E
      6E00FDFDFD00F9F9F900CFCFCF00FBFBFB000000000000000000000000000000
      000000000000CBB3AB00C9B6A700D2CAC200D1BE9900D1B47D00C6C0BB00C09B
      6600AF732000C9AC8700DFDFDD00DBD8D100DDDAD500EDECEA00E4E2E000BEB8
      B000E5E3E000EFEDEC00F1F0EF00EEE6E300CEBFB90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B8B8B800B7B7B700CACA
      CA00B8B8B800ABABAB00C0C0C000959595006B6B6B00A9A9A900DEDEDE00D6D6
      D600D9D9D900EBEBEB00E2E2E200B7B7B700E2E2E200EDEDED00F0F0F000E7E7
      E700C2C2C2000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7D7D700ECECEC00FFFE
      FF0078B0860000A5290004BB3F000AA53E001A8441001B844400198747001A89
      4C001A8A500014864F008BA29700F0EBED00E9E9E900EAEAEA00EBEBEB00ECEC
      EC00EDE9EB00489A7A00138E5E001A8F6100198E5F00198E5F001A8D5C001596
      5C0009BB660009C0620003BE580012974400E5E8E400FFFEFF00E0E0E000F8F8
      F80000000000D7D7D700ECECEC00FEFEFE008F8F8F0044444400545454004F4F
      4F004A4A4A004B4B4B004D4D4D004F4F4F00515151004D4D4D0096969600EDED
      ED00E9E9E900EAEAEA00EBEBEB00ECECEC00EBEBEB0074747400555555005858
      58005757570057575700565656005757570063636300636363005D5D5D004F4F
      4F00E5E5E500FEFEFE00E0E0E000F8F8F8000000000000000000000000000000
      0000FEFFFF00CEB2A900EDDDDB00EADDCB00D5B87A00CDAB6A00BBA27A00B387
      4200B8823700B9966700C9C5BC00DDDBD500F2F2F100E4E2DF00D3CFCA00D6D3
      CF00CAC6BF00DFDCD800F5F5F500EAE2DF00C1AEA70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00B8B8B800E1E1E100DBDB
      DB00ADADAD00A0A0A0009D9D9D007E7E7E007B7B7B0092929200C3C3C300D9D9
      D900F1F1F100E1E1E100CECECE00D2D2D200C5C5C500DBDBDB00F5F5F500E3E3
      E300B2B2B2000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0E0E000F1F1F100FCF6
      FA0069AE7B000BB03D0000B13100429A5E00C7B4C000C6BEC300BEB6BB00BBB3
      B700BBB3B700B9B1B500C9C7C800E7E8E700E6E6E600E7E7E700E8E8E800E9E9
      E900ECECEC00CAC5C700B8B1B300B8B1B400B2ABAE00ACA5A700AEA3A800949B
      98000CA85A0006BB5B0007BB550000963700C1D3C50000000000E7E7E700F6F6
      F60000000000E0E0E000F1F1F100F9F9F90086868600525252004B4B4B006868
      6800BEBEBE00C2C2C200BABABA00B7B7B700B7B7B700B5B5B500C8C8C800E7E7
      E700E6E6E600E7E7E700E8E8E800E9E9E900ECECEC00C7C7C700B4B4B400B4B4
      B400AEAEAE00A8A8A800A8A8A800979797005A5A5A005E5E5E005D5D5D004444
      4400C8C8C80000000000E7E7E700F6F6F6000000000000000000000000000000
      0000FCFCFC00CDAFA500F1E4E000EBDFD100DEC38800D1B27300C49F5E00B282
      3500C7A57700C2BBAF00C1BAAC00E1DFDA00E7E6E200E2E0DD00E1DFDC00D8D5
      D200D3CFC900E7E6E300F8F8F800F2EBE900BCA79F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00B5B5B500E7E7E700DEDE
      DE00B8B8B800A7A7A7009595950078787800A1A1A100B9B9B900B7B7B700DEDE
      DE00E5E5E500DFDFDF00DEDEDE00D5D5D500CECECE00E5E5E500F8F8F800ECEC
      EC00ABABAB000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E2E2E200F2F2F200F2EF
      F10063AD76003DBE630003AE37003FA15D00F9EFF600FBFBFB00F4F4F400F1F0
      F000EEEEEE00ECECEC00E9E9E900E5E5E500E5E5E500E5E5E500E6E6E600E6E6
      E600E8E8E800EEEDED00F0F0F000F1F1F100F1F1F100EFEFEF00F1ECEE00C4D1
      CB0009A4510005B3510006B34D0000943100A8C6AF0000000000EAEAEA00F6F6
      F60000000000E2E2E200F2F2F200F0F0F00082828200747474004D4D4D006969
      6900F4F4F400FBFBFB00F4F4F400F0F0F000EEEEEE00ECECEC00E9E9E900E5E5
      E500E5E5E500E5E5E500E6E6E600E6E6E600E8E8E800EDEDED00F0F0F000F1F1
      F100F1F1F100EFEFEF00EEEEEE00CACACA005454540058585800575757004141
      4100B4B4B40000000000EAEAEA00F6F6F6000000000000000000000000000000
      0000F8F7F600CEAFA400F4EAE600E2DEDB00D9CEBA00D8C8AD00DAC9B100D0C1
      AF00C7BEB400C1BAAF00DFDBD400D9D6CF00E6E5E100E7E5E300DDDAD600D8D5
      D100EFEDEC00F4F3F300F8F8F800F5F0EF00BCA59D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700B5B5B500ECECEC00DEDE
      DE00CBCBCB00C4C4C400C6C6C600C0C0C000BDBDBD00B8B8B800DADADA00D4D4
      D400E4E4E400E5E5E500D9D9D900D4D4D400EDEDED00F3F3F300F8F8F800F1F1
      F100AAAAAA000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6E6E600F0EFF000EEEC
      ED0068AF7A0051C070003FBC63003FA05C00F1EAEF00FEFEFE00F6F6F600F3F3
      F300EFEFEF00ECECEC00E9E9E900E7E7E700E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E6E6E600E7E7E700E8E8E800E9E9E900EAEAEA00F5F0F300C3D6
      CC00029D450004AA480005AA4400008F2A009FC0A70000000000E7E7E700F6F6
      F60000000000E6E6E600EFEFEF00EDEDED008585850080808000747474006969
      6900EEEEEE00FEFEFE00F6F6F600F3F3F300EFEFEF00ECECEC00E9E9E900E7E7
      E700E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E6E6E600E7E7E700E8E8
      E800E9E9E900EAEAEA00F2F2F200CCCCCC004C4C4C0052525200515151003D3D
      3D00ACACAC0000000000E7E7E700F6F6F6000000000000000000000000000000
      0000F4F1EF00D0B2A600F5F1EF00E2DEDA00E7E3E200E6E2E100D7D2CF00D8D2
      CE00C9C0B600C4BBAF00F1EEEA00FAF9F800E1DEDA00F1EFEE00DAD7D300C0BB
      B200D3CFC900E8E7E400F6F5F400F8F5F400BFA8A000FBFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1F1F100B8B8B800F1F1F100DEDE
      DE00E4E4E400E3E3E300D2D2D200D2D2D200BFBFBF00BABABA00EDEDED00F9F9
      F900DDDDDD00EFEFEF00D6D6D600B9B9B900CECECE00E6E6E600F5F5F500F5F5
      F500ADADAD00FAFAFA0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECECEC00EBEAEB00F0ED
      EF0078B3860059BE750059C076006FB68300F1EDF00000000000FDFDFD00FBFB
      FB00F8F8F800F4F4F400F1F1F100EDEDED00EAEAEA00E7E7E700E6E6E600E5E5
      E500E5E5E500E5E5E500E5E5E500E6E6E600E7E7E700E8E8E800F4EEF200B6CF
      C0000094390004A23F0004A23C0000852300ACC6B100FFFCFF00E1E1E100F9F9
      F90000000000ECECEC00EAEAEA00EEEEEE009090900084848400858585008D8D
      8D00EFEFEF0000000000FDFDFD00FBFBFB00F8F8F800F4F4F400F1F1F100EDED
      ED00EAEAEA00E7E7E700E6E6E600E5E5E500E5E5E500E5E5E500E5E5E500E6E6
      E600E7E7E700E8E8E800F1F1F100C1C1C100444444004C4C4C004B4B4B003838
      3800B6B6B600FEFEFE00E1E1E100F9F9F9000000000000000000000000000000
      0000F0E9E700D3B5A90000000000F8F6F500F2EFED00DED9D300D0C9C100CDC6
      BE00DBD3CC00BEB4A700E0DBD300F5F4F100DCD9D400E9E7E500E3E0DE00CDC8
      C300D2CEC800DDDBD700EFEDEC00FCFBFA00CBB7AF00F5F3F300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA00BBBBBB0000000000F6F6
      F600EFEFEF00D8D8D800C8C8C800C5C5C500D3D3D300B3B3B300DADADA00F3F3
      F300D8D8D800E7E7E700E0E0E000C8C8C800CDCDCD00DADADA00EDEDED00FBFB
      FB00BBBBBB00F3F3F30000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0F0F000E4E4E400F4F0
      F30090BA990066BD7C0065C07D0077BB8900F1EEF00000000000000000000000
      00000000000000000000FDFDFD00F6F6F600F3F3F300EFEFEF00ECECEC00E9E9
      E900E6E7E700F0EAEE00F3EAEF00F2EAEF00F1EAEE00F1EAEF00FFF1FA00B3CB
      BC00008D2D00039A3600029A3300007C2100C4D1C600F4F0F400E1E1E1000000
      000000000000F0F0F000E4E4E400F2F2F200A1A1A1008A8A8A008B8B8B009393
      9300EFEFEF000000000000000000000000000000000000000000FDFDFD00F6F6
      F600F3F3F300EFEFEF00ECECEC00E9E9E900E6E6E600EDEDED00EEEEEE00EEEE
      EE00EDEDED00EEEEEE00F8F8F800BEBEBE003E3E3E0046464600454545003434
      3400C9C9C900F2F2F200E1E1E100000000000000000000000000000000000000
      0000EBE1DE00D4B9AE00FEFFFF00FCFBFB00F3F1EE00F2EFED00D6D0CA00D8D2
      CC00EAE3DF00C1B8AB00CEC8BD00E9E7E300E8E6E200E6E4E100E0DDDB00E6E4
      E400E2DFDD00E6E4E100F3F2F200FEFEFD00C0AAA000F0EDEC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3E3E300BEBEBE00FEFEFE00FBFB
      FB00F0F0F000EFEFEF00D0D0D000D2D2D200E4E4E400B6B6B600C6C6C600E6E6
      E600E5E5E500E3E3E300DDDDDD00E4E4E400DFDFDF00E3E3E300F2F2F200FDFD
      FD00AEAEAE00EDEDED0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F6F600DBDBDB00F4F1
      F300B3C9B70072BA830075C2880074BD8700BBDAC300CFE9D600CCE6D300BBDF
      C500A3D4B100A0D2B000D6E7DB0000000000FBFBFB00F8F8F800F4F4F400F1F1
      F100EFEEEE00B0CEBC009DC9AE00A1CAB000A5CBB300A5CBB200AECEB90062AE
      7C00008A280002902E00008D2700187A2F00E3E3E200E3E2E300E6E6E6000000
      000000000000F6F6F600DBDBDB00F2F2F200BBBBBB008F8F8F00959595009292
      9200C8C8C800DADADA00D7D7D700CACACA00B8B8B800B6B6B600DDDDDD000000
      0000FBFBFB00F8F8F800F4F4F400F1F1F100EEEEEE00BEBEBE00B1B1B100B3B3
      B300B6B6B600B6B6B600BCBCBC00848484003B3B3B00404040003C3C3C004040
      4000E2E2E200E2E2E200E6E6E600000000000000000000000000000000000000
      0000E6DAD500D9C1B70000000000FCFBFB00FAF9F800FBF9F700FEFAF900FBF7
      F500F3EEEA00DAD3CA00C5BEB200E6E3DE00F1EFEC00F3F2F100F1EFEE00EBE8
      E700EFEDEC00EBE9E700F6F6F60000000000C3A9A000E9E3E100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCDCDC00C5C5C50000000000FBFB
      FB00F9F9F900F9F9F900FBFBFB00F7F7F700EEEEEE00D2D2D200BCBCBC00E2E2
      E200EEEEEE00F2F2F200EFEFEF00E8E8E800EDEDED00E9E9E900F6F6F6000000
      0000AEAEAE00E4E4E40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D5D5D500EBEA
      EB00D8DDD90083B98F0082C592007FC38F0073BD85006EBA81006BB97F0064B6
      7A003EA55B0000862400629870000000000000000000FEFEFE00FCFCFC00FBFB
      FB00F8F5F7002A88460000821F00008627000086260000852500008422000186
      2300028A2A00028A2800007B1600528C5C00F1EBF000D5D5D500F2F2F2000000
      00000000000000000000D5D5D500EAEAEA00DADADA00999999009D9D9D009B9B
      9B00919191008D8D8D008B8B8B00868686006A6A6A0038383800787878000000
      000000000000FEFEFE00FCFCFC00FBFBFB00F6F6F60052525200353535003939
      3900393939003838380037373700383838003C3C3C003C3C3C00303030006868
      6800EEEEEE00D5D5D500F2F2F200000000000000000000000000000000000000
      0000E1D1CB00E0C9C000FEFFFF000000000000000000EBE9E900BFBEBB009694
      90007A7875007D7B79008E8C8A009F9E9C00AAA9A800AAA9A900A9A8A700B2B0
      AE00D3D1CF00ECEAE900FEFDFC0000000000C9AEA400E2DAD700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D4D4D400CDCDCD00FEFEFE000000
      000000000000E9E9E900BDBDBD0093939300777777007B7B7B008C8C8C009D9D
      9D00A9A9A900A9A9A900A8A8A800B0B0B000D1D1D100EAEAEA00FDFDFD000000
      0000B3B3B300DBDBDB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1E1E100D6D6
      D600F0EDEF00A4C3AB008AC497008BC6980088C4950084C2930081C190007FBF
      8E0081C0900072BA85009DBEA600FFFDFF000000000000000000000000000000
      0000FFFBFE002C88480000802100028429000184280001842700018326000183
      2400018223000083210000681000AFBEB100E3E0E300D3D3D300FEFEFE000000
      00000000000000000000E1E1E100D6D6D600EEEEEE00B0B0B000A1A1A100A3A3
      A300A0A0A0009D9D9D009B9B9B00999999009B9B9B0090909000ABABAB00FEFE
      FE0000000000000000000000000000000000FDFDFD0054545400353535003A3A
      3A0039393900393939003838380038383800373737003636360028282800B4B4
      B400E2E2E200D3D3D300FEFEFE00000000000000000000000000000000000000
      0000E3D3CC00EDDED80000000000D5D5D4008B8B8B005E5C5C00575554006561
      5F00777472008F8B8A009D9A990095919000827F7E006F6D6C005C5A59004C4A
      4A00494848005D5C5C00A5A4A400FCFDFD00D6B9AD00DCD1CD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6D6D600E1E1E10000000000D4D4
      D4008B8B8B005C5C5C005555550061616100747474008C8C8C009A9A9A009292
      92007F7F7F006D6D6D005A5A5A004A4A4A00484848005C5C5C00A4A4A400FCFC
      FC00BEBEBE00D3D3D30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F8F8F800C3C4
      C300ECEAEC00D6DCD70097C29F0096C9A10094C79F0091C69C008DC49A008AC3
      970087C194007EBD8D00B0CAB600FFFDFF000000000000000000000000000000
      0000FFFEFF002B84420000761400007A1B00007A1B0000791A0000791A000079
      1900007A1900006C0B0044804E00EAE4E900CDCDCD00E7E7E700000000000000
      00000000000000000000F8F8F800C3C3C300EBEBEB00D8D8D800A8A8A800AAAA
      AA00A8A8A800A6A6A600A3A3A300A1A1A1009E9E9E0098989800BABABA00FEFE
      FE0000000000000000000000000000000000FEFEFE00505050002E2E2E003131
      31003131310031313100313131003030300031313100272727005B5B5B00E7E7
      E700CDCDCD00E7E7E70000000000000000000000000000000000000000000000
      0000E1CDC600ECE0DC00B5B6B6006F6C6A007E777500A19A9600C9C4C100E6E3
      E200E8E4E000F0EEEB00D5D3D200C3C2C100C3C2C000C3C2C100BBBAB9009795
      9400686665003E3C3C00201F1F0046474700A98D8100DED0CA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1D1D100E2E2E200B5B5B5006C6C
      6C00787878009B9B9B00C4C4C400E3E3E300E4E4E400EDEDED00D3D3D300C2C2
      C200C1C1C100C2C2C200BABABA0095959500666666003C3C3C001F1F1F004646
      460092929200D2D2D20000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DADA
      DA00CACACA00F2F0F200BFD0C2009DC7A5009FCCA8009CCAA60099C9A30096C7
      A00093C59E008BC29600B2CBB700FFFDFF000000000000000000000000000000
      0000000000007BB088004CA06000429B570037954C00319146002F9044003091
      450031914500448A5100D2D7D300E3E0E200D1D1D100FEFEFE00000000000000
      0000000000000000000000000000DADADA00CACACA00F1F1F100C5C5C500ADAD
      AD00B1B1B100AEAEAE00ACACAC00A9A9A900A7A7A700A1A1A100BCBCBC00FEFE
      FE000000000000000000000000000000000000000000919191006E6E6E006666
      66005D5D5D00585858005656560057575700575757005F5F5F00D4D4D400E1E1
      E100D1D1D100FEFEFE0000000000000000000000000000000000000000000000
      0000EADCD800B0A9A70080787300A89F9900C5C1BC00D7D6D500E2E1E000F4F3
      F300FFFEFD00A5A29E00605B56006F6A64007E7872008D898400AAA8A600CCCB
      CA00DEDDDD00ABA8A700706D6B002F2D2D00140D0B00C1B6B200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFDFDF00AAAAAA0079797900A0A0
      A000C0C0C000D6D6D600E1E1E100F3F3F300FEFEFE00A1A1A1005B5B5B006969
      69007878780088888800A8A8A800CBCBCB00DDDDDD00A8A8A8006D6D6D002D2D
      2D000E0E0E00B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00D8D7D800ECEBEC00B8CEBC00A6CCAC00A7CFAF00A4CDAC00A1CC
      AA009ECAA70097C7A000B8CFBD00FFFDFF000000000000000000000000000000
      0000FFFEFF009AC2A20080BA8C0082BB8E007EB98B007BB7870077B6840070B1
      7D0069A27400C9D3CB00F0ECEF00CBCBCB00F2F2F20000000000000000000000
      000000000000000000000000000000000000BDBDBD00D7D7D700EBEBEB00C0C0
      C000B4B4B400B7B7B700B4B4B400B2B2B200AFAFAF00AAAAAA00C1C1C100FEFE
      FE0000000000000000000000000000000000FEFEFE00AAAAAA00979797009999
      99009696960093939300909090008A8A8A007F7F7F00CDCDCD00EEEEEE00CBCB
      CB00F2F2F2000000000000000000000000000000000000000000000000000000
      0000CFCDCC00887A7300B5ADA500C1C1BC00D0CECC00D4D4D300CCCAC700BFBD
      BB00CCCAC8006B6662005E59530068635D00736D6600716C6500A2A09D007673
      7100858381009D9B99009D989600AFABA800302F2F008B878600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CDCDCD007C7C7C00ADADAD00BFBF
      BF00CECECE00D3D3D300C9C9C900BDBDBD00CACACA0066666600585858006262
      62006C6C6C006B6B6B009F9F9F0073737300838383009B9B9B0099999900ABAB
      AB002F2F2F008888880000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F3F300ACACAC00DDDDDD00ECECEC00BFD2C200ACCFB300AED3B500ACD1
      B300A9D0B000A5CEAD00AACEB100C4DDC900C4DEC900C4DECA00C3DDC800C2DD
      C800BCD9C20092C29C008ABF950087BE930084BC8F0081BB8C0079B4840078AA
      8200C5D2C800F2EFF100CECECE00E5E5E5000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300ACACAC00DDDDDD00ECEC
      EC00C6C6C600BABABA00BCBCBC00BABABA00B8B8B800B5B5B500B8B8B800CECE
      CE00CECECE00CECECE00CDCDCD00CDCDCD00C7C7C700A5A5A5009F9F9F009D9D
      9D009A9A9A0098989800909090008C8C8C00CACACA00F0F0F000CECECE00E5E5
      E500000000000000000000000000000000000000000000000000000000000000
      00007D767200CBBEB700D0C4BA00BCB0A700CBC4BF00D6D2D000D3CDC800C2BA
      B500B3ADA8008B868200716D68006A655F006E6862007A767100E3E2E100D9D7
      D70088858200A7A3A000BAB6B300D0CCCA00978B830086838100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000077777700C0C0C000C4C4C400B1B1
      B100C4C4C400D2D2D200CDCDCD00BBBBBB00ADADAD00868686006C6C6C006464
      64006868680075757500E2E2E200D7D7D70085858500A3A3A300B6B6B600CCCC
      CC008C8C8C008383830000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9E9E900ABABAB00E2E1E200F4F3F400CFDCD100B4D1B900B2D4
      B800B2D5B900B0D4B700ACD2B300A5CEAC00A2CCAA009FCAA7009CC9A50099C7
      A20096C59F0099C7A20097C6A00094C59D008EC1980086B88F0096BA9D00DAE0
      DB00F5F2F500CFCFCF00E0E0E000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900ABABAB00E1E1
      E100F3F3F300D4D4D400BFBFBF00BFBFBF00C0C0C000BEBEBE00BBBBBB00B5B5
      B500B2B2B200B0B0B000AEAEAE00ABABAB00A8A8A800ABABAB00A9A9A900A7A7
      A700A2A2A20099999900A4A4A400DCDCDC00F4F4F400CFCFCF00E0E0E0000000
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
      00000000000000000000EEEEEE00B6B6B600DEDDDE00FDFCFD00E8ECE900C7DA
      CB00B8D4BD00B5D5BB00B5D6BB00B4D6BA00B2D5B900AFD4B600ADD2B400AAD1
      B200A7D0AF00A4CDAC009FC9A7009AC4A100A0C3A700C2D4C600F5F4F500F0EE
      F000CCCCCC00E3E3E30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEEEEE00B6B6
      B600DDDDDD00FCFCFC00E9E9E900CECECE00C3C3C300C1C1C100C2C2C200C1C1
      C100C0C0C000BDBDBD00BBBBBB00B9B9B900B7B7B700B4B4B400AFAFAF00AAAA
      AA00AEAEAE00C9C9C900F4F4F400EFEFEF00CCCCCC00E3E3E300000000000000
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
      0000000000000000000000000000F9F9F900C8C8C800D0D0D000F8F7F800FFFE
      FF00EDF2EE00D5E3D700C4D9C800BBD5C000B7D3BC00B4D2BA00B2D1B700AFD0
      B500AECEB400B1CEB700BDD3C100D8E3DA00F6F7F600FCFAFC00DDDDDD00CCCC
      CC00EFEFEF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F900C8C8C800D0D0D000F7F7F700FEFEFE00EFEFEF00DADADA00CCCCCC00C5C5
      C500C2C2C200C0C0C000BEBEBE00BCBCBC00BABABA00BCBCBC00C5C5C500DCDC
      DC00F6F6F600FBFBFB00DDDDDD00CCCCCC00EFEFEF0000000000000000000000
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
      00000000000000000000000000000000000000000000E9E9E900D5D5D500E5E5
      E500FAF9FA0000000000FEFEFE00F6F9F700EEF3EF00E9EFEA00E7EEE800E9EF
      EA00F0F4F100FAFBFB0000000000F9F7F900E2E1E100CCCCCC00DDDDDD00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9E9E900D5D5D500E5E5E500F9F9F90000000000FEFEFE00F7F7
      F700F0F0F000EBEBEB00E9E9E900EBEBEB00F1F1F100FAFAFA0000000000F8F8
      F800E1E1E100CCCCCC00DDDDDD00FCFCFC000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000FEFEFE00F2F2
      F200E6E6E600E5E5E500ECECEC00F3F2F300F7F6F700FAF8F900FBF9FA00F9F8
      F900F6F5F600EEEEEE00DCDCDC00D2D2D200E3E3E300FAFAFA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE00F2F2F200E6E6E600E5E5E500ECECEC00F2F2
      F200F6F6F600F9F9F900FAFAFA00F8F8F800F5F5F500EEEEEE00DCDCDC00D2D2
      D200E3E3E300FAFAFA0000000000000000000000000000000000000000000000
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
      000000000000F9F9F900F0F0F000E7E7E700DEDEDE00DADADA00DADADA00DDDD
      DD00E5E5E500EFEFEF00F7F7F700FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900F0F0F000E7E7
      E700DEDEDE00DADADA00DADADA00DDDDDD00E5E5E500EFEFEF00F7F7F700FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000FBFBFB00EDEDED00D5D5
      D500AFAFAF008A8A8A006D6D6D005E5E5E005959590058585800595959005B5B
      5B005D5D5D006666660080808000A2A2A200C7C7C700E4E4E400F6F6F600FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB00EDEDED00D5D5D500AFAFAF008A8A8A006D6D6D005E5E
      5E005959590058585800595959005B5B5B005D5D5D006666660080808000A2A2
      A200C7C7C700E4E4E400F6F6F600FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1F0F000E3E2
      E200D9D8D800D4D3D300D2D1D100D1D0D100D1D0D000D1D0D000D4D3D400DADA
      DA00E2E2E200CECDCE00CDCCCC0097969500DEDEDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0F0F000E2E2E200D8D8D800D3D3D300D1D1D100D0D0
      D000D0D0D000D0D0D000D3D3D300DADADA00E2E2E200CDCDCD00CCCCCC009696
      9600DEDEDE000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000FBFBFB00D1D0D000CDCC
      CC00D0CFD000CECDCE00D0CFD000D6D6D600DFDFDF00E8E7E800EDEDED00EFEF
      EF00F2F2F200B5B4B50083838300C0BFC00097969500E1E1E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB00D0D0D000CCCCCC00CFCFCF00CDCDCD00CFCFCF00D6D6
      D600DFDFDF00E7E7E700EDEDED00EFEFEF00F2F2F200B4B4B40083838300BFBF
      BF0096969600E0E0E00000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000F3F2F300D8D7
      D700C7C6C700DFDEDF00ECECEC00EFEFEF00EFEFEF00EDEDEE00ECECEC00EBEB
      EB00EEEEEE00B5B5B6005D5D5D0084848400BAB9BA0096959500F0F0EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F2F2F200D7D7D700C6C6C600DEDEDE00ECECEC00EFEF
      EF00EFEFEF00EDEDED00ECECEC00EBEBEB00EEEEEE00B5B5B5005D5D5D008484
      8400B9B9B90095959500EFEFEF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6E6E60084848400696969007C7C7C008383
      83009C9C9C00C0C0C000DEDEDE00EAEAEA00EDEDED00EBEBEB00E7E7E700E2E2
      E200DDDDDD00D9D9D900BFBFBF00959595008585850096969600ADADAD00A4A4
      A400B7B7B700F8F8F80000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E6E6
      E60084848400696969007C7C7C00838383009C9C9C00C0C0C000DEDEDE00EAEA
      EA00EDEDED00EBEBEB00E7E7E700E2E2E200DDDDDD00D9D9D900BFBFBF009595
      95008585850096969600ADADAD00A4A4A400B7B7B700F8F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFEFEF00EAEAEA00ECECEC00EAEAEA00EAE9EA00E9E9E900E8E8E800E7E7
      E700EBEBEB00B3B2B3007F7F7F008A8A8A00A6A6A600BAB9BA00DEDEDE00F9F9
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00EAEAEA00ECECEC00EAEA
      EA00E9E9E900E9E9E900E8E8E800E7E7E700EBEBEB00B2B2B2007F7F7F008A8A
      8A00A6A6A600B9B9B900DEDEDE00F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D3D3D3007F7F7F005757570066666600A6A6A600E2E2
      E200FBFBFB00FCFCFC00FCF9FB00F9F3F800F3ECF100EDE5EA00E7DFE500E1D9
      DE00DBD4D900D5D0D300D0CFD000D0D0D000CFCFCF00BABABA00A2A2A200B5B5
      B500C9C9C900BDBDBD00F1F1F100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3D3D3007F7F
      7F005757570066666600A6A6A600E2E2E200FBFBFB00FCFCFC00FAFAFA00F6F6
      F600F0F0F000E9E9E900E3E3E300DDDDDD00D8D8D800D2D2D200CFCFCF00D0D0
      D000CFCFCF00BABABA00A2A2A200B5B5B500C9C9C900BDBDBD00F1F1F1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBEBEB00E7E7E700E7E7E700E6E6E600E5E5E500E5E4E500E4E4
      E400E8E7E800B4B4B5006D6C6D007070700092929200B4B5B500D1D1D100E7E7
      E700F9F9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EBEBEB00E7E7E700E7E7
      E700E6E6E600E5E5E500E4E4E400E4E4E400E7E7E700B4B4B4006C6C6C007070
      700092929200B4B4B400D1D1D100E7E7E700F9F9F90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF00858585006868680081818100E2E2E200000000000000
      0000FFFCFF00F3EDF100CCD5CD009FBDA6007EAE8A006DA77C006AA57A006FA4
      7E0082A78B009DAFA000B9B9B800C8BFC500C1BBBF00B8B8B800C4C4C400BDBD
      BD00B7B7B700D0D0D000BFBFBF00F1F1F1000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00858585006868
      680081818100E2E2E2000000000000000000FEFEFE00F0F0F000CFCFCF00ABAB
      AB009292920085858500838383008585850091919100A4A4A400B8B8B800C4C4
      C400BEBEBE00B8B8B800C4C4C400BDBDBD00B7B7B700D0D0D000BFBFBF00F1F1
      F100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00E7E7E700E3E3E300E3E3E300E2E2E200E2E1E200E1E1E100E0E0
      E000E4E4E400B1B0B1008484840091919100A3A3A300BABABA00D2D2D200E7E7
      E700F8F8F8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00E7E7E700E3E3E300E3E3
      E300E2E2E200E1E1E100E1E1E100E0E0E000E4E4E400B0B0B000848484009191
      9100A3A3A300BABABA00D2D2D200E7E7E700F8F8F80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDC008181810078787800B8B8B800FDFDFD0000000000FFFEFF00E5E6
      E40089B5930037974F00149638000DA039000FAB400010B0450010B0460011AF
      460012AA460016A14400259549004D9261008C9E9000B4ADB100B4B0B300BEBE
      BE00CFCFCF00BFBFBF00CCCCCC00C2C2C200F9F9F90000000000000000000000
      000000000000000000000000000000000000DCDCDC008181810078787800B8B8
      B800FDFDFD0000000000FEFEFE00E5E5E5009B9B9B005F5F5F004B4B4B004C4C
      4C00535353005757570057575700575757005656560053535300565656006A6A
      6A0093939300B0B0B000B2B2B200BEBEBE00CFCFCF00BFBFBF00CCCCCC00C2C2
      C200F9F9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00E3E3E300DFDFDF00DFDFDF00DEDEDE00DDDDDD00DDDCDD00DCDC
      DC00E0E0E000A9A8A900C1C0C100F7F8F700EDEDED00F0F0F000F5F5F500FBFB
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00E3E3E300DFDFDF00DFDF
      DF00DEDEDE00DDDDDD00DCDCDC00DCDCDC00E0E0E000A8A8A800C0C0C000F7F7
      F700EDEDED00F0F0F000F5F5F500FBFBFB000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F5F5
      F5008A8A8A0072727200CECECE000000000000000000FAF6F9008CB796001A92
      390004A232000FB6440018C1510016BE520016B04F001FA45200289F5600289F
      57001EA5540019B5570018BF5B0016B95500149F46003B8C56009CA69E00CBC3
      C800CCCCCC00DADADA00C3C3C300C3C3C300CECECE0000000000000000000000
      0000000000000000000000000000F5F5F5008A8A8A0072727200CECECE000000
      000000000000F8F8F8009D9D9D004C4C4C004848480058585800636363006262
      62005C5C5C005C5C5C005F5F5F005F5F5F005D5D5D0061616100666666006161
      6100535353005F5F5F00A0A0A000C7C7C700CCCCCC00DADADA00C3C3C300C3C3
      C300CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00DEDEDE00DBDBDB00DBDBDB00DADADA00D9D9D900D8D8D800D7D7
      D700DBDBDB00A8A7A800B9B9BA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00DEDEDE00DBDBDB00DBDB
      DB00DADADA00D9D9D900D8D8D800D7D7D700DBDBDB00A7A7A700B9B9B9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B4B4
      B40065656500C9C9C9000000000000000000E2E6E200409A5700009F2B000EBD
      480018C4540011C2540015AC510045976700819C8D00AAAFAC00BCBABC00BFBD
      BF00A9B1AD00739884003899650018B360001DCB6C0015BF5E00139846007DA3
      8900DED4DA00DBDBDB00E3E3E300C2C2C200BBBBBB00EAEAEA00000000000000
      0000000000000000000000000000B4B4B40065656500C9C9C900000000000000
      0000E3E3E30065656500434343005B5B5B0065656500626262005B5B5B006B6B
      6B008E8E8E00ACACAC00BBBBBB00BEBEBE00ADADAD0085858500676767006363
      63007171710066666600505050008D8D8D00D9D9D900DBDBDB00E3E3E300C2C2
      C200BBBBBB00EAEAEA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFAFA00D9D9D900D7D7D700D7D6D700D6D6D600D5D4D500D4D3D400D3D2
      D300D7D6D700A7A7A700AFAEAF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFAFA00D9D9D900D7D7D700D6D6
      D600D6D6D600D4D4D400D3D3D300D2D2D200D6D6D600A7A7A700AEAEAE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0F0F0006E6E
      6E00ABABAB000000000000000000D9E1DA002095400000B4390011C7510012C8
      560007C0520034A46300ACB1AE00EFD7E300F7E7EF00F5E9EE00F8EBF000FAED
      F200F4EFF100EAE3E600C8C0C50080A0910022A5650014CB710019CF710007A7
      4D006DA48000EDE4E900ECECEC00E7E8E700B9B9B900C7C7C700000000000000
      00000000000000000000F0F0F0006E6E6E00ABABAB000000000000000000DCDC
      DC00515151004F4F4F0063636300656565005D5D5D0069696900AEAEAE00E3E3
      E300EFEFEF00EEEEEE00F1F1F100F3F3F300F1F1F100E6E6E600C4C4C4009090
      90006464640070707000737373005353530085858500E8E8E800ECECEC00E7E7
      E700B9B9B900C7C7C70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800D4D3D400D3D2D300D2D2D200D1D1D100D0D0D000CFCFCF00CECE
      CE00D1D1D100A7A7A700A6A5A600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F800D3D3D300D2D2D200D2D2
      D200D1D1D100D0D0D000CFCFCF00CECECE00D1D1D100A7A7A700A5A5A5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7B7B7007878
      7800FAFAFA0000000000E6E9E6002295420000BB3D000EC953000EC9570005C1
      55005BA87D00D3CACF00CAEDDD0086E3B90057D69F004CD39A005ED4A4009CDB
      C200E4E5E500F8EEF200ECECEC00E2D9DD00ADB1B0002FA270000ECB760015D7
      7A0000AB4D0085B49600FFF5FB00FAFAFA00DCDCDC00ACACAC00F2F2F2000000
      00000000000000000000B7B7B70078787800FAFAFA0000000000E7E7E7005353
      53005252520063636300646464005E5E5E0080808000CECECE00DCDCDC00B6B6
      B60099999900939393009C9C9C00BDBDBD00E4E4E400F2F2F200ECECEC00DDDD
      DD00AFAFAF006B6B6B006F6F6F0077777700525252009A9A9A00FAFAFA00FAFA
      FA00DCDCDC00ACACAC00F2F2F200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F6F600CECECE00CECECE00CDCDCD00CCCCCC00CBCBCB00CACACA00C9C9
      C900CCCCCC00A8A7A8009E9D9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6F600CECECE00CECECE00CDCD
      CD00CCCCCC00CBCBCB00CACACA00C9C9C900CCCCCC00A7A7A7009D9D9D000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000083838300C8C8
      C80000000000FFF9FD004CA1630000B335000AC850000AC7540007C657004BAF
      780084BFA10037D187000ACD750005CD780009D080000BD185000AD2850008D1
      850032D19500B7DDCF00F7ECF000EBEBEB00E5E0E200B9B8B90029A26F0009B5
      6A001CAD690008974900BDD3C40000000000FBFBFB00B3B3B300D9D9D9000000
      0000000000000000000083838300C8C8C80000000000FCFCFC00707070004D4D
      4D006060600061616100616161007B7B7B00A1A1A100858585006E6E6E006E6E
      6E007373730075757500757575007474740088888800CBCBCB00F1F1F100EBEB
      EB00E2E2E200B8B8B8006868680062626200666666004D4D4D00C6C6C6000000
      0000FBFBFB00B3B3B300D9D9D900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F3F300C8C8C800C9C9C900C8C8C800C7C7C700C6C6C600C5C5C500C4C3
      C400C6C6C600A8A7A80096959600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300C8C8C800C9C9C900C8C8
      C800C7C7C700C6C6C600C5C5C500C3C3C300C6C6C600A7A7A700959595000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E8E80089898900FBFB
      FB0000000000A5C5AC0000A02A0006C84A0008C54E0007C7540010C45E0026C2
      6F0003CB670005CD6F000FCF7B0011D1820011D2870012D28A0012D38C0012D3
      8D0007D389000CCD8700A7D8C600F5ECF000EBEBEB00E9E4E600B0B5B300949F
      9B009BB0A70001B95D0032A05F00FCF6F90000000000D6D6D600C4C4C4000000
      000000000000E8E8E80089898900FBFBFB0000000000B2B2B200434343005D5D
      5D005E5E5E00606060006666660072727200676767006B6B6B00737373007676
      7600787878007A7A7A007B7B7B007B7B7B007676760075757500C1C1C100F0F0
      F000EBEBEB00E6E6E600B2B2B2009A9A9A00A6A6A6005D5D5D0065656500F9F9
      F90000000000D6D6D600C4C4C400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFEFEF00C3C3C300C4C4C400C3C3C300C2C2C200C1C0C100C0BFC000BFBE
      BF00C1C0C100A7A7A7008F8F8F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00C3C3C300C4C4C400C3C3
      C300C2C2C200C0C0C000BFBFBF00BEBEBE00C0C0C000A7A7A7008F8F8F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D2D2D200B6B6B6000000
      0000F9F3F7002D98490000BB3A0006C2480007C24D0008C4530009C65A0006C8
      61000CC96A000DCB72000ECC7A000FCE800010CF850011CF870011D0890011D0
      8A0012D08A0005D287000CBA7900BDCCC700F0EBED00EBECEC00E6E4E500E9D9
      E00083C7A80000C8660000A74800A6C6B00000000000EFEFEF00C3C3C3000000
      000000000000D2D2D200B6B6B60000000000F6F6F6005A5A5A00515151005A5A
      5A005C5C5C005F5F5F0063636300656565006A6A6A006E6E6E00717171007474
      74007676760077777700787878007979790079797900747474006A6A6A00C5C5
      C500EDEDED00EBEBEB00E5E5E500E0E0E000A6A6A600646464004F4F4F00B4B4
      B40000000000EFEFEF00C3C3C300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EBEBEB00BDBDBD00BFBFBF00BEBDBE00BDBCBD00BCBBBC00BABABA00B9B9
      B900BBBABB00A6A6A60089888900FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EBEBEB00BDBDBD00BFBFBF00BDBD
      BD00BCBCBC00BBBBBB00BABABA00B9B9B900BABABA00A6A6A60088888800FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDCDCD00DCDCDC000000
      0000BACDBD000099280004C0420006BD450006BE4A0007C0510008C2580009C3
      5E000AC466000CC66E000DC775000EC97B000ECA80000FCA83000FCB84000FCB
      85000DCB840024B17C006F9D8C00C2C3C300E9E8E900E7E7E700ECECEC00EEE6
      EA003EB97F0000C5630000BA530046A06600FFFBFF00F9F9F900CFCFCF00FBFB
      FB0000000000CDCDCD00DCDCDC0000000000C1C1C10040404000575757005858
      58005A5A5A005D5D5D006060600063636300666666006A6A6A006D6D6D007070
      700072727200747474007474740075757500747474007070700088888800C2C2
      C200E8E8E800E7E7E700ECECEC00EAEAEA007C7C7C0062626200595959006E6E
      6E00FDFDFD00F9F9F900CFCFCF00FBFBFB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E6E6E600B7B7B700BAB9BA00B9B8B900B7B7B700B6B6B600B5B5B500B4B4
      B400B5B5B500A6A5A60085848500F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E6E6E600B7B7B700B9B9B900B8B8
      B800B7B7B700B6B6B600B5B5B500B4B4B400B5B5B500A5A5A50084848400F9F9
      F900000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7D7D700ECECEC00FFFE
      FF0078B0860000A5290004B93F0005B7420006B9470002B6460000B2480007BF
      590009BF61000AC068000BC26E000BC374000CC479000DC57C000DC57D000CC7
      7E0008C47B005FB69400E2DEDF00FDF1F600E8E6E700E4E5E500EEE9EC00D7E1
      DC0012B5670005C0610003BE580012974400E5E8E400FFFEFF00E0E0E000F8F8
      F80000000000D7D7D700ECECEC00FEFEFE008F8F8F0044444400545454005454
      54005757570054545400535353005F5F5F006363630066666600696969006B6B
      6B006D6D6D006F6F6F006F6F6F00707070006D6D6D008D8D8D00DFDFDF00F6F6
      F600E7E7E700E4E4E400EBEBEB00DCDCDC0064646400626262005D5D5D004F4F
      4F00E5E5E500FEFEFE00E0E0E000F8F8F8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E1E1E100B1B1B100B4B4B400B4B3B400B3B2B300B2B1B200B1B0B000AFAE
      AF00ADADAD009F9E9F007D7C7D00F3F3F3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E1E1E100B1B1B100B4B4B400B3B3
      B300B2B2B200B1B1B100B0B0B000AEAEAE00ADADAD009E9E9E007C7C7C00F3F3
      F300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0E0E000F1F1F100FCF6
      FA0069AE7B000BB03D0000B0370005B23E0000B23C003AA36000589C7400009E
      410003B8550009BB60000ABB66000ABD6C000BBE70000BBE73000CBF75000CBF
      76000CBF760003C073001FC3800086D5B400E8E9E900F6EAF000F4EAEF00A0CD
      B80000B1550008BA5B0007BB550000963700C1D3C50000000000E7E7E700F6F6
      F60000000000E0E0E000F1F1F100F9F9F90086868600525252004D4D4D005151
      51004F4F4F0069696900787878004A4A4A005A5A5A0061616100636363006666
      660068686800696969006A6A6A006B6B6B006B6B6B006767670076767600AFAF
      AF00E8E8E800F0F0F000EFEFEF00B7B7B700575757005F5F5F005D5D5D004444
      4400C8C8C80000000000E7E7E700F6F6F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDC00ACACAC00AFAFAF00ADADAD00AAA9AA00A5A5A500A0A0A0009A99
      9A00959495008787870067666700ECECEC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCDCDC00ACACAC00AFAFAF00ADAD
      AD00A9A9A900A5A5A500A0A0A00099999900949494008787870066666600ECEC
      EC00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E2E2E200F2F2F200F2EF
      F10063AD76003DBD63000DAE3E0000AB340000A134009EB2A500FCEAF5008EB1
      9C000C92450000AB4B0008B65D0009B5610009B665000AB7690009B76A000AB7
      6C000AB86C000AB86C0004B6680000B3620020B9740097D3B700F9EAF2005CB9
      890000AE4D0007B1510006B34D0000943100A8C6AF0000000000EAEAEA00F6F6
      F60000000000E2E2E200F2F2F200F0F0F0008282820074747400535353004A4A
      4A0047474700A7A7A700F3F3F3009E9E9E004B4B4B00525252005E5E5E005F5F
      5F00616161006363630063636300646464006464640064646400606060005C5C
      5C006F6F6F00B5B5B500F1F1F1008A8A8A005353530058585800575757004141
      4100B4B4B40000000000EAEAEA00F6F6F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D2D2D2009D9C9D009D9C9D0096969700908F900089888900828283007C7B
      7C00757475006767680048474800E0E0E0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D2D2D2009C9C9C009C9C9C009696
      96008F8F8F0088888800828282007B7B7B00747474006767670047474700E0E0
      E000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6E6E600F0EFF000EEEC
      ED0068AF7A0051C0700048BD6A0004A735002A934A00D3CBD100F3F3F300FFF5
      FB00C0C8C3002E905800009A400005AD540007AD5A0008AE5C0008AE5E0008AF
      600008AF600008AF600008AF600008AF5F0002AD590000AA520036B5730014AB
      590003AA4B0005A9480005AA4400008F2A009FC0A70000000000E7E7E700F6F6
      F60000000000E6E6E600EFEFEF00EDEDED0085858500808080007A7A7A004A4A
      4A0057575700CFCFCF00F3F3F300FAFAFA00C3C3C3005C5C5C00484848005757
      57005A5A5A005B5B5B005C5C5C005D5D5D005D5D5D005D5D5D005D5D5D005C5C
      5C005858580054545400747474005D5D5D005252520052525200515151003D3D
      3D00ACACAC0000000000E7E7E700F6F6F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBE007E7D7E007D7D7E00747475006A696B005F5F6000565557004E4D
      4F004B4B4D004D4C4E0046454600D2D1D1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD007D7D7D007D7D7D007474
      74006A6A6A005F5F5F00565656004E4E4E004B4B4B004D4D4D0045454500D1D1
      D100000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECECEC00EBEAEB00F0ED
      EF0078B3860059BE75005FC17B0049B568008EAC9700E8E2E600E5E6E500EAEB
      EB00FEF9FC00EBE2E7006EA083000B94470004A44C0006A5500006A5520007A5
      530007A6540007A6540007A6530006A5530006A5510005A44E0000A1440004A2
      450005A1430004A03F0004A23C0000852300ACC6B100FFFCFF00E1E1E100F9F9
      F90000000000ECECEC00EAEAEA00EEEEEE009090900084848400898989007777
      77009B9B9B00E5E5E500E5E5E500EAEAEA00FBFBFB00E6E6E600858585004C4C
      4C00515151005353530054545400555555005555550055555500555555005454
      540054545400525252004C4C4C004E4E4E004D4D4D004B4B4B004B4B4B003838
      3800B6B6B600FEFEFE00E1E1E100F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9B9C0051505200575658005A595B006362630071707100858483009F9D
      9C00B5B4B200C6C4C300B5B3B10084838200FBFCFC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B0051515100575757005A5A
      5A006262620070707000848484009D9D9D00B3B3B300C4C4C400B3B3B3008383
      8300FBFBFB000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0F0F000E4E4E400F4F0
      F30090BA990066BD7C0064C07C0077B98900E2DFE100EFEFEF00E5E5E500E4E4
      E400E8E8E800ECF2EE00C0D7C800349C5C0000993C00059C4400059D4600059D
      4700059D4800059D4800059D4700059D4600059C4500059C4200049B3F00049A
      3D000499390003993600029A3300007C2100C4D1C600F4F0F400E1E1E1000000
      000000000000F0F0F000E4E4E400F2F2F200A1A1A1008A8A8A008A8A8A009393
      9300E0E0E000EFEFEF00E5E5E500E4E4E400E8E8E800EEEEEE00CACACA006464
      6400474747004C4C4C004D4D4D004D4D4D004E4E4E004E4E4E004D4D4D004D4D
      4D004C4C4C004B4B4B004A4A4A00494949004747470046464600454545003434
      3400C9C9C900F2F2F200E1E1E100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFCFC00FEFD
      FC00B0AFAE009C9B9A00B8B7B500C8C7C500D7D5D300DFDEDB00E2E0DD00E6E4
      E100E2E0DD00D3D1CF00A7A5A3004E4D4C00D1D1D10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC00FDFDFD00AFAFAF009B9B9B00B6B6B600C6C6
      C600D5D5D500DDDDDD00DFDFDF00E3E3E300DFDFDF00D1D1D100A5A5A5004D4D
      4D00D1D1D1000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F6F600DBDBDB00F4F1
      F300B3C9B70072BB830071BF8400B0C4B500F7EFF500FAF7F900EFEFEF00EDEB
      EC00D6D7D6001F823F00008D290001923300049338000493390004933B000494
      3C0003943C0003943C0003943C0004933B000493390004933800039236000391
      33000290310002902E00008D2700187A2F00E3E3E200E3E2E300E6E6E6000000
      000000000000F6F6F600DBDBDB00F2F2F200BBBBBB009090900091919100B8B8
      B800F3F3F300F8F8F800EFEFEF00ECECEC00D6D6D6004A4A4A003C3C3C004242
      4200454545004545450046464600464646004646460046464600464646004646
      46004545450045454500434343004242420041414100404040003C3C3C004040
      4000E2E2E200E2E2E200E6E6E600000000000000000000000000000000000000
      000000000000000000000000000000000000EEEDEC00DCDAD700D9D8D500D7D5
      D300DDDBD800E7E5E200E3E1DE00DCDAD800D2D0CE00C5C4C100B7B6B400A5A5
      A400979999008B8B8A007E7C7A004F4D4C008B8B8B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EDEDED00D9D9D900D7D7D700D5D5D500DADADA00E4E4E400E0E0E000DADA
      DA00D0D0D000C3C3C300B5B5B500A4A4A400989898008A8A8A007C7C7C004D4D
      4D008B8B8B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D5D5D500EBEA
      EB00D8DDD90082B98E0085C39400B0CDB700A6CFB000C3DBC900FBF7FA00F4F4
      F400F6F0F4007B9F8600007318000088250000892C00028B2F00028B3100028C
      3100028C3200028C3200028C3100028B3100028B3000028B2E00028A2D000289
      2B0002892900028A2800007B1600528C5C00F1EBF000D5D5D500F2F2F2000000
      00000000000000000000D5D5D500EAEAEA00DADADA00989898009E9E9E00BCBC
      BC00B7B7B700CDCDCD00F9F9F900F4F4F400F3F3F3008A8A8A002E2E2E003939
      39003C3C3C003E3E3E003F3F3F003F3F3F0040404000404040003F3F3F003F3F
      3F003F3F3F003E3E3E003D3D3D003C3C3C003C3C3C003C3C3C00303030006868
      6800EEEEEE00D5D5D500F2F2F200000000000000000000000000000000000000
      000000000000000000000000000000000000E2E1DF00DAD8D500D7D5D300D0CF
      CD00C5C4C300BABAB900AFB2B200A4A8A8009DA1A1009799990091908D008C83
      7C008671650090847E00949492006564620056555500F3F3F200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0E0E000D7D7D700D5D5D500CECECE00C4C4C400B9B9B900B1B1B100A6A6
      A6009F9F9F00989898008F8F8F00838383007474740086868600939393006363
      630055555500F2F2F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1E1E100D6D6
      D600F0EDEF00A4C3AB008AC4970086C594007FC18E0082BE9000DCE2DE00FAF7
      F900F7F7F600F8F2F6008EB09700268D420008882C0000812200008021000082
      2400008327000185290001862900008425000081230001832700018325000183
      2400018223000083210000681000AFBEB100E3E0E300D3D3D300FEFEFE000000
      00000000000000000000E1E1E100D6D6D600EEEEEE00B0B0B000A1A1A1009F9F
      9F009A9A9A009A9A9A00DEDEDE00F8F8F800F6F6F600F5F5F5009C9C9C005151
      51003E3E3E00363636003535350037373700383838003A3A3A003A3A3A003838
      380036363600393939003838380038383800373737003636360028282800B4B4
      B400E2E2E200D3D3D300FEFEFE00000000000000000000000000000000000000
      000000000000000000000000000000000000D0CFCD00A9A7A500AFADAB00A9AA
      A800A19D9A0099908900917E7200886857007F4F39007A3C2000762E0C007423
      00006F170000834C3B00959999007D7B790046454500BBBBBB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00A7A7A700ADADAD00A9A9A9009D9D9D0090909000808080006D6D
      6D0057575700474747003A3A3A00323232002C2C2C0058585800979797007B7B
      7B0045454500BBBBBB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F8F8F800C3C4
      C300ECEAEC00D6DCD70097C29F0096C9A10094C89F008CC4980099C6A300E8EA
      E900F9F6F800F8F8F800F8F2F600B7C7BA0076AD830053A4680031964B001588
      3400037F240000771A00006F1500107129002377390000771A00007919000079
      1900007A1900006C0B0044804E00EAE4E900CDCDCD00E7E7E700000000000000
      00000000000000000000F8F8F800C3C3C300EBEBEB00D8D8D800A8A8A800AAAA
      AA00A9A9A900A2A2A200ABABAB00E9E9E900F7F7F700F8F8F800F5F5F500BDBD
      BD008C8C8C00757575005B5B5B004545450037373700303030002C2C2C003838
      38004646460030303000303030003030300031313100272727005B5B5B00E7E7
      E700CDCDCD00E7E7E70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E4E300B0B1AF00806B64006A32
      1800722E0B00721F0000771700007F12000085100000A9140000BD190300BC1B
      0600B9180200B7231100988B89008B8E8C005755540075747400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E4E4E400B0B0B0006F6F6F003C3C3C0039393900303030002F2F2F003030
      3000313131003F3F3F004848480049494900464646004E4E4E008E8E8E008C8C
      8C00555555007474740000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DADA
      DA00CACACA00F2F0F200BFD0C2009DC7A5009FCCA8009CCAA60094C79F00A4CB
      AC00E5E9E600FAF7F900F9F9F900F6F3F500D8DAD900B2C4B6009CBAA30091B5
      990089B092008AAE9300A4B7A800B1BCB300569B65002D9043002F9044003091
      450031914500448A5100D2D7D300E3E0E200D1D1D100FEFEFE00000000000000
      0000000000000000000000000000DADADA00CACACA00F1F1F100C5C5C500ADAD
      AD00B1B1B100AEAEAE00A8A8A800B3B3B300E6E6E600F8F8F800F9F9F900F4F4
      F400D9D9D900B9B9B900A8A8A8009F9F9F009999990099999900ABABAB00B5B5
      B50072727200555555005656560057575700575757005F5F5F00D4D4D400E1E1
      E100D1D1D100FEFEFE0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BEBFBE00877C7A007103
      00008C1700008A15060092140E00991114009B0A1700CD393600E95C4A00E65A
      4A00E6594800E94A3900B5766F008A92910072706E004A494900E3E2E2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BEBEBE007F7F7F002626260036363600373737003C3C3C003F3F
      3F003E3E3E006969690085858500838383008282820079797900888888008F8F
      8F007070700049494900E2E2E200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00D8D7D800ECEBEC00B8CEBC00A6CCAC00A7CFAF00A4CEAC009CCA
      A500A3CBAA00D2E1D500F5F4F500FEFBFD00FEFAFD00F9F4F800F1ECF000F0EA
      EE00F9F0F700FDF7FB00CFE1D20082BC8F0077B784007BB7870077B5840070B1
      7D0069A27400C9D3CB00F0ECEF00CBCBCB00F2F2F20000000000000000000000
      000000000000000000000000000000000000BDBDBD00D7D7D700EBEBEB00C0C0
      C000B4B4B400B7B7B700B4B4B400AEAEAE00B2B2B200D8D8D800F4F4F400FCFC
      FC00FCFCFC00F7F7F700EFEFEF00EDEDED00F5F5F500FAFAFA00D6D6D6009999
      99009090900093939300909090008A8A8A007F7F7F00CDCDCD00EEEEEE00CBCB
      CB00F2F2F2000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFDEDD00A5A9A700A12E
      2800A4100E009B0F1900A40B1E00AB062300B1001E00E1666400FEB69C00FBB1
      9A00FBAF9800FEA99100E38B78008A898800858482004A484800A09F9F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEDEDE00A7A7A700525252004040400041414100444444004646
      4600454545008E8E8E00C5C5C500C2C2C200C0C0C000BDBDBD00A2A2A2008989
      890083838300484848009F9F9F00000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000FCFBFB00B3B9B700A679
      7300AC051200AF032400BE052100CE091400DA040000F3928200FFFCEE00FFF2
      E500FFF2E500FFF5E600FFD5C100A18A8500868887006361600061616100FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB00B6B6B6008686860041414100474747004C4C4C004E4E
      4E004A4A4A00ADADAD00F8F8F800F2F2F200F2F2F200F3F3F300DCDCDC009090
      9000878787006161610061616100FCFCFC000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000D6D6D400A2A5
      A300B41A2200D8060B00E2120200E5130000E3090000F49C9500000000000000
      00000000000000000000FFFDF900CC9C9200808280007C7B790048474700D1D1
      D000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D5D5D500A3A3A300505050004D4D4D00525252005252
      52004E4E4E00B7B7B70000000000000000000000000000000000FCFCFC00A8A8
      A800808080007A7A7A0047474700D0D0D0000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000F6F6F500A9B5
      B400B25A5500E9030000E70C0000E7090000E7000000F7908100FFF8E700FFDD
      C900FBCCB600F3BAA700EAA79700D08E830082817F008584820056545300CFCF
      CF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F5F5F500B0B0B000757575004E4E4E00515151005050
      50004D4D4D00ADADAD00F4F4F400E1E1E100D4D4D400C6C6C600B8B8B800A0A0
      A000808080008383830054545400CFCFCF000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000CACD
      CC00A2928F00CF2B1D00D5372800C9463A00BD524900B6857B00AF9B9000A38F
      8800988985008E8683008683820081838200807E7C0083817F0082807F00F6F6
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CBCBCB00969696005D5D5D00666666006D6D
      6D0072727200929292009E9E9E00939393008C8C8C0087878700838383008282
      82007E7E7E008181810080808000F6F6F6000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000F0F0
      EF00A6A6A400A6A8A600A5ABAA00A4AEAD00A7B2B200AAB0B000AFB1B000B5B7
      B600BCBDBD00C3C3C200C8C8C700D4D3D200DEDEDD00E4E3E300F4F4F4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFEFEF00A5A5A500A6A6A600A8A8A800AAAA
      AA00AEAEAE00AEAEAE00B0B0B000B6B6B600BCBCBC00C2C2C200C7C7C700D3D3
      D300DDDDDD00E3E3E300F4F4F400000000000000000000000000000000000000
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
      0000E7E6E600E6E8E700EEEFEE00F4F4F400F9F9F900FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E6E6E600E7E7E700EEEEEE00F4F4
      F400F9F9F900FEFEFE0000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000FEFF
      FF00F4F5F600E6E6E500DCDAD800D4D1CE00D1CECB00D2CFCD00D7D6D500E0E0
      E000EAECED00F6F8FA00FDFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00F5F5F500E5E5E500DADADA00D1D1
      D100CECECE00CFCFCF00D6D6D600E0E0E000EBEBEB00F8F8F800FEFEFE000000
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
      00000000000000000000000000000000000000000000FEFFFF00EAE4DD00D2BE
      AB00C2A58900BA997700B7936F00B6916D00B6916C00B5916C00B4906D00B492
      7100B6977800B9A18800CCBFB700DCD8D400F1F3F50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00E3E3E300BEBEBE00A5A5A50098989800939393009191
      91009191910090909000909090009292920097979700A0A0A000C0C0C000D8D8
      D800F3F3F3000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000E1D5C900CAA78300C49D
      7600C19A7300C19A7400C29B7500C29C7600C29C7600C19B7500C19A7300BF98
      7100BE976E00BB926700DBB7A600C29C7D00B79C8200CBC6C200F3F5F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D5D5D500A6A6A6009D9D9D009A9A9A009A9A9A009B9B9B009C9C
      9C009C9C9C009B9B9B009A9A9A00989898009696960091919100BDBDBD009E9E
      9E009C9C9C00C6C6C600F5F5F500000000000000000000000000000000000000
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
      000000000000000000000000000000000000F7F9FA00D1B89E00C7A17A00C19B
      7500C49F7A00C6A27D00C8A47F00C8A58000C8A48000C7A37E00C5A07C00C49E
      7900C29C7600C19B7500E6C6BC00CCA88A00BD946900BA946E00B1A59900E3E6
      E800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800B7B7B700A0A0A0009B9B9B009F9F9F00A1A1A100A3A3A300A4A4
      A400A4A4A400A2A2A200A0A0A0009E9E9E009C9C9C009B9B9B00CDCDCD00AAAA
      AA009393930094949400A5A5A500E5E5E5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D3D3D3007F7F7F005757570066666600A6A6A600E2E2
      E200FBFBFB00FCFCFC00FCFCF800FAF8F200F4F2EB00EDECE400E7E6DE00E1E0
      D800DCDAD300D5D4CF00D0D0CE00D0D0D000CFCFCF00BABABA00A2A2A200B5B5
      B500C9C9C900BDBDBD00F1F1F100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3D3D3007F7F
      7F005757570066666600A6A6A600E2E2E200FBFBFB00FCFCFC00FAFAFA00F6F6
      F600F0F0F000E9E9E900E3E3E300DDDDDD00D8D8D800D2D2D200CFCFCF00D0D0
      D000CFCFCF00BABABA00A2A2A200B5B5B500C9C9C900BDBDBD00F1F1F1000000
      000000000000000000000000000000000000F6F7F800D5BAA000C9A37D00C7A2
      7E00CBA78300CEAB8800D1AE8C00D2B08E00D2B08E00D0AD8B00CDA98600CAA5
      8100C6A07A00CBA68500EACEC800CCAD9200C19B7300C49D7600C29B7400AFA4
      9900F0F2F4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700BABABA00A3A3A300A2A2A200A7A7A700ABABAB00AEAEAE00B0B0
      B000B0B0B000ADADAD00A9A9A900A5A5A500A0A0A000A7A7A700D5D5D500AEAE
      AE009A9A9A009D9D9D009B9B9B00A4A4A400F2F2F20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CFCFCF00858585006868680081818100E2E2E200000000000000
      0000FFFFFB00F4F3EE00CCCDD8009EA4C3007B85B5006975AF006672AD006C77
      AB007F87AD009BA0B200B9B9B900C9C7BE00C1C0BA00B8B8B700C4C4C400BDBD
      BD00B7B7B700D0D0D000BFBFBF00F1F1F1000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00858585006868
      680081818100E2E2E2000000000000000000FDFDFD00F1F1F100D0D0D000ACAC
      AC009191910084848400818181008484840091919100A4A4A400B9B9B900C4C4
      C400BEBEBE00B7B7B700C4C4C400BDBDBD00B7B7B700D0D0D000BFBFBF00F1F1
      F1000000000000000000000000000000000000000000DEC5AC00CDA88200CDAA
      8600D3B08E00D7B69600DBBC9C00DDBE9F00DCBD9E00DABA9900D5B49200D0AE
      8B00CAA68000D8B79E00EAD1CD00C9AF9900C6A07900C6A07A00CAA37D00C6A4
      8300D0C9C800F3EEF200EAE6E800E8E5E600E9E5E700ECE7E900F1ECEE00F8F3
      F600FFFBFD000000000000000000000000000000000000000000000000000000
      000000000000C5C5C500A7A7A700A9A9A900B0B0B000B6B6B600BBBBBB00BEBE
      BE00BDBDBD00B9B9B900B3B3B300ADADAD00A5A5A500B9B9B900D8D8D800B0B0
      B0009F9F9F00A0A0A000A3A3A300A4A4A400CBCBCB00F1F1F100E8E8E800E6E6
      E600E7E7E700E9E9E900EEEEEE00F5F5F500FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDC008181810078787800B8B8B800FDFDFD0000000000FFFFFD00E5E5
      E900878EBD003242A1000B24A100011EAB000222B5000325BC000427BE000428
      BE000527B9000929B0001A35A40047589C008B8FA100B5B3AC00B4B3AF00BEBE
      BE00CFCFCF00BFBFBF00CCCCCC00C2C2C200F9F9F90000000000000000000000
      000000000000000000000000000000000000DCDCDC008181810078787800B8B8
      B800FDFDFD0000000000FEFEFE00E6E6E6009B9B9B005C5C5C00454545004343
      4300484848004C4C4C004D4D4D004E4E4E004C4C4C004B4B4B00515151006969
      690093939300B1B1B100B2B2B200BEBEBE00CFCFCF00BFBFBF00CCCCCC00C2C2
      C200F9F9F90000000000000000000000000000000000E5D0BC00D3AF8A00D4B1
      8F00DABA9900E1C2A400E6C9AC00E8CCB100E8CBAF00E4C6A900DEBE9F00D7B6
      9400D2AE8B00E6CABC00E5CECA00C7B29F00CBA57E00CAA57F00CAA47E00D8B1
      8E00869882005D8E7800618D76005F8A74005B8B73005D8C7400618E77006992
      7D00799C8A0098B2A500B8CAC100E0E5E300FFFEFE0000000000000000000000
      000000000000D0D0D000AEAEAE00B1B1B100B9B9B900C2C2C200C9C9C900CCCC
      CC00CBCBCB00C6C6C600BEBEBE00B5B5B500AEAEAE00CECECE00D4D4D400B2B2
      B200A4A4A400A4A4A400A4A4A400B2B2B2008A8A8A0076767600767676007474
      74007373730074747400777777007D7D7D008A8A8A00A5A5A500C1C1C100E2E2
      E200FEFEFE00000000000000000000000000000000000000000000000000F5F5
      F5008A8A8A0072727200CECECE0000000000FFFFFE00FBFAF7008B92C0001528
      9A000016A7000423BA000E2FC7001235CD001337D1001339D400143BD600143C
      D800143DD900143DDA000F38D700072FCC00082AB200364A98009C9EA800CBCA
      C200CCCCCC00DADADA00C3C3C300C3C3C300CECECE0000000000000000000000
      0000000000000000000000000000F5F5F5008A8A8A0072727200CECECE000000
      0000FEFEFE00F9F9F9009F9F9F00474747003F3F3F004B4B4B00565656005C5C
      5C005E5E5E0060606000616161006262620063636300636363005F5F5F005656
      56004C4C4C005D5D5D00A0A0A000C7C7C700CCCCCC00DADADA00C3C3C300C3C3
      C300CECECE0000000000000000000000000000000000EFE3D700D8B59200DAB8
      9700E1C2A300E9CCB000EFD4BA00F2D8BF00F1D7BE00ECD1B600E5C7AA00DDBC
      9B00DDBDA100ECD5CC00E0CBC500C6B3A300D0AA8400CEA98400CFA98400DAB6
      95005A926E00348861004B8B6A005E9074003A8B63003E8B64003D8A64003D8A
      63003C896300478F6B0059997900629D7F008DB3A000F5F4F500000000000000
      000000000000E3E3E300B5B5B500B8B8B800C2C2C200CCCCCC00D4D4D400D8D8
      D800D7D7D700D1D1D100C7C7C700BCBCBC00BEBEBE00D9D9D900D0D0D000B4B4
      B400AAAAAA00A9A9A900A9A9A900B7B7B700737373005F5F5F006A6A6A007676
      760062626200646464006363630063636300626262006B6B6B00797979007F7F
      7F00A0A0A000F4F4F4000000000000000000000000000000000000000000B4B4
      B40065656500C9C9C90000000000FFFFFE00E2E2EA003E4BA300000E9F000724
      BA000D2EC8001033CD001237D200133BD800143EDC001440DF001541E1001542
      E3001542E3001542E3001542E400103EE700113EE6000834D7000C2CAB007C85
      AA00DEDCD300DBDBDB00E3E3E300C2C2C200BBBBBB00EAEAEA00000000000000
      0000000000000000000000000000B4B4B40065656500C9C9C90000000000FEFE
      FE00E4E4E40064646400393939004C4C4C00565656005A5A5A005E5E5E006262
      6200646464006666660067676700686868006868680068686800696969006767
      6700676767005B5B5B004B4B4B008E8E8E00D9D9D900DBDBDB00E3E3E300C2C2
      C200BBBBBB00EAEAEA00000000000000000000000000FAF7F500DDBE9F00DEBD
      9C00E5C7AA00EDD1B700F3DAC200F7DEC700F6DDC600F1D7BD00E9CDB100E1C1
      A100E7CEBD00EDD7CF00DAC9C300C2B09F00D5AF8900D2AC8700DAB28E00C7B4
      9300478F6B00428E69006093780090A79400418E6800478F6B0047906C004890
      6C0049916D0049926E004E96720061A28200599B7A00B0C6BB00000000000000
      000000000000F7F7F700BEBEBE00BDBDBD00C7C7C700D1D1D100DADADA00DEDE
      DE00DDDDDD00D7D7D700CDCDCD00C1C1C100D0D0D000DBDBDB00CCCCCC00B0B0
      B000AFAFAF00ACACAC00B3B3B300AFAFAF006B6B6B0068686800797979009999
      9900676767006B6B6B006B6B6B006C6C6C006D6D6D006D6D6D00727272008181
      81007A7A7A00BBBBBB0000000000000000000000000000000000F0F0F0006E6E
      6E00ABABAB0000000000FFFFFE00D9DAE6001F2E9B000015AA000D2BC1000829
      C500112FAF000A2FC400113DE2001441E5001544EA001545EC001546EE001647
      EF001647EF001648F2000D40EC002849BD001B40C3000F41ED001141EA000129
      BD006C78AC00EEECE200ECECEC00E7E7E800B9B9B900C7C7C700000000000000
      00000000000000000000F0F0F0006E6E6E00ABABAB0000000000FEFEFE00DDDD
      DD004D4D4D003F3F3F0053535300525252004F4F4F0054545400656565006868
      68006B6B6B006C6C6C006D6D6D006E6E6E006E6E6E0070707000686868006464
      64005F5F5F0069696900696969004D4D4D0085858500E9E9E900ECECEC00E7E7
      E700B9B9B900C7C7C70000000000000000000000000000000000EAD8C700DFBC
      9A00E7C9AC00EED3B800F4DBC200F7DFC800F6DEC600F2D8BE00EBCEB100EACD
      B100F2DACB00F3DBCE00D6C6C000BFAB9900DAB48E00D5B08C00E6BA98008EA4
      820040906B0045926C006E9A8200B3BAAB004B936F0048926E004A936F004C95
      71004F987400529B7700529C7800559D7A0068A88800A0C5B300000000000000
      00000000000000000000D8D8D800BCBCBC00C9C9C900D3D3D300DBDBDB00DFDF
      DF00DEDEDE00D8D8D800CECECE00CDCDCD00DDDDDD00DEDEDE00C9C9C900ABAB
      AB00B4B4B400B0B0B000BDBDBD0091919100696969006B6B6B0083838300B2B2
      B2006F6F6F006D6D6D006E6E6E00707070007373730076767600777777007979
      790088888800B2B2B20000000000000000000000000000000000B7B7B7007878
      7800FAFAFA0000000000E6E7ED00222F9B000016AD000C29C0000123C3002B41
      A000A4A4A0006B78A8000732CF001145F4001549F6001549F700154AF800154B
      F900154BFD000840F600405CB800C4C1B600ABB0BD001740C6000D41F4001243
      F1000026C000858FBB00FFFCF400FAFAFA00DCDCDC00ACACAC00F2F2F2000000
      00000000000000000000B7B7B70078787800FAFAFA0000000000E8E8E8004E4E
      4E0041414100515151004D4D4D0059595900A2A2A20083838300585858006E6E
      6E0071717100717171007272720073737300747474006A6A6A0071717100BEBE
      BE00B2B2B2005F5F5F006B6B6B006C6C6C004C4C4C009A9A9A00FAFAFA00FAFA
      FA00DCDCDC00ACACAC00F2F2F200000000000000000000000000FCFAF900E4C8
      AC00E6C6A700EDD1B600F2D7BE00F4DAC200F3DAC100F1D5BB00EDCDAE00DBC8
      BA00C3C1C300C2C0C300BCB2AE00C1AA9300DDB89200E0B89300CEB593005096
      72004A94700048946F00729B8400CAC8BA00649F7E0048926E004E977300529B
      770058A17D005EA7840062AC880063AC890072B19300A4CAB700000000000000
      00000000000000000000FAFAFA00C8C8C800C6C6C600D1D1D100D7D7D700DADA
      DA00DADADA00D5D5D500CDCDCD00C9C9C900C2C2C200C1C1C100B4B4B400AAAA
      AA00B7B7B700B9B9B900B2B2B200727272006F6F6F006E6E6E0085858500C4C4
      C400808080006D6D6D0072727200767676007C7C7C0083838300878787008888
      880092929200B7B7B7000000000000000000000000000000000083838300C8C8
      C80000000000FFFEF9004C55A900000EA5000B26BC00001EBD003347A000B1B0
      AC00DDDCD700D9D6CD00707DA8000A39D7001148FF00154BFF00144BFE00144B
      FF000940F7004660B600C7C4BB00F0EFED00F6F4EC00A7ACBD00143EC9000C40
      F5000F3FEF000529B500BEC2D600FFFFFE00FBFBFB00B3B3B300D9D9D9000000
      0000000000000000000083838300C8C8C80000000000FCFCFC006E6E6E003B3B
      3B004F4F4F00494949005E5E5E00AFAFAF00DADADA00D4D4D400878787005E5E
      5E00727272007575750074747400747474006A6A6A0074747400C2C2C200EEEE
      EE00F2F2F200B0B0B0005E5E5E006B6B6B00696969004B4B4B00C7C7C700FEFE
      FE00FBFBFB00B3B3B300D9D9D90000000000000000000000000000000000F8F2
      EC00E5C7A900EACAAC00EED2B600F0D5BA00F0D4B900EECDAE00C6BBB10083A5
      C600749DC4006D97C000768FA900D0B19300E5BC9700E3BB980074A07E004796
      72004F97730048946F00769B8500D3D0C2008CB0960045906C005198750058A0
      7D0061AA87006CB5930072BC9A0075BE9C007DBE9F00C1DCCF00000000000000
      0000000000000000000000000000F2F2F200C7C7C700CACACA00D2D2D200D5D5
      D500D4D4D400CDCDCD00BBBBBB00A4A4A4009C9C9C00969696008F8F8F00B1B1
      B100BDBDBD00BCBCBC00868686006F6F6F00737373006E6E6E0087878700CCCC
      CC009B9B9B006B6B6B00747474007C7C7C008686860091919100989898009A9A
      9A009E9E9E00CECECE00000000000000000000000000E8E8E80089898900FBFB
      FB0000000000A5A8CC00000A99000721B600031FB600394A9C00C3C1B900F0EF
      EC00E9E9E900E3E3E300E0DDD1007984A9000939D6000E47FF00124BFF00063F
      F6004B63B000C8C4B800EBEBE900E9E9EA00EAEAEB00F8F5EB00A4A9BC00153E
      C9000E40F0000331DE00344AAE00FCFBF60000000000D6D6D600C4C4C4000000
      000000000000E8E8E80089898900FBFBFB0000000000B3B3B300363636004A4A
      4A00484848005F5F5F00BFBFBF00EEEEEE00E9E9E900E3E3E300DADADA008C8C
      8C005D5D5D0071717100747474006969690074747400C1C1C100EAEAEA00E9E9
      E900EAEAEA00F2F2F200ADADAD005E5E5E006A6A6A005B5B5B0064646400F9F9
      F90000000000D6D6D600C4C4C400000000000000000000000000000000000000
      0000F8F2EB00E8CBAF00E9C8A800EACCAF00DFC1A400C2AF9B0080A4C60077A0
      C600759ABE006891B8007792AC00E8BF9700E1BE980083A68300499975005299
      750050967300468F6C00769B8300DBDBC600BDCCB4004D8F6C004F9472005BA0
      7E0068AF8E0077C09E007FCAA90084CDAC0090CDB100E9F3EE00000000000000
      000000000000000000000000000000000000F1F1F100CBCBCB00C8C8C800CCCC
      CC00C1C1C100AEAEAE00A3A3A3009F9F9F00999999009090900091919100BFBF
      BF00BDBDBD008E8E8E007272720075757500737373006B6B6B0086868600D4D4
      D400BFBFBF006D6D6D00717171007D7D7D008C8C8C009C9C9C00A6A6A600A9A9
      A900AFAFAF00EEEEEE00000000000000000000000000D2D2D200B6B6B6000000
      0000F9F8F4002E389E000014A800021CB5001E34AD00C8C6BB00EFEFEB00EAEA
      EA00EAEAEA00EBEBEB00EDEDED00ECE9DF008B94B2000C3BD4000239EF005166
      A900C3BFB400E2E1E000E0E0E000E2E2E200E5E5E500E8E8E900FDF8E700919C
      C3000334E5000F3CE9000020BB00A6ACCC0000000000EFEFEF00C3C3C3000000
      000000000000D2D2D200B6B6B60000000000F7F7F700565656003E3E3E004646
      460055555500C3C3C300EDEDED00EAEAEA00EAEAEA00EBEBEB00EDEDED00E6E6
      E6009B9B9B005E5E5E006363630075757500BCBCBC00E1E1E100E0E0E000E2E2
      E200E5E5E500E8E8E800F4F4F400A5A5A5005E5E5E006666660049494900B4B4
      B40000000000EFEFEF00C3C3C300000000000000000000000000000000000000
      000000000000FCF9F600E7D2BD00C8AA8D00BE9F820091A3B40076A0C900759A
      BE006C91B600698EB3007596B600A5ACB900A9C1BB004C9D7500559D79005398
      75004F9170004586650069907D00A5B6B500A6B7B60067927D00478767005898
      790068AC8C0079C0A00082CDAC0090D4B600AFDBC70000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900D2D2D200AAAA
      AA009F9F9F00A2A2A2009F9F9F0099999900919191008E8E8E0095959500AEAE
      AE00B7B7B70074747400797979007575750070707000656565007C7C7C00B0B0
      B000B1B1B1007C7C7C0067676700787878008A8A8A009D9D9D00A9A9A900B3B3
      B300C5C5C50000000000000000000000000000000000CDCDCD00DCDCDC000000
      0000BABBD400000C9500061DAD00061EB1000520B5007E8ACA00F6F4E900E9E9
      E700E7E7E700E8E8E800E9E9E900EDEEEE00F4F2E800959DBB005F6EA300C6C3
      B900DADAD900D6D6D600D8D8D800DBDBDB00DDDDDD00EBE9E000DADBE2004568
      E6000737EA000E3AE2000026CE004756AE00FFFFFA00F9F9F900CFCFCF00FBFB
      FB0000000000CDCDCD00DCDCDC0000000000C3C3C30035353500454545004747
      4700484848009B9B9B00F1F1F100E8E8E800E7E7E700E8E8E800E9E9E900EDED
      ED00EFEFEF00A4A4A4007A7A7A00C0C0C000D9D9D900D6D6D600D8D8D800DBDB
      DB00DDDDDD00E6E6E600DDDDDD00868686006262620063636300515151006E6E
      6E00FDFDFD00F9F9F900CFCFCF00FBFBFB000000000000000000000000000000
      0000000000000000000000000000EBE1D800B9ADA200789DC100749ABF006B91
      B6007296B90080A3C50081A6C9007FA7CE0081A7CB005C9D8800549C76005193
      72004B886900457D5D0042726E003D6898003F6A9700466F900045796200508A
      6D0060A0820070B5960084C9AB009BD5BB00E8F4EE0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E1E1
      E100ADADAD009C9C9C00999999009090900095959500A2A2A200A5A5A500A6A6
      A600A6A6A600808080007777770072727200696969005F5F5F00606060006969
      69006A6A6A006C6C6C00606060006D6D6D008080800093939300A8A8A800B9B9
      B900EEEEEE0000000000000000000000000000000000D7D7D700ECECEC00FFFF
      FE00797FB90000099C00071CAB00071EAF000620B6000018BA006C7CCA00F0EE
      E500E9E8E600E5E5E600E7E7E700E8E8E800EBEBEB00EEEDE700E3E1D800EDED
      ED00E6E6E600DDDDDD00D6D6D600D4D4D500E3E1D600C0C6D8002750E5000134
      EE000F3BE6000D36DC00062DD300142BA800E5E5E900FFFFFD00E0E0E000F8F8
      F80000000000D7D7D700ECECEC00FEFEFE009090900037373700444444004646
      4600494949004646460090909000EBEBEB00E7E7E700E5E5E500E7E7E700E8E8
      E800EBEBEB00EBEBEB00DEDEDE00EDEDED00E6E6E600DDDDDD00D6D6D600D4D4
      D400DEDEDE00CACACA007474740061616100656565005F5F5F00575757004D4D
      4D00E6E6E600FEFEFE00E0E0E000F8F8F8000000000000000000000000000000
      000000000000000000000000000000000000E5ECF3007399BD006A91B6007296
      BA007CA1C4007AA1C6007AA0C4007FA5C8008AAFD7007BA7BB00529772004688
      6700467D61003F7154003D6A6C0040699300406990003F679500406B6F00477C
      5E00559073006AAA8C0085C2A600D6EBE1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ECECEC00989898009090900096969600A0A0A000A0A0A0009F9F9F00A4A4
      A400B0B0B0009F9F9F00737373006767670061616100565656005B5B5B006969
      690068686800696969005E5E5E0060606000727272008A8A8A00A4A4A400E0E0
      E0000000000000000000000000000000000000000000E0E0E000F1F1F100FCFB
      F6006A71B6000D1FA7000116A700071CAC00071FB2000722BA000019BF005B6E
      CA00EEECE400EBEAE600E4E4E500E5E5E500E6E6E600E8E8E800EBEBEB00EAEA
      EA00EBEBEB00EBEBEB00E9E9E900F3F0E200AAB3D7001542E5000335EE000D3B
      E7000C36DF000B31D600092DD000001AA800C1C3D80000000000E7E7E700F6F6
      F60000000000E0E0E000F1F1F100F9F9F90085858500464646003F3F3F004545
      4500484848004B4B4B004848480086868600EAEAEA00E9E9E900E4E4E400E5E5
      E500E6E6E600E8E8E800EBEBEB00EAEAEA00EBEBEB00EBEBEB00E9E9E900ECEC
      EC00BCBCBC00696969006262620065656500606060005B5B5B00575757004040
      4000C9C9C90000000000E7E7E700F6F6F6000000000000000000000000000000
      000000000000000000000000000000000000FCFCFD007C9DBD00678EB300799E
      C200799FC4006D8EAD006A89A6006D8DAA007596B4008EB2D600C0D4D20075A1
      890042775C0032654700376369003C628D003B6289003B628C003C657D004373
      5900457E620065A18400D1E6DC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC009C9C9C008D8D8D009D9D9D009E9E9E008D8D8D00888888008C8C
      8C0095959500B2B2B200CCCCCC008A8A8A005C5C5C004A4A4A00565656006363
      630062626200636363005F5F5F005A5A5A006161610083838300DBDBDB000000
      00000000000000000000000000000000000000000000E2E2E200F2F2F200F2F2
      F000646CB5003F4DB9000F21A9000115A700071DAE000720B4000723BC000018
      C1004C62CA00E3E4E500EAEAE700E5E5E500E5E5E500E5E5E500E6E6E600E6E6
      E600E8E8E800E9E9E900F4F3ED009EACE4000836E4000534EA000D38E4000B34
      DE000A31D6000A2DCE000929C8000014A800A8ACCD0000000000EAEAEA00F6F6
      F60000000000E2E2E200F2F2F200F1F1F100818181006C6C6C00484848003F3F
      3F0046464600494949004C4C4C00484848007D7D7D00E4E4E400E9E9E900E5E5
      E500E5E5E500E5E5E500E6E6E600E6E6E600E8E8E800E9E9E900F1F1F100BABA
      BA006060600061616100636363005F5F5F005B5B5B0057575700535353003E3E
      3E00B5B5B50000000000EAEAEA00F6F6F6000000000000000000000000000000
      0000000000000000000000000000000000000000000084A2C0006F97BD00799F
      C4007CA2C6007EA2C50086ADD0008BB1D40088ADCD0088B0D400D0DEEC000000
      0000BAC3BE008CA392005074820031578000355B800034587E00375977003C6B
      550070A08700E1EEE80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A2A2A200969696009E9E9E00A1A1A100A1A1A100ABABAB00B0B0
      B000ABABAB00AEAEAE00DEDEDE0000000000BEBEBE00959595006C6C6C005858
      58005A5A5A0058585800575757005454540087878700E7E7E700000000000000
      00000000000000000000000000000000000000000000E6E6E600F0F0EF00EEEE
      ED006970B800525EBF004A57BD000E21AA000015A800061CAF00071FB5000723
      BD000013C1004A5BB900ECEBE300EAEAE900E6E6E600E5E5E500E5E5E500E5E5
      E500E5E5E500F3F1E900939ECB000021D2000632E5000A34DE000A31DA00092E
      D400082BCD000827C5000724BF000010A3009FA4C90000000000E7E7E700F6F6
      F60000000000E6E6E600EFEFEF00EDEDED00858585007A7A7A00747474004848
      48003F3F3F0045454500494949004D4D4D004646460074747400E8E8E800E9E9
      E900E6E6E600E5E5E500E5E5E500E5E5E500E5E5E500EFEFEF00A9A9A9005151
      51005F5F5F005E5E5E005C5C5C005959590055555500515151004E4E4E003B3B
      3B00AEAEAE0000000000E7E7E700F6F6F6000000000000000000000000000000
      000000000000000000000000000000000000ACBDCB006A90B400799FC3007DA3
      C70081A7CB0087ADD0008BB1D30090B6D70095BBDD0092BBDE00BDD4E900DFDC
      DA003D3A3A00A7A6AA006E8DAD00476B8F004D70940041618200303439003238
      3400949795000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BCBCBC008F8F8F009E9E9E00A2A2A200A6A6A600ACACAC00AFAFAF00B4B4
      B400B9B9B900B9B9B900D3D3D300DCDCDC003B3B3B00A7A7A7008D8D8D006B6B
      6B00707070006161610034343400343434009595950000000000000000000000
      00000000000000000000000000000000000000000000ECECEC00EBEBEA00F0F0
      EE00797FBD005B66C000616BC4005561C100192AAD000012A700041BAF000016
      B5000E22A1008F94AB00EEEEEA00F2F2F200ECECEC00E9E9E900E7E7E700E5E5
      E500E5E5E500ECEBE900BFC1C8002C42A6000020CC00082DD600082BCF000828
      C9000725C3000722BC000620B800000D9C00ACAECE00FFFFFA00E1E1E100F9F9
      F90000000000ECECEC00EAEAEA00EFEFEF009191910080808000858585007D7D
      7D00505050003D3D3D004444440043434300454545009A9A9A00ECECEC00F2F2
      F200ECECEC00E9E9E900E7E7E700E5E5E500E5E5E500EAEAEA00C2C2C2005C5C
      5C004E4E4E005959590056565600535353004F4F4F004C4C4C004A4A4A003838
      3800B8B8B800FDFDFD00E1E1E100F9F9F9000000000000000000000000000000
      0000000000000000000000000000CED6DB004D7291006382A1007DA2C60081A7
      CB0086ACCF008CB2D40092B8D9009ABFDE009EC4E2009DC5E500B2CEE5005957
      560026232000384B5E00406387003B5A7A0039597800456A8F003D4D5E003E3A
      3800434242009494940000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D5D5
      D5007070700082828200A1A1A100A6A6A600ABABAB00B0B0B000B6B6B600BDBD
      BD00C1C1C100C2C2C200CCCCCC0057575700232323004B4B4B00636363005A5A
      5A00585858006A6A6A004D4D4D003A3A3A004242420094949400000000000000
      00000000000000000000000000000000000000000000F0F0F000E4E4E400F4F3
      F0009194C4006770C3006A73C6006973C600646FC6003141B600000FA6001220
      9400A6A8B300FCFBF40000000000F9F9F900F6F6F600F2F2F200EEEEEE00EBEB
      EB00E8E8E800E5E5E600EDECE900CFCEC90038489D000018BA000624C6000622
      BE00061FB900051DB400041AB100000F9400C4C5D700F4F4EF00E1E1E1000000
      000000000000F0F0F000E4E4E400F2F2F200A3A3A300888888008B8B8B008B8B
      8B0088888800626262003C3C3C0042424200ABABAB00F9F9F90000000000F9F9
      F900F6F6F600F2F2F200EEEEEE00EBEBEB00E8E8E800E5E5E500EBEBEB00CCCC
      CC005F5F5F0046464600505050004C4C4C004A4A4A0047474700454545003636
      3600CACACA00F2F2F200E1E1E100000000000000000000000000000000000000
      00000000000000000000000000007F96A200527899007595B60082A8CC0086AC
      CE008BB1D40093B8D9009EC4E100AACFE700AED3EB00B2D7F100A3C0D6003A38
      360037393B004D7093004A6E9400486E930042678B00395C7F003D5E7F003B3C
      3D005B5A59004A4A4A00D5D5D500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009292
      92007676760095959500A7A7A700AAAAAA00B0B0B000B6B6B600C1C1C100CACA
      CA00CECECE00D3D3D300BDBDBD003838380039393900707070006E6E6E006D6D
      6D00666666005C5C5C005E5E5E003C3C3C005A5A5A004A4A4A00D5D5D5000000
      00000000000000000000000000000000000000000000F6F6F600DBDBDB00F4F4
      F000B3B5D100737AC500777FCA00737CC900727BC9006C76C9005F68B200B3B4
      BC00FEFEF700000000000000000000000000FDFDFD0000000000FEFEFC00F4F4
      F400F0F0F000EDEDED00E9E9EA00F0EFEC00D7D5CE00414D9700000FA800041C
      B700051BB0000419AC000011A70019239200E2E2E400E3E3E100E6E6E6000000
      000000000000F6F6F600DBDBDB00F2F2F200BDBDBD0090909000959595009292
      9200929292008E8E8E007D7D7D00B6B6B600FBFBFB0000000000000000000000
      0000FDFDFD0000000000FDFDFD00F4F4F400F0F0F000EDEDED00E9E9E900EEEE
      EE00D3D3D300616161003D3D3D004747470045454500434343003D3D3D004444
      4400E2E2E200E2E2E200E6E6E600000000000000000000000000000000000000
      000000000000000000000000000062809000365F79004F7692006E95B6008DB3
      D60092B8DA008FB2CD00A7CBE100AECFDF00C1E1EE00C4E6F700BDDAEE005A58
      56003C4753005B83AC00577DA30053789E004E759A004A709700426990003A3F
      44004E4C4A00515151008D8D8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B005A5A5A007272720093939300B2B2B200B6B6B600AFAFAF00C6C6C600C9C9
      C900DADADA00E0E0E000D7D7D7005858580047474700838383007D7D7D007878
      78007474740070707000696969003F3F3F004C4C4C00515151008D8D8D000000
      0000000000000000000000000000000000000000000000000000D5D5D500EBEB
      E900D8D8E0008489C600838ACE008087CD007A82CB00898FC100DEDEDC00FFFF
      FE000000000000000000000000000000000000000000C5CAE900BDC2E5000000
      0000FAFAFA00F6F6F600F2F2F200EFEFEF00F3F3F100E2E0D6004D5694000011
      9F000216AA000316A6000005990052569F00F1F1EA00D5D5D500F2F2F2000000
      00000000000000000000D5D5D500EAEAEA00DADADA009B9B9B009E9E9E009C9C
      9C00979797009D9D9D00DDDDDD00FEFEFE000000000000000000000000000000
      000000000000D2D2D200CCCCCC0000000000FAFAFA00F6F6F600F2F2F200EFEF
      EF00F2F2F200DDDDDD00676767003A3A3A00404040003F3F3F00343434006D6D
      6D00EEEEEE00D5D5D500F2F2F200000000000000000000000000000000000000
      0000000000000000000000000000628495002A556B002B546700648BAA0094B9
      DC0095BBDC00A2C7E400B5DAEE00CDEDF600D6F3F900CCEBF700CBE5F700B4B0
      AD00485B6F00668FB7006388AE006085AA00597FA40052789E004B7299003F59
      73003D3E3E005151500072727200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007E7E
      7E004E4E4E004C4C4C0088888800B8B8B800B9B9B900C4C4C400D4D4D400E5E5
      E500EBEBEB00E4E4E400E2E2E200B0B0B0005B5B5B008E8E8E00888888008585
      85007E7E7E007878780072727200595959003D3D3D0050505000727272000000
      0000000000000000000000000000000000000000000000000000E1E1E100D6D6
      D600F0EFED00A5A8CD008B91D0008B91D100888ECC00DBDBE000000000000000
      000000000000000000000000000000000000B8BDE200040EA2000007A300A8AF
      DC0000000000FEFEFE00FBFBFB00F8F8F800F4F4F400FEFEFA00EBEBE0001F2C
      9900000CA2000112A20000048800AFAFC400E3E3DE00D3D3D300FEFEFE000000
      00000000000000000000E1E1E100D6D6D600EEEEEE00B3B3B300A4A4A400A4A4
      A400A0A0A000DCDCDC0000000000000000000000000000000000000000000000
      0000C7C7C7003C3C3C0038383800BBBBBB0000000000FEFEFE00FBFBFB00F8F8
      F800F4F4F400FCFCFC00E7E7E7004C4C4C003A3A3A003C3C3C002E2E2E00B6B6
      B600E1E1E100D3D3D300FEFEFE00000000000000000000000000000000000000
      00000000000000000000000000006A8C9E002F5D7400325C70005A839F009BC0
      E3009ABFE000A4C9E600B5D9EF00D0ECF700D5F1F900C9E8F600CADFED00F5F3
      F3007190B0007197BD007599BF007195BA006A8FB5005F84A900557BA1004267
      8C0039434D004D4B4A0073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008686
      860055555500545454007E7E7E00BFBFBF00BDBDBD00C6C6C600D4D4D400E6E6
      E600EAEAEA00E2E2E200DCDCDC00F3F3F3009090900097979700999999009595
      95008F8F8F00848484007B7B7B0067676700434343004B4B4B00737373000000
      0000000000000000000000000000000000000000000000000000F8F8F800C3C3
      C400ECECEA00D6D7E000989CCE00979CD5009197D200AAAEDA00F6F7FA000000
      0000000000000000000000000000CACDE8006C75C7005460C200303FB7001121
      A800A2A8D70000000000000000000000000000000000E8E9F1004F59B5000007
      9A00000B9C000000900045489500EAEAE200CDCDCD00E7E7E700000000000000
      00000000000000000000F8F8F800C3C3C300EBEBEB00D9D9D900ABABAB00ADAD
      AD00A8A8A800BBBBBB00F7F7F70000000000000000000000000000000000D5D5
      D5008D8D8D007C7C7C006262620048484800B5B5B50000000000000000000000
      000000000000EBEBEB007474740035353500373737003030300060606000E7E7
      E700CDCDCD00E7E7E70000000000000000000000000000000000000000000000
      000000000000000000000000000082A1B10031637B00386479004171880080A8
      C9009EC3E400A4C9E900B3D5EF00C9E4F600CFEAF900C3E1F500E5EDF500F7F8
      F80083A5C70082A6CA007A9BBC0082A5C8007193B5006E93B8005F85AB004B70
      94003F4B56004D4C4A0089898900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C005A5A5A005C5C5C0068686800A5A5A500C1C1C100C7C7C700D2D2D200E1E1
      E100E6E6E600DDDDDD00EDEDED00F7F7F700A5A5A500A6A6A6009B9B9B00A5A5
      A5009393930093939300858585006F6F6F004A4A4A004B4B4B00898989000000
      000000000000000000000000000000000000000000000000000000000000DADA
      DA00CACACA00F2F2EF00BFC0D7009EA2D400A1A5D800979BD400A5A9D800EEEF
      F6000000000000000000C2C5E4008289CD00868DD1008990D200888FD1007B83
      CE006871C500BFC2E2000000000000000000DCDDEF004E58B5001F2BA800313C
      AF00323DAE00444BA200D2D2D900E3E3DF00D1D1D100FEFEFE00000000000000
      0000000000000000000000000000DADADA00CACACA00F1F1F100C7C7C700B1B1
      B100B4B4B400ACACAC00B7B7B700F1F1F1000000000000000000CECECE009D9D
      9D00A1A1A100A3A3A300A2A2A200999999008A8A8A00CBCBCB00000000000000
      0000E2E2E20073737300505050005E5E5E005F5F5F0065656500D4D4D400E1E1
      E100D1D1D100FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000A7BCC60030637C0044778E00457B9200477D
      9500598CA7005E90AB005F91AA006294AD006B9BB5006A9EBA00D3E2E900FBFA
      FB008FAECE0098BADD0097B9DC0093B6D90085A8CA007DA3CA006B94BE005473
      920051504F0057575600B3B3B300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B8B8
      B8005A5A5A006D6D6D0070707000737373008484840088888800888888008B8B
      8B009393930096969600DFDFDF00FAFAFA00AEAEAE00BABABA00B9B9B900B6B6
      B600A7A7A700A3A3A30094949400737373005050500056565600B3B3B3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00D8D8D700ECECEB00B8BAD500A6AAD900A8ACDB00A0A4D800A6A9
      D800E2E3F100BFC2E3009095D100959AD4009399D4009096D3008C92D1008A90
      D100868CCF007980C900B9BDE000BEC1E3007279C5007279C7007980C9007178
      C6006A70B600C9CAD700F0F0EB00CBCBCB00F2F2F20000000000000000000000
      000000000000000000000000000000000000BDBDBD00D7D7D700EBEBEB00C2C2
      C200B8B8B800BABABA00B4B4B400B7B7B700E7E7E700CCCCCC00A7A7A700ABAB
      AB00AAAAAA00A8A8A800A5A5A500A3A3A300A0A0A00096969600C7C7C700CBCB
      CB009090900090909000969696008F8F8F0085858500CECECE00EEEEEE00CBCB
      CB00F2F2F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7ECEE004B7E96003D7994004B849D004D88
      A1004D8AA2004E8DA5005090A9004E91AB00468FAA005C9DB600D0E2E900FEFC
      FC009BBBDB00A5CAEF00A9CDF200A6CBF10093B7DC00718CA7005B6F8400505C
      69005D5C5B005E5E5E00E4E4E400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EBEB
      EB00757575006E6E6E00797979007C7C7C007D7D7D0080808000838383008383
      83007F7F7F008F8F8F00DEDEDE00FCFCFC00BBBBBB00CACACA00CDCDCD00CBCB
      CB00B7B7B7008C8C8C006F6F6F005C5C5C005C5C5C005E5E5E00E4E4E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F3F300ACACAC00DDDDDC00ECECEC00BFC0DA00ACB0DA00AEB2DE00AAAE
      DC00A4A8D900A2A6D800A4A8DA00A1A6D8009DA3D7009BA0D600989DD500959A
      D4009198D3008E94D100848BCE008087CB00838ACD008288CD00797FC800797E
      BC00C5C6D700F2F2ED00CECECE00E5E5E5000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300ACACAC00DCDCDC00ECEC
      EC00C8C8C800BCBCBC00BFBFBF00BCBCBC00B7B7B700B5B5B500B7B7B700B5B5
      B500B2B2B200B0B0B000AEAEAE00ABABAB00A9A9A900A6A6A6009F9F9F009B9B
      9B009E9E9E009D9D9D009595950091919100CBCBCB00F0F0F000CECECE00E5E5
      E500000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEE9ED0079A6B9004C8BA600498C
      A8004C90AC004E94B0004F96B2005EA0BA009FC7D600F4F8FA0000000000DDDD
      DD0069737D007D91A50088A0B9007C90A4005D636A0052504F00555350005B59
      5800606161008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E6E6E6009D9D9D007F7F7F007F7F7F008282820086868600878787009292
      9200BEBEBE00F7F7F70000000000DDDDDD007373730091919100A0A0A0009090
      9000636363005050500052525200595959006060600084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9E9E900ABABAB00E2E2E100F4F4F300CFD0E100B4B7DB00B2B6
      DE00B2B6E000B0B4DE00AEB2DD00ABAFDC00A8ACDB00A6AADA00A3A8D900A0A5
      D8009DA2D7009A9FD600979CD4009499D4008F95D100868BC900969AC700DADA
      E300F5F5F100CFCFCF00E0E0E000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900ABABAB00E1E1
      E100F3F3F300D5D5D500C2C2C200C2C2C200C2C2C200C0C0C000BFBFBF00BCBC
      BC00BABABA00B8B8B800B6B6B600B4B4B400B2B2B200AFAFAF00ADADAD00ABAB
      AB00A7A7A7009E9E9E00A7A7A700DDDDDD00F3F3F300CFCFCF00E0E0E0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEEBEF00AECD
      D90096BCCC0098BECD00B9D3DD00EDF4F6000000000000000000F3F3F3006868
      6800504E4C005452500055545200585654005F5E5D0066666600676767006868
      680063636300D7D7D70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E8E8E800C6C6C600B4B4B400B6B6B600CDCDCD00F2F2
      F2000000000000000000F3F3F300686868004E4E4E0052525200535353005656
      56005E5E5E0066666600676767006868680063636300D7D7D700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EEEEEE00B6B6B600DEDEDD00FDFDFB00E8E8EE00C7C9
      E000B8BBDD00B5B9DF00B5B9E000B4B8E000B2B6E000AFB3DE00ADB1DD00AAAF
      DC00A7ACDB00A4A9DA009FA4D7009A9ED100A0A3CE00C3C4DA00F5F4F400F0F0
      ED00CCCCCC00E3E3E30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEEEEE00B6B6
      B600DDDDDD00FCFCFC00EAEAEA00D0D0D000C5C5C500C4C4C400C4C4C400C4C4
      C400C2C2C200C0C0C000BEBEBE00BCBCBC00BABABA00B7B7B700B3B3B300ADAD
      AD00B0B0B000CBCBCB00F4F4F400EFEFEF00CCCCCC00E3E3E300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009B9B9B005555
      55006C6C6C007171710072727200767676007777770077777700757575006969
      6900AEAEAE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009B9B9B00555555006C6C6C0071717100727272007676
      760077777700777777007575750069696900AEAEAE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F9F9F900C8C8C800D0D0D000F8F8F600FFFF
      FE00EDEEF300D5D6E700C4C6E000BBBEDD00B7BADD00B4B7DC00B2B5DB00AFB3
      DA00AEB2D800B1B4D800BDBFDB00D8D8E700F6F6F700FCFCF900DDDDDC00CCCC
      CC00EFEFEF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F900C8C8C800D0D0D000F7F7F700FEFEFE00EFEFEF00DBDBDB00CECECE00C7C7
      C700C4C4C400C2C2C200C0C0C000BEBEBE00BDBDBD00BFBFBF00C7C7C700DDDD
      DD00F6F6F600FBFBFB00DCDCDC00CCCCCC00EFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9E9E900ADAD
      AD0082828200787878007A7A7A007D7D7D007C7C7C00787878007B7B7B00BBBB
      BB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E9E9E900ADADAD0082828200787878007A7A7A007D7D
      7D007C7C7C00787878007B7B7B00BBBBBB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900D5D5D500E5E5
      E500FAFAF80000000000FEFEFE00F6F6F900EEEEF400E9E9F100E7E8F000E9EA
      F100F0F1F600FAFAFB00FFFFFE00F9F9F600E2E2E100CCCCCC00DDDDDD00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9E9E900D5D5D500E5E5E500F9F9F90000000000FEFEFE00F7F7
      F700F0F0F000EBEBEB00EAEAEA00ECECEC00F2F2F200FAFAFA00FEFEFE00F8F8
      F800E1E1E100CCCCCC00DDDDDD00FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F3F300CBCBCB00ABABAB00A3A3A300A5A5A500BCBCBC00ECECEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300CBCBCB00ABABAB00A3A3
      A300A5A5A500BCBCBC00ECECEC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F2F2
      F200E6E6E600E5E5E500ECECEC00F3F3F200F7F7F600FAF9F800FBFAF900F9F9
      F800F6F6F500EEEEEE00DCDCDC00D2D2D200E3E3E300FAFAFA00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009A9DA0003B3C
      3C005E5E5D0060605F0051525300C6C9CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009D9D9D003B3B3B005D5D5D005F5F5F0052525200C9C9
      C900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00F8F8F800F6F5
      F500E4E3E300D8D8D800D9D9D900DEDEDE00E3E3E300E8E8E800ECECEC00F0F0
      F000F3F3F300F6F6F600F8F8F800F9F9F900FBFBFB00FCFCFC00FDFDFD00FDFD
      FD00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB00F8F8F800F5F5F500E3E3E300D8D8D800D9D9D900DEDE
      DE00E3E3E300E8E8E800ECECEC00F0F0F000F3F3F300F6F6F600F8F8F800F9F9
      F900FBFBFB00FCFCFC00FDFDFD00FDFDFD00FEFEFE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000919497000A0A0B003333
      3300494A4A005E5F5F0060605F004E4F5000C4C7CA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000949494000A0A0A0033333300494949005E5E5E005F5F5F004F4F
      4F00C7C7C7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A6A6006164
      670094939200A8A6A500AAA7A500AAA9A800ADADAD00B4B4B400BBBBBB00C2C2
      C200C8C8C800CECECE00D4D4D400D9D9D900DEDEDE00E2E2E200E6E6E600E9E9
      E900ECECEC00EFEFEF00F1F1F100F3F3F300F5F5F500F7F7F700F8F8F800FAFA
      FA00FCFCFC00FDFDFD00FEFEFE00000000000000000000000000000000000000
      00000000000000000000A5A5A5006464640093939300A6A6A600A7A7A700A9A9
      A900ADADAD00B4B4B400BBBBBB00C2C2C200C8C8C800CECECE00D4D4D400D9D9
      D900DEDEDE00E2E2E200E6E6E600E9E9E900ECECEC00EFEFEF00F1F1F100F3F3
      F300F5F5F500F7F7F700F8F8F800FAFAFA00FCFCFC00FDFDFD00FEFEFE000000
      00000000000000000000000000000000000000000000A3A6A900000000001717
      1700343434004A4A4A005E5E5E005D5D5D004E4F5100C4C7CA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A6A6A6000000000017171700343434004A4A4A005E5E5E005D5D
      5D004F4F4F00C7C7C70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3E2E2003E42
      46003A596E00688B9D008B9CA300AFB3B500C6C3C100C5C1BE00BABABA00BBBB
      BB00BCBCBC00BFBFBF00C2C2C200C5C5C500C9C9C900CDCDCD00D0D0D000D4D4
      D400D8D8D800DBDBDB00DEDEDE00E1E1E100E4E4E400E7E7E700EAEAEA00EDED
      ED00F0F0F000F4F4F400F9F9F900FDFDFD00FEFEFE0000000000000000000000
      00000000000000000000E2E2E20042424200555555008585850098989800B2B2
      B200C3C3C300C1C1C100BABABA00BBBBBB00BCBCBC00BFBFBF00C2C2C200C5C5
      C500C9C9C900CDCDCD00D0D0D000D4D4D400D8D8D800DBDBDB00DEDEDE00E1E1
      E100E4E4E400E7E7E700EAEAEA00EDEDED00F0F0F000F4F4F400F9F9F900FDFD
      FD00FEFEFE000000000000000000000000000000000000000000A2A4A8000000
      01001818170034343400474747005E5E5E00605F5F004F505200C5C7CA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A4A4A400000000001717170034343400474747005E5E
      5E005F5F5F0050505000C7C7C700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E8EA
      EA00AED2E6005C94BB00568AA8005C879B007A9AAB00B7C8D800F7F4F000EAE8
      E700E3E3E300E0E0E000DDDDDD00DBDBDB00DADADA00D9D9D900D9D9D900D9D9
      D900D9D9D900DBDBDB00DCDCDC00DEDEDE00DFDFDF00E1E1E100E3E3E300E6E6
      E600E9E9E900EEEEEE00F4F4F400F9F9F900FDFDFD0000000000000000000000
      0000000000000000000000000000E9E9E900CCCCCC008E8E8E00828282007F7F
      7F0095959500C7C7C700F3F3F300E8E8E800E3E3E300E0E0E000DDDDDD00DBDB
      DB00DADADA00D9D9D900D9D9D900D9D9D900D9D9D900DBDBDB00DCDCDC00DEDE
      DE00DFDFDF00E1E1E100E3E3E300E6E6E600E9E9E900EEEEEE00F4F4F400F9F9
      F900FDFDFD00000000000000000000000000000000000000000000000000A2A5
      A800000102001514140032323200484848005E5E5E00605F5F004D4F5000C5C7
      CA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5000101010014141400323232004848
      48005E5E5E005F5F5F004E4E4E00C7C7C7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000A3A6A900000102001515140032323200484848005E5E5E00606060004D4E
      5000C4C7CA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A6A6A60001010100141414003232
      3200484848005E5E5E00606060004E4E4E00C7C7C70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000A3A6A900000102001414140032323200484848005E5E5E005D5C
      5C005C5E6000F5F6F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A6A6A600010101001414
      140032323200484848005E5E5E005C5C5C005E5E5E00F6F6F600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000A3A5A900000000001515150032323200494949005C5B
      5B0064656700EFF0F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5000000
      00001515150032323200494949005B5B5B0065656500F0F0F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000A4A6AA0000010200111110002E2E2D003B3B
      3B0075777A00EBEBEC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A6A6
      A60001010100101010002D2D2D003B3B3B0077777700EBEBEB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000A2A4A80011131500202123004D50
      530094959600C2C1C100FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A4A4A40013131300212121005050500095959500C1C1C100FBFBFB000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000ECEDEF00E6E8EA00EFF0
      F100C2C2C100B6B6B600CACACA00000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE00FDFDFD00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EDEDED00E8E8E800F0F0F000C1C1C100B6B6B600CACACA000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FDFDFD00FEFEFE0000000000000000000000000000000000000000000000
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
      0000FEFEFE00F1F1F100C3C3C300C8C8C8000000000000000000000000000000
      0000F9F9F900F3F3F300F0F0F000ECECEC00EBEBEC00ECECED00F0F1F100F4F4
      F400FAFAFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00F1F1F100C3C3C300C8C8
      C80000000000000000000000000000000000F9F9F900F3F3F300F0F0F000ECEC
      EC00EBEBEB00ECECEC00F0F0F000F4F4F400FAFAFA0000000000000000000000
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
      000000000000FEFEFE00EFEFEF00C4C4C400CACACA00FBFBFB00ECECEC00E7E7
      E700E0E0E000D1D1D200C1C1C100BBB9B700B8B6B400BBB9B700C2C1C000D2D2
      D300E0E1E200E8E9E900FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00EFEFEF00C4C4
      C400CACACA00FBFBFB00ECECEC00E7E7E700E0E0E000D1D1D100C1C1C100B9B9
      B900B6B6B600B9B9B900C1C1C100D2D2D200E1E1E100E8E8E800FBFBFB000000
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
      00000000000000000000FEFEFE00F0F0F000C3C3C30096969600BCBCBD00D6D7
      D700CBC9C700D9D4CE00EBE4DB00F5ECE000F8EDE000F5EADB00ECE0D000D9CF
      C300CBC7C100D2D3D400DADADB00F3F3F3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00F0F0
      F000C3C3C30096969600BCBCBC00D6D6D600C9C9C900D3D3D300E3E3E300EBEB
      EB00ECECEC00E8E8E800DEDEDE00CECECE00C6C6C600D3D3D300DADADA00F3F3
      F300000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000F9F9F900DADADA00C9C9CA00DADBDB00DEDA
      D500FAF3E900FFF9EE00FFF6EA00FEF3E600FCF1E200FCF0DF00FEEFDD00FFEF
      DB00F9E7D100DED2C300D4D4D300D0D1D200F1F1F10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F900DADADA00C9C9C900DADADA00D9D9D900F2F2F200F7F7F700F5F5F500F2F2
      F200EFEFEF00EEEEEE00EEEEEE00EDEDED00E5E5E500D1D1D100D3D3D300D1D1
      D100F1F1F1000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000EEEEEE00C6C6C600DDDEDE00E9E5DF00FFF8
      EF00FDF6EB00FCF2E700FCF1E400FBF0E100FBEEDE00FBEDDB00FAEBD800FAE9
      D400FBE9D200FCE8CE00E9D9C400D9D8D700CACBCC00F9F9F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEEE
      EE00C6C6C600DDDDDD00E4E4E400F7F7F700F4F4F400F1F1F100F0F0F000EEEE
      EE00EDEDED00EBEBEB00E9E9E900E7E7E700E7E7E700E6E6E600D7D7D700D8D8
      D800CBCBCB00F8F8F80000000000000000000000000000000000000000000000
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
      0000000000000000000000000000D5D5D500D3D4D400EBE7E300FFF7ED00FDF5
      EA00FCF3E700FCF1E400FBF0E100FBEEDE00FBEDDB00FAEBD800FAE9D500FAE8
      D200F9E6CE00F9E5CA00FAE3C500E9DAC600D3D4D500D3D3D300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D5D5
      D500D3D3D300E7E7E700F6F6F600F4F4F400F2F2F200F0F0F000EEEEEE00EDED
      ED00EBEBEB00E9E9E900E8E8E800E6E6E600E4E4E400E2E2E200E0E0E000D8D8
      D800D4D4D400D3D3D30000000000000000000000000000000000000000000000
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
      00000000000000000000F5F5F500C4C4C500E8E6E400FAF2E900FDF5EB00FCF3
      E700FCF1E400FBF0E100FBEEDE00FBEDDB00FAEBD700FAEAD500FAE9D400FAE9
      D300F9E9D300F9E7D000F9E3C700F5DCBB00E7DFD500C5C6C800F2F2F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F5F5F500C4C4
      C400E6E6E600F1F1F100F4F4F400F2F2F200F0F0F000EEEEEE00EDEDED00EBEB
      EB00E9E9E900E8E8E800E7E7E700E7E7E700E7E7E700E5E5E500E1E1E100D9D9
      D900DEDEDE00C6C6C600F2F2F200000000000000000000000000000000000000
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
      00000000000000000000DEDEDE00CECFCF00F2EDE700FEF6EA00FCF2E700FCF1
      E400FBF0E100FBEEDE00FBEDDB00FAEBD800FAEAD500FAE9D400FAE9D300FAEA
      D400FAEAD500FAEBD800FAECD900F9E2C300EFDABF00D3D4D500D7D7D7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE00CECE
      CE00ECECEC00F4F4F400F1F1F100F0F0F000EEEEEE00EDEDED00EBEBEB00E9E9
      E900E8E8E800E7E7E700E7E7E700E8E8E800E8E8E800E9E9E900EAEAEA00DFDF
      DF00D8D8D800D4D4D400D7D7D700000000000000000000000000000000000000
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
      00000000000000000000CECECE00DDDCDC00F8F0E700FDF4E800FCF1E400FBF0
      E100FBEEDE00FBEDDB00FAEBD800FAEAD500FAE9D400FAE9D300FAE9D400FAEA
      D500FAEBD700FAECD900FBEFDE00FCEFDE00F3D9B800E0DCD700C8C8C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE00DCDC
      DC00EFEFEF00F3F3F300F0F0F000EEEEEE00EDEDED00EBEBEB00E9E9E900E8E8
      E800E7E7E700E7E7E700E7E7E700E8E8E800E9E9E900EAEAEA00EDEDED00EDED
      ED00D6D6D600DBDBDB00C8C8C800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A9EE
      FF0043D6FF0032CFFF002FBAF8002EB4F6002BA3EE001576CE00006DBA00458A
      C000E7EEF6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DCDCDC00B2B2B200AAAAAA00A0A0A0009D9D
      9D0094949400737373006262620085858500EEEEEE0000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8F1FF0049D8FF0033D1FF0031BFF90030B6F6002FACF300157BD5000170
      C00048739600E0DEDB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2E2E200B5B5B500ABABAB00A3A3
      A3009E9E9E009A9A9A00777777006565650070707000DDDDDD00000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6F5FF0052DAFF0031D1FF0033C3FA002AB7F80037AFEF0098AB
      BE00B3AEA2006A6A73009D9DB000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E8E800B9B9B900ABAB
      AB00A5A5A5009D9D9D009C9C9C00ABABAB00ABABAB006D6D6D00A3A3A3000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D3F7FF005DDCFF002FD1FF003AC8FC00A8BCC400CBC3
      B700656598001616580039394E00A3A3A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EDEDED00BDBD
      BD00AAAAAA00AAAAAA00B8B8B800C1C1C100767676002C2C2C0040404000A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D0D0D100DAD8D700F8ECDC00FCEEDC00FAEBD800FAEA
      D500FAE9D400FAE9D300FAE9D400FAEAD500FAEBD700FAECD900FBEEDC00FBEF
      E000FCF2E500FCF4E900FDF6EE00FFFBF700F8EFE200E3DDD500C5C6C8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0D0D000D8D8
      D800EAEAEA00ECECEC00E9E9E900E8E8E800E7E7E700E7E7E700E7E7E700E8E8
      E800E9E9E900EAEAEA00ECECEC00EEEEEE00F1F1F100F3F3F300F5F5F500FBFB
      FB00EDEDED00DCDCDC00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DEF9FF0061DFFF0093D3E500DCD1C300736B
      B8002A238600B2B3B2008887C2004040BA009898E000FDFDFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F2F2
      F200BFBFBF00C3C3C300D0D0D0008787870046464600B2B2B2009B9B9B006868
      6800B0B0B000FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E3E3E300CACBCC00F2E7D900FCECD800FAE9D500FAE8
      D200FAE9D300FAE9D400FAEAD500FAEBD700FAECD900FBEEDD00FBF0E000FCF2
      E500FCF4EA00FDF6EE00FEF9F300FFFEFC00F3E8DA00D8D6D400D0D0D1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3E3E300CBCB
      CB00E6E6E600EAEAEA00E8E8E800E6E6E600E7E7E700E7E7E700E8E8E800E9E9
      E900EAEAEA00ECECEC00EEEEEE00F1F1F100F3F3F300F5F5F500F8F8F800FDFD
      FD00E7E7E700D6D6D600D0D0D000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7FDFF00D4DCD800BCB7D0004F3D
      C900C6C5C3008484CE004F4ED9005B5ADA005555D400908FE200F9F9FD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F6F600D8D8D800C1C1C10071717100C4C4C4009C9C9C007C7C7C008585
      85007F7F7F00ABABAB00FAFAFA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9F9F900C4C5C600E5E0D800F9E8D100FBE8D200F9E7
      CE00FAE9D300FAEAD500FAEBD700FAECD900FBEEDD00FBF0E000FCF2E500FCF4
      E900FDF6EE00FEF9F300FFFCF900FDFAF600EBE1D400C7C8C900EAEAEA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F9F900C5C5
      C500DFDFDF00E6E6E600E7E7E700E4E4E400E7E7E700E8E8E800E9E9E900EAEA
      EA00ECECEC00EEEEEE00F1F1F100F3F3F300F5F5F500F8F8F800FCFCFC00F9F9
      F900E0E0E000C8C8C800EAEAEA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9EF009D98E500A49F
      D400BDBDDD006666E0007272DD007575DE006F6FDD006161D900A2A1E8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F5F5F500B3B3B300B2B2B200C7C7C7008E8E8E00959595009898
      98009393930089898900B9B9B900000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4D4F500DADA
      E6009C9AEA008180E3008B8BE5008A8AE5008B8BE5008282E3008383E200F7F7
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DFDFDF00DEDEDE00B5B5B500A1A1A100A9A9A900A8A8
      A800A9A9A900A2A2A200A2A2A200F9F9F9000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FD00AEAEF200A1A0ED00A7A6EE00A6A6EE00A8A7EE009E9EEC00A09FEA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFB00C4C4C400BABABA00BEBEBE00BEBE
      BE00BFBFBF00B8B8B800B8B8B800000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7FE00CBCBF800C5C3F900C7C6F900C6C5F900B3B2F300DFDEF8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900DADADA00D5D5D500D7D7
      D700D6D6D600C8C8C800E7E7E700000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFCFF00E6E5FE00DCDCFE00D9D9FC00ECEBFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00EDEDED00E7E7
      E700E4E4E400F1F1F10000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      E200FBFBFB00FCFCFC00FCFCF800FAF8F200F4F2EB00EDECE400E7E6DE00E1E0
      D800DCDAD300D5D4CF00D0D0CE00D0D0D000CFCFCF00BABABA00A2A2A200B5B5
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
      0000FFFFFB00F4F3EE00CCCDD8009EA4C3007B85B5006975AF006672AD006C77
      AB007F87AD009BA0B200B9B9B900C9C7BE00C1C0BA00B8B8B700C4C4C400BDBD
      BD00B7B7B700D0D0D000BFBFBF00F1F1F1000000000000000000000000000000
      00000000000000000000000000000000000000000000CFCFCF00858585006868
      680081818100E2E2E2000000000000000000FDFDFD00F1F1F100D0D0D000ACAC
      AC009191910084848400818181008484840091919100A4A4A400B9B9B900C4C4
      C400BEBEBE00B7B7B700C4C4C400BDBDBD00B7B7B700D0D0D000BFBFBF00F1F1
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
      0000DCDCDC008181810078787800B8B8B800FDFDFD0000000000FFFFFD00E5E5
      E900878EBD003242A1000B24A100011EAB000222B5000325BC000427BE000428
      BE000527B9000929B0001A35A40047589C008B8FA100B5B3AC00B4B3AF00BEBE
      BE00CFCFCF00BFBFBF00CCCCCC00C2C2C200F9F9F90000000000000000000000
      000000000000000000000000000000000000DCDCDC008181810078787800B8B8
      B800FDFDFD0000000000FEFEFE00E6E6E6009B9B9B005C5C5C00454545004343
      4300484848004C4C4C004D4D4D004E4E4E004C4C4C004B4B4B00515151006969
      690093939300B1B1B100B2B2B200BEBEBE00CFCFCF00BFBFBF00CCCCCC00C2C2
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
      F5008A8A8A0072727200CECECE0000000000FFFFFE00FBFAF7008B92C0001528
      9A000016A6000423BA000E2FC7001235CD001337D1001339D400143BD600143C
      D800143DD900143DDA000F38D700072FCC00082AB200364A98009C9EA800CBCA
      C200CCCCCC00DADADA00C3C3C300C3C3C300CECECE0000000000000000000000
      0000000000000000000000000000F5F5F5008A8A8A0072727200CECECE000000
      0000FEFEFE00F9F9F9009F9F9F00474747003E3E3E004B4B4B00565656005C5C
      5C005E5E5E0060606000616161006262620063636300636363005F5F5F005656
      56004C4C4C005D5D5D00A0A0A000C7C7C700CCCCCC00DADADA00C3C3C300C3C3
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
      B40065656500C9C9C90000000000FFFFFE00E2E2EA003E4BA300000E9F000724
      BA000F2FC5001033CB001137D200133BD800143EDC001440DF001541E1001542
      E3001542E3001542E3001542E3001542E3001440E4000833D6000C2CAB007C85
      AA00DEDCD300DBDBDB00E3E3E300C2C2C200BBBBBB00EAEAEA00000000000000
      0000000000000000000000000000B4B4B40065656500C9C9C90000000000FEFE
      FE00E4E4E40064646400393939004C4C4C00565656005A5A5A005E5E5E006262
      6200646464006666660067676700686868006868680068686800686868006868
      6800686868005B5B5B004B4B4B008E8E8E00D9D9D900DBDBDB00E3E3E300C2C2
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
      6E00ABABAB0000000000FFFFFE00D9DAE6001F2E9B000015AA000D2ABF000E2E
      C5001033CE001138D600133DDE001441E5001544EA001545EC001546EE001647
      EF001647EF001647EF001647EF001647EE001546ED001645EC001140E8000129
      BD006C78AC00EEECE200ECECEC00E7E7E800B9B9B900C7C7C700000000000000
      00000000000000000000F0F0F0006E6E6E00ABABAB0000000000FEFEFE00DDDD
      DD004D4D4D003F3F3F0052525200555555005B5B5B005F5F5F00646464006868
      68006B6B6B006C6C6C006D6D6D006E6E6E006E6E6E006E6E6E006E6E6E006E6E
      6E006D6D6D006D6D6D00686868004D4D4D0085858500E9E9E900ECECEC00E7E7
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
      7800FAFAFA0000000000E6E7ED00222F9B000016AD000C29BE000D2DC5000E32
      CE001038D800113DE2001342EA001446F1001448F5001549F700154AF800154A
      F900154BFA00154BFA00154BF900154AF900154AF7001549F6001447F3001243
      EF000026C000858FBB00FFFCF400FAFAFA00DCDCDC00ACACAC00F2F2F2000000
      00000000000000000000B7B7B70078787800FAFAFA0000000000E8E8E8004E4E
      4E004141410051515100555555005A5A5A0060606000656565006A6A6A006E6E
      6E00707070007171710072727200727272007373730073737300737373007272
      720072727200717171006F6F6F006C6C6C004C4C4C009A9A9A00FAFAFA00FAFA
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
      C80000000000FFFEF9004C55A900000EA5000B26BA000B29C1000D2FCA000E34
      D500103ADF00113FE9001244F1001348F800144AFC00154AFD00144BFE00144B
      FE00144BFE00144BFE00144BFE00144BFE00144BFE00144AFC001348F9001345
      F4000E3EEE000529B500BEC2D600FFFFFE00FBFBFB00B3B3B300D9D9D9000000
      0000000000000000000083838300C8C8C80000000000FCFCFC006E6E6E003B3B
      3B004E4E4E0051515100575757005D5D5D0063636300686868006D6D6D007171
      7100737373007474740074747400747474007474740074747400747474007474
      74007474740073737300717171006E6E6E00686868004B4B4B00C7C7C700FEFE
      FE00FBFBFB00B3B3B300D9D9D90000000000000000009B9FA200422A1E00E9C5
      8700E4D59300E4D39900E4D49D00E4D4A100E6D7A900ECE1BE00EBD396007B5E
      2D0017161B0053545400CACACA00CACACA00E5E5E500F3F3F300F6F6F6000000
      0000D5D5D500191918001F1F1E002E2E2D003F3F3E00515151005F5F5F006565
      65005B5B5B0040403F00202020002C2C2B00A8A8A800939393007B7B7B000000
      0000000000009E9E9E002E2E2E00BCBCBC00C4C4C400C5C5C500C7C7C700C8C8
      C800CCCCCC00D9D9D900C6C6C600575757001818180053535300CACACA00CACA
      CA00E5E5E500F3F3F300F6F6F60000000000D5D5D500181818001E1E1E002D2D
      2D003E3E3E00515151005F5F5F00656565005B5B5B003F3F3F00202020002B2B
      2B00A8A8A800939393007B7B7B000000000000000000E8E8E80089898900FBFB
      FB0000000000A5A8CC00000A99000821B5000A25BA000B2AC3000C2FCD000E35
      D7000F3AE2001040EC001145F4001248FA00134AFD00134AFF00134BFF00134B
      FF00134BFF00134BFF00134BFF00134BFF00134BFF00134AFE001248FB001246
      F5001142F0000330DD00344AAE00FCFBF60000000000D6D6D600C4C4C4000000
      000000000000E8E8E80089898900FBFBFB0000000000B3B3B300363636004A4A
      4A004D4D4D0052525200585858005E5E5E0063636300696969006E6E6E007171
      7100737373007474740074747400747474007474740074747400747474007474
      74007474740073737300717171006F6F6F006B6B6B005A5A5A0064646400F9F9
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
      0000F9F8F4002E389E000014A8000821B3000924BA000A29C3000C2ECD000D34
      D7000E3AE200103FEC001143F3001146F9001248FD001249FE001249FE001249
      FE001249FE001249FE001249FE001249FE001249FE001248FD001247FA001144
      F5001040ED000F3CE7000020BB00A6ACCC0000000000EFEFEF00C3C3C3000000
      000000000000D2D2D200B6B6B60000000000F7F7F700565656003E3E3E004949
      49004D4D4D0052525200575757005D5D5D0063636300696969006D6D6D007070
      7000727272007373730073737300737373007373730073737300737373007373
      73007373730072727200717171006E6E6E00696969006666660049494900B4B4
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
      0000BABBD400000C9500071DAD00061EB300021DB9000422C2000528CC00062D
      D6000733E1000938EB000A3DF4000B40FA000B42FD000B43FF000B43FF000B43
      FF000B43FF000B43FF000B43FF000B43FF000B43FF000B42FE000A41FB000B3F
      F5000F3EEB000E39E2000026CE004756AE00FFFFFA00F9F9F900CFCFCF00FBFB
      FB0000000000CDCDCD00DCDCDC0000000000C3C3C30035353500454545004747
      4700484848004D4D4D0053535300585858005E5E5E0064646400696969006C6C
      6C006E6E6E006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F6F006F6F
      6F006F6F6F006E6E6E006C6C6C006A6A6A006868680063636300515151006E6E
      6E00FDFDFD00F9F9F900CFCFCF00FBFBFB000000000000000000E9E9E9002024
      26003825180077512D00896234007A562A0055412A004D4D4F00606164005051
      51003A3A3A001C1C1C003D3D3D00D5D5D500818181004A4A4A00A1A1A100BBBB
      BB00C5C5C500B8B8B800272727001C1C1B002E2E2E0040404000535353006161
      600064646400555554003636350022222100A1A1A100FDFDFD00000000000000
      00000000000000000000E9E9E9002323230027272700515151005F5F5F005353
      5300404040004D4D4D0061616100505050003A3A3A001C1C1C003D3D3D00D5D5
      D500818181004A4A4A00A1A1A100BBBBBB00C5C5C500B8B8B800272727001B1B
      1B002E2E2E004040400053535300606060006464640054545400353535002121
      2100A1A1A100FDFDFD00000000000000000000000000D7D7D700ECECEC00FFFF
      FE00797FB90000099C00061BAD000C209E001C2B83001C2C86001B2E8D001C32
      95001D369C001E39A1001C39A4001C3AA7001E3DAB002040AE002040AE001F3F
      B0001D3EB1001D3EB1001D3EB1001D3EB1001D3EB0001D3EAF001E3DAC00183A
      B6000D38DF000D36DE00062DD300142BA800E5E5E900FFFFFD00E0E0E000F8F8
      F80000000000D7D7D700ECECEC00FEFEFE009090900037373700444444004343
      43004343430044444400474747004B4B4B004F4F4F0052525200535353005454
      5400575757005A5A5A005A5A5A005A5A5A005959590059595900595959005959
      5900595959005858580057575700585858006161610060606000575757004D4D
      4D00E6E6E600FEFEFE00E0E0E000F8F8F800000000000000000000000000ABAB
      AB00010406001A1E22002B2E32003C3F440054575A0068686900646464005656
      5600414141002929290017171700AEAEAE005F5F5F00B3B3B300D8D8D8007A7A
      7A004F4F4F005E5E5E003A3A3A0019191800292929003B3B3A004E4E4D005E5E
      5D00646464005A5A5A003D3D3D0021212100C2C2C10000000000000000000000
      0000000000000000000000000000ABABAB00030303001E1E1E002E2E2E003F3F
      3F0057575700686868006464640056565600414141002929290017171700AEAE
      AE005F5F5F00B3B3B300D8D8D8007A7A7A004F4F4F005E5E5E003A3A3A001818
      1800292929003A3A3A004D4D4D005D5D5D00646464005A5A5A003D3D3D002121
      2100C1C1C10000000000000000000000000000000000E0E0E000F1F1F100FCFB
      F6006A71B6000D1FA700000DA70047529B00D4D1C200D1CFC800C3C2BB00BBBA
      B300BAB8B100BCBAB300BCBAB200B7B5AE00B2B0A800B3B1A900B9B7AF00BDBA
      B300BBB9B200BAB8B200BAB8B100BAB8B100BAB8B100BAB8B100C0BDB200A3A5
      AB000E34C9000930D900092DD000001AA800C1C3D80000000000E7E7E700F6F6
      F60000000000E0E0E000F1F1F100F9F9F90085858500464646003C3C3C006666
      6600CDCDCD00CDCDCD00C0C0C000B8B8B800B6B6B600B8B8B800B8B8B800B3B3
      B300AEAEAE00AFAFAF00B5B5B500B8B8B800B7B7B700B6B6B600B6B6B600B6B6
      B600B6B6B600B6B6B600BABABA00A6A6A600595959005B5B5B00575757004040
      4000C9C9C90000000000E7E7E700F6F6F6000000000000000000000000000000
      00005D5D5D000B0B0B002E2E2E00414141005151510063636300656565005B5B
      5B004747470031313100101011006F6F6F009191910075757500767676004B4B
      4B00B5B5B500A0A0A00049494800141414002525240035353400484848005A5A
      5900636363005D5D5D00484847001C1C1B005858580000000000000000000000
      0000000000000000000000000000000000005D5D5D000B0B0B002E2E2E004141
      41005151510063636300656565005B5B5B004747470031313100101010006F6F
      6F009191910075757500767676004B4B4B00B5B5B500A0A0A000484848001414
      140024242400343434004848480059595900636363005D5D5D00474747001B1B
      1B005858580000000000000000000000000000000000E2E2E200F2F2F200F2F2
      F000646CB5003F4DB9000518A800424EA200FEFDF4000000000000000000FEFE
      FE00F7F7F600EFEFEE00ECECEC00EDEDED00EDEDED00E9E9E800E3E3E200E2E2
      E100E7E7E700EDEDED00F1F1F100F1F1F100F1F1F100F1F1F000FAF9F300D3D6
      E2000C2EC500072BD0000929C8000014A800A8ACCD0000000000EAEAEA00F6F6
      F60000000000E2E2E200F2F2F200F1F1F100818181006C6C6C00414141006666
      6600FAFAFA000000000000000000FEFEFE00F6F6F600EEEEEE00ECECEC00EDED
      ED00EDEDED00E8E8E800E2E2E200E1E1E100E7E7E700EDEDED00F1F1F100F1F1
      F100F1F1F100F0F0F000F7F7F700D9D9D9005555550056565600535353003E3E
      3E00B5B5B50000000000EAEAEA00F6F6F6000000000000000000000000000000
      0000E7E7E700232323001F1E1E00393939004A4A4A005E5E5E00656565005F5F
      5F004E4E4E00383838001D1D1D002D2D2D00A7A7A7002F2F2F0047474700F8F8
      F800929292000C0C0C000A0A0A001717170020201F002F2F2E00424242005555
      54006262620062626200464646002121210029292900ECECEC00000000000000
      000000000000000000000000000000000000E7E7E700232323001E1E1E003939
      39004A4A4A005E5E5E00656565005F5F5F004E4E4E00383838001D1D1D002D2D
      2D00A7A7A7002F2F2F0047474700F8F8F800929292000C0C0C000A0A0A001717
      17001F1F1F002E2E2E0042424200545454006262620062626200464646002121
      210029292900ECECEC00000000000000000000000000E6E6E600F0F0EF00EEEE
      ED006970B800525EBF00404EBD00404BA100F3F3EC0000000000000000000000
      000000000000FCFCFC00F5F5F500ECECEC00E6E6E600E6E6E600E7E7E700E5E5
      E500DFDFDF00DBDBDB00DDDDDD00E4E4E400E9E9E900EBEBEB00F5F3EE00C3C7
      DA000525BE000727C7000724BF000010A3009FA4C90000000000E7E7E700F6F6
      F60000000000E6E6E600EFEFEF00EDEDED00858585007A7A7A006E6E6E006464
      6400F0F0F00000000000000000000000000000000000FCFCFC00F5F5F500ECEC
      EC00E6E6E600E6E6E600E7E7E700E5E5E500DFDFDF00DBDBDB00DDDDDD00E4E4
      E400E9E9E900EBEBEB00F2F2F200CCCCCC004D4D4D00515151004E4E4E003B3B
      3B00AEAEAE0000000000E7E7E700F6F6F6000000000000000000000000000000
      000000000000A7A7A7000E0E0E002F2F2F004343430056565600646464006262
      6200535353003E3E3E002929290016161600131313000F0F0F002F2F2F00ACAC
      AC0037373700151515001E1E1E002020200021212100292928003A3A39004D4D
      4D005757570049494900303030002E2E2E0037373700E3E3E300000000000000
      00000000000000000000000000000000000000000000A7A7A7000E0E0E002F2F
      2F0043434300565656006464640062626200535353003E3E3E00292929001616
      1600131313000F0F0F002F2F2F00ACACAC0037373700151515001E1E1E002020
      20002121210028282800393939004D4D4D005757570049494900303030002E2E
      2E0037373700E3E3E300000000000000000000000000ECECEC00EBEBEA00F0F0
      EE00797FBD005B66C0005A66C4006F78B900F1F0ED0000000000000000000000
      000000000000000000000000000000000000FAFAFA00F1F1F100E9E9E900E6E6
      E600E7E7E700E7E7E700E3E3E300DCDCDC00DBDBDB00E0E0E000F2F1EB00B7BC
      D500001CB5000622BE000620B800000D9C00ACAECE00FFFFFA00E1E1E100F9F9
      F90000000000ECECEC00EAEAEA00EFEFEF009191910080808000818181008A8A
      8A00EFEFEF000000000000000000000000000000000000000000000000000000
      0000FAFAFA00F1F1F100E9E9E900E6E6E600E7E7E700E7E7E700E3E3E300DCDC
      DC00DBDBDB00E0E0E000EFEFEF00C2C2C200454545004C4C4C004A4A4A003838
      3800B8B8B800FDFDFD00E1E1E100F9F9F9000000000000000000000000000000
      000000000000000000005D5D5D00181818003B3B3B004E4E4E00606060006363
      630059595900454545002F2F2F001E1E1E001D1D1D001F1F1F00363636003131
      3100303030002F2F2F002A2A2A002B2B2B002D2D2D002F2F2F00333333003737
      370037373700353535003D3D3D004A4A4A001B1B1B00D0D0D000000000000000
      00000000000000000000000000000000000000000000000000005D5D5D001818
      18003B3B3B004E4E4E00606060006363630059595900454545002F2F2F001E1E
      1E001D1D1D001F1F1F003636360031313100303030002F2F2F002A2A2A002B2B
      2B002D2D2D002F2F2F00333333003737370037373700353535003D3D3D004A4A
      4A001B1B1B00D0D0D000000000000000000000000000F0F0F000E4E4E400F4F3
      F0009194C4006770C300666FC600787FC000F1F1ED0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FA00FBFAF100F5F3EB00F4F2EA00F5F3EB00F2F0E900ECEAE200F4F1E200ACB0
      C9000014AD00051DB500041AB100000F9400C4C5D700F4F4EF00E1E1E1000000
      000000000000F0F0F000E4E4E400F2F2F200A3A3A30088888800898989009292
      9200EFEFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFD00F7F7F700F1F1F100F0F0F000F1F1
      F100EEEEEE00E8E8E800EDEDED00B7B7B7004040400047474700454545003636
      3600CACACA00F2F2F200E1E1E100000000000000000000000000000000000000
      00000000000000000000E0E0E0002D2D2D002D2D2D00454545005A5A5A006262
      62005C5C5C004C4C4C0033333300282828002B2B2B002C2C2C003A3A3A003C3C
      3C003B3B3B003535350037373700464646004A4A4A0047474700464646004A4A
      4A005151510057575700545454002525250000000000C5C5C500000000000000
      0000000000000000000000000000000000000000000000000000E0E0E0002D2D
      2D002D2D2D00454545005A5A5A00626262005C5C5C004C4C4C00333333002828
      28002B2B2B002C2C2C003A3A3A003C3C3C003B3B3B0035353500373737004646
      46004A4A4A0047474700464646004A4A4A005151510057575700545454002525
      250000000000C5C5C500000000000000000000000000F6F6F600DBDBDB00F4F4
      F000B3B5D100737AC500767ECA00757DC600BBBFDE00CFD2EC00CCCFEB00BCC0
      E500A4AADD00A6ADDF00ABB2E200ABB3E400ABB3E400ACB5E600B2BAE900B3BB
      E900B2BAE800ACB5E300A5ADDC00A2AAD700A6AED700A8AFD800B0B6D900626E
      BF000011AC000419AC000011A70019239200E2E2E400E3E3E100E6E6E6000000
      000000000000F6F6F600DBDBDB00F2F2F200BDBDBD0090909000949494009292
      9200C8C8C800D9D9D900D7D7D700CBCBCB00B9B9B900BBBBBB00BFBFBF00C0C0
      C000C0C0C000C2C2C200C7C7C700C7C7C700C6C6C600C1C1C100BABABA00B6B6
      B600B9B9B900BABABA00BFBFBF00858585003F3F3F00434343003D3D3D004444
      4400E2E2E200E2E2E200E6E6E600000000000000000000000000000000000000
      00000000000000000000000000006F6F6F001C1C1C003B3B3B00525252006161
      61005E5E5E00474747003434340036363600373737003D3D3D003D3D3D004242
      42004B4B4B005151510050505000464646005151510060606000626262005555
      5500444444002F2F2F000F0F0F000000000000000000D1D1D100000000000000
      0000000000000000000000000000000000000000000000000000000000006F6F
      6F001C1C1C003B3B3B0052525200616161005E5E5E0047474700343434003636
      3600373737003D3D3D003D3D3D00424242004B4B4B0051515100505050004646
      460051515100606060006262620055555500444444002F2F2F000F0F0F000000
      000000000000D1D1D10000000000000000000000000000000000D5D5D500EBEB
      E900D8D8E0008489C600838ACE008087CD00747CC9006F77C7006C75C700656F
      C6003F4DBA000B1DAB000005A4000003A6000009AB00000DAF00000EB100000F
      B3000010B4000010B4000011B4000010B3000010B100000FAE00000DAB00010F
      AB000317A9000316A6000005990052569F00F1F1EA00D5D5D500F2F2F2000000
      00000000000000000000D5D5D500EAEAEA00DADADA009B9B9B009E9E9E009C9C
      9C00939393008F8F8F008D8D8D00888888006C6C6C0046464600383838003838
      38003C3C3C003E3E3E003F3F3F00404040004141410041414100414141004141
      4100404040003F3F3F003D3D3D003E3E3E00414141003F3F3F00343434006D6D
      6D00EEEEEE00D5D5D500F2F2F200000000000000000000000000000000000000
      00000000000000000000000000007D7D7D002323230036363600424242004949
      4900434343003E3E3E0041414100454545005252520051515100575757005D5D
      5D003E3E3E003636360025252500292929003E3E3E00434343004A4A4A003737
      370023232300161616000C0C0C00000000004747470000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007D7D
      7D0023232300363636004242420049494900434343003E3E3E00414141004545
      45005252520051515100575757005D5D5D003E3E3E0036363600252525002929
      29003E3E3E00434343004A4A4A003737370023232300161616000C0C0C000000
      0000474747000000000000000000000000000000000000000000E1E1E100D6D6
      D600F0EFED00A5A8CD008B91D0008C92D100898FCF00858CCF008289CE008087
      CE008188CF007C84CE005E6AC500303FB7000B1EAC000010A900000FAA000012
      AC000016AD000217AE000318AE000317AD000317AB000316AA000315A7000314
      A5000313A2000112A20000048800AFAFC400E3E3DE00D3D3D300FEFEFE000000
      00000000000000000000E1E1E100D6D6D600EEEEEE00B3B3B300A4A4A400A5A5
      A500A2A2A200A0A0A0009D9D9D009C9C9C009D9D9D009A9A9A00848484006262
      6200474747003D3D3D003D3D3D003F3F3F004141410042424200434343004242
      420041414100414141003F3F3F003E3E3E003D3D3D003C3C3C002E2E2E00B6B6
      B600E1E1E100D3D3D300FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000F0F0F0005C5C5C00474747004C4C4C004C4C
      4C0050505000575757005E5E5E006767670057575700262626001E1E1E003B3B
      3B0042424200313131001E1E1E0017171700595959008D8D8D007D7D7D005D5D
      5D002D2D2D00232323001D1D1D00101010004545450000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0F0
      F0005C5C5C00474747004C4C4C004C4C4C0050505000575757005E5E5E006767
      670057575700262626001E1E1E003B3B3B0042424200313131001E1E1E001717
      1700595959008D8D8D007D7D7D005D5D5D002D2D2D00232323001D1D1D001010
      1000454545000000000000000000000000000000000000000000F8F8F800C3C3
      C400ECECEA00D6D7E000989CCE00979CD500959AD4009297D3008E94D2008B91
      D100888ED000858CD000868DD100848CD100767FCD005965C4003644B8001A2B
      AE000A1BA9000112A600000FA400000DA200000DA100000DA000000C9E00000B
      9D00000B9C000000900045489500EAEAE200CDCDCD00E7E7E700000000000000
      00000000000000000000F8F8F800C3C3C300EBEBEB00D9D9D900ABABAB00ADAD
      AD00ABABAB00A9A9A900A6A6A600A4A4A400A2A2A200A0A0A000A1A1A100A0A0
      A00096969600808080006666660051515100444444003D3D3D003B3B3B003A3A
      3A003A3A3A00393939003838380038383800373737003030300060606000E7E7
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
      DA00CACACA00F2F2EF00BFC0D7009EA2D400A0A4D8009DA2D7009A9FD600979C
      D5009499D4009196D3008E93D2008A91D100898FD1008990D200878ED1008087
      CF00727BCA00626BC400525DBE00434EB7003743B300323DB000303BAE00313C
      AE00323CAE00444BA200D2D2D900E3E3DF00D1D1D100FEFEFE00000000000000
      0000000000000000000000000000DADADA00CACACA00F1F1F100C7C7C700B1B1
      B100B4B4B400B2B2B200AFAFAF00ADADAD00ABABAB00A8A8A800A6A6A600A4A4
      A400A3A3A300A3A3A300A2A2A2009C9C9C009292920085858500797979006D6D
      6D00646464005F5F5F005D5D5D005E5E5E005E5E5E0065656500D4D4D400E1E1
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
      0000BDBDBD00D8D8D700ECECEB00B8BAD500A6AAD900A8ABDB00A5A9D900A2A6
      D8009FA3D7009CA1D600999ED500969BD4009399D4009096D3008C92D1008A90
      D100888ED000878DCF00858CCF008389CD007F86CC007C82CA00787FC9007178
      C6006A70B600C9CAD700F0F0EB00CBCBCB00F2F2F20000000000000000000000
      000000000000000000000000000000000000BDBDBD00D7D7D700EBEBEB00C2C2
      C200B8B8B800BABABA00B7B7B700B5B5B500B3B3B300B1B1B100AEAEAE00ACAC
      AC00AAAAAA00A8A8A800A5A5A500A3A3A300A2A2A200A1A1A100A0A0A0009D9D
      9D009B9B9B0098989800959595008F8F8F0085858500CECECE00EEEEEE00CBCB
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
      0000F3F3F300ACACAC00DDDDDC00ECECEC00BFC0DA00ACB0DA00AEB2DE00ABB0
      DC00A9ADDB00A6ABDA00A3A8D900A1A6D8009DA3D7009BA0D600989DD500959A
      D4009197D3008E94D1008B91D000878ECF00848BCD008188CC00797FC800797E
      BC00C5C6D700F2F2ED00CECECE00E5E5E5000000000000000000000000000000
      000000000000000000000000000000000000F3F3F300ACACAC00DCDCDC00ECEC
      EC00C8C8C800BCBCBC00BFBFBF00BDBDBD00BBBBBB00B9B9B900B6B6B600B5B5
      B500B2B2B200B0B0B000AEAEAE00ABABAB00A9A9A900A6A6A600A4A4A400A1A1
      A1009E9E9E009C9C9C009595950091919100CBCBCB00F0F0F000CECECE00E5E5
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
      000000000000E9E9E900ABABAB00E2E2E100F4F4F300CFD0E100B4B7DB00B2B6
      DE00B2B6E000B0B4DE00AEB2DD00ABAFDC00A8ACDB00A6AADA00A3A8D900A0A5
      D8009DA2D7009A9FD600979CD4009499D4008F95D100868BC900969AC700DADA
      E300F5F5F100CFCFCF00E0E0E000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E9E9E900ABABAB00E1E1
      E100F3F3F300D5D5D500C2C2C200C2C2C200C2C2C200C0C0C000BFBFBF00BCBC
      BC00BABABA00B8B8B800B6B6B600B4B4B400B2B2B200AFAFAF00ADADAD00ABAB
      AB00A7A7A7009E9E9E00A7A7A700DDDDDD00F3F3F300CFCFCF00E0E0E0000000
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
      00000000000000000000EEEEEE00B6B6B600DEDEDD00FDFDFB00E8E8EE00C7C9
      E000B8BBDD00B5B9DF00B5B9E000B4B8E000B2B6E000AFB3DE00ADB1DD00AAAF
      DC00A7ACDB00A4A9DA009FA4D7009A9ED100A0A3CE00C3C4DA00F5F4F400F0F0
      ED00CCCCCC00E3E3E30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEEEEE00B6B6
      B600DDDDDD00FCFCFC00EAEAEA00D0D0D000C5C5C500C4C4C400C4C4C400C4C4
      C400C2C2C200C0C0C000BEBEBE00BCBCBC00BABABA00B7B7B700B3B3B300ADAD
      AD00B0B0B000CBCBCB00F4F4F400EFEFEF00CCCCCC00E3E3E300000000000000
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
      0000000000000000000000000000F9F9F900C8C8C800D0D0D000F8F8F600FFFF
      FE00EDEEF300D5D6E700C4C6E000BBBEDD00B7BADD00B4B7DC00B2B5DB00AFB3
      DA00AEB2D800B1B4D800BDBFDB00D8D8E700F6F6F700FCFCF900DDDDDC00CCCC
      CC00EFEFEF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F900C8C8C800D0D0D000F7F7F700FEFEFE00EFEFEF00DBDBDB00CECECE00C7C7
      C700C4C4C400C2C2C200C0C0C000BEBEBE00BDBDBD00BFBFBF00C7C7C700DDDD
      DD00F6F6F600FBFBFB00DCDCDC00CCCCCC00EFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      E500FAFAF80000000000FEFEFE00F6F6F900EEEEF400E9E9F100E7E8F000E9EA
      F100F0F1F600FAFAFB00FFFFFE00F9F9F600E2E2E100CCCCCC00DDDDDD00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9E9E900D5D5D500E5E5E500F9F9F90000000000FEFEFE00F7F7
      F700F0F0F000EBEBEB00EAEAEA00ECECEC00F2F2F200FAFAFA00FEFEFE00F8F8
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
      F200E6E6E600E5E5E500ECECEC00F3F3F200F7F7F600FAF9F800FBFAF900F9F9
      F800F6F6F500EEEEEE00DCDCDC00D2D2D200E3E3E300FAFAFA00000000000000
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
      2800000090000000680100000100010000000000201C00000000000000000000
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
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFF7F
      FFFFFFF7FFFF0000F0000000FF0000000FFFFE0FFFFFFFE0FFFF0000E0000000
      7E00000007FFFC07FFFFFFC07FFF0000C00000003C00000003FFF803FFFFFF80
      3FFF0000C00000003C00000003FFE0007FFFFE0007FF0000C00000003C000000
      03FFC0001FFFFC0001FF0000C00000003C00000003FFC0000FFFFC0000FF0000
      C00000003C00000003FF00000FFFF00000FF0000800000001800000001FE0000
      0FFFE00000FF0000800000001800000001FE00000FFFE00000FF000080000000
      1800000001FE00000FFFE00000FF0000800000001800000001FE00000FFFE000
      00FF0000800000001800000001FE00000FFFE00000FF00008000000018000000
      01FE000001FFE000001F0000800000001800000001FE000000FFE000000F0000
      800000001800000001FE0000003FE00000030000C00000003C00000003F80000
      07FF8000007F0000C00000003C00000003F0000003FF0000003F0000C0000000
      3C00000003E0000001FE0000001F0000C00000003C00000003FE000000FFE000
      000F0000C00000003C00000003FC000001FFC000001F0000C00000003C000000
      03FC000001FFC000001F0000C00000003C00000003F8000007FF8000007F0000
      E00000007E00000007FE000007FFE000007F0000E00000005E00000005FE0000
      07FFE000007F0000A00000005A00000005FFC0003FFFFC0003FF0000E0000000
      7E00000007FFF0007FFFFF0007FF0000E00000007E00000007FFF0007FFFFF00
      07FF0000E00000007E00000007FFF0007FFFFF0007FF0000E00000007E000000
      07FFF0007FFFFF0007FF0000F0000000FF0000000FFFF0007FFFFF0007FF0000
      F0000000FF0000000FFFF0007FFFFF8007FF0000F0000000FF0000000FFFF000
      7FFFFF8007FF0000FFFFFFFFFFFFFFFFFFFFF0007FFFFF0007FF0000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000F00000007F00000007F00000007F000000070000E8000000BE800000
      0BE8000000BE8000000B0000E8000000BE8000000BE8000000BE8000000B0000
      E8000000FE8000000FE8000000FE8000000F0000E8BFFFE8FE8BFFFE8FE8BFFF
      E8FE8BFFFE8F0000E8BFFF08FE8BFFF08FE8BFFC08FE8BFFC08F0000E8BFFFE8
      FE8BFFFE8FE8BFFFE8FE8BFFFE8F0000E8BFFFE8FE8BFFFE8FE8BFFCE8FE8BFF
      CE8F0000E8BFC1E8FE8BFC1E8FE8B80068FE8B80068F0000E8A00018FE8A0001
      8FE8B00068FE8B00068F0000E8A00029FE8A00029FE8800069FE8800069F0000
      E8300061FE8300061FE8000061FE8000061F0000E82340617E82340617E82000
      417E820004170000E8A420117E8A420117E8B000217E8B0002170000E8C3C011
      7E8C3C0117E8A800217E8A8002170000E88000117E88000117E8A0A0217E8A0A
      02170000E88000217E88000217E8BC20317E8BC203170000E84000217E840002
      17E8A029717E8A0297170000E8A000517E8A000517E8A050B17E8A050B170000
      E81000717E81000717E82000717E820007170000E8280CB17E8280CB17E82000
      B17E82000B170000E833F4F17E833F4F17E81001717E810017170000E83C1FF1
      7E83C1FF17E83002F17E83002F170000E83FFDF17E83FFDF17E8290DF17E8290
      DF170000F83FFFD17F83FFFD17F83873D17F83873D170000F838FFD17F838FFD
      17F834FFD17F834FFD170000F83FFFD17F83FFFD17F83FFFD17F83FFFD170000
      F83FFF917F83FFF917F83FFF917F83FFF9170000F82000117F82000117F82000
      117F820001170000F82000517F82000517F82000517F820005170000F8000001
      7F80000017F80000017F800000170000F8000001FF8000001FF8000001FF8000
      001F0000FFE000FFFFFE000FFFFFE000FFFFFE000FFF0000FC080003FFC08000
      3FFC080003FFC080003F0000FFF801FFFFFF801FFFFFF801FFFFFF801FFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFF800FFFFFF800FFFFFE001
      FFFFFE001FFF0000FF80000FFFF80000FFFF00003FFFF00003FF0000FF000007
      FFF000007FFC00001FFFC00001FF0000FF000007FFF000007FFC00000FFFC000
      00FF0000FE000003FFE000003FF800000FFF800000FF0000FC000001FFC00000
      1FF800000FFF800000FF0000F8300000FF8300000FF800000FFF800000FF0000
      F04000007F04000007F800001FFF800001FF0000E18000007E18000007F80000
      7FFF800007FF0000E30000003E30000003F800007FFF800007FF0000C6000000
      3C60000003F800007FFF800007FF0000C40000001C40000001F800007FFF8000
      07FF0000C80000011C80000011F800007FFF800007FF00008800000098800000
      09F800007FFF800007FF0000900000009900000009F800007FFF800007FF0000
      900000000900000000F800007FFF800007FF0000800000000800000000F00000
      7FFF000007FF0000800000004800000004F000007FFF000007FF000080000000
      4800000004F000007FFF000007FF0000800000004800000004F000003FFF0000
      03FF0000804000000804000000F200003FFF200003FF0000807C00001807C000
      01F000003FFF000003FF0000800100001800100001F200013FFF200013FF0000
      C00180001C00180001F180013FFF180013FF0000C000F0001C000F0001F20000
      3FFF200003FF0000C000F0003C000F0003F000003FFF000003FF0000E000F800
      3E000F8003F000003FFF000003FF0000F000F0007F000F0007F000003FFF0000
      03FF0000F0000000FF0000000FF000003FFF000003FF0000F8000001FF800000
      1FF000003FFF000003FF0000FC000003FFC000003FF000003FFF000003FF0000
      FE000007FFE000007FF800007FFF800007FF0000FF84020FFFF84020FFFC0001
      FFFFC0001FFF0000FFC0003FFFFC0003FFFF8007FFFFF8007FFF0000FFF801FF
      FFFF801FFFFFFFFFFFFFFFFFFFFF0000FFFFE3FFFFFFFE3FFFFFFFFFFFFFFFFF
      FFFF0000FFFE01FFFFFFE01FFFFFF800FFFFFF800FFF0000FFF000FFFFFF000F
      FFFF80000FFFF80000FF0000FFC0007FFFFC0007FFFF000007FFF000007F0000
      FF80003FFFF80003FFFF000007FFF000007F0000FFC0001FFFFC0001FFFE0000
      03FFE000003F0000FFF0000FFFFF0000FFFC000001FFC000001F0000FFF80007
      FFFF80007FF8300000FF8300000F0000FFF00007FFFF00007FF04000007F0400
      00070000FFF0000FFFFF0000FFE18000007E180000070000FFF001FFFFFF001F
      FFE30000003E300000030000FFF001FFFFFF001FFFC60000003C600000030000
      FFF001FFFFFF001FFFC40000001C400000010000FFF001FFFFFF001FFFC80000
      011C800000110000FFF001FFFFFF001FFF8800000098800000090000FFF001FF
      FFFF001FFF9000000099000000090000FFF000FFFFFF000FFF90000000090000
      00000000FFF000FFFFFF000FFF8000000008000000000000FFF000FFFFFF000F
      FF8000000048000000040000FFF000FFFFFF000FFF8000000048000000040000
      FFF000FFFFFF000FFF8000000048000000040000FFF000FFFFFF000FFF800000
      0008000000000000FFF0007FFFFF0007FF8000000018000000010000FFC0007F
      FFFC0007FF8000000018000000010000FF00007FFFF00007FFC00000001C0000
      00010000FF00003FFFF00003FFC00000001C000000010000FF00003FFFF00003
      FFC00000003C000000030000FF00003FFFF00003FFE00000003E000000030000
      FF80001FFFF80001FFF00000007F000000070000FF80001FFFF80001FFF00000
      00FF0000000F0000FF80000FFFF80000FFF8000001FF8000001F0000FFC03C0F
      FFFC03C0FFFC000003FFC000003F0000FFC0000FFFFC0000FFFE000007FFE000
      007F0000FFE0000FFFFE0000FFFF84020FFFF84020FF0000FFE0001FFFFE0001
      FFFFC0003FFFFC0003FF0000FFF03FFFFFFF03FFFFFFF801FFFFFF801FFF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFF800FFFFFF800FFFFFFFFF
      FFFFFFFFFFFF0000FF80000FFFF80000FFE001FFFFFE001FFFFF0000FF000007
      FFF000007F80007FFFF80007FFFF0000FF000007FFF000007F80001FFFF80001
      FFFF0000FE000003FFE000003F00000FFFF00000FFFF0000FC000001FFC00000
      1F000007FFF000007FFF0000F8300000FF8300000F80000007F80000007F0000
      F04000007F040000078000000078000000070000E10000007E10000007800000
      0038000000030000E20000003E200000038000000038000000030000C4000000
      3C40000003C00000003C000000030000C40000001C40000001C00000003C0000
      00030000C80000001C80000001E00000003E0000000300008800000098800000
      09F00000003F000000030000900000009900000009F80000007F800000070000
      900000000900000000FE0000007FE00000070000800000000800000000FF0000
      00FFF000000F0000800000004800000004FF000001FFF000001F000080000000
      4800000004FF801003FFF801003F0000800000004800000004FF000007FFF000
      007F0000800000000800000000FE000003FFE000003F00008002000018002000
      01FE000001FFE000001F0000800740001800740001FE000001FFE000001F0000
      C00F90001C00F90001FE000001FFE000001F0000C03F08001C03F08001FE0000
      01FFE000001F0000C01E07803C01E07803FE000001FFE000001F0000E00C0300
      3E00C03003FE000001FFE000001F0000F00000007F00000007FE000001FFE000
      001F0000F0000000FF0000000FFF002003FFF002003F0000F8000001FF800000
      1FFFC0C003FFFC0C003F0000FC000003FFC000003FFFFFC007FFFFFC007F0000
      FE000007FFE000007FFFFFC00FFFFFFC00FF0000FF84000FFFF84000FFFFFFF0
      1FFFFFFF01FF0000FFC0003FFFFC0003FFFFFFFFFFFFFFFFFFFF0000FFF801FF
      FFFF801FFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFC0000FFFFC000
      0FFF0000FFFFFFFFFFFFFFFFFFF0000003FF0000003F0000FFFFFFFFFFFFFFFF
      FFE100000FFE100000FF0000FFFFFFFFFFFFFFFFFFC0FFFFFFFC0FFFFFFF0000
      800003FFF800003FFF807FFFFFF807FFFFFF0000C0000001FC0000001F803FFF
      FFF803FFFFFF0000C00000007C00000007C01FFFFFFC01FFFFFF0000E0000000
      7E00000007E00FFFFFFE00FFFFFF0000F01800007F01800007F007FFFFFF007F
      FFFF0000F007FC007F007FC007F803FFFFFF803FFFFF0000F803FFFFFF803FFF
      FFFC03FFFFFFC03FFFFF0000FC01FFFFFFC01FFFFFFE03FFFFFFE03FFFFF0000
      FC00FFFFFFC00FFFFFFF01FFFFFFF01FFFFF0000FE007FFFFFE007FFFFFF81FE
      3FFFF81FE3FF0000FF003FFFFFF003FFFFFFF0F007FFFF0F007F0000FFC00FFF
      FFFC00FFFFFFF80001FFFF80001F0000FFE007FFFFFE007FFFFFFC0000FFFFC0
      000F0000FFF003FFFFFF003FFFFFFE00007FFFE000070000FFF801FFFFFF801F
      FFFFFE00003FFFE000030000FFFC00FFFFFFC00FFFFFFE00003FFFE000030000
      FFFE007FFFFFE007FFFFFC00001FFFC000010000FFFF001FFFFFF001FFFFFC00
      001FFFC000010000FFFF800FFFFFF800FFFFFC00001FFFC000010000FFFFE007
      FFFFFE007FFFFC00000FFFC000000000FFFFF003FFFFFF003FFFFC00000FFFC0
      00000000FFFFF801FFFFFF801FFFFC00000FFFC000000000FFFFFC00FFFFFFC0
      0FFFFC00001FFFC000010000FFFFFE003FFFFFE003FFFC00001FFFC000010000
      FFFFFF001FFFFFF001FFFC00001FFFC000010000FFFFFF801FFFFFF801FFFE00
      023FFFE000230000FFFFFFC00FFFFFFC00FFFE00043FFFE000430000FFFFFFE0
      1FFFFFFE01FFFF00007FFFF000070000FFFFFFF01FFFFFFF01FFFF8000FFFFF8
      000F0000FFFFFFF83FFFFFFF83FFFFC001FFFFFC001F0000FFFFFFFFFFFFFFFF
      FFFFFFF003FFFFFF003F0000FFFFFFFFFFFFFFFFFFFFFFFE1FFFFFFFE1FF0000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF800
      FFFFFF800FFF0000FFFFF00FFFFFFF00FFFF80000FFFF80000FF0000FFFFE007
      FFFFFE007FFF000007FFF000007F0000FFFFC003FFFFFC003FFF000007FFF000
      007F0000FC3FC003FFC3FC003FFE000003FFE000003F0000E00FC001FE00FC00
      1FFC000001FFC000001F0000C007C001FC007C001FF8300000FF8300000F0000
      C0020001FC0020001FF04000007F040000070000C0000000FC0000000FE10000
      007E100000070000C00000007C00000007E20000003E20000003000080000000
      3800000003C40000003C400000030000800000001800000001C40000001C4000
      00010000800070001800070001C80000001C8000000100008000100018000100
      0188000000988000000900008000000018000000019000000099000000090000
      C00000003C000000039000000009000000000000C00000003C00000003800000
      0008000000000000E00000007E000000078000000048000000040000F0000000
      7F000000078060000048060000040000F00000003F0000000380780000480780
      00040000F80000003F80000003807F00000807F000000000FC0000003FC00000
      03807FE0001807FE00010000FC0000003FC00000038000000018000000010000
      FE0000003FE0000003C00000001C000000010000FE0000007FE0000007C00000
      001C000000010000FE0000007FE0000007C00000003C000000030000FF000060
      7FF0000607E00000003E000000030000FF8000F07FF8000F07F00000007F0000
      00070000FF8003FFFFF8003FFFF0000000FF0000000F0000FFE03FFFFFFE03FF
      FFF8000001FF8000001F0000FFF07FFFFFFF07FFFFFC000003FFC000003F0000
      FFF07FFFFFFF07FFFFFE000007FFE000007F0000FFFFFFFFFFFFFFFFFFFF8400
      0FFFF84000FF0000FFFFFFFFFFFFFFFFFFFFC0003FFFFC0003FF0000FFFFFFFF
      FFFFFFFFFFFFF801FFFFFF801FFF0000FFFFFFFFFFFFFFFFFFFFFE07FFFFFFE0
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
  object AccionesDemo: TActionList
    Left = 128
    Top = 200
    object AcAltaAutomaticaTicket: TAction
      Caption = 'AcAltaAutomaticaTicket'
      ShortCut = 49236
      OnExecute = AcAltaAutomaticaTicketExecute
    end
  end
end
