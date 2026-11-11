unit Unit1;

{$mode objfpc}{$H+}

interface

uses

  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;
type
  TFruit = class
  public
    name: String;
    constructor Create(AName: String);
  end;

  TApple = class(TFruit);
  TPear  = class(TFruit);

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TFruit }

constructor TFruit.Create(AName: String);
begin
  Self.name := AName;
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  fruit : TFruit;
  apple : TApple;
  pear  : TPear;
begin
  apple := TApple.Create('Антонівка');
  pear  := TPear.Create('Бера');

  if apple is TFruit then
    ShowMessage(apple.name + ' - фрукта');

  if pear is TFruit then
    ShowMessage(pear.name + ' - фрукта');

  fruit := apple;

  if fruit is TApple then
    ShowMessage(apple.name + ' - яблуко');

  if fruit is TPear
    then ShowMessage(apple.name + ' - груша')
    else ShowMessage(apple.name + ' - це не груша!');
end;

end.
