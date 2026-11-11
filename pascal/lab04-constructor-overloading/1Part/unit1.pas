unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Types;

type
  { TRectang }
  TRectang = class
  private
    coord: array[0..3] of Integer; // масив координат
  public
    // перевантажені конструктори
    constructor Create(left, top, right, bottom: Integer); overload;
    constructor Create(topLeft, bottomRight: TPoint); overload;
  end;

  { TForm1 }
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private

    rect1, rect2: TRectang;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TRectang }

constructor TRectang.Create(left, top, right, bottom: Integer);
begin
  coord[0] := left;
  coord[1] := top;
  coord[2] := right;
  coord[3] := bottom;
end;

constructor TRectang.Create(topLeft, bottomRight: TPoint);
begin
  coord[0] := topLeft.X;
  coord[1] := topLeft.Y;
  coord[2] := bottomRight.X;
  coord[3] := bottomRight.Y;
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  point1, point2: TPoint;
begin

  point1 := Point(65, 75);
  point2 := Point(95, 100);

  rect1 := TRectang.Create(22, 43, 54, 75);
  rect2 := TRectang.Create(point1, point2);
end;

procedure TForm1.FormPaint(Sender: TObject);
begin

  if Assigned(rect1) and Assigned(rect2) then
  begin
    with Canvas do
    begin
      Pen.Width := 3;
      Pen.Color := clRed;
      Rectangle(rect1.coord[0], rect1.coord[1], rect1.coord[2], rect1.coord[3]);

      Pen.Width := 4;
      Pen.Color := clGreen;
      Rectangle(rect2.coord[0], rect2.coord[1], rect2.coord[2], rect2.coord[3]);
    end;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin

  rect1.Free;
  rect2.Free;
end;

end.
