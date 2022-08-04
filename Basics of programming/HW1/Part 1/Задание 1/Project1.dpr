program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Var
  y:real;
begin
  y := 1;
  WriteLn('До преобразований    y = ', y:20:16);
  y := y / 6000;
  y := exp(y);
  y := sqrt(y);
  y := y / 14;
  y := 14 * y;
  y := sqr(y);
  y := ln(y);
  y := 6000 * y;
  WriteLn('После преобразований y = ', y:20:16);
  readln;
end.

