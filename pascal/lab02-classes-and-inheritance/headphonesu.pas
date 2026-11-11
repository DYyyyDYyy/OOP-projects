unit HeadphonesU;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;

type
  THeadphones = class
  private
    FModel: String;
    FVolume: Integer;
    FIsConnected: Boolean;
  public
    constructor Create(AModel: String);
    procedure ToggleConnection;
    procedure ChangeVolume(Delta: Integer);
    function GetStatus: String;
  end;

implementation

constructor THeadphones.Create(AModel: String);
begin
  FModel := AModel;
  FVolume := 50;
  FIsConnected := False;
  WriteLn('This First');
end;

procedure THeadphones.ToggleConnection;
begin
  FIsConnected := not FIsConnected;
end;

procedure THeadphones.ChangeVolume(Delta: Integer);
begin
  if FIsConnected then
  begin
    FVolume := FVolume + Delta;
    if FVolume > 100 then FVolume := 100;
    if FVolume < 0 then FVolume := 0;
  end;
end;

function THeadphones.GetStatus: String;
var
  StateStr: String;
begin
  if FIsConnected then
    StateStr := 'Connected'
  else
    StateStr := 'Disconnected';

  Result := Format('Model: %s | Status: %s | Volume: %d%%',
                   [FModel, StateStr, FVolume]);
end;

end.
