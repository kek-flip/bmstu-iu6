program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type
  pointer = ^element;
  element = record
    val : string;
    next, prev : pointer;
  end;

var first, last, q : pointer;
    buf : element;
    c : char;

begin
  writeln('������� ������������������ ��������: ');
  new(first);
  first^.prev := nil;
  first^.next := nil;
  last := first;
  read(c);
  if c <> #$D then
    first^.val := c;
  read(c);
  while c <> #$D do
  begin
    new(q);
    q^.val := c;
    q^.prev := last;
    q^.next := nil;
    last^.next := q;
    last := q;
    read(c);
  end;
  readln;

  writeln('������������ ������: ');
  q := last;
  while q^.prev <> nil do
  begin
    write(q^.val, ' ');
    q := q^.prev;
  end;
  write(q^.val, ' ');
  writeln;

  writeln('���������� # ����� A: ');
  q := first;
  while q^.next <> nil do
  begin
    if q^.val = 'A' then
      q^.val := q^.val + '#';
    write(q^.val, ' ');
    q := q^.next;
  end;
  if q^.val = 'A' then
      q^.val := q^.val + '#';
  write(q^.val, ' ');


  dispose(q);
  dispose(first);
  dispose(last);

  readln;
end.
