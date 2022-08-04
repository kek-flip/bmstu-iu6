unit Search_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

type zap = record
     fam:string[22]; 		{Фамилия}
     name:string[22];		{Имя}
     phone:string[22]; 		{Телефон}
     adr:string[22];		{Адрес}
  end;
var
  f:file of zap;
  z:zap;
  c:integer;
  fam:string[22];
  isOpened : boolean = false;


procedure TForm3.Button1Click(Sender: TObject);
begin
  AssignFile(f,'C:\Users\normp\Documents\ОП\Лабы ОП\Лаба 10\Записная книжка\notebook.dat');
  reset(f);
  isOpened := true;
  c := 1;
  fam := edit1.text;
   while not eof(f) do
      begin
        read(f,z);
        if fam = z.fam then
           begin
              c:=0;
              edit2.text:=z.name;
              edit3.text:=z.phone;
              edit4.text:=z.adr;
              break;
           end;
      end;
   if c<>0 then
      begin
         edit3.text:='Нет данных';
      end;
   reset(f);
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  if isOpened then closefile(f);
  self.hide;
end;

procedure TForm3.Edit1Click(Sender: TObject);
begin
  edit1.clear;
  edit2.clear;
  edit3.clear;
  edit4.clear;
end;

end.
