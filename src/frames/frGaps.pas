unit frGaps;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  dmMain, uLottery,
  uTranslations, uDateUtils, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids

  ;

type
  TfrmGaps = class(TFrame, ITranslatable)
    pnlContainer: TPanel;
    lblTitle: TLabel;
    pnlPeriod: TPanel;
    lblPeriod: TLabel;
    lblPeriodValue: TLabel;
    pgcGaps: TPageControl;
    tbsTable: TTabSheet;
    tbsChart: TTabSheet;
    tbsHeatMap: TTabSheet;
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    FDQuery: TFDQuery;
    FDQueryNUMBER: TSmallintField;
    FDQueryGAP: TIntegerField;
    FDQueryLAST_DRAW_DATE: TDateField;
    procedure DBGridTitleClick(Column: TColumn);
  private
    FLottery: TLottery;
    FOrderBy: string;
    FSelectedField: string;
    procedure LoadNumberGaps;
  public
    procedure ApplyLanguage;
    procedure SetData(ALottery: TLottery);
  end;

implementation

{$R *.dfm}

procedure TfrmGaps.SetData(ALottery: TLottery);
begin
  FLottery := ALottery;

  lblPeriodValue.Caption := TDateUtils.FormatDate(DM.PeriodFrom) +
    ' - ' + TDateUtils.FormatDate(DM.PeriodTo);
  ApplyLanguage;
  LoadNumberGaps;
  FOrderBy := 'ASC';
  FSelectedField := 'NUMBER';
end;

procedure TfrmGaps.ApplyLanguage;
begin
  lblTitle.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'DRAW_GAPS');
  lblPeriod.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'PERIOD');

  tbsTable.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'TABLE');
  tbsChart.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'CHART');
  tbsHeatMap.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'HEATMAP');

  DBGrid.Columns[0].Title.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'NUMBER');
  DBGrid.Columns[1].Title.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'GAP');
  DBGrid.Columns[2].Title.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'DATE');
end;

procedure TfrmGaps.DBGridTitleClick(Column: TColumn);
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
    'SELECT NUMBER, GAP, LAST_DRAW_DATE ' +
    'FROM GET_NUMBER_GAPS(:P_LOTTERY_ID, :P_START_DATE, :P_END_DATE) ' +
    'ORDER BY ' + FSelectedField + ' ' + FOrderBy;
  FDQuery.Open;
end;

procedure TfrmGaps.LoadNumberGaps;
begin
  FDQuery.Close;
  FDQuery.ParamByName('p_lottery_id').AsInteger := FLottery.ID;
  FDQuery.ParamByName('p_start_date').AsDate := DM.PeriodFrom;
  FDQuery.ParamByName('p_end_date').AsDate := DM.PeriodTo;
  FDQuery.Open;
end;

end.
