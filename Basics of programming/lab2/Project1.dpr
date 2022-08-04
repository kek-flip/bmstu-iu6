program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var x, y : real;

begin
  writeln('Input coordinates: ');
  write('x = '); readln(x);
  write('y = '); readln(y);
  if (x >= 1) and (y >= 1) and (sqr(x - 1) + sqr(y - 1) <= 1) then
    writeln('Point belongs to the area')
  else
    writeln('Point does not belong to the area');
  readln;
end.
