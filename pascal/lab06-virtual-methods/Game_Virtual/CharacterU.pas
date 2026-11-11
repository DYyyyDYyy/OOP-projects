unit CharacterU;


Interface

Uses GameObjU, SysUtils;

Type
  Character = class(GameObject)
  Protected
    FHP   : Integer;
    FLevel: Integer;
  Public
    Constructor Create(const AName: String; AX, AY, AHP, ALevel: Integer);
    Procedure   SetHP(AHP: Integer);
    Procedure   SetLevel(ALevel: Integer);
    Function    GetHP: Integer;
    Function    GetLevel: Integer;
    Function    IsAlive: Boolean;
    Function    GetInfo: String; Override;
  end;

Implementation

Constructor Character.Create(const AName: String;
                              AX, AY, AHP, ALevel: Integer);
Begin
  Inherited Create(AName, AX, AY);
  SetHP(AHP);
  SetLevel(ALevel);
end;

Procedure Character.SetHP(AHP: Integer);
Begin
  if AHP >= 0 then FHP := AHP
  else             FHP := 0;
end;

Procedure Character.SetLevel(ALevel: Integer);
Begin
  if ALevel >= 1 then FLevel := ALevel
  else                FLevel := 1;
end;

Function Character.GetHP: Integer;
Begin
  Result := FHP;
end;

Function Character.GetLevel: Integer;
Begin
  Result := FLevel;
end;

Function Character.IsAlive: Boolean;
Begin
  Result := FHP > 0;
end;

Function Character.GetInfo: String;
Var
  StatusStr: String;
Begin
  if IsAlive then StatusStr := 'живий'
  else            StatusStr := 'мертвий';

  Result := (Inherited GetInfo) +
            ' | HP: '    + IntToStr(FHP) +
            ' | Рівень: ' + IntToStr(FLevel) +
            ' | Статус: ' + StatusStr;

  Result := '[Character]' + Copy(Result, Length('[GameObject]') + 1, MaxInt);
end;

end.
