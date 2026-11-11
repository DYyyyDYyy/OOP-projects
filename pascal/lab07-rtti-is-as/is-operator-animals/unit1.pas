unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type
  TAnimal = class
  public
    name  : String;
    sound : String;
    Constructor Create(AName: String; ASound: String);
    function Describe: String;
  end;

  TDog = class(TAnimal)
  public
    Constructor Create(AName: String);
  end;

  TCat = class(TAnimal)
  public
    Constructor Create(AName: String);
  end;

  TParrot = class(TAnimal)
  public
    Constructor Create(AName: String);
  end;

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

Constructor TAnimal.Create(AName: String; ASound: String);
begin
  Self.name  := AName;
  Self.sound := ASound;
end;

function TAnimal.Describe: String;
begin
  Result := Self.name + ' каже: ' + Self.sound;
end;

Constructor TDog.Create(AName: String);
begin
  inherited Create(AName, 'Гав!');
end;

Constructor TCat.Create(AName: String);
begin
  inherited Create(AName, 'Няв!');
end;

Constructor TParrot.Create(AName: String);
begin
  inherited Create(AName, 'Кра-кра!');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  animal  : TAnimal;
  dog     : TDog;
  cat     : TCat;
  parrot  : TParrot;
begin
  dog    := TDog.Create('Рекс');
  cat    := TCat.Create('Мурчик');
  parrot := TParrot.Create('Кеша');

  if dog is TAnimal then
    ShowMessage(dog.Describe + #13#10 + '→ Рекс є твариною (TAnimal)');

  if cat is TAnimal then
    ShowMessage(cat.Describe + #13#10 + '→ Мурчик є твариною (TAnimal)');

  if parrot is TAnimal then
    ShowMessage(parrot.Describe + #13#10 + '→ Кеша є твариною (TAnimal)');

  animal := dog;

  if animal is TDog then
    ShowMessage(animal.name + ' — це собака (TDog)');

  if animal is TCat
    then ShowMessage(animal.name + ' — це кіт (TCat)')
    else ShowMessage(animal.name + ' — НЕ є котом (TCat)');

  if animal is TParrot
    then ShowMessage(animal.name + ' — це папуга (TParrot)')
    else ShowMessage(animal.name + ' — НЕ є папугою (TParrot)');

  animal := parrot;

  if animal is TParrot then
    ShowMessage(animal.name + ' — тепер це папуга (TParrot)');

  if animal is TDog
    then ShowMessage(animal.name + ' — це собака')
    else ShowMessage(animal.name + ' — НЕ є собакою');
end;

end.
