unit uColors;

interface

uses
  Vcl.Graphics, Winapi.Windows;

type TColors = class
  class function DarkerColor(const C: TColor; Percent: Byte = 20): TColor;
end;

implementation

class function TColors.DarkerColor(const C: TColor; Percent: Byte = 20): TColor;
var
  R, G, B: Byte;
begin
  R := GetRValue(ColorToRGB(C));
  G := GetGValue(ColorToRGB(C));
  B := GetBValue(ColorToRGB(C));

  R := MulDiv(R, 100 - Percent, 100);
  G := MulDiv(G, 100 - Percent, 100);
  B := MulDiv(B, 100 - Percent, 100);

  Result := RGB(R, G, B);
end;

end.
