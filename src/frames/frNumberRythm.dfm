object frmNumberRythm: TfrmNumberRythm
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
    ExplicitWidth = 620
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
    object Splitter: TSplitter
      Left = 350
      Top = 58
      Height = 402
      Beveled = True
      ExplicitLeft = 408
      ExplicitTop = 224
      ExplicitHeight = 100
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
      ExplicitWidth = 614
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
    object DBGrid: TDBGrid
      Left = 0
      Top = 58
      Width = 350
      Height = 402
      Align = alLeft
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
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
      Left = 363
      Top = 58
      Width = 417
      Height = 402
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 353
      ExplicitWidth = 267
      object lblCntHint: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 52
        Width = 417
        Height = 15
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = 'lblCntHint'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsItalic]
        ParentFont = False
        ExplicitTop = 50
        ExplicitWidth = 55
      end
      object lblAvgInterval: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 95
        Width = 417
        Height = 15
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        Caption = 'lblAvgInterval'
        WordWrap = True
        ExplicitLeft = 3
        ExplicitTop = 102
        ExplicitWidth = 73
      end
      object lblUniformity: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 141
        Width = 417
        Height = 15
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Align = alTop
        Caption = 'lblUniformity'
        ExplicitLeft = 3
        ExplicitTop = 136
        ExplicitWidth = 70
      end
      object pnlNumber: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 417
        Height = 25
        Margins.Left = 0
        Margins.Right = 0
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'pnlNumber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitWidth = 267
        object dbtNumber: TDBText
          AlignWithMargins = True
          Left = 349
          Top = 3
          Width = 65
          Height = 19
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
      end
      object pnlCnt: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 34
        Width = 417
        Height = 18
        Margins.Left = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'pnlCnt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Locked = True
        ParentFont = False
        TabOrder = 1
        object dbtCnt: TDBText
          AlignWithMargins = True
          Left = 349
          Top = 3
          Width = 65
          Height = 12
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
      end
      object pnlAvgInterval: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 77
        Width = 417
        Height = 18
        Margins.Left = 0
        Margins.Top = 10
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'pnlAvgInterval'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object dbtAvgInterval: TDBText
          AlignWithMargins = True
          Left = 349
          Top = 3
          Width = 65
          Height = 12
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
      end
      object pnlUniformity: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 123
        Width = 417
        Height = 18
        Margins.Left = 0
        Margins.Top = 10
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'pnlUniformity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        ExplicitTop = 126
        object dbtUniformity: TDBText
          AlignWithMargins = True
          Left = 349
          Top = 3
          Width = 65
          Height = 12
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
      end
    end
  end
  object FDQuery: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT NUMBER, CNT, AVG_INTERVAL, UNIFORMITY'
      
        'FROM get_number_rythm(:p_lottery_id, :p_start_date, :p_end_date,' +
        ' :p_number_kind) '
      'WHERE cnt > 1')
    Left = 236
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
    Left = 305
    Top = 16
  end
end
