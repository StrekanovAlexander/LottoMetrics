unit uGrids;

interface

uses
  System.SysUtils, System.Math, System.Types, Vcl.Graphics, Winapi.Windows;

type TGrids = class
  private
  public
    class procedure CenterText(C: TCanvas; const R: TRect; const S: string);
    class procedure DrawCircle(C: TCanvas; const R: TRect; Number: string;
      const ColorName: string);
end;

implementation

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
  Diameter := Min(R.Right - R.Left, R.Bottom - R.Top) - 8;

  CircleRect.Left   := R.Left + ((R.Right - R.Left) - Diameter) div 2;
  CircleRect.Top    := R.Top + ((R.Bottom - R.Top) - Diameter) div 2;
  CircleRect.Right  := CircleRect.Left + Diameter;
  CircleRect.Bottom := CircleRect.Top + Diameter;

  C.Brush.Color := clWhite;

  if SameText(ColorName, 'extra') then
    C.Pen.Color := clRed
  else
    C.Pen.Color := clBlack;

  C.Ellipse(CircleRect);

  C.Font.Style := [fsBold];

  if SameText(ColorName, 'extra') then
    C.Font.Color := clRed
  else
    C.Font.Color := clBlack;

  DrawText(C.Handle, PChar(Number), -1, CircleRect,
    DT_CENTER or DT_VCENTER or DT_SINGLELINE);
end;
end.
