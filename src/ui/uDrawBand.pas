unit uDrawBand;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Graphics,
  uDraw, uBall, uDateUtils;

type
  TDrawBand = class
  public
    class procedure Add(ADraw: TDraw; AOwner: TWinControl); static;
  end;

implementation

{ TDrawBand }

class procedure TDrawBand.Add(ADraw: TDraw; AOwner: TWinControl);
var
  pnlDraw, pnlBalls: TPanel;
  pnlDate: TPanel;
  Ball: TBall;
  i: Integer;
begin
  pnlDraw := TPanel.Create(AOwner);

  with pnlDraw do
  begin
    Parent := AOwner;
    Align := alTop;
    Height := 30;
    BevelOuter := bvNone;
    Margins.Bottom := 10;
    AlignWithMargins := True;
  end;

  pnlDate := TPanel.Create(pnlDraw);

  with pnlDate do
  begin
    Parent := pnlDraw;
    Align := alLeft;
    Alignment := taLeftJustify;
    BevelOuter := bvNone;
    Width := 85;
    Caption := TDateUtils.FormatDate(ADraw.DrawDate);
    Font.Name   := 'Segoe UI Normal';
    Font.Height := -16;
    Font.Style  := [];
    
    Margins.Top := 0;
    Margins.Right := 10;
    Margins.Bottom := 0;
    Margins.Left := 0;
    AlignWithMargins := True;
  end;

  pnlBalls := TPanel.Create(pnlDraw);

  with pnlBalls do
  begin
    Parent := pnlDraw;
    Align := alClient;
    BevelOuter := bvNone;
    ParentBackground := False;
    Color := clWindow;
  end;

  for i := 0 to High(ADraw.MainNumbersArr) do
  begin
    Ball := TBall.Create(pnlBalls);
    Ball.Parent := pnlBalls;
    Ball.Number := ADraw.MainNumbersArr[i];
    Ball.IsSuper := False;
  end;

  for i := 0 to High(ADraw.ExtraNumbersArr) do
  begin
    Ball := TBall.Create(pnlBalls);
    Ball.Parent := pnlBalls;
    Ball.Number := ADraw.ExtraNumbersArr[i];
    Ball.IsSuper := True;
  end;
end;

end.
