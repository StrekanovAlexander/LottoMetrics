object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'LottoMetrics'
  ClientHeight = 572
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 572
    Margins.Bottom = 5
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 20
    Color = clWhitesmoke
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 0
    object lblLotteryName: TLabel
      AlignWithMargins = True
      Left = 23
      Top = 33
      Width = 192
      Height = 32
      Margins.Top = 13
      Margins.Right = 15
      Align = alTop
      Caption = 'LotteryName'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 144
    end
    object lblPeriod: TLabel
      AlignWithMargins = True
      Left = 23
      Top = 144
      Width = 204
      Height = 15
      Margins.Top = 15
      Align = alTop
      Caption = #1055#1077#1088#1080#1086#1076
      ExplicitWidth = 42
    end
    object lblAnalytics: TLabel
      AlignWithMargins = True
      Left = 23
      Top = 305
      Width = 204
      Height = 15
      Margins.Top = 25
      Align = alTop
      Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072
      ExplicitWidth = 59
    end
    object lblLanguage: TLabel
      AlignWithMargins = True
      Left = 23
      Top = 505
      Width = 204
      Height = 15
      Align = alBottom
      Caption = 'Language'
      ExplicitWidth = 52
    end
    object cmbLotteries: TComboBox
      AlignWithMargins = True
      Left = 23
      Top = 103
      Width = 204
      Height = 23
      Margins.Top = 35
      Align = alTop
      Style = csDropDownList
      TabOrder = 0
      OnChange = cmbLotteriesChange
    end
    object dtpPeriodFrom: TDateTimePicker
      AlignWithMargins = True
      Left = 23
      Top = 165
      Width = 204
      Height = 23
      Align = alTop
      Date = 45983.000000000000000000
      Format = 'dd.MM.yyyy'
      Time = 0.483649108798999800
      TabOrder = 1
      OnCloseUp = dtpPeriodFromCloseUp
    end
    object dtpPeriodTo: TDateTimePicker
      AlignWithMargins = True
      Left = 23
      Top = 196
      Width = 204
      Height = 23
      Margins.Top = 5
      Align = alTop
      Date = 45983.000000000000000000
      Format = 'dd.MM.yyyy'
      Time = 0.485294745369174100
      TabOrder = 2
      OnCloseUp = dtpPeriodFromCloseUp
    end
    object btnDraws: TButton
      AlignWithMargins = True
      Left = 23
      Top = 237
      Width = 204
      Height = 40
      Margins.Top = 15
      Align = alTop
      Caption = #1056#1086#1079#1099#1075#1088#1099#1096#1080
      TabOrder = 3
    end
    object btnStatsNumbers: TButton
      AlignWithMargins = True
      Left = 23
      Top = 326
      Width = 204
      Height = 40
      Align = alTop
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1085#1086#1084#1077#1088#1072#1084
      TabOrder = 4
    end
    object cmbLanguages: TComboBox
      AlignWithMargins = True
      Left = 23
      Top = 526
      Width = 204
      Height = 23
      Align = alBottom
      Style = csDropDownList
      TabOrder = 5
      OnChange = cmbLanguagesChange
    end
  end
  object pnlMain: TPanel
    Left = 250
    Top = 0
    Width = 374
    Height = 572
    Align = alClient
    TabOrder = 1
  end
end
