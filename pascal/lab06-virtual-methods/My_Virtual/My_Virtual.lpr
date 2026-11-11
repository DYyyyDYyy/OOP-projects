program My_Virtual;


{$APPTYPE CONSOLE}

Uses
  SysUtils,
  POINTS  in 'POINTS.pas',
  SICHU   in 'SICHU.pas',
  SPHEREU in 'SPHEREU.pas';

Type
  PointMas = array[1..3] of Point;

Var
  PM: PointMas;
  i : Integer;

Begin
  WriteLn('=== Проєкт My_Virtual: Динамічне зв''язування ===');
  WriteLn;


  PM[1] := Point.Create(1, 2, 3);
  PM[2] := Sich.Create(1, 2, 4, 7);
  PM[3] := Sphere.Create(1, 2, 5, 5);

  WriteLn('--- Виклик GetPoint через масив Point (динамічне зв''язування) ---');
  For i := 1 to 3 do
    WriteLn('PM[', i, '] = ', PM[i].GetPoint);

  WriteLn;
  WriteLn('--- Явне приведення типу (оператор as) ---');
  WriteLn('Volume сфери = ',
          Sphere(PM[3]).Volume : 10 : 4);

  WriteLn;
  WriteLn('--- Перевірка типу (оператор is) ---');
  For i := 1 to 3 do
  Begin
    Write('PM[', i, '] is Point  -> ', (PM[i] is Point)  : 5);
    Write('   is Sich   -> ', (PM[i] is Sich)   : 5);
    WriteLn('   is Sphere -> ', (PM[i] is Sphere) : 5);
  end;


  For i := 1 to 3 do
    PM[i].Free;

  WriteLn;
  WriteLn('Натисніть Enter для виходу...');
  ReadLn;
end.
