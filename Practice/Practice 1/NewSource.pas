unit NewSource;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl, Vcl.Grids,
  Vcl.Outline, Vcl.Samples.DirOutln, Vcl.ComCtrls;

type
  TNewForm = class(TForm)
    NameEdit: TEdit;
    NameLabel: TLabel;
    PathLabel: TLabel;
    PathEdit: TEdit;
    PathButton: TButton;
    CreateButton: TButton;
    CancelButton: TButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure CreateButtonClick(Sender: TObject);
    procedure PathButtonClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    path, name : string;
  public
    isCreated : boolean;
    function getFullFileName : string;
    function getFileName : string;
  end;

var
  NewForm: TNewForm;

implementation

{$R *.dfm}

function TNewForm.getFullFileName;
begin
  getFullFileName := path + '\' + name + '.dat';
end;



function TNewForm.getFileName: string;
begin
  getFileName := name;
end;



procedure TNewForm.FormShow(Sender: TObject);
begin
  name := 'database';
  path := 'C:\';
  isCreated := false;
end;



procedure TNewForm.NameEditChange(Sender: TObject);
begin
  name := nameEdit.Text;
end;



procedure TNewForm.CreateButtonClick(Sender: TObject);
var validFile : file;
begin
  if path = 'C:\' then
    AssignFile(validFile, path + name + '.dat')
  else
    AssignFile(validFile, path + '\' + name + '.dat');

  {$I-} ReWrite(validFile); {$I+}
  if IOResult <> 0 then
  begin
    MessageDlg('���������� ������� ����', mtError, [mbOK], 0);
  end
  else
  begin
    closeFile(validFile);
    erase(validFile);
    isCreated := true;
    NewForm.hide;
  end;
end;



procedure TNewForm.PathButtonClick(Sender: TObject);
begin
  if (SelectDirectory('', 'C:\', path)) then
    PathEdit.Text := path;
end;



procedure TNewForm.CancelButtonClick(Sender: TObject);
begin
  NewForm.hide;
end;

end.
