program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var b : array [1..40] of integer;
var min, i, n : integer;

begin
  write('������� ������ �������: '); readln(n);
  writeln('������� �������� �������:');
  for i := 1 to n do
    readln(b[i]);
  min := b[1] * b[n];
  for i := 1 to n div 2 do
    if (b[i] * b[n - i + 1] < min) then
      min := b[i] * b[n - i + 1];
  writeln('����������� ���� ������������������ ������������ {b1 * bn; b2 * bn-1; ...; bn/2 * bn/2+1} �����: ', min);
  readln;
end.
