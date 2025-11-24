unit frDraws;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Generics.Collections, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids,
  dmMain, uTranslations,
  fDrawEdit, uDateUtils, uDraw, uGrids, uLottery;

type
  TfrmDraws = class(TFrame)
    pnlContainer: TPanel;
    lblTitle: TLabel;
    drgDraws: TDrawGrid;
    pnlButtons: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    procedure drgDrawsDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure drgDrawsSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
  private
    FLottery: TLottery;
    FDraws: TList<TDraw>;
    function GetSelectedDraw: TDraw;
  public
    procedure ApplyTranslations;
    procedure SetDraws(ALottery: TLottery);
  end;

implementation

{$R *.dfm}


procedure TfrmDraws.SetDraws(ALottery: TLottery);
begin
  FLottery := ALottery;
  FDraws := DM.GetDraws(FLottery.ID);
  ApplyTranslations;

  with drgDraws do
  begin
    ColCount := 1 + FLottery.MainCount + FLottery.ExtraCount;
    RowCount := FDraws.Count;
    DoubleBuffered := True;
    ColWidths[0] := 100;
  end;

end;

procedure TfrmDraws.btnAddClick(Sender: TObject);
var fmDrawEdit: TfmDrawEdit;
begin
  fmDrawEdit := TfmDrawEdit.Create(Self, FLottery, nil);
  try
    if fmDrawEdit.ShowModal = mrOk then
    begin
      SetDraws(FLottery);
      drgDraws.Invalidate;
    end;
  finally
    fmDrawEdit.Free;
  end;
end;

procedure TfrmDraws.btnEditClick(Sender: TObject);
var fmDrawEdit: TfmDrawEdit;
  Draw: TDraw;
begin
  Draw := GetSelectedDraw;
  if not Assigned(Draw) then
    Exit;

  fmDrawEdit := TfmDrawEdit.Create(Self, FLottery, Draw);
  try
    if fmDrawEdit.ShowModal = mrOk then
    begin
      SetDraws(FLottery);
      drgDraws.Invalidate;
    end;
  finally
    fmDrawEdit.Free;
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

procedure TfrmDraws.drgDrawsSelectCell(Sender: TObject; ACol, ARow: LongInt;
  var CanSelect: Boolean);
begin
  btnEdit.Enabled := (ARow >= 0) and (ARow < FDraws.Count);
end;

function TfrmDraws.GetSelectedDraw: TDraw;
begin
  if (drgDraws.Row >= 0) and (drgDraws.Row < FDraws.Count) then
    Result := FDraws[drgDraws.Row]
  else
    Result := nil;
end;

procedure TfrmDraws.ApplyTranslations;
begin
  lblTitle.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'DRAW_RESULTS');
  btnAdd.Caption :=  TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'BTN_ADD');
  btnEdit.Caption :=  TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'BTN_EDIT');
end;

end.
