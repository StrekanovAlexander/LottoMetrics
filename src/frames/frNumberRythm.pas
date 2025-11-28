unit frNumberRythm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  dmMain, uTranslations, uDateUtils,
  uLottery, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls
  ;

type
  TfrmNumberRythm = class(TFrame, ITranslatable)
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
    DBGrid: TDBGrid;
    Splitter: TSplitter;
    pnlRight: TPanel;
    pnlNumber: TPanel;
    dbtNumber: TDBText;
    pnlCnt: TPanel;
    lblCntHint: TLabel;
    dbtCnt: TDBText;
    pnlAvgInterval: TPanel;
    lblAvgInterval: TLabel;
    pnlUniformity: TPanel;
    lblUniformity: TLabel;
    dbtAvgInterval: TDBText;
    dbtUniformity: TDBText;
    lblDrawsCount: TLabel;
    lblDrawsCountTitle: TLabel;
    procedure DBGridTitleClick(Column: TColumn);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
  private
    FLottery: TLottery;
    FNumberKind: string;
    FSelectedNumber: Integer;
    FOrderBy: string;
    FSelectedField: string;
    procedure LoadData;
  public
    procedure ApplyLanguage;
    procedure SetData(ALottery: TLottery);
  end;

implementation

{$R *.dfm}

procedure TfrmNumberRythm.SetData(ALottery: TLottery);
begin
  FLottery := ALottery;
  lblPeriodValue.Caption := TDateUtils.FormatDate(DM.PeriodFrom) +
    ' - ' + TDateUtils.FormatDate(DM.PeriodTo);
  ApplyLanguage;
  FNumberKind := 'main';
  LoadData;
  FSelectedNumber := FDQuery.FieldByName('NUMBER').AsInteger;
  FOrderBy := 'ASC';
  FSelectedField := 'NUMBER';
  lblDrawsCount.Caption := FDQuery.RecordCount.ToString;

end;

procedure TfrmNumberRythm.ApplyLanguage;
begin
  lblTitle.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM') +
    ': ' + TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'INTERVAL_ANALYSIS');
  lblPeriod.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'PERIOD');

  for var i := 0 to DBGrid.Columns.Count - 1 do
    DBGrid.Columns[i].Title.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode,
      DBGrid.Columns[i].FieldName);

  pnlNumber.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER');
  pnlCnt.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM_CNT_DETAILS');
  lblCntHint.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM_CNT_HINT');
  pnlAvgInterval.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM_AVG_INTERVAL_DETAILS');
  lblAvgInterval.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM_AVG_INTERVAL_HINT');
  pnlUniformity.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM_UNIFORMITY_DETAILS');
  lblUniformity.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER_RYTHM_UNIFORMITY_HINT');
  lblDrawsCountTitle.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'DRAWS_COUNT');
end;

procedure TfrmNumberRythm.DataSourceDataChange(Sender: TObject; Field: TField);
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

procedure TfrmNumberRythm.DBGridDrawColumnCell(Sender: TObject;
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

procedure TfrmNumberRythm.DBGridTitleClick(Column: TColumn);
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

procedure TfrmNumberRythm.LoadData;
begin
  FDQuery.Close;
  FDQuery.ParamByName('p_lottery_id').AsInteger := FLottery.ID;
  FDQuery.ParamByName('p_start_date').AsDate := DM.PeriodFrom;
  FDQuery.ParamByName('p_end_date').AsDate := DM.PeriodTo;
  FDQuery.ParamByName('p_number_kind').AsString := FNumberKind;
  FDQuery.Open;
end;

end.
