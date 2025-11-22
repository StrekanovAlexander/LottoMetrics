unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Generics.Collections,
  Vcl.ComCtrls,
  dmMain, uLottery, frDraws
  ;

type
  TfmMain = class(TForm)
    pnlLeft: TPanel;
    pnlMain: TPanel;
    lblLotteryName: TLabel;
    cbxLotteries: TComboBox;
    lblPeriod: TLabel;
    dtpPeriodFrom: TDateTimePicker;
    dtpPeriodTo: TDateTimePicker;
    btnDraws: TButton;
    lblAnalytics: TLabel;
    btnStatsNumbers: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cbxLotteriesChange(Sender: TObject);
  private
    FLottery: TLottery;
    FFrameDraws: TfrmDraws;

    procedure GetDefaultPeriod(out AStartDate, AEndDate: TDate);
    procedure UpdateSelectedLottery;
    procedure InitUI;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.GetDefaultPeriod(out AStartDate: TDate; out AEndDate: TDate);
var
  Y, M, D: Word;
begin
  DecodeDate(Date, Y, M, D);
  AStartDate := EncodeDate(Y, M, 1);
  if M = 12 then
    AEndDate := EncodeDate(Y + 1, 1, 1) - 1
  else
    AEndDate := EncodeDate(Y, M + 1, 1) - 1;
end;

procedure TfmMain.UpdateSelectedLottery;
begin
  if cbxLotteries.ItemIndex >= 0 then
  begin
    FLottery := TLottery(cbxLotteries.Items.Objects[cbxLotteries.ItemIndex]);
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

procedure TfmMain.InitUI;
  var
  StartDate, EndDate: TDate;
begin
  Width := 1200;
  Height := 800;
  Position := poScreenCenter;

  cbxLotteries.Items.Clear;
  for var L in DM.GetLotteries do
    cbxLotteries.Items.AddObject(L.ToString, L);

  if cbxLotteries.Items.Count > 0 then
  begin
    cbxLotteries.ItemIndex := 0;
    UpdateSelectedLottery;
  end;

  GetDefaultPeriod(StartDate, EndDate);
  dtpPeriodFrom.Date := StartDate;
  dtpPeriodTo.Date   := EndDate;

  if Assigned(FFrameDraws) then
    FreeAndNil(FFrameDraws);

  FFrameDraws := TfrmDraws.Create(Self);
  with FFrameDraws do
  begin
    Parent := pnlMain;
    Align := alClient;
    lblTitle.Caption := 'Результаты розыгрышей';
  end;

end;

procedure TfmMain.cbxLotteriesChange(Sender: TObject);
begin
  UpdateSelectedLottery;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  InitUI;
end;

end.
