unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Generics.Collections,
  Vcl.ComCtrls,
  dmMain, uDateUtils, uTranslations,
  frDraws, uLanguage, uLottery
//  uLang,
  ;

type
  TfmMain = class(TForm)
    pnlLeft: TPanel;
    pnlMain: TPanel;
    lblLotteryName: TLabel;
    cmbLotteries: TComboBox;
    lblPeriod: TLabel;
    dtpPeriodFrom: TDateTimePicker;
    dtpPeriodTo: TDateTimePicker;
    btnDraws: TButton;
    lblAnalytics: TLabel;
    btnStatsNumbers: TButton;
    cmbLanguages: TComboBox;
    lblLanguage: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SetLanguages;
    procedure SetLotteries;
    procedure SetPeriod;

    procedure cmbLanguagesChange(Sender: TObject);
    procedure cmbLotteriesChange(Sender: TObject);
    procedure dtpPeriodFromCloseUp(Sender: TObject);

    procedure FormDestroy(Sender: TObject);
  private
    FFrameDraws: TfrmDraws;
    FLottery: TLottery;
    procedure ApplyTranslations;
    procedure SetFrameDraws;
    procedure UpdateSelectedLottery;
  public

  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.FormCreate(Sender: TObject);
begin
  Width := 1200;
  Height := 800;
  Position := poScreenCenter;
  SetLanguages;
  SetLotteries;
  SetPeriod;
  SetFrameDraws;
  ApplyTranslations;
end;

procedure TfmMain.UpdateSelectedLottery;
begin
  if cmbLotteries.ItemIndex >= 0 then
  begin
    FLottery := TLottery(cmbLotteries.Items.Objects[cmbLotteries.ItemIndex]);
    if Assigned(FLottery) then
      lblLotteryName.Caption := FLottery.ToString
    else
      lblLotteryName.Caption := '';
  end
  else
  begin
    FLottery := nil;
    lblLotteryName.Caption := '';
  end;
end;

// Languages
procedure TfmMain.SetLanguages;
var Languages: TList<TLanguage>;
begin
  Languages := DM.GetLanguages;
  try
    cmbLanguages.Items.Clear;
    for var L in Languages do
      cmbLanguages.Items.AddObject(L.LanguageName, L);

    for var i := 0 to cmbLanguages.Items.Count - 1 do
      begin
      if TLanguage(cmbLanguages.Items.Objects[i]).ID = DM.CurrentLanguage.ID then
        begin
          cmbLanguages.ItemIndex := i;
          Break;
        end;
      end;
  finally
    Languages.Free;
  end;
end;

procedure TfmMain.cmbLanguagesChange(Sender: TObject);
var
  SelectedLang: TLanguage;
  SelectedID: Integer;
begin
  if cmbLanguages.ItemIndex < 0 then Exit;

  SelectedLang := TLanguage(cmbLanguages.Items.Objects[cmbLanguages.ItemIndex]);
  SelectedID := SelectedLang.ID;
  DM.UpdateDefaultLanguage(SelectedID);
  DM.SetCurrentLanguage(SelectedLang);

  ApplyTranslations;
  FFrameDraws.ApplyTranslations;
end;

// Lotteries
procedure TfmMain.SetLotteries;
var Lotteries: TList<TLottery>;
begin
  Lotteries := DM.GetLotteries;
  try
    cmbLotteries.Items.Clear;
    for var L in DM.GetLotteries do
      cmbLotteries.Items.AddObject(L.ToString, L);
  finally
    Lotteries.Free;
  end;

  if cmbLotteries.Items.Count > 0 then
  begin
    cmbLotteries.ItemIndex := 0;
    UpdateSelectedLottery;
  end;
end;
procedure TfmMain.cmbLotteriesChange(Sender: TObject);
begin
  UpdateSelectedLottery;
end;

// Period
procedure TfmMain.SetPeriod;
var StartDate, EndDate: TDate;
begin
  TDateUtils.GetCurrentMonthPeriod(StartDate, EndDate);
  DM.SetPeriod(StartDate, EndDate);
  dtpPeriodFrom.Date := StartDate;
  dtpPeriodTo.Date := EndDate;
end;
procedure TfmMain.dtpPeriodFromCloseUp(Sender: TObject);
begin
  if dtpPeriodFrom.Date <= dtpPeriodTo.Date then
  begin
    DM.SetPeriod(dtpPeriodFrom.Date, dtpPeriodTo.Date);
    SetFrameDraws;
  end;
end;

// FrameDraws
procedure TfmMain.SetFrameDraws;
begin
  if Assigned(FFrameDraws) then
    FreeAndNil(FFrameDraws);
  FFrameDraws := TfrmDraws.Create(Self);
  with FFrameDraws do
  begin
    Parent := pnlMain;
    SetDraws(FLottery);
  end;
end;

// Translations
procedure TfmMain.ApplyTranslations;
var IsoCode: string;
begin
  IsoCode := DM.CurrentLanguage.IsoCode;

  lblPeriod.Caption := TTranslations.GetText(IsoCode, 'PERIOD');
  lblAnalytics.Caption := TTranslations.GetText(IsoCode, 'ANALYTICS');
  lblLanguage.Caption := TTranslations.GetText(IsoCode, 'LANG');

  btnDraws.Caption := TTranslations.GetText(IsoCode, 'DRAWS');
  btnStatsNumbers.Caption := TTranslations.GetText(IsoCode, 'NUMBER_STATISTICS');
end;

// Destroy
procedure TfmMain.FormDestroy(Sender: TObject);
begin
  for var i := 0 to cmbLotteries.Items.Count - 1 do
    TObject(cmbLotteries.Items.Objects[i]).Free;
  for var i := 0 to cmbLanguages.Items.Count - 1 do
    TObject(cmbLanguages.Items.Objects[i]).Free;
end;

end.
