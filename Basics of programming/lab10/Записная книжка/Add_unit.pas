unit Add_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

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
  isOpened : boolean = false;

procedure TForm2.Button1Click(Sender: TObject);
begin
   assignfile(f, 'C:\Users\normp\Documents\ОП\Лабы ОП\Лаба 10\Записная книжка\notebook.dat');
  {$I-} Reset(f); {$I+}
   if ioresult = 0 then
   begin
    seek(f,FileSize(f));
   end
   else
   begin
    rewrite(f);
    isOpened := true;
   end;
  z.fam := edit1.text;
  z.name := edit2.text;
  z.phone := edit3.text;
  z.adr := edit4.text;
  edit1.clear;
  edit2.clear;
  edit3.clear;
  edit4.clear;
  write(f,z);
  edit1.setfocus;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if isOpened then closefile(f);
  self.hide;
end;

end.
