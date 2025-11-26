unit frFrequency;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.Buttons, Vcl.StdCtrls,
  dmMain,
  uLottery, uTranslations,
  uGrids,
  uAnalyticRecords
  ;

type
  TfrmFrequency = class(TFrame, ITranslatable)
    pnlContainer: TPanel;
    lblTitle: TLabel;
    pnlModes: TPanel;
    btnSingles: TSpeedButton;
    grdData: TDrawGrid;
    btnTriplets: TSpeedButton;
    btnPairs: TSpeedButton;
    btnBonus: TSpeedButton;
    procedure grdDataDrawCell(Sender: TObject; ACol, ARow: LongInt; Rect: TRect;
      State: TGridDrawState);
    procedure btnSinglesClick(Sender: TObject);
  private
    FLottery: TLottery;
    FList: TList<TNumberFrequency>;
    procedure SetSingles;
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
  grdData.Canvas.Font.Style := [fsBold];
  if ARow = 0 then
  begin
    grdData.Canvas.Font.Style := [fsBold];
    if ACol = 1 then
    begin
      TGrids.CenterText(grdData.Canvas, Rect,
      TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'FREQUENCY'));
    end;
  end
  else
  begin
    begin
      Item := FList[ARow-1];
      case ACol of
        0: TGrids.DrawCircle(grdData.Canvas, Rect, IntToStr(Item.Number), 'main');
        1: TGrids.CenterText(grdData.Canvas, Rect, Item.Frequency.ToString);
      end;
    end;
  end;
end;

procedure TfrmFrequency.SetData(ALottery: TLottery);
begin
  FLottery := ALottery;
  SetSingles;
  ApplyLanguage;
end;

procedure TfrmFrequency.ApplyLanguage;
begin
  btnSingles.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'SINGLES');
  btnPairs.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'PAIRS');
  btnTriplets.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'TRIPLETS');
  btnBonus.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'BONUS');

  lblTitle.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'FREQUENCY_ANALYSIS');
end;

procedure TfrmFrequency.SetSingles;
begin
  FList := DM.GetNumberFrequency(FLottery.ID);
  grdData.RowCount := FList.Count;
  grdData.DoubleBuffered := True;
  grdData.ColCount := 2;
  grdData.ColWidths[1] := 100;
end;

procedure TfrmFrequency.btnSinglesClick(Sender: TObject);
begin
  SetSingles;
end;

end.
