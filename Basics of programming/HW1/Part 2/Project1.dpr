program Project1;
{$APPTYPE CONSOLE}
{$R *.res}
uses
  System.SysUtils;

var a, b, x1, x2, x3, x4 : integer;

begin
  write('������� ����� a � b (a < b): '); readln(a, b);
  if (a < b) then
  begin
    x1 := a * a * a * a;
    x2 := a;
    x3 := b;
    x4 := 1;
    if (x1 <> x2) then
      writeln('������� ����� ������ � ����� x = ', a);
    if (x3 <> x4) then
      writeln('������� ����� ������ � ����� x = ', b);
    if (x1 = x2) and (x3 = x4) then
      writeln('������� �� ����� ����� �������');
  end
  else
    writeln('������: a > b');
  readln;
end.
