unit GameObjU;


Interface

Uses SysUtils;

Type
  GameObject = class
  Private
    FName : String;
    FX, FY: Integer;
  Public
    Constructor Create(const AName: String; AX, AY: Integer);
    Procedure   SetPosition(AX, AY: Integer);
    Procedure   SetName(const AName: String);
    Function    GetName: String;
    Function    GetX: Integer;
    Function    GetY: Integer;
    Function    GetInfo: String; Virtual;
  end;

Implementation

Constructor GameObject.Create(const AName: String; AX, AY: Integer);
Begin
  FName := AName;
  SetPosition(AX, AY);
end;

Procedure GameObject.SetPosition(AX, AY: Integer);
Begin
  FX := AX;
  FY := AY;
end;

Procedure GameObject.SetName(const AName: String);
Begin
  FName := AName;
end;

Function GameObject.GetName: String;
Begin
  Result := FName;
end;

Function GameObject.GetX: Integer;
Begin
  Result := FX;
end;

Function GameObject.GetY: Integer;
Begin
  Result := FY;
end;

Function GameObject.GetInfo: String;
Begin
  Result := '[GameObject] ' + FName +
            ' | Pos(' + IntToStr(FX) + ', ' + IntToStr(FY) + ')';
end;

end.
