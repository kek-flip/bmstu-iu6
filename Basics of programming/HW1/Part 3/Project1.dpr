program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var k : integer; r, s, eps : real;

begin
  write('������� ��������: '); readln(eps);
  k := 0;
  s := 0;
  repeat
    k := k + 1;
    if ((k - 1) mod 2 = 0) then r := 1 / k
    else r := -1 / k;
    s := s + r;
  until (abs(s - ln(2)) < eps);
  writeln('����� � �������� ��������� ����� ', s:16:16);
  writeln('���������� �������� ����� ', k);
  readln;
end.








//���������� �������� ������� ��������������� ��������

{������� ��������: 0.01
����� � �������� ��������� ����� 0.6832471605759183
���������� �������� ����� 50

������� ��������: 0.0001
����� � �������� ��������� ����� 0.6930471905599515
���������� �������� ����� 5000}
