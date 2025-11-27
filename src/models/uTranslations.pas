unit uTranslations;

interface

uses
  System.Generics.Collections, uLanguage;

type
  ITranslatable = interface
    ['{7361AB78-E621-4352-912A-D65157D07780}']
    procedure ApplyLanguage;
  end;

  TTranslations = class
  private
    class var FDict: TDictionary<string, TDictionary<string,string>>;
  public
    class procedure Init;
    class function GetText(const LangCode, Key: string): string;
    class procedure Clear;
  end;

implementation

class procedure TTranslations.Init;
var
  LangDict: TDictionary<string,string>;
begin
  Clear;
  FDict := TDictionary<string, TDictionary<string,string>>.Create;

  // English
  LangDict := TDictionary<string,string>.Create;
  LangDict.Add('ANALYTICS', 'Analytics');
  LangDict.Add('BONUS', 'Bonus');
  LangDict.Add('CHART', 'Chart');
  LangDict.Add('DATE', 'Date');
  LangDict.Add('DRAWS', 'Draws');
  LangDict.Add('DRAW_ADD', 'Add draw data');
  LangDict.Add('DRAWS_COUNT', 'Draws count');
  LangDict.Add('DRAW_EDIT', 'Edit draw data');
  LangDict.Add('DRAW_GAPS', 'Misses in the draws');
  LangDict.Add('DRAW_RESULTS', 'Draw results');
  LangDict.Add('EXTRA', 'Extra');
  LangDict.Add('EXTRA_NUMBERS', 'Extra numbers');
  LangDict.Add('FREQUENCY', 'Frequency');
  LangDict.Add('FREQUENCY_ANALYSIS', 'Frequency analysis');
  LangDict.Add('GAP', 'Gap');
  LangDict.Add('GAPS', 'Gaps');
  LangDict.Add('HEATMAP', 'Heatmap');
  LangDict.Add('LANG', 'Language');
  LangDict.Add('MAIN_NUMBERS', 'Main numbers');
  LangDict.Add('NUMBER', 'Number');
  LangDict.Add('PAIRS', 'Pairs');
  LangDict.Add('SINGLES', 'Singles');
  LangDict.Add('TABLE', 'Table');
  LangDict.Add('TRIPLETS', 'Triplets');
  LangDict.Add('PERIOD', 'Period');
  LangDict.Add('BTN_ADD', 'Add');
  LangDict.Add('BTN_EDIT', 'Edit');
  LangDict.Add('BTN_OK', 'OK');
  LangDict.Add('BTN_CANCEL', 'Cancel');
  FDict.Add('en', LangDict);

  // Deutsch
  LangDict := TDictionary<string,string>.Create;
  LangDict.Add('ANALYTICS', 'Analyse');
  LangDict.Add('BONUS', 'Superzahl');
  LangDict.Add('CHART', 'Diagramm');
  LangDict.Add('DATE', 'Datum');
  LangDict.Add('DRAWS', 'Ziehungen');
  LangDict.Add('DRAW_ADD', 'Hinzufügen von Ziehungsdaten');
  LangDict.Add('DRAWS_COUNT', 'Anzahl der Ziehungen');
  LangDict.Add('DRAW_EDIT', 'Bearbeiten von Ziehungsdaten');
  LangDict.Add('DRAW_GAPS', 'Aussetzer bei den Ziehungen');
  LangDict.Add('DRAW_RESULTS', 'Ziehungsergebnisse');
  LangDict.Add('EXTRA', 'Extra');
  LangDict.Add('EXTRA_NUMBERS', 'Zusatzzahlen');
  LangDict.Add('FREQUENCY', 'Häufigkeit');
  LangDict.Add('FREQUENCY_ANALYSIS', 'Häufigkeitsanalyse');
  LangDict.Add('GAP', 'Aussetzer');
  LangDict.Add('GAPS', 'Aussetzer');
  LangDict.Add('HEATMAP', 'Heatmap');
  LangDict.Add('LANG', 'Sprache');
  LangDict.Add('MAIN_NUMBERS', 'Hauptzahlen');
  LangDict.Add('NUMBER', 'Nummer');
  LangDict.Add('PAIRS', 'Paare');
  LangDict.Add('PERIOD', 'Zeitraum');
  LangDict.Add('SINGLES', 'Einzelzahlen');
  LangDict.Add('TABLE', 'Tabelle');
  LangDict.Add('TRIPLETS', 'Dreier');
  LangDict.Add('BTN_ADD', 'Hinzufügen');
  LangDict.Add('BTN_EDIT', 'Bearbeiten');
  LangDict.Add('BTN_OK', 'OK');
  LangDict.Add('BTN_CANCEL', 'Abbrechen');
  FDict.Add('de', LangDict);

  // Russian
  LangDict := TDictionary<string,string>.Create;
  LangDict.Add('ANALYTICS', 'Аналитика');
  LangDict.Add('BONUS', 'Дополнительные');
  LangDict.Add('CHART', 'График');
  LangDict.Add('DATE', 'Дата');
  LangDict.Add('DRAWS', 'Розыгрыши');
  LangDict.Add('DRAW_ADD', 'Добавление данных розыгрыша');
  LangDict.Add('DRAWS_COUNT', 'Количество розыгрышей');
  LangDict.Add('DRAW_EDIT', 'Редактирование данных розыгрыша');
  LangDict.Add('DRAW_GAPS', 'Пропуски в розыгрышах');
  LangDict.Add('DRAW_RESULTS', 'Результаты розыгрышей');
  LangDict.Add('EXTRA', 'Дополнительные');
  LangDict.Add('EXTRA_NUMBERS', 'Дополнительные номера');
  LangDict.Add('FREQUENCY', 'Частота');
  LangDict.Add('FREQUENCY_ANALYSIS', 'Частотный анализ');
  LangDict.Add('GAP', 'Пропусков');
  LangDict.Add('GAPS', 'Пропуски');
  LangDict.Add('HEATMAP', 'Тепловая карта');
  LangDict.Add('LANG', 'Язык');
  LangDict.Add('MAIN_NUMBERS', 'Основные номера');
  LangDict.Add('NUMBER', 'Номер');
  LangDict.Add('PAIRS', 'Пары');
  LangDict.Add('PERIOD', 'Период');
  LangDict.Add('SINGLES', 'Одиночные');
  LangDict.Add('TABLE', 'Таблица');
  LangDict.Add('TRIPLETS', 'Тройки');
  LangDict.Add('BTN_ADD', 'Добавить');
  LangDict.Add('BTN_EDIT', 'Редактировать');
  LangDict.Add('BTN_OK', 'ОК');
  LangDict.Add('BTN_CANCEL', 'Отмена');
  FDict.Add('ru', LangDict);
end;

class function TTranslations.GetText(const LangCode, Key: string): string;
var
  LangDict: TDictionary<string,string>;
begin
  Result := Key;
  if Assigned(FDict) and FDict.TryGetValue(LangCode, LangDict) then
    if LangDict.ContainsKey(Key) then
      Result := LangDict[Key];
end;

class procedure TTranslations.Clear;
var
  LangDict: TDictionary<string,string>;
begin
  if Assigned(FDict) then
  begin
    for LangDict in FDict.Values do
      LangDict.Free;
    FDict.Free;
    FDict := nil;
  end;
end;

end.
