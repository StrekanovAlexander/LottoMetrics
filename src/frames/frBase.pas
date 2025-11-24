unit frBase;

interface
  uses System.Classes, Vcl.Controls, Vcl.Forms,
  uLottery;

type
  TfrmBase = class(TFrame)
  public
    procedure ApplyLanguage; virtual; abstract;
    procedure SetData(Lottery: TLottery); virtual; abstract;
  end;

implementation

end.
