unit SICHU;

{$mode objfpc}{$H+}


Interface

Uses POINTS, SysUtils;

Type
  Sich = class
  Private
    Center : Point;
    Rad    : Real;
  Public
    Constructor Create(x, y, z, r : Real);
    Procedure   SetSich(x, y, z, r : Real);
    Procedure   SetRad(r : Real);
    Function    GetPoint : String;
    Function    GetRad   : Real;
  end;

Implementation

Procedure Sich.SetRad(r : Real);
Begin
  if r >= 0 then Rad := r
  else           Rad := 0;
end;



Constructor Sich.Create(x, y, z, r : Real);
Begin
  Center := Point.Create(x, y, z);
  SetRad(r);
end;


Procedure Sich.SetSich(x, y, z, r : Real);
Begin
  Center.SetPoint(x, y, z);
  SetRad(r);
end;


Function Sich.GetPoint : String;
Begin
  Result := Center.GetPoint + ', Rad = ' + FloatToStr(Rad);
end;

Function Sich.GetRad : Real;
Begin
  Result := Rad;
end;

end.
