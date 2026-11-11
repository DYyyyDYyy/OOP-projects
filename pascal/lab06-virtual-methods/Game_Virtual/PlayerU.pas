unit PlayerU;


Interface

Uses CharacterU, SysUtils;

Type
  Player = class(Character)
  Private
    FScore : LongInt;
    FWeapon: String;
  Public
    Constructor Create(const AName: String;
                       AX, AY, AHP, ALevel: Integer;
                       const AWeapon: String;
                       AScore: LongInt);
    Procedure   SetScore(AScore: LongInt);
    Procedure   SetWeapon(const AWeapon: String);
    Procedure   AddScore(APoints: LongInt);
    Function    GetScore: LongInt;
    Function    GetWeapon: String;
    Function    CalcDamage: Integer;
    Function    GetInfo: String; Override;
  end;

Implementation

Constructor Player.Create(const AName: String;
                           AX, AY, AHP, ALevel: Integer;
                           const AWeapon: String;
                           AScore: LongInt);
Begin
  Inherited Create(AName, AX, AY, AHP, ALevel);
  FWeapon := AWeapon;
  SetScore(AScore);
end;

Procedure Player.SetScore(AScore: LongInt);
Begin
  if AScore >= 0 then FScore := AScore
  else                FScore := 0;
end;

Procedure Player.AddScore(APoints: LongInt);
Begin
  Inc(FScore, APoints);
end;

Procedure Player.SetWeapon(const AWeapon: String);
Begin
  FWeapon := AWeapon;
end;

Function Player.GetScore: LongInt;
Begin
  Result := FScore;
end;

Function Player.GetWeapon: String;
Begin
  Result := FWeapon;
end;

Function Player.CalcDamage: Integer;
Begin
  Result := FLevel * 5;
end;

Function Player.GetInfo: String;
Begin
  Result := (Inherited GetInfo) +
            ' | Зброя: '  + FWeapon +
            ' | Рахунок: ' + IntToStr(FScore) +
            ' | Урон: '   + IntToStr(CalcDamage);

  Result := '[Player]' + Copy(Result, Length('[Character]') + 1, MaxInt);
end;

end.
