program LottoMetrics;

uses
  Vcl.Forms,
  fMain in 'src\forms\main\fMain.pas' {fmMain},
  dmMain in 'src\data\dmMain.pas' {DM: TDataModule},
  uLottery in 'src\models\uLottery.pas',
  frDraws in 'src\frames\draw\frDraws.pas' {frmDraws: TFrame},
  uDraw in 'src\models\uDraw.pas',
  uNumberUtils in 'src\utils\uNumberUtils.pas',
  uDateUtils in 'src\utils\uDateUtils.pas',
  uGrids in 'src\ui\uGrids.pas',
  fDrawEdit in 'src\forms\draw\fDrawEdit.pas' {fmDrawEdit},
  uValidators in 'src\utils\uValidators.pas',
  uControls in 'src\utils\uControls.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
