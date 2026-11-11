unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  TGameState = (gsPlayerTurn, gsGoblinTurn, gsGameOver);

  TGameEntity = class
  public
    Name: String;
    HP: Integer;
    BaseAtk: Integer;
    IsDead: Boolean;

    function CalculateDamage: Integer; virtual; abstract;
    procedure TakeDamage(var Amount: Integer); virtual;
  end;

  TWarrior = class(TGameEntity)
    function CalculateDamage: Integer; override;
  end;

  TMage = class(TGameEntity)
    function CalculateDamage: Integer; override;
  end;

  TArcher = class(TGameEntity)
    function CalculateDamage: Integer; override;
    procedure TakeDamage(var Amount: Integer); override;
  end;

  TGoblin = class(TGameEntity)
    function CalculateDamage: Integer; override;
  end;

  TForm1 = class(TForm)
    btnSelectWarrior: TButton;
    btnSelectMage: TButton;
    btnSelectArcher: TButton;
    GroupBoxWarrior: TGroupBox;
    GroupBoxMage: TGroupBox;
    GroupBoxArcher: TGroupBox;
    lblWarriorName: TLabel;
    lblWarriorHP: TLabel;
    lblWarriorAtk: TLabel;
    lblMageName: TLabel;
    lblMageHP: TLabel;
    lblMageAtk: TLabel;
    lblArcherName: TLabel;
    lblArcherHP: TLabel;
    lblArcherAtk: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnSelectWarriorClick(Sender: TObject);
    procedure btnSelectMageClick(Sender: TObject);
    procedure btnSelectArcherClick(Sender: TObject);
  private
    Warrior: TWarrior;
    Mage: TMage;
    Archer: TArcher;
    Goblin: TGoblin;
    GameState: TGameState;

    procedure StartGame;
    procedure ProcessTurn(TargetHero: TGameEntity; HPLbl: TLabel);
    procedure UpdateLabels;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TGameEntity.TakeDamage(var Amount: Integer);
begin
  if Amount > 0 then
  begin
    HP := HP - Amount;
    if HP <= 0 then
    begin
      HP := 0;
      IsDead := True;
    end;
  end;
end;

procedure TArcher.TakeDamage(var Amount: Integer);
begin
  if Random(100) < 30 then
    Amount := 0
  else
    inherited TakeDamage(Amount);
end;

function TWarrior.CalculateDamage: Integer;
var Variation: Integer;
begin
  Variation := Round(BaseAtk * (Random(21) / 100.0));
  if Random(2) = 0 then Result := BaseAtk + Variation else Result := BaseAtk - Variation;
end;

function TMage.CalculateDamage: Integer;
var Variation: Integer;
begin
  Variation := Round(BaseAtk * (Random(21) / 100.0));
  if Random(2) = 0 then Result := BaseAtk + Variation else Result := BaseAtk - Variation;
end;

function TArcher.CalculateDamage: Integer;
var Variation: Integer;
begin
  Variation := Round(BaseAtk * (Random(21) / 100.0));
  if Random(2) = 0 then Result := BaseAtk + Variation else Result := BaseAtk - Variation;
end;

function TGoblin.CalculateDamage: Integer;
var Variation: Integer;
begin
  Variation := Round(BaseAtk * (Random(21) / 100.0));
  if Random(2) = 0 then Result := BaseAtk + Variation else Result := BaseAtk - Variation;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  Warrior := TWarrior.Create;
  Mage := TMage.Create;
  Archer := TArcher.Create;
  Goblin := TGoblin.Create;
  StartGame;
end;

procedure TForm1.StartGame;
begin
  Memo1.Clear;

  Warrior.Name := 'Воїн';
  Warrior.HP := Random(21) + 90;
  Warrior.BaseAtk := Random(6) + 10;
  Warrior.IsDead := False;

  Mage.Name := 'Маг';
  Mage.HP := Random(11) + 35;
  Mage.BaseAtk := Random(11) + 30;
  Mage.IsDead := False;

  Archer.Name := 'Лучник';
  Archer.HP := Random(6) + 30;
  Archer.BaseAtk := Random(6) + 25;
  Archer.IsDead := False;

  Goblin.Name := 'Гоблін';
  Goblin.HP := Random(31) + 150;
  Goblin.BaseAtk := Random(6) + 25;
  Goblin.IsDead := False;

  UpdateLabels;

  Memo1.Lines.Add('Ви зустріли гобліна!');
  Memo1.Lines.Add(Format('Стати Гобліна -> Життя: %d | Атака: %d', [Goblin.HP, Goblin.BaseAtk]));
  Memo1.Lines.Add('--------------------------------------------------');
  Memo1.Lines.Add('Визначаємо хто атакує першим...');

  if Random(2) = 0 then
  begin
    GameState := gsPlayerTurn;
    Memo1.Lines.Add('Першим ходить ГРАВЕЦЬ!');
    Memo1.Lines.Add('Виберіть персонажа для атаки.');
  end
  else
  begin
    GameState := gsGoblinTurn;
    Memo1.Lines.Add('Першим ходить ГОБЛІН!');
    Memo1.Lines.Add('Гоблін нападає. Виберіть персонажа щоб прийняти удар.');
  end;
end;

procedure TForm1.UpdateLabels;
begin
  lblWarriorHP.Caption := 'Життя: ' + IntToStr(Warrior.HP);
  lblWarriorAtk.Caption := 'Атака: ' + IntToStr(Warrior.BaseAtk);

  lblMageHP.Caption := 'Життя: ' + IntToStr(Mage.HP);
  lblMageAtk.Caption := 'Атака: ' + IntToStr(Mage.BaseAtk);

  lblArcherHP.Caption := 'Життя: ' + IntToStr(Archer.HP) + #10'+ (30% шанс ухилитися)';
  lblArcherAtk.Caption := 'Атака: ' + IntToStr(Archer.BaseAtk);
end;

procedure TForm1.ProcessTurn(TargetHero: TGameEntity; HPLbl: TLabel);
var
  DamageDealt: Integer;
begin
  if GameState = gsGameOver then Exit;

  if TargetHero.IsDead then
  begin
    ShowMessage('Цей персонаж вже мертвий! Виберіть іншого.');
    Exit;
  end;

  if GameState = gsGoblinTurn then
  begin
    DamageDealt := Goblin.CalculateDamage;
    TargetHero.TakeDamage(DamageDealt);

    if DamageDealt = 0 then
      Memo1.Lines.Add(Format('%s спритно УХИЛИВСЯ від атаки гобліна! (0 шкоди)', [TargetHero.Name]))
    else
      Memo1.Lines.Add(Format('%s отримав %d шкоди від атаки гобліна.', [TargetHero.Name, DamageDealt]));

    if TargetHero.IsDead then
    begin
      Memo1.Lines.Add(Format('У персонажа %s залишилося 0 життя. Персонаж %s помер.', [TargetHero.Name, TargetHero.Name]));
      HPLbl.Caption := 'Життя: мертвий';
    end
    else
    begin
      Memo1.Lines.Add(Format('Після атаки персонаж %s має %d життя.', [TargetHero.Name, TargetHero.HP]));
      if TargetHero is TArcher then HPLbl.Caption := 'Життя: ' + IntToStr(TargetHero.HP) + #10'+ (30% шанс ухилитися)'
      else HPLbl.Caption := 'Життя: ' + IntToStr(TargetHero.HP);
    end;

    if Warrior.IsDead and Mage.IsDead and Archer.IsDead then
    begin
      Memo1.Lines.Add('--------------------------------------------------');
      Memo1.Lines.Add('Всі ваші персонажі мертві. Гоблін переміг...');
      GameState := gsGameOver;
      ShowMessage('Гру закінчено. Ви програли.');
      Exit;
    end;

    GameState := gsPlayerTurn;
    Memo1.Lines.Add('');
    Memo1.Lines.Add('--- ХІД ГРАВЦЯ ---');
    Memo1.Lines.Add('Виберіть персонажа для атаки.');
  end
  else if GameState = gsPlayerTurn then
  begin
    DamageDealt := TargetHero.CalculateDamage;
    Goblin.TakeDamage(DamageDealt);

    Memo1.Lines.Add(Format('Гоблін отримав %d шкоди від атаки %s.', [DamageDealt, TargetHero.Name]));

    if Goblin.IsDead then
    begin
      Memo1.Lines.Add('У гобліна залишилося 0 життя. Гоблін помер.');
      GameState := gsGameOver;
      ShowMessage('ВІТАЄМО! Ви вбили гобліна та перемогли у грі!');
    end
    else
    begin
      Memo1.Lines.Add(Format('Після атаки гоблін має %d життя.', [Goblin.HP]));

      GameState := gsGoblinTurn;
      Memo1.Lines.Add('');
      Memo1.Lines.Add('--- ХІД ГОБЛІНА ---');
      Memo1.Lines.Add('Гоблін нападає. Виберіть персонажа щоб прийняти удар.');
    end;
  end;
  Memo1.SelStart := Length(Memo1.Text);
end;

procedure TForm1.btnSelectWarriorClick(Sender: TObject);
begin
  ProcessTurn(Warrior, lblWarriorHP);
end;

procedure TForm1.btnSelectMageClick(Sender: TObject);
begin
  ProcessTurn(Mage, lblMageHP);
end;

procedure TForm1.btnSelectArcherClick(Sender: TObject);
begin
  ProcessTurn(Archer, lblArcherHP);
end;

end.
