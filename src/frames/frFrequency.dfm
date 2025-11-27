object frmFrequency: TfrmFrequency
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object pnlContainer: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 620
    Height = 460
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lblTitle: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 614
      Height = 21
      Align = alTop
      Caption = 'lblTitle'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 50
    end
    object pnlModes: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 63
      Width = 614
      Height = 41
      Margins.Top = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object btnSingles: TSpeedButton
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 100
        Height = 35
        Margins.Left = 0
        Align = alLeft
        Caption = 'btnSingles'
        OnClick = btnSinglesClick
        ExplicitLeft = 3
      end
      object btnTriplets: TSpeedButton
        AlignWithMargins = True
        Left = 237
        Top = 3
        Width = 100
        Height = 35
        Align = alLeft
        Caption = 'btnTriplets'
        OnClick = btnTripletsClick
        ExplicitLeft = 215
      end
      object btnPairs: TSpeedButton
        AlignWithMargins = True
        Left = 106
        Top = 3
        Width = 125
        Height = 35
        Align = alLeft
        Caption = 'btnPairs'
        OnClick = btnPairsClick
      end
      object btnBonus: TSpeedButton
        AlignWithMargins = True
        Left = 343
        Top = 3
        Width = 125
        Height = 35
        Align = alLeft
        Caption = 'btnBonus'
        OnClick = btnBonusClick
        ExplicitLeft = 318
      end
    end
    object grdData: TDrawGrid
      AlignWithMargins = True
      Left = 3
      Top = 117
      Width = 614
      Height = 340
      Margins.Top = 10
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      ColCount = 2
      Ctl3D = False
      DefaultColWidth = 35
      DefaultRowHeight = 35
      DoubleBuffered = True
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedRowDefAlign]
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnDrawCell = grdDataDrawCell
    end
    object pnlPeriod: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 30
      Width = 614
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lblPeriod: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 47
        Height = 19
        Margins.Left = 0
        Align = alLeft
        Caption = 'lblPeriod'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitHeight = 15
      end
      object lblPeriodValue: TLabel
        AlignWithMargins = True
        Left = 53
        Top = 3
        Width = 79
        Height = 19
        Align = alLeft
        Caption = 'lblPeriodValue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 55
        ExplicitHeight = 15
      end
    end
  end
end
