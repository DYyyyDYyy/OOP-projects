program Agregat;

{$mode objfpc}{$H+}
{$APPTYPE CONSOLE}



uses
  SysUtils,
  Points  in 'Points.pas',
  SichU   in 'SichU.pas',
  SphereU in 'SphereU.pas';

Var
  P : Point;
  S : Sphere;

Begin

  P := Point.Create(1, 2, 3);
  WriteLn(' Coords Point  = ', P.GetPoint);
  P.Free;

  S := Sphere.Create(1, 2, 5, 5);
  WriteLn(' Coords Center = ', S.GetPoint);
  WriteLn(' Volume Sphere = ', S.Volume : 10 : 4);
  S.Free;

  WriteLn;
  WriteLn('Натисніть Enter для виходу...');
  ReadLn;
End.
