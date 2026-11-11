program Game_Virtual;



{$APPTYPE CONSOLE}

Uses
  SysUtils,
  GameObjU   in 'GameObjU.pas',
  CharacterU in 'CharacterU.pas',
  PlayerU    in 'PlayerU.pas';

Type
  GameMas = array[1..3] of GameObject;

Var
  GM: GameMas;
  i : Integer;
  P : Player;


Procedure Line;
Begin
  WriteLn('----------------------------------------------------------');
end;

Begin

  WriteLn;



  GM[1] := GameObject.Create('Дерево', 5, 3);


  GM[2] := Character.Create('Гоблін', 12, 8, 80, 3);


  GM[3] := Player.Create('Герой', 0, 0, 200, 10, 'Меч вогню', 4200);


  WriteLn('1) Виклик GetInfo через масив GameMas:');
  Line;
  For i := 1 to 3 do
    WriteLn('GM[', i, '] -> ', GM[i].GetInfo);


  WriteLn;
  WriteLn('2) Перевірка типів оператором "is":');
  Line;
  For i := 1 to 3 do
  Begin
    Write('GM[', i, '] (', GM[i].GetName, ')');
    Write('  is GameObject -> ', (GM[i] is GameObject) : 5);
    Write('  is Character  -> ', (GM[i] is Character)  : 5);
    WriteLn('  is Player     -> ', (GM[i] is Player)    : 5);
  end;


  WriteLn;
  WriteLn('3) Приведення типу оператором "as" для виклику CalcDamage:');
  Line;
  if GM[3] is Player then
  Begin
    WriteLn('GM[3] є Player -> CalcDamage = ',
            (GM[3] as Player).CalcDamage, ' одиниць');
    WriteLn('GM[3] є Player -> Score      = ',
            (GM[3] as Player).GetScore);
  end;

  if GM[2] is Character then
    WriteLn('GM[2] є Character -> HP = ',
            (GM[2] as Character).GetHP,
            ', Level = ', (GM[2] as Character).GetLevel);


  WriteLn;
  WriteLn('4) Пряма робота з об''єктом Player (без масиву):');
  Line;
  P := Player.Create('Маг', 2, 7, 150, 8, 'Посох бурі', 9999);
  P.AddScore(500);
  P.SetWeapon('Посох грому');
  WriteLn(P.GetInfo);
  WriteLn('IsAlive: ', P.IsAlive);
  WriteLn('CalcDamage: ', P.CalcDamage);


  For i := 1 to 3 do
    GM[i].Free;
  P.Free;

  WriteLn;
  WriteLn('==========================================================');
  WriteLn('Натисніть Enter для виходу...');
  ReadLn;
end.
