object fmDrawEdit: TfmDrawEdit
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 10
  Caption = 'fmDrawEdit'
  ClientHeight = 431
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  TextHeight = 15
  object pnlTitle: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 458
    Height = 50
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Title'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 390
    Width = 464
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnOK: TButton
      AlignWithMargins = True
      Left = 305
      Top = 3
      Width = 75
      Height = 35
      Align = alRight
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 386
      Top = 3
      Width = 75
      Height = 35
      Align = alRight
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object dtpDate: TDateTimePicker
    AlignWithMargins = True
    Left = 3
    Top = 59
    Width = 458
    Height = 23
    Align = alTop
    Date = 45984.000000000000000000
    Format = 'dd.MM.yyyy'
    Time = 0.699734502311912400
    TabOrder = 2
  end
  object gbxMainNumbers: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 88
    Width = 225
    Height = 299
    Align = alLeft
    Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1085#1086#1084#1077#1088#1072
    TabOrder = 3
  end
  object gbxExtraNumbers: TGroupBox
    AlignWithMargins = True
    Left = 234
    Top = 88
    Width = 227
    Height = 299
    Align = alClient
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1085#1086#1084#1077#1088#1072
    TabOrder = 4
  end
end
