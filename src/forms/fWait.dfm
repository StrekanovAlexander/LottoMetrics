object fmWait: TfmWait
  Left = 0
  Top = 0
  AlphaBlendValue = 180
  BorderStyle = bsNone
  Caption = 'fmWait'
  ClientHeight = 120
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblInfo: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 35
    Width = 294
    Height = 15
    Margins.Top = 35
    Align = alTop
    Alignment = taCenter
    Caption = 'Downloading...'
    ExplicitTop = 15
    ExplicitWidth = 80
  end
  object ProgressBar1: TProgressBar
    AlignWithMargins = True
    Left = 15
    Top = 58
    Width = 270
    Height = 17
    Margins.Left = 15
    Margins.Top = 5
    Margins.Right = 15
    Align = alTop
    Style = pbstMarquee
    TabOrder = 0
    ExplicitTop = 49
    ExplicitWidth = 254
  end
end
