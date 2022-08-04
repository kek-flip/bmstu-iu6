program Project1;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type faculty = object
private
  name : string;
  teachers, students : integer;
public
  procedure Init(n : string; t, s : integer);
  procedure Info;
  function StudPerTeach : real;

  function getStudents : integer;
  function getTeachers : integer;
  function getName : string;
end;

procedure faculty.Init(n: string; t: Integer; s: Integer);
begin
  name := n;
  teachers := t;
  students := s;
end;

procedure faculty.Info;
begin
  writeln('��������� ', name);
  writeln('���-�� ��������������: ', teachers);
  writeln('���-�� ���������: ', students);
end;

function faculty.StudPerTeach: real;
begin
  StudPerTeach := students / teachers;
end;

function faculty.getStudents: Integer;
begin
  getStudents := students;
end;

function faculty.getTeachers: Integer;
begin
  getTeachers := teachers;
end;

function faculty.getName: string;
begin
  getName := name;
end;


type university = object
  fac : array of faculty;
  procedure Init(arr : array of faculty; n : integer);
  procedure Info;
  function biggestFac : faculty;
  function smallestFac : faculty;
  function avgStudPerTeach : real;
end;

procedure university.Init(arr : array of faculty; n: Integer);
var i : integer;
begin
  setlength(fac, n);
  for i := 0 to n - 1 do
    fac[i] := arr[i];
end;

procedure university.Info;
var i : integer;
begin
  writeln('���������� � ����������� ������������: ');
  for i := 0 to high(fac) do
  begin
    fac[i].info;
    writeln('===================================');
  end;
end;

function university.biggestFac: faculty;
var i : integer;
    max : faculty;
begin
  max := fac[0];
  for i := 0 to high(fac) do
  begin
    if (max.getStudents < fac[i].getStudents) then
      max := fac[i];
  end;
  biggestFac := max;
end;

function university.smallestFac : faculty;
var i : integer;
    min : faculty;
begin
  min := fac[0];
  for i := 0 to high(fac) do
  begin
    if (min.getStudents > fac[i].getStudents) then
      min := fac[i];
  end;
  smallestFac := min;
end;

function university.avgStudPerTeach: Real;
var sum : real;
    i : integer;
begin
  sum := 0;
  for i := 0 to high(fac) do
    sum := sum + fac[i].StudPerTeach;
  avgStudPerTeach := sum / (high(fac) + 1);
end;

var arr : array [1..3] of faculty;
    i, t, s : integer;
    n : string;
    univer : university;

begin
  for i := 1 to 3 do
  begin
    writeln('������� �������� ����������: ');
    readln(n);
    writeln('������� ���-�� �������������� � ���������: ');
    readln(t, s);
    arr[i].Init(n, t, s);
  end;
  writeln;
  arr[1].Info;
  writeln('��������� �� ��������������: ', arr[1].StudPerTeach:2:2);
  writeln('=================================');
  writeln;
  univer.Init(arr, 3);
  univer.Info;
  writeln;
  writeln('������������ �� ����� �������� ���������: ', univer.biggestFac.getName,
   ' (', univer.biggestFac.getStudents, ')');
   writeln('����������� �� ����� �������� ���������: ', univer.smallestFac.getName,
   ' (', univer.smallestFac.getStudents, ')');
  write('������� ����� ��������� �� ��������������: ', univer.avgStudPerTeach:2:2);
  readln;
end.
