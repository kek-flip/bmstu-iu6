unit Figures;

interface

Uses graphics, ExtCtrls, System.Types;


type figure = class(TObject)
  procedure move(t : real); virtual; abstract;
  procedure draw; virtual; abstract;
  procedure clear; virtual; abstract;
end;


type triangle = class(figure)
  A, B, C : TPoint;
  side, ang : real;
  image : TImage;
public
  constructor create(ax1, ay1, ax2, ay2 : integer; aimage : TImage);
  procedure move(t : real); override;
  procedure draw; override;
  procedure clear; override;
end;


type pyramid = class(figure)
  S, A, B, C : TPoint;
  r, angA, angB, angC : real;
  image : TImage;
  //flag : Integer;

public
  constructor create(ax1, ay1, ax2, ay2 : integer; aimage : TImage);
  procedure move(t : real); override;
  procedure draw; override;
  procedure clear; override;
end;


type prism = class(figure)
  A1, B1, C1, A2, B2, C2 : TPoint;
  r, angA, angB, angC : real;
  image : TImage;
  midX : integer;
public
  constructor create(ax1, ay1, ax2, ay2 : integer; aimage : TImage);
  procedure move(t : real); override;
  procedure draw; override;
  procedure clear; override;
end;

implementation
  constructor triangle.create;
  begin
    side := (ay2 - ay1) * 2 / sqrt(3);

    A.X := ax1;
    A.Y := ay1;

    B.X := ax2 - round(side / 2);
    B.Y := ay2;

    C.X := ax2 + round(side / 2);
    C.Y := ay2;

    ang := 0;

    image := aimage;
  end;


  procedure triangle.draw;
  begin
    image.Canvas.Pen.Color := clBlack;
    image.Canvas.Polygon([A, B, C]);

    if (cos(ang) > 0) then
    begin
      image.Canvas.Brush.Color := clRed;
      image.Canvas.FloodFill(A.X, B.Y - 1, clBlack, fsBorder);
    end
    else if (cos(ang) < 0) then
    begin
      image.Canvas.Brush.Color := clGreen;
      image.Canvas.FloodFill(A.X, B.Y - 1, clBlack, fsBorder);
    end;
  end;


  procedure triangle.clear;
  begin
    image.Canvas.Brush.Color := clWhite;
    image.Canvas.FloodFill(A.X, B.Y - 1, clBlack, fsBorder);

    image.Canvas.Pen.Color := clWhite;
    image.Canvas.Polygon([A, B, C]);
  end;


  procedure triangle.move;
  var dx : integer;
  begin
    clear;

    ang := ang + 0.2 * t;
    dx := round(side / 2 * cos(ang));
    B.X := A.X + dx;
    C.X := A.X - dx;

    draw;
  end;

//==========================================================================
  constructor pyramid.create(ax1: Integer; ay1: Integer; ax2: Integer; ay2: Integer; aimage: TImage);
  var side : real;
  begin
    S.X := ax1;
    S.Y := ay1;

    C.X := ax2;
    C.Y := ay2;

    side := 3 * (ay2 - ay1) / sqrt(6);

    A.X := ax2 - round(side / 2);
    A.Y := ay2;

    B.X := ax2 + round(side / 2);
    B.Y := ay2;

    angA := (Pi * 7) / 6;
    angB := (Pi * 11) / 6;
    angC := Pi / 2;

    r := (ay2 - ay1) / sqrt(2);

    image := aimage;
  end;


  procedure pyramid.draw;
  begin
    image.Canvas.Pen.Color := clBlack;

    //begin
    {if (flag = 0) then
    begin
    image.Canvas.Polygon([S, A, B]);
    image.Canvas.Polygon([S, C, A]);
    image.Canvas.Polygon([S, B, C]);
    end;

    if (flag = 1) then
    begin
    image.Canvas.Polygon([S, C, A]);
    image.Canvas.Polygon([S, B, C]);
    image.Canvas.Polygon([S, A, B]);
    end;

    if (flag = 2) then
    begin
    image.Canvas.Polygon([S, B, C]);
    image.Canvas.Polygon([S, A, B]);
    image.Canvas.Polygon([S, C, A]);
    end; }

    //end
    image.Canvas.MoveTo(S.X, S.Y);

    image.Canvas.LineTo(A.X, A.Y);
    image.Canvas.LineTo(B.X, B.Y);
    image.Canvas.LineTo(S.X, S.Y);

    image.Canvas.LineTo(C.X, C.Y);
    image.Canvas.LineTo(A.X, A.Y);
    image.Canvas.LineTo(C.X, C.Y);
    image.Canvas.LineTo(B.X, B.Y);


  end;


  procedure pyramid.clear;
  begin
    image.Canvas.Pen.Color := clWhite;

    image.Canvas.MoveTo(S.X, S.Y);

    image.Canvas.LineTo(A.X, A.Y);
    image.Canvas.LineTo(B.X, B.Y);
    image.Canvas.LineTo(S.X, S.Y);

    image.Canvas.LineTo(C.X, C.Y);
    image.Canvas.LineTo(A.X, A.Y);
    image.Canvas.LineTo(C.X, C.Y);
    image.Canvas.LineTo(B.X, B.Y);
  end;

  procedure pyramid.move(t: Real);
  var dxA, dxB, dxC : integer;
  begin
    clear;

    angA := angA + 0.2 * t;
    angB := angB + 0.2 * t;
    angC := angC + 0.2 * t;

    dxA := round(cos(angA) * r);
    dxB := round(cos(angB) * r);
    dxC := round(cos(angC) * r);

    A.X := S.X + dxA;
    B.X := S.X + dxB;
    C.X := S.X + dxC;

    //if(B.X > C.X) then flag := 0;
    //if(A.X > B.X) then flag := 1;
    //if(C.X > A.X) then flag := 2;

    draw;
  end;

//==================================================================
  constructor prism.create(ax1: Integer; ay1: Integer; ax2: Integer; ay2: Integer; aimage: TImage);
  var side : real;
  begin
    side := ay2 - ay1;

    C1.X := ax1;
    C1.Y := ay1;

    A1.X := ax1 - round(side / 2);
    A1.Y := ay1;

    B1.X := ax1 + round(side / 2);
    B1.Y := ay1;

    C2.X := ax2;
    C2.Y := ay2;

    A2.X := ax2 - round(side / 2);
    A2.Y := ay2;

    B2.X := ax2 + round(side / 2);
    B2.Y := ay2;

    r := side / sqrt(3);

    angA := (Pi * 7) / 6;
    angB := (Pi * 11) / 6;
    angC := Pi / 2;

    image := aimage;

    midX := ax2;
  end;


  procedure prism.draw;
  begin
    image.Canvas.Pen.Color := clBlack;

    image.Canvas.Polygon([A1, B1, C1]);
    image.Canvas.Polygon([A2, B2, C2]);

    image.Canvas.MoveTo(A1.X, A1.Y);
    image.Canvas.LineTo(A2.X, A2.Y);

    image.Canvas.MoveTo(B1.X, B1.Y);
    image.Canvas.LineTo(B2.X, B2.Y);

    image.Canvas.MoveTo(C1.X, C1.Y);
    image.Canvas.LineTo(C2.X, C2.Y);
  end;


  procedure prism.clear;
  begin
    image.Canvas.Pen.Color := clWhite;

    image.Canvas.Polygon([A1, B1, C1]);
    image.Canvas.Polygon([A2, B2, C2]);

    image.Canvas.MoveTo(A1.X, A1.Y);
    image.Canvas.LineTo(A2.X, A2.Y);

    image.Canvas.MoveTo(B1.X, B1.Y);
    image.Canvas.LineTo(B2.X, B2.Y);

    image.Canvas.MoveTo(C1.X, C1.Y);
    image.Canvas.LineTo(C2.X, C2.Y);
  end;


  procedure prism.move(t: Real);
  var dxA, dxB, dxC : integer;
  begin
    clear;

    angA := angA + 0.2 * t;
    angB := angB + 0.2 * t;
    angC := angC + 0.2 * t;

    dxA := round(cos(angA) * r);
    dxB := round(cos(angB) * r);
    dxC := round(cos(angC) * r);

    A1.X := midX + dxA;
    B1.X := midX + dxB;
    C1.X := midX + dxC;

    A2.X := midX + dxA;
    B2.X := midX + dxB;
    C2.X := midX + dxC;

    draw;
  end;

end.
