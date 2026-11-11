unit SPHEREU;

{$mode objfpc}{$H+}


Interface

Uses SICHU;

Type
  Sphere = class(Sich)
  Public
    Constructor Create(x, y, z, r : Real);
    Function    Volume : Real;

  end;

Implementation


Constructor Sphere.Create(x, y, z, r : Real);
Begin
  Inherited Create(x, y, z, r);
end;

Function Sphere.Volume : Real;
Begin
  Result := (4.0 / 3.0) * Pi * Rad * Rad * Rad;
end;

end.
