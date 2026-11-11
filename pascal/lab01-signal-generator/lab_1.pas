unit lab_1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Spin, Math;

type
  TVector = array of Double;

  TForm1 = class(TForm)
    btnGraph: TButton;
    btnSpectrum: TButton;
    cbFuncType: TComboBox;
    cbIntegMethod: TComboBox;
    FloatSpinEditA: TFloatSpinEdit;
    FloatSpinEditB: TFloatSpinEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    SpinEditHarmonics: TSpinEdit;
    SpinEditPoints: TSpinEdit;
    procedure btnGraphClick(Sender: TObject);
    procedure btnSpectrumClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Xe, Ye, Yg: TVector;
    Ak, Bk, Ck: TVector;
    A0: Double;
    Ne, Ng: Integer;
    Tp, Al, Bl: Double;

    function GetFunctionValue(t: Double): Double;
    procedure TabulateFunction;
    procedure CalculateFourier;
    procedure DrawGraphs;
    procedure DrawSpectrum;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  cbFuncType.ItemIndex := 0;
  cbIntegMethod.ItemIndex := 0;
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.FillRect(Image1.ClientRect);
end;

function TForm1.GetFunctionValue(t: Double): Double;
var
  LocalT, w: Double;
begin

  LocalT := t - Floor((t - Al) / Tp) * Tp;
  
  
  if Tp <> 0 then w := 2 * Pi / Tp else w := 1;

  case cbFuncType.ItemIndex of
    0: // Прямокутна
       begin
       //if LocalT < Tp / 2 then Result := 10.0 else Result := 0.0;
       Result := 1 * Sin(w * LocalT) + 1 * Cos( w * LocalT);
       end;

    1: // Пилкоподібна 
       Result := 10.0 * (LocalT / Tp);

    2: // Трикутна 
       if LocalT < Tp / 2 then Result := 20.0 * LocalT / Tp 
       else Result := 20.0 * (1 - LocalT / Tp);
       
    else Result := 0;
  end;
end;

procedure TForm1.TabulateFunction;
var
  i: Integer;
  h: Double;
begin
  h := Tp / Ne;
  SetLength(Xe, Ne);
  SetLength(Ye, Ne);
  for i := 0 to Ne - 1 do
  begin
    Xe[i] := Al + i * h;
    Ye[i] := GetFunctionValue(Xe[i]);
  end;
end;

procedure TForm1.CalculateFourier;
var
  i, k: Integer;
  w, h, Arg, SumCos, SumSin, Weight: Double;
  Method: Integer;
begin
  SetLength(Ak, Ng + 1);
  SetLength(Bk, Ng + 1);
  SetLength(Ck, Ng + 1);
  SetLength(Yg, Ne);

  w := 2 * Pi / Tp;
  h := Tp / Ne;
  Method := cbIntegMethod.ItemIndex;

  A0 := 0;
  for i := 0 to Ne - 1 do
  begin
    Weight := 1.0;
    if Method = 1 then
    begin
      if (i = 0) or (i = Ne - 1) then Weight := 0.5;
    end
    else if Method = 2 then
    begin
      if (i = 0) or (i = Ne - 1) then Weight := 1.0
      else if (i mod 2 <> 0) then Weight := 4.0
      else Weight := 2.0;
    end;
    A0 := A0 + Ye[i] * Weight;
  end;

  if Method = 2 then A0 := (2 / Tp) * (h / 3) * A0
  else A0 := (2 / Tp) * h * A0;

  for k := 1 to Ng do
  begin
    SumCos := 0;
    SumSin := 0;
    for i := 0 to Ne - 1 do
    begin
      Arg := k * w * Xe[i];
      Weight := 1.0;
      if Method = 1 then
      begin
        if (i = 0) or (i = Ne - 1) then Weight := 0.5;
      end
      else if Method = 2 then
      begin
        if (i = 0) or (i = Ne - 1) then Weight := 1.0
        else if (i mod 2 <> 0) then Weight := 4.0
        else Weight := 2.0;
      end;
      SumCos := SumCos + Ye[i] * Cos(Arg) * Weight;
      SumSin := SumSin + Ye[i] * Sin(Arg) * Weight;
    end;

    if Method = 2 then
    begin
      Ak[k] := (2 / Tp) * (h / 3) * SumCos;
      Bk[k] := (2 / Tp) * (h / 3) * SumSin;
    end
    else
    begin
      Ak[k] := (2 / Tp) * h * SumCos;
      Bk[k] := (2 / Tp) * h * SumSin;
    end;
    Ck[k] := Sqrt(Sqr(Ak[k]) + Sqr(Bk[k]));
  end;

  for i := 0 to Ne - 1 do
  begin
    Yg[i] := A0 / 2;
    for k := 1 to Ng do
    begin
      Arg := k * w * Xe[i];
      Yg[i] := Yg[i] + Ak[k] * Cos(Arg) + Bk[k] * Sin(Arg);
    end;
  end;
end;

procedure TForm1.DrawGraphs;
var
  MinX, MaxX, MinY, MaxY: Double;
  ScaleX, ScaleY: Double;
  OffsetX, OffsetY: Integer;
  W, H, i: Integer;
  CurrentVal, StepX, StepY: Double;
  Px, Py: Integer;
  S: String;
  TextW, TextH: Integer;

  function GetNiceStep(Range: Double): Double;
  var
    RoughStep, Exponent, Mag, Fraction: Double;
  begin
    if Range = 0 then Exit(1.0);
    RoughStep := Range / 10.0;
    Exponent := Floor(Log10(RoughStep));
    Mag := Power(10, Exponent);
    Fraction := RoughStep / Mag;
    if Fraction < 1.5 then Result := 1.0 * Mag
    else if Fraction < 3.5 then Result := 2.0 * Mag
    else if Fraction < 7.5 then Result := 5.0 * Mag
    else Result := 10.0 * Mag;
  end;

  function MapX(val: Double): Integer;
  begin
    Result := OffsetX + Round((val - MinX) * ScaleX);
  end;

  function MapY(val: Double): Integer;
  begin
    Result := H - OffsetY - Round((val - MinY) * ScaleY);
  end;

begin
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.FillRect(Image1.ClientRect);
  Image1.Canvas.Font.Size := 8;
  Image1.Canvas.Font.Color := clBlack;

  W := Image1.Width;
  H := Image1.Height;
  OffsetX := 45;
  OffsetY := 30;

  MinX := Al; MaxX := Bl;
  MinY := -5; MaxY := 15;

  for i := 0 to Ne - 1 do
  begin
    if Ye[i] > MaxY then MaxY := Ye[i];
    if Ye[i] < MinY then MinY := Ye[i];
    if Yg[i] > MaxY then MaxY := Yg[i];
    if Yg[i] < MinY then MinY := Yg[i];
  end;
  MinY := MinY - Abs(MinY * 0.1) - 0.5;
  MaxY := MaxY + Abs(MaxY * 0.1) + 0.5;

  if MaxX <= MinX then MaxX := MinX + 1e-5;
  if MaxY <= MinY then MaxY := MinY + 1e-5;

  ScaleX := (W - 2 * OffsetX) / (MaxX - MinX);
  ScaleY := (H - 2 * OffsetY) / (MaxY - MinY);

  StepX := GetNiceStep(MaxX - MinX);
  CurrentVal := Ceil(MinX / StepX) * StepX;
  while CurrentVal <= MaxX + (StepX / 1000) do
  begin
    Px := MapX(CurrentVal);
    if Abs(CurrentVal) < (StepX * 1e-5) then
    begin
      Image1.Canvas.Pen.Color := clBlack;
      Image1.Canvas.Pen.Width := 2;
      Image1.Canvas.Pen.Style := psSolid;
    end
    else
    begin
      Image1.Canvas.Pen.Color := $00E0E0E0;
      Image1.Canvas.Pen.Style := psDot;
      Image1.Canvas.Pen.Width := 1;
    end;
    Image1.Canvas.MoveTo(Px, OffsetY);
    Image1.Canvas.LineTo(Px, H - OffsetY);
    S := FloatToStrF(CurrentVal, ffGeneral, 6, 2);
    TextW := Image1.Canvas.TextWidth(S);
    Image1.Canvas.Brush.Style := bsClear;
    Image1.Canvas.TextOut(Px - (TextW div 2), H - OffsetY + 5, S);
    CurrentVal := CurrentVal + StepX;
  end;

  StepY := GetNiceStep(MaxY - MinY);
  CurrentVal := Ceil(MinY / StepY) * StepY;
  while CurrentVal <= MaxY + (StepY / 1000) do
  begin
    Py := MapY(CurrentVal);
    if Abs(CurrentVal) < (StepY * 1e-5) then
    begin
      Image1.Canvas.Pen.Color := clBlack;
      Image1.Canvas.Pen.Width := 2;
      Image1.Canvas.Pen.Style := psSolid;
    end
    else
    begin
      Image1.Canvas.Pen.Color := $00E0E0E0;
      Image1.Canvas.Pen.Style := psDot;
      Image1.Canvas.Pen.Width := 1;
    end;
    Image1.Canvas.MoveTo(OffsetX, Py);
    Image1.Canvas.LineTo(W - OffsetX, Py);
    S := FloatToStrF(CurrentVal, ffGeneral, 6, 2);
    TextW := Image1.Canvas.TextWidth(S);
    TextH := Image1.Canvas.TextHeight(S);
    Image1.Canvas.Brush.Style := bsClear;
    Image1.Canvas.TextOut(OffsetX - TextW - 5, Py - (TextH div 2), S);
    CurrentVal := CurrentVal + StepY;
  end;

  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Pen.Width := 1;
  Image1.Canvas.Pen.Style := psSolid;
  Image1.Canvas.Brush.Style := bsClear;
  Image1.Canvas.Rectangle(OffsetX, OffsetY, W - OffsetX, H - OffsetY);

  Image1.Canvas.Brush.Style := bsSolid;

  if Length(Xe) > 0 then
  begin
    Image1.Canvas.Pen.Color := clBlue;
    Image1.Canvas.Pen.Width := 2;
    Image1.Canvas.MoveTo(MapX(Xe[0]), MapY(Ye[0]));
    for i := 1 to Ne - 1 do
      Image1.Canvas.LineTo(MapX(Xe[i]), MapY(Ye[i]));
  end;

  if Length(Xe) > 0 then
  begin
    Image1.Canvas.Pen.Color := clRed;
    Image1.Canvas.Pen.Width := 2;
    Image1.Canvas.MoveTo(MapX(Xe[0]), MapY(Yg[0]));
    for i := 1 to Ne - 1 do
      Image1.Canvas.LineTo(MapX(Xe[i]), MapY(Yg[i]));
  end;

  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Pen.Width := 1;
  Image1.Canvas.Rectangle(OffsetX + 10, OffsetY + 5, OffsetX + 220, OffsetY + 25);
  Image1.Canvas.Pen.Color := clBlue;
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.MoveTo(OffsetX + 20, OffsetY + 15);
  Image1.Canvas.LineTo(OffsetX + 40, OffsetY + 15);
  Image1.Canvas.TextOut(OffsetX + 45, OffsetY + 8, 'f(t)');
  Image1.Canvas.Pen.Color := clRed;
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.MoveTo(OffsetX + 80, OffsetY + 15);
  Image1.Canvas.LineTo(OffsetX + 100, OffsetY + 15);
  Image1.Canvas.TextOut(OffsetX + 105, OffsetY + 8, 'Fourier');
end;
procedure TForm1.DrawSpectrum;
var
  W, H, k, i: Integer;
  X, Y, Y0, OffsetX, OffsetY: Integer;
  MaxC, ScaleX, ScaleY, w_freq, Freq, StepC, CurrentC: Double;
  S: String;
  TextW, TextH: Integer;
begin
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.FillRect(Image1.ClientRect);
  Image1.Canvas.Font.Size := 8;
  Image1.Canvas.Font.Color := clBlack;

  W := Image1.Width;
  H := Image1.Height;
  OffsetX := 60;
  OffsetY := 40;
  Y0 := H - OffsetY;

  MaxC := 0.0001;
  for k := 1 to Ng do
    if Ck[k] > MaxC then MaxC := Ck[k];
  MaxC := MaxC * 1.1;

  ScaleX := (W - OffsetX - 30) / (Ng + 1);
  ScaleY := (H - OffsetY - 30) / MaxC;

  if Tp <> 0 then w_freq := 2 * Pi / Tp else w_freq := 1;

  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.Pen.Style := psSolid;
  Image1.Canvas.MoveTo(OffsetX, Y0);
  Image1.Canvas.LineTo(W - 10, Y0);
  Image1.Canvas.MoveTo(OffsetX, Y0);
  Image1.Canvas.LineTo(OffsetX, 10);

  Image1.Canvas.TextOut(5, 5, 'C_k');
  Image1.Canvas.TextOut(W - 40, Y0 + 20, 'w');

  StepC := MaxC / 5;
  Image1.Canvas.Brush.Style := bsClear;

  for i := 0 to 5 do
  begin
    CurrentC := i * StepC;
    Y := Y0 - Round(CurrentC * ScaleY);

    Image1.Canvas.Pen.Color := clBlack;
    Image1.Canvas.Pen.Width := 1;
    Image1.Canvas.Pen.Style := psSolid;
    Image1.Canvas.MoveTo(OffsetX - 5, Y);
    Image1.Canvas.LineTo(OffsetX, Y);

    if i > 0 then
    begin
      Image1.Canvas.Pen.Color := $00E0E0E0;
      Image1.Canvas.Pen.Style := psDot;
      Image1.Canvas.MoveTo(OffsetX, Y);
      Image1.Canvas.LineTo(W - 10, Y);
    end;

    S := FloatToStrF(CurrentC, ffFixed, 6, 2);
    TextW := Image1.Canvas.TextWidth(S);
    TextH := Image1.Canvas.TextHeight(S);
    Image1.Canvas.TextOut(OffsetX - TextW - 8, Y - (TextH div 2), S);
  end;

  Image1.Canvas.Brush.Style := bsSolid;
  for k := 1 to Ng do
  begin
    X := OffsetX + Round(k * ScaleX);
    Y := Y0 - Round(Ck[k] * ScaleY);

    Image1.Canvas.Pen.Color := clFuchsia;
    Image1.Canvas.Pen.Width := 3;
    Image1.Canvas.Pen.Style := psSolid;
    Image1.Canvas.MoveTo(X, Y0);
    Image1.Canvas.LineTo(X, Y);

    Image1.Canvas.Brush.Color := clFuchsia;
    Image1.Canvas.Pen.Width := 1;
    Image1.Canvas.Ellipse(X - 3, Y - 3, X + 3, Y + 3);

    Freq := k * w_freq;
    S := FloatToStrF(Freq, ffFixed, 6, 2);
    TextW := Image1.Canvas.TextWidth(S);

    Image1.Canvas.Pen.Color := clBlack;
    Image1.Canvas.MoveTo(X, Y0);
    Image1.Canvas.LineTo(X, Y0 + 5);

    Image1.Canvas.Brush.Style := bsClear;
    Image1.Canvas.Font.Color := clBlack;
    Image1.Canvas.TextOut(X - (TextW div 2), Y0 + 8, S);
  end;
end;
procedure TForm1.btnGraphClick(Sender: TObject);
begin
  Al := FloatSpinEditA.Value;
  Bl := FloatSpinEditB.Value;
  Tp := Bl - Al;
  Ne := SpinEditPoints.Value;
  Ng := SpinEditHarmonics.Value;
  if Tp <= 0 then
  begin
    ShowMessage('Помилка: Невірний інтервал');
    Exit;
  end;
  TabulateFunction;
  CalculateFourier;
  DrawGraphs;
end;

procedure TForm1.btnSpectrumClick(Sender: TObject);
begin
  if Length(Ck) > 0 then
    DrawSpectrum
  else
    ShowMessage('Спочатку побудуйте графіки!');
end;

end.
