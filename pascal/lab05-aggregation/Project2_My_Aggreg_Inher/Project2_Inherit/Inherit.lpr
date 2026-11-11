program Inherit;

{$mode objfpc}{$H+}
{$APPTYPE CONSOLE}



uses
  SysUtils,
  Points  in 'Points.pas',
  SichU   in 'SichU.pas',
  SphereU in 'SphereU.pas';

Var
  P : Point;

Begin

  WriteLn('=== Об''єкт класу Point ===');
  P := Point.Create(1, 2, 3);
  WriteLn(P.GetPoint);
  P.Free;
  WriteLn;


  WriteLn('=== Об''єкт класу Sich ===');
  P := Sich.Create(1, 2, 4, 7);
  WriteLn(P.GetPoint);
  WriteLn(Sich(P).GetPoint);
  P.Free;
  WriteLn;


  WriteLn('=== Об''єкт класу Sphere ===');
  P := Sphere.Create(1, 2, 5, 5);
  WriteLn(P.GetPoint);
  WriteLn(Sphere(P).GetPoint);
  WriteLn('Volume Sphere = ', Sphere(P).Volume : 10 : 4);
  P.Free;

  WriteLn;
  WriteLn('Натисніть Enter для виходу...');
  ReadLn;
End.
