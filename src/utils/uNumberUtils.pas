unit uNumberUtils;

interface

uses System.SysUtils;

type TNumberUtils = class
  class function ParseNumbers(const s: string): TArray<Integer>;
end;

implementation

class function TNumberUtils.ParseNumbers(const s: string): TArray<Integer>;
var
  Parts: TArray<string>;
  i: Integer;
begin
  Parts := s.Split([',']);
  SetLength(Result, Length(Parts));
  for i := 0 to High(Parts) do
    Result[i] := StrToInt(Trim(Parts[i]));
end;

end.
