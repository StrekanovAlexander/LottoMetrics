object frmRythm: TfrmRythm
  Left = 0
  Top = 0
  Width = 800
  Height = 480
  TabOrder = 0
  object pnlContainer: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 780
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
      Width = 774
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
      Width = 774
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
      object lblDrawsCount: TLabel
        AlignWithMargins = True
        Left = 693
        Top = 3
        Width = 81
        Height = 19
        Margins.Right = 0
        Align = alRight
        Caption = 'lblDrawsCount'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitHeight = 15
      end
      object lblDrawsCountTitle: TLabel
        AlignWithMargins = True
        Left = 587
        Top = 3
        Width = 100
        Height = 19
        Align = alRight
        Caption = 'lblDrawsCountTitle'
        ExplicitHeight = 15
      end
    end
    object pnlTop: TPanel
      Left = 0
      Top = 58
      Width = 780
      Height = 247
      Align = alTop
      TabOrder = 1
      object Splitter: TSplitter
        Left = 355
        Top = 1
        Height = 245
        Beveled = True
        ExplicitLeft = 146
        ExplicitHeight = 282
      end
      object DBGrid: TDBGrid
        Left = 1
        Top = 1
        Width = 354
        Height = 245
        Align = alLeft
        DataSource = DataSource
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = DBGridCellClick
        OnDrawColumnCell = DBGridDrawColumnCell
        OnTitleClick = DBGridTitleClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUMBER'
            Title.Alignment = taCenter
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CNT'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'AVG_INTERVAL'
            Title.Alignment = taCenter
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNIFORMITY'
            Title.Alignment = taCenter
            Width = 95
            Visible = True
          end>
      end
      object pnlRight: TPanel
        AlignWithMargins = True
        Left = 368
        Top = 1
        Width = 411
        Height = 245
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 381
        ExplicitTop = 5
        ExplicitWidth = 356
        ExplicitHeight = 343
        object lblCntHint: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 56
          Width = 411
          Height = 15
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 5
          Align = alTop
          Caption = 'lblCntHint'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsItalic]
          ParentFont = False
          ExplicitWidth = 55
        end
        object lblAvgIntervalHint: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 103
          Width = 411
          Height = 15
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 5
          Align = alTop
          Caption = 'lblAvgIntervalHint'
          WordWrap = True
          ExplicitWidth = 96
        end
        object lblUniformityHint: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 150
          Width = 411
          Height = 15
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 5
          Align = alTop
          Caption = 'lblUniformityHint'
          ExplicitWidth = 93
        end
        object bvlCnt: TBevel
          Left = 0
          Top = 27
          Width = 411
          Height = 5
          Align = alTop
          Shape = bsTopLine
          ExplicitTop = 31
          ExplicitWidth = 417
        end
        object bvlNumber: TBevel
          Left = 0
          Top = 0
          Width = 411
          Height = 3
          Align = alTop
          Shape = bsTopLine
          ExplicitWidth = 417
        end
        object bvlAvgInterval: TBevel
          Left = 0
          Top = 76
          Width = 411
          Height = 3
          Align = alTop
          Shape = bsTopLine
          ExplicitTop = 68
          ExplicitWidth = 417
        end
        object bvlUniformity: TBevel
          Left = 0
          Top = 123
          Width = 411
          Height = 3
          Align = alTop
          Shape = bsTopLine
          ExplicitTop = 113
          ExplicitWidth = 417
        end
        object pnlNumber: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 6
          Width = 411
          Height = 18
          Margins.Left = 0
          Margins.Right = 0
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 356
          object dbtNumber: TDBText
            AlignWithMargins = True
            Left = 343
            Top = 3
            Width = 65
            Height = 12
            Align = alRight
            Alignment = taRightJustify
            DataField = 'NUMBER'
            DataSource = DataSource
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 160
            ExplicitTop = 8
            ExplicitHeight = 17
          end
          object lblNumber: TLabel
            AlignWithMargins = True
            Left = 0
            Top = 3
            Width = 59
            Height = 12
            Margins.Left = 0
            Align = alLeft
            Caption = 'lblNumber'
            ExplicitHeight = 15
          end
        end
        object pnlCnt: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 35
          Width = 411
          Height = 21
          Margins.Left = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ExplicitWidth = 356
          object dbtCnt: TDBText
            AlignWithMargins = True
            Left = 343
            Top = 3
            Width = 65
            Height = 15
            Align = alRight
            Alignment = taRightJustify
            DataField = 'CNT'
            DataSource = DataSource
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 160
            ExplicitTop = 8
            ExplicitHeight = 17
          end
          object lblCnt: TLabel
            AlignWithMargins = True
            Left = 0
            Top = 3
            Width = 32
            Height = 15
            Margins.Left = 0
            Align = alLeft
            Caption = 'lblCnt'
            ExplicitLeft = 56
            ExplicitTop = 0
          end
        end
        object pnlAvgInterval: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 82
          Width = 411
          Height = 21
          Margins.Left = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ExplicitWidth = 356
          object dbtAvgInterval: TDBText
            AlignWithMargins = True
            Left = 343
            Top = 3
            Width = 65
            Height = 15
            Align = alRight
            Alignment = taRightJustify
            DataField = 'AVG_INTERVAL'
            DataSource = DataSource
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 320
            ExplicitTop = 8
            ExplicitHeight = 17
          end
          object lblAvgInterval: TLabel
            AlignWithMargins = True
            Left = 0
            Top = 3
            Width = 79
            Height = 15
            Margins.Left = 0
            Align = alLeft
            Caption = 'lblAvgInterval'
            ExplicitLeft = 128
            ExplicitTop = 8
          end
        end
        object pnlUniformity: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 129
          Width = 411
          Height = 21
          Margins.Left = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          ExplicitWidth = 356
          object dbtUniformity: TDBText
            AlignWithMargins = True
            Left = 343
            Top = 3
            Width = 65
            Height = 15
            Align = alRight
            Alignment = taRightJustify
            DataField = 'UNIFORMITY'
            DataSource = DataSource
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 336
            ExplicitTop = 0
            ExplicitHeight = 17
          end
          object lblUniformity: TLabel
            AlignWithMargins = True
            Left = 0
            Top = 3
            Width = 74
            Height = 15
            Margins.Left = 0
            Align = alLeft
            Caption = 'lblUniformity'
            ExplicitLeft = 99
            ExplicitTop = 0
          end
        end
      end
    end
    object ChartRythm: TChart
      Left = 0
      Top = 305
      Width = 780
      Height = 155
      Legend.Visible = False
      Title.Text.Strings = (
        'TimeLine')
      View3D = False
      Align = alClient
      TabOrder = 2
      ExplicitTop = 173
      ExplicitWidth = 356
      ExplicitHeight = 170
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
    end
  end
  object FDQuery: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT NUMBER, CNT, AVG_INTERVAL, UNIFORMITY'
      
        'FROM get_number_rythm(:p_lottery_id, :p_start_date, :p_end_date,' +
        ' :p_number_kind) '
      'WHERE cnt > 1')
    Left = 172
    Top = 16
    ParamData = <
      item
        Name = 'P_LOTTERY_ID'
        ParamType = ptInput
      end
      item
        Name = 'P_START_DATE'
        ParamType = ptInput
      end
      item
        Name = 'P_END_DATE'
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
    object FDQueryCNT: TIntegerField
      FieldName = 'CNT'
      Origin = 'CNT'
    end
    object FDQueryAVG_INTERVAL: TFMTBCDField
      FieldName = 'AVG_INTERVAL'
      Origin = 'AVG_INTERVAL'
      Precision = 18
      Size = 2
    end
    object FDQueryUNIFORMITY: TBCDField
      FieldName = 'UNIFORMITY'
      Origin = 'UNIFORMITY'
      DisplayFormat = '0.00'
      Precision = 18
    end
  end
  object DataSource: TDataSource
    DataSet = FDQuery
    OnDataChange = DataSourceDataChange
    Left = 233
    Top = 16
  end
  object FDQueryTimeLine: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'select draw_date,'
      '  draw_id,'
      '  hit '
      'from '
      
        '  get_number_rythm_timeline(:p_lottery_id, :p_start_date, :p_end' +
        '_date, :p_number_kind, :p_number)')
    Left = 61
    Top = 369
    ParamData = <
      item
        Name = 'P_LOTTERY_ID'
        ParamType = ptInput
      end
      item
        Name = 'P_START_DATE'
        ParamType = ptInput
      end
      item
        Name = 'P_END_DATE'
        ParamType = ptInput
      end
      item
        Name = 'P_NUMBER_KIND'
        ParamType = ptInput
      end
      item
        Name = 'P_NUMBER'
        ParamType = ptInput
      end>
    object FDQueryTimeLineDRAW_DATE: TDateField
      FieldName = 'DRAW_DATE'
      Origin = 'DRAW_DATE'
    end
    object FDQueryTimeLineDRAW_ID: TIntegerField
      FieldName = 'DRAW_ID'
      Origin = 'DRAW_ID'
    end
    object FDQueryTimeLineHIT: TSmallintField
      FieldName = 'HIT'
      Origin = 'HIT'
    end
  end
end
