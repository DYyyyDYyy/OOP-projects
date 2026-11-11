unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Sender = Button1 then
  begin
    Caption := 'Натиснуто 1-у кнопку';
    ShowMessage('Натиснуто 1-у кнопку');
  end
  else
  begin
    Caption := 'Натиснуто 2-у кнопку';
    ShowMessage('Натиснуто 2-у кнопку');
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  n: Integer;
  S: String;
begin
  with Sender as TEdit do
  begin
    n := Pos(',', Text);
    if Pos(',', Text) <> 0 then
    begin
      S := Text;
      S[n] := '.';
      Text := S;
      SelStart := n + 1;
    end;
  end;
end;

end.
