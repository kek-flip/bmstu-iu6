unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    ImageTriangle: TImage;
    ImagePyramid: TImage;
    ImagePrism: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses Figures;

{$R *.dfm}

var tr : triangle;
    pr : pyramid;
    prs : prism;
    t : real;

procedure TForm1.FormCreate(Sender: TObject);
begin
  tr := triangle.create(150, 50, 150, 300, ImageTriangle);
  tr.draw;

  pr := pyramid.create(180, 50, 180, 300, ImagePyramid);
  pr.draw;

  prs := prism.create(170, 50, 170, 300, ImagePrism);
  prs.draw;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  t := 0.1 * Spinedit1.Value;
  Timer1.Enabled := true;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  t := 0.1 * Spinedit1.Value;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  tr.move(t);
  pr.move(t);
  prs.move(t);
end;

initialization

finalization
  tr.free;
  pr.free;
  prs.free;
end.
