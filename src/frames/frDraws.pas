unit frDraws;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  uDraw, uDrawBand;

type
  TfrmDraws = class(TFrame)
    pnlContainer: TPanel;
    lblTitle: TLabel;
    sbDraws: TScrollBox;
  private
    { Private declarations }
  public
    procedure RenderDraws;
  end;

implementation

{$R *.dfm}

procedure TfrmDraws.RenderDraws;
var Draw: TDraw;
    Today: TDate;
begin
  Today := Date;

  //for I := Low to High do // список из таблицы draws
  //  begin
  Draw := TDraw.Create(1, 1, Today, '1,3,5,7,9,11', '2');
  TDrawBand.Add(Draw, sbDraws);
  //  end;
end;

end.
