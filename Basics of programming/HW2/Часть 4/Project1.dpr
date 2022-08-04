program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Unit1 in 'Unit1.pas';

function f1 (x : real) : real;
begin
  f1 := x * sin(x);
end;

function f2 (x : real) : real;
begin
  f2 := sin(x) / cos(x);
end;

var p : real;
    b : integer;
    m1, m2 : real;

begin
  write('������� B: '); readln(b);
  p := 1;  //����� ��������� �� [-1, 1]. �������� ������������.
  MASSHTAB(m1, b, f1, p);
  MASSHTAB(m2, b, f2, p);
  writeln('������� ������� x * sin(x): ', m1:5:5);
  writeln('������� ������� tg(x): ', m2:5:5);
  readln;
end.
