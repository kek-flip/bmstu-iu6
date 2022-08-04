program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

function isSimple(n : integer) : boolean;
var i : integer;
begin
  if (n = 1) then
  begin
    isSimple := false;
    exit;
  end;
  i := 2;
  while (i * i <= n) do
  begin
    if (n mod i = 0) then
    begin
      isSimple := false;
      exit;
    end;
    i := i + 1;
  end;
  isSimple := true;
end;

var a : array [1..1000] of integer;
    i, n, k : integer;

begin
  k := 0;
  write('Введите размер массива: '); readln(n);
  writeln('Введите массив: ');
  for i := 1 to n do
  begin
    read(a[i]);
    if (isSimple(a[i])) then
      k := k + 1;
  end;
  readln;
  writeln('Кол-во простых числе в массиве: ', k);
  readln;
end.
