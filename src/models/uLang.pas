unit uLang;

interface

uses
  System.Generics.Collections;

type
  TLanguage = (langEN, langDE, langRU);

  TLang = class
  public
    class var Translations: TDictionary<string, string>;
    class var CurrentLang: TLanguage;
    class procedure LoadLanguage(ALang: TLanguage);
  end;
implementation

class procedure TLang.LoadLanguage(ALang: TLanguage);
begin
  if Assigned(Translations) then
    Translations.Free;
  Translations := TDictionary<string, string>.Create;

  CurrentLang := ALang;

  case ALang of
    langEN:
      begin
        Translations.Add('ADD', 'Add');
        Translations.Add('ANALYTICS', 'Analytics');
        Translations.Add('DRAWS', 'Draws');
        Translations.Add('DRAW_RESULTS', 'Draw results');
        Translations.Add('EDIT', 'Edit');
        Translations.Add('LANG', 'Language');
        Translations.Add('NUMBER_STATISTICS', 'Number Statistics');
        Translations.Add('PERIOD', 'Period');

        Translations.Add('BTN_OK', 'OK');
        Translations.Add('BTN_CANCEL', 'Cancel');
        Translations.Add('LBL_DATE', 'Draw Date');

      end;
    langDE:
      begin
        Translations.Add('ADD', 'Hinzufügen');
        Translations.Add('ANALYTICS', 'Analyse');
        Translations.Add('DRAWS', 'Ziehungen');
        Translations.Add('DRAW_RESULTS', 'Ziehungsergebnisse');
        Translations.Add('EDIT', 'Bearbeiten');
        Translations.Add('LANG', 'Sprache');
        Translations.Add('NUMBER_STATISTICS', 'Zahlenstatistik');
        Translations.Add('PERIOD', 'Zeitraum');

        Translations.Add('BTN_OK', 'OK');
        Translations.Add('BTN_CANCEL', 'Abbrechen');
        Translations.Add('LBL_DATE', 'Ziehungsdatum');

      end;
    langRU:
      begin
        Translations.Add('ADD', 'Добавить');
        Translations.Add('ANALYTICS', 'Аналитика');
        Translations.Add('DRAWS', 'Розыгрыши');
        Translations.Add('DRAW_RESULTS', 'Результаты розыгрышей');
        Translations.Add('EDIT', 'Редактировать');
        Translations.Add('LANG', 'Язык');
        Translations.Add('NUMBER_STATISTICS', 'Статистика по номерам');
        Translations.Add('PERIOD', 'Период');

        Translations.Add('BTN_OK', 'OK');
        Translations.Add('BTN_CANCEL', 'Отмена');
        Translations.Add('LBL_DATE', 'Дата розыгрыша');

      end;
  end;
end;

end.

