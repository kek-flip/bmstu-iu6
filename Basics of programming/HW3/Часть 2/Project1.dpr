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
  writeln('������������� ��������� ����� ', resistance:3:3);
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
  writeln('������������� �������� ����� ', resistance:3:3);
  writeln('���� ������������� ', part * 100 : 2 : 2, '%');
end;

function rheostat.Amperage(u: Real): Real;
begin
  Amperage := inherited Amperage(u) / part;
end;

var res : resistor;
    reo : rheostat;
    r1, r2, p, u1, u2 : real;

begin
  write('������� ������������� ���������: '); readln(r1);
  res.Init(r1);
  write('������� ���������� �� ���������: '); readln(u1);
  res.Info;
  writeln('���� ���� �� ��������� ����� ', res.Amperage(u1):3:3);
  writeln('===============================');
  write('������� ������������� ��������: '); readln(r2);
  write('������� ���� ������������� ��������: '); readln(p);
  reo.Init(r2, p);
  write('������� ���������� �� ��������: '); readln(u2);
  reo.Info;
  writeln('���� ���� �� �������� ����� ', reo.Amperage(u2):3:3);
  readln;
end.
