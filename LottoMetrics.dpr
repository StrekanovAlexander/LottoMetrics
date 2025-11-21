program LottoMetrics;

uses
  Vcl.Forms,
  fMain in 'src\forms\fMain.pas' {fmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
