program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var k, f1, f2, n : integer;

begin
  write('������� ����� k: '); readln(k);
  f1 := 1;
  f2 := 1;
  n := 1;
  if (k < 1) then
    writeln('������: �������� ����� ������������������ ��������� ������ ��� ������ k �� ����������')
  else
    begin
    writeln('�������� ����� ������������������ ��������� ������ ��� ������ k:');
    writeln('F', n, ' = ', f1);
    n := n + 1;
    repeat
      if (f2 mod 2 <> 0) then
        writeln('F', n, ' = ', f2);
      n := n + 1;
      f2 := f1 + f2;
      f1 := f2 - f1;
    until f2 > k;
    end;
  readln;
end.
