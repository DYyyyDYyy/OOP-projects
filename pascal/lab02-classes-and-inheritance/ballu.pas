unit BallU;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, SphereU;

type
  Colored = (RED, GREEN, BLUE, YELLOW, WHITE, BLACK);

  Ball = class(Sphere)
  private
    theName: String;
  public
    c: Colored;

    constructor Creat(initR: Real; const initName: String; initColor: Colored);
    procedure SetName(newName: String);
    procedure SetColor(newColor: Colored);
    function GetName: String;
    function GetColor: Colored;
    function GetColorName: String;
    procedure ResetBall(newRadius: Real; newName: String; newColor: Colored);
  end;

implementation

constructor Ball.Creat(initR: Real; const initName: String; initColor: Colored);
begin
  Inherited SetRadius(initR);
  theName := initName;
  c := initColor;
end;

procedure Ball.SetName(NewName: String);
begin
  theName := NewName;
end;

procedure Ball.SetColor(NewColor: Colored);
begin
  c := NewColor;
end;

function Ball.GetName: String;
begin
  Result := theName;
end;

function Ball.GetColor: Colored;
begin
  Result := c;
end;

function Ball.GetColorName: String;
var
  ColorName: String;
begin
  case c of
    RED: ColorName := 'RED';
    GREEN: ColorName := 'GREEN';
    BLUE: ColorName := 'BLUE';
    YELLOW: ColorName := 'YELLOW';
    WHITE: ColorName := 'WHITE';
    BLACK: ColorName := 'BLACK';
  end;
  Result := ColorName;
end;

procedure Ball.ResetBall(newRadius: Real; newName: String; newColor: Colored);
begin
  SetRadius(NewRadius);
  SetName(newName);
  SetColor(newColor);
end;

end.
