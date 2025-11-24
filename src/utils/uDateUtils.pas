unit uDateUtils;

interface

uses System.SysUtils;

type TDateUtils = class
  class function FormatDate(ADate: TDate): string;
  class procedure GetCurrentMonthPeriod(out AStartDate: TDate; out AEndDate: TDate);
end;

implementation

class function TDateUtils.FormatDate(ADate: TDate): string;
begin
  Result := FormatDateTime('dd"."mm"."yyyy', ADate);
end;

class procedure TDateUtils.GetCurrentMonthPeriod(out AStartDate: TDate; out AEndDate: TDate);
var
  Y, M, D: Word;
begin
  DecodeDate(Date, Y, M, D);
  AStartDate := EncodeDate(Y, M, 1);
  if M = 12 then
    AEndDate := EncodeDate(Y + 1, 1, 1) - 1
  else
    AEndDate := EncodeDate(Y, M + 1, 1) - 1;
end;

end.
