unit SphereU;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;

const
  PI = 3.14159;

type
  Sphere = class(TObject)
  private
    R: Real;
  public
    constructor Create; overload;
    constructor Creat(x: Real);
    procedure SetRadius(newRadius: Real);
    function GetRadius: Real;
    function GetDiameter: Real;
    function GetLKola: Real;
    function GetArea: Real;
    function GetVolume: Real;
    procedure DisplayStatistics;
  end;

implementation

constructor Sphere.Create;
begin
  R := 1.0;
end;

constructor Sphere.Creat(x: Real);
begin
  R := x;
end;

procedure Sphere.SetRadius(newRadius: Real);
begin
  if R > 0 then R := newRadius else R := 1.0;
end;

function Sphere.GetRadius: Real;
begin
  Result := R;
end;

function Sphere.GetDiameter: Real;
begin
  Result := 2.0 * R;
end;

function Sphere.GetLKola: Real;
begin
  Result := PI * GetDiameter;
end;

function Sphere.GetArea: Real;
begin
  Result := 4.0 * PI * R * R;
end;

function Sphere.GetVolume: Real;
var
  radiusCubed: Real;
begin
  radiusCubed := R * R * R;
  Result := (4.0 * PI * radiusCubed) / 3.0;
end;

procedure Sphere.DisplayStatistics;
begin
  Writeln('Radius = ', GetRadius:0:14);
  Writeln('Diameter = ', GetDiameter:0:14);
  Writeln('LKola = ', GetLKola:10:5);
  Writeln('Area = ', GetArea:10:5);
  Writeln('Volume = ', GetVolume:10:5);
end;

end.
