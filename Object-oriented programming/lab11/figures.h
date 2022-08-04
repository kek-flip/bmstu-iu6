#ifndef FIGURES_H
#define FIGURES_H

#include <cmath>
#include <QPoint>
#include <QList>
#include <QGraphicsScene>
#include <QPen>
#include <QPainterPath>
#include <QGraphicsItem>
#include <QGraphicsSceneMouseEvent>
#include <QPainter>

typedef struct point {
    int x;
    int y;
    int z;
} point;

class figure : public QObject, public QGraphicsItem{
public:
    figure() = default;
    virtual void rotate(double, double, double) = 0;
    virtual QList<point*> getPoints() = 0;
    virtual QString strToFile() = 0;
    virtual ~figure() = default;
};

class prism : public figure {
private:
    point a1, b1, c1, a2, b2, c2;
    QPointF *pos;
    QList<QPoint> getPointsToDraw();
    QList<point*> getPoints() override;

    void xRotate(double);
    void yRotate(double);
    void zRotate(double);
public:
    prism(point a, point b, point c, int h);
    void rotate(double, double, double) override;

    void mouseMoveEvent(QGraphicsSceneMouseEvent *event) override;
    void mouseReleaseEvent(QGraphicsSceneMouseEvent *event) override;
    void mousePressEvent(QGraphicsSceneMouseEvent *event) override;

    QRectF boundingRect() const override;
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget) override;

    QString strToFile() override;

    ~prism() = default;
};

class cylinder : public figure {
    point o1, a1, b1, c1, d1, o2, a2, b2, c2, d2;
    QPointF *pos;
    QList<point*> getPoints() override;
public:
    cylinder(point o, int r, int h);
    void rotate(double, double, double) override;

    void mouseMoveEvent(QGraphicsSceneMouseEvent *event) override;
    void mouseReleaseEvent(QGraphicsSceneMouseEvent *event) override;
    void mousePressEvent(QGraphicsSceneMouseEvent *event) override;

    QRectF boundingRect() const override;
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget) override;

    QString strToFile() override;

    void xRotate(double);
    void yRotate(double);
    void zRotate(double);
    ~cylinder() = default;
};

#endif // FIGURES_H
