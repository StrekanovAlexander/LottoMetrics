unit uBall;

interface

uses
  System.SysUtils, System.Classes, System.Types, Vcl.Controls, Vcl.Graphics,
  Winapi.Windows;

type
  TBall = class(TCustomControl)
  private
    FNumber: Integer;
    FIsSuper: Boolean;
    procedure SetNumber(Value: Integer);
    procedure SetIsSuper(Value: Boolean);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    property Number: Integer read FNumber write SetNumber;
    property IsSuper: Boolean read FIsSuper write SetIsSuper;
  end;

implementation

{ TBall }

constructor TBall.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 30;
  Height := 30;
  AlignWithMargins := True;
  Align := alLeft;
  Margins.Left := 5;
  Margins.Right := 5;
  Margins.Top := 0;
  Margins.Bottom := 0;

end;

procedure TBall.SetNumber(Value: Integer);
begin
  FNumber := Value;
  Invalidate;
end;

procedure TBall.SetIsSuper(Value: Boolean);
begin
  FIsSuper := Value;
  Invalidate;
end;

procedure TBall.Paint;
var
  R: TRect;
  ShadowColor: TColor;
  Txt: string;
begin
  R := ClientRect;

  if FIsSuper then
    begin
      ShadowColor := RGB(230, 180, 130);
      Canvas.Brush.Color := ShadowColor;
      Canvas.Pen.Style := psClear;
      Canvas.Ellipse(R.Left, R.Top+2, R.Right, R.Bottom+2);

      Canvas.Brush.Color := RGB(255, 200, 150);
      // Canvas.Pen.Color := RGB(220, 170, 120);
      Canvas.Ellipse(R);
    end
  else
    begin
      ShadowColor := RGB(170, 200, 200);
      Canvas.Brush.Color := ShadowColor;
      Canvas.Pen.Style := psClear;
      Canvas.Ellipse(R.Left, R.Top+2, R.Right, R.Bottom+2);

      Canvas.Brush.Color := RGB(200, 230, 230);
      // Canvas.Pen.Color := RGB(160, 190, 190);
      Canvas.Ellipse(R);
    end;

  Canvas.Pen.Style := psClear;
  Canvas.Ellipse(R);
  Canvas.Font.Size := 11;
  Canvas.Font.Style := [fsBold];

  Txt := FNumber.ToString;

  DrawText(Canvas.Handle, PChar(Txt), Length(Txt),
    R, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
end;

end.
