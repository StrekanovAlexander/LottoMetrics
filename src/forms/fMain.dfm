object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'LottoMetrics'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 441
    Margins.Bottom = 5
    Align = alLeft
    BorderWidth = 10
    TabOrder = 0
    object lblLotteryName: TLabel
      AlignWithMargins = True
      Left = 14
      Top = 21
      Width = 210
      Height = 30
      Margins.Top = 10
      Margins.Right = 15
      Align = alTop
      Caption = 'LotteryName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 14
      ExplicitWidth = 129
    end
    object lblPeriod: TLabel
      AlignWithMargins = True
      Left = 14
      Top = 115
      Width = 222
      Height = 15
      Margins.Top = 15
      Align = alTop
      Caption = #1055#1077#1088#1080#1086#1076
      ExplicitLeft = 11
      ExplicitTop = 90
      ExplicitWidth = 42
    end
    object lblAnalytics: TLabel
      AlignWithMargins = True
      Left = 14
      Top = 281
      Width = 222
      Height = 15
      Margins.Top = 25
      Align = alTop
      Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072
      ExplicitTop = 269
      ExplicitWidth = 59
    end
    object cbxLotteries: TComboBox
      AlignWithMargins = True
      Left = 14
      Top = 74
      Width = 222
      Height = 23
      Margins.Top = 20
      Align = alTop
      Style = csDropDownList
      TabOrder = 0
      OnChange = cbxLotteriesChange
      ExplicitLeft = 11
      ExplicitTop = 54
      ExplicitWidth = 228
    end
    object dtpPeriodFrom: TDateTimePicker
      AlignWithMargins = True
      Left = 14
      Top = 136
      Width = 222
      Height = 23
      Align = alTop
      Date = 45983.000000000000000000
      Format = 'dd.MM.yyyy'
      Time = 0.483649108798999800
      TabOrder = 1
      ExplicitLeft = 24
      ExplicitTop = 152
      ExplicitWidth = 186
    end
    object dtpPeriodTo: TDateTimePicker
      AlignWithMargins = True
      Left = 14
      Top = 167
      Width = 222
      Height = 23
      Margins.Top = 5
      Align = alTop
      Date = 45983.000000000000000000
      Format = 'dd.MM.yyyy'
      Time = 0.485294745369174100
      TabOrder = 2
      ExplicitTop = 192
      ExplicitWidth = 186
    end
    object btnDraws: TButton
      AlignWithMargins = True
      Left = 14
      Top = 208
      Width = 222
      Height = 45
      Margins.Top = 15
      Align = alTop
      Caption = #1056#1086#1079#1099#1075#1088#1099#1096#1080
      TabOrder = 3
      ExplicitTop = 191
    end
    object btnStatsNumbers: TButton
      AlignWithMargins = True
      Left = 14
      Top = 304
      Width = 222
      Height = 45
      Margins.Top = 5
      Align = alTop
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1085#1086#1084#1077#1088#1072#1084
      TabOrder = 4
      ExplicitLeft = 11
      ExplicitTop = 282
      ExplicitWidth = 228
    end
  end
  object pnlMain: TPanel
    Left = 250
    Top = 0
    Width = 374
    Height = 441
    Align = alClient
    TabOrder = 1
  end
end
