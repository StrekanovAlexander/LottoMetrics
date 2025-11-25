unit frFrequency;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.Buttons, Vcl.StdCtrls,
  dmMain,
  uLottery, uTranslations,
  uGrids
  ;

type
  TfrmFrequency = class(TFrame, ITranslatable)
    pnlContainer: TPanel;
    lblTitle: TLabel;
    pnlModes: TPanel;
    btnOverall: TSpeedButton;
    grdData: TDrawGrid;
    btnGaps: TSpeedButton;
    btnPairs: TSpeedButton;
    btnExtra: TSpeedButton;
    procedure grdDataDrawCell(Sender: TObject; ACol, ARow: LongInt; Rect: TRect;
      State: TGridDrawState);
  private
    procedure SetOverall;
  public
    procedure SetData(ALottery: TLottery);
    procedure ApplyLanguage;
  end;

implementation

{$R *.dfm}

procedure TfrmFrequency.grdDataDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
begin
  if ARow = 0 then
  begin
    grdData.Canvas.Font.Style := [fsBold];
    case ACol of
      1: TGrids.CenterText(grdData.Canvas, Rect,
        TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'FREQUENCY'));

    end;
  end

end;

procedure TfrmFrequency.SetData(ALottery: TLottery);
begin
  SetOverall;
  ApplyLanguage;
end;

procedure TfrmFrequency.ApplyLanguage;
begin
  btnExtra.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'EXTRA');
  btnGaps.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'GAPS');
  btnOverall.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'OVERALL');
  btnPairs.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'PAIRS');

  lblTitle.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'FREQUENCY_ANALYSIS');
end;

procedure TfrmFrequency.SetOverall;
begin
  grdData.ColWidths[1] := 100;
end;

end.
