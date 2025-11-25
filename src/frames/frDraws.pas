unit frDraws;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Generics.Collections, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids,
  dmMain, uTranslations,
  fDrawEdit, uDateUtils, uDraw, uGrids, uLottery;

type
  TfrmDraws = class(TFrame, ITranslatable)
    pnlContainer: TPanel;
    lblTitle: TLabel;
    grdData: TDrawGrid;
    pnlButtons: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    procedure grdDataDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure grdDataSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
  private
    FLottery: TLottery;
    FDraws: TList<TDraw>;
    function GetSelectedDraw: TDraw;
  public
    procedure ApplyLanguage;
    procedure SetData(ALottery: TLottery);
  end;

implementation

{$R *.dfm}

procedure TfrmDraws.SetData(ALottery: TLottery);
begin
  FLottery := ALottery;
  FDraws := DM.GetDraws(FLottery.ID);
  ApplyLanguage;

  grdData.ColCount := 1 + FLottery.MainCount + FLottery.ExtraCount;
  grdData.RowCount := FDraws.Count;
  grdData.DoubleBuffered := True;
  grdData.ColWidths[0] := 85;
end;

procedure TfrmDraws.btnAddClick(Sender: TObject);
var fmDrawEdit: TfmDrawEdit;
begin
  fmDrawEdit := TfmDrawEdit.Create(Self, FLottery, nil);
  try
    if fmDrawEdit.ShowModal = mrOk then
    begin
      SetData(FLottery);
      grdData.Invalidate;
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
      SetData(FLottery);
      grdData.Invalidate;
    end;
  finally
    fmDrawEdit.Free;
  end;
end;

procedure TfrmDraws.grdDataDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
var
  Num: Integer;
begin
  if ARow >= FDraws.Count then Exit;
  grdData.Canvas.Brush.Color := clWindow;
  grdData.Canvas.FillRect(Rect);

  if ACol = 0 then
  begin
    grdData.Canvas.Font.Style := [fsBold];
    TGrids.CenterText(grdData.Canvas, Rect, TDateUtils.FormatDate(FDraws[ARow].DrawDate));
  end
  else if (ACol >= 1) and (ACol <= FLottery.MainCount) then
  begin
    Num := FDraws[ARow].MainNumbersArr[ACol-1];
    TGrids.DrawCircle(grdData.Canvas, Rect, IntToStr(Num), 'main');
  end
  else
  begin
    var ExtraIndex := ACol - FLottery.MainCount - 1;
    if ExtraIndex <= High(FDraws[ARow].ExtraNumbersArr) then
    begin
      Num := FDraws[ARow].ExtraNumbersArr[ExtraIndex];
      TGrids.DrawCircle(grdData.Canvas, Rect, IntToStr(Num), 'extra');
    end;
  end
end;

procedure TfrmDraws.grdDataSelectCell(Sender: TObject; ACol, ARow: LongInt;
  var CanSelect: Boolean);
begin
  btnEdit.Enabled := (ARow >= 0) and (ARow < FDraws.Count);
end;

function TfrmDraws.GetSelectedDraw: TDraw;
begin
  if (grdData.Row >= 0) and (grdData.Row < FDraws.Count) then
    Result := FDraws[grdData.Row]
  else
    Result := nil;
end;

procedure TfrmDraws.ApplyLanguage;
begin
  lblTitle.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'DRAW_RESULTS');
  btnAdd.Caption :=  TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'BTN_ADD');
  btnEdit.Caption :=  TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'BTN_EDIT');
end;

end.
