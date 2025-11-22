program LottoMetrics;

uses
  Vcl.Forms,
  fMain in 'src\forms\fMain.pas' {fmMain},
  dmMain in 'src\data\dmMain.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
