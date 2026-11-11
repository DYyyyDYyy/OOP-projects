unit ChessMatchU;

{$mode objfpc}{$H+}

interface

uses SysUtils, ChessPlayerU, ChessClockU;

type
  TChessMatch = class
  private
    { Посилання на існуючі об'єкти (Агрегація) }
    FWhitePlayer: TChessPlayer;
    FBlackPlayer: TChessPlayer;
    FClock: TChessClock;
  public

    constructor Create(White, Black: TChessPlayer; Clock: TChessClock);
    function GetMatchDetails: String;


  end;

implementation

constructor TChessMatch.Create(White, Black: TChessPlayer; Clock: TChessClock);
begin
  FWhitePlayer := White;
  FBlackPlayer := Black;
  FClock := Clock;
end;

function TChessMatch.GetMatchDetails: String;
begin
  Result := 'Матч: ' + FWhitePlayer.GetInfo + ' [Білі] ПРОТИ ' +
            FBlackPlayer.GetInfo + ' [Чорні]. ' + FClock.GetInfo;
end;

end.
