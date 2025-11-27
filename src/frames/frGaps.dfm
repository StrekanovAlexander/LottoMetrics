object frmGaps: TfrmGaps
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Align = alClient
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
    ExplicitLeft = 248
    ExplicitTop = 152
    ExplicitWidth = 185
    ExplicitHeight = 41
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
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitWidth = 50
    end
    object pnlPeriod: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 30
      Width = 614
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
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
    object pgcGaps: TPageControl
      Left = 0
      Top = 58
      Width = 620
      Height = 402
      ActivePage = tbsTable
      Align = alClient
      TabOrder = 1
      object tbsTable: TTabSheet
        Caption = 'tbsTable'
        object DBGrid: TDBGrid
          Left = 0
          Top = 0
          Width = 612
          Height = 372
          Align = alClient
          DataSource = DataSource
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnTitleClick = DBGridTitleClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMBER'
              Title.Alignment = taCenter
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'GAP'
              Title.Alignment = taCenter
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'LAST_DRAW_DATE'
              Title.Alignment = taCenter
              Width = 100
              Visible = True
            end>
        end
      end
      object tbsChart: TTabSheet
        Caption = 'tbsChart'
        ImageIndex = 1
      end
      object tbsHeatMap: TTabSheet
        Caption = 'tbsHeatMap'
        ImageIndex = 2
      end
    end
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    Left = 446
    Top = 28
  end
  object FDQuery: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      
        'SELECT NUMBER, GAP, LAST_DRAW_DATE FROM GET_NUMBER_GAPS(:P_LOTTE' +
        'RY_ID, :P_START_DATE, :P_END_DATE)')
    Left = 378
    Top = 26
    ParamData = <
      item
        Name = 'P_LOTTERY_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'P_START_DATE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'P_END_DATE'
        DataType = ftDate
        ParamType = ptInput
      end>
    object FDQueryNUMBER: TSmallintField
      FieldName = 'NUMBER'
      Origin = 'NUMBER'
    end
    object FDQueryGAP: TIntegerField
      FieldName = 'GAP'
      Origin = 'GAP'
    end
    object FDQueryLAST_DRAW_DATE: TDateField
      FieldName = 'LAST_DRAW_DATE'
      Origin = 'LAST_DRAW_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
  end
end
