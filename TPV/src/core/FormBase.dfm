object FrmBase: TFrmBase
  Left = 165
  Top = 127
  Caption = 'FrmBase'
  ClientHeight = 446
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzFormState1: TRzFormState
    RegIniFile = RzRegIniFile1
    Left = 65528
    Top = 65520
  end
  object RzRegIniFile1: TRzRegIniFile
    PathType = ptRegistry
    RegAccess = [keyCreateSubKey, keyAllAccess]
    Left = 65528
    Top = 65520
  end
  object Acciones: TActionList
    Left = 160
    Top = 88
  end
end
