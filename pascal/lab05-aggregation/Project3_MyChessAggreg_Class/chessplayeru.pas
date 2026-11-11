unit ChessPlayerU;

{$mode objfpc}{$H+}

interface

uses SysUtils;

type
  TChessPlayer = class
  private
    FName: String;
    FRating: Integer;
  public
    constructor Create(AName: String; ARating: Integer);
    function GetInfo: String;
  end;

implementation

constructor TChessPlayer.Create(AName: String; ARating: Integer);
begin
  FName := AName;
  FRating := ARating;
end;

function TChessPlayer.GetInfo: String;
begin
  Result := FName + ' (Elo: ' + IntToStr(FRating) + ')';
end;

end.
