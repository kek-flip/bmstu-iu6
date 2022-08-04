program Project1;

{$APPTYPE CONSOLE}
{$R *.res}
uses
  System.SysUtils;

function isGlas(x : string) : boolean;
begin
  if (x = 'a') or (x = 'e') or (x = 'i') or (x = 'o') or (x = 'u') or (x = 'y') then
    isGlas := true
  else
    isGlas := false;
end;

var s : string;
    m : set of 'a'..'z';
    i, k : integer;
    c : 'a'..'z';
    grandCheck : boolean;

begin
  write('Введите предложение нижним регистром: '); readln(s);
  k := 1;
  m := [];
  for i := 1 to length(s) do
  begin
    if(s[i] = ' ') then
      k := k + 1
    else if (k mod 2 = 0) and (isGlas(s[i])) then
      m := m + [s[i]];
  end;

  grandCheck := false;
  writeln('Гласные буквы в четных словах: ');
  for c := 'a' to 'z' do
  begin
    if (c in m) then
    begin
      write(c, ' ');
      grandCheck := true;
    end;
  end;
  if (not grandCheck) then
    writeln('Ошибка: гласные буквы в четных словах отсутствуют');
  readln;
end.
