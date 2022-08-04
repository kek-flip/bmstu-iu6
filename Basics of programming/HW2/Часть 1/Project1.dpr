program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var i, n, k : integer;
    s : real;
    a : array [1..1000] of real;

begin
  write('¬ведите размер массива: '); readln(n);
  writeln('¬ведите элементы массива: ');
  for i := 1 to n do
    read(a[i]);
  readln;
  for i := 2 to n do
  begin
    k := i;
    while (a[k] >= a[k - 1]) and (k > 1) do
    begin
      s := a[k];
      a[k] := a[k - 1];
      a[k - 1] := s;
      k := k - 1;
    end;
  end;
  writeln('ќтсортированный по убыванию массив: ');
  for i := 1 to n do
    writeln(a[i]:5:5);
  readln;
end.
