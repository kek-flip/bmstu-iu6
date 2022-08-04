program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  stack in 'stack.pas';

var a : TSortStack; i, val : integer;

begin
  a := TSortStack.create('a');
  randomize;
  for i := 1 to 10 do
  begin
    val := random(1000);
    if (val mod 2 = 0) then
      a.push(val)
    else
      a.push(char(random(26) + 97));
  end;
  write('Stack of random elements: '); a.print;
  a.sort;
  write('Sorted stack: '); a.print;
  a.delete;
  readln;
end.
