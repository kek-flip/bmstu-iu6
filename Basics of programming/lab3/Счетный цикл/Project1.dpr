program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var k, f1, f2, i : integer;

begin
  write('Введите число k: '); readln(k);
  f1 := 1;
  f2 := 1;
  if (k < 1) then
    writeln('Ошибка: нечетных чисел последовательности Фибоначчи меньше или равных k не существует')
  else
    begin
    writeln('Нечетные числа последовательности Фибоначчи меньше или равные k:');
    writeln('F1 = ', f1);
    for i := 2 to k do
      begin
      if (f2 > k) then break;
      if (f2 mod 2 <> 0) then
        writeln('F', i, ' = ', f2);
      f2 := f1 + f2;
      f1 := f2 - f1;
      end;
    end;
  readln;
end.
