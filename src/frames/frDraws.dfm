object frmDraws: TfrmDraws
  AlignWithMargins = True
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  Align = alClient
  Color = clBtnFace
  ParentBackground = False
  ParentColor = False
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
    ParentBackground = False
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
    object grdData: TDrawGrid
      AlignWithMargins = True
      Left = 3
      Top = 68
      Width = 614
      Height = 348
      Margins.Top = 10
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = False
      DefaultColWidth = 35
      DefaultRowHeight = 35
      FixedCols = 0
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedRowDefAlign]
      ParentCtl3D = False
      TabOrder = 0
      OnDrawCell = grdDataDrawCell
      OnSelectCell = grdDataSelectCell
      ExplicitTop = 200
      ExplicitHeight = 216
    end
    object pnlButtons: TPanel
      Left = 0
      Top = 419
      Width = 620
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object btnAdd: TButton
        AlignWithMargins = True
        Left = 1
        Top = 3
        Width = 100
        Height = 35
        Margins.Left = 1
        Align = alLeft
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 0
        OnClick = btnAddClick
      end
      object btnEdit: TButton
        AlignWithMargins = True
        Left = 107
        Top = 3
        Width = 100
        Height = 35
        Align = alLeft
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        Enabled = False
        TabOrder = 1
        OnClick = btnEditClick
      end
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
        Width = 49
        Height = 19
        Margins.Left = 0
        Align = alLeft
        Caption = 'lblPeriod'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitHeight = 15
      end
      object lblPeriodValue: TLabel
        AlignWithMargins = True
        Left = 55
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
        ExplicitHeight = 15
      end
    end
  end
end
