unit frFrequency;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.Buttons, Vcl.StdCtrls, System.Threading,

  dmMain, fWait,
  uLottery, uTranslations,
  uDateUtils, uGrids,
  uAnalyticRecords
  ;

type
  TFrequencyMode = (frSingle, frPairs, frTriplets, frBonus);

  TfrmFrequency = class(TFrame, ITranslatable)
    pnlContainer: TPanel;
    lblTitle: TLabel;
    pnlModes: TPanel;
    btnSingles: TSpeedButton;
    grdData: TDrawGrid;
    btnTriplets: TSpeedButton;
    btnPairs: TSpeedButton;
    btnBonus: TSpeedButton;
    pnlPeriod: TPanel;
    lblPeriod: TLabel;
    lblPeriodValue: TLabel;
    procedure grdDataDrawCell(Sender: TObject; ACol, ARow: LongInt; Rect: TRect;
      State: TGridDrawState);
    procedure btnSinglesClick(Sender: TObject);
    procedure btnPairsClick(Sender: TObject);
    procedure btnTripletsClick(Sender: TObject);
    procedure btnBonusClick(Sender: TObject);
  private
    FFrequencyMode: TFrequencyMode;
    FLottery: TLottery;
    FList: TList<TNumberFrequency>;
    WaitForm: TfmWait;
    procedure SetSingle;
    procedure SetPairs;
    procedure SetTriples;
    procedure SetBonus;
    procedure ClearHeaders;
  public
    procedure SetData(ALottery: TLottery);
    procedure ApplyLanguage;
  end;

implementation

{$R *.dfm}

procedure TfrmFrequency.grdDataDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
var
  Item: TNumberFrequency;
begin
  if ARow >= FList.Count then Exit;
  ClearHeaders;
  if ARow = 0 then
  begin
    if (ACol = 2) and (FFrequencyMode = frPairs) then
      TGrids.CenterText(grdData.Canvas, Rect, TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'FREQUENCY'))
    else if (ACol = 3) and (FFrequencyMode = frTriplets) then
      TGrids.CenterText(grdData.Canvas, Rect, TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'FREQUENCY'))
    else
      TGrids.CenterText(grdData.Canvas, Rect, TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'FREQUENCY'))
  end
  else
  begin
    Item := FList[ARow-1];
    case FFrequencyMode of
      frSingle:
        begin
          case ACol of
            0: TGrids.DrawCircle(grdData.Canvas, Rect, IntToStr(Item.Numbers[0]), 'main');
            1: TGrids.CenterText(grdData.Canvas, Rect, Item.Frequency.ToString);
          end;
        end;
      frPairs:
        case ACol of
          0: TGrids.DrawCircle(grdData.Canvas, Rect, IntToStr(Item.Numbers[0]), 'main');
          1: TGrids.DrawCircle(grdData.Canvas, Rect, IntToStr(Item.Numbers[1]), 'main');
          2: TGrids.CenterText(grdData.Canvas, Rect, Item.Frequency.ToString);
        end;
      frTriplets:
        case ACol of
          0: TGrids.DrawCircle(grdData.Canvas, Rect, IntToStr(Item.Numbers[0]), 'main');
          1: TGrids.DrawCircle(grdData.Canvas, Rect, IntToStr(Item.Numbers[1]), 'main');
          2: TGrids.DrawCircle(grdData.Canvas, Rect, IntToStr(Item.Numbers[2]), 'main');
          3: TGrids.CenterText(grdData.Canvas, Rect, Item.Frequency.ToString);
        end;
      frBonus:
        case ACol of
          0: TGrids.DrawCircle(grdData.Canvas, Rect, IntToStr(Item.Numbers[0]), 'extra');
          1: TGrids.CenterText(grdData.Canvas, Rect, Item.Frequency.ToString);
        end;
    end;
  end;
end;

procedure TfrmFrequency.SetData(ALottery: TLottery);
begin
  FLottery := ALottery;
  SetSingle;
  lblPeriodValue.Caption := TDateUtils.FormatDate(DM.PeriodFrom) +
    ' - ' + TDateUtils.FormatDate(DM.PeriodTo);
  ApplyLanguage;
end;

procedure TfrmFrequency.ApplyLanguage;
begin
  btnSingles.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'SINGLES');
  btnPairs.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'PAIRS');
  btnTriplets.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'TRIPLETS');
  btnBonus.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'BONUS');

  lblTitle.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'FREQUENCY_ANALYSIS');
  lblPeriod.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'PERIOD');
end;

procedure TfrmFrequency.SetSingle;
begin
  FFrequencyMode := frSingle;
  if Assigned(FList) then
    FList.Clear;

  grdData.RowCount := grdData.FixedRows;
  grdData.Invalidate;

  WaitForm := TfmWait.Create(Self);
  WaitForm.Show;
  WaitForm.Update;

  if (Owner is TForm) then
    TForm(Owner).Enabled := False;

  TTask.Run(
    procedure
    begin
      TThread.Queue(nil,
      procedure
      begin
        try
          FList := DM.GetSingleNumberFrequency(FLottery.ID);
          grdData.RowCount := FList.Count;
          grdData.ColCount := 2;
          grdData.ColWidths[1] := 100;
        finally
          WaitForm.Close;
          WaitForm.Free;
        end;
      end);
    end);
  if (Owner is TForm) then
    TForm(Owner).Enabled := True;
end;

procedure TfrmFrequency.SetPairs;
begin
  FFrequencyMode := frPairs;
  FList.Clear;
  grdData.RowCount := grdData.FixedRows;
  grdData.Invalidate;

  WaitForm := TfmWait.Create(Self);
  WaitForm.Show;
  WaitForm.Update;

  if (Owner is TForm) then
    TForm(Owner).Enabled := False;
  TTask.Run(
    procedure
    begin
      TThread.Queue(nil,
      procedure
      begin
        try
          FList := DM.GetPairNumberFrequency(FLottery.ID);
          grdData.RowCount := FList.Count;
          grdData.ColCount := 3;
          grdData.ColWidths[1] := 35;
          grdData.ColWidths[2] := 100;
        finally
          WaitForm.Close;
          WaitForm.Free;
        end;
      end);
    end);
  if (Owner is TForm) then
    TForm(Owner).Enabled := True;
end;

procedure TfrmFrequency.SetTriples;
begin
  FFrequencyMode := frTriplets;
  FList.Clear;

  grdData.RowCount := grdData.FixedRows;
  grdData.Invalidate;

  WaitForm := TfmWait.Create(Self);
  WaitForm.Show;
  WaitForm.Update;

  if (Owner is TForm) then
    TForm(Owner).Enabled := False;
  TTask.Run(
    procedure
    begin
      TThread.Queue(nil,
      procedure
      begin
        try
          FList := DM.GetTripletNumberFrequency(FLottery.ID);
          grdData.RowCount := FList.Count;
          grdData.ColCount := 4;
          grdData.ColWidths[1] := 35;
          grdData.ColWidths[2] := 35;
          grdData.ColWidths[3] := 100;
        finally
          WaitForm.Close;
          WaitForm.Free;
        end;
      end);
    end);
  if (Owner is TForm) then
    TForm(Owner).Enabled := True;
end;

procedure TfrmFrequency.SetBonus;
begin
  FFrequencyMode := frBonus;
  FList.Clear;

  grdData.RowCount := grdData.FixedRows;
  grdData.Invalidate;

  WaitForm := TfmWait.Create(Self);
  WaitForm.Show;
  WaitForm.Update;

  if (Owner is TForm) then
    TForm(Owner).Enabled := False;
  TTask.Run(
    procedure
    begin
      TThread.Queue(nil,
      procedure
      begin
        try
          FList := DM.GetExtraNumberFrequency(FLottery.ID);
          grdData.RowCount := FList.Count;
          grdData.ColCount := 2;
          grdData.ColWidths[1] := 100;
        finally
          WaitForm.Close;
          WaitForm.Free;
        end;
      end);
    end);
  if (Owner is TForm) then
    TForm(Owner).Enabled := True;
end;

procedure TfrmFrequency.btnSinglesClick(Sender: TObject);
begin
  SetSingle;
end;

procedure TfrmFrequency.btnPairsClick(Sender: TObject);
begin
  SetPairs;
end;

procedure TfrmFrequency.btnTripletsClick(Sender: TObject);
begin
  SetTriples;
end;

procedure TfrmFrequency.btnBonusClick(Sender: TObject);
begin
  SetBonus;
{
  FFrequencyMode := frBonus;
  FList.Clear;
  grdData.RowCount := grdData.FixedRows;
  grdData.Invalidate;

  FList := DM.GetExtraNumberFrequency(FLottery.ID);
  grdData.RowCount := FList.Count;

  grdData.ColCount := 2;
  grdData.ColWidths[1] := 100;
  }
end;

procedure TfrmFrequency.ClearHeaders;
var
  Col: Integer;
  R: TRect;
begin
  for Col := 0 to grdData.ColCount - 2 do
  begin
    R := grdData.CellRect(Col, 0);
    grdData.Canvas.FillRect(R);
  end;
end;

end.
