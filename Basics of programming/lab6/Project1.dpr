program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var s : string;
    i, count, k : integer;


begin
  write('Введите текст: '); readln(s);
  k := 0;
  count := 0;
  for i := 1 to length(s) do
  begin
    if (s[i] = ' ') then
    begin
      if (s[i - 1] = '.') then
        continue;
      k := k + 1;
    end;
    if (s[i] = '.') then
    begin
      if (k + 1 > 3) then
        count := count + 1;
      k := 0;
    end;
  end;
  writeln('Количество предложений, длиннее трех слов: ', count);
  readln;
end.
