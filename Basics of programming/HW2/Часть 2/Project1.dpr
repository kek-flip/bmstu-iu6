program Project1;

{$APPTYPE CONSOLE}
{$R *.res}
uses
  System.SysUtils;

var a : array [1..10, 1..10] of integer;
    i, j, k, n, sum, sum1 : integer;
    c, grandCheck : boolean;

begin
  write('Введите размер матрицы: '); readln(n);
  writeln('Введите матрицу:');
  for i := 1 to n do begin
    for j := 1 to n do
      read(a[i, j]);
    readln;
  end;


  writeln('=====================================');

  for i := 1 to n do begin
    for j := 1 to n do
      write(a[i, j], ' ');
    writeln;
  end;

  grandCheck := false;
  for i := 1 to n do
  begin
    sum := 0;
    for j := 1 to n do
      sum :=  sum + a[i, j];

    c := false;
    for j := i + 1 to n do
    begin
      sum1 := 0;
      for k := 1 to n do
        sum1 :=  sum1 + a[j, k];
      if (sum = sum1) then
      begin
        write('Строка ', j, ', ');
        c := true;
        grandCheck := true;
      end;
    end;
    if c then
      writeln('Строка ', i, ' имеют сумму ', sum);
  end;
  if (not grandCheck) then
    writeln('Строк с одинаковой суммой в данной матрице нет');
  readln;
end.
