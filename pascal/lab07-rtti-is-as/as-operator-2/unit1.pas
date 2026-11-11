unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnWarrior: TButton;
    btnMage: TButton;
    btnArcher: TButton;
    edtHealth: TEdit;
    edtMana: TEdit;
    lblClass: TLabel;
    procedure ClassButtonClick(Sender: TObject);
    procedure StatEditChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.ClassButtonClick(Sender: TObject);
begin
  if Sender = btnWarrior then
    lblClass.Caption := 'Обрано клас: Воїн'
  else if Sender = btnMage then
    lblClass.Caption := 'Обрано клас: Маг'
  else if Sender = btnArcher then
    lblClass.Caption := 'Обрано клас: Лучник';
end;

procedure TForm1.StatEditChange(Sender: TObject);
var
  S: String;
begin
  with Sender as TEdit do
  begin
    S := Text;
    if Pos('-', S) > 0 then
    begin
      S := StringReplace(S, '-', '', [rfReplaceAll]);
      Text := S;
      SelStart := Length(Text);
    end;
  end;
end;

end.
