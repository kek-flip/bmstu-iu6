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

QList<point*> prism::getPoints() {
    QList<point*> points;
    points.append(&a1);
    points.append(&b1);
    points.append(&c1);
    points.append(&a2);
    points.append(&b2);
    points.append(&c2);
    return points;
}

QString prism::strToFile() {
    QString str;
    str += "1 ";

    str += QString::number(a1.x);
    str += " ";
    str += QString::number(a1.y);
    str += " ";

    str += QString::number(b1.x);
    str += " ";
    str += QString::number(b1.y);
    str += " ";

    str += QString::number(c1.x);
    str += " ";
    str += QString::number(c1.y);
    str += " ";

    str += QString::number(abs(a2.z - a1.z));

    return str;
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

void prism::mousePressEvent(QGraphicsSceneMouseEvent *event){
    Q_UNUSED(event);

    pos = new QPointF(scenePos());
}

void prism::mouseMoveEvent(QGraphicsSceneMouseEvent *event) {
    this->setPos(mapToScene(event->pos()));
}

void prism::mouseReleaseEvent(QGraphicsSceneMouseEvent *event) {
    QPointF movement = mapToScene(event->pos() - *pos);
    QList<point*> points = getPoints();
    for(int i = 0; i < points.size(); i++) {
        points[i]->x += int(movement.x());
        points[i]->y += int(movement.y());
    }
    delete pos;
}

QRectF prism::boundingRect() const {
    // Прости меня господь бог за этот метод
    int x_max = a1.x, y_max = a1.y, x_min = a1.x, y_min = a1.y;
    if (a1.x > x_max) {
        x_max = a1.x;
    }
    if (a1.y > y_max) {
        y_max = a1.y;
    }
    if (a1.x < x_min) {
        x_min = a1.x;
    }
    if (a1.y < y_min) {
        y_min = a1.y;
    }

    if (b1.x > x_max) {
        x_max = b1.x;
    }
    if (b1.y > y_max) {
        y_max = b1.y;
    }
    if (b1.x < x_min) {
        x_min = b1.x;
    }
    if (b1.y < y_min) {
        y_min = b1.y;
    }

    if (c1.x > x_max) {
        x_max = c1.x;
    }
    if (c1.y > y_max) {
        y_max = c1.y;
    }
    if (c1.x < x_min) {
        x_min = c1.x;
    }
    if (c1.y < y_min) {
        y_min = c1.y;
    }

    if (a2.x > x_max) {
        x_max = a2.x;
    }
    if (a2.y > y_max) {
        y_max = a2.y;
    }
    if (a2.x < x_min) {
        x_min = a2.x;
    }
    if (a2.y < y_min) {
        y_min = a2.y;
    }

    if (b2.x > x_max) {
        x_max = b2.x;
    }
    if (b2.y > y_max) {
        y_max = b2.y;
    }
    if (b2.x < x_min) {
        x_min = b2.x;
    }
    if (b2.y < y_min) {
        y_min = b2.y;
    }

    if (c2.x > x_max) {
        x_max = c2.x;
    }
    if (c2.y > y_max) {
        y_max = c2.y;
    }
    if (c2.x < x_min) {
        x_min = c2.x;
    }
    if (c2.y < y_min) {
        y_min = c2.y;
    }

    return QRectF(x_min, y_min, (x_max - x_min), (y_max - y_min));
}

void prism::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget) {

    Q_UNUSED(option);
    Q_UNUSED(widget);

    QList<QPoint> points = getPointsToDraw();
    QPainterPath path;
    path.moveTo(QPointF(points[0]));
    for(int i = 1; i < points.size(); i++) {
        path.lineTo(QPointF(points[i]));
    }
    painter->drawPath(path);
}

void prism::rotate(double xAngle, double yAngle, double zAngle) {
    xRotate(xAngle);
    yRotate(yAngle);
    zRotate(zAngle);
}

void prism::xRotate(double angle) {
    double cos_ang = cos(angle * M_PI / 180);
    double sin_ang = sin(angle * M_PI / 180);

    QList<point*> points = getPoints();

    for(int i = 0; i < points.size(); i++) {
        point tmp = *points[i];
        tmp.y = round(points[i]->y * cos_ang + points[i]->z * sin_ang);
        tmp.z = round(-points[i]->y * sin_ang + points[i]->z * cos_ang);
        *points[i] = tmp;
    }
}

void prism::yRotate(double angle) {
    double cos_ang = cos(angle * M_PI / 180);
    double sin_ang = sin(angle * M_PI / 180);

    QList<point*> points = getPoints();

    for(int i = 0; i < points.size(); i++) {
        point tmp = *points[i];
        tmp.x = round(points[i]->x* cos_ang - points[i]->z * sin_ang);
        tmp.z = round(points[i]->x * sin_ang + points[i]->z * cos_ang);
        *points[i] = tmp;
    }
}

void prism::zRotate(double angle) {
    double cos_ang = cos(angle * M_PI / 180);
    double sin_ang = sin(angle * M_PI / 180);

    QList<point*> points = getPoints();

    for(int i = 0; i < points.size(); i++) {
        point tmp = *points[i];
        tmp.x = round(points[i]->x * cos_ang + points[i]->y * sin_ang);
        tmp.y = round(-points[i]->x * sin_ang + points[i]->y * cos_ang);
        *points[i] = tmp;
    }
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

QString cylinder::strToFile() {
    QString str;
    str += "2 ";

    str += QString::number(o1.x);
    str += " ";
    str += QString::number(o1.y);
    str += " ";

    str += QString::number(abs(a1.z - o1.z));
    str += " ";

    str += QString::number(abs(o2.z - o1.z));

    return str;
}

QList<point*> cylinder::getPoints() {
    QList<point*> points;

    points.append(&o1);
    points.append(&a1);
    points.append(&b1);
    points.append(&c1);
    points.append(&d1);

    points.append(&o2);
    points.append(&a2);
    points.append(&b2);
    points.append(&c2);
    points.append(&d2);

    return points;
}

QRectF cylinder::boundingRect() const {
    return QRectF(d1.x, a1.y, (b1.x - d1.x), (c1.y - a1.y));
}

void cylinder::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget) {

    Q_UNUSED(option);
    Q_UNUSED(widget);

    painter->drawLine(a1.x, a1.y, a2.x, a2.y);
    painter->drawLine(b1.x, b1.y, b2.x, b2.y);
    painter->drawLine(c1.x, c1.y, c2.x, c2.y);
    painter->drawLine(d1.x, d1.y, d2.x, d2.y);

    painter->drawEllipse(QRectF(a1.x - (b1.x - d1.x) / 2, d1.y - (c1.y - a1.y) / 2, b1.x - d1.x, c1.y - a1.y));
    painter->drawEllipse(QRectF(a2.x - (b2.x - d2.x) / 2, d2.y - (c2.y - a2.y) / 2, b2.x - d2.x, c2.y - a2.y));
}

void cylinder::mousePressEvent(QGraphicsSceneMouseEvent *event){
    Q_UNUSED(event);

    pos = new QPointF(scenePos());
}

void cylinder::mouseMoveEvent(QGraphicsSceneMouseEvent *event) {
    this->setPos(mapToScene(event->pos()));
}

void cylinder::mouseReleaseEvent(QGraphicsSceneMouseEvent *event) {
    QPointF movement = mapToScene(event->pos() - *pos);
    QList<point*> points = getPoints();
    for(int i = 0; i < points.size(); i++) {
        points[i]->x += int(movement.x());
        points[i]->y += int(movement.y());
    }
    delete pos;
}

void cylinder::rotate(double xAngle, double yAngle, double zAngle) {
    xRotate(xAngle);
    yRotate(yAngle);
    zRotate(zAngle);
}

void cylinder::xRotate(double angle) {
    double cos_ang = cos(angle * M_PI / 180);
    double sin_ang = sin(angle * M_PI / 180);

    QList<point*> points = getPoints();

    for(int i = 0; i < points.size(); i++) {
        point tmp = *points[i];
        tmp.y = round(points[i]->y * cos_ang + points[i]->z * sin_ang);
        tmp.z = round(-points[i]->y * sin_ang + points[i]->z * cos_ang);
        *points[i] = tmp;
    }
}

void cylinder::yRotate(double angle) {
    double cos_ang = cos(angle * M_PI / 180);
    double sin_ang = sin(angle * M_PI / 180);

    QList<point*> points = getPoints();

    for(int i = 0; i < points.size(); i++) {
        point tmp = *points[i];
        tmp.x = round(points[i]->x* cos_ang - points[i]->z * sin_ang);
        tmp.z = round(points[i]->x * sin_ang + points[i]->z * cos_ang);
        *points[i] = tmp;
    }
}


void cylinder::zRotate(double angle) {
    double cos_ang = cos(angle * M_PI / 180);
    double sin_ang = sin(angle * M_PI / 180);

    QList<point*> points = getPoints();

    for(int i = 0; i < points.size(); i++) {
        point tmp = *points[i];
        tmp.x = round(points[i]->x * cos_ang + points[i]->y * sin_ang);
        tmp.y = round(-points[i]->x * sin_ang + points[i]->y * cos_ang);
        *points[i] = tmp;
    }
}


