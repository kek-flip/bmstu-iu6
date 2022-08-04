program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var F, G : text;
    fname, gname, s : string;
    i : integer;



begin
  write('¬ведите им€ файла F: '); readln(fname);
  assignFile(f, fname);
  reWrite(f);
  writeln('¬ведите строку или #: ');
  readln(s);
  while (s <> '#') do
  begin
    writeln(f, s);
    readln(s);
  end;

  write('¬ведите им€ файла G: '); readln(gname);
  assignFile(g, gname);
  reWrite(g);
  reSet(f);
  i := 1;
  while not EOF(f) do
  begin
    readln(f, s);
    if (i mod 2 = 1) then
    begin
      writeln(g, s);
    end;
    i := i + 1;
  end;

  readln;
  closeFile(f);
  closeFile(g);
end.
