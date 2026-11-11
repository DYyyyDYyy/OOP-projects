unit POINTS;

{$mode objfpc}{$H+}


Interface

Uses SysUtils;

Type
  Point = class
  Private
    x, y, z : Real;
  Public
    Constructor Create(x1, y1, z1 : Real);
    Procedure   SetPoint(x1, y1, z1 : Real);
    Function    GetPoint : String;
  end;

Implementation


Constructor Point.Create(x1, y1, z1 : Real);
Begin
  SetPoint(x1, y1, z1);
end;


Procedure Point.SetPoint(x1, y1, z1 : Real);
Begin
  x := x1;
  y := y1;
  z := z1;
end;


Function Point.GetPoint : String;
Begin
  GetPoint := '(' + FloatToStr(x) + '; '
                  + FloatToStr(y) + '; '
                  + FloatToStr(z) + ')';
end;

end.
