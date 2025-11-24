unit uDrawRepo;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client, uDraw, uLottery;

function FetchDraws(Query: TFDQuery; LotteryId: Integer; PeriodFrom, PeriodTo: TDate): TList<TDraw>;
procedure InsertDraw(Query: TFDQuery; LotteryId: Integer; DrawDate: TDateTime; const MainNumbers: string; const ExtraNumbers: string);
procedure EditDraw(Query: TFDQuery; DrawId: Integer; DrawDate: TDateTime; const MainNumbers: string; const ExtraNumbers: string);

implementation

function FetchDraws(Query: TFDQuery; LotteryId: Integer; PeriodFrom, PeriodTo: TDate): TList<TDraw>;
var
  Draws: TList<TDraw>;
begin
  Draws := TList<TDraw>.Create;

  Query.Close;
  Query.SQL.Text := 'SELECT id, lottery_id, draw_date, main_numbers, extra_numbers ' +
    'FROM draws WHERE lottery_id = :lottery_id AND draw_date BETWEEN :period_from AND :period_to ' +
    'ORDER BY draw_date DESC, id DESC';
  Query.ParamByName('lottery_id').AsInteger := LotteryId;
  Query.ParamByName('period_from').AsDate := PeriodFrom;
  Query.ParamByName('period_to').AsDate := PeriodTo;
  Query.Open;

  while not Query.Eof do
  begin
    Draws.Add(TDraw.Create(
      Query.FieldByName('id').AsInteger,
      Query.FieldByName('lottery_id').AsInteger,
      Query.FieldByName('draw_date').AsDateTime,
      Query.FieldByName('main_numbers').AsString,
      Query.FieldByName('extra_numbers').AsString
    ));
    Query.Next;
  end;

  Result := Draws;
end;

procedure InsertDraw(Query: TFDQuery; LotteryId: Integer; DrawDate: TDateTime; const MainNumbers: string; const ExtraNumbers: string);
begin
  Query.SQL.Text := 'EXECUTE PROCEDURE add_draw' +
    '(:lottery_id, :draw_date, :main_numbers, :extra_numbers)';
  Query.ParamByName('lottery_id').AsInteger := LotteryId;
  Query.ParamByName('draw_date').AsDate := DrawDate;
  Query.ParamByName('main_numbers').AsString := MainNumbers;
  Query.ParamByName('extra_numbers').AsString := ExtraNumbers;
  Query.Open;
end;

procedure EditDraw(Query: TFDQuery; DrawId: Integer; DrawDate: TDateTime; const MainNumbers: string; const ExtraNumbers: string);
begin
  Query.SQL.Text := 'EXECUTE PROCEDURE update_draw ' +
    '(:draw_id, :draw_date, :main_numbers, :extra_numbers)';
  Query.ParamByName('draw_id').AsInteger := DrawId;
  Query.ParamByName('draw_date').AsDate := DrawDate;
  Query.ParamByName('main_numbers').AsString := MainNumbers;
  Query.ParamByName('extra_numbers').AsString := ExtraNumbers;
  Query.ExecSQL;
end;

end.
