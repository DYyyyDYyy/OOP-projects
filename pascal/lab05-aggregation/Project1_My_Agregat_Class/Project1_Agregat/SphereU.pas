unit SPHEREU;

{$mode objfpc}{$H+}


Interface

Uses SICHU;

Type
  Sphere = class
  Private

    GolovSich : Sich;
  Public
    Constructor Create(x, y, z, r : Real);
    Procedure   SetSphere(x, y, z, r : Real);
    Function    Volume   : Real;
    Function    GetPoint : String;
  end;

Implementation

Constructor Sphere.Create(x, y, z, r : Real);
Begin
  GolovSich := Sich.Create(x, y, z, r);
end;

Procedure Sphere.SetSphere(x, y, z, r : Real);
Begin
  GolovSich.SetSich(x, y, z, r);
end;


Function Sphere.GetPoint : String;
Begin
  Result := GolovSich.GetPoint;
end;


Function Sphere.Volume : Real;
Begin
  Result := (4.0 / 3.0) * Pi
            * GolovSich.GetRad
            * GolovSich.GetRad
            * GolovSich.GetRad;
end;

end.
