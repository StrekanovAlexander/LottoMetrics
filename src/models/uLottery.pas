unit uLottery;

interface

uses System.SysUtils;

type TLottery = class
  private
    FID: Integer;
    FCountryID: Integer;
    FLotteryName: string;
    FMainCount: Integer;
    FMainStart: Integer;
    FMainFinish: Integer;
    FExtraCount: Integer;
    FExtraStart: Integer;
    FExtraFinish: Integer;
    FCountryPrefix: string;
  public
    constructor Create(AID: Integer; ACountryID: Integer; const ALotteryName: string;
      AMainCount: Integer; AMainStart: Integer; AMainFinish: Integer;
      AExtraCount: Integer; AExtraStart: Integer; AExtraFinish: Integer; const ACountryPrefix: string);
    function ToString: string; override;
    property ID: Integer read FID;
    property CountryID: Integer read FCountryID;
    property LotteryName: string read FLotteryName;
    property MainCount: Integer read FMainCount;
    property MainStart: Integer read FMainStart;
    property MainFinish: Integer read FMainFinish;
    property ExtraCount: Integer read FExtraCount;
    property ExtraStart: Integer read FExtraStart;
    property ExtraFinish: Integer read FExtraFinish;
    property CountryPrefix: string read FCountryPrefix;
end;

implementation

constructor TLottery.Create(AID: Integer; ACountryID: Integer; const ALotteryName: string;
  AMainCount: Integer; AMainStart: Integer; AMainFinish: Integer;
  AExtraCount: Integer; AExtraStart: Integer; AExtraFinish: Integer; const ACountryPrefix: string);
begin
  inherited Create;
  FID := AID;
  FCountryID := ACountryID;
  FLotteryName := ALotteryName;
  FMainCount := AMainCount;
  FMainStart := AMainStart;
  FMainFinish := AMainFinish;
  FExtraCount := AExtraCount;
  FExtraStart := AExtraStart;
  FExtraFinish := AExtraFinish;
  FCountryPrefix := ACountryPrefix;
end;

function TLottery.ToString: string;
begin
  Result := Format('%s (%s)', [FLotteryName, FCountryPrefix]);
end;

end.
