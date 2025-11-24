unit uLotteryRepo;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client, uLottery;

function FetchLotteries(Query: TFDQuery): TList<TLottery>;

implementation

function FetchLotteries(Query: TFDQuery): TList<TLottery>;
var
  Lotteries: TList<TLottery>;
begin
  Lotteries := TList<TLottery>.Create;

  Query.Close;
  Query.SQL.Text :=
    'SELECT l.id,l.country_id, l.lottery_name, ' +
    'l.main_count, l.main_start, l.main_finish, l.extra_count, ' +
    'l.extra_start, l.extra_finish, c.iso_code ' +
    'FROM lotteries l INNER JOIN countries c ON l.country_id = c.id ' +
    'ORDER BY l.lottery_name';
  Query.Open;

  while not Query.Eof do
  begin
    Lotteries.Add(TLottery.Create(
      Query.FieldByName('id').AsInteger,
      Query.FieldByName('country_id').AsInteger,
      Query.FieldByName('lottery_name').AsString,
      Query.FieldByName('main_count').AsInteger,
      Query.FieldByName('main_start').AsInteger,
      Query.FieldByName('main_finish').AsInteger,
      Query.FieldByName('extra_count').AsInteger,
      Query.FieldByName('extra_start').AsInteger,
      Query.FieldByName('extra_finish').AsInteger,
      Query.FieldByName('iso_code').AsString
    ));
    Query.Next;
  end;

  Result := Lotteries;
end;

end.
