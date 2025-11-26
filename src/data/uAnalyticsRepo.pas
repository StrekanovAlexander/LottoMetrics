unit uAnalyticsRepo;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  uLanguage, uAnalyticRecords;

function FetchNumberFrequency(Query: TFDQuery; LotteryId: Integer;
  PeriodFrom, PeriodTo: TDate): TList<TNumberFrequency>;


implementation

function FetchNumberFrequency(Query: TFDQuery; LotteryId: Integer;
  PeriodFrom, PeriodTo: TDate): TList<TNumberFrequency>;
var
  List: TList<TNumberFrequency>;
  Item: TNumberFrequency;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT number, frequency FROM get_number_frequency(:lottery_id, :period_from, :period_to)';

  Query.ParamByName('lottery_id').AsInteger := LotteryId;
  Query.ParamByName('period_from').AsDateTime := PeriodFrom;
  Query.ParamByName('period_to').AsDateTime := PeriodTo;
  Query.Open;

  List := TList<TNumberFrequency>.Create;

  while not Query.Eof do
  begin
    Item.Number := Query.FieldByName('number').AsInteger;
    Item.Frequency := Query.FieldByName('frequency').AsInteger;
    List.Add(Item);
    Query.Next;
  end;

  Result := List;
end;

end.
