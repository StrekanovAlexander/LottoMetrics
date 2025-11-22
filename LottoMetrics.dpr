program LottoMetrics;

uses
  Vcl.Forms,
  fMain in 'src\forms\fMain.pas' {fmMain},
  dmMain in 'src\data\dmMain.pas' {DM: TDataModule},
  uLottery in 'src\models\uLottery.pas',
  frDraws in 'src\frames\frDraws.pas' {frmDraws: TFrame},
  uDraw in 'src\models\uDraw.pas',
  uNumberUtils in 'src\utils\uNumberUtils.pas',
  uDateUtils in 'src\utils\uDateUtils.pas',
  uDrawBand in 'src\ui\uDrawBand.pas',
  uColors in 'src\ui\uColors.pas',
  uBall in 'src\ui\uBall.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
