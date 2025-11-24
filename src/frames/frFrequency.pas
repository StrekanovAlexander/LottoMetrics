unit frFrequency;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  dmMain,
  frBase,
  uTranslations,
  uLottery;

type
  TfrmFrequency = class(TfrmBase)
    pnlContainer: TPanel;
    lblTitle: TLabel;
  private
    { Private declarations }
  public
    procedure ApplyLanguage; override;
    procedure SetData(ALottery: TLottery); override;
  end;

implementation

{$R *.dfm}

procedure TfrmFrequency.ApplyLanguage;
begin
  lblTitle.Caption := TTranslations.GetText(DM.CurrentLanguage.IsoCode, 'FREQUENCY_ANALYSIS');
end;

procedure TfrmFrequency.SetData(ALottery: TLottery);
begin
  ApplyLanguage;
end;

end.
