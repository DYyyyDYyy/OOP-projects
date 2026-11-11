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
    { Конструктор не створює нових гравців чи годинник, а лише приймає посилання на них }
    constructor Create(White, Black: TChessPlayer; Clock: TChessClock);
    function GetMatchDetails: String;

    { Зверніть увагу: ми НЕ пишемо деструктор, який би знищував (Free) ці об'єкти,
      оскільки матч не є їхнім власником. }
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
