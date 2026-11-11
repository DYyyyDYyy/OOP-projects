unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  TTriangle = class
  private
    FArea: Double;
  public
    constructor Create(a, b, c: Double); overload;
    constructor Create(base, height: Double); overload;
    function GetArea: Double;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

constructor TTriangle.Create(a, b, c: Double);
var
  p: Double;
begin
  p := (a + b + c) / 2.0;
  if (p > a) and (p > b) and (p > c) then
    FArea := Sqrt(p * (p - a) * (p - b) * (p - c))
  else
    FArea := 0;
end;

constructor TTriangle.Create(base, height: Double);
begin
  FArea := 0.5 * base * height;
end;

function TTriangle.GetArea: Double;
begin
  Result := FArea;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Tri1, Tri2: TTriangle;
begin
  Memo1.Clear;

  Tri1 := TTriangle.Create(3.0, 4.0, 5.0);
  Memo1.Lines.Add('Площа (сторони 3, 4, 5): ' + FloatToStrF(Tri1.GetArea, ffFixed, 8, 2));

  Tri2 := TTriangle.Create(10.0, 5.0);
  Memo1.Lines.Add('Площа (основа 10, висота 5): ' + FloatToStrF(Tri2.GetArea, ffFixed, 8, 2));

  Tri1.Free;
  Tri2.Free;
end;

end.
