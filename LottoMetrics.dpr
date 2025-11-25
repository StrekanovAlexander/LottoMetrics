program LottoMetrics;

uses
  Vcl.Forms,
  fMain in 'src\forms\main\fMain.pas' {fmMain},
  dmMain in 'src\data\dmMain.pas' {DM: TDataModule},
  uLottery in 'src\models\uLottery.pas',
  frDraws in 'src\frames\frDraws.pas' {frmDraws: TFrame},
  uDraw in 'src\models\uDraw.pas',
  uNumberUtils in 'src\utils\uNumberUtils.pas',
  uDateUtils in 'src\utils\uDateUtils.pas',
  uGrids in 'src\ui\uGrids.pas',
  fDrawEdit in 'src\forms\draw\fDrawEdit.pas' {fmDrawEdit},
  uValidators in 'src\utils\uValidators.pas',
  uControls in 'src\utils\uControls.pas',
  uLanguage in 'src\models\uLanguage.pas',
  uLanguageRepo in 'src\data\uLanguageRepo.pas',
  uLotteryRepo in 'src\data\uLotteryRepo.pas',
  uDrawRepo in 'src\data\uDrawRepo.pas',
  uTranslations in 'src\models\uTranslations.pas',
  frFrequency in 'src\frames\frFrequency.pas' {frmFrequency: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
