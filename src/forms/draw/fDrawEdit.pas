unit fDrawEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  dmMain, uControls, uValidators, uLottery, uDraw, uTranslations;

type
  TfmDrawEdit = class(TForm, ITranslatable)
    pnlTitle: TPanel;
    pnlButtons: TPanel;
    dtpDate: TDateTimePicker;
    gbxMainNumbers: TGroupBox;
    gbxExtraNumbers: TGroupBox;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FLottery: TLottery;
    FDraw: TDraw;
    FIsNew: Boolean;
    procedure Init;
    procedure BuildControls;
    procedure ApplyLanguage;
  public
    constructor Create(AOwner: TComponent; ALottery: TLottery; ADraw: TDraw); reintroduce;
  end;

implementation

{$R *.dfm}

procedure TfmDrawEdit.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmDrawEdit.btnOKClick(Sender: TObject);
var main_numbers, extra_numbers: string;
begin
  try
    TValidators.ValidateEdit(Self);
    main_numbers := TControls.GetEditValues(gbxMainNumbers);
    extra_numbers := TControls.GetEditValues(gbxExtraNumbers);

    if FIsNew = True then
      DM.AddDraw(FLottery.ID, dtpDate.Date, main_numbers, extra_numbers)
    else
      DM.UpdateDraw(FDraw.ID, dtpDate.Date, main_numbers, extra_numbers);

    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      ShowMessage('Error: ' + E.Message);
      ModalResult := mrNone;
    end;

  end;
end;

constructor TfmDrawEdit.Create(AOwner: TComponent; ALottery: TLottery; ADraw: TDraw);
begin
  inherited Create(AOwner);
  FLottery := ALottery;
  if not Assigned(ADraw) then
    FIsNew := True
  else
    FDraw := ADraw;
  Init;
  ApplyLanguage;
end;

procedure TfmDrawEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmDrawEdit.Init;
begin
  if FIsNew then
  begin
    Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'DRAW_ADD');
    dtpDate.Date := Now;
  end
  else
  begin
    Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'DRAW_EDIT');
    dtpDate.Date := FDraw.DrawDate;
  end;

  pnlTitle.Caption := Caption;
  BuildControls;
end;

procedure TfmDrawEdit.BuildControls;
var posTop, posLeft, marginTop, marginLeft: Integer;
    edWidth, edMarginTop: Integer;
    lb: TLabel;
    ed: TEdit;
begin
  posTop := 30;
  posLeft := 10;
  marginTop := 27;
  marginLeft := 35;
  edWidth := 75;
  edMarginTop := 3;

  for var i := 0 to FLottery.MainCount - 1 do
  begin
    lb := TLabel.Create(gbxMainNumbers);
    lb.Parent := gbxMainNumbers;
    lb.Top := posTop;
    lb.Left := posLeft;
    lb.Caption := 'N ' + IntToStr(i + 1);

    ed := TEdit.Create(gbxMainNumbers);
    ed.Parent := gbxMainNumbers;
    ed.Top := posTop - edMarginTop;
    ed.Left := posLeft + marginLeft;
    ed.Width := edWidth;

    if not FISNew then
      ed.Text := IntToStr(FDraw.MainNumbersArr[i]);

    posTop := posTop + marginTop;
  end;

  posTop := 30;
  posLeft := 10;

  for var i := 0 to FLottery.ExtraCount - 1 do
  begin
    lb := TLabel.Create(gbxExtraNumbers);
    lb.Parent := gbxExtraNumbers;
    lb.Top := posTop;
    lb.Left := posLeft;
    lb.Caption := 'N ' + IntToStr(i + 1);

    ed := TEdit.Create(gbxExtraNumbers);
    ed.Parent := gbxExtraNumbers;
    ed.Top := posTop - edMarginTop;
    ed.Left := posLeft + marginLeft;
    ed.Width := edWidth;

    if not FISNew then
      ed.Text := IntToStr(FDraw.ExtraNumbersArr[i]);

    posTop := posTop + marginTop;
  end;

end;

procedure TfmDrawEdit.ApplyLanguage;
begin
  gbxMainNumbers.Caption :=  TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'MAIN_NUMBERS');
  gbxExtraNumbers.Caption :=  TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'EXTRA_NUMBERS');
  btnOK.Caption :=  TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'BTN_OK');
  btnCancel.Caption :=  TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'BTN_CANCEL');
end;

end.
