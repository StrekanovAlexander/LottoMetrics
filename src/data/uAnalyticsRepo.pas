unit uAnalyticsRepo;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client,
  uLanguage, uAnalyticRecords;

function FetchSingleNumberFrequency(Query: TFDQuery; LotteryId: Integer;
  PeriodFrom, PeriodTo: TDate): TList<TNumberFrequency>;

function FetchExtraNumberFrequency(Query: TFDQuery; LotteryId: Integer;
  PeriodFrom, PeriodTo: TDate): TList<TNumberFrequency>;

function FetchPairNumberFrequency(Query: TFDQuery; LotteryId: Integer;
  PeriodFrom, PeriodTo: TDate): TList<TNumberFrequency>;

function FetchTripletNumberFrequency(Query: TFDQuery; LotteryId: Integer;
  PeriodFrom, PeriodTo: TDate): TList<TNumberFrequency>;

{
function FetchGaps(Query: TFDQuery; LotteryId: Integer; PeriodFrom, PeriodTo: TDate): TList<TNumberGap>;
}

implementation

function FetchSingleNumberFrequency(Query: TFDQuery; LotteryId: Integer;
  PeriodFrom, PeriodTo: TDate): TList<TNumberFrequency>;
var
  List: TList<TNumberFrequency>;
  Item: TNumberFrequency;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT number, frequency FROM get_single_number_frequency' +
    '(:lottery_id, :period_from, :period_to)';
  Query.ParamByName('lottery_id').AsInteger := LotteryId;
  Query.ParamByName('period_from').AsDateTime := PeriodFrom;
  Query.ParamByName('period_to').AsDateTime := PeriodTo;
  Query.Open;

  List := TList<TNumberFrequency>.Create;

  while not Query.Eof do
  begin
    Item.Numbers := TArray<Integer>.Create(Query.FieldByName('number').AsInteger);
    Item.Frequency := Query.FieldByName('frequency').AsInteger;
    List.Add(Item);
    Query.Next;
  end;

  Result := List;
end;

function FetchExtraNumberFrequency(Query: TFDQuery; LotteryId: Integer;
  PeriodFrom, PeriodTo: TDate): TList<TNumberFrequency>;
var
  List: TList<TNumberFrequency>;
  Item: TNumberFrequency;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT number, frequency FROM get_single_number_frequency' +
    '(:lottery_id, :period_from, :period_to)';
  Query.ParamByName('lottery_id').AsInteger := LotteryId;
  Query.ParamByName('period_from').AsDateTime := PeriodFrom;
  Query.ParamByName('period_to').AsDateTime := PeriodTo;
  Query.Open;

  List := TList<TNumberFrequency>.Create;

  while not Query.Eof do
  begin
    Item.Numbers := TArray<Integer>.Create(Query.FieldByName('number').AsInteger);
    Item.Frequency := Query.FieldByName('frequency').AsInteger;
    List.Add(Item);
    Query.Next;
  end;

  Result := List;
end;

function FetchPairNumberFrequency(Query: TFDQuery; LotteryId: Integer;
  PeriodFrom, PeriodTo: TDate): TList<TNumberFrequency>;
var
  List: TList<TNumberFrequency>;
  Item: TNumberFrequency;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT number1, number2, frequency FROM get_pair_number_frequency' +
    '(:lottery_id, :period_from, :period_to)';
  Query.ParamByName('lottery_id').AsInteger := LotteryId;
  Query.ParamByName('period_from').AsDateTime := PeriodFrom;
  Query.ParamByName('period_to').AsDateTime := PeriodTo;
  Query.Open;

  List := TList<TNumberFrequency>.Create;

  while not Query.Eof do
  begin
    Item.Numbers := TArray<Integer>.Create(
      Query.FieldByName('number1').AsInteger,
      Query.FieldByName('number2').AsInteger
    );
    Item.Frequency := Query.FieldByName('frequency').AsInteger;
    List.Add(Item);
    Query.Next;
  end;

  Result := List;
end;

function FetchTripletNumberFrequency(Query: TFDQuery; LotteryId: Integer;
  PeriodFrom, PeriodTo: TDate): TList<TNumberFrequency>;
var
  List: TList<TNumberFrequency>;
  Item: TNumberFrequency;
begin
  Query.Close;
  Query.SQL.Text := 'SELECT number1, number2, number3, frequency FROM get_triplet_number_frequency' +
    '(:lottery_id, :period_from, :period_to)';
  Query.ParamByName('lottery_id').AsInteger := LotteryId;
  Query.ParamByName('period_from').AsDateTime := PeriodFrom;
  Query.ParamByName('period_to').AsDateTime := PeriodTo;
  Query.Open;

  List := TList<TNumberFrequency>.Create;

  while not Query.Eof do
  begin
    Item.Numbers := TArray<Integer>.Create(
      Query.FieldByName('number1').AsInteger,
      Query.FieldByName('number2').AsInteger,
      Query.FieldByName('number3').AsInteger
    );
    Item.Frequency := Query.FieldByName('frequency').AsInteger;
    List.Add(Item);
    Query.Next;
  end;

  Result := List;
end;


{
function FetchGaps(Query: TFDQuery; LotteryId: Integer; PeriodFrom, PeriodTo: TDate): TList<TNumberGap>;
var List: TList<TNumberGap>;
  Item: TNumberGap;
begin
   Query.Close;
   Query.SQL.Text := 'SELECT number, gap, last_draw_date FROM get_number_gaps' +
    '(:lottery_id, :period_from, :period_to)';
  Query.ParamByName('lottery_id').AsInteger := LotteryId;
  Query.ParamByName('period_from').AsDateTime := PeriodFrom;
  Query.ParamByName('period_to').AsDateTime := PeriodTo;
  Query.Open;

  List := TList<TNumberGap>.Create;

  while not Query.Eof do
  begin
    Item.Number := Query.FieldByName('number').AsInteger;
    Item.Gap := Query.FieldByName('gap').AsInteger;
    Item.LastDrawDate := Query.FieldByName('last_draw_date').AsDateTime;
    List.Add(Item);
    Query.Next;
  end;

  Result := List;
end;
}


end.
