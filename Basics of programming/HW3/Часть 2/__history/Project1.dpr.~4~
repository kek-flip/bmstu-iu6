program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type resistor = object
  protected resistance : real;
  procedure Init(r : real);
  procedure Info;
  function Amperage(u : real) : real;
end;

procedure resistor.Init(r: Real);
begin
  resistance := r;
end;

procedure resistor.Info;
begin
  writeln('Сопротивление резистора равно ', resistance:3:3);
end;

function resistor.Amperage(u: Real): Real;
begin
  Amperage := u / resistance;
end;

type rheostat = object(resistor)
  private part : real;
  procedure Init(r, p : real);
  procedure Info;
  function Amperage(u : real) : real;
end;

procedure rheostat.Init(r, p : real);
begin
  resistance := r;
  part := p;
end;

procedure rheostat.Info;
begin
  writeln('Сопротивление реостата равно ', resistance:3:3);
  writeln('Доля сопротивления ', part * 100 : 2 : 2, '%');
end;

function rheostat.Amperage(u: Real): Real;
begin
  Amperage := inherited Amperage(u) / part;
end;

var res : resistor;
    reo : rheostat;
    r1, r2, p, u1, u2 : real;

begin
  write('Ввеидте сопротивление резистора: '); readln(r1);
  res.Init(r1);
  write('Введите нарпяжение на резисторе: '); readln(u1);
  res.Info;
  writeln('Сила тока на резисторе равна ', res.Amperage(u1):3:3);
  writeln('===============================');
  write('Введите сопротивление реостата: '); readln(r2);
  write('Введите долю сопротивления реостата: '); readln(p);
  reo.Init(r2, p);
  write('Введите нарпяжение на реостате: '); readln(u2);
  reo.Info;
  writeln('Сила тока на реостате равна ', reo.Amperage(u2):3:3);
  readln;
end.
