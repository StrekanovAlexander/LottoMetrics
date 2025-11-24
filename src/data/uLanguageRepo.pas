unit uLanguageRepo;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client, uLanguage;

function FetchLanguages(Query: TFDQuery): TList<TLanguage>;
function FetchCurrentLanguage(Query: TFDQuery): TLanguage;
procedure EditDefaultLanguage(Query: TFDQuery; LanguageId: Integer);

implementation

function FetchLanguages(Query: TFDQuery): TList<TLanguage>;
var
  Languages: TList<TLanguage>;
begin
  Languages := TList<TLanguage>.Create;

  Query.Close;
  Query.SQL.Text :=
    'SELECT id, iso_code, language_name, is_default, is_active ' +
    'FROM languages WHERE is_active = :is_active';
  Query.ParamByName('is_active').AsBoolean := True;
  Query.Open;

  while not Query.Eof do
  begin
    Languages.Add(TLanguage.Create(
      Query.FieldByName('id').AsInteger,
      Query.FieldByName('iso_code').AsString,
      Query.FieldByName('language_name').AsString,
      Query.FieldByName('is_default').AsBoolean,
      Query.FieldByName('is_active').AsBoolean
    ));
    Query.Next;
  end;

  Result := Languages;
end;

function FetchCurrentLanguage(Query: TFDQuery): TLanguage;
begin
  Query.Close;
  Query.SQL.Text :=
    'SELECT id, iso_code, language_name, is_default, is_active ' +
    'FROM languages WHERE is_default = TRUE';
  Query.Open;

  if not Query.Eof then
    Result := TLanguage.Create(
      Query.FieldByName('id').AsInteger,
      Query.FieldByName('iso_code').AsString,
      Query.FieldByName('language_name').AsString,
      Query.FieldByName('is_default').AsBoolean,
      Query.FieldByName('is_active').AsBoolean
    )
  else
    Result := nil;
end;

procedure EditDefaultLanguage(Query: TFDQuery; LanguageId: Integer);
begin
  Query.SQL.Text := 'EXECUTE PROCEDURE update_default_language (:language_id)';
  Query.ParamByName('language_id').AsInteger := LanguageId;
  Query.ExecSQL;
end;

end.
