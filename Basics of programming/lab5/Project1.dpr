program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var a : array [1..10, 1..10] of integer;
    n, i, j : integer;

begin
  write('������� ������ �������: '); readln(n);
  writeln('������� �������:');
  for i := 1 to n do begin
    for j := 1 to n do
      read(a[i, j]);
    readln;
  end;
  writeln('�������, ���������� �� 90 �������� ������:');
  for j := 1 to n do begin
    for i := n downto 1 do
      write(a[i, j], ' ');
    writeln;
  end;
  readln;
end.
