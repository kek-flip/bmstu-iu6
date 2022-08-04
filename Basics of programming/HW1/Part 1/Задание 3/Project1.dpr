program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var x, y1, y2, y : extended;

begin
  write('Введите х = '); readln(x);
  y1 := sin(x);
  y2 := cos(x);
  y := sqr(y1) + sqr(y2);
  if (y = extended(1)) then writeln('Равенство (sin x)^2 + (cos x)^2 = 1 верно')
  else writeln('Равенство (sin x)^2 + (cos x)^2 = 1 не верно');
  readln;
end.
