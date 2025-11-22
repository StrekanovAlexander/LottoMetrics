unit dmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, Vcl.Dialogs, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.Generics.Collections,
  uLottery;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FBDriverLink: TFDPhysFBDriverLink;
    FDQuerySelect: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FLotteries: TList<TLottery>;
  public
    function GetLotteries: TList<TLottery>;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDM.GetLotteries: TList<TLottery>;
begin
  FDQuerySelect.Close;
  FDQuerySelect.SQL.Text := 'SELECT l.id, l.country_id, l.lottery_name, ' +
    'l.main_count, l.main_start, l.main_finish, l.extra_count, ' +
    'l.extra_start, l.extra_finish, c.iso_code ' +
    'FROM lotteries l INNER JOIN countries c ON l.country_id = c.id ' +
    'ORDER BY l.lottery_name';
  FDQuerySelect.Open;

  for var L in FLotteries do
    L.Free;
  FLotteries.Clear;

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

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  // Developer mode

  FBDriverLink.VendorLib := ExtractFilePath(ParamStr(0)) + 'data\fbclient.dll';
  FDConnection.Params.Add('Database=' + ExtractFilePath(ParamStr(0)) + 'data\LOTTOMETRICS.FDB');

  FLotteries := TList<TLottery>.Create;

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

  if Assigned(FLotteries) then
  begin
    for var L in FLotteries do
      L.Free;
    FLotteries.Clear;
  end;

end;

end.
