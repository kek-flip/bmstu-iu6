unit C_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var sum : real;
    operation : char = '@';
    s : string;

procedure operate;
var code : integer;
    n : real;
begin
  s := Form1.Edit1.Text;
  Form1.Edit1.clear;
  val(s, n, code);
  case operation of
    '@' : sum := n;
    '+' : sum := sum + n;
    '-' : sum := sum - n;
    '*' : sum := sum * n;
    '/' : sum := sum / n;
  end;
end;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject); //+
begin
  operate;
  operation:='+';
  Edit1.setfocus;
end;

procedure TForm1.Button2Click(Sender: TObject); //*
begin
  operate;
  operation:='*';
  Edit1.setfocus;
end;

procedure TForm1.Button3Click(Sender: TObject); // /
begin
  operate;
  operation:='/';
  Edit1.setfocus;
end;

procedure TForm1.Button4Click(Sender: TObject); //-
begin
  operate;
  operation:='-';
  Edit1.setfocus;
end;

procedure TForm1.Button5Click(Sender: TObject); //=
begin
  operate;
  str(sum:6:3, s);
  Edit1.text:=s;
  operation:='@';
  Edit1.setfocus;
end;

procedure TForm1.Button6Click(Sender: TObject); //C
begin
  Edit1.Clear;
  operation := '@';
  Edit1.SetFocus;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  close;
end;

end.
