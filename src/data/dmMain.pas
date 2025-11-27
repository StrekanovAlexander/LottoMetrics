unit dmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, Vcl.Dialogs, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, System.Generics.Collections,
  uAnalyticsRepo, uDrawRepo, uLanguageRepo, uLotteryRepo,
  uDraw, uLanguage, uLottery, uTranslations,
  uAnalyticRecords;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FBDriverLink: TFDPhysFBDriverLink;
    FDQuerySelect: TFDQuery;
    FDQueryExec: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FPeriodFrom: TDate;
    FPeriodTo: TDate;
    FCurrentLanguage: TLanguage;
  public
    procedure SetPeriod(APeriodFrom, APeriodTo: TDate);

    function GetLanguages: TList<TLanguage>;
    procedure SetCurrentLanguage(ALanguage: TLanguage);
    procedure UpdateDefaultLanguage(ALanguageId: Integer);
    property CurrentLanguage: TLanguage read FCurrentLanguage;
    property PeriodFrom: TDate read FPeriodFrom;
    property PeriodTo: TDate read FPeriodTo;

    function GetLotteries: TList<TLottery>;
    function GetSingleNumberFrequency(ALotteryId: Integer): TList<TNumberFrequency>;
    function GetExtraNumberFrequency(ALotteryId: Integer): TList<TNumberFrequency>;
    function GetPairNumberFrequency(ALotteryId: Integer): TList<TNumberFrequency>;
    function GetTripletNumberFrequency(ALotteryId: Integer): TList<TNumberFrequency>;

    function GetDraws(ALotteryId: Integer): TList<TDraw>;
    procedure AddDraw(ALotteryId: Integer; ADrawDate: TDateTime; const AMainNumbers: string;
      const AExtraNumbers: string);
    procedure UpdateDraw(ADrawId: Integer; ADrawDate: TDateTime; const AMainNumbers: string;
      const AExtraNumbers: string);
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FBDriverLink.VendorLib := ExtractFilePath(ParamStr(0)) + 'data\fbclient.dll';
  FDConnection.Params.Add('Database=' + ExtractFilePath(ParamStr(0)) + 'data\LOTTOMETRICS.FDB');

  try
    FDConnection.Connected := True;
    FCurrentLanguage := FetchCurrentLanguage(FDQuerySelect);
    TTranslations.Init;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

// Set Defaults
procedure TDM.SetPeriod(APeriodFrom: TDate; APeriodTo: TDate);
begin
  FPeriodFrom := APeriodFrom;
  FPeriodTo := APeriodTo;
end;

// Languages
function TDM.GetLanguages: TList<TLanguage>;
begin
  Result := FetchLanguages(FDQuerySelect);
end;

procedure TDM.SetCurrentLanguage(ALanguage: TLanguage);
begin
  if Assigned(FCurrentLanguage) then
    FCurrentLanguage.Free;
  FCurrentLanguage := TLanguage.Create(
    ALanguage.ID,
    ALanguage.IsoCode,
    ALanguage.LanguageName,
    ALanguage.IsDefault,
    ALanguage.IsActive
  );
  TTranslations.Init;
end;

procedure TDM.UpdateDefaultLanguage(ALanguageId: Integer);
begin
  EditDefaultLanguage(FDQueryExec, ALanguageId);
end;


// Lotteries
function TDM.GetLotteries: TList<TLottery>;
begin
  Result := FetchLotteries(FDQuerySelect);
end;

// Draws
function TDM.GetDraws(ALotteryId: Integer): TList<TDraw>;
begin
  Result := FetchDraws(FDQuerySelect, ALotteryId, FPeriodFrom, FPeriodTo);
end;

procedure TDM.AddDraw(ALotteryId: Integer; ADrawDate: TDateTime; const AMainNumbers: string;
  const AExtraNumbers: string);
begin
  InsertDraw(FDQuerySelect, ALotteryId, ADrawDate, AMainNumbers, AExtraNumbers);
end;

procedure TDM.UpdateDraw(ADrawId: Integer; ADrawDate: TDateTime; const AMainNumbers: string;
  const AExtraNumbers: string);
begin
  EditDraw(FDQueryExec, ADrawId, ADrawDate, AMainNumbers, AExtraNumbers);
end;

// Analytics Frequency
function TDM.GetSingleNumberFrequency(ALotteryId: Integer): TList<TNumberFrequency>;
begin
   Result := FetchSingleNumberFrequency(FDQuerySelect, ALotteryId, FPeriodFrom, FPeriodTo);
end;

function TDM.GetExtraNumberFrequency(ALotteryId: Integer): TList<TNumberFrequency>;
begin
   Result := FetchExtraNumberFrequency(FDQuerySelect, ALotteryId, FPeriodFrom, FPeriodTo);
end;

function TDM.GetPairNumberFrequency(ALotteryId: Integer): TList<TNumberFrequency>;
begin
   Result := FetchPairNumberFrequency(FDQuerySelect, ALotteryId, FPeriodFrom, FPeriodTo);
end;

function TDM.GetTripletNumberFrequency(ALotteryId: Integer): TList<TNumberFrequency>;
begin
   Result := FetchTripletNumberFrequency(FDQuerySelect, ALotteryId, FPeriodFrom, FPeriodTo);
end;

// Destroy
procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(FCurrentLanguage) then
    FCurrentLanguage.Free;
  TTranslations.Clear;

  if FDConnection.Connected then
    FDConnection.Connected := False;
end;

end.
