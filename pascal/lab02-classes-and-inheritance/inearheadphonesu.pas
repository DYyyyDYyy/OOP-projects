unit InEarHeadphonesU;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, HeadphonesU;

type
  TEarTipSize = (etsSmall, etsMedium, etsLarge);

  TInEarHeadphones = class(THeadphones)
  private
    FEarTipSize: TEarTipSize;
  public
    constructor Create(AModel: String; ATipSize: TEarTipSize);
    procedure ChangeEarTips(NewSize: TEarTipSize);
    function GetTipSizeStr: String;
    function GetFullStatus: String;
  end;

implementation

constructor TInEarHeadphones.Create(AModel: String; ATipSize: TEarTipSize);
begin
  inherited Create(AModel);
  FEarTipSize := ATipSize;
  WriteLn('This second');
end;

procedure TInEarHeadphones.ChangeEarTips(NewSize: TEarTipSize);
begin
  FEarTipSize := NewSize;
end;

function TInEarHeadphones.GetTipSizeStr: String;
begin
  case FEarTipSize of
    etsSmall: Result := 'Small';
    etsMedium: Result := 'Medium';
    etsLarge: Result := 'Large';
  end;
end;

function TInEarHeadphones.GetFullStatus: String;
begin
  Result := GetStatus + ' | EarTips: ' + GetTipSizeStr;
end;

end.
