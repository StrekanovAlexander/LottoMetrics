unit uGrids;

interface

uses
  System.SysUtils, System.Math, System.Types, Vcl.Graphics, Winapi.Windows;

type TGrids = class
  private
    const COLOR_MAIN  = TColor($00FADCB4);
    const COLOR_EXTRA = TColor($008CA0F0);
    class function GetColor(const Name: string): TColor;
  public
    class procedure CenterText(C: TCanvas; const R: TRect; const S: string);
    class procedure DrawCircle(C: TCanvas; const R: TRect; Number: string;
      const ColorName: string);
end;

implementation

class function TGrids.GetColor(const Name: string): TColor;
begin
   if SameText(Name, 'main') then
    Result := COLOR_MAIN
  else if SameText(Name, 'extra') then
    Result := COLOR_EXTRA
  else
    Result := clGray;
end;

class procedure TGrids.CenterText(C: TCanvas; const R: TRect; const S: string);
var
  R2: TRect;
begin
  R2 := R;
  DrawText(C.Handle, PChar(S), Length(S), R2, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
end;

class procedure TGrids.DrawCircle(C: TCanvas; const R: TRect; Number: string;
  const ColorName: string);
var
  CircleRect: TRect;
  Diameter: Integer;
begin
  Diameter := Min(R.Right - R.Left, R.Bottom - R.Top) - 10;

  CircleRect.Left   := R.Left + ((R.Right - R.Left) - Diameter) div 2;
  CircleRect.Top    := R.Top + ((R.Bottom - R.Top) - Diameter) div 2;
  CircleRect.Right  := CircleRect.Left + Diameter;
  CircleRect.Bottom := CircleRect.Top + Diameter;

  C.Brush.Color := GetColor(ColorName);
  C.Pen.Color := clSilver;
  C.Ellipse(CircleRect);

  C.Font.Style := [fsBold];
  C.Font.Color := clBlack;

  DrawText(C.Handle, PChar(Number), -1, CircleRect,
    DT_CENTER or DT_VCENTER or DT_SINGLELINE);
end;
end.
