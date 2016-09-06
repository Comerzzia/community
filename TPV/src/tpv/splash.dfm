object FrmSplash: TFrmSplash
  Left = 349
  Top = 307
  BorderIcons = []
  BorderStyle = bsNone
  BorderWidth = 5
  Caption = 'FrmSplash'
  ClientHeight = 324
  ClientWidth = 466
  Color = 12670976
  TransparentColor = True
  TransparentColorValue = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MPSPanel1: TRzPanel
    Left = 0
    Top = 293
    Width = 466
    Height = 31
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 0
    object RzVersionInfoStatus1: TRzVersionInfoStatus
      Left = 273
      Top = 0
      Width = 193
      Height = 31
      FrameStyle = fsNone
      Transparent = False
      Align = alClient
      Color = 12670976
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -32
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Alignment = taRightJustify
      Field = vifProductVersion
      VersionInfo = RzVersionInfo1
      ExplicitLeft = 337
      ExplicitWidth = 303
    end
    object Estado: TRzLabel
      Left = 0
      Top = 0
      Width = 273
      Height = 31
      Align = alLeft
      AutoSize = False
      Caption = 'Cargando...'
      Color = 12670976
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 293
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object RxGIFAnimator1: TJvGIFAnimator
      Left = 0
      Top = 0
      Width = 466
      Height = 293
      AsyncDrawing = True
      Center = True
      Align = alClient
      ExplicitLeft = 160
      ExplicitTop = 120
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
  end
  object RzVersionInfo1: TRzVersionInfo
    Left = 328
    Top = 80
  end
end
