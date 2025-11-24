unit uLanguage;

interface

type
  TLanguage = class
    private
      FID: Integer;
      FIsoCode: string;
      FLanguageName: string;
      FIsDefault: Boolean;
      FIsActive: Boolean;
    public
      constructor Create(AID: Integer; const AIsoCode: string; const ALanguageName: string;
        AIsDefault: Boolean; AIsActive: Boolean);
      property ID: Integer read FID;
      property IsoCode: string read FIsoCode;
      property LanguageName: string read FLanguageName;
      property IsDefault: Boolean read FIsDefault;
      property IsActive: Boolean read FIsActive;
    end;

implementation

constructor TLanguage.Create(AID: Integer; const AIsoCode: string; const ALanguageName:
  string; AIsDefault: Boolean; AIsActive: Boolean);
begin
  inherited Create;
  FID := AID;
  FIsoCode := AIsoCode;
  FLanguageName := ALanguageName;
  FIsDefault := AIsDefault;
  FIsActive := AIsActive;
end;

end.
