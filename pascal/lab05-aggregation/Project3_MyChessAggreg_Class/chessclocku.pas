unit ChessClockU;

{$mode objfpc}{$H+}

interface

uses SysUtils;

type
  TChessClock = class
  private
    FTimeControl: String;
  public
    constructor Create(ATimeControl: String);
    function GetInfo: String;
  end;

implementation

constructor TChessClock.Create(ATimeControl: String);
begin
  FTimeControl := ATimeControl;
end;

function TChessClock.GetInfo: String;
begin
  Result := 'Контроль часу: ' + FTimeControl;
end;

end.
