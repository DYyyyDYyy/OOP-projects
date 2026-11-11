program chessaggreg;

{$mode objfpc}{$H+}
{$APPTYPE CONSOLE}

uses
  SysUtils,
  ChessPlayerU in 'ChessPlayerU.pas',
  ChessClockU in 'ChessClockU.pas',
  ChessMatchU in 'ChessMatchU.pas';


var
  Player1, Player2: TChessPlayer;
  TournamentClock: TChessClock;
  FinalMatch: TChessMatch;

begin
  WriteLn('=== 1. Створення незалежних об''єктів ===');
  Player1 := TChessPlayer.Create('Магнус Карлсен', 2830);
  Player2 := TChessPlayer.Create('Хікару Накамура', 2789);
  TournamentClock := TChessClock.Create('3 хв + 2 сек');

  WriteLn(Player1.GetInfo);
  WriteLn(Player2.GetInfo);
  WriteLn(TournamentClock.GetInfo);
  WriteLn;

  WriteLn('=== 2. Створення матчу (Агрегація) ===');

  FinalMatch := TChessMatch.Create(Player1, Player2, TournamentClock);
  WriteLn(FinalMatch.GetMatchDetails);
  WriteLn;

  WriteLn('=== 3. Завершення матчу (Знищення об''єкта матчу) ===');
  FinalMatch.Free;
  WriteLn('Об''єкт матчу знищено.');
  WriteLn;

  WriteLn('=== 4. Перевірка незалежності об''єктів ===');

  WriteLn('Гравець 1 після матчу все ще існує: ', Player1.GetInfo);
  WriteLn('Годинник все ще можна використовувати: ', TournamentClock.GetInfo);


  Player1.Free;
  Player2.Free;
  TournamentClock.Free;

  WriteLn;
  WriteLn('Натисніть Enter для виходу...');
  ReadLn;
end.
