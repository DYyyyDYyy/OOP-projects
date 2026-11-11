program Project1;

{$mode objfpc}{$H+}
{$APPTYPE CONSOLE}

uses
  SysUtils,
  SphereU in 'SphereU.pas',
  BallU in 'BallU.pas',
  HeadphonesU in 'HeadphonesU.pas',
  InEarHeadphonesU in 'InEarHeadphonesU.pas';

var
  MySphere: Sphere;
  nSphere: Sphere;
  MyBall: Ball;
  nBall: Ball;
  newRadius: Real;
  S: String;
  WorkInEars: TInEarHeadphones;
  SportInEars: TInEarHeadphones;

begin
  Writeln('--- Загальне ---');
  newRadius := 20.0;

  MySphere := Sphere.Create;
  nSphere := Sphere.Creat(6.0);
  MySphere.SetRadius(newRadius);

  Writeln('=== Статистика nSphere ===');
  nSphere.DisplayStatistics;
  Writeln('N_LKola = ', 2.0 * PI * MySphere.GetRadius:0:14);
  Writeln;

  MyBall := Ball.Create;
  MyBall.SetRadius(newRadius);

  Writeln('=== Статистика myBall ===');
  MyBall.DisplayStatistics;
  Writeln;

  nBall := Ball.Creat(100, 'Kulka', GREEN);
  Writeln('Ball_Name = ', nBall.GetName);

  nBall.SetName('Sharyk');
  Writeln('Ball_Name = ', nBall.GetName);

  S := nBall.GetColorName;
  Writeln('Ball_Color = ', S);
  Writeln('Ball_LKola = ', 2 * PI * nBall.GetRadius:12:4);
  Writeln(' *************** ');

  nBall.ResetBall(10, 'PingPong', BLUE);

  Writeln('Ball_New_Name = ', nBall.GetName);
  S := nBall.GetColorName;
  Writeln('Ball_New_Color = ', S);
  Writeln('Ball_New_Lkola = ', 2 * PI * nBall.GetRadius:12:4);
  Writeln;

  Writeln('--- Додаткове завдання(навушники) ---');
  WorkInEars := TInEarHeadphones.Create('Moondrop Chu', etsSmall);
  SportInEars := TInEarHeadphones.Create('KZ ZSN Pro', etsMedium);

  WorkInEars.ToggleConnection;
  WorkInEars.ChangeVolume(30);

  SportInEars.ToggleConnection;
  SportInEars.ChangeVolume(15);
  SportInEars.ChangeEarTips(etsLarge);

  Writeln(WorkInEars.GetFullStatus);
  Writeln(SportInEars.GetFullStatus);

  MySphere.Free;
  nSphere.Free;
  MyBall.Free;
  nBall.Free;
  WorkInEars.Free;
  SportInEars.Free;

  Readln;
end.
