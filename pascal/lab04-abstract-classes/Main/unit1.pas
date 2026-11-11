unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type
  { Оголошення базового абстрактного класу та його нащадків }
  TField = class
    function GetData: String; virtual; abstract;
  end;

  TStringField = class(TField)
    Data: String;
    function GetData: String; override;
  end;

  TIntegerField = class(TField)
    Data: Integer;
    function GetData: String; override;
  end;

  TExtendedField = class(TField)
    Data: Extended;
    function GetData: String; override;
  end;

  { Оголошення класу форми }
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ Реалізація методів класів-нащадків TField }

function TStringField.GetData: String;
begin
  Result := Data;
end;

function TIntegerField.GetData: String;
begin
  Result := IntToStr(Data);
end;

function TExtendedField.GetData: String;
begin
  Result := FloatToStrF(Data, ffFixed, 7, 2);
end;

{ Обробники подій натискання кнопок }

procedure TForm1.Button1Click(Sender: TObject);
var
  OS: TStringField;
  S: String;
begin
  OS := TStringField.Create;
  try
    OS.Data := 'Вітаю!';
    S := OS.GetData;
    Label1.Caption := S;
  finally
    OS.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  OI: TIntegerField;
  S: String;
begin
  OI := TIntegerField.Create;
  try
    OI.Data := 12345;
    S := OI.GetData;
    Label1.Caption := S;
  finally
    OI.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  OE: TExtendedField;
  S: String;
begin
  OE := TExtendedField.Create;
  try
    OE.Data := 12.235;
    S := OE.GetData;
    Label1.Caption := S;
  finally
    OE.Free;
  end;
end;

end.
