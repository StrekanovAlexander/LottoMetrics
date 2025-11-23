unit dmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, Vcl.Dialogs, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.Generics.Collections,
  uLottery, uDraw;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FBDriverLink: TFDPhysFBDriverLink;
    FDQuerySelect: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FLotteries: TList<TLottery>;
    FDraws: TList<TDraw>;
    FPeriodFrom: TDate;
    FPeriodTo: TDate;
  public
    procedure SetPeriod(APeriodFrom, APeriodTo: TDate);
    function GetLotteries: TList<TLottery>;
    function GetDraws(ALotteryId: Integer): TList<TDraw>;
    procedure FreeAndClear<T: class>(List: TList<T>);
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.SetPeriod(APeriodFrom: TDate; APeriodTo: TDate);
begin
  FPeriodFrom := APeriodFrom;
  FPeriodTo := APeriodTo;
end;

function TDM.GetLotteries: TList<TLottery>;
begin
  FDQuerySelect.Close;
  FDQuerySelect.SQL.Text := 'SELECT l.id, l.country_id, l.lottery_name, ' +
    'l.main_count, l.main_start, l.main_finish, l.extra_count, ' +
    'l.extra_start, l.extra_finish, c.iso_code ' +
    'FROM lotteries l INNER JOIN countries c ON l.country_id = c.id ' +
    'ORDER BY l.lottery_name';
  FDQuerySelect.Open;

  FreeAndClear<TLottery>(FLotteries);

  while not FDQuerySelect.Eof do
  begin
    FLotteries.Add(TLottery.Create(
      FDQuerySelect.FieldByName('id').AsInteger,
      FDQuerySelect.FieldByName('country_id').AsInteger,
      FDQuerySelect.FieldByName('lottery_name').AsString,
      FDQuerySelect.FieldByName('main_count').AsInteger,
      FDQuerySelect.FieldByName('main_start').AsInteger,
      FDQuerySelect.FieldByName('main_finish').AsInteger,
      FDQuerySelect.FieldByName('extra_count').AsInteger,
      FDQuerySelect.FieldByName('extra_start').AsInteger,
      FDQuerySelect.FieldByName('extra_finish').AsInteger,
      FDQuerySelect.FieldByName('iso_code').AsString
    ));
    FDQuerySelect.Next;
  end;

  Result := FLotteries;
end;

function TDM.GetDraws(ALotteryId: Integer): TList<TDraw>;
begin

  FDQuerySelect.Close;
  FDQuerySelect.SQL.Text := 'SELECT id, lottery_id, draw_date, main_numbers, extra_numbers ' +
    'FROM draws WHERE lottery_id = :lottery_id AND draw_date BETWEEN :period_from AND :period_to ' +
    'ORDER BY draw_date DESC';

  FDQuerySelect.ParamByName('lottery_id').AsInteger := ALotteryId;
  FDQuerySelect.ParamByName('period_from').AsDate := FPeriodFrom;
  FDQuerySelect.ParamByName('period_to').AsDate := FPeriodTo;

  FDQuerySelect.Open;

  FreeAndClear<TDraw>(FDraws);

  while not FDQuerySelect.Eof do
  begin
    FDraws.Add(TDraw.Create(
      FDQuerySelect.FieldByName('id').AsInteger,
      FDQuerySelect.FieldByName('lottery_id').AsInteger,
      FDQuerySelect.FieldByName('draw_date').AsDateTime,
      FDQuerySelect.FieldByName('main_numbers').AsString,
      FDQuerySelect.FieldByName('extra_numbers').AsString
    ));
    FDQuerySelect.Next;
  end;

  Result := FDraws;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  // Developer mode

  FBDriverLink.VendorLib := ExtractFilePath(ParamStr(0)) + 'data\fbclient.dll';
  FDConnection.Params.Add('Database=' + ExtractFilePath(ParamStr(0)) + 'data\LOTTOMETRICS.FDB');

  FLotteries := TList<TLottery>.Create;
  FDraws := TList<TDraw>.Create;

  try
    FDConnection.Connected := True;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if FDConnection.Connected then
    FDConnection.Connected := False;

  FreeAndClear<TLottery>(FLotteries);
  FreeAndClear<TDraw>(FDraws);
end;

procedure TDM.FreeAndClear<T>(List: TList<T>);
var
  Item: T;
begin
  if Assigned(List) then
  begin
    for Item in List do
      Item.Free;
    List.Clear;
  end;
end;

end.
