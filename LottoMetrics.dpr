program LottoMetrics;

uses
  Vcl.Forms,
  fMain in 'src\forms\fMain.pas' {fmMain},
  dmMain in 'src\data\dmMain.pas' {DM: TDataModule},
  uLottery in 'src\models\uLottery.pas',
  frDraws in 'src\frames\frDraws.pas' {frmDraws: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
