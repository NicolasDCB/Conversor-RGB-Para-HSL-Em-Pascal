unit uprincipal;



{$mode objfpc}{$H+}



interface



uses

  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Math;



type



  { TForm1 }



  TForm1 = class(TForm)

    BtnRGBtoHSL: TButton;

    BtnHSLtoRGB: TButton;

    EditS: TEdit;

    EditL: TEdit;

    EditR: TEdit;

    EditB: TEdit;

    EditG: TEdit;

    EditH: TEdit;

    Label1: TLabel;

    Label2: TLabel;

    Label3: TLabel;

    Label4: TLabel;

    Label5: TLabel;

    Label6: TLabel;

    ShapeCor: TShape;

    procedure BtnRGBtoHSLClick(Sender: TObject);

    procedure BtnHSLtoRGBClick(Sender: TObject);

    procedure EditLChange(Sender: TObject);

    procedure EditSChange(Sender: TObject);

    procedure EditHChange(Sender: TObject);

    procedure Label1Click(Sender: TObject);

    procedure ShapeCorClick(Sender: TObject);

  private



  public



  end;



var

  Form1: TForm1;



implementation



{$R *.lfm}



{ TForm1 }



procedure TForm1.Label1Click(Sender: TObject);

begin



end;



procedure TForm1.ShapeCorClick(Sender: TObject);

begin



end;



procedure TForm1.EditHChange(Sender: TObject);

begin



end;



procedure TForm1.EditSChange(Sender: TObject);

begin



end;



procedure TForm1.EditLChange(Sender: TObject);

begin



end;

// Converte RGB (0-255) para HSL (0-240)

procedure RGBtoHSL(R, G, B: Byte; var H, S, L: Integer);

var

  minVal, maxVal, delta: Double;

  dr, dg, db, h_temp, s_temp, l_temp: Double;

begin

  dr := R / 255; dg := G / 255; db := B / 255;

  maxVal := Max(dr, Max(dg, db));

  minVal := Min(dr, Min(dg, db));

  delta := maxVal - minVal;

  l_temp := (maxVal + minVal) / 2;



  if delta = 0 then

  begin

    h_temp := 0; s_temp := 0;

  end

  else

  begin

    if l_temp < 0.5 then s_temp := delta / (maxVal + minVal)

    else s_temp := delta / (2.0 - maxVal - minVal);



    if dr = maxVal then h_temp := (dg - db) / delta

    else if dg = maxVal then h_temp := 2.0 + (db - dr) / delta

    else h_temp := 4.0 + (dr - dg) / delta;



    h_temp := h_temp / 6.0;

    if h_temp < 0 then h_temp := h_temp + 1.0;

  end;



  H := Round(h_temp * 240) mod 240;

  S := Round(s_temp * 240);

  L := Round(l_temp * 240);

end;



// Função auxiliar para HSLtoRGB

function HueToRGB(v1, v2, vH: Double): Double;

begin

  if vH < 0 then vH := vH + 1;

  if vH > 1 then vH := vH - 1;

  if (6 * vH) < 1 then Result := v1 + (v2 - v1) * 6 * vH

  else if (2 * vH) < 1 then Result := v2

  else if (3 * vH) < 2 then Result := v1 + (v2 - v1) * ((2/3) - vH) * 6

  else Result := v1;

end;



// Converte HSL (0-240) para RGB (0-255)

procedure HSLtoRGB(H, S, L: Integer; var R, G, B: Byte);

var

  v1, v2, h_norm, s_norm, l_norm: Double;

begin

  h_norm := H / 240; s_norm := S / 240; l_norm := L / 240;

  if s_norm = 0 then

  begin

    R := Round(l_norm * 255); G := R; B := R;

  end

  else

  begin

    if l_norm < 0.5 then v2 := l_norm * (1.0 + s_norm)

    else v2 := (l_norm + s_norm) - (s_norm * l_norm);

    v1 := 2.0 * l_norm - v2;

    R := Round(255 * HueToRGB(v1, v2, h_norm + (1/3)));

    G := Round(255 * HueToRGB(v1, v2, h_norm));

    B := Round(255 * HueToRGB(v1, v2, h_norm - (1/3)));

  end;

end;

procedure TForm1.BtnRGBtoHSLClick(Sender: TObject);

var r, g, b: Byte; h, s, l: Integer;

begin

  r := StrToIntDef(EditR.Text, 0);

  g := StrToIntDef(EditG.Text, 0);

  b := StrToIntDef(EditB.Text, 0);

  RGBtoHSL(r, g, b, h, s, l);

  EditH.Text := IntToStr(h);

  EditS.Text := IntToStr(s);

  EditL.Text := IntToStr(l);

  ShapeCor.Brush.Color := RGBToColor(r, g, b);

end;



procedure TForm1.BtnHSLtoRGBClick(Sender: TObject);

var r, g, b: Byte; h, s, l: Integer;

begin

  h := StrToIntDef(EditH.Text, 0);

  s := StrToIntDef(EditS.Text, 0);

  l := StrToIntDef(EditL.Text, 0);

  HSLtoRGB(h, s, l, r, g, b);

  EditR.Text := IntToStr(r);

  EditG.Text := IntToStr(g);

  EditB.Text := IntToStr(b);

  ShapeCor.Brush.Color := RGBToColor(r, g, b);

end;





end.
