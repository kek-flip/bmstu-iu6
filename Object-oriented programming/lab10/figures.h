#ifndef FIGURES_H
#define FIGURES_H

#include <cmath>
#include <QPoint>
#include <QList>
#include <QGraphicsScene>
#include <QPen>
#include <QPainterPath>

typedef struct point {
    int x;
    int y;
    int z;
} point;

class figure {
public:
    figure() = default;
    virtual void rotate(double, double, double) = 0;
    virtual void draw(QGraphicsScene *scene, QPen *pen) = 0;
    virtual ~figure() = default;
};

class prism : public figure {
    point a1, b1, c1, a2, b2, c2;
public:
    prism(point a, point b, point c, int h);
    void rotate(double, double, double) override;
    QList<QPoint> getPointsToDraw();
    void draw(QGraphicsScene *scene, QPen *pen) override;
    void xRotate(double);
    void yRotate(double);
    void zRotate(double);
    ~prism() = default;
};

class cylinder : public figure {
    point o1, a1, b1, c1, d1, o2, a2, b2, c2, d2;
public:
    cylinder(point o, int r, int h);
    void rotate(double, double, double) override;
    void draw(QGraphicsScene *scene, QPen *pen) override;
    void xRotate(double);
    void yRotate(double);
    void zRotate(double);
    ~cylinder() = default;
};

#endif // FIGURES_H
