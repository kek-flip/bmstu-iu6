program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var x : array [1..5] of extended; y1 : extended; y2 : extended; y : real; d, eps : extended; i : byte;

begin
  write('Введите значения x: ');
  for i := 1 to 5 do read(x[i]);
  readln;
  for i := 1 to 5 do
  begin
    y1 := (exp(x[i]) - exp(-x[i])) / 2;
    y2 := (exp(x[i]) + exp(-x[i])) / 2;
    y := sqr(y2) - sqr(y1);
    d := abs(1 - y);
    eps := d / 1;
    writeln('x = ', x[i]:20:16);
    writeln('sh x = ', y1:20:16);
    writeln('ch x = ', y2:20:16);
    writeln('(ch x)^2 - (sh x)^2 = ', y:20:16);
    writeln('Абс. погрешность = ', d:20:16);
    writeln('Отн. погрешность = ', eps:20:16);
    writeln('==========================');
  end;
  readln;
end.
