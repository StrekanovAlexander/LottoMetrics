unit uControls;

interface

uses
  System.SysUtils, Vcl.StdCtrls, Vcl.Controls, Vcl.Dialogs;

type TControls = class
  class function GetEditValues(Container: TWinControl): string;
end;

implementation

class function TControls.GetEditValues(Container: TWinControl): string;
var
  i: Integer;
  ed: TEdit;
begin
  Result := '';
  for i := 0 to Container.ControlCount - 1 do
  begin
    if Container.Controls[i] is TEdit then
    begin
      ed := TEdit(Container.Controls[i]);
      if Result <> '' then
        Result := Result + ',';
      Result := Result + ed.Text;
    end
    else if Container.Controls[i] is TWinControl then
    begin
      if Result <> '' then
        Result := Result + ',';
      Result := Result + GetEditValues(TWinControl(Container.Controls[i]));
    end;
  end;
end;

end.
