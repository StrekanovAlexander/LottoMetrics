unit uValidators;

interface

uses
  System.SysUtils, Vcl.StdCtrls, Vcl.Controls, Vcl.Dialogs;

type TValidators = class
  public
    class procedure ValidateEdit(Control: TWinControl);
end;

implementation

class procedure TValidators.ValidateEdit(Control: TWinControl);
var
  i: Integer;
  N: Integer;
  Edit: TEdit;
begin
  for i := 0 to Control.ControlCount - 1 do
  begin
    if Control.Controls[i] is TWinControl then
      ValidateEdit(TWinControl(Control.Controls[i]));

    if Control.Controls[i] is TEdit then
    begin
      Edit := TEdit(Control.Controls[i]);
      if not TryStrToInt(Edit.Text, N) then
      begin
        ShowMessage('Values are not valid!');
        Edit.SetFocus;
        Abort;
      end;
    end;
  end;
end;

end.
