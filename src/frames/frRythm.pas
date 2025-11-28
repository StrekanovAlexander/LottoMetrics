unit frRythm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  dmMain, uTranslations, uDateUtils,
  uLottery, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series

  ;

type
  TfrmRythm = class(TFrame, ITranslatable)
    pnlContainer: TPanel;
    lblTitle: TLabel;
    pnlPeriod: TPanel;
    lblPeriod: TLabel;
    lblPeriodValue: TLabel;
    FDQuery: TFDQuery;
    FDQueryNUMBER: TSmallintField;
    FDQueryCNT: TIntegerField;
    FDQueryAVG_INTERVAL: TFMTBCDField;
    FDQueryUNIFORMITY: TBCDField;
    DataSource: TDataSource;
    lblDrawsCount: TLabel;
    lblDrawsCountTitle: TLabel;
    FDQueryTimeLine: TFDQuery;
    FDQueryTimeLineDRAW_DATE: TDateField;
    FDQueryTimeLineDRAW_ID: TIntegerField;
    FDQueryTimeLineHIT: TSmallintField;
    pnlTop: TPanel;
    DBGrid: TDBGrid;
    Splitter: TSplitter;
    pnlRight: TPanel;
    lblCntHint: TLabel;
    lblAvgIntervalHint: TLabel;
    lblUniformityHint: TLabel;
    bvlCnt: TBevel;
    bvlNumber: TBevel;
    bvlAvgInterval: TBevel;
    bvlUniformity: TBevel;
    pnlNumber: TPanel;
    dbtNumber: TDBText;
    lblNumber: TLabel;
    pnlCnt: TPanel;
    dbtCnt: TDBText;
    lblCnt: TLabel;
    pnlAvgInterval: TPanel;
    dbtAvgInterval: TDBText;
    lblAvgInterval: TLabel;
    pnlUniformity: TPanel;
    dbtUniformity: TDBText;
    lblUniformity: TLabel;
    ChartRythm: TChart;
    procedure DBGridTitleClick(Column: TColumn);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure DBGridCellClick(Column: TColumn);
  private
    FLottery: TLottery;
    FNumberKind: string;
    FSelectedNumber: Integer;
    FOrderBy: string;
    FSelectedField: string;
    FSeriesHits: TLineSeries;
    procedure LoadData;
    procedure InitChart;
    procedure BuildChart;
  public
    procedure ApplyLanguage;
    procedure SetData(ALottery: TLottery);
  end;

implementation

{$R *.dfm}

procedure TfrmRythm.SetData(ALottery: TLottery);
begin
  FLottery := ALottery;
  lblPeriodValue.Caption := TDateUtils.FormatDate(DM.PeriodFrom) +
    ' - ' + TDateUtils.FormatDate(DM.PeriodTo);
  ApplyLanguage;
  FNumberKind := 'main';

  LoadData;
  FSelectedNumber := FDQuery.FieldByName('NUMBER').AsInteger;

  InitChart;
  BuildChart;

  FOrderBy := 'ASC';
  FSelectedField := 'NUMBER';
  lblDrawsCount.Caption := FDQuery.RecordCount.ToString;

end;

procedure TfrmRythm.ApplyLanguage;
begin
  lblTitle.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM') +
    ': ' + TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'INTERVAL_ANALYSIS');
  lblPeriod.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'PERIOD');

  for var i := 0 to DBGrid.Columns.Count - 1 do
    DBGrid.Columns[i].Title.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode,
      DBGrid.Columns[i].FieldName);

  lblNumber.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER');
  lblCnt.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM_CNT_DETAILS');
  lblCntHint.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM_CNT_HINT');
  lblAvgInterval.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM_AVG_INTERVAL_DETAILS');
  lblAvgIntervalHint.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM_AVG_INTERVAL_HINT');
  lblUniformity.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM_UNIFORMITY_DETAILS');
  lblUniformityHint.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM_UNIFORMITY_HINT');
  lblDrawsCountTitle.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'DRAWS_COUNT');
end;

procedure TfrmRythm.DataSourceDataChange(Sender: TObject; Field: TField);
var
  val: Double;
begin
  if Assigned(FDQuery.FindField('UNIFORMITY')) and not FDQuery.FieldByName('UNIFORMITY').IsNull then
  begin
    val := FDQuery.FieldByName('UNIFORMITY').AsFloat;
    if val < 0 then
      dbtUniformity.Font.Color := clRed
    else if (val > 0) and (val < 0.5) then
      dbtUniformity.Font.Color := RGB(204, 119, 34)
    else if val >= 0.5 then
      dbtUniformity.Font.Color := clGreen;
  end
  else
    dbtUniformity.Font.Color := clWindowText;

end;

procedure TfrmRythm.DBGridCellClick(Column: TColumn);
begin
  if not DBGrid.DataSource.DataSet.IsEmpty then
  begin
    FSelectedNumber := DBGrid.DataSource.DataSet.FieldByName('NUMBER').AsInteger;
    BuildChart;
  end;
end;

procedure TfrmRythm.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  val: Double;
begin
  if Column.Field.FieldName = 'UNIFORMITY' then
  begin
    if not Column.Field.IsNull then
    begin
      val := Column.Field.AsFloat;

      if val < 0 then
        DBGrid.Canvas.Font.Color := clRed
      else if (val > 0) and (val < 0.5) then
        DBGrid.Canvas.Font.Color := $0080FF // (RGB: 0x0080FF)
      else if val >= 0.5 then
        DBGrid.Canvas.Font.Color := clGreen;
    end;
  end;
  DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmRythm.DBGridTitleClick(Column: TColumn);
begin
  if FSelectedField = Column.FieldName then
    if FOrderBy = 'ASC' then
        FOrderBy := 'DESC'
    else
      FOrderBy := 'ASC'
  else
    FSelectedField := Column.FieldName;

  FDQuery.Close;
  FDQuery.SQL.Text :=
    'SELECT number, cnt, avg_interval, uniformity ' +
    'FROM get_number_rythm(:p_lottery_id, :p_start_date, :p_end_date, :p_number_kind) ' +
    'WHERE cnt > 1 ORDER BY ' + FSelectedField + ' ' + FOrderBy;
  FDQuery.Open;
end;

procedure TfrmRythm.LoadData;
begin
  FDQuery.Close;
  FDQuery.ParamByName('p_lottery_id').AsInteger := FLottery.ID;
  FDQuery.ParamByName('p_start_date').AsDate := DM.PeriodFrom;
  FDQuery.ParamByName('p_end_date').AsDate := DM.PeriodTo;
  FDQuery.ParamByName('p_number_kind').AsString := FNumberKind;
  FDQuery.Open;
end;

procedure TfrmRythm.InitChart;
begin
  FSeriesHits := TLineSeries.Create(ChartRythm);

  FSeriesHits.XValues.DateTime := True;
  FSeriesHits.ColorEachPoint := False;
  FSeriesHits.Color := clGreen;
  FSeriesHits.LinePen.Color := clGreen;
  FSeriesHits.LinePen.Width := 2;

  ChartRythm.AddSeries(FSeriesHits);
  ChartRythm.LeftAxis.SetMinMax(0, 1);
  ChartRythm.LeftAxis.Increment := 1;

  ChartRythm.BottomAxis.Automatic := False;
  ChartRythm.BottomAxis.SetMinMax(DM.PeriodFrom, DM.PeriodTo);
  ChartRythm.BottomAxis.Increment := 1;
  ChartRythm.BottomAxis.DateTimeFormat := 'dd.mm.yy';
end;

procedure TfrmRythm.BuildChart;
begin
  FDQueryTimeline.Close;
  FDQueryTimeline.ParamByName('p_lottery_id').AsInteger := FLottery.ID;
  FDQueryTimeline.ParamByName('p_start_date').AsDate := DM.PeriodFrom;
  FDQueryTimeline.ParamByName('p_end_date').AsDate := DM.PeriodTo;
  FDQueryTimeline.ParamByName('p_number_kind').AsString := FNumberKind;
  FDQueryTimeline.ParamByName('p_number').AsInteger := FSelectedNumber;
  FDQueryTimeline.Open;
  FSeriesHits.Clear;
  while not FDQueryTimeline.Eof do
  begin
    FSeriesHits.AddXY(
      FDQueryTimeline.FieldByName('draw_date').AsDateTime,
      FDQueryTimeline.FieldByName('hit').AsInteger
    );
    FDQueryTimeline.Next;
  end;
end;

end.
