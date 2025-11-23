unit uDraw;

interface

uses System.SysUtils, uNumberUtils;

type TDraw = class
  private
    FID: Integer;
    FLotteryId: Integer;
    FDrawDate: TDate;
    FMainNumbers: string;
    FExtraNumbers: string;
    function GetMainNumbersArr: TArray<Integer>;
    function GetExtraNumbersArr: TArray<Integer>;
  public
    constructor Create; overload;
    constructor Create(AID: Integer; ALotteryId: Integer; ADrawDate: TDate;
      AMainNumbers: string; AExtraNumbers: string); overload;
    property ID: Integer read FID;
    property LotteryId: Integer read FLotteryId;
    property DrawDate: TDate read FDrawDate;
    property MainNumbers: string read FMainNumbers;
    property ExtraNumbers: string read FExtraNumbers;
    property MainNumbersArr: TArray<Integer> read GetMainNumbersArr;
    property ExtraNumbersArr: TArray<Integer> read GetExtraNumbersArr;
end;

implementation

constructor TDraw.Create;
begin
  inherited Create;
end;

constructor TDraw.Create(AID: Integer; ALotteryId: Integer; ADrawDate: TDate; AMainNumbers: string; AExtraNumbers: string);
begin
  inherited Create;
  FID := AID;
  FLotteryId := ALotteryId;
  FDrawDate := ADrawDate;
  FMainNumbers := AMainNumbers;
  FExtraNumbers := AExtraNumbers;
end;

function TDraw.GetMainNumbersArr: TArray<Integer>;
begin
  Result := TNumberUtils.ParseNumbers(FMainNumbers);
end;

function TDraw.GetExtraNumbersArr: TArray<Integer>;
begin
  Result := TNumberUtils.ParseNumbers(FExtraNumbers);
end;

end.
