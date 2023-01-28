program DataBase;

uses
  Vcl.Forms,
  MainSource in 'MainSource.pas' {MainForm},
  NewSource in 'NewSource.pas' {NewForm},
  barGraph in 'barGraph.pas' {barGraphForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TNewForm, NewForm);
  Application.CreateForm(TbarGraphForm, barGraphForm);
  Application.Run;
end.
