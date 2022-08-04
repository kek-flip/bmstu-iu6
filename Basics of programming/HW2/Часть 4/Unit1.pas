unit Unit1;

interface
  type func = function (x : real) : real;
  procedure MASSHTAB (var m : real; b : integer; f : func; p : real);

implementation
  procedure MASSHTAB;
  var bb : real;
  begin
    bb := b;
    m := bb / f(p);
  end;

end.
