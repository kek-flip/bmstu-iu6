unit Main_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Add_unit, Search_unit;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);
begin
   Form2.show;
   Form2.edit1.setfocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  form3.show;
  Form3.Edit1.SetFocus;
end;

procedure TForm1.Button3Click(Sender: TObject);   //close
begin
  close;
end;

end.
