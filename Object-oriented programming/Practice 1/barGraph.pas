unit barGraph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TBarGraphForm = class(TForm)
    BarGraph: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormHide(Sender: TObject);
  private

  public
    procedure Draw(RoomPerCat, cats : TStringList);
  end;

var
  barGraphForm: TbarGraphForm;

implementation

{$R *.dfm}

procedure TBarGraphForm.Draw(RoomPerCat: TStringList; cats: TStringList);
var max, x, y1, y2, h, i, n : integer;
    m :real;
begin
  max := -1;
  n := cats.Count;
  for i := 0 to n - 1 do
    if (StrToInt(RoomPerCat.Values[cats[i]]) > max) then
      max := StrToInt(RoomPerCat.Values[cats[i]]);
  h:= round(BarGraph.Width/(2 * n + 1));
  m:= (BarGraph.Height - 20) / max;
  x:= h;

  BarGraph.Canvas.Brush.Color := clBlue;
  y1 := BarGraph.Height - 20;
  BarGraph.Canvas.Font.Color := clBlack;
  Label1.Caption := IntToStr(max) + '-';
  Label3.Caption := IntToStr(round(max / 2)) + '-';
  Label2.Caption := '0-';
  for i := 0 to n - 1 do
  begin
    y2 := y1 - round(StrToInt(RoomPerCat.Values[cats[i]]) * m);
    BarGraph.Canvas.Rectangle(x, y1, x+h, y2);
    BarGraph.Canvas.Brush.Style := bsClear;
    BarGraph.Canvas.TextOut(x, y1, cats[i]);
    BarGraph.Canvas.Brush.Style := bsSolid;
    BarGraph.Canvas.Brush.Color := clBlue;
    x := x + 2 * h;
  end;
end;

procedure TBarGraphForm.FormHide(Sender: TObject);
begin
  BarGraph.Picture := nil;
end;

end.
