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
        object gbxMainNumbers: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 270
          Height = 366
          Align = alLeft
          Caption = 'gbxMainNumbers'
          TabOrder = 0
          object DBGrid: TDBGrid
            AlignWithMargins = True
            Left = 7
            Top = 20
            Width = 256
            Height = 339
            Margins.Left = 5
            Margins.Right = 5
            Margins.Bottom = 5
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
                Width = 60
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'GAP'
                Title.Alignment = taCenter
                Width = 70
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'LAST_DRAW_DATE'
                Title.Alignment = taCenter
                Width = 85
                Visible = True
              end>
          end
        end
        object gbxExtraNumbers: TGroupBox
          AlignWithMargins = True
          Left = 279
          Top = 3
          Width = 330
          Height = 366
          Align = alClient
          Caption = 'gbxExtraNumbers'
          TabOrder = 1
          object DBGridExtra: TDBGrid
            AlignWithMargins = True
            Left = 7
            Top = 20
            Width = 316
            Height = 339
            Margins.Left = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Align = alClient
            DataSource = DataSourceExtra
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnTitleClick = DBGridExtraTitleClick
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'NUMBER'
                Title.Alignment = taCenter
                Width = 60
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'GAP'
                Title.Alignment = taCenter
                Width = 70
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'LAST_DRAW_DATE'
                Title.Alignment = taCenter
                Width = 85
                Visible = True
              end>
          end
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
    Left = 294
    Top = 20
  end
  object FDQuery: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT NUMBER, GAP, LAST_DRAW_DATE '
      
        'FROM GET_NUMBER_GAPS(:P_LOTTERY_ID, :P_START_DATE, :P_END_DATE, ' +
        ':P_NUMBER_KIND)')
    Left = 226
    Top = 18
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
      end
      item
        Name = 'P_NUMBER_KIND'
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
  object FDQueryExtra: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT NUMBER, GAP, LAST_DRAW_DATE '
      
        'FROM GET_NUMBER_GAPS(:P_LOTTERY_ID, :P_START_DATE, :P_END_DATE, ' +
        ':P_NUMBER_KIND)')
    Left = 394
    Top = 18
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
      end
      item
        Name = 'P_NUMBER_KIND'
        ParamType = ptInput
      end>
    object SmallintField1: TSmallintField
      FieldName = 'NUMBER'
      Origin = 'NUMBER'
    end
    object IntegerField1: TIntegerField
      FieldName = 'GAP'
      Origin = 'GAP'
    end
    object DateField1: TDateField
      FieldName = 'LAST_DRAW_DATE'
      Origin = 'LAST_DRAW_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
  end
  object DataSourceExtra: TDataSource
    DataSet = FDQueryExtra
    Left = 486
    Top = 19
  end
end
