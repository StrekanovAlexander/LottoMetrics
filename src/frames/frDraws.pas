unit frDraws;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Generics.Collections, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids,
  dmMain, uDateUtils, uDraw, uGrids, uLottery;

type
  TfrmDraws = class(TFrame)
    pnlContainer: TPanel;
    lblTitle: TLabel;
    drgDraws: TDrawGrid;
    pnlButtons: TPanel;
    btnAdd: TButton;
    procedure drgDrawsDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
  private
    FLottery: TLottery;
    FDraws: TList<TDraw>;
  public
    procedure SetDraws(ALottery: TLottery);
  end;

implementation

{$R *.dfm}

procedure TfrmDraws.SetDraws(ALottery: TLottery);
begin
  FLottery := ALottery;
  FDraws := DM.GetDraws(FLottery.ID);
  lblTitle.Caption := 'Результаты розыгрышей "' + FLottery.ToString + '"';

  with drgDraws do
  begin
    ColCount := 1 + FLottery.MainCount + FLottery.ExtraCount;
    RowCount := FDraws.Count;
    DoubleBuffered := True;
    ColWidths[0] := 100;
  end;

end;

procedure TfrmDraws.drgDrawsDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
var
  Num: Integer;
begin
  if ARow >= FDraws.Count then Exit;
  drgDraws.Canvas.Brush.Color := clWindow;
  drgDraws.Canvas.FillRect(Rect);

  if ACol = 0 then
    TGrids.CenterText(drgDraws.Canvas, Rect, TDateUtils.FormatDate(FDraws[ARow].DrawDate))
  else if (ACol >= 1) and (ACol <= FLottery.MainCount) then
  begin
    Num := FDraws[ARow].MainNumbersArr[ACol-1];
    TGrids.DrawCircle(drgDraws.Canvas, Rect, IntToStr(Num), 'main');
  end
  else
  begin
    var ExtraIndex := ACol - FLottery.MainCount - 1;
    if ExtraIndex <= High(FDraws[ARow].ExtraNumbersArr) then
    begin
      Num := FDraws[ARow].ExtraNumbersArr[ExtraIndex];
      TGrids.DrawCircle(drgDraws.Canvas, Rect, IntToStr(Num), 'extra');
    end;
  end
end;

end.
