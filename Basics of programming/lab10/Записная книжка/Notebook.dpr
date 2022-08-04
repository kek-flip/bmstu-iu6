program Notebook;

uses
  Vcl.Forms,
  Main_unit in 'Main_unit.pas' {Form1},
  Add_unit in 'Add_unit.pas' {Form2},
  Search_unit in 'Search_unit.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
