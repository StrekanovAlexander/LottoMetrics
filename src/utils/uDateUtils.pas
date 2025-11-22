unit uDateUtils;

interface

uses System.SysUtils;

type TDateUtils = class
  class function FormatDate(ADate: TDate): string;
end;

implementation

class function TDateUtils.FormatDate(ADate: TDate): string;
begin
  Result := FormatDateTime('dd"."mm"."yyyy', ADate);
end;

end.
