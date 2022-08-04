program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type salary = object
  private val : real;
  procedure init(v : real);
  procedure showSal;
  procedure incSal(d : real);
  function realSal : real;
end;

procedure salary.init(v: Real);
begin
  val := v;
end;

procedure salary.showSal;
begin
  writeln('Текущая зарплата равна: ', val:2:2);
end;

procedure salary.incSal(d: Real);
begin
  val := val + d;
end;

function salary.realSal: Real;
begin
  if val > 5e6 then
    realSal := val * (1.0 - 0.15)
  else
    realSal := val * (1.0 - 0.13);
end;

var sal : salary;
    buf, delta : real;

begin
  write('Введите зарплату: '); readln(buf);
  sal.init(buf);
  sal.showSal;
  writeln('Зарплата за вычетом НДФЛ равна ', sal.realSal:2:2);
  writeln('================================');
  write('Введите изменение зарплаты: '); readln(delta);
  sal.incSal(delta);
  sal.showSal;
  writeln('Зарплата за вычетом НДФЛ равна ', sal.realSal:2:2);
  readln;
end.
