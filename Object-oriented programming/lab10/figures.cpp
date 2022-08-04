#include "figures.h"

prism::prism(point a, point b, point c, int h) : figure() {
    a1 = a;
    b1 = b;
    c1 = c;

    a2 = a;
    a2.z = a.z + h;
    b2 = b;
    b2.z = b.z + h;
    c2 = c;
    c2.z = c.z + h;
}

QList<QPoint> prism::getPointsToDraw() {
    QList<QPoint> points;
    points.append(QPoint(a1.x, a1.y));
    points.append(QPoint(b1.x, b1.y));
    points.append(QPoint(c1.x, c1.y));
    points.append(QPoint(a1.x, a1.y));
    points.append(QPoint(a2.x, a2.y));
    points.append(QPoint(b2.x, b2.y));
    points.append(QPoint(b1.x, b1.y));
    points.append(QPoint(b2.x, b2.y));
    points.append(QPoint(c2.x, c2.y));
    points.append(QPoint(c1.x, c1.y));
    points.append(QPoint(c2.x, c2.y));
    points.append(QPoint(a2.x, a2.y));
    return points;
}

void prism::draw(QGraphicsScene *scene, QPen *pen) {
    QList<QPoint> points = getPointsToDraw();
    QPainterPath path;
    path.moveTo(QPointF(points[0]));
    for(int i = 1; i < points.size(); i++) {
        path.lineTo(QPointF(points[i]));
    }
    scene->addPath(path, *pen);
}

void prism::rotate(double xAngle, double yAngle, double zAngle) {
    xRotate(xAngle);
    yRotate(yAngle);
    zRotate(zAngle);
}

void prism::xRotate(double angle) {
    double cos_ang = cos(angle * M_PI / 180);
    double sin_ang = sin(angle * M_PI / 180);

    point tmp_a1 = a1;
    tmp_a1.y = round(a1.y * cos_ang + a1.z * sin_ang);
    tmp_a1.z = round(-a1.y * sin_ang + a1.z * cos_ang);
    a1 = tmp_a1;

    point tmp_b1 = b1;
    tmp_b1.y = round(b1.y * cos_ang + b1.z * sin_ang);
    tmp_b1.z = round(-b1.y * sin_ang + b1.z * cos_ang);
    b1 = tmp_b1;

    point tmp_c1 = c1;
    tmp_c1.y = round(c1.y * cos_ang + c1.z * sin_ang);
    tmp_c1.z = round(-c1.y * sin_ang + c1.z * cos_ang);
    c1 = tmp_c1;

    point tmp_a2 = a2; 
    tmp_a2.y = round(a2.y * cos_ang + a2.z * sin_ang);
    tmp_a2.z = round(-a2.y * sin_ang + a2.z * cos_ang);
    a2 = tmp_a2;

    point tmp_b2 = b2;
    tmp_b2.y = round(b2.y * cos_ang + b2.z * sin_ang);
    tmp_b2.z = round(-b2.y * sin_ang + b2.z * cos_ang);
    b2 = tmp_b2;

    point tmp_c2 = c2;
    tmp_c2.y = round(c2.y * cos_ang + c2.z * sin_ang);
    tmp_c2.z = round(-c2.y * sin_ang + c2.z * cos_ang);
    c2 = tmp_c2;
}

void prism::yRotate(double angle) {
    double cos_ang = cos(angle * M_PI / 180);
    double sin_ang = sin(angle * M_PI / 180);

    point tmp_a1 = a1;
    tmp_a1.x = round(a1.x * cos_ang - a1.z * sin_ang);
    tmp_a1.z = round(a1.x * sin_ang + a1.z * cos_ang);
    a1 = tmp_a1;

    point tmp_b1 = b1;
    tmp_b1.x = round(b1.x * cos_ang - b1.z * sin_ang);
    tmp_b1.z = round(b1.x * sin_ang + b1.z * cos_ang);
    b1 = tmp_b1;

    point tmp_c1 = c1;
    tmp_c1.x = round(c1.x * cos_ang - c1.z * sin_ang);
    tmp_c1.z = round(c1.x * sin_ang + c1.z * cos_ang);
    c1 = tmp_c1;

    point tmp_a2 = a2;
    tmp_a2.x = round(a2.x * cos_ang - a2.z * sin_ang);
    tmp_a2.z = round(a2.x * sin_ang + a2.z * cos_ang);
    a2 = tmp_a2;

    point tmp_b2 = b2;
    tmp_b2.x = round(b2.x * cos_ang - b2.z * sin_ang);
    tmp_b2.z = round(b2.x * sin_ang + b2.z * cos_ang);
    b2 = tmp_b2;

    point tmp_c2 = c2;
    tmp_c2.x = round(c2.x * cos_ang - c2.z * sin_ang);
    tmp_c2.z = round(c2.x * sin_ang + c2.z * cos_ang);
    c2 = tmp_c2;
}

void prism::zRotate(double angle) {
    double cos_ang = cos(angle * M_PI / 180);
    double sin_ang = sin(angle * M_PI / 180);

    point tmp_a1 = a1;
    tmp_a1.x = round(a1.x * cos_ang + a1.y * sin_ang);
    tmp_a1.y = round(-a1.x * sin_ang + a1.y * cos_ang);
    a1 = tmp_a1;

    point tmp_b1 = b1;
    tmp_b1.x = round(b1.x * cos_ang + b1.y * sin_ang);
    tmp_b1.y = round(-b1.x * sin_ang + b1.y * cos_ang);
    b1 = tmp_b1;

    point tmp_c1 = c1;
    tmp_c1.x = round(c1.x * cos_ang + c1.y * sin_ang);
    tmp_c1.y = round(-c1.x * sin_ang + c1.y * cos_ang);
    c1 = tmp_c1;

    point tmp_a2 = a2;
    tmp_a2.x = round(a2.x * cos_ang + a2.y * sin_ang);
    tmp_a2.y = round(-a2.x * sin_ang + a2.y * cos_ang);
    a2 = tmp_a2;

    point tmp_b2 = b2;
    tmp_b2.x = round(b2.x * cos_ang + b2.y * sin_ang);
    tmp_b2.y = round(-b2.x * sin_ang + b2.y * cos_ang);
    b2 = tmp_b2;

    point tmp_c2 = c2;
    tmp_c2.x = round(c2.x * cos_ang + c2.y * sin_ang);
    tmp_c2.y = round(-c2.x * sin_ang + c2.y * cos_ang);
    c2 = tmp_c2;
}

cylinder::cylinder(point o, int r, int h){
    o1 = o;

    a1 = o;
    a1.y -= r;

    b1 = o;
    b1.x += r;

    c1 = o;
    c1.y += r;

    d1 = o;
    d1.x -=r;

    o2 = o;
    o2.z += h;

    a2 = o;
    a2.y -= r;
    a2.z += h;

    b2 = o;
    b2.x += r;
    b2.z += h;

    c2 = o;
    c2.y += r;
    c2.z += h;

    d2 = o;
    d2.x -=r;
    d2.z += h;
}

void cylinder::rotate(double xAngle, double yAngle, double zAngle) {
    xRotate(xAngle);
    yRotate(yAngle);
    zRotate(zAngle);
}

void cylinder::draw(QGraphicsScene *scene, QPen *pen) {
    scene->addLine(a1.x, a1.y, a2.x, a2.y, *pen);
    scene->addLine(b1.x, b1.y, b2.x, b2.y, *pen);
    scene->addLine(c1.x, c1.y, c2.x, c2.y, *pen);
    scene->addLine(d1.x, d1.y, d2.x, d2.y, *pen);

    scene->addEllipse(QRectF(a1.x - (b1.x - d1.x) / 2, d1.y - (c1.y - a1.y) / 2, b1.x - d1.x, c1.y - a1.y), *pen);
    scene->addEllipse(QRectF(a2.x - (b2.x - d2.x) / 2, d2.y - (c2.y - a2.y) / 2, b2.x - d2.x, c2.y - a2.y), *pen);
}

void cylinder::xRotate(double angle) {
    double cos_ang = cos(angle * M_PI / 180);
    double sin_ang = sin(angle * M_PI / 180);

    point tmp_o1 = o1;
    tmp_o1.y = round(o1.y * cos_ang + o1.z * sin_ang);
    tmp_o1.z = round(-o1.y * sin_ang + o1.z * cos_ang);
    o1 = tmp_o1;

    point tmp_a1 = a1;
    tmp_a1.y = round(a1.y * cos_ang + a1.z * sin_ang);
    tmp_a1.z = round(-a1.y * sin_ang + a1.z * cos_ang);
    a1 = tmp_a1;

    point tmp_b1 = b1;
    tmp_b1.y = round(b1.y * cos_ang + b1.z * sin_ang);
    tmp_b1.z = round(-b1.y * sin_ang + b1.z * cos_ang);
    b1 = tmp_b1;

    point tmp_c1 = c1;
    tmp_c1.y = round(c1.y * cos_ang + c1.z * sin_ang);
    tmp_c1.z = round(-c1.y * sin_ang + c1.z * cos_ang);
    c1 = tmp_c1;

    point tmp_d1 = d1;
    tmp_d1.y = round(d1.y * cos_ang + d1.z * sin_ang);
    tmp_d1.z = round(-d1.y * sin_ang + d1.z * cos_ang);
    d1 = tmp_d1;

    point tmp_o2 = o2;
    tmp_o2.y = round(o1.y * cos_ang + o1.z * sin_ang);
    tmp_o2.z = round(-o1.y * sin_ang + o1.z * cos_ang);
    o2 = tmp_o2;

    point tmp_a2 = a2;
    tmp_a2.y = round(a2.y * cos_ang + a2.z * sin_ang);
    tmp_a2.z = round(-a2.y * sin_ang + a2.z * cos_ang);
    a2 = tmp_a2;

    point tmp_b2 = b2;
    tmp_b2.y = round(b2.y * cos_ang + b2.z * sin_ang);
    tmp_b2.z = round(-b2.y * sin_ang + b2.z * cos_ang);
    b2 = tmp_b2;

    point tmp_c2 = c2;
    tmp_c2.y = round(c2.y * cos_ang + c2.z * sin_ang);
    tmp_c2.z = round(-c2.y * sin_ang + c2.z * cos_ang);
    c2 = tmp_c2;

    point tmp_d2 = d2;
    tmp_d2.y = round(d2.y * cos_ang + d2.z * sin_ang);
    tmp_d2.z = round(-d2.y * sin_ang + d2.z * cos_ang);
    d2 = tmp_d2;
}

void cylinder::yRotate(double angle) {
    double cos_ang = cos(angle * M_PI / 180);
    double sin_ang = sin(angle * M_PI / 180);

    point tmp_o1 = o1;
    tmp_o1.x = round(o1.x * cos_ang - o1.z * sin_ang);
    tmp_o1.z = round(o1.x * sin_ang + o1.z * cos_ang);
    o1 = tmp_o1;

    point tmp_a1 = a1;
    tmp_a1.x = round(a1.x * cos_ang - a1.z * sin_ang);
    tmp_a1.z = round(a1.x * sin_ang + a1.z * cos_ang);
    a1 = tmp_a1;

    point tmp_b1 = b1;
    tmp_b1.x = round(b1.x * cos_ang - b1.z * sin_ang);
    tmp_b1.z = round(b1.x * sin_ang + b1.z * cos_ang);
    b1 = tmp_b1;

    point tmp_c1 = c1;
    tmp_c1.x = round(c1.x * cos_ang - c1.z * sin_ang);
    tmp_c1.z = round(c1.x * sin_ang + c1.z * cos_ang);
    c1 = tmp_c1;

    point tmp_d1 = d1;
    tmp_d1.x = round(d1.x * cos_ang - d1.z * sin_ang);
    tmp_d1.z = round(d1.x * sin_ang + d1.z * cos_ang);
    d1 = tmp_d1;

    point tmp_o2 = o2;
    tmp_o2.x = round(o1.x * cos_ang - o1.z * sin_ang);
    tmp_o2.z = round(o1.x * sin_ang + o1.z * cos_ang);
    o2 = tmp_o2;

    point tmp_a2 = a2;
    tmp_a2.x = round(a2.x * cos_ang - a2.z * sin_ang);
    tmp_a2.z = round(a2.x * sin_ang + a2.z * cos_ang);
    a2 = tmp_a2;

    point tmp_b2 = b2;
    tmp_b2.x = round(b2.x * cos_ang - b2.z * sin_ang);
    tmp_b2.z = round(b2.x * sin_ang + b2.z * cos_ang);
    b2 = tmp_b2;

    point tmp_c2 = c2;
    tmp_c2.x = round(c2.x * cos_ang - c2.z * sin_ang);
    tmp_c2.z = round(c2.x * sin_ang + c2.z * cos_ang);
    c2 = tmp_c2;

    point tmp_d2 = d2;
    tmp_d2.x = round(d2.x * cos_ang - d2.z * sin_ang);
    tmp_d2.z = round(d2.x * sin_ang + d2.z * cos_ang);
    d2 = tmp_d2;
}


void cylinder::zRotate(double angle) {
    double cos_ang = cos(angle * M_PI / 180);
    double sin_ang = sin(angle * M_PI / 180);

    point tmp_o1 = o1;
    tmp_o1.x = round(o1.x * cos_ang + o1.y * sin_ang);
    tmp_o1.y = round(-o1.x * sin_ang + o1.y * cos_ang);
    o1 = tmp_o1;

    point tmp_a1 = a1;
    tmp_a1.x = round(a1.x * cos_ang + a1.y * sin_ang);
    tmp_a1.y = round(-a1.x * sin_ang + a1.y * cos_ang);
    a1 = tmp_a1;

    point tmp_b1 = b1;
    tmp_b1.x = round(b1.x * cos_ang + b1.y * sin_ang);
    tmp_b1.y = round(-b1.x * sin_ang + b1.y * cos_ang);
    b1 = tmp_b1;

    point tmp_c1 = c1;
    tmp_c1.x = round(c1.x * cos_ang + c1.y * sin_ang);
    tmp_c1.y = round(-c1.x * sin_ang + c1.y * cos_ang);
    c1 = tmp_c1;

    point tmp_d1 = d1;
    tmp_d1.x = round(d1.x * cos_ang + d1.y * sin_ang);
    tmp_d1.y = round(-d1.x * sin_ang + d1.y * cos_ang);
    d1 = tmp_d1;

    point tmp_o2 = o2;
    tmp_o2.x = round(o1.x * cos_ang + o1.y * sin_ang);
    tmp_o2.y = round(-o1.x * sin_ang + o1.y * cos_ang);
    o2 = tmp_o2;

    point tmp_a2 = a2;
    tmp_a2.x = round(a2.x * cos_ang + a2.y * sin_ang);
    tmp_a2.y = round(-a2.x * sin_ang + a2.y * cos_ang);
    a2 = tmp_a2;

    point tmp_b2 = b2;
    tmp_b2.x = round(b2.x * cos_ang + b2.y * sin_ang);
    tmp_b2.y = round(-b2.x * sin_ang + b2.y * cos_ang);
    b2 = tmp_b2;

    point tmp_c2 = c2;
    tmp_c2.x = round(c2.x * cos_ang + c2.y * sin_ang);
    tmp_c2.y = round(-c2.x * sin_ang + c2.y * cos_ang);
    c2 = tmp_c2;

    point tmp_d2 = d2;
    tmp_d2.x = round(d2.x * cos_ang + d2.y * sin_ang);
    tmp_d2.y = round(-d2.x * sin_ang + d2.y * cos_ang);
    d2 = tmp_d2;
}


